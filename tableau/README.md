# Tableau Files

This directory contains Tableau workbooks and data extracts.

## Files

- **Analysis -- MELI BI.twbx**: Main Tableau workbook with packaged data (4.3 MB)
- **metadata.hyper**: Hyper extract file containing the data snapshot (8.2 MB)

## Important Notes

⚠️ **Large Files**: These files are large binary files that are currently tracked in git. For future updates:

1. **Consider using Git LFS** (Large File Storage) for these files
2. **Or store them externally** (S3, Tableau Server, etc.) and reference them in documentation
3. **Or use `.twb` format** (without embedded data) and connect live to the database

## Accessing the Workbooks

### Option 1: Local Files
1. Download the `.twbx` file
2. Open with Tableau Desktop or Tableau Reader
3. Explore the visualizations

### Option 2: Online Version
View the published dashboard on Tableau Public:
https://public.tableau.com/app/profile/milton.jair.gomez.lucio/viz/Analysis-MELI/Analysis_summary

## Best Practices for Future Updates

- Publish workbooks to Tableau Server/Public instead of storing in git
- Use `.twb` files with live database connections when possible
- Consider Git LFS for large binary files
- Keep workbooks under 10MB when possible
- Document any data refresh procedures

## Data Refresh

To refresh the data in the workbook:
1. Open in Tableau Desktop
2. Go to Data → Your Data Source → Refresh
3. Or recreate the extract: Data → Extract Data
4. Save and publish to Tableau Server/Public

For more information, see [docs/tableau-guide.md](../docs/tableau-guide.md)
