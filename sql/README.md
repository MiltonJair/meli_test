# SQL Business Queries

This directory contains SQL scripts for business intelligence analysis.

## Files

### business-queries.sql

Main SQL file containing all business queries for the MELI BI project.

**Queries included:**

1. **Query A**: Top 10 Sellers by Country (Q3 2022)
   - Analyzes top performing sellers per country
   - Period: July-September 2022

2. **Query B**: High Volume Sellers Count (August 2022)
   - Counts sellers with >500 units sold
   - Grouped by country

3. **Query C**: Average Units per Shipment
   - Calculates average units per shipment package
   - Broken down by logistics type and country

4. **Query D**: Stock Replenishment Recommendations (MLM)
   - Identifies products needing restocking in Mexico
   - Based on August 31, 2022 inventory snapshot

5. **Query E**: Top Sellers Segmentation
   - Creates "TOP SELLER" segment classification
   - Based on 200+ units sold threshold

## Usage

### Running Queries

#### Using psql
```bash
# Connect to database
psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME

# Run a specific query
\i sql/business-queries.sql
```

#### Using SQL Client
1. Open your SQL client (DBeaver, pgAdmin, DataGrip, etc.)
2. Connect using credentials from `.env`
3. Open `business-queries.sql`
4. Execute individual queries as needed

### Query Standards

- All queries use the `shipping_sales_bi` schema
- Date filters are applied where appropriate
- CTEs (Common Table Expressions) are used for complex queries
- Results are ordered for readability

## Documentation

For detailed documentation of each query, see:
- [docs/sql-queries.md](../docs/sql-queries.md)

## Database Schema

**Main Tables:**
- `WS_ORDER` / `ws_ordenes`: Sales orders
- `WS_SEGMENTOS_VENDEDORES`: Seller segments
- `WS_STOCK`: Inventory data
- `WS_PUBLICACION`: Product listings
- `WS_DOMINIOS`: Marketplace domains/verticals

For complete database setup information, see:
- [docs/database-setup.md](../docs/database-setup.md)

## Best Practices

✅ **Do:**
- Test queries on development/test database first
- Use appropriate date filters
- Comment your queries
- Format SQL consistently
- Document expected results

❌ **Don't:**
- Run queries without LIMIT on large tables in production
- Commit credentials to the repository
- Modify production data without backup
- Run UPDATE/DELETE without WHERE clause

## Performance Tips

- Use `EXPLAIN ANALYZE` to check query plans
- Add indexes on frequently queried columns
- Consider materialized views for complex aggregations
- Use date partitioning for large tables
- Monitor query execution times

## Contributing

When adding new queries:
1. Add comprehensive header comments
2. Document the purpose and expected results
3. Test on dummy data first
4. Update the main documentation
5. Follow existing formatting style

See [CONTRIBUTING.md](../CONTRIBUTING.md) for more details.
