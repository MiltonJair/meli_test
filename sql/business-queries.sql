-- ================================================================================
-- MELI BI - Business Queries
-- ================================================================================
-- Description: SQL queries for analyzing MELI shipping and sales data
-- Schema: shipping_sales_bi
-- Database: PostgreSQL on AWS RDS
-- Author: MELI BI Team
-- Last Updated: 2026-02-04
-- ================================================================================

-- ================================================================================
-- Query A: Top 10 Sellers by Country (Q3 2022)
-- ================================================================================
-- Purpose: Identify the top 10 sellers per country based on total sales amount
--          during Q3 2022, including their segment classification
-- Period: July 1 - September 30, 2022
-- Returns: VENDEDOR_ID, PAIS, MONTO_TOTAL, SEGMENTO, Ranking
-- ================================================================================
WITH CTE AS (
    SELECT 
        ws_ordenes."VENDEDOR_ID", 
        ws_ordenes."PAIS", 
        SUM("MONTO_VENTA") AS "MONTO_TOTAL", 
        "SEGMENTO",
        ROW_NUMBER() OVER (
            PARTITION BY ws_ordenes."PAIS" 
            ORDER BY SUM("MONTO_VENTA") DESC
        ) AS "Ranking"
    FROM shipping_sales_bi.ws_ordenes
    LEFT JOIN shipping_sales_bi."WS_SEGMENTOS_VENDEDORES" 
        ON "WS_SEGMENTOS_VENDEDORES"."VENDEDOR_ID" = ws_ordenes."VENDEDOR_ID"
    WHERE "VENTA_FECHA" BETWEEN '2022-07-01' AND '2022-09-30'
    GROUP BY ws_ordenes."VENDEDOR_ID", ws_ordenes."PAIS", "SEGMENTO"
    HAVING SUM("MONTO_VENTA") > 0
)
SELECT 
    "VENDEDOR_ID", 
    "PAIS", 
    "MONTO_TOTAL", 
    "SEGMENTO", 
    "Ranking"
FROM CTE
WHERE "Ranking" <= 10
ORDER BY "PAIS", "MONTO_TOTAL" DESC;

-- ================================================================================
-- Query B: High Volume Sellers Count (August 2022)
-- ================================================================================
-- Purpose: Count unique sellers who sold more than 500 units in August 2022
-- Period: August 1-31, 2022
-- Returns: PAIS, VENDEDORES_ÚNICOS (count)
-- ================================================================================
SELECT 
    "WS_ORDER"."PAIS", 
    COUNT(DISTINCT "WS_ORDER"."VENDEDOR_ID") AS "VENDEDORES_ÚNICOS"
FROM shipping_sales_bi."WS_ORDER"
WHERE "VENTA_FECHA" BETWEEN '2022-08-01' AND '2022-08-31'
GROUP BY "WS_ORDER"."PAIS"
HAVING SUM("UNIDADES_VENDIDAS") > 500;

-- ================================================================================
-- Query C: Average Units per Shipment by Logistics Type
-- ================================================================================
-- Purpose: Calculate average units sold per shipment package by logistics type
-- Granularity: Country and logistics type
-- Returns: PAIS, TIPO_LOGISTICA, PROMEDIO_UNIDADES_VENDIDAS_POR_PAQUETE
-- ================================================================================
SELECT 
    "WS_ORDER"."PAIS", 
    "TIPO_LOGISTICA", 
    AVG("UNIDADES_VENDIDAS") AS "PROMEDIO_UNIDADES_VENDIDAS_POR_PAQUETE"
FROM shipping_sales_bi."WS_ORDER"
GROUP BY "WS_ORDER"."PAIS", "TIPO_LOGISTICA";

-- ================================================================================
-- Query D: Top Products for Stock Replenishment (MLM - Mexico)
-- ================================================================================
-- Purpose: Identify products with lowest stock levels for replenishment
-- Context: Stock depleted on August 31, 2022 for Mexico market
-- Market: MLM (Mexico)
-- Returns: VERTICAL_MARKETPLACE, PUBLICACION_TITULO, MINIMUM_UNITS_IN_STOCK
-- Note: Query returns top 4 items (can be adjusted by changing WHERE rn <= 4)
-- ================================================================================
WITH cte AS (
    SELECT
        "WS_DOMINIOS"."VERTICAL_MARKETPLACE",
        "WS_PUBLICACION"."PUBLICACION_TITULO",
        MIN("WS_STOCK"."UNIDADES_ALMACENADAS") AS "MINIMUM_UNITS_IN_STOCK",
        ROW_NUMBER() OVER (
            ORDER BY MIN("WS_STOCK"."UNIDADES_ALMACENADAS") ASC
        ) AS rn
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
ORDER BY "MINIMUM_UNITS_IN_STOCK" ASC;

-- ================================================================================
-- Query E: Top Sellers Segmentation
-- ================================================================================
-- Purpose: Create and categorize sellers into "TOP SELLERS" segment
-- Criteria: Sellers with more than 200 units sold in a month
-- Returns: VENDEDOR_ID, VENTA_FECHA, UNIDADES_TOTALES, MONTO_TOTAL, PAIS, SEGMENTO
-- ================================================================================

-- E.1: List of Top Sellers (Base Query)
-- Returns sellers ordered by total sales amount
SELECT 
    "VENDEDOR_ID",  
    "VENTA_FECHA", 
    SUM("UNIDADES_VENDIDAS") AS "UNIDADES_TOTALES", 
    SUM("MONTO_VENTA") AS "MONTO_TOTAL", 
    "PAIS"
FROM shipping_sales_bi."WS_ORDER" 
GROUP BY "VENDEDOR_ID", "PAIS", "VENTA_FECHA"
ORDER BY "MONTO_TOTAL" DESC;

-- E.2: Segmented List with "TOP SELLER" Classification
-- Logic: IF units > 200 THEN "TOP SELLER" ELSE keep existing segment
SELECT 
    "WS_ORDER"."VENDEDOR_ID",  
    "VENTA_FECHA", 
    SUM("UNIDADES_VENDIDAS") AS "UNIDADES_TOTALES", 
    SUM("MONTO_VENTA") AS "MONTO_TOTAL", 
    "WS_ORDER"."PAIS",
    CASE
        WHEN SUM("UNIDADES_VENDIDAS") > 200 THEN 'TOP SELLER'
        ELSE "SEGMENTO"
    END AS "SEGMENTO"
FROM shipping_sales_bi."WS_ORDER" 
LEFT JOIN shipping_sales_bi."WS_SEGMENTOS_VENDEDORES" 
    ON "WS_SEGMENTOS_VENDEDORES"."VENDEDOR_ID" = "WS_ORDER"."VENDEDOR_ID"
GROUP BY "WS_ORDER"."VENDEDOR_ID", "VENTA_FECHA", "WS_ORDER"."PAIS", "SEGMENTO"
ORDER BY "MONTO_TOTAL" DESC;

-- ================================================================================
-- End of Business Queries
-- ================================================================================
