CREATE TABLE price(
    id_price INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    cost MONEY,
);

ALTER TABLE product
ADD id_cost INT;

ALTER TABLE product
ADD FOREIGN KEY(id_cost) REFERENCES price(id_price) FOREIGN KEY(id_price) REFERENCES price(id_price);

INSERT INTO price (cost) VALUES (45);
INSERT INTO price (cost) VALUES (60);
INSERT INTO price (cost) VALUES (3);
INSERT INTO price (cost) VALUES (1);
INSERT INTO price (cost) VALUES (15);

UPDATE product
SET product.id_cost = (SELECT price.id_price FROM price WHERE cost = 45)
WHERE product.name = 'Smölek';

UPDATE product
SET product.id_cost = (SELECT price.id_price FROM price WHERE cost = 60)
WHERE product.name = 'Storgött';

UPDATE product
SET product.id_cost = (SELECT price.id_price FROM price WHERE cost = 3)
WHERE product.name = 'Steinerböat';

UPDATE product
SET product.id_cost = (SELECT price.id_price FROM price WHERE cost = 1)
WHERE product.name = 'Finkiëlkrött';

UPDATE product
SET product.id_cost = (SELECT price.id_price FROM price WHERE cost = 15)
WHERE product.name = 'Shtemüll';