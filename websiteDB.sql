DROP TABLE IF EXISTS tools ;
CREATE TABLE tools (
    toolName VARCHAR(100) NOT NULL,
    toolType VARCHAR(100) NULL,
    language VARCHAR(100) NULL,
    CONSTRAINT pk_toolName PRIMARY KEY (toolName)
);
DROP TABLE IF EXISTS multimedia ;
CREATE TABLE multimedia (
     type VARCHAR(100) NOT NULL,
     CONSTRAINT pk_type PRIMARY KEY (type)
);
DROP TABLE IF EXISTS category ;
CREATE TABLE category (
     webType VARCHAR(100) NOT NULL,
     CONSTRAINT pk_webType PRIMARY KEY (webType)
);
DROP TABLE IF EXISTS website ;
CREATE TABLE website (
     url VARCHAR(100) NOT NULL,
     pubDate DATE NULL,
     companyID INTEGER NOT NULL,
     CONSTRAINT pk_url PRIMARY KEY (url),
     CONSTRAINT fk_companyID FOREIGN KEY (companyID) REFERENCES company (companyID)
);
DROP TABLE IF EXISTS ceo ;
CREATE TABLE ceo (
     employeeID INTEGER PRIMARY KEY AUTOINCREMENT,
     firstName VARCHAR(100) NULL,
     lastName VARCHAR(100) NULL,
     CONSTRAINT ck_ceoName UNIQUE (firstName, lastName)
);
DROP TABLE IF EXISTS company ;
CREATE TABLE company (
     companyID INTEGER PRIMARY KEY AUTOINCREMENT,
     registeredName VARCHAR(100) NOT NULL,
     countryOrigin VARCHAR(100) NULL,
     currentWorth INTEGER(100) NULL,
     numberEmployees INTEGER(100) NULL,
     ceoID INTEGER NOT NULL,
     ck_ceoName VARCHAR(100) NOT NULL,
     CONSTRAINT ck_registeredName UNIQUE (registeredName),
     CONSTRAINT fk_ceoID FOREIGN KEY (ceoID) REFERENCES ceo (employeeID),
     CONSTRAINT fk_ceoName FOREIGN KEY (ck_ceoName) REFERENCES ceo(ck_ceoName)
);
DROP TABLE IF EXISTS developer ;
CREATE TABLE developer (
     employeeID INTEGER PRIMARY KEY AUTOINCREMENT,
     companyID INTEGER NOT NULL,
     firstName VARCHAR(100) NULL,
     lastName VARCHAR(100) NULL,
     expertise VARCHAR(100) NULL,
     devLead INTEGER NULL,
     CONSTRAINT fk_companyID FOREIGN KEY (companyID) REFERENCES company (companyID),
     CONSTRAINT fk_devLead FOREIGN KEY (employeeID) REFERENCES developer (employeeID)
);
DROP TABLE IF EXISTS officeLocation ;
CREATE TABLE officeLocation (
     officeID INTEGER PRIMARY KEY AUTOINCREMENT,
     postalCode VARCHAR(100) NOT NULL,
     country VARCHAR(100) NULL,
     city VARCHAR(100) NULL,
     CONSTRAINT ck_officeLocation UNIQUE (postalCode)
);
DROP TABLE IF EXISTS founder ;
CREATE TABLE founder (
     employeeID INTEGER PRIMARY KEY AUTOINCREMENT,
     firstName VARCHAR(100) NULL,
     lastName VARCHAR(100) NULL,
     dob DATE NULL,
     CONSTRAINT ck_founder UNIQUE (firstName, lastName)
);
DROP TABLE IF EXISTS websiteClassified ;
CREATE TABLE websiteClassified (
    url VARCHAR(100) NOT NULL,
    webType VARCHAR(100) NOT NULL,
    CONSTRAINT fk_url FOREIGN KEY (url) REFERENCES website (url),
    CONSTRAINT fk_webType FOREIGN KEY (webType) REFERENCES category (webType)
);
DROP TABLE IF EXISTS foundedBy ;
CREATE TABLE foundedBy (
    employeeID INTEGER NOT NULL,
    companyID INTEGER NOT NULL,
    CONSTRAINT fk_employeeID FOREIGN KEY (employeeID) REFERENCES ceo (employeeID),
    CONSTRAINT fk_companyID FOREIGN KEY (companyID) REFERENCES company (companyID)
);
DROP TABLE IF EXISTS companyWebsite ;
CREATE TABLE companyWebsite (
    url VARCHAR(100) NOT NULL,
    companyID INTEGER NOT NULL,
    CONSTRAINT fk_url FOREIGN KEY (url) REFERENCES website (url),
    CONSTRAINT fk_companyID FOREIGN KEY (companyID) REFERENCES company (companyID)
);
DROP TABLE IF EXISTS companyDev ;
CREATE TABLE companyDev (
    employeeID INTEGER NOT NULL,
    companyID INTEGER NOT NULL,
    CONSTRAINT fk_employeeID FOREIGN KEY (employeeID) REFERENCES developer (employeeID),
    CONSTRAINT fk_companyID FOREIGN KEY (companyID) REFERENCES company (companyID)
);
DROP TABLE IF EXISTS websiteMedia ;
CREATE TABLE websiteMedia (
    url VARCHAR(100) NOT NULL,
    type VARCHAR(100) NOT NULL,
    CONSTRAINT fk_url FOREIGN KEY (url) REFERENCES website (url),
    CONSTRAINT fk_multimediaType FOREIGN KEY (type) REFERENCES multimedia (type)
);
DROP TABLE IF EXISTS websiteTools ;
CREATE TABLE websiteTools (
    url VARCHAR(100) NOT NULL,
    toolName VARCHAR(100) NOT NULL,
    CONSTRAINT fk_url FOREIGN KEY (url) REFERENCES website (url),
    CONSTRAINT fk_toolName FOREIGN KEY (toolName) REFERENCES tools (toolName)
);
DROP TABLE IF EXISTS companyLocation ;
CREATE TABLE companyLocation (
    officeID INTEGER NOT NULL,
    companyID INTEGER NOT NULL,
    postalCode VARCHAR(100) NOT NULL,
    CONSTRAINT fk_officeID FOREIGN KEY (officeID) REFERENCES officeLocation (officeID),
    CONSTRAINT fk_postalCode FOREIGN KEY (postalCode) REFERENCES officeLocation (postalCode),
    CONSTRAINT ck_companyID FOREIGN KEY (companyID) REFERENCES company (companyID)
);
