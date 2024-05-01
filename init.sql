use bitcoindb;

CREATE TABLE client (clientID int, name varchar(50), phoneNumber int, cellPhoneNumber int, email varchar(50),
  isGold bit, stateName varchar(20), zipcode int, city varchar(50), stAddress varchar(50), monthlyTrades int, 
  bitcoin real, fiat real, password varchar(50),
  primary key (clientID),
  foreign key (isGold) references commissionRate(isGold));

--CREATE TABLE account (monthlyTrades int, bitcoin real, fiat real, clientID int, password varchar(50), primary key (clientID));

CREATE TABLE trader (traderID int, name varchar(50), password varchar(50),
  primary key (traderID));

INSERT INTO client (clientID, name, phoneNumber, cellPhoneNumber, email, isGold, stateName, zipcode, city, 
stAddress, monthlyTrades, bitcoin, fiat, password)
VALUES 
(1, 'Morris Idale', 'midale0@hexun.com', 2027431201, 9707226069, '00 La Follette Drive', 
'Washington',	'District of Columbia',	20010, 'Gold'),
(2, 'Kimberly Liversidge', 'kliversidge1@histats.com', 5108140045, 2039456720, '29174 Eagle Crest Court',
'Berkeley',	'California',	94712, 'Silver'),
(3, 'Elisabet	Toplin', 'etoplin2@icq.com', 2057968196, 5205770850, '38702 Shopko Alley', 'Birmingham',
'Alabama', 35210,	'Gold'),
(4, 'Odilia	Glanz', 'oglanz3@bravesites.com', 4084186658, 3091972391, '6 Mitchell Street', 'San Jose',
'California', 95123, 'Silver'),
(5, 'Geordie Ianitti', 'gianitti4@studiopress.com', 2052921088, 2536156789, '7856 Rieder Court',
'Birmingham',	'Alabama', 35231,	'Gold'),
(6, 'Correy	Capun', 'ccapun5@sina.com.cn', 2059030758, 5592918109, '80269 Carey Lane', 'Birmingham',
'Alabama', 35254,	'Gold'),
(7, 'Wileen	Walkden',	'wwalkden6@howstuffworks.com', 7706556627, 5042783788, '31 Del Sol Court',
'Lawrenceville', 'Georgia',	30245, 'Gold'),
(8, 'Leontyne	Dullard',	'ldullard7@w3.org', 5123783612, 3209293110, '82 Pond Plaza', 'Austin',
'Texas', 78789,	'Gold'),
(9, 'Darbie	Sousa',	'dsousa8@nps.gov', 7135992952, 8162862891, '0 1st Center', 'Spring',
'Texas', 77386,	'Silver'),
(10, 'Davine Masic', 'dmasic9@studiopress.com', 3186085177,	3216507379,	'8 Maryland Center',
'Shreveport', 'Louisiana', 71105, 'Gold');

CREATE TABLE transactions (transactionID int, clientID int, traderID int, transactionDate date,
  primary key (transactionID),
  foreign key (clientID) references client(clientID),
  foreign key (traderID) references trader(traderID));

CREATE TABLE bitcoinTransaction (transactionID int, fiatCommission bit,
  commission real, fiat real, bitcoin real,
  primary key (transactionID),
  foreign key (transactionID) references transactions(transactionID));

CREATE TABLE paymentTransaction (transactionID int, fiatAmount real,
  primary key (transactionID),
  foreign key (transactionID) references transactions(transactionID));

CREATE TABLE cancel (transactionID int, cancelDate date, traderID int,
  primary key (transactionID),
  foreign key (transactionID) references transactions(transactionID),
  foreign key (traderID) references trader(traderID));

CREATE TABLE commissionRate (isGold bit, rate real, 
  primary key (isGold));

INSERT commissionRate
VALUES (b'0', .02);

INSERT commissionRate
VALUES (b'1', .01);
