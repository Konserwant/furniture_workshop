CREATE TABLE materials
(
    id_material INT PRIMARY KEY,
    material VARCHAR2(20),
    thickness NUMBER,
    price_m2 NUMBER
);
CREATE SEQUENCE materials_seq;
COMMIT;

CREATE TABLE clients
(
    id_client INT PRIMARY KEY, 
    first_name VARCHAR2(20), 
    surname VARCHAR2(20),
    username VARCHAR2(20),
    password VARCHAR2(20)
);
CREATE SEQUENCE clients_seq;
COMMIT;

CREATE TABLE orders
(
    id_order INT PRIMARY KEY, 
    id_client INT,
    A INT, 
    b INT,
    id_plate INT,
    status VARCHAR2(20) CHECK( status IN ('waiting','done')),
    COST NUMBER,
    id_material INT
);
CREATE SEQUENCE orders_seq;
ALTER TABLE orders ADD CONSTRAINT platefk FOREIGN KEY(id_plate) REFERENCES plates(id_plate);
ALTER TABLE orders ADD CONSTRAINT clientfk FOREIGN KEY(id_client) REFERENCES clients(id_client);
ALTER TABLE orders ADD CONSTRAINT material_ordersfk FOREIGN KEY(id_material) REFERENCES material(id_material);
COMMIT;

CREATE TABLE plates
(
    id_plate INT PRIMARY KEY,
    A INT,
    b INT,
    id_material INT,
    status VARCHAR2(20)
);
CREATE SEQUENCE plates_seq;
ALTER TABLE plates ADD CONSTRAINT materialfk FOREIGN KEY(id_material) REFERENCES materials(id_material);
COMMIT;
