DROP TABLE Consecinte;
DROP TABLE Batalii;
DROP TABLE Nave;
DROP TABLE Clase;
DROP VIEW NaveRomania;

-- 10.1
--a
CREATE TABLE Clase(
	clasa VARCHAR2(20) NOT NULL,
	tip VARCHAR2(20) NOT NULL,
	tara VARCHAR2(20) NOT NULL,
	nr_arme NUMBER NOT NULL,
	diametru_tun NUMBER NOT NULL,
	deplasament NUMBER NOT NULL
);
--Table created.

--b
CREATE TABLE Nave(
	nume VARCHAR2(20) NOT NULL,
	clasa VARCHAR(20) NOT NULL,	
	anul_lansarii NUMBER NOT NULL
);
--Table created.

--c
CREATE TABLE Batalii(
	nume VARCHAR(25) NOT NULL,
	data DATE NOT NULL
);
--Table created.

--d
CREATE TABLE Consecinte(
	nava VARCHAR2(20) NOT NULL,	
	batalie VARCHAR2(25) NOT NULL,
	rezultat VARCHAR(20) NOT NULL
);
--Table created.

--e 
---CLASE
	ALTER TABLE Clase ADD CONSTRAINT clase_clasa_pk PRIMARY KEY(clasa);
	--testam primary key prin adaugarea unei valori deja adaugate in tabela
	INSERT INTO Clase
	VALUES('La Galissonnière','crucisator','FRANTA',7,2,7500);
-----------------------------------------------------------------------	
	ALTER TABLE Clase ADD CONSTRAINT clase_tip_ck CHECK(tip IN('vas de linie', 'cuirasat','crucisator','distrugator'));	
	-- testam cu un tip care nu este in constraint
	INSERT INTO Clase
	VALUES('La Galisson','yaht','FRANTA',2,2,2500);
-----------------------------------------------------------------------		
---NAVE	
	ALTER TABLE Nave ADD CONSTRAINT nave_nume_pk PRIMARY KEY(nume);
	--testam primary key prin adaugarea unei valori deja adaugate in tabela
	INSERT INTO Nave
	VALUES('Le Dolce','Le Dolce',1819);
-----------------------------------------------------------------------		
	ALTER TABLE Nave ADD CONSTRAINT nave_clasa_fk FOREIGN KEY(clasa) REFERENCES Clase(clasa);
	--testam foreign key clasa
	INSERT INTO Nave
	VALUES('La Galisson','La',1814);
-----------------------------------------------------------------------		
---BATALII	
	ALTER TABLE Batalii ADD CONSTRAINT batalii_nume_pk PRIMARY KEY(nume);
	--testam primary key prin adaugarea unei valori deja adaugate in tabela
	INSERT INTO Batalii
	VALUES('Batalia de la Okinawa','22-Jun-1942','Ochinawa');
-----------------------------------------------------------------------		
---CONSECINTE	
	ALTER TABLE Consecinte ADD CONSTRAINT consecinte_nava_fk FOREIGN KEY(nava) REFERENCES Nave(nume) ON DELETE CASCADE;
	--integrity constraintCONSECINTE_NAVA_FK violated - parent key not found
	INSERT INTO Consecinte
	Values('HI','Operatiunea Berlin','avariat');
-----------------------------------------------------------------------		
	ALTER TABLE Consecinte ADD CONSTRAINT consecinte_batalie_fk FOREIGN KEY(batalie) REFERENCES Batalii(nume) ON DELETE CASCADE;
	--integrity constraint CONSECINTE_BATALIE_FK violated - parent key not found
	INSERT INTO Consecinte
	Values('HIEI','Batalia de la Tur','avariat');
-----------------------------------------------------------------------			
	ALTER TABLE Consecinte ADD CONSTRAINT consecinte_nava_pk PRIMARY KEY(nava,batalie);
    --testam primary key prin adaugarea unei valori deja adaugate in tabela
	INSERT INTO Consecinte
	Values('Georges Leygues','Operatiunea Berlin','nevatamat');
-----------------------------------------------------------------------			
	ALTER TABLE Consecinte ADD CONSTRAINT consecinte_rezultat_ck CHECK(rezultat IN('scufundat', 'avariat', 'nevatamat'));
    -- testam cu un rezultat care nu este in constraint		
	INSERT INTO Consecinte
	Values('HIEI','Batalia de la Turceni','neinsemnat');
	
	
--f
	ALTER TABLE Batalii ADD(locatie VARCHAR2(20) NOT NULL);
	
	INSERT INTO Batalii
	VALUES('Bat de la Si','30-Nov-1853','Si');


-- 10.2
--a
	ALTER TABLE Batalii ADD CONSTRAINT batalii_data_ck CHECK(data > TO_DATE('31-Dec-1499','DD-Mon-RR'));
	
	INSERT INTO Batalii
	VALUES('Bat.Rosie','21-Jan-1499','Marea Rosie');
	
--b
	ALTER TABLE Clase ADD CONSTRAINT clase_diametru_tun_ck CHECK((nr_arme<20 AND diametru_tun<50) OR (nr_arme>=20));

	INSERT INTO Clase
	Values('La fleur','distrugator','FRANTA',15,60,4700);
	

-- INSERT-URI in tabele 
-- IN CLASE
	INSERT INTO Clase
	VALUES('La Galissonnière','crucisator','FRANTA',7,2,7500);
	INSERT INTO Clase
	VALUES('Le Garcon','crucisator','FRANTA',21,10,25000);
	INSERT INTO Clase
	VALUES('Fortareata','distrugator','SUA',12,8,3000);
	INSERT INTO Clase
	VALUES('ELisabet','crucisator','ROMANIA',10,6,3500);
	INSERT INTO Clase
	VALUES('Le Napoléon','cuirasat','GERMANIA',10,6,3500);
    INSERT INTO Clase
	VALUES('Le Dolce','cuirasat','FRANTA',10,6,3500);
	INSERT INTO Clase
	VALUES('SovereignOfTheSeas','vas de linie','ANGLIA',2,3,1500);
	INSERT INTO Clase
	VALUES('Kongo','cuirasat','JAPONIA',10,6,9500);
   	INSERT INTO Clase
	VALUES('Armada','vas de linie','SPANIA',10,6,3300);
    INSERT INTO Clase
	VALUES('Beth','crucisator','ROMANIA',2,6,3500);
	INSERT INTO Clase
	VALUES('Mergot','crucisator','ANGLIA',50,55,3500);
	INSERT INTO Clase
	VALUES('Philip','vas de linie','ANGLIA',50,20,3500);

-- la exercitii
	INSERT INTO Clase
	VALUES('AllAround','vas de linie','DANEMARCA',2,3,3500);
	INSERT INTO Clase
	VALUES('OVERTheSeas','vas de linie','DANEMARCA',2,3,2500);
	INSERT INTO Clase
	VALUES('SovereignOfTheSeas2','vas de linie','ANGLIA',2,3,2500);
	INSERT INTO Clase
	VALUES('Le Franchie','cuirasat','FRANTA',10,8,3500);
	
-- sunt adaugate in tabela la ex8

	--INSERT INTO NaveRomania
	--VALUES('Forta','Peace','vas de linie',9,16,34000,1992);
	--INSERT INTO NaveRomania
	--VALUES('Karaiman','Elogia','vas de linie',9,16,27000,1999);
	
-- sunt adaugate in tabele la ex7

	--INSERT INTO Clase
	--VALUES('Nelson','vas de linie','MAREA BRITANIE',9,16,34000);
	--INSERT INTO Clase
	--VALUES('Rodney','vas de linie','MAREA BRITANIE',9,16,34000);
	--INSERT INTO Nave
	--VALUES('MaryScotland','Rodney',1927);
	--INSERT INTO Nave
	--VALUES('Stephen','Nelson',1927);
	
--in cazul in care la 6.a se cer tarile si nu tara
	--INSERT INTO Clase
	--VALUES('Mann','cuirasat','GERMANIA',10,8,3500);

-- IN  NAVE 
	INSERT INTO Nave
	VALUES('La Galissonnière','La Galissonnière',1814);
	INSERT INTO Nave
	VALUES('Le Garcon','Le Garcon',1815);
	INSERT INTO Nave
	VALUES('Fortareata','Fortareata',1816);
	INSERT INTO Nave
	VALUES('ELisabet','ELisabet',1817);
	INSERT INTO Nave
	VALUES('Le Napoléon','Le Napoléon',1818);
    INSERT INTO Nave
	VALUES('Le Dolce','Le Dolce',1819);
	INSERT INTO Nave
	VALUES('SovereignOfTheSeas','SovereignOfTheSeas',1820);
	INSERT INTO Nave
	VALUES('Kongo','Kongo',1821);
    INSERT INTO Nave
	VALUES('Armada','Armada',1848);
    INSERT INTO Nave
	VALUES('Beth','Beth',1847);
	INSERT INTO Nave
	VALUES('Mergot','Mergot',1845);
	INSERT INTO Nave
	VALUES('Philip','Philip',1882);
	INSERT INTO Nave
	VALUES('AllAround','AllAround',1876);
	INSERT INTO Nave
	VALUES('OVERTheSeas','OVERTheSeas',1833);
	INSERT INTO Nave
	VALUES('SovereignOfTheSeas2','SovereignOfTheSeas2',1853);
	INSERT INTO Nave
	VALUES('Le Franchie','Le Franchie',1844);
	INSERT INTO Nave
	VALUES('Fregata Marasesti','Fortareata',1976);
	INSERT INTO Nave
	VALUES('Beti','Fortareata',1922);
	INSERT INTO Nave
	VALUES('Roca','Fortareata',1999);
	INSERT INTO Nave
	VALUES('Piatra','Fortareata',1900);
	INSERT INTO Nave
	VALUES('Kira','Fortareata',1900);
	INSERT INTO Nave
	VALUES('Bismarck ','Le Napoléon',1939);
	INSERT INTO Nave
	VALUES('AEGISS','Kongo',2021);
	INSERT INTO Nave
	VALUES('AEGIS','Kongo',2021);
	INSERT INTO Nave
	VALUES('HIEI','Kongo',1912);
	INSERT INTO Nave
	VALUES('HMS Victory','SovereignOfTheSeas',1900);
	INSERT INTO Nave
	VALUES('Georges Leygues','La Galissonnière',1935);
	INSERT INTO Nave
	VALUES('Montcalm','La Galissonnière',1936);
    INSERT INTO Nave
	VALUES('La vie','La Galissonnière',1955);   
	INSERT INTO Nave
	VALUES('La vita','La Galissonnière',1900);
	INSERT INTO Nave
	VALUES('Jonson','AllAround',1989);
	
-- IN BATALII
	INSERT INTO Batalii
	VALUES('Batalia de la Okinawa','22-Jun-1945','Ochinawa');
	INSERT INTO Batalii
	VALUES('Operatiunea Berlin','22-Jan-1941','Oceanul Atlantic');
	INSERT INTO Batalii
	VALUES('Al II RM','2-Sep-1945','Oceanul Pacific');
	INSERT INTO Batalii
	VALUES('Batalia Tsushima','28-May-1905','StramtoareaTsushima');
	INSERT INTO Batalii
	VALUES('Bat. de la Capul Sarici','18-Nov-1914','Crimeea');
    INSERT INTO Batalii
	VALUES('Bat. Navelor','18-Nov-2009','Crimeea');
   	INSERT INTO Batalii
	VALUES('Al II RM2','1-Sep-1945','Oceanul Atlantic');
	INSERT INTO Batalii
	VALUES('Bat de la Roca','22-Dec-1599','Roca');
    INSERT INTO Batalii
	VALUES('Bat de la Actium','2-Sep-1672','Actium');
    INSERT INTO Batalii
	VALUES('Bat de la Sinop','30-Nov-1853','Sinop');
    INSERT INTO Batalii
	VALUES('Bat de la Lisa','13-Mar-1811','Lisa');
    INSERT INTO Batalii
	VALUES('Incidentul Altmark','16-Feb-1940','Actium');

-- IN CONSECINTE
	INSERT INTO Consecinte
	Values('Fregata Marasesti','Al II RM','nevatamat');
	INSERT INTO Consecinte
	Values('Beti','Al II RM','nevatamat');
	INSERT INTO Consecinte
	Values('Kira','Al II RM','avariat');
	INSERT INTO Consecinte
	Values('La vita','Al II RM','avariat');
	
	INSERT INTO Consecinte
	Values('Georges Leygues','Operatiunea Berlin','nevatamat');
	INSERT INTO Consecinte
	Values('Bismarck ','Operatiunea Berlin','scufundat');
	INSERT INTO Consecinte
	Values('Kira','Operatiunea Berlin','nevatamat');
	
	INSERT INTO Consecinte
	Values('Montcalm','Batalia Tsushima','scufundat');
	INSERT INTO Consecinte
	Values('HIEI','Batalia Tsushima','avariat');
	INSERT INTO Consecinte
	Values('AEGIS','Batalia Tsushima','avariat');
	INSERT INTO Consecinte
	Values('Kira','Batalia Tsushima','nevatamat');
	--triggere
	INSERT INTO Consecinte
	Values('Piatra','Batalia Tsushima','nevatamat');
	--28-May-1905
	
	INSERT INTO Consecinte
	Values('Piatra','Batalia de la Okinawa','avariat');
	--22-Jun-1945
	
	INSERT INTO Consecinte
	Values('HIEI','Batalia de la Okinawa','avariat');
	INSERT INTO Consecinte
	Values('HMS Victory','Batalia de la Okinawa','scufundat');
	INSERT INTO Consecinte
	Values('Kira','Batalia de la Okinawa','nevatamat');
	
-- la exercitii
	INSERT INTO Consecinte
	Values('Georges Leygues','Bat. de la Capul Sarici','avariat');
	INSERT INTO Consecinte
	Values('Fregata Marasesti','Bat. de la Capul Sarici','avariat');
	INSERT INTO Consecinte
	Values('HIEI','Bat. de la Capul Sarici','nevatamat');
	
				
--10.3
--a
	SELECT clasa AS "Clasa", tara AS "Tara", deplasament AS "Deplasamentul"
	FROM Clase 
	WHERE tip = 'vas de linie' AND (deplasament > 2000 AND deplasament < 4000)
	ORDER BY tara DESC, deplasament ASC;


--b
	SELECT nume AS "Nume nava", anul_lansarii AS "Anul lansarii"
	FROM Nave
	WHERE(anul_lansarii > 1975)
	ORDER BY anul_lansarii;


--10.4
--a
---coloanele au nume diferite in cele 3 tabele
---clase pot lega cu nave prin coloana clasa -->se putea si un JOIN USING
--- iar nave cu consecinte prin coloana nume/nava
	SELECT Consecinte.nava AS "Numele navei", Clase.deplasament AS "Deplasamentul", Clase.nr_arme AS "Numarul de arme"
	FROM Consecinte JOIN Nave ON (Consecinte.nava = Nave.nume) JOIN Clase ON (Nave.clasa = Clase.clasa)
	WHERE ( Consecinte.batalie ='Bat. de la Capul Sarici' AND Consecinte.rezultat = 'avariat');


--b
	SELECT DISTINCT n.tara AS "Tara1", p.tara AS "Tara2"
	FROM Clase n CROSS JOIN Clase p
	WHERE (n.deplasament = p.deplasament AND n.tip = p.tip AND n.tara != p.tara AND n.tara<p.tara);

--sau, cu acelasi rezultat, mai putem rezolva cu un inner join

	SELECT DISTINCT n.tara AS "Tara1", p.tara AS "Tara2"
	FROM Clase n INNER JOIN Clase p
	ON (n.tip = p.tip AND n.deplasament = p.deplasament AND n.tara != p.tara AND n.tara<p.tara);


--10.5
--a
--am pus toate detaliile navei inclusiv ce mosteneste de la clasa din care face parte
	SELECT*
	FROM nave JOIN clase ON (nave.clasa=clase.clasa)
	WHERE (nave.clasa IN ( Select clasa
					  From Clase
				      where (nr_arme = (SELECT nr_arme 
									FROM Clase 
									ORDER BY nr_arme
									FETCH FIRST 1 ROWS ONLY))));
--b

    SELECT DISTINCT nava AS "Nave"
	FROM Consecinte
	WHERE batalie IN((SELECT batalie
					  FROM consecinte
					  WHERE nava IN(SELECT nume
							FROM Nave
							WHERE (clasa = 'Kongo')))) 
	MINUS
		SELECT nume
		FROM Nave
		WHERE(clasa = 'Kongo');
	
--sau putem face si cu join, acelasi rezultat

	SELECT DISTINCT nume
	FROM Nave n JOIN Consecinte c ON (n.nume=c.nava)
	WHERE c.batalie IN(SELECT batalie FROM Consecinte c JOIN nave n ON(n.nume=c.nava) WHERE n.clasa ='Kongo') AND n.clasa <>'Kongo';
									
--10.6
--a 
	SELECT tara AS "Tara"
	FROM Clase
	WHERE clasa IN(SELECT clasa
		       FROM Clase
	               WHERE (diametru_tun = (SELECT MAX(diametru_tun)
					      FROM Clase
					      WHERE tip = 'cuirasat')) 
								     AND tip='cuirasat');
--b
---trebuie sa numaram clasele din fiecare rezultat care ar exista pentru fiecare batalie

	SELECT batalie, rezultat,  COUNT (DISTINCT clasa) AS "Numar clase din categoria"
	FROM Consecinte c JOIN Nave n ON (n.nume=c.nava)
	GROUP BY ( batalie, rezultat)
	ORDER BY batalie;
	
--10.7
--a 

    INSERT INTO Clase
	VALUES('Nelson','vas de linie','MAREA BRITANIE',9,16,34000);
	INSERT INTO Nave
	VALUES('Nelson','Nelson',1927);
	INSERT INTO Nave
	VALUES('Rodney','Nelson',1927);
	
--b
	DELETE
	FROM Batalii
	WHERE nume NOT IN(SELECT batalie FROM consecinte);

--c
	UPDATE Clase
	SET nr_arme = nr_arme + nr_arme*0.1, diametru_tun = diametru_tun + diametru_tun*0.1
	WHERE(tip = 'crucisator' AND tara = 'FRANTA');

-- si daca vrem un numar intreg de arme si diametru tun, care in realitate sunt un numar exact

	UPDATE Clase
	SET nr_arme=CEIL(nr_arme),diametru_tun=CEIL(diametru_tun)
	WHERE(tip = 'crucisator' AND tara = 'FRANTA');


--10.8
--a
	CREATE OR REPLACE TRIGGER ck_depl
	BEFORE INSERT OR UPDATE
	ON Clase
	FOR EACH ROW
	WHEN(NEW.deplasament>74000 AND NEW.tip ='cuirasat')
	BEGIN
	:NEW.deplasament := 74000;
	END;
    /
	
	--modifica la 74000 deplasamnetul, deoarece tipul este cuirasat si depl>74000
	INSERT INTO Clase
	VALUES('Kingo','cuirasat','JAPONIA',10,6,74100);
	--nu modifica, depl<74000
	INSERT INTO Clase
	VALUES('Kero','cuirasat','JAPONIA',10,6,54100);
	--nu e cuirasat
	INSERT INTO Clase
	VALUES('Ja','vas de linie','JAPONIA',10,6,99100);
	
--b
	CREATE OR REPLACE TRIGGER ck_scufundat
	BEFORE UPDATE
	ON Consecinte
	FOR EACH ROW
	WHEN(NEW.rezultat='scufundat')
	DECLARE
	pragma autonomous_transaction;
	v_nava VARCHAR2(20);
	v_batalie VARCHAR2(25);
	v_data_ultima_batalie DATE;
	v_data_curenta_batalie DATE;
	BEGIN
	v_nava:=:NEW.nava;
	v_batalie:=:NEW.batalie;
	
	SELECT data INTO v_data_curenta_batalie
	FROM batalii
	WHERE nume = v_batalie;
	
	SELECT data INTO v_data_ultima_batalie
	FROM batalii
	WHERE nume IN(SELECT batalie FROM Consecinte WHERE nava = v_nava )
	ORDER BY data DESC
	FETCH FIRST 1 ROWS ONLY;
	
	IF(v_data_curenta_batalie < v_data_ultima_batalie) THEN
	 RAISE_APPLICATION_ERROR(-20221,'Nu poti sa modifici starea, nava a participat la o alta batalie, ulterioara bataliei curente');
	END IF;
	END;
	/
	--incercare, nu se poate modifica deoarece exista o batalie Batalia de la Ochinawa, care s-a desf dupa Tsushima, iar nava a participat ulterior
	UPDATE CONSECINTE
	SET rezultat = 'scufundat'
	WHERE nava = 'HIEI' AND batalie = 'Batalia Tsushima';
	
	--se poate sa modificam la scufundat deoarece nava Hiei nu a mai participat la o batalie ulterioara
	UPDATE CONSECINTE
	SET rezultat = 'scufundat'
	WHERE nava = 'HIEI' AND batalie = 'Batalia de la Okinawa';
--c
   ---am creat vederea
	CREATE VIEW NaveRomania AS
	SELECT clasa, nume, tip, nr_arme, diametru_tun, deplasament, anul_lansarii
	FROM Clase NATURAL JOIN Nave
	WHERE tara = 'Romania';
	
	CREATE OR REPLACE TRIGGER nave_ro_trig
	INSTEAD OF INSERT ON NaveRomania
	FOR EACH ROW
	DECLARE 
        counter NUMBER:=0;
	BEGIN
        SELECT COUNT(*) INTO counter
        FROM Clase 
        WHERE(clasa = :NEW.clasa);
   
        IF(counter = 0) THEN
		INSERT INTO Clase(clasa,tip,tara,nr_arme,diametru_tun,deplasament)
		VALUES(:NEW.clasa, :NEW.tip,'ROMANIA',:NEW.nr_arme,:NEW.diametru_tun,:NEW.deplasament);
        END IF;
	
	INSERT INTO Nave(nume,clasa,anul_lansarii)
	VALUES(:NEW.nume,:NEW.clasa,:NEW.anul_lansarii);
	END;
	/
    
	INSERT INTO NaveRomania
	VALUES('Forta','Peace','vas de linie',9,16,34000,1992);
	INSERT INTO NaveRomania
	VALUES('Karaiman','Elogia','vas de linie',9,16,27000,1999);
	---aceeasi clasa, alta nava, deci se poate insera( o clasa poate sa aiba mai multe nave)
	INSERT INTO NaveRomania
	VALUES('Karaiman','El','vas de linie',9,16,27000,1999);
	
	SELECT* FROM Clase;
	SELECT* FROM Nave;