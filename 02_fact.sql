-- Fact Table
CREATE TABLE fact_sales (
    sale_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    customer_id NUMBER NOT NULL,
    product_id NUMBER NOT NULL,
    store_id NUMBER NOT NULL,
    date_id DATE NOT NULL,
    quantity NUMBER(10,2),
    total_amount NUMBER(12,2),
    CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES dim_customer(customer_id),
    CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES dim_product(product_id),
    CONSTRAINT fk_store FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    CONSTRAINT fk_date FOREIGN KEY (date_id) REFERENCES dim_date(date_id)
);
CREATE TABLE error_log (
    error_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    error_message VARCHAR2(4000),
    procedure_name VARCHAR2(100),
    created_at DATE DEFAULT SYSDATE
);
