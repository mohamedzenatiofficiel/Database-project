--
-- File generated with SQLiteStudio v3.3.3 on dim. janv. 30 20:27:04 2022
--
-- Text encoding used: UTF-8
--

SELECT * FROM Show;
SELECT * FROM Theatre;
SELECT * FROM Sponsor;
SELECT * FROM Tickets;

SELECT COUNT(Name_show) AS Number_show, ID_THEATRE FROM Show
GROUP BY ID_THEATRE;

SELECT COUNT(id_tickets) AS number_tickets_sold, ID_Theatre FROM Tickets GROUP BY ID_Theatre;

SELECT MAX(Budget) FROM Sponsor;

SELECT Name_agencies FROM Sponsor WHERE Budget > 5000;

SELECT Name_show FROM show WHERE Prod_cost < 650 ;

SELECT COUNT(ID_TICKETS) FROM TICKETS;

SELECT AVG(Global_cost) FROM Show;

SELECT distinct Name_show, ID_THEATRE FROM Tickets WHERE (ID_Theatre !=2 AND (name_show = 'Ensemble' OR name_show ='Nemo'));

SELECT min(date_show), t.name_show, s.ID_THEATRE FROM Show s INNER JOIN Tickets t ON s.ID_THEATRE = t.ID_THEATRE
group by s.ID_THEATRE;


-------TRIGGER


CREATE or REPLACE TRIGGER Check_Date_Show
    before insert on Show
    FOR EACH ROW
    declare
        ID_THEATRE INTEGER;
    begin
        select count(*) into ID_THEATRE from Show where ID_SHOW = :new.ID_SHOW and Date_show = :new.Date_show;

        if ID_THEATRE > 0 then
            RAISE_APPLICATION_ERROR(-20001,'ERROR : Not two representations at the same time.');
        END IF;
    end;




CREATE OR REPLACE TRIGGER credit_Tickets
	after insert on Tickets for each row
	declare
		ID_THEATRE INT;
		sellId Int;
	begin
		select c into sellId from (select count(*)+1 as c from Tickets);
		SELECT ID_THEATRE into ID_THEATRE FROM Tickets WHERE Tickets.ID_TICKETS = :new.ID_TICKETS;
		insert into sells (Transfert_ID,amount,Transfert_date,purpose,ID_THEATRE) values (sellId,:new.price,:new.date_reservation,'Sale of ticket ' || :new.ID_TICKETS || ' for the représentation : '|| :new.Name_show || '| Price : ' || :new.price, ID_THEATRE);
    end;




CREATE OR REPLACE TRIGGER CapacityFull
    before insert on Tickets
    for each row
    DECLARE
        sold int;
        Hall_ID INT;
    full EXCEPTION;
    BEGIN
        SELECT ID_THEATRE into Hall_ID FROM Tickets WHERE Tickets.Name_show = :new.Name_show;
        SELECT Capacity FROM Theatre WHERE Theatre.ID_THEATRE = ID_THEATRE;
        SELECT COUNT(ID_TICKETS) into sold FROM Tickets WHERE Tickets.Name_show = :new.Name_show;

        IF sold = Capacity THEN
            RAISE full;
        END IF;
        EXCEPTION
        WHEN full THEN
            raise_application_error(-20001,'The show is full');
    END;
