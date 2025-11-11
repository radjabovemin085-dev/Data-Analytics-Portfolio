-- Bulk Insert Package
CREATE OR REPLACE PACKAGE sales_data_pkg AS
    PROCEDURE generate_bulk_sales(p_count NUMBER);
END sales_data_pkg;
/

CREATE OR REPLACE PACKAGE BODY sales_data_pkg AS

    TYPE t_customer_ids IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    TYPE t_product_ids  IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    TYPE t_store_ids    IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    TYPE t_date_ids     IS TABLE OF DATE INDEX BY PLS_INTEGER;
    TYPE t_quantitys    IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    TYPE t_amounts      IS TABLE OF NUMBER INDEX BY PLS_INTEGER;

    PROCEDURE generate_bulk_sales(p_count NUMBER) IS
        v_customer_ids t_customer_ids;
        v_product_ids  t_product_ids;
        v_store_ids    t_store_ids;
        v_date_ids     t_date_ids;
        v_quantitys    t_quantitys;
        v_amounts      t_amounts;
    BEGIN
        DBMS_OUTPUT.PUT_LINE('--- Generating ' || p_count || ' transactions ---');

        FOR i IN 1 .. p_count LOOP
            v_customer_ids(i) := TRUNC(DBMS_RANDOM.VALUE(1, 50));
            v_product_ids(i)  := TRUNC(DBMS_RANDOM.VALUE(1, 30));
            v_store_ids(i)    := TRUNC(DBMS_RANDOM.VALUE(1, 10));
            v_date_ids(i)     := TRUNC(SYSDATE - DBMS_RANDOM.VALUE(1, 365));
            v_quantitys(i)    := TRUNC(DBMS_RANDOM.VALUE(1, 10));
            v_amounts(i)      := v_quantitys(i) * TRUNC(DBMS_RANDOM.VALUE(20, 500));
        END LOOP;

        BEGIN
            FORALL i IN INDICES OF v_customer_ids SAVE EXCEPTIONS
                INSERT INTO fact_sales (
                    customer_id,
                    product_id,
                    store_id,
                    date_id,
                    quantity,
                    total_amount
                )
                VALUES (
                    v_customer_ids(i),
                    v_product_ids(i),
                    v_store_ids(i),
                    v_date_ids(i),
                    v_quantitys(i),
                    v_amounts(i)
                );

            COMMIT;

        EXCEPTION
            WHEN OTHERS THEN
                IF SQLCODE = -24381 THEN
                    FOR j IN 1 .. SQL%BULK_EXCEPTIONS.COUNT LOOP
                        INSERT INTO error_log (error_message, procedure_name)
                        VALUES (
                            'Error at record #' || SQL%BULK_EXCEPTIONS(j).ERROR_INDEX ||
                            ' - ' || SQLERRM(-SQL%BULK_EXCEPTIONS(j).ERROR_CODE),
                            'generate_bulk_sales'
                        );
                    END LOOP;
                    COMMIT;
                ELSE
                    INSERT INTO error_log (error_message, procedure_name)
                    VALUES (SQLERRM, 'generate_bulk_sales');
                    COMMIT;
                END IF;
        END;

    END generate_bulk_sales;

END sales_data_pkg;
/


BEGIN
    sales_data_pkg.generate_bulk_sales(1000);
END;
/