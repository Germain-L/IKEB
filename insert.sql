/* Script d'insertion des données */

INSERT INTO stock_status(name) VALUES ('Rupture');
INSERT INTO stock_status(name) VALUES ('En stock');
INSERT INTO stock_status(name) VALUES ('En commande');

INSERT INTO vat(rate) VALUES (0.0);
INSERT INTO vat(rate) VALUES (2.1);
INSERT INTO vat(rate) VALUES (5.5);
INSERT INTO vat(rate) VALUES (10.0);
INSERT INTO vat(rate) VALUES (20.0);

INSERT INTO shelf(number) VALUES (1);
INSERT INTO shelf(number) VALUES (2);
INSERT INTO shelf(number) VALUES (3);

INSERT INTO price(cost) VALUES (45);
INSERT INTO price(cost) VALUES (60);
INSERT INTO price(cost) VALUES (3);
INSERT INTO price(cost) VALUES (1);
INSERT INTO price(cost) VALUES (15);

INSERT INTO product(name, description, price, id_stock, id_shelf, id_cost) VALUES ('Shtemüll', 'Lampe', 29.90, 
	(SELECT stock_status.id_stock FROM stock_status WHERE name = 'En stock'), 
	(SELECT shelf.id_shelf FROM shelf WHERE number = 2),
	(SELECT price.id_price FROM price WHERE price.cost = 15)
);

INSERT INTO product(name, description, price, id_stock, id_shelf, id_cost) VALUES ('Smölek', 'Meuble television', 89.00, 
	(SELECT stock_status.id_stock FROM stock_status WHERE name = 'En commande'), 
	(SELECT shelf.id_shelf FROM shelf WHERE number = 3),
	(SELECT price.id_price FROM price WHERE price.cost = 45)	
);

INSERT INTO product(name, description, price, id_stock, id_shelf, id_cost) VALUES ('Storgött', 'Balai', 29.90, 
	(SELECT stock_status.id_stock FROM stock_status WHERE name = 'En stock'), 
	(SELECT shelf.id_shelf FROM shelf WHERE number = 1),
	(SELECT price.id_price FROM price WHERE price.cost = 15)
);

INSERT INTO product(name, description, price, id_stock, id_shelf, id_cost) VALUES ('Steinerböat', 'Beteau en peluche', 13.00, 
	(SELECT stock_status.id_stock FROM stock_status WHERE name = 'Rupture'), 
	(SELECT shelf.id_shelf FROM shelf WHERE number = 3),
	(SELECT price.id_price FROM price WHERE price.cost = 3)
);

INSERT INTO product(name, description, price, id_stock, id_shelf, id_cost) VALUES ('Finkiëlkrött', 'Tapis', 3.90, 
	(SELECT stock_status.id_stock FROM stock_status WHERE name = 'En stock'), 
	(SELECT shelf.id_shelf FROM shelf WHERE number = 2),
	(SELECT price.id_price FROM price WHERE price.cost = 1)
);



INSERT INTO service(name) VALUES ('Livraison');
INSERT INTO service(name) VALUES ('Forfait montage');
INSERT INTO service(name) VALUES ('Projet cuisine');

INSERT INTO zip(code, city) VALUES (33000, 'Bordeaux');
INSERT INTO zip(code, city) VALUES (33520, 'Bruges');
INSERT INTO zip(code, city) VALUES (33300, 'Bordeaux');




INSERT INTO adress(adress, complement, id_zip) VALUES ('Avenue des 40 journaux', 'Centre commercial', 
(SELECT zip.id_zip FROM zip WHERE code = 33300 AND city = 'Bordeaux'));

INSERT INTO adress(adress, complement, id_zip) VALUES ('33 cours Albret', 'Batiment C', 
(SELECT zip.id_zip FROM zip WHERE code = 33000 AND city = 'Bordeaux'));

INSERT INTO adress(adress, complement, id_zip) VALUES ('168 rue maison', '', 
(SELECT zip.id_zip FROM zip WHERE code = 33000 AND city = 'Bordeaux'));

INSERT INTO adress(adress, complement, id_zip) VALUES ('12 rue aubrac', 'étage 2', 
(SELECT zip.id_zip FROM zip WHERE code = 33000 AND city = 'Bordeaux'));

INSERT INTO adress(adress, complement, id_zip) VALUES ('1 place des quinquonce', 'appartement 32', 
(SELECT zip.id_zip FROM zip WHERE code = 33000 AND city = 'Bordeaux'));




INSERT INTO status(status) VALUES ('Validé');
INSERT INTO status(status) VALUES ('En cours');
INSERT INTO status(status) VALUES ('Non validé');

INSERT INTO contract_type(name) VALUES ('CDD');
INSERT INTO contract_type(name) VALUES ('CDI');
INSERT INTO contract_type(name) VALUES ('Intérimaire');

INSERT INTO employment_type(name) VALUES ('Vendeur');
INSERT INTO employment_type(name) VALUES ('Commercial');
INSERT INTO employment_type(name) VALUES ('Responsable');
INSERT INTO employment_type(name) VALUES ('Directeur');
INSERT INTO employment_type(name) VALUES ('Livreur');

INSERT INTO store(id_adress) VALUES ((SELECT adress.id_adress FROM adress WHERE adress = 'Avenue des 40 journaux' AND complement = 'Centre commercial'));

INSERT INTO person(lastname, firstname, email, id_adress) VALUES ('Barille', 'Thomas', 'thomasbarille@gmail.com', 
(SELECT adress.id_adress FROM adress WHERE adress = '1 place des quinquonce' AND complement = 'appartement 32'));

INSERT INTO person(lastname, firstname, email, id_adress) VALUES ('Leignel', 'Germain', 'germainleignel@gmail.com', 
(SELECT adress.id_adress FROM adress WHERE adress = '33 cours Albret' AND complement = 'Batiment C'));

INSERT INTO person(lastname, firstname, email, id_adress) VALUES ('Cas', 'Marc-Olivier', 'casmarcolivier@gmail.com', 
(SELECT adress.id_adress FROM adress WHERE adress = '168 rue maison' AND complement = ''));

INSERT INTO person(lastname, firstname, email, id_adress) VALUES ('Delibes-Houdayer', 'Maximilien', 'delibesshoudayermaximilien@gmail.com', 
(SELECT adress.id_adress FROM adress WHERE adress = '12 rue aubrac' AND complement = 'étage 2'));


INSERT INTO card(points, id_pers) VALUES (269, (SELECT person.id_pers FROM person WHERE lastname = 'Barille' AND firstname = 'Thomas' AND email = 'thomasbarille@gmail.com'));
INSERT INTO card(points, id_pers) VALUES (1076, (SELECT person.id_pers FROM person WHERE lastname = 'Leignel' AND firstname = 'Germain' AND email = 'germainleignel@gmail.com'));


INSERT INTO employee(level, employment_date, id_employment_type, id_contract_type, id_pers) VALUES (2, '2020/03/24', 
(SELECT employment_type.id_employment_type FROM employment_type WHERE name = 'Vendeur'),(SELECT contract_type.id_contract_type FROM contract_type WHERE name = 'CDI'),
(SELECT person.id_pers FROM person WHERE lastname = 'Barille' AND firstname = 'Thomas' AND email = 'thomasbarille@gmail.com'));

INSERT INTO employee(level, employment_date, id_employment_type, id_contract_type, id_pers) VALUES (3, '2003/09/11', 
(SELECT employment_type.id_employment_type FROM employment_type WHERE name = 'Directeur'),(SELECT contract_type.id_contract_type FROM contract_type WHERE name = 'CDI'),
(SELECT person.id_pers FROM person WHERE lastname = 'Leignel' AND firstname = 'Germain' AND email = 'germainleignel@gmail.com'));


INSERT INTO client(id_pers) VALUES (((SELECT person.id_pers FROM person WHERE lastname = 'Barille' AND firstname = 'Thomas' AND email = 'thomasbarille@gmail.com')));
INSERT INTO client(id_pers) VALUES ((SELECT person.id_pers FROM person WHERE lastname = 'Leignel' AND firstname = 'Germain' AND email = 'germainleignel@gmail.com'));
INSERT INTO client(id_pers) VALUES ((SELECT person.id_pers FROM person WHERE lastname = 'Delibes-Houdayer' AND firstname = 'Maximilien' AND email = 'delibesshoudayermaximilien@gmail.com'));

INSERT INTO invoice(code, invoice_date, id_store, id_client) VALUES ('F1000', '2020/10/10', (SELECT store.id_store FROM store WHERE id_store = 1), (SELECT client.id_client FROM client WHERE id_client = 1));  
INSERT INTO invoice(code, invoice_date, id_store, id_client) VALUES ('F1100', '2021/03/19', (SELECT store.id_store FROM store WHERE id_store = 1), (SELECT client.id_client FROM client WHERE id_client = 1));

INSERT INTO invoice_line(description, qte, id_product, id_vat, id_invoice) VALUES ('Facture pour un ensemble de meuble', 2, 
(SELECT product.id_product FROM product WHERE name = 'Smölek' AND price = 89 AND description = 'meuble television'),
(SELECT vat.id_vat FROM vat WHERE rate = 20.00), 
(SELECT invoice.id_invoice FROM invoice WHERE code = 'F1000' AND invoice_date = '2020/10/10'));
INSERT INTO invoice_line(description, qte, id_product, id_vat, id_invoice) VALUES ('Facture pour la lampe Shtemüll', 1, 
(SELECT product.id_product FROM product WHERE name = 'Shtemüll' AND price = 29.90 AND description = 'lampe'),
(SELECT vat.id_vat FROM vat WHERE rate = 10.00), 
(SELECT invoice.id_invoice FROM invoice WHERE code = 'F1100' AND invoice_date = '2021/03/19'));

INSERT INTO orders(code, order_date, id_client) VALUES ('C1000', '2020/09/26', (SELECT client.id_client FROM client WHERE id_client = 2));
INSERT INTO orders(code, order_date, id_client) VALUES ('C1100', '2021/01/10', (SELECT client.id_client FROM client WHERE id_client = 3));
INSERT INTO orders(code, order_date, id_client) VALUES ('C1110', '2022/04/04', (SELECT client.id_client FROM client WHERE id_client = 1));

INSERT INTO order_line(qte, description, id_orders) VALUES (1, 'meuble television', (SELECT orders.id_orders FROM orders WHERE code = 'C1000' AND order_date = '2020/09/26'));
INSERT INTO order_line(qte, description, id_orders) VALUES (1, 'lampe', (SELECT orders.id_orders FROM orders WHERE code = 'C1100' AND order_date = '2021/01/10'));
INSERT INTO order_line(qte, description, id_orders) VALUES (1, 'balai', (SELECT orders.id_orders FROM orders WHERE code = 'C1110' AND order_date = '2022/04/04'));

INSERT INTO quote(code, quote_date, id_orders) VALUES ('D1000', '2019/10/18', (SELECT orders.id_orders FROM orders WHERE code = 'C1000' AND order_date = '2020/09/26'));

INSERT INTO quote_line(description, qte, id_product, id_vat, id_status, id_quote) VALUES ('Devis cuisine', 1, 
(SELECT product.id_product FROM product WHERE name = 'Storgött' AND price = 29.90 AND description = 'Balai'),
(SELECT vat.id_vat FROM vat WHERE rate = 10.00),
(SELECT status.id_status FROM status WHERE id_status = 2),
(SELECT quote.id_quote FROM quote WHERE code = 'D1000' AND quote_date = '2019/10/18'));

INSERT INTO provides(id_service, id_store) VALUES ((SELECT service.id_service FROM service WHERE id_service = 1), (SELECT store.id_store FROM store WHERE id_store = 1));

INSERT INTO sells(id_store, id_pers) VALUES ((SELECT store.id_store FROM store WHERE id_store = 1), (SELECT person.id_pers FROM person WHERE id_pers = 1));

INSERT INTO stores(id_product, id_store) VALUES ((SELECT product.id_product FROM product WHERE id_product = 2), (SELECT store.id_store FROM store WHERE id_store = 1));

INSERT INTO stores(id_product, id_store) VALUES ((SELECT product.id_product FROM product WHERE id_product = 4), (SELECT store.id_store FROM store WHERE id_store = 1));

INSERT INTO belongs(id_adress, id_zip) VALUES ((SELECT adress.id_adress FROM adress WHERE id_adress = 2), (SELECT zip.id_zip FROM zip WHERE id_zip = 1));

INSERT INTO deliver(id_client, id_adress) VALUES ((SELECT client.id_client FROM client WHERE id_client = 1), (SELECT adress.id_adress FROM adress WHERE id_adress = 2));

INSERT INTO factured(id_client, id_adress) VALUES ((SELECT client.id_client FROM client WHERE id_client = 2), (SELECT adress.id_adress FROM adress WHERE id_adress = 2));

INSERT INTO issued(id_client, id_quote) VALUES (( SELECT client.id_client FROM client WHERE id_client = 1), (SELECT quote.id_quote FROM quote WHERE id_quote = 1));