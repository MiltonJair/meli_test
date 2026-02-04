# Database Setup Guide

## Overview

This project uses Amazon RDS PostgreSQL as the database backend.

## Prerequisites

- PostgreSQL client installed
- Access credentials (see `.env.example`)
- Network access to the RDS instance

## Configuration

1. Copy the environment variables template:
   ```bash
   cp .env.example .env
   ```

2. Update the `.env` file with your credentials:
   - `DB_HOST`: Your RDS endpoint
   - `DB_PORT`: Database port (default: 5432)
   - `DB_NAME`: Database name
   - `DB_USER`: Database username
   - `DB_PASSWORD`: Database password

## Connecting to the Database

### Using psql

```bash
psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME
```

### Using DBeaver or pgAdmin

1. Create a new connection
2. Use the credentials from your `.env` file
3. Test the connection

## Database Schema

The project uses the `shipping_sales_bi` schema with the following main tables:

- `WS_ORDER` / `ws_ordenes`: Sales orders
- `WS_SEGMENTOS_VENDEDORES`: Seller segments
- `WS_STOCK`: Inventory data
- `WS_PUBLICACION`: Product listings
- `WS_DOMINIOS`: Marketplace domains/categories

## Entity-Relationship Models

Refer to the main README.md for ER diagrams:
- Sales model
- Stock model
- Combined Sales-Stock model

## Security Notes

⚠️ **Important**: 
- Never commit database credentials to version control
- Use environment variables for all sensitive data
- Rotate credentials regularly
- Use read-only credentials for reporting queries when possible
