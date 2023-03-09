-- creating orders table

CREATE TABLE `orders` (
    `row_id` int  NOT NULL ,
    `order_id` varchar(10)  NOT NULL ,
    `created_at` datetime  NOT NULL ,
    `item_id` varchar(10)  NOT NULL ,
    `quantity` int  NOT NULL ,
    `cust_firstname` varchar(50)  NOT NULL ,
    `cust_lastname` varchar(50)  NOT NULL ,
    `delivery` boolean  NOT NULL ,
    `delivery_address1` varchar(200)  NOT NULL ,
    `delivery_address2` varchar(200)  NOT NULL ,
    `delivery_city` varchar(50)  NOT NULL ,
    `delivery_zipcode` varchar(20)  NOT NULL ,
    PRIMARY KEY (
        `row_id`
    )
);


-- Creating customers table

CREATE TABLE `customers` (
    `cust_id` int  NOT NULL ,
    `cust_firstname` varchar(50)  NOT NULL ,
    `cust_lastname` varchar(50)  NOT NULL ,
    PRIMARY KEY (
        `cust_id`
    )
);

-- Changes in orders table due to normalisation

CREATE TABLE `orders` (
    `row_id` int  NOT NULL ,
    `order_id` varchar(10)  NOT NULL ,
    `created_at` datetime  NOT NULL ,
    `item_id` varchar(10)  NOT NULL ,
    `quantity` int  NOT NULL ,
    `cust_id` int  NOT NULL ,
    `delivery` boolean  NOT NULL ,
    `delivery_address1` varchar(200)  NOT NULL ,
    `delivery_address2` varchar(200)  NOT NULL ,
    `delivery_city` varchar(50)  NOT NULL ,
    `delivery_zipcode` varchar(20)  NOT NULL ,
    PRIMARY KEY (
        `row_id`,`cust_id`
    )
);

-- Specify the relationship between orders and customers table

ALTER TABLE `customers` ADD CONSTRAINT `fk_customers_cust_id` FOREIGN KEY(`cust_id`)
REFERENCES `orders` (`cust_id`);


-- Creating address table

CREATE TABLE `address` (
    `add_id` int  NOT NULL ,
    `delivery_address1` varchar(200)  NOT NULL ,
    `delivery_address2` varchar(200)  NULL ,
    `delivery_city` varchar(50)  NOT NULL ,
    `delivery_zipcode` varchar(20)  NOT NULL ,
    PRIMARY KEY (
        `add_id`
    )
);

-- changes in orders tables again

CREATE TABLE `orders` (
    `row_id` int  NOT NULL ,
    `order_id` varchar(10)  NOT NULL ,
    `created_at` datetime  NOT NULL ,
    `item_id` varchar(10)  NOT NULL ,
    `quantity` int  NOT NULL ,
    `cust_id` int  NOT NULL ,
    `delivery` boolean  NOT NULL ,
    `add_id` int  NOT NULL ,
    PRIMARY KEY (
        `row_id`
    )
);

-- Specify the relationship between orders and addresss table

ALTER TABLE `address` ADD CONSTRAINT `fk_address_add_id` FOREIGN KEY(`add_id`)
REFERENCES `orders` (`add_id`);


-- Creating item table

CREATE TABLE `item` (
    `item_id` varchar(10)  NOT NULL ,
    `sku` varchar(20)  NOT NULL ,
    `item_name` varchar(50)  NOT NULL ,
    `item_cat` varchar(50)  NOT NULL ,
    `item_size` varchar(20)  NOT NULL ,
    `item_price` decimal(5,2)  NOT NULL ,
    PRIMARY KEY (
        `item_id`
    )
);

-- Specify the relationship between orders and item table

ALTER TABLE `item` ADD CONSTRAINT `fk_item_item_id` FOREIGN KEY(`item_id`)
REFERENCES `orders` (`item_id`);


-- Creating ingredient table

CREATE TABLE `ingredient` (
    `ing_id` varchar(10)  NOT NULL ,
    `ing_name` varchar(200)  NOT NULL ,
    `ing_weight` int  NOT NULL ,
    `ing_meas` varchar(20)  NOT NULL ,
    `ing_price` decimal(5,2)  NOT NULL ,
    PRIMARY KEY (
        `ing_id`
    )
);

-- Creating recipe table

CREATE TABLE `recipe` (
    `row_id` int  NOT NULL ,
    `recipe_id` varchar(20)  NOT NULL ,
    `ing_id` varchar(10)  NOT NULL ,
    `quantity` int  NOT NULL ,
    PRIMARY KEY (
        `row_id`
    )
);

-- Specify the relationship between ingredient and recipe table

ALTER TABLE `ingredient` ADD CONSTRAINT `fk_ingredient_ing_id` FOREIGN KEY(`ing_id`)
REFERENCES `recipe` (`ing_id`);

-- Specify the relationship between item and recipe table

ALTER TABLE `recipe` ADD CONSTRAINT `fk_recipe_recipe_id` FOREIGN KEY(`recipe_id`)
REFERENCES `item` (`sku`);


-- Creating inventory table

CREATE TABLE `inventory` (
    `inv_id` int  NOT NULL ,
    `item_id` varchar(10)  NOT NULL ,
    `quantity` int  NOT NULL ,
    PRIMARY KEY (
        `inv_id`
    )
);

-- Specify the relationship between inventory and ingredient table

ALTER TABLE `inventory` ADD CONSTRAINT `fk_inventory_item_id` FOREIGN KEY(`item_id`)
REFERENCES `recipe` (`ing_id`);


-- Creating staff table

CREATE TABLE `staff` (
    `staff_id` varchar(20)  NOT NULL ,
    `first_name` varchar(50)  NOT NULL ,
    `last_name` varchar(50)  NOT NULL ,
    `position` varchar(100)  NOT NULL ,
    `hourly_rate` decimal(5,2)  NOT NULL ,
    PRIMARY KEY (
        `staff_id`
    )
);

-- Creating rota table

CREATE TABLE `rota` (
    `row_id` int  NOT NULL ,
    `rota_id` varchar(20)  NOT NULL ,
    `date` datetime  NOT NULL ,
    `shift_id` varchar(20)  NOT NULL ,
    `staff_id` varchar(20)  NOT NULL ,
    PRIMARY KEY (
        `row_id`
    )
);

-- Creating shift table

CREATE TABLE `shift` (
    `shift_id` varchar(20)  NOT NULL ,
    `day_of_week` varchar(10)  NOT NULL ,
    `start_time` time  NOT NULL ,
    `end_time` time  NOT NULL ,
    PRIMARY KEY (
        `shift_id`
    )
);

-- Specify the relationship between shift and rota table

ALTER TABLE `shift` ADD CONSTRAINT `fk_shift_shift_id` FOREIGN KEY(`shift_id`)
REFERENCES `rota` (`shift_id`);

-- Specify the relationship between staff and rota table

ALTER TABLE `rota` ADD CONSTRAINT `fk_rota_staff_id` FOREIGN KEY(`staff_id`)
REFERENCES `staff` (`staff_id`);

-- Specify the relationship between orders and rota table
ALTER TABLE `rota` ADD CONSTRAINT `fk_rota_date` FOREIGN KEY(`date`)
REFERENCES `orders` (`created_at`);

-- This last one will give us the join we need between these staff tables and the order tables.
