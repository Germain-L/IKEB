use ikeb;
CREATE TABLE stock_status(
    id_stock INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
    name VARCHAR(50),
);
CREATE TABLE shelf(
    id_shelf INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
    number INT,
);
CREATE TABLE price(
    id_price INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    cost MONEY,
)
CREATE TABLE product(
    id_product INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
    name VARCHAR(50),
    price MONEY,
    description VARCHAR(50),
    id_shelf INT,
    id_stock INT NOT NULL,
    id_cost INT,
    FOREIGN KEY(id_stock) REFERENCES stock_status(id_stock),
    FOREIGN KEY(id_cost) REFERENCES price(id_price)
);
CREATE TABLE service(
    id_service INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
    name VARCHAR(50),
);
CREATE TABLE zip(
    id_zip INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
    code VARCHAR(50),
    city VARCHAR(50),
);
CREATE TABLE adress(
    id_adress INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
    adress VARCHAR(50),
    complement VARCHAR(50),
    id_zip INT NOT NULL,
    FOREIGN KEY(id_zip) REFERENCES zip(id_zip)
);
CREATE TABLE vat(
    id_vat INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
    rate DECIMAL(5, 2) NOT NULL,
);
CREATE TABLE status(
    id_status INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
    status VARCHAR(50),
);
CREATE TABLE contract_type(
    id_contract_type INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
    name VARCHAR(50),
);
CREATE TABLE employment_type(
    id_employment_type INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
    name VARCHAR(50),
);
CREATE TABLE store(
    id_store INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
    id_adress INT NOT NULL,
    FOREIGN KEY(id_adress) REFERENCES adress(id_adress)
);
CREATE TABLE person(
    id_pers INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
    lastname VARCHAR(50),
    firstname VARCHAR(50),
    email VARCHAR(255),
    id_adress INT NOT NULL,
    FOREIGN KEY(id_adress) REFERENCES adress(id_adress)
);
CREATE TABLE card(
    id_card INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
    points INT,
    id_pers INT NOT NULL,
    UNIQUE(id_pers),
    FOREIGN KEY(id_pers) REFERENCES person(id_pers)
);
CREATE TABLE employee(
    id_employee INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
    level INT,
    employment_date DATE,
    salary MONEY,
    id_employment_type INT NOT NULL,
    id_contract_type INT NOT NULL,
    id_pers INT NOT NULL,
    UNIQUE(id_pers),
    FOREIGN KEY(id_employment_type) REFERENCES employment_type(id_employment_type),
    FOREIGN KEY(id_contract_type) REFERENCES contract_type(id_contract_type),
    FOREIGN KEY(id_pers) REFERENCES person(id_pers)
);
CREATE TABLE client(
    id_client INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
    id_pers INT NOT NULL,
    UNIQUE(id_pers),
    FOREIGN KEY(id_pers) REFERENCES person(id_pers)
);
CREATE TABLE invoice(
    id_invoice INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
    code VARCHAR(50),
    invoice_date DATE,
    id_store INT NOT NULL,
    id_client INT NOT NULL,
    FOREIGN KEY(id_store) REFERENCES store(id_store),
    FOREIGN KEY(id_client) REFERENCES client(id_client)
);
CREATE TABLE orders(
    id_orders INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
    code VARCHAR(50),
    order_date DATE,
    id_client INT NOT NULL,
    FOREIGN KEY(id_client) REFERENCES client(id_client)
);
CREATE TABLE invoice_line(
    id_invoice_line INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
    description VARCHAR(50),
    qte INT,
    id_product INT NOT NULL,
    id_vat INT NOT NULL,
    id_invoice INT NOT NULL,
    FOREIGN KEY(id_product) REFERENCES product(id_product),
    FOREIGN KEY(id_vat) REFERENCES vat(id_vat),
    FOREIGN KEY(id_invoice) REFERENCES invoice(id_invoice)
);
CREATE TABLE order_line(
    id_order_line INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
    qte INT,
    description VARCHAR(50),
    id_orders INT NOT NULL,
    FOREIGN KEY(id_orders) REFERENCES orders(id_orders)
);
CREATE TABLE quote(
    id_quote INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
    code VARCHAR(50),
    quote_date VARCHAR(50),
    id_orders INT,
    UNIQUE(id_orders),
    FOREIGN KEY(id_orders) REFERENCES orders(id_orders)
);
CREATE TABLE quote_line(
    id_quote_line INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
    description VARCHAR(50),
    qte INT,
    id_product INT NOT NULL,
    id_vat INT NOT NULL,
    id_status INT NOT NULL,
    id_quote INT NOT NULL,
    FOREIGN KEY(id_product) REFERENCES product(id_product),
    FOREIGN KEY(id_vat) REFERENCES vat(id_vat),
    FOREIGN KEY(id_status) REFERENCES status(id_status),
    FOREIGN KEY(id_quote) REFERENCES quote(id_quote)
);
CREATE TABLE provides(
    id_service INT,
    id_store INT,
    PRIMARY KEY(id_service, id_store),
    FOREIGN KEY(id_service) REFERENCES service(id_service),
    FOREIGN KEY(id_store) REFERENCES store(id_store)
);
CREATE TABLE sells(
    id_store INT,
    id_pers INT,
    PRIMARY KEY(id_store, id_pers),
    FOREIGN KEY(id_store) REFERENCES store(id_store),
    FOREIGN KEY(id_pers) REFERENCES person(id_pers)
);
CREATE TABLE stores(
    id_product INT,
    id_store INT,
    PRIMARY KEY(id_product, id_store),
    FOREIGN KEY(id_product) REFERENCES product(id_product),
    FOREIGN KEY(id_store) REFERENCES store(id_store)
);
CREATE TABLE belongs(
    id_adress INT,
    id_zip INT,
    PRIMARY KEY(id_adress, id_zip),
    FOREIGN KEY(id_adress) REFERENCES adress(id_adress),
    FOREIGN KEY(id_zip) REFERENCES zip(id_zip)
);
CREATE TABLE deliver(
    id_client INT,
    id_adress INT,
    PRIMARY KEY(id_client, id_adress),
    FOREIGN KEY(id_client) REFERENCES client(id_client),
    FOREIGN KEY(id_adress) REFERENCES adress(id_adress)
);
CREATE TABLE factured(
    id_client INT,
    id_adress INT,
    PRIMARY KEY(id_client, id_adress),
    FOREIGN KEY(id_client) REFERENCES client(id_client),
    FOREIGN KEY(id_adress) REFERENCES adress(id_adress)
);
CREATE TABLE issued(
    id_client INT,
    id_quote INT,
    PRIMARY KEY(id_client, id_quote),
    FOREIGN KEY(id_client) REFERENCES client(id_client),
    FOREIGN KEY(id_quote) REFERENCES quote(id_quote)
);