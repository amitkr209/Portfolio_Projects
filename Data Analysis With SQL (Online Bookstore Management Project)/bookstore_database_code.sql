/**************************************************************
/***************************************************************/

#book side
DROP DATABASE IF EXISTS `book_data`;
CREATE DATABASE `book_data`;
USE `book_data`;

SET NAMES utf8;
SET character_set_client = utf8mb4;

CREATE TABLE `publisher` (
	`publisher_id` int (11) NOT NULL AUTO_INCREMENT,
    `name` VARCHAR (50) NOT NULL,
    PRIMARY KEY (`publisher_id`)
  ) ENGINE=innoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
  
CREATE TABLE `book_category` (
	`category_id` int(2) NOT NULL AUTO_INCREMENT,
    `name` VARCHAR (50) NOT NULL,
    PRIMARY KEY (`category_id`)
 )ENGINE=innoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
  
  CREATE TABLE `genre` (
	`genre_id` int(4) NOT NULL AUTO_INCREMENT,
    `category_id` int(2) NOT NULL,
    `name` VARCHAR (50) NOT NULL,
    PRIMARY KEY (genre_id),
    KEY `fk_category_id` (`category_id`),
    CONSTRAINT `fk_category_id` FOREIGN KEY (`category_id`) REFERENCES `book_category` (`category_id`) ON DELETE RESTRICT ON UPDATE CASCADE
 )ENGINE=innoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
 
CREATE TABLE `book_info` ( 
	`book_id` int(11) NOT NULL AUTO_INCREMENT,
    `book_name` VARCHAR (255) NOT NULL,
    `author` VARCHAR (50) NOT NULL,
    `publisher_id` int(4) NULL,
    `publication_date` date DEFAULT NULL, 
    `ISBN` VARCHAR (50) DEFAULT NULL,
    `edition` VARCHAR(50) DEFAULT NULL,
    `number_of_pages` int(4) DEFAULT NULL,
    `price_IDR` decimal(9,3) DEFAULT NULL,
    `genre_id` int(4) DEFAULT NULL,
	PRIMARY KEY (`book_id`),
	KEY `fk_publisher_id` (`publisher_id`),
    KEY `fk_genre_id` (`genre_id`),
    CONSTRAINT `fk_publisher_id` FOREIGN KEY (`publisher_id`) REFERENCES `publisher` (`publisher_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT `fk_genre_id` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`genre_id`) ON DELETE RESTRICT ON UPDATE CASCADE
  ) ENGINE=innoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
  
INSERT INTO `publisher` VALUES (1, 'gramedia');
INSERT INTO `publisher` VALUES (2, 'bentang_pustaka');
INSERT INTO `publisher` VALUES (3, 'deepublish');
INSERT INTO `publisher` VALUES (4, 'mizan_pustaka');
INSERT INTO `publisher` VALUES (5, 'penerbit_erlangga');
INSERT INTO `publisher` VALUES (6, 'penerbit_republika');
INSERT INTO `publisher` VALUES (7, 'yudhistira');
INSERT INTO `publisher` VALUES (8, 'penguin_random_house');
INSERT INTO `publisher` VALUES (9, 'penguin_classic');
INSERT INTO `publisher` VALUES (10, 'baca');
INSERT INTO `publisher` VALUES (11, 'harper_perennial');
INSERT INTO `publisher` VALUES (12, 'random_house_USA');
INSERT INTO `publisher` VALUES (13, 'PLATA_publishing');
INSERT INTO `publisher` VALUES (14, 'Farrar, Straus and Giroux');
INSERT INTO `publisher` VALUES (15, 'Thought Catalog');
INSERT INTO `publisher` VALUES (16, 'Knopf Doubleday Publishing Group');
INSERT INTO `publisher` VALUES (17, 'Simon & Schuster Ltd');
INSERT INTO `publisher` VALUES (18, 'Pocket Books');
INSERT INTO `publisher` VALUES (19, 'Penguin_Books');
INSERT INTO `publisher` VALUES (20, 'Thought Catalog');
INSERT INTO `publisher` VALUES (21, 'Bloomsbury Publishing PLC');
INSERT INTO `publisher` VALUES (22, 'HARPER');
INSERT INTO `publisher` VALUES (23, 'Anchor_books');
INSERT INTO `publisher` VALUES (24, 'pan_macmillan');
INSERT INTO `publisher` VALUES (25, 'Random_House_UK');
INSERT INTO `publisher` VALUES (26, 'Random_House_publishing_group');
INSERT INTO `publisher` VALUES (27, 'Ebury_publishing');
INSERT INTO `publisher` VALUES (28, 'Naulit_Inc');
INSERT INTO `publisher` VALUES (29, 'Thomas_Nelson_publisher');
INSERT INTO `publisher` VALUES (30, 'Little, Brown Book Group');
INSERT INTO `publisher` VALUES (31, 'faber');

INSERT INTO `book_category` VALUES (DEFAULT, 'Fiction');
INSERT INTO `book_category` VALUES (DEFAULT, 'Non Fiction');

INSERT INTO `genre` VALUES (1, 1, 'Classics');
INSERT INTO `genre` VALUES (2, 1, 'Action and Adventure');
INSERT INTO `genre` VALUES (3, 2, 'Self Development');
INSERT INTO `genre` VALUES (4, 1, 'Sci-fi');
INSERT INTO `genre` VALUES (5, 1, 'Fiction Romance');
INSERT INTO `genre` VALUES (6, 2, 'History');
INSERT INTO `genre` VALUES (7, 2, 'Philosopy');
INSERT INTO `genre` VALUES (8, 2, 'Law');
INSERT INTO `genre` VALUES (9, 1, 'Literary Fiction');
INSERT INTO `genre` VALUES (10, 1, 'Thriller');
INSERT INTO `genre` VALUES (11, 1, 'Detective and Mystery');
INSERT INTO `genre` VALUES (12, 1, 'Fantasy');
INSERT INTO `genre` VALUES (13, 1, 'Horror');
INSERT INTO `genre` VALUES (14, 1, 'Fantasy');
INSERT INTO `genre` VALUES (15, 1, 'Dystopian');
INSERT INTO `genre` VALUES (16, 1, 'Realist Literature');
INSERT INTO `genre` VALUES (17, 1, 'Magical Realism');
INSERT INTO `genre` VALUES (18, 2, 'Finance');
INSERT INTO `genre` VALUES (19, 2, 'Memoir');
INSERT INTO `genre` VALUES (20, 2, 'Biography');

INSERT INTO `book_info` VALUES (DEFAULT, 'atomic_habit', 'james_clear', 1, NULL, NULL, 'international', NULL, 70.000, 3);
INSERT INTO `book_info` VALUES (DEFAULT, 'the_subtle_art_of not_gaf', 'mark_manson', 1, NULL, NULL, 'local', '237', 67.000, 3);
INSERT INTO `book_info` VALUES (DEFAULT, 'the_thing_you_can_see_only_when_you_slow_down', 'haemin_sunim', 8, '2018-02-08', '978-0-241-34066-0', '2018 edition', 265, 190.000, 3);
INSERT INTO `book_info` VALUES (DEFAULT, 'the_psychology_of_money', 'morgan_housel', 10, NULL, '978-602-6486-57-8', 'terjemahan', 256, 75.000, 3);
INSERT INTO `book_info` VALUES (DEFAULT, 'sapiens', 'yuval_noah_harrari', 11, NULL, '978-009-9590-08-8', 'import', 464, 225.000, 6);
INSERT INTO `book_info` VALUES (DEFAULT, 'norwegian_wood', 'haruki_murakami', 12, '2011-04-28', '978-030-7744-66-1', 'statement_international', 400, 118.000, NULL);
INSERT INTO `book_info` VALUES (DEFAULT, 'The Visual MBA : A Quick Guide to Everything Youll Learn in Two Years of Business School', 'Jason Barron', 18, '2019-05-02', '978-024-1386-68-2', NULL, 208, 320.000, 3);
INSERT INTO `book_info` VALUES (DEFAULT, '1984', 'George Orwell', NULL, NULL, '978-045-1524-93-5', NULL, NULL, 146.000, 15);
INSERT INTO `book_info` VALUES (DEFAULT, 'Rich Dad Poor Dad', 'Kiyosaki_Robert T', 13, NULL, '978-161-2680-19-4', 'Mass Market Paperbound', NULL, 149.000, 3);
INSERT INTO `book_info` VALUES (DEFAULT, 'Thinking, Fast and Slow', 'Kahneman_Daniel', 14, NULL, '978-037-4533-55-7', NULL, 499, 315.000, 3);
INSERT INTO `book_info` VALUES (DEFAULT, '101 Essays That Will Change The Way You Think', 'Brianna Wiest', 15, NULL, NULL, 'imported', 472, 232.000, 3);
INSERT INTO `book_info` VALUES (DEFAULT, 'Tuesdays with Morrie', 'Albom Mitch ', 16, '1998-12-29', '978-038-5496-49-0', NULL, 208, 126.000, 3);
INSERT INTO `book_info` VALUES (DEFAULT, 'It Ends with Us', 'Hoover', 17, '2016-08-02', '978-147-1156-26-7', 'Statement Paperback Original', 384, 204.000, 10);
INSERT INTO `book_info` VALUES (DEFAULT, 'How to Win Friends & Influence People', 'Carnegie_Dale', 18, NULL, '978-143-9199-19-0', NULL, NULL, 149.000, 3);
INSERT INTO `book_info` VALUES (DEFAULT, 'the_thing_you_can_see_only_when_you_slow_down', 'haemin_sunim', 19, '2017-02-07', '978-014-3130-77-2', 'Hardcover edition', 288, 210.000, 3);
INSERT INTO `book_info` VALUES (DEFAULT, 'Love for Imperfect Things: How to Accept Yourself in a World Striving for Perfection', 'haemin_sunim', 19, '2018-12-24', '978-014-3132-28-8', NULL, NULL, 189.000, 3);
INSERT INTO `book_info` VALUES (DEFAULT, 'The Alchemist 25th Anniversary: A Fable About Following Your Dream', 'Paulo Coelho', 22, '2014-04-15', '9780062355300', NULL, NULL, 136.000, 12);
INSERT INTO `book_info` VALUES (DEFAULT, 'The Song of Achilles', 'Miller Madeline', 21, '2017-09-21', '9781408891384', 'Bloomsbury Modern Classics Binding', 368, 198.000, 12);
INSERT INTO `book_info` VALUES (DEFAULT, 'Dune', 'Frank Herbert', 19, '2011-07-15', '9780441172719', 'Statement Premium', 896, 155.000, 4);
INSERT INTO `book_info` VALUES (DEFAULT, 'The Art of Thinking Clearly', 'Rolf Dobelli', 14, '2014-05-06', '9780062343963', 'International Edition', 384, 136.000, 3);
INSERT INTO `book_info` VALUES (DEFAULT, 'Midnight Library', 'Matt_Haig', 19, '2020-09-29', '9780525559474', NULL, 304, 221.000, 14);
INSERT INTO `book_info` VALUES (DEFAULT, 'A Little Life', 'Yanagihara_Hanya', 23, '2016-01-26', '9780804172707', 'Paperback', 832, 189.000, null);
INSERT INTO `book_info` VALUES (DEFAULT, 'A Little Life : Shortlisted for the Man Booker Prize 2015 Binding', 'Yanagihara_Hanya', 24, NULL, '9781447294832', 'pan_pacmillan', 736, 172.000, null);
INSERT INTO `book_info` VALUES (DEFAULT, 'They Both Die at the End', 'Silvera_Adam', 22, '2018-12-18', '9780062457806', NULL, 400, 210.000, 12);
INSERT INTO `book_info` VALUES (DEFAULT, 'he Courage To Be Disliked', 'Ichiro Kishimi_Fumitake Koga Share', NULL, '2019-07-23', '9781760630737', 'Statement Main', 288, 221.000, 3);
INSERT INTO `book_info` VALUES (DEFAULT, 'Midnight Library', 'Matt_Haig', NULL, '2021-02-18', '9781786892737', 'Statement Main', 304, 208.000, 14);
INSERT INTO `book_info` VALUES (DEFAULT, 'Before the Coffee Gets Cold', 'Toshikazu_Kawaguchi', 24, '2019-09-19', '9781529029581', NULL, 224, 224.000, 17);
INSERT INTO `book_info` VALUES (DEFAULT, 'The Intelligent Investor : The Definitive Book on Value Investing', 'Benjamin Graham', 22, '2003-10-23', '9780060555665', 'Annotated', 640, 318.000, 3);
INSERT INTO `book_info` VALUES (DEFAULT, 'The Lean Startup', 'Eric Ries', 12, NULL , '9781524762407', NULL, NULL, 189.000, 3);
INSERT INTO `book_info` VALUES (DEFAULT, '12 Rules for Life : An Antidote to Chaos', 'Jordan B. Peterson', NULL, '2019-04-30', '9780735278516', NULL, 528, 214.000, 3);
INSERT INTO `book_info` VALUES (DEFAULT, 'People We Meet on Vacation', 'Emily_Henry', 8, '2021-05-11', '9781984806758', NULL, 384, 159.000, 2);
INSERT INTO `book_info` VALUES (DEFAULT, 'Educated', 'Tara Westover', 19, '2018-10-30', '9781984854858', NULL, NULL, 175.000, 19);
INSERT INTO `book_info` VALUES (DEFAULT, 'Never Split the Difference : Negotiating as If Your Life Depended on It', 'Chris Voss, Tahl Raz', 19, '2018-06-05', '9780062872302', NULL, 304, 136.000, 3);
INSERT INTO `book_info` VALUES (DEFAULT, 'Range', 'David Epstein', NULL, NULL, '9781509843527', NULL, NULL, 140.000, 3);
INSERT INTO `book_info` VALUES (DEFAULT, 'Ikigai', 'Héctor García and Francesc Miralles', 25, '2017-09-27', '978-602-1201-80-0', NULL, 208, 257.000, 3);
INSERT INTO `book_info` VALUES (DEFAULT, 'Harry Potter and the Philosophers Stone', 'JK.Rowling', 21, '2014-09-01', '9781408855652', NULL, 352, 160.000, 4);
INSERT INTO `book_info` VALUES (DEFAULT, 'When Breath Becomes Air', 'Paul_Kalanithi', 26, '2018-12-31', '9781984801821', NULL, 256, 130.000, 20);
INSERT INTO `book_info` VALUES (DEFAULT, 'To Kill a Mockingbird', 'Harper_Lee', NULL, NULL, '9780446310789', NULL, NULL, 149.000, 4);
INSERT INTO `book_info` VALUES (DEFAULT, 'Chainsaw Man 3', 'Tatsuki_Fujimoto', NUll, NULL, '9781974709953', NULL, NULL, 168.000, 4);
INSERT INTO `book_info` VALUES (DEFAULT, 'Book You Wish Your Parents Had Read', 'Philippa_Perry', 19, '2021-01-01', '978-024-1251-02-7', NULL, 272, 215.000, 3);
INSERT INTO `book_info` VALUES (DEFAULT, 'How to Win Friends and Influence People', 'Dale_Carnegie', 27, '2004-10-01', '9780091906351', NULL, 204, 143.000, 3);
INSERT INTO `book_info` VALUES (DEFAULT, 'Secrets of Divine Love', 'A_Helwa', 28, '2020-03-20', '9781734231205', NULL, 386, 432.000, 3);
INSERT INTO `book_info` VALUES (DEFAULT, 'Chainsaw Man 6', 'Tatsuki_Fujimoto', NUll, NULL, '9781974720712', NULL, NULL, 168.000, 13);
INSERT INTO `book_info` VALUES (DEFAULT, 'Building A Story Brand', 'Miller, Donald', 29, '2017-11-16', '9781400201839', NULL, 240, 265.0000, 3);
INSERT INTO `book_info` VALUES (DEFAULT, 'Mindset_Changing The Way You think To Fulfil Your Potential', 'DR Carol S. Dwek', 30, '2017-04-11', '9781472139955', 'Updated_edition', 320, 216.000, 3);
INSERT INTO `book_info` VALUES (DEFAULT, 'Circle', 'unknown_writer', NULL, '2019-04-10', '9781526610140', NULL, NULL, 147.000, 3);
INSERT INTO `book_info` VALUES (DEFAULT, 'Normal People', 'Sally_Rooney', 31, '2019-05-02', '9780571334650', NULL, 288, 193.000, 5);
INSERT INTO `book_info` VALUES (DEFAULT, 'Chainsaw Man, Vol. 8', 'Tatsuki_Fujimoto', NULL, '2022-02-03', '9781974722785',NULL, 192, 168.000, 13);
INSERT INTO `book_info` VALUES (DEFAULT, 'Chainsaw Man, Vol. 9', 'Tatsuki_Fujimoto', NULL, '2022-03-03', '9781974724048', NULL, 192, 158.000, 13);
INSERT INTO `book_info` VALUES (DEFAULT, 'Chainsaw Man 4', 'Tatsuki_Fujimoto', NULL, '2022-05-13', '9781974717279',NULL, 192, 168.000, 13);
INSERT INTO `book_info` VALUES (DEFAULT, 'The Making of a Manager : What to Do When Everyone Loo', 'Zhuo, Julie', 19, '2019-03-19', '9780525540427', NULL, NULL, 248.000, 3);
INSERT INTO `book_info` VALUES (DEFAULT, 'How To Be A Stoic', 'Pigliucci, Massimo', 27, '2017-05-04', '9781846045073', NULL, 288, 282.000, 3);
INSERT INTO `book_info` VALUES (DEFAULT, 'Chainsaw Man 2', 'Tatsuki_Fujimoto', NULL, '2020-12-24', '9781974709946', NULL, 192, 168.000, 13);
INSERT INTO `book_info` VALUES (DEFAULT, 'Chainsaw Man 7', 'Tatsuki_Fujimoto', NULL, '2021-12-09', '9781974720965', NULL, 200, 158.000, 13);
INSERT INTO `book_info` VALUES (DEFAULT, 'RADICAL CANDOR', 'SCOTT, KIM', 24, '2019-09-01', '9781250258403', NULL, NULL, 149.000, 2);

# sales side
CREATE TABLE `Customers` (
	`customer_id` INT NOT NULL AUTO_INCREMENT,
    `fist_name` VARCHAR (50) NOT NULL,
    `last_name` VARCHAR (50) DEFAULT NULL, 
    `sex` VARCHAR (50) DEFAULT NULL,
    `city` VARCHAR (50) DEFAULT NULL,
    `province` VARCHAR (50) DEFAULT NULL, 
    `phone` VARCHAR (50) DEFAULT NULL,
	`points` INT (11) DEFAULT 0,
    PRIMARY KEY (`customer_id`)
) ENGINE=innodb DEFAULT CHARSET= utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Shippers` (
	`shipper_id` INT (4) NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`shipper_id`)
) ENGINE=innodb DEFAULT CHARSET= utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Order_statuses` (
	`order_status_id` int(4) NOT NULL AUTO_INCREMENT,
    `status` VARCHAR (50) NOT NULL,
    PRIMARY KEY (`order_status_id`)
) ENGINE=innodb DEFAULT CHARSET= utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Orders` (
	`order_id` INT NOT NULL AUTO_INCREMENT,
    `customer_id` INT NOT NULL,
    `order_date` DATE NOT NULL,
    `status` INT (4) NOT NULL,
    `comments` VARCHAR (255) DEFAULT NULL,
    `shipped_date` DATE DEFAULT NULL,
    `shipper_id` int (4) DEFAULT NULL,
    PRIMARY KEY (`order_id`),
	KEY `fk_orders_customers_idx` (`customer_id`),
	KEY `fk_orders_shippers_idx` (`shipper_id`),
	KEY `fk_orders_order_statuses_idx` (`status`),
	CONSTRAINT `fk_orders_customers` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON UPDATE CASCADE,
	CONSTRAINT `fk_orders_order_statuses` FOREIGN KEY (`status`) REFERENCES `order_statuses` (`order_status_id`) ON UPDATE CASCADE,
	CONSTRAINT `fk_orders_shippers` FOREIGN KEY (`shipper_id`) REFERENCES `shippers` (`shipper_id`) ON UPDATE CASCADE
 ) ENGINE=innodb DEFAULT CHARSET= utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
 
CREATE TABLE `Order_items` (
	`order_id` INT NOT NULL AUTO_INCREMENT,
    `product_id` INT (11) NOT NULL,
    `quantity` INT (11) NOT NULL,
    `unit_price` DECIMAL (9,3) NOT NULL,
	PRIMARY KEY (`order_id`, `product_id`),
    KEY `fk_order_items_products_idx` (`product_id`),
	CONSTRAINT `fk_order_items_orders` FOREIGN KEY (`order_id`) REFERENCES `Orders` (`order_id`) ON UPDATE CASCADE,
	CONSTRAINT `fk_order_items_products` FOREIGN KEY (`product_id`) REFERENCES `book_info` (`book_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/* in sales_data.Order_items table, product_id column is equal to book_id column in book_data.book_info, 
which means the value of product_id column is the id of existing book ****/

INSERT INTO `Shippers` VALUES (DEFAULT, 'JNE');
INSERT INTO `Shippers` VALUES (DEFAULT, 'TIKI');
INSERT INTO `Shippers` VALUES (DEFAULT, 'SICEPAT');
INSERT INTO `Shippers` VALUES (DEFAULT, 'CARGO');
INSERT INTO `Shippers` VALUES (DEFAULT, 'GOJEK');
INSERT INTO `Shippers` VALUES (DEFAULT, 'GRAB');

INSERT INTO `Order_statuses` VALUES (1, 'processed');
INSERT INTO `Order_statuses` VALUES (2, 'shipped');
INSERT INTO `Order_statuses` VALUES (3, 'deliverred');

INSERT INTO `Customers` VALUES (DEFAULT, 'Imam', 'Abizar', 'male', 'Depok', 'Jawa Barat', '0898-9431-515', 100);
INSERT INTO `Customers` VALUES (DEFAULT, 'Ali', 'Imran', 'male', 'Dago', 'Bandung', '0812-9332-515', 125);
INSERT INTO `Customers` VALUES (DEFAULT, 'Sarah', 'Hari', 'female', 'Cijantung', 'Jakarta', '0838-1345-127', 1000);
INSERT INTO `Customers` VALUES (DEFAULT, 'Rendy', 'alam', 'male', 'Ciracas', 'Jakarta', '0818-2654-546', 200);
INSERT INTO `Customers` VALUES (DEFAULT, 'Jihan', 'Imaliana', 'female', 'Depok', 'Jawa Barat', '0812-1232-333', 600);
INSERT INTO `Customers` VALUES (DEFAULT, 'Oji', DEFAULT, 'male', 'Depok', 'Jawa Barat', '0821-4563-645', 350);
INSERT INTO `Customers` VALUES (DEFAULT, 'Kirana', 'Abizar', 'female', 'Depok', 'Jawa Barat', '0813-1321-918', 125);
INSERT INTO `Customers` VALUES (DEFAULT, 'Endah', 'Mayang', 'female', 'Malioboro', 'DIY', '0818-6354-123', DEFAULT);
INSERT INTO `Customers` VALUES (DEFAULT, 'Suti', 'Tejo', 'female', 'Bogor', 'Jawa Barat', '0813-2386-767', DEFAULT);
INSERT INTO `Customers` VALUES (DEFAULT, 'Bobby', DEFAULT, 'male', 'Depok', 'Jawa Barat', '0838-0871-767', 50);
INSERT INTO `Customers` VALUES (DEFAULT, 'mikke', 'kharismawati', 'female', 'Kalisari', 'Depok', '0818-9423-1428', DEFAULT);
INSERT INTO `Customers` VALUES (DEFAULT, 'Kiran', 'Haina', 'female', 'Sudirman', 'Jakarta', '0812-0784-1523', 120);
INSERT INTO `Customers` VALUES (DEFAULT, 'Imade', 'Irawan', 'male', 'Braga', 'Bali', '0838-9123-2154', 250);
INSERT INTO `Customers` VALUES (DEFAULT, 'Kinan', 'Hermawan', 'female', 'Kalideres', 'Jakarta', '0818-8796-1425', 900);
INSERT INTO `Customers` VALUES (DEFAULT, 'Edna', DEFAULT, 'female', 'Sate', 'Bandung', '0898-1792-1836', DEFAULT);
INSERT INTO `Customers` VALUES (DEFAULT, 'Marisa', 'anna', 'female', 'Kramat Jati', 'Jakarta', '0818-4131-1845', 235);
INSERT INTO `Customers` VALUES (DEFAULT, 'Evelyn', 'Carragher', 'female', 'Depok', 'Jawa Barat', '0838-9831-2535', DEFAULT);
INSERT INTO `Customers` VALUES (DEFAULT, 'Keenan', 'Meranti', 'female', 'Majalengka', 'Jawa Barat', '0898-9141-850', 190);
INSERT INTO `Customers` VALUES (DEFAULT, 'Sunjaya', 'Wardoyo', 'male', 'Lamongan', 'Jawa Tengah', '0898-1745-123', 900);
INSERT INTO `Customers` VALUES (DEFAULT, 'Emmanuel', 'Raharja', 'male', 'Condet', 'Jakarta', '0812-6243-742', DEFAULT);
INSERT INTO `Customers` VALUES (DEFAULT, 'johnny', 'Bondo', 'male', 'Kebayoran Lama', 'Jakarta', '0838-9271-2749', 800);
INSERT INTO `Customers` VALUES (DEFAULT, 'Yusuf', 'Mayada', 'male', 'Depok', 'Jawa Barat', '0898-9431-5412', DEFAULT);
INSERT INTO `Customers` VALUES (DEFAULT, 'Hambali', 'Dzulkarnain', 'male', 'Banten', 'Jawa Barat', '0898-9431-1215', 235);
INSERT INTO `Customers` VALUES (DEFAULT, 'Irman', 'Ajiri', 'male', 'Sukmajaya', 'Jawa Barat', '0898-9431-5889', 100);
INSERT INTO `Customers` VALUES (DEFAULT, 'Vannesa', 'Kurnia', 'female', 'Grogol', 'Jakarta', '0812-2531-7777', DEFAULT);
INSERT INTO `Customers` VALUES (DEFAULT, 'Nidda', 'Safitri', 'female', 'Bintaro', 'Tangerang', '0898-9242-5674', 875);
INSERT INTO `Customers` VALUES (DEFAULT, 'Ommar', 'Sungkan', 'male', 'Condet', 'Jakarta', '0812-3577-3462', 250);
INSERT INTO `Customers` VALUES (DEFAULT, 'Jessica', 'Tabu', 'female', 'Cibubur', 'Jakarta', '0898-9563-1242', DEFAULT);
INSERT INTO `Customers` VALUES (DEFAULT, 'Obed', DEFAULT, 'male', 'Depok', 'Jawa Barat', '0813-9242-9657', DEFAULT);
INSERT INTO `Customers` VALUES (DEFAULT, 'Nabilla', 'Ayu', 'female', 'Lembang', 'Bandung', '0898-9142-4574', 500);
INSERT INTO `Customers` VALUES (DEFAULT, 'Frisda', 'Bulan', 'female', 'Sudimara', 'Jakarta', '0838-9675-2522', 2342);
INSERT INTO `Customers` VALUES (DEFAULT, 'Ajeng', 'Hararyo', 'female', 'Toraja', 'Sulawesi', '0898-4632-8656', 565);
INSERT INTO `Customers` VALUES (DEFAULT, 'Kemal', 'Saputra', 'male', 'Malang', 'Jawa Timur', '0898-9341-5875', 660);
INSERT INTO `Customers` VALUES (DEFAULT, 'Bagas', 'Kusumo', 'male', 'Bogor', 'Jawa Barat', '0898-9567-5767', DEFAULT);
INSERT INTO `Customers` VALUES (DEFAULT, 'Faras', 'Maharani', 'male', 'Tanjung Sari', 'Bogor', '0898-7353-5352', 625);
INSERT INTO `Customers` VALUES (DEFAULT, 'Haekal', 'Tristan', 'male', 'Banjarnegara', 'Jawa Tengah', '0898-9431-515', 130);
INSERT INTO `Customers` VALUES (DEFAULT, 'Ibnu', 'Bagus', 'male', 'Boyolali', 'Jawa Tengah', '0898-0389-234', 300);
INSERT INTO `Customers` VALUES (DEFAULT, 'Rayhan', 'Amaniyar', 'male', 'Condet', 'Jakarta', '0898-7635-234', 890);
INSERT INTO `Customers` VALUES (DEFAULT, 'Dika', 'Mahendra', 'male', 'Pasar Minggu', 'Jakarta', '0898-4239-221', DEFAULT);
INSERT INTO `Customers` VALUES (DEFAULT, 'Andika', 'Masbula', 'male', 'Karanganyar', 'Jawa Tengah', '0898-5386-234', 450);
INSERT INTO `Customers` VALUES (DEFAULT, 'Aji', 'Asgar', 'male', 'Jepara', 'Jawa Tengah', '0898-8473-222', DEFAULT);
INSERT INTO `Customers` VALUES (DEFAULT, 'Kuncoro', 'Situmeyang', 'female', 'Malioboro', 'DIY', '0818-1212-911', DEFAULT);
INSERT INTO `Customers` VALUES (DEFAULT, 'Dimas', 'Bagustyo', 'male', 'Bandung', 'Jawa Barat', '0898-1232-355', 500);
INSERT INTO `Customers` VALUES (DEFAULT, 'Adnan', 'Malibu', 'male', 'Pandawa', 'Bali', '0898-1265-1502', DEFAULT);
INSERT INTO `Customers` VALUES (DEFAULT, 'Kinara', 'Larasati', 'female', 'Pasar Minggu', 'Jakarta', '0812-9142-1425', 750);
INSERT INTO `Customers` VALUES (DEFAULT, 'Puji', 'Madiya', 'female', 'Cengkareng', 'Jawa Barat', '0821-1424-8963', 20);
INSERT INTO `Customers` VALUES (DEFAULT, 'Septian', 'Yuda', 'male', 'Cijeruk', 'Bogor', '0898-0239-142', 500);
INSERT INTO `Customers` VALUES (DEFAULT, 'Dimas', 'Pradana', 'male', 'Batu', 'Malang', '0818-4111-1023', 10);
INSERT INTO `Customers` VALUES (DEFAULT, 'Hari', 'Alvian', 'male', 'Depok', 'Jawa Barat', '0812-0184-999', 453);
INSERT INTO `Customers` VALUES (DEFAULT, 'Alvian', 'Kurnianto', 'male', 'Bandung', 'Depok', '0898-7650-000', 550);
INSERT INTO `Customers` VALUES (DEFAULT, 'Malibu', 'Carana', 'female', 'Bekasi', 'Jawa Barat', '0898-9431-515', 780);
INSERT INTO `Customers` VALUES (DEFAULT, 'Reyhan', 'Kondo', 'male', 'Bandung', 'Jawa Barat', '0818-4824-857', DEFAULT);
INSERT INTO `Customers` VALUES (DEFAULT, 'Casidi', 'Bintang', 'male', 'Bintaro', 'Tangerang', '0828-6785-152', DEFAULT);
INSERT INTO `Customers` VALUES (DEFAULT, 'Jasmine', 'Bintang', 'female', 'Bintaro', 'Tangerang', '0812-1342-1235', DEFAULT);
INSERT INTO `Customers` VALUES (DEFAULT, 'Edi', 'Sutrisna', 'female', 'Bogor', 'Jawa Barat', '0828-083-555', DEFAULT);
INSERT INTO `Customers` VALUES (DEFAULT, 'Budi', 'Kharisma', 'male', 'Tasikmalaya', 'Jawa Barat', '0818-9854-505', DEFAULT);
INSERT INTO `Customers` VALUES (DEFAULT, 'Jaki', 'Ahsan', 'female', 'Cimahi', 'Sukabumi', '0898-6521-126', DEFAULT);
INSERT INTO `Customers` VALUES (DEFAULT, 'Hanni', 'Amanda', 'female', 'Subang', 'Jawa Barat', '0898-5255-121', DEFAULT);
INSERT INTO `Customers` VALUES (DEFAULT, 'Hanny', 'Lazuardi', 'female', 'Pekalongan', 'Jawa Tengah', '0898-9999-145', DEFAULT);
INSERT INTO `Customers` VALUES (DEFAULT, 'Aburizal', 'Kue', 'male', 'Magelang', 'Jawa Tengah', '0898-4244-888', DEFAULT);
INSERT INTO `Customers` VALUES (DEFAULT, 'Gege', 'Sintang', 'female', 'Demak', 'Jawa Tengah', '0898-2745-890', 245);
INSERT INTO `Customers` VALUES (DEFAULT, 'Kiki', DEFAULT, 'female', 'Depok', 'Jawa Barat', '0898-7775-900', 450);
INSERT INTO `Customers` VALUES (DEFAULT, 'Karen', DEFAULT, 'female', 'Kelapa Gading', 'Jakarta', '0898-8961-5054', 525);
INSERT INTO `Customers` VALUES (DEFAULT, 'Josephine', 'Deillete', 'female', 'Menteng', 'Jakarta', '0812-2849-5228', 500);
INSERT INTO `Customers` VALUES (DEFAULT, 'Raisa', 'Hairani', 'female', 'Kebon Jeruk', 'Jakarta', '0898-9431-124', 750);
INSERT INTO `Customers` VALUES (DEFAULT, 'Ambun', DEFAULT, 'male', 'Jagakarsa', 'Jakarta', '0812-0765-0289', DEFAULT);
INSERT INTO `Customers` VALUES (DEFAULT, 'Dania', 'Salsabila', 'female', 'Kebayoran Baru', 'Jakarta', '0821-8537-0555', 6700);
INSERT INTO `Customers` VALUES (DEFAULT, 'Huda', 'Nova', 'male', 'Rajek', 'Bogor', '0812-9214-1325', 700);
INSERT INTO `Customers` VALUES (DEFAULT, 'Topan', 'Mahmud', 'male', 'Rangkas', 'Banten', '0812-1242-1432', 330);
INSERT INTO `Customers` VALUES (DEFAULT, 'Akim', 'Sulaiman', 'male', 'Kasablanka', 'Jakarta', '0812-2352-0888', 232);
INSERT INTO `Customers` VALUES (DEFAULT, 'Fadli', 'Ramdan', 'male', 'Tebet', 'Jakarta', '0812-1742-1089', DEFAULT);
INSERT INTO `Customers` VALUES (DEFAULT, 'Fadilla', DEFAULT, 'male', 'Kemang', 'Jakarta', '0821-3424-9871', 3543);
INSERT INTO `Customers` VALUES (DEFAULT, 'Fadila', 'Gina', 'male', 'Bojongsari', 'Depok', '0821-1425-3433', DEFAULT);
INSERT INTO `Customers` VALUES (DEFAULT, 'Genny', 'Malaka', 'female', 'Kemang', 'Jakarta', '0818-1999-2109', DEFAULT);
INSERT INTO `Customers` VALUES (DEFAULT, 'Ammar', 'sundana', 'male', 'Bandung', 'Jawa Barat', '0898-9888-320', DEFAULT);
INSERT INTO `Customers` VALUES (DEFAULT, 'Pandji', 'Sinaga', 'male', 'Aceh', 'Sumatra Utara', '0812-7829-9102', DEFAULT);
INSERT INTO `Customers` VALUES (DEFAULT, 'Fikri', 'Ramadani', 'male', 'Serang', 'Banten', '0821-9384-0243', 85);
INSERT INTO `Customers` VALUES (DEFAULT, 'Toni', 'marja', 'male', 'tegal', 'Jawa Tengah', '0818-7914-1624', DEFAULT);
INSERT INTO `Customers` VALUES (DEFAULT, 'Hanum', 'Ardian', 'male', 'Cikarang', 'Bekasi', '0821-9345-2415', DEFAULT);
INSERT INTO `Customers` VALUES (DEFAULT, 'alfat', 'Sinaga', 'male', 'Toraja', 'Sulawesi Selatan', '0818-9342-2242', DEFAULT);
INSERT INTO `Customers` VALUES (DEFAULT, 'Kinan', 'Abu', 'male', 'Condet', 'Jakarta', '0898-9625-515', DEFAULT);
INSERT INTO `Customers` VALUES (DEFAULT, 'Winata', 'Chandra', 'male', 'Menteng', 'Jakarta', '0822-2745-9763', DEFAULT);
INSERT INTO `Customers` VALUES (DEFAULT, 'Hainan', 'Malaga', 'male', 'Kediri', 'Jawa Timur', '0898-9431-2343', DEFAULT);
INSERT INTO `Customers` VALUES (DEFAULT, 'Shanum', 'Maria', 'female', 'Summarecon', 'Bekasi', '0821-4423-4234', 120);
INSERT INTO `Customers` VALUES (DEFAULT, 'Fauji', 'wibowo', 'male', 'Magelang', 'Jawa Timur', '0838-1431-7125', DEFAULT);
INSERT INTO `Customers` VALUES (DEFAULT, 'Eddie', 'Wibowo', 'male', 'Kemang', 'Jakarta', '0821-2755-5358', 435);
INSERT INTO `Customers`	VALUES (DEFAULT, 'A', 'Prabhu', 'male', 'Surakarta', 'Jawa Tengah', '0812-7987-0192', 875);
INSERT INTO `Customers`	VALUES (DEFAULT, 'A', 'Budi', 'male', 'Surakarta', 'Jawa Tengah', '0812-7987-0193',	DEFAULT);
INSERT INTO `Customers`	VALUES (DEFAULT, 'AAJ', 'Batavia', 'Female', 'Surakarta', 'Jawa Tengah', '0812-7987-0194',DEFAULT);
INSERT INTO `Customers`	VALUES (DEFAULT, 'Aam', 'Dewi', 'Female', 'Surakarta', 'Jawa Tengah', '0812-7987-0195', 300);
INSERT INTO `Customers`	VALUES (DEFAULT, 'Aarti', 'Lohia', 'Female', 'Surakarta', 'Jawa Tengah', '0812-7987-0196',DEFAULT);
INSERT INTO `Customers`	VALUES (DEFAULT, 'Abdul', 'Hadi', 'male', 'Surakarta', 'Jawa Tengah', '0812-7987-0197',DEFAULT);
INSERT INTO	`Customers`	VALUES (DEFAULT, 'Abdul', 'Rachman','male','Surakarta', 'Jawa Tengah', '0812-7987-0198', DEFAULT);
INSERT INTO	`Customers`	VALUES (DEFAULT, 'Abdul', 'Rahman', 'male', 'Surakarta', 'Jawa Tengah', '0812-7987-0199', DEFAULT);
INSERT INTO	`Customers`	VALUES (DEFAULT, 'Abdul', 'Rifai', 'male', 'Surakarta', 'Jawa Tengah', '0812-7987-0200', 10);
INSERT INTO	`Customers`	VALUES (DEFAULT, 'Abdul','Slam', 'male', 'Surakarta', 'Jawa Tengah', '0812-7987-0201',	10);
INSERT INTO	`Customers`	VALUES (DEFAULT, 'Abdullah', 'Alatas', 'male', 'Jepara', 'Jawa Tengah', '0812-7987-0202', 10);
INSERT INTO	`Customers`	VALUES (DEFAULT, 'Abu', 'Djaja', 'male', 'Jepara', 'Jawa Tengah', '0812-7987-0203', 25);
INSERT INTO	`Customers`	VALUES (DEFAULT, 'Abu', 'Hermanto', 'male', 'Jepara', 'Jawa Tengah', '0812-7987-0204',	50);
INSERT INTO	`Customers`	VALUES (DEFAULT, 'Achirsyah', 'Moeis', 'male', 'Jepara', 'Jawa Tengah', '0818-3273-754', 25);
INSERT INTO	`Customers`	VALUES (DEFAULT, 'Achmad', 'Fadjar', 'male', 'Jepara', 'Jawa Tengah', '0838-3463-126', 10);
INSERT INTO	`Customers`	VALUES (DEFAULT, 'Achmad', 'Faried', 'male', 'Jepara', 'Jawa Tengah', '0812-6575-3455', 100);
INSERT INTO	`Customers`	VALUES (DEFAULT, 'Achmad', 'Kalla', 'male', 'Jepara', 'Jawa Tengah', '0812-3452-3453',	650);
INSERT INTO	`Customers`	VALUES (DEFAULT, 'Achmad', 'Latief', 'male', 'Jepara', 'Jawa Tengah', '0812-4564-4564', 250);
INSERT INTO	`Customers`	VALUES (DEFAULT, 'Achmad', 'Nugraha', 'male', 'Jepara', 'Jawa Tengah', '0812-6584-5743', 25);
INSERT INTO	`Customers`	VALUES (DEFAULT, 'BEATRICE', 'EL', 'Female', 'Blitar', 'Jawa Timur', '0812-2426-7345', 75);
INSERT INTO	`Customers`	VALUES (DEFAULT, 'Belinda', 'Natalia', 'Female', 'Blitar', 'Jawa Timur', '0812-3425-7481', DEFAULT);
INSERT INTO	`Customers`	VALUES (DEFAULT, 'BELLYANAWATY', 'BUDIMAN', 'Female','Blitar', 'Jawa Timur', '0812-9634-1614', DEFAULT);
INSERT INTO	`Customers`	VALUES (DEFAULT, 'Ben', 'Morice', 'male', 'Blitar', 'Jawa Timur', '0812-2342-4584', 755);
INSERT INTO	`Customers`	VALUES (DEFAULT, 'Beng', 'Phiau', 'male', 'Blitar','Jawa Timur', '0812-7987-0215',	533);
INSERT INTO	`Customers`	VALUES (DEFAULT, 'Bengt', 'Carl', 'male', 'Blitar','Jawa Timur', '0818-6786-8973',	2323);
INSERT INTO	`Customers`	VALUES (DEFAULT, 'Benjamin', 'Subrata', 'male',	'Blitar', 'Jawa Timur', '0812-1232-1235', DEFAULT);
INSERT INTO	`Customers`	VALUES (DEFAULT, 'Benjamin', 'Wong', 'male', 'robolinggo', 'Jawa Timur', '0812-2345-0218', 3453);
INSERT INTO	`Customers`	VALUES (DEFAULT, 'BENNY', 'IRSJAD', 'male', 'Probolinggo', 'Jawa Timur', '0812-7853-743', 235);
INSERT INTO	`Customers`	VALUES (DEFAULT, 'Benny', 'Setiawan', 'male', 'Probolinggo','Jawa Timur', '0812-2447-0234', 456);
INSERT INTO	`Customers`	VALUES (DEFAULT, 'Benny', 'Tenges', 'male', 'Probolinggo', 'Jawa Timur', '0812-1211-4123', 463);
INSERT INTO	`Customers`	VALUES (DEFAULT, 'Benny', 'Tjokrosapoetro', 'male', 'Probolinggo','Jawa Timur', '0812-7437-2346', 550);
INSERT INTO	`Customers`	VALUES (DEFAULT, 'Beny', 'Haryanto', 'male', 'Probolinggo', 'Jawa Timur', '0812-3453-2384',	120);
INSERT INTO	`Customers`	VALUES (DEFAULT, 'Bernadette', 'Ruth', 'Female', 'Probolinggo', 'Jawa Timur', '0812-8578-4563', 650);
INSERT INTO	`Customers`	VALUES (DEFAULT, 'Bernie', 'Prajoga', 'Female', 'Probolinggo', 'Jawa Timur', '0812-6867-544', DEFAULT);
INSERT INTO	`Customers`	VALUES (DEFAULT, 'Betty', 'Ang', 'Female', 'Probolinggo', 'Jawa Timur', '0812-3593-7894', 464);
INSERT INTO	`Customers`	VALUES (DEFAULT, 'BHAYANG', 'SURYADIMADJA', 'male', 'Probolinggo', 'Jawa Timur', '0812-234-0227', 5425);
INSERT INTO	`Customers`	VALUES (DEFAULT, 'Bimo', 'Pramudyo', 'male', 'Bangli', 'Bali', '0818-2422-0228', DEFAULT);
INSERT INTO	`Customers`	VALUES (DEFAULT, 'Bimo', 'Surono', 'male',	'Bangli', 'Bali', '0812-2342-6786', DEFAULT);
INSERT INTO	`Customers`	VALUES (DEFAULT, 'Bing', 'Gondosubroto', 'male', 'Bangli', 'Bali', '0818-3458-9632', 567);
INSERT INTO	`Customers`	VALUES (DEFAULT, 'Bintoro', 'Wong', 'male', 'Bangli', 'Bali', '0818-3573-354', 600);
INSERT INTO	`Customers`	VALUES (DEFAULT, 'Bismarka', 'Kurniawan', 'Female', 'Bangli', 'Bali', '0812-2532-0742', 600);
INSERT INTO	`Customers`	VALUES (DEFAULT, 'Blue', 'Ribbon', 'Female', 'Bangli', 'Bali', '0812-2324-0000', 125);
INSERT INTO	`Customers`	VALUES (DEFAULT, 'Bob', 'Yanuar', 'male', 'Bangli', 'Bali', '0812-2348-4527', 5675);
INSERT INTO	`Customers`	VALUES (DEFAULT, 'Bob', 'Yanuar', 'male', 'Bangli',	'Bali', '0812-4783-3455', 345);
INSERT INTO	`Customers`	VALUES (DEFAULT, 'Bobby', 'Andhika', 'male', 'Bangli', 'Bali', '0812-9385-2836', 242);
INSERT INTO	`Customers`	VALUES (DEFAULT, 'Bobby', 'Iman', 'male', 'Bangli', 'Bali', '0812-7362-9879', 4644);
INSERT INTO	`Customers`	VALUES (DEFAULT, 'Boedi', 'Sampoerna', 'male', 'Bangli', 'Bali', '0812-7987-0238', 2342); 
INSERT INTO `Customers` VALUES (DEFAULT, 'Boedi', 'Acoh', 'male', 'Denpasar', 'Bali', '0812-0798-5647', 1234);
INSERT INTO `Customers` VALUES (DEFAULT, 'Imran', 'Sukam','male', 'Jakarta', 'Jakarta', '0812-1234-1272', 637);

INSERT INTO `Orders` VALUES (1, 1, '2022-08-16', 1, NULL, '2022-08-17', 1);
INSERT INTO `Orders` VALUES (2, 1, '2022-08-16', 1, NULL, '2022-08-17', 1);
INSERT INTO `Orders` VALUES (3, 1, '2022-08-16', 1, NULL, '2022-08-17', 1);
INSERT INTO `Orders` VALUES (4, 70, '2022-08-16', 1, NULL, '2022-08-17', 1);
INSERT INTO `Orders` VALUES (5, 45, '2022-08-16', 1, NULL, '2022-08-17', 1);
INSERT INTO `Orders` VALUES (6, 21, '2022-08-16', 1, NULL, '2022-08-17', 1);
INSERT INTO `Orders` VALUES (7, 42, '2022-08-16', 1, NULL, '2022-08-17', 1);
INSERT INTO `Orders` VALUES (8, 78, '2022-08-16', 1, NULL, '2022-08-17', 1);
INSERT INTO `Orders` VALUES (9, 90, '2022-08-16', 1, NULL, '2022-08-17', 1);
INSERT INTO `Orders` VALUES (10, 12, '2022-08-16', 1, NULL, '2022-08-17', 1);
INSERT INTO `Orders` VALUES (11, 51, '2022-08-30', 1, NULL, '2022-08-31', 1);
INSERT INTO `Orders` VALUES (12, 14, '2022-08-30', 1, NULL, '2022-08-31', 1);
INSERT INTO `Orders` VALUES (13, 14, '2022-08-30', 1, NULL, '2022-08-31', 1);
INSERT INTO `Orders` VALUES (14, 53, '2022-08-30', 1, NULL, '2022-08-31', 1);
INSERT INTO `Orders` VALUES (15, 64, '2022-08-30', 1, NULL, '2022-08-31', 1);
INSERT INTO `Orders` VALUES (16, 23, '2022-08-30', 1, NULL, '2022-08-31', 1);
INSERT INTO `Orders` VALUES (17, 24, '2022-08-30', 1, NULL, '2022-08-31', 1);
INSERT INTO `Orders` VALUES (18, 12, '2022-08-30', 1, NULL, '2022-08-31', 1);
INSERT INTO `Orders` VALUES (19, 96, '2022-08-30', 1, NULL, '2022-08-31', 1);
INSERT INTO `Orders` VALUES (20, 120, '2022-08-30', 1, NULL, '2022-08-31', 1);
INSERT INTO `Orders` VALUES (21, 32, '2022-08-30', 1, NULL, '2022-08-31', 1);
INSERT INTO `Orders` VALUES (22, 59, '2022-08-30', 1, NULL, '2022-08-31', 1);
INSERT INTO `Orders` VALUES (23, 64, '2022-08-30', 1, NULL, '2022-08-31', 1);
INSERT INTO `Orders` VALUES (24, 12, '2022-09-01', 1, NULL, '2022-09-02', 1);
INSERT INTO `Orders` VALUES (25, 35, '2022-09-01', 1, NULL, '2022-09-02', 1);
INSERT INTO `Orders` VALUES (26, 25, '2022-09-01', 1, NULL, '2022-09-02', 1);
INSERT INTO `Orders` VALUES (27, 57, '2022-09-01', 1, NULL, '2022-09-02', 1);
INSERT INTO `Orders` VALUES (28, 125, '2022-09-01', 1, NULL, '2022-09-02', 1);
INSERT INTO `Orders` VALUES (29, 100, '2022-09-01', 1, NULL, '2022-09-02', 1);
INSERT INTO `Orders` VALUES (30, 135, '2022-09-01', 1, NULL, '2022-09-02', 1);
INSERT INTO `Orders` VALUES (31, 124, '2022-09-01', 1, NULL, '2022-09-02', 1);
INSERT INTO `Orders` VALUES (32, 12, '2022-09-01', 1, NULL, '2022-09-02', 1);
INSERT INTO `Orders` VALUES (33, 15, '2022-09-01', 1, NULL, '2022-09-02', 1);
INSERT INTO `Orders` VALUES (34, 97, '2022-09-01', 1, NULL, '2022-09-02', 1);
INSERT INTO `Orders` VALUES (35, 34, '2022-09-01', 1, NULL, '2022-09-02', 1);
INSERT INTO `Orders` VALUES (36, 25, '2022-09-01', 1, NULL, '2022-09-02', 1);
INSERT INTO `Orders` VALUES (37, 53, '2022-09-01', 1, NULL, '2022-09-02', 1);
INSERT INTO `Orders` VALUES (38, 85, '2022-09-01', 1, NULL, '2022-09-02', 1);
INSERT INTO `Orders` VALUES (39, 36, '2022-09-01', 1, NULL, '2022-09-02', 1);
INSERT INTO `Orders` VALUES (40, 98, '2022-09-01', 1, NULL, '2022-09-02', 1);
INSERT INTO `Orders` VALUES (41, 23, '2022-09-01', 1, NULL, '2022-09-02', 1);
INSERT INTO `Orders` VALUES (42, 12, '2022-09-01', 1, NULL, '2022-09-02', 1);
INSERT INTO `Orders` VALUES (43, 45, '2022-09-01', 1, NULL, '2022-09-02', 1);
INSERT INTO `Orders` VALUES (44, 34, '2022-09-01', 1, NULL, '2022-09-02', 1);
INSERT INTO `Orders` VALUES (45, 13, '2022-09-01', 1, NULL, '2022-09-02', 1);
INSERT INTO `Orders` VALUES (46, 76, '2022-09-01', 1, NULL, '2022-09-02', 1);
INSERT INTO `Orders` VALUES (47, 15, '2022-09-01', 1, NULL, '2022-09-02', 1);
INSERT INTO `Orders` VALUES (48, 97, '2022-09-01', 1, NULL, '2022-09-02', 1);
INSERT INTO `Orders` VALUES (49, 34, '2022-09-01', 1, NULL, '2022-09-02', 1);
INSERT INTO `Orders` VALUES (50, 25, '2022-09-01', 1, NULL, '2022-09-02', 1);
INSERT INTO `Orders` VALUES (51, 53, '2022-09-01', 1, NULL, '2022-09-02', 1);
INSERT INTO `Orders` VALUES (52, 85, '2022-09-01', 1, NULL, '2022-09-02', 1);
INSERT INTO `Orders` VALUES (53, 36, '2022-09-01', 1, NULL, '2022-09-02', 1);
INSERT INTO `Orders` VALUES (54, 98, '2022-09-01', 1, NULL, '2022-09-02', 1);
INSERT INTO `Orders` VALUES (55, 23, '2022-09-01', 1, NULL, '2022-09-02', 1);
INSERT INTO `Orders` VALUES (56, 12, '2022-09-01', 1, NULL, '2022-09-02', 1);
INSERT INTO `Orders` VALUES (57, 45, '2022-09-01', 1, NULL, '2022-09-02', 1);
INSERT INTO `Orders` VALUES (58, 34, '2022-09-01', 1, NULL, '2022-09-02', 1);
INSERT INTO `Orders` VALUES (59, 13, '2022-09-01', 1, NULL, '2022-09-02', 1);
INSERT INTO `Orders` VALUES (60, 76, '2022-09-01', 1, NULL, '2022-09-02', 1);
INSERT INTO `Orders` VALUES (61, 15, '2022-09-01', 1, NULL, '2022-09-02', 1);
INSERT INTO `Orders` VALUES (62, 97, '2022-09-01', 1, NULL, '2022-09-02', 1);
INSERT INTO `Orders` VALUES (63, 34, '2022-09-01', 1, NULL, '2022-09-02', 1);
INSERT INTO `Orders` VALUES (64, 25, '2022-09-01', 1, NULL, '2022-09-02', 1);
INSERT INTO `Orders` VALUES (65, 53, '2022-09-01', 1, NULL, '2022-09-02', 1);
INSERT INTO `Orders` VALUES (66, 85, '2022-09-01', 1, NULL, '2022-09-02', 1);
INSERT INTO `Orders` VALUES (67, 36, '2022-09-01', 1, NULL, '2022-09-02', 1);
INSERT INTO `Orders` VALUES (68, 98, '2022-09-01', 1, NULL, '2022-09-02', 1);
INSERT INTO `Orders` VALUES (69, 23, '2022-09-01', 1, NULL, '2022-09-02', 1);
INSERT INTO `Orders` VALUES (70, 12, '2022-09-01', 1, NULL, '2022-09-02', 1);
INSERT INTO `Orders` VALUES (71, 45, '2022-09-01', 1, NULL, '2022-09-02', 1);
INSERT INTO `Orders` VALUES (72, 34, '2022-09-01', 1, NULL, '2022-09-02', 1);
INSERT INTO `Orders` VALUES (73, 13, '2022-09-01', 1, NULL, '2022-09-02', 1);
INSERT INTO `Orders` VALUES (74, 76, '2022-09-01', 1, NULL, '2022-09-02', 1);
INSERT INTO `Orders` VALUES (75, 15, '2022-09-01', 1, NULL, '2022-09-02', 1);
INSERT INTO `Orders` VALUES (76, 97, '2022-09-01', 1, NULL, '2022-09-02', 1);
INSERT INTO `Orders` VALUES (77, 34, '2022-09-01', 1, NULL, '2022-09-02', 1);
INSERT INTO `Orders` VALUES (78, 25, '2022-09-01', 1, NULL, '2022-09-02', 1);
INSERT INTO `Orders` VALUES (79, 53, '2022-09-01', 1, NULL, '2022-09-02', 1);
INSERT INTO `Orders` VALUES (80, 63, '2022-09-02', 1, NULL, '2022-09-03', 1);
INSERT INTO `Orders` VALUES (81, 74, '2022-09-02', 1, NULL, '2022-09-03', 1);
INSERT INTO `Orders` VALUES (82, 45, '2022-09-02', 1, NULL, '2022-09-03', 1);
INSERT INTO `Orders` VALUES (83, 33, '2022-09-02', 1, NULL, '2022-09-03', 1);
INSERT INTO `Orders` VALUES (84, 77, '2022-09-02', 1, NULL, '2022-09-03', 1);
INSERT INTO `Orders` VALUES (85, 23, '2022-09-02', 1, NULL, '2022-09-03', 1);
INSERT INTO `Orders` VALUES (86, 22, '2022-09-02', 1, NULL, '2022-09-03', 1);
INSERT INTO `Orders` VALUES (87, 87, '2022-09-02', 1, NULL, '2022-09-03', 1);
INSERT INTO `Orders` VALUES (88, 88, '2022-09-02', 1, NULL, '2022-09-03', 1);
INSERT INTO `Orders` VALUES (89, 34, '2022-09-02', 1, NULL, '2022-09-03', 1);
INSERT INTO `Orders` VALUES (90, 12, '2022-09-02', 1, NULL, '2022-09-03', 1);
INSERT INTO `Orders` VALUES (91, 53, '2022-09-02', 1, NULL, '2022-09-03', 1);
INSERT INTO `Orders` VALUES (92, 86, '2022-09-02', 1, NULL, '2022-09-03', 1);
INSERT INTO `Orders` VALUES (93, 99, '2022-09-02', 1, NULL, '2022-09-03', 1);
INSERT INTO `Orders` VALUES (94, 100, '2022-09-02', 1, NULL, '2022-09-03', 1);
INSERT INTO `Orders` VALUES (95, 123, '2022-09-02', 1, NULL, '2022-09-03', 1);
INSERT INTO `Orders` VALUES (96, 121, '2022-09-02', 1, NULL, '2022-09-03', 1);
INSERT INTO `Orders` VALUES (97, 130, '2022-09-02', 1, NULL, '2022-09-03', 1);
INSERT INTO `Orders` VALUES (98, 135, '2022-09-02', 1, NULL, '2022-09-03', 1);
INSERT INTO `Orders` VALUES (99, 132, '2022-09-02', 1, NULL, '2022-09-03', 1);
INSERT INTO `Orders` VALUES (100, 129, '2022-09-02', 1, NULL, '2022-09-03', 1);
INSERT INTO `Orders` VALUES (101, 99, '2022-09-02', 1, NULL, '2022-09-03', 1);

# Orders (customer_id, order_date, status)
# INSERT INTO Orders (order_id, customer_id, order_date, status, comments, shipped_date,shipper_id)
/*	VALUES
		(1, 1, '2022-08-16', 1, NULL, '2022-08-17', 1),
        (2, 1, '2022-08-16', 1, NULL, '2022-08-17', 1);
*/

# Order_items (order_id, product_id, quantity, price_IDR), maximum product_id = 55
INSERT INTO Order_items
	VALUES
		(1, 1, 1, 70.000),
        (1, 3, 1, 190.000),
        (2, 1, 1, 70.000),
        (2, 3, 1, 190.000),
        (3, 1, 1, 210.000),
        (3, 2, 1, 136.000),
        (4, 12, 1, 126.000),
        (5, 20, 1, 136.000),
        (5, 23, 2, 272.000),
        (6, 24, 1, 210.000),
        (6, 20, 1, 136.000),
        (7, 12, 1, 126.000),
        (7, 13, 1, 204.000),
        (7, 1, 1, 70.000),
        (7, 2, 1, 136.000),
        (7, 14, 1, 149.000),
        (7, 15, 1, 210.000),
        (7, 16, 1, 189.000),
        (7, 20, 1, 136.000),
        (7, 21, 1, 221.000),
        (7, 22, 1, 189.000),
        (7, 25, 1, 221.000),
        (8, 1, 1, 70.000),
        (8, 2, 1, 136.000),
        (9, 12, 1, 126.000),
        (10, 12, 1, 126.000),
        (11, 12, 1, 126.000),
        (12, 12, 1, 126.000),
        (13, 1, 1, 70.000),
        (13, 12, 1, 126.000),
        (14, 1, 1, 70.000),
        (14, 3, 1, 190.000),
        (15, 1, 1, 70.000),
        (15, 12, 1, 126.000),
        (16, 35, 1, 257.000),
        (17, 45, 1, 216.000),
        (18, 45, 1, 216.000),
        (18, 23, 1, 272.000),
        (18, 15, 1, 210.000),
        (18, 26, 1, 208.000),
        (19, 21, 1, 221.000),
        (19, 45, 1, 216.000),
        (20, 50, 1, 168.000),
        (20, 55, 1, 149.000),
        (20, 23, 1, 272.000),
        (21, 43, 1, 168.000),
        (21, 23, 1, 272.000),
        (21, 1, 1, 70.000),
        (22, 4, 1, 75.000),
        (22, 7, 1, 320.000),
        (23, 8, 1, 146.000),
        (23, 9, 1, 149.000),
        (23, 11, 1, 232.000),
        (24, 1, 1, 210.000),
        (24, 55, 1, 149.000),
        (24, 12, 1, 126.000),
        (24, 45, 1, 216.000),
        (24, 34, 1, 140.000),
        (24, 16, 1, 189.000),
        (24, 22, 1, 189.000),
        (24, 54, 1, 158.000),
        (24, 23, 1, 272.000),
        (24, 11, 1, 232.000),
        (25, 13, 1, 204.000),
        (26, 26, 1, 208.000),
        (27, 55, 1, 149.000),
        (27, 1, 1, 70.000),
        (28, 31, 1, 159.000),
        (29, 28, 1, 318.000),
        (30, 48, 1, 168.000),
        (31, 23, 1, 272.000),
        (31, 35, 1, 257.000),
        (32, 52, 1, 282.000),
        (33, 12, 1, 126.000),
        (34, 1, 1, 70.000),
        (35, 21, 1, 221.000),
        (35, 24, 1, 210.000),
        (35, 35, 1, 257.000),
        (35, 54, 1, 158.000),
        (36, 50, 1, 168.000),
        (37, 40, 1, 215.000),
        (37, 30, 1, 214.000),
        (37, 26, 1, 208.000),
        (38, 55, 1, 149.000),
        (39, 1, 1, 70.000),
        (39, 31, 1, 159.000),
        (40, 28, 1, 318.000),
        (41, 48, 1, 168.000),
        (42, 23, 1, 272.000),
        (43, 35, 1, 257.000),
        (44, 52, 1, 282.000),
        (44, 12, 1, 126.000),
        (45, 17, 1, 136.000),
        (46, 25, 1, 221.000),
        (47, 12, 1, 126.000),
        (47, 43, 1, 168.000),
        (48, 22, 1, 189.000),
        (49, 11, 1, 232.000),
        (50, 16, 1, 189.000),
        (51, 23, 1, 130.000);
