-- Insert sample test data
BEGIN
    FOR i IN 1..50 LOOP
        INSERT INTO dim_customer(full_name, gender, birth_date, city)
        VALUES ('Customer_'||i, CASE WHEN MOD(i,2)=0 THEN 'M' ELSE 'F' END, ADD_MONTHS(DATE '1990-01-01', i*10), 'Baku');
    END LOOP;
    COMMIT;
END;
/

BEGIN
    FOR i IN 1..30 LOOP
        INSERT INTO dim_product(product_name, category, price)
        VALUES ('Product_'||i, 'Category_'||MOD(i,5), TRUNC(DBMS_RANDOM.VALUE(20,500)));
    END LOOP;
    COMMIT;
END;
/

BEGIN
    FOR i IN 1..10 LOOP
        INSERT INTO dim_store(store_name, region)
        VALUES ('Store_'||i, 'Region_'||MOD(i,3));
    END LOOP;
    COMMIT;
END;
/

BEGIN
    FOR i IN 0..364 LOOP
        INSERT INTO dim_date (date_id, year, month, day, quarter)
        VALUES (TRUNC(SYSDATE - i), EXTRACT(YEAR FROM (SYSDATE - i)), EXTRACT(MONTH FROM (SYSDATE - i)),
                EXTRACT(DAY FROM (SYSDATE - i)), TO_NUMBER(TO_CHAR((SYSDATE - i), 'Q')));
    END LOOP;
    COMMIT;
END;
/