SET SERVEROUTPUT ON;

-- CLIENTS TABLE TRIGGERS

CREATE OR REPLACE TRIGGER clients
BEFORE INSERT ON clients
FOR EACH ROW
BEGIN
    :NEW.id_client :=clients_seq.NEXTVAL;
END;
/

-- MATERIALS TABLE TRIGGERS
    
CREATE OR REPLACE TRIGGER materials
BEFORE INSERT ON materials
FOR EACH ROW
BEGIN
    :NEW.id_material :=materials_seq.NEXTVAL;
END;

/

CREATE OR REPLACE TRIGGER trimmings
BEFORE INSERT ON materials
FOR EACH ROW
BEGIN
    DELETE FROM materials WHERE A<200 OR b<200;
END;

/

-- ORDERS TABLE TRIGGERS

CREATE OR REPLACE TRIGGER orders
BEFORE INSERT ON orders
FOR EACH ROW
BEGIN
    :NEW.id_order :=orders_seq.NEXTVAL;
END;
/

CREATE OR REPLACE TRIGGER orders_send
AFTER INSERT ON orders
FOR EACH ROW
DECLARE
  orders_number  NUMBER;
BEGIN
    SELECT COUNT(*) INTO orders_number FROM orders;
    
    IF(orders_number>10) THEN
    dbms_output.put_line('10 ORDERS -> PROCESS');
    END IF;
END;

/

CREATE OR REPLACE TRIGGER orders_price
BEFORE INSERT ON orders
FOR EACH ROW
DECLARE
  price_m2_  NUMBER;
  material NUMBER;
BEGIN
    SELECT id_material INTO material FROM plates WHERE plates.id_plate = :NEW.id_plate;
    SELECT price_m2 INTO price_m2_ FROM materials WHERE materials.id_material = material;
    :NEW.cost := round(:NEW.A/1000 * :NEW.b/1000 * price_m2_ , 2);
END;

/

