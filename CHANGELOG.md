# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.0.0] - 2026-02-04

### Added
- Project organization following best practices
- Proper directory structure (sql/, docs/, tableau/)
- `.gitignore` file to exclude binary files and sensitive data
- `.env.example` template for environment variables
- `CONTRIBUTING.md` with collaboration guidelines
- `LICENSE` file (MIT License)
- Comprehensive documentation in `docs/` directory:
  - `database-setup.md`: Database configuration guide
  - `sql-queries.md`: Detailed SQL queries documentation
  - `tableau-guide.md`: Tableau workbook usage guide
- Enhanced README.md with:
  - Table of contents
  - Badges
  - Security best practices
  - Better structure and organization
  - Links to all documentation

### Changed
- Moved SQL scripts to `sql/` directory with improved formatting
- Renamed `scripts-negocio.sql` to `business-queries.sql` for clarity
- Moved Tableau files to `tableau/` directory
- Updated SQL queries with:
  - Comprehensive header comments
  - Proper formatting and indentation
  - Detailed purpose and return value documentation
  - Performance notes where applicable

### Security
- Removed exposed database credentials from README.md
- Added security best practices documentation
- Implemented environment variables pattern
- Added warnings about sensitive data management

### Removed
- Database credentials from public README (moved to `.env.example`)
- Exposed connection details (replaced with secure configuration method)

## [0.1.0] - Initial Release

### Added
- Initial project structure
- SQL business queries
- Tableau workbook
- Basic README documentation

---

[Unreleased]: https://github.com/MiltonJair/meli_test/compare/v1.0.0...HEAD
[1.0.0]: https://github.com/MiltonJair/meli_test/releases/tag/v1.0.0
[0.1.0]: https://github.com/MiltonJair/meli_test/releases/tag/v0.1.0
