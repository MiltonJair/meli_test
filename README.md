# MELI BI Project
**Work Sample | Shipping Sales Business Intelligence**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

## 📋 Tabla de Contenidos

- [Introducción](#introducción)
- [Estructura del Proyecto](#estructura-del-proyecto)
- [Configuración](#configuración)
- [Componentes de la Solución](#componentes-de-la-solución)
- [Documentación](#documentación)
- [Visualización de Datos](#visualización-de-datos)
- [Contribuir](#contribuir)
- [Licencia](#licencia)

## 🎯 Introducción

Este repositorio presenta una prueba de concepto para un proyecto de análisis de datos. La finalidad de la prueba era evaluar la viabilidad de utilizar una solución escalable y confiable que combinara Amazon Web Services (AWS), RDS PostgreSQL, S3 y GitHub para mejorar el análisis de datos en la empresa.

### ⚠️ Aclaraciones Importantes

- Los datos utilizados en este repositorio son **ficticios (dummy data)** con fines demostrativos
- Este proyecto es un proof of concept (PoC) para demostrar capacidades técnicas
- **NO** utilizar en producción sin las debidas modificaciones de seguridad

## 📁 Estructura del Proyecto

```
meli_test/
├── sql/                    # Scripts SQL para consultas de negocio
│   └── business-queries.sql
├── tableau/                # Workbooks de Tableau y data extracts
│   ├── Analysis -- MELI BI.twbx
│   └── metadata.hyper
├── docs/                   # Documentación del proyecto
│   ├── database-setup.md
│   ├── sql-queries.md
│   └── tableau-guide.md
├── .env.example            # Template para variables de entorno
├── .gitignore              # Archivos excluidos del control de versiones
├── CONTRIBUTING.md         # Guía de contribución
├── LICENSE                 # Licencia MIT
└── README.md               # Este archivo
```

## ⚙️ Configuración

### Requisitos Previos

- Cliente PostgreSQL instalado
- Tableau Desktop o Tableau Reader (para workbooks)
- Acceso a AWS RDS (si se conecta a la base de datos real)

### Configuración de Credenciales

1. Copie el archivo de variables de entorno:
   ```bash
   cp .env.example .env
   ```

2. Configure sus credenciales en `.env`:
   ```env
   DB_HOST=your-database-host
   DB_PORT=5432
   DB_NAME=postgres
   DB_USER=your_username
   DB_PASSWORD=your_secure_password
   ```

3. **⚠️ IMPORTANTE**: Nunca commita el archivo `.env` al repositorio

Para más detalles, consulte [docs/database-setup.md](docs/database-setup.md)

## 🏗️ Componentes de la Solución

### Amazon Web Services (AWS)
Plataforma de computación en la nube que proporciona recursos escalables y confiables para el almacenamiento, procesamiento y análisis de datos.

### RDS PostgreSQL
Base de datos relacional escalable y segura para almacenar los datos de ventas, inventario y análisis.

**Schema**: `shipping_sales_bi`

**Tablas principales**:
- `WS_ORDER` / `ws_ordenes`: Órdenes de venta
- `WS_SEGMENTOS_VENDEDORES`: Segmentos de vendedores
- `WS_STOCK`: Datos de inventario
- `WS_PUBLICACION`: Publicaciones/listados de productos
- `WS_DOMINIOS`: Dominios del marketplace

### Amazon S3
Servicio de almacenamiento de objetos en la nube para almacenar grandes cantidades de datos de forma segura y eficiente.

### GitHub
Repositorio de código para gestionar el código fuente del proyecto de forma colaborativa con control de versiones.

### Tableau
Herramienta de Business Intelligence para visualizar y analizar los datos y obtener insights valiosos.

## 📊 Modelos de Datos

### Modelo E-R: Ventas
![Entity Relationship Diagram (1)](https://user-images.githubusercontent.com/77754113/218520923-8bc3a7a5-06ec-4bc6-ab36-c8718237b7fd.jpg)

### Modelo E-R: Stock
![Entity Relationship Diagram (2)](https://user-images.githubusercontent.com/77754113/218520868-dad7816f-55a1-4179-867d-a5ca4997b70f.jpg)

### Modelo E-R: Ventas_Stock
![Entity Relationship Diagram (3)](https://user-images.githubusercontent.com/77754113/218579455-f7fbc0b9-c98d-445c-8d9a-38e641b033a7.jpg)

## ✨ Beneficios de la Solución

### Escalabilidad
La solución puede escalarse para gestionar grandes cantidades de datos a medida que la empresa crece.

### Confiabilidad
La solución se basa en tecnologías robustas y confiables de AWS con alta disponibilidad.

### Seguridad
Los datos se almacenan de forma segura en AWS con:
- Encriptación en tránsito y en reposo
- Control de acceso basado en roles (IAM)
- Redes privadas virtuales (VPC)
- Gestión segura de credenciales

### Colaboración
El código fuente se puede gestionar de forma colaborativa en GitHub con:
- Control de versiones
- Pull requests y code review
- Gestión de issues y proyectos

### Análisis de Datos
Tableau permite visualizar y analizar los datos de forma intuitiva y obtener insights valiosos para la toma de decisiones.

## 📚 Documentación

Para información detallada, consulte los siguientes documentos:

- **[Database Setup Guide](docs/database-setup.md)**: Configuración de la base de datos y conexión
- **[SQL Queries Documentation](docs/sql-queries.md)**: Descripción detallada de las consultas de negocio
- **[Tableau Guide](docs/tableau-guide.md)**: Guía de uso de los workbooks de Tableau

## 📈 Visualización de Datos

### Tableau Public

Acceda a la visualización interactiva en línea:

🔗 [Ver Dashboard en Tableau Public](https://public.tableau.com/app/profile/milton.jair.gomez.lucio/viz/Analysis-MELI/Analysis_summary)

### Presentación / Insights

Revise la presentación completa del análisis:

🔗 [Ver Presentación en Google Slides](https://docs.google.com/presentation/d/1VFp1Xut6dAmafGj2o6ggwExLh_k8xbv0fvEprRhWKFU/edit#slide=id.p)

### Archivos Locales

Los workbooks de Tableau están disponibles en el directorio `tableau/`:
- `Analysis -- MELI BI.twbx`: Workbook principal con datos empaquetados
- `metadata.hyper`: Extract de datos en formato Hyper

**Nota**: Estos archivos están excluidos del control de versiones debido a su tamaño. Utilice las versiones online o solicite acceso al propietario del repositorio.

## 🤝 Contribuir

¡Las contribuciones son bienvenidas! Por favor, lea [CONTRIBUTING.md](CONTRIBUTING.md) para conocer los lineamientos de contribución.

### Guía Rápida

1. Fork el repositorio
2. Cree una rama para su feature (`git checkout -b feature/AmazingFeature`)
3. Commit sus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abra un Pull Request

## 🔒 Seguridad

### Mejores Prácticas

- ✅ Utilice variables de entorno para credenciales (`.env`)
- ✅ Mantenga el archivo `.env` fuera del control de versiones
- ✅ Rote credenciales regularmente
- ✅ Use credenciales de solo lectura para consultas de reportes
- ✅ Revise el archivo `.env.example` para variables requeridas

### ⚠️ Importante

**NUNCA** commita información sensible al repositorio:
- ❌ Credenciales de base de datos
- ❌ AWS Access Keys
- ❌ Passwords
- ❌ Tokens de API

Si accidentalmente committea información sensible, rote las credenciales inmediatamente.

## 📋 Próximos Pasos

- [ ] Implementar la solución en un entorno de producción
- [ ] Capacitar a los usuarios en el uso de la solución
- [ ] Automatizar la actualización de extracts de Tableau
- [ ] Implementar monitoreo y alertas
- [ ] Establecer políticas de backup y recuperación
- [ ] Documentar procedimientos operativos

## 📄 Licencia

Este proyecto está bajo la Licencia MIT. Ver el archivo [LICENSE](LICENSE) para más detalles.

---

**Desarrollado por**: Milton Jair Gomez Lucio  
**Contacto**: [Perfil de Tableau Public](https://public.tableau.com/app/profile/milton.jair.gomez.lucio)

---

*Este es un proyecto de demostración con datos ficticios creado con fines educativos y de portfolio.*

