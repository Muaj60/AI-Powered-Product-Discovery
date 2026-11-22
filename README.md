# AI-Powered Product Discovery

## Project Description

The AI-Powered Product Discovery is a web-based application that helps users discover, compare, and select suitable products from different e-commerce platforms.

The system collects product information using web scraping or data feeds from permitted sources and uses Artificial Intelligence to understand user requirements, match relevant products, analyze specifications, and generate recommendations with explanations.

The goal is to reduce the time and effort required for online product research and help users make informed purchasing decisions.

## Problem Statement

Online shoppers often face difficulties when searching for products across multiple e-commerce platforms. Product specifications, prices, and features may vary between websites, making it difficult to identify the most suitable product. Traditional product comparison systems mainly rely on keyword-based searches and manual comparisons.

This project aims to solve these problems through AI-powered product discovery, intelligent matching, automated comparison, and explainable recommendations.

## Team Information

**Team Name:** CSE4104-7C-T10

| Member | Name | Student ID |
|---|---|---|
| Member 1 | MD. Rasheduzzaman | 11230321446 |
| Member 2 | Md Fahim Khan | 11230321437 |
| Member 3 | Md Rakib Hossain | 11230321438 |
| Member 4 | Muaj | 11230321449 |

## Project Objectives

- To simplify online product discovery.
- To reduce manual product comparison efforts.
- To collect and standardize product data from permitted sources.
- To apply AI in a real-world e-commerce problem.
- To provide intelligent and explainable product recommendations.
- To develop a full-stack AI-integrated software application.

## Features

- AI-powered natural language product search
- Automated product data collection using web scraping
- Product specification extraction and normalization
- Intelligent product matching and ranking
- Product price and specification comparison (side by side)
- AI-based product recommendations with explanations
- Product source links
- Admin dashboard for managing data sources, data collection, and product records

### Future Enhancements

- Product price history and trend visualization
- User accounts, search history, and saved products
- More product categories and data sources

## Technology Stack

| Part | Technologies |
|---|---|
| Frontend | React.js, HTML, Tailwind CSS, DaisyUI, JavaScript |
| Backend | Node.js, Express.js (REST API) |
| Database | PostgreSQL |
| Data Collection | Python, BeautifulSoup, Requests, Playwright |
| AI Integration | OpenAI API (GPT model) |
| Tools | Git, GitHub, VS Code |

## System Architecture

Frontend (React) -> Backend API (Node.js + Express.js) -> Database (PostgreSQL)

The backend also calls the AI Service (OpenAI API). A separate Python pipeline collects and cleans product data and sends it to the backend. See `diagrams/` and `documentation/` for details.

## System Workflow

1. The user enters product requirements using natural language.
2. The backend processes the search query and the AI extracts structured criteria.
3. The system collects product information from permitted e-commerce sources.
4. Product data is cleaned and stored in the database.
5. The backend matches products against the criteria.
6. AI ranks the matched products and writes explanations.
7. The system compares product specifications and prices.
8. The user views the results and original product links.

## Repository Structure

```
frontend/        React user interface
backend/         Node.js + Express.js REST API
database/        PostgreSQL schema (schema.sql)
scraper/         Python data collection and cleaning
documentation/   Proposal, SRS, System Design Document
diagrams/        Architecture, ER, Use Case, and Activity diagrams
README.md
```

## Documentation

- `documentation/CSE4104-7C-T10_Proposal.pdf`
- `documentation/CSE4104-7C-T10_SRS.pdf`
- `documentation/CSE4104-7C-T10_SystemDesign.pdf`

## Diagrams

- `diagrams/CSE4104-7C-T10_ArchitectureDiagram.pdf`
- `diagrams/CSE4104-7C-T10_ERDiagram.pdf`
- `diagrams/CSE4104-7C-T10_UseCaseDiagram.pdf`
- `diagrams/CSE4104-7C-T10_ActivityDiagram.pdf`
