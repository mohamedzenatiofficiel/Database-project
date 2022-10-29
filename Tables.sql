--
-- File generated with SQLiteStudio v3.3.3 on dim. janv. 30 20:21:48 2022
--
-- Text encoding used: UTF-8
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: Show
CREATE TABLE Show(
        ID_SHOW     Int NOT NULL ,
        ID_THEATRE  Int NOT NULL ,
        Name_show   Varchar (50) NOT NULL ,
        Date_show   Date NOT NULL ,
        Global_cost Float NOT NULL ,
        Prod_cost   Float NOT NULL ,
        Travel_cost Float NOT NULL
	,CONSTRAINT Show_PK PRIMARY KEY (ID_SHOW)
);
INSERT INTO Show (ID_SHOW, ID_THEATRE, Name_show, Date_show, Global_cost, Prod_cost, Travel_cost) VALUES (101, 1, 'Nemo', '2021-12-01', 1000.0, 500.0, 50.0);
INSERT INTO Show (ID_SHOW, ID_THEATRE, Name_show, Date_show, Global_cost, Prod_cost, Travel_cost) VALUES (102, 2, 'Le roi lion', '2021-12-02', 2000.0, 600.0, 60.0);
INSERT INTO Show (ID_SHOW, ID_THEATRE, Name_show, Date_show, Global_cost, Prod_cost, Travel_cost) VALUES (103, 3, 'Blanche neige', '2021-12-03', 3000.0, 700.0, 70.0);
INSERT INTO Show (ID_SHOW, ID_THEATRE, Name_show, Date_show, Global_cost, Prod_cost, Travel_cost) VALUES (104, 4, 'Le malade imaginaire', '2021-08-01', 10000.0, 500.0, 200.0);
INSERT INTO Show (ID_SHOW, ID_THEATRE, Name_show, Date_show, Global_cost, Prod_cost, Travel_cost) VALUES (105, 5, 'Ensemble', '2021-01-02', 3256.0, 6400.0, 607.0);
INSERT INTO Show (ID_SHOW, ID_THEATRE, Name_show, Date_show, Global_cost, Prod_cost, Travel_cost) VALUES (106, 3, 'Le livre de la jungle', '2021-11-23', 7005.0, 700.0, 706.0);

-- Table: Sponsor
CREATE TABLE Sponsor (ID_Sponsor Int NOT NULL, 
        Name_agencies Varchar (50) NOT NULL, 
        Budget Float NOT NULL, 
        Duree VARCHAR (50) NOT NULL, 
        ID_Theatre Int NOT NULL, 
        Periodicite VARCHAR (50) NOT NULL, 
        CONSTRAINT Sponsor_PK PRIMARY KEY (ID_Sponsor)
);

INSERT INTO Sponsor (ID_Sponsor, Name_agencies, Budget, Duree, ID_Theatre, Periodicite) VALUES (1234, 'Ministry of Culture', 500.0, '5 years', 1, 'year');
INSERT INTO Sponsor (ID_Sponsor, Name_agencies, Budget, Duree, ID_Theatre, Periodicite) VALUES (5678, 'Benevolat', 10000.0, '2 years', 2, 'month');
INSERT INTO Sponsor (ID_Sponsor, Name_agencies, Budget, Duree, ID_Theatre, Periodicite) VALUES (1122, 'Municipality', 2500.0, '6 months', 3, 'month');
INSERT INTO Sponsor (ID_Sponsor, Name_agencies, Budget, Duree, ID_Theatre, Periodicite) VALUES (1456, 'Ministry of education', 5000000., '10 years', 2, 'year');
INSERT INTO Sponsor (ID_Sponsor, Name_agencies, Budget, Duree, ID_Theatre, Periodicite) VALUES (5452, 'Carrefour', 10000.0, '7 years', 4, 'month');
INSERT INTO Sponsor (ID_Sponsor, Name_agencies, Budget, Duree, ID_Theatre, Periodicite) VALUES (1221, 'Riot', 2500000.0, '6 months', 5, 'month');

-- Table: Theatre
CREATE TABLE Theatre(
        ID_THEATRE Int NOT NULL ,
        Name       Varchar (50) NOT NULL ,
        Capacity   Int NOT NULL ,
        Address    Varchar (50) NOT NULL
	,CONSTRAINT Theatre_PK PRIMARY KEY (ID_THEATRE)
);

INSERT INTO Theatre (ID_THEATRE, Name, Capacity, Address) VALUES (1, 'Cabaret', 1000, 'Paris');
INSERT INTO Theatre (ID_THEATRE, Name, Capacity, Address) VALUES (2, 'Tera', 5000, 'Marseille');
INSERT INTO Theatre (ID_THEATRE, Name, Capacity, Address) VALUES (3, 'Theatro', 500, 'Lyon');
INSERT INTO Theatre (ID_THEATRE, Name, Capacity, Address) VALUES (4, 'ache', 1000, 'Paris');
INSERT INTO Theatre (ID_THEATRE, Name, Capacity, Address) VALUES (5, 'Nisqy', 5000, 'Paris');
INSERT INTO Theatre (ID_THEATRE, Name, Capacity, Address) VALUES (6, 'kameto', 500, 'Lyon');

-- Table: Tickets
CREATE TABLE Tickets (ID_TICKETS Int NOT NULL, 
Price Float NOT NULL, ID_Theatre INT NOT NULL, 
Name_show Varchar (50) NOT NULL, 
date_reservation Date NOT NULL, 
reduction Int NOT NULL, 
CONSTRAINT Tickets_PK PRIMARY KEY (ID_TICKETS)
);

INSERT INTO Tickets (ID_TICKETS, Price, ID_Theatre, Name_show, date_reservation, reduction) VALUES (1111, 100.0, 1, 'Nemo', '2021-12-01', 30);
INSERT INTO Tickets (ID_TICKETS, Price, ID_Theatre, Name_show, date_reservation, reduction) VALUES (2222, 75.0, 2, 'Le roi lion', '2021-12-02', 50);
INSERT INTO Tickets (ID_TICKETS, Price, ID_Theatre, Name_show, date_reservation, reduction) VALUES (3333, 85.0, 3, 'Blanche neige', '2021-12-03', 30);
INSERT INTO Tickets (ID_TICKETS, Price, ID_Theatre, Name_show, date_reservation, reduction) VALUES (4444, 125.0, 4, 'Le malade imaginaire', '2021-08-01', 30);
INSERT INTO Tickets (ID_TICKETS, Price, ID_Theatre, Name_show, date_reservation, reduction) VALUES (5555, 50.0, 5, 'Ensemble', '2021-01-02', 50);
INSERT INTO Tickets (ID_TICKETS, Price, ID_Theatre, Name_show, date_reservation, reduction) VALUES (6666, 99.0, 3, 'Le livre de la jungle', '2021-11-23', 30);

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
