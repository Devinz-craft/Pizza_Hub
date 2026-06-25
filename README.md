### 🍕 Pizza Sales Analysis Dashboard
###  Project Overview

 This project analyzes a pizza restaurant's sales data to uncover valuable business insights related to revenue generation, customer purchasing behavior, product performance, and sales trends. The goal is to transform raw transactional data into actionable insights through data analysis and interactive visualizations that support informed decision-making.

The dashboard provides a comprehensive view of key performance indicators (KPIs), best- and worst-performing products, sales distribution across pizza categories and sizes, and customer ordering patterns over time.

>> Rather than performing all calculations within Power BI, the data was first cleaned, transformed, and optimized in a SQL database. Key Performance Indicators (KPIs) and business metrics were pre-calculated using SQL queries before being imported into Power BI for visualization. This approach improves query performance, reduces report complexity, and follows a scalable BI architecture commonly used in production environments.

### Business Objectives
- Identify the pizzas that generate the highest revenue.
- Determine the most and least popular pizzas based on sales volume and order frequency.
- Analyze sales performance across pizza sizes and categories.
- Discover peak ordering periods by day and hour.
- Provide data-driven recommendations to improve sales and inventory planning.

### Project Architecture

>>  Excel Dataset
      │
      ▼
SQL Database
(Data Cleaning & Transformation)
      │
      ▼
SQL Queries
(KPI & Business Metric Calculation)
      │
      ▼
Power BI
(Data Modeling & Visualization)
      │
      ▼
Interactive Dashboard
>> 
