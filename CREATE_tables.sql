
DROP TABLE IF EXISTS users ;
CREATE TABLE IF NOT EXISTS users (
userId INT NOT NULL,
firstName VARCHAR(100) CHARACTER SET 'utf8' NOT NULL,
lastName VARCHAR(100) CHARACTER SET 'utf8' NOT NULL,
userName VARCHAR(30) CHARACTER SET 'utf8' NOT NULL,
email VARCHAR(254) NOT NULL,
password VARCHAR(255) NOT NULL,
role VARCHAR(15) NOT NULL,
status TINYINT NOT NULL,
PRIMARY KEY (userId),
UNIQUE INDEX userName_UNIQUE (userName ASC),
UNIQUE INDEX email_UNIQUE (email ASC)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS clubs ;
CREATE TABLE IF NOT EXISTS clubs (
clubId INT NOT NULL,
name VARCHAR(150) NOT NULL,
description LONGTEXT NOT NULL,
email VARCHAR(254) NOT NULL,
phone VARCHAR(30) NOT NULL,
websiteURL VARCHAR(2048) NOT NULL,
logoURL VARCHAR(2048) NOT NULL,
rating DECIMAL(2,1) NOT NULL,
reviewCount INT NULL,
address VARCHAR(254) NOT NULL,
zipCode INT NOT NULL,
city VARCHAR(254) NOT NULL,
PRIMARY KEY (clubId),
UNIQUE INDEX name_UNIQUE (name ASC),
UNIQUE INDEX email_UNIQUE (email ASC),
UNIQUE INDEX phone_UNIQUE (phone ASC)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS categories ;
CREATE TABLE IF NOT EXISTS categories (
categoryId INT NOT NULL,
name VARCHAR(45) NOT NULL,
parentId INT NULL,
PRIMARY KEY (categoryId),
UNIQUE INDEX name_UNIQUE (name ASC)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS clubCategories ;
CREATE TABLE IF NOT EXISTS clubCategories (
categories_categoryId INT NOT NULL,
clubs_clubId INT NOT NULL,
INDEX fk_clubCategories_categories1_idx (categories_categoryId ASC),
INDEX fk_clubCategories_clubs1_idx (clubs_clubId ASC),
CONSTRAINT fk_clubCategories_categories1
FOREIGN KEY (categories_categoryId)
REFERENCES categories (categoryId)
ON DELETE NO ACTION ON UPDATE NO ACTION,
CONSTRAINT fk_clubCategories_clubs1
FOREIGN KEY (clubs_clubId)
REFERENCES clubs (clubId)
ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB;

DROP TABLE IF EXISTS messages ;
CREATE TABLE IF NOT EXISTS messages (
messageId INT NOT NULL,
categoryId INT NOT NULL,
chatType VARCHAR(45) NOT NULL,
message VARCHAR(2048) NOT NULL,
createdAt DATETIME NOT NULL,
users_userId INT NOT NULL,
clubs_clubId INT NOT NULL,
PRIMARY KEY (messageId),
INDEX fk_messages_users1_idx (users_userId ASC),
INDEX fk_messages_clubs1_idx (clubs_clubId ASC),
CONSTRAINT fk_messages_users1
FOREIGN KEY (users_userId)
REFERENCES users (userId)
ON DELETE NO ACTION ON UPDATE NO ACTION,
CONSTRAINT fk_messages_clubs1
FOREIGN KEY (clubs_clubId)
REFERENCES clubs (clubId)
ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB;

DROP TABLE IF EXISTS price ;
CREATE TABLE IF NOT EXISTS price (
priceId INT NOT NULL,
adult INT NULL,
student INT NULL,
clubs_clubId INT NOT NULL,
PRIMARY KEY (priceId),
INDEX fk_price_clubs1_idx (clubs_clubId ASC),
CONSTRAINT fk_price_clubs1
FOREIGN KEY (clubs_clubId)
REFERENCES clubs (clubId)
ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB;

DROP TABLE IF EXISTS reviews ;
CREATE TABLE IF NOT EXISTS reviews (
reviewId INT NOT NULL,
rating DECIMAL(2,1) NOT NULL,
comment VARCHAR(2048) NOT NULL,
createdAt DATE NOT NULL,
users_userId INT NOT NULL,
clubs_clubId INT NOT NULL,
PRIMARY KEY (reviewId),
INDEX fk_reviews_users1_idx (users_userId ASC),
INDEX fk_reviews_clubs1_idx (clubs_clubId ASC),
CONSTRAINT fk_reviews_users1
FOREIGN KEY (users_userId)
REFERENCES users (userId)
ON DELETE NO ACTION ON UPDATE NO ACTION,
CONSTRAINT fk_reviews_clubs1
FOREIGN KEY (clubs_clubId)
REFERENCES clubs (clubId)
ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB;

     