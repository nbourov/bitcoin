use bitcoindb;

CREATE TABLE client (clientID int, name varchar(50), phoneNumber int, cellPhoneNumber int, email varchar(50),
level varchar(20), state varchar(20), zipcode int, city varchar(50), stAddress varchar(50), primary key (clientID);

CREATE TABLE account (monthlyTrades int, bitcoin real, accountID int);