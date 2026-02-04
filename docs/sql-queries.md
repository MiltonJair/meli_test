# SQL Queries Documentation

## Overview

This document describes the business queries available in the `sql/` directory.

## business-queries.sql

This file contains key business intelligence queries for analyzing sales, sellers, and inventory.

### Query a) Top 10 Sellers by Country (Q3 2022)

**Purpose**: Identify the top 10 sellers per country based on total sales amount during Q3 2022.

**Returns**: 
- Seller ID
- Country
- Total sales amount
- Seller segment
- Ranking within country

**Date Range**: July 1 - September 30, 2022

### Query b) Sellers with High Volume (August 2022)

**Purpose**: Count unique sellers who sold more than 500 units in August 2022, grouped by country.

**Returns**:
- Country
- Count of unique sellers

**Date Range**: August 1-31, 2022

### Query c) Average Units per Shipment

**Purpose**: Calculate the average number of units sold per shipment package, broken down by logistics type and country.

**Returns**:
- Country
- Logistics type
- Average units per package

**Aggregation**: Monthly average

### Query d) Top 3 Products for Stock Replenishment (MLM)

**Purpose**: Identify the top 3 product listings per marketplace vertical that need stock replenishment in Mexico (MLM).

**Context**: Stock was depleted on August 31, 2022.

**Returns**:
- Marketplace vertical
- Product listing title
- Minimum units in stock

**Filter**: MLM (Mexico) market only

### Query e) Top Sellers Segmentation

**Purpose**: Create and categorize a "TOP SELLERS" segment for sellers with more than 200 units sold in a month.

**Part 1**: Generate a list of top sellers by sales amount
**Part 2**: Update seller segments with the new "TOP SELLERS" classification

**Returns**:
- Seller ID
- Sale date
- Total units sold
- Total sales amount
- Country
- Updated segment

**Segment Logic**: 
- If units sold > 200: "TOP SELLER"
- Otherwise: Keep existing segment

## Best Practices

- Always test queries on a development/test database first
- Use appropriate date filters to limit data scanned
- Consider adding indexes on frequently queried columns
- Monitor query performance and optimize as needed
- Document any modifications to existing queries

## Performance Tips

- Use CTEs (Common Table Expressions) for complex queries
- Leverage `EXPLAIN ANALYZE` to understand query execution plans
- Partition tables by date if dealing with large datasets
- Use appropriate indexes on join columns and where clauses
