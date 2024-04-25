use bitcoindb;

CREATE TABLE client (clientID int, name varchar(50), phoneNumber int, cellPhoneNumber int, email varchar(50),
  isGold bit, stateName varchar(20), zipcode int, city varchar(50), stAddress varchar(50), monthlyTrades int, 
  bitcoin real, fiat real, clientID int, password varchar(50),
  primary key (clientID),
  foreign key (isGold) references commissionRate(isGold));

--CREATE TABLE account (monthlyTrades int, bitcoin real, fiat real, clientID int, password varchar(50), primary key (clientID));

CREATE TABLE trader (traderID int, name varchar(50), 
  primary key (traderID));

CREATE TABLE transaction (transactionID int, clientID int, traderID int, transactionDate date,
  primary key (transactionID),
  foreign key (clientID) references client(clientID),
  foreign key (traderID) references trader(traderID));

CREATE TABLE bitcoinTransaction (transactionID int, fiatCommission bit,
  commission real, fiat real, bitcoin real,
  primary key (transactionID),
  foreign key (transactionID) references transaction(transactionID));

CREATE TABLE paymentTransaction (transactionID int, fiatAmount int,
  primary key (transactionID),
  foreign key (transactionID) references transaction(transactionID));

CREATE TABLE cancel (transactionID int, cancelDate date, traderID int,
  primary key (transactionID),
  foreign key (transactionID) references transaction(transactionID),
  foreign key (traderID) references trader(traderID));

CREATE TABLE commissionRate (isGold bit, rate real, 
  primary key (isGold));
