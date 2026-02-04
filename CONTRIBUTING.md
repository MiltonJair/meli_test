# Contributing to MELI BI Project

Thank you for your interest in contributing to this project! This document provides guidelines and best practices for contributing.

## Code of Conduct

- Be respectful and inclusive
- Provide constructive feedback
- Focus on collaboration

## Getting Started

1. Clone the repository
2. Copy `.env.example` to `.env` and configure your credentials
3. Connect to the database using the credentials in your `.env` file
4. Review the documentation in the `docs/` directory

## Project Structure

```
meli_test/
├── sql/              # SQL scripts for business queries
├── tableau/          # Tableau workbooks and data extracts
├── docs/             # Project documentation
├── .env.example      # Template for environment variables
└── README.md         # Project overview
```

## SQL Scripts Guidelines

- Use descriptive names for files (e.g., `business-queries.sql`)
- Add comments to explain complex queries
- Format SQL using consistent indentation
- Use uppercase for SQL keywords
- Include query purpose as a comment header

## Security Best Practices

- **NEVER** commit credentials or sensitive data
- Always use environment variables for configuration
- Keep `.env` file out of version control (it's in `.gitignore`)
- Review the `.env.example` file for required variables

## Making Changes

1. Create a new branch for your work
2. Make your changes
3. Test your SQL queries before committing
4. Commit with clear, descriptive messages
5. Push your branch and create a pull request

## SQL Query Standards

- Test queries on dummy data first
- Document expected results
- Use CTEs for complex queries
- Optimize for performance
- Add execution time estimates for long-running queries

## Documentation

- Update README.md if you add new features
- Document any new SQL queries in the file header
- Keep documentation in Spanish (primary language for this project)

## Questions?

If you have questions, please open an issue in the repository.
