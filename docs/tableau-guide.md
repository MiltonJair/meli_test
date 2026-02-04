# Tableau Workbook Documentation

## Overview

This directory contains Tableau workbooks and data extracts for visualizing MELI shipping and sales data.

## Files

- `Analysis -- MELI BI.twbx`: Main Tableau workbook with packaged data
- `metadata.hyper`: Hyper extract file containing the data snapshot

## Accessing the Tableau Workbook

### Option 1: Download and Open Locally

1. Download the `.twbx` file from the `tableau/` directory
2. Open with Tableau Desktop or Tableau Reader
3. Explore the visualizations and dashboards

### Option 2: View Online (Public Tableau)

Access the published version on Tableau Public:
[https://public.tableau.com/app/profile/milton.jair.gomez.lucio/viz/Analysis-MELI/Analysis_summary](https://public.tableau.com/app/profile/milton.jair.gomez.lucio/viz/Analysis-MELI/Analysis_summary)

## Dashboard Components

The workbook includes analysis for:

- Sales performance by country and seller
- Top sellers and their segments
- Inventory levels and stock recommendations
- Logistics performance metrics
- Time-series trends

## Data Source

The workbook connects to:
- Database: PostgreSQL on AWS RDS
- Schema: `shipping_sales_bi`
- Data Period: 2022 (Q1-Q4)

**Note**: The data used is dummy/test data for demonstration purposes.

## Updating the Workbook

If you need to refresh the data:

1. Open the `.twbx` file in Tableau Desktop
2. Go to Data → Data Source
3. Update the connection credentials (use `.env` variables)
4. Click "Refresh" to pull latest data
5. Save the workbook

## Publishing Updates

To publish to Tableau Public or Server:

1. Update the workbook as needed
2. Go to Server → Tableau Public → Save to Tableau Public (for Public)
3. Or use Server → Publish Workbook (for Tableau Server)
4. Update the link in the main README.md

## File Size Considerations

⚠️ **Important**: 
- `.twbx` and `.hyper` files can be large (several MB)
- These files are excluded from version control via `.gitignore`
- Store published workbooks on Tableau Server/Public
- Only include packaged workbooks if necessary for offline access
- Consider using `.twb` (without data) and connect live to the database

## Best Practices

- Use extracts (`.hyper`) for large datasets to improve performance
- Schedule regular extract refreshes for production dashboards
- Document any calculated fields in the workbook
- Use consistent naming conventions for worksheets and dashboards
- Add tooltips and descriptions to help users understand visualizations
