CREATE OR REPLACE PROCEDURE GENERATE_ORDERS
    (QUANTITY IN INTEGER, ID_CO IN INTEGER, ID_KTO IN INTEGER)
IS
    RAND_A NUMBER;
    RAND_B NUMBER;
    TEMP NUMBER;
    I INTEGER;
BEGIN
    FOR I IN 0..QUANTITY
    LOOP
        RAND_A := (DBMS_RANDOM.VALUE (200,10000));
        RAND_B := (DBMS_RANDOM.VALUE (200,20000));
        IF (RAND_A > RAND_B) THEN
           TEMP :=RAND_B;
           RAND_B :=RAND_A;
           RAND_A :=TEMP;
        END IF;
        INSERT INTO ORDERS
        (
            A,
            B,
            ID_CLIENT,
            ID_PLATE,
            STATUS)
            VALUES
            (RAND_A,
            RAND_B,
            ID_KTO,
            ID_CO,
            'WAITING'
        );
    END LOOP;
END;

