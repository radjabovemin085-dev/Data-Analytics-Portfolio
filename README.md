# Oracle Sales SQL Project

This repository contains SQL scripts for creating a full Oracle sales data model.  
It is designed for testing, analysis, and integration with BI tools like Power BI.

## Contents

### Dimension Tables
- `dim_customer`: Customer details (ID, name, gender, birth date, city)
- `dim_product`: Product catalog (ID, name, category, price)
- `dim_date`: Date table for time intelligence
- `dim_store`: Stores and regions

### Fact Table
- `fact_sales`: Sales transactions linking customers, products, stores, and dates

### Packages
- `sales_data_pkg`: PL/SQL package for bulk inserting 1000+ transactions using FORALL
- Includes exception handling and logging into `error_log` table

### Materialized Views
- `mv_top_products`: Stores top 5 products by revenue (can be refreshed on demand)

### Test Data
- Scripts to populate dimension tables with sample data
- Randomized transactions inserted into fact_sales via the package

## Usage
1. Run the dimension table scripts first (`01_dim_tables.sql`).
2. Create fact table and error log (`02_fact.sql`).
3. Load sample data into dimensions (`04_test_data.sql`).
4. Compile the PL/SQL package (`03_bulk_pkg.sql`) and execute it to generate bulk sales data.
5. Optionally, create materialized views (`05_mv_top_products.sql`) for analytics.    
