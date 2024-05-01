use bitcoindb;

CREATE TABLE client (clientID int, name varchar(50), phoneNumber int, cellPhoneNumber int, email varchar(50),
  isGold bit, stateName varchar(20), zipcode int, city varchar(50), stAddress varchar(50), monthlyTrades int, 
  bitcoin real, fiat real, password varchar(50),
  primary key (clientID),
  foreign key (isGold) references commissionRate(isGold));

--CREATE TABLE account (monthlyTrades int, bitcoin real, fiat real, clientID int, password varchar(50), primary key (clientID));

CREATE TABLE trader (traderID int, name varchar(50), password varchar(50),
  primary key (traderID));

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

INSERT INTO client (clientID, name, phoneNumber, cellPhoneNumber, email, isGold, stateName, zipcode, city, 
stAddress, monthlyTrades, bitcoin, fiat, password)
VALUES 
(1, 'Morris Idale', 2027431201, 9707226069,'midale0@hexun.com', 1, 'District of Columbia', 20010, 'Washington',
'00 La Follette Drive', 3, 0.0035, 123.57, 'potatoNumber5'),
(2, 'Kimberly Liversidge', 5108140045, 2039456720, 'kliversidge1@histats.com', 0, 'California', 94712, 
'Berkeley', '29174 Eagle Crest Court', 1, 0.0006782, 54.17, 'fuzzyTaco69'),
(3, 'Elisabet	Toplin', 2057968196, 5205770850, 'etoplin2@icq.com', 1, 'Alabama', 35210, 'Birmingham',
'38702 Shopko Alley', 25, 2.4093, 120493.43, 'SleepingTurtle333'),
(4, 'Odilia	Glanz', 4084186658, 3091972391, 'oglanz3@bravesites.com', 0, 'California', 95123, 
'San Jose', '6 Mitchell Street', 13, 0.03948, 235.78, 'zncjnsfWJEJ432'),
(5, 'Geordie Ianitti', 2052921088, 2536156789, 'gianitti4@studiopress.com', 1, 'Alabama', 35254, 
'Birmingham', '7856 Rieder Court', 35, 0.894477, 784.22, 'pass4Now43'),
(6, 'Correy	Capun', 2059030758, 5592918109, 'ccapun5@sina.com.cn', 1, 'Alabama', 35254, 'Birmingham', 
'80269 Carey Lane', 40, 2.43228, 7893.45, 'StuffGetsWeird44'),
(7, 'Wileen	Walkden',	7706556627, 5042783788, 'wwalkden6@howstuffworks.com', 1, 'Georgia', 30245, 
'Lawrenceville', '31 Del Sol Court', 27, 0.17646, 376.69, 'Pineapple3928'),
(8, 'Leontyne	Dullard',	5123783612, 3209293110, 'ldullard7@w3.org', 1, 'Texas', 78789, 
'Austin', '82 Pond Plaza', 34, 0.432884, 578.32, 'Longhorns73872'),
(9, 'Darbie	Sousa',	7135992952, 8162862891, 'dsousa8@nps.gov', 0, 'Texas', 77386, 'Spring'
'0 1st Center', 5, 0.00392, 345.89, 'TakeNotes345'),
(10, 'Davine Masic', 3186085177, 3216507379, 'dmasic9@studiopress.com', 1, 'Louisiana', 71105, 'Shreveport',
'8 Maryland Center', 30, 1.232843, 80211.12);

INSERT INTO transactions (transactionID, clientID, traderID, transactionDate)
VALUES (4, 9, 3, '2024-03-30'), (5, 1, 7, '2024-01-01'), (9, 3, 2, '2024-02-05'),
(6, 4, 8, '2024-02-10'), (5, 6, 7, '2024-01-13');

INSERT INTO bitcoinTransaction (transactionID, fiatCommission, commission, fiat, bitcoin)
VALUES (4, 1, 4.34, 432.48), (2, 0, 2.43, 32.78), (7, 0, 13.67, 4352.43), (5, 0, 33.76, 4387.44),
(8, 1, 43.90, 798.98);
