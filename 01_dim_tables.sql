-- Dimension Tables
CREATE TABLE dim_customer (
    customer_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name VARCHAR2(100) NOT NULL,
    gender CHAR(1),
    birth_date DATE,
    city VARCHAR2(50),
    created_at DATE DEFAULT SYSDATE
);
CREATE TABLE dim_product (
    product_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    product_name VARCHAR2(100) NOT NULL,
    category VARCHAR2(50),
    price NUMBER(10,2),
    created_at DATE DEFAULT SYSDATE
);
CREATE TABLE dim_date (
    date_id DATE PRIMARY KEY,
    year NUMBER,
    month NUMBER,
    day NUMBER,
    quarter NUMBER
);
CREATE TABLE dim_store (
    store_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    store_name VARCHAR2(100),
    region VARCHAR2(50)
);