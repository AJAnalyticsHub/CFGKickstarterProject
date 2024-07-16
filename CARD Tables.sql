CREATE DATABASE OnlineCardRetailer;
USE OnlineCardRetailer;

CREATE TABLE CardSentiment (
cardsentiment_id INT NOT NULL AUTO_INCREMENT, cardsentiment VARCHAR(50),
CONSTRAINT pk_cardsentiment_id PRIMARY KEY (cardsentiment_id));

CREATE TABLE CardOccasion (
cardoccasion_id INT NOT NULL AUTO_INCREMENT, occasion VARCHAR(50) NOT NULL, cardsentiment_id INT NOT NULL,
CONSTRAINT pk_cardoccasion_id PRIMARY KEY (cardoccasion_id),
CONSTRAINT fk_cardsentiment_id FOREIGN KEY (cardsentiment_id) REFERENCES CardSentiment(cardsentiment_id));

CREATE TABLE CardSize (
cardsize_id INT NOT NULL AUTO_INCREMENT, cardsize VARCHAR(20), papersize VARCHAR(4), cardprice DECIMAL(4,2),
CONSTRAINT pk_cardsize_id PRIMARY KEY (cardsize_id));

CREATE TABLE CardTheme (
cardtheme_id INT NOT NULL AUTO_INCREMENT, cardtheme VARCHAR(50),
CONSTRAINT pk_cardtheme_id PRIMARY KEY (cardtheme_id));

CREATE TABLE Postage (
postage_id INT NOT NULL AUTO_INCREMENT, postage VARCHAR(50), postageprice DECIMAL(4,2),
CONSTRAINT pk_postage_id PRIMARY KEY (postage_id));

CREATE TABLE ADTargeting (
adtarget_id INT NOT NULL AUTO_INCREMENT, adtarget VARCHAR(50),
CONSTRAINT pk_adtarget_id PRIMARY KEY (adtarget_id));

CREATE TABLE Gift (
gift_id INT NOT NULL AUTO_INCREMENT, giftsection VARCHAR(20), gifttype VARCHAR(20), 
giftsize VARCHAR(20), giftprice DECIMAL(4,2),
CONSTRAINT pk_gift_id PRIMARY KEY (gift_id));

CREATE TABLE Customers (
		customer_id INT NOT NULL AUTO_INCREMENT, 
		first_name VARCHAR(20), 
		last_name VARCHAR(20), 
		email VARCHAR(50),
		house_number INT,
		street VARCHAR(50),
		town VARCHAR(20),
		postcode VARCHAR(10),
		latitude DECIMAL(6,4),
		longitude DECIMAL(6,4),
	 CONSTRAINT pk_customer_id PRIMARY KEY (customer_id));
    
CREATE TABLE Balance (
customer_id INT NOT NULL AUTO_INCREMENT, pp_account TINYINT(1), balance DECIMAL(6,2),
CONSTRAINT pk_customer_id PRIMARY KEY (customer_id),
CONSTRAINT fk_customer_id FOREIGN KEY (customer_id) REFERENCES Customers(customer_id));

CREATE TABLE Sales (
	sales_id INT NOT NULL AUTO_INCREMENT,
    customer_id INT NOT NULL,
    cardsize_id INT NOT NULL,
    cardtheme_id INT NOT NULL,
    gift_id INT,
    postage_id INT NOT NULL,
    adtarget_id INT NOT NULL,
    timestamp DATE NOT NULL,
	CONSTRAINT pk_sales_id PRIMARY KEY (sales_id),
    CONSTRAINT fk_customer_id_sales FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
	CONSTRAINT fk_cardsize_id FOREIGN KEY (cardsize_id) REFERENCES CardSize(cardsize_id),
    CONSTRAINT fk_cardtheme_id FOREIGN KEY (cardtheme_id) REFERENCES CardTheme(cardtheme_id),
    CONSTRAINT fk_gift_id FOREIGN KEY (gift_id) REFERENCES Gift(gift_id),
    CONSTRAINT fk_postage_id FOREIGN KEY (postage_id) REFERENCES Postage(postage_id),
    CONSTRAINT fk_adtarget_id FOREIGN KEY (adtarget_id) REFERENCES ADTargeting(adtarget_id));