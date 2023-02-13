-- a) Cuales son los top 10 vendedores del Q3 2022 por país a través del monto de la venta total. Agregar su segmento también.
WITH CTE AS (
SELECT ws_ordenes."VENDEDOR_ID", ws_ordenes."PAIS", SUM("MONTO_VENTA") AS "MONTO_TOTAL", "SEGMENTO",
ROW_NUMBER() OVER (PARTITION BY ws_ordenes."PAIS" ORDER BY SUM("MONTO_VENTA") DESC) AS "Ranking"
FROM shipping_sales_bi.ws_ordenes
LEFT JOIN shipping_sales_bi."WS_SEGMENTOS_VENDEDORES" ON "WS_SEGMENTOS_VENDEDORES"."VENDEDOR_ID" = ws_ordenes."VENDEDOR_ID"
WHERE "VENTA_FECHA" BETWEEN '2022-07-01' AND '2022-09-30'
GROUP BY ws_ordenes."VENDEDOR_ID", ws_ordenes."PAIS", "SEGMENTO"
HAVING SUM("MONTO_VENTA") > 0
)
SELECT "VENDEDOR_ID", "PAIS", "MONTO_TOTAL", "SEGMENTO", "Ranking"
FROM CTE
WHERE "Ranking" <= 10
ORDER BY "PAIS", "MONTO_TOTAL" DESC;

-- b) Cuántos vendedores únicos tuvieron más de 500 unidades vendidas totales en el mes agosto 2022 por país. 
SELECT "WS_ORDER"."PAIS", COUNT(DISTINCT "WS_ORDER"."VENDEDOR_ID") AS "VENDEDORES_ÚNICOS"
FROM shipping_sales_bi."WS_ORDER"
WHERE "VENTA_FECHA" BETWEEN '2022-08-01' AND '2022-08-31'
GROUP BY "WS_ORDER"."PAIS"
HAVING SUM("UNIDADES_VENDIDAS") > 500;

-- c) Cuantas unidades vendidas hay por envío (paquete) en promedio mensual por cada logística de Mercado Libre en cada uno de los sitios (países).
SELECT "WS_ORDER"."PAIS", "TIPO_LOGISTICA", AVG("UNIDADES_VENDIDAS") AS "PROMEDIO_UNIDADES_VENDIDAS_POR_PAQUETE"
FROM shipping_sales_bi."WS_ORDER"
GROUP BY "WS_ORDER"."PAIS", "TIPO_LOGISTICA"; 

-- d. Cuál es el top 3 de publicaciones por vertical del marketplace que recomendarías para reponer stock para México (MLM). Se agotó el stock en el almacén el día 31 de agosto.
WITH cte AS (
SELECT
"WS_DOMINIOS"."VERTICAL_MARKETPLACE",
"WS_PUBLICACION"."PUBLICACION_TITULO",
MIN("WS_STOCK"."UNIDADES_ALMACENADAS") AS "MINIMUM_UNITS_IN_STOCK",
ROW_NUMBER() OVER (ORDER BY MIN("WS_STOCK"."UNIDADES_ALMACENADAS") ASC) AS rn
FROM shipping_sales_bi."WS_STOCK"
LEFT JOIN shipping_sales_bi."WS_PUBLICACION"
ON "WS_STOCK"."PUBLICACION_ID" = "WS_PUBLICACION"."PUBLICACION_ID"
AND "WS_STOCK"."PAIS" = "WS_PUBLICACION"."PAIS"
LEFT JOIN shipping_sales_bi."WS_DOMINIOS"
ON "WS_STOCK"."PUBLICACION_ID" = "WS_DOMINIOS"."PUBLICACION_ID"
AND "WS_STOCK"."PAIS" = "WS_DOMINIOS"."PAIS"
WHERE "WS_STOCK"."FOTO_FECHA" = '2022-08-31'
AND "WS_STOCK"."PAIS" = 'MLM'
GROUP BY
"WS_DOMINIOS"."VERTICAL_MARKETPLACE",
"WS_PUBLICACION"."PUBLICACION_TITULO"
)
SELECT
"VERTICAL_MARKETPLACE",
"PUBLICACION_TITULO",
"MINIMUM_UNITS_IN_STOCK"
FROM cte
WHERE rn <= 4
ORDER BY "MINIMUM_UNITS_IN_STOCK" asc;

-- e) De una lista de top vendedores, organizado por monto de venta y por país, requerimos categorizar un nuevo segmento: “TOP SELLERS” a aquellos vendedores que hayan tenido más de 200 unidades vendidas en el mes. Si no cumple con esta condición dejar el segmento default. Deberás realizarlo en dos partes: 
-- e) 1. Crea la lista de top vendedores
SELECT "VENDEDOR_ID",  "VENTA_FECHA", SUM("UNIDADES_VENDIDAS") as "UNIDADES_TOTALES", SUM("MONTO_VENTA") as "MONTO_TOTAL", "PAIS"
FROM shipping_sales_bi."WS_ORDER" 
GROUP BY "VENDEDOR_ID", "PAIS", "VENTA_FECHA"
ORDER BY "MONTO_TOTAL" DESC;

-- e) 2. De la lista creada realizar un update con la nueva condición de segmento.
SELECT "WS_ORDER"."VENDEDOR_ID",  "VENTA_FECHA", SUM("UNIDADES_VENDIDAS") as "UNIDADES_TOTALES", SUM("MONTO_VENTA") as "MONTO_TOTAL", "WS_ORDER"."PAIS",
CASE
  WHEN SUM("UNIDADES_VENDIDAS") > 200 THEN 'TOP SELLER'
  ELSE "SEGMENTO"
END as "SEGMENTO"
FROM shipping_sales_bi."WS_ORDER" 
left join  shipping_sales_bi."WS_SEGMENTOS_VENDEDORES" on "WS_SEGMENTOS_VENDEDORES"."VENDEDOR_ID" = "WS_ORDER"."VENDEDOR_ID"
GROUP BY "WS_ORDER"."VENDEDOR_ID", "VENTA_FECHA", "WS_ORDER"."PAIS", "SEGMENTO"
ORDER BY "MONTO_TOTAL" DESC;
