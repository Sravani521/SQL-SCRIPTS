
--CREATING TABLE FOR COUNTRY--
CREATE TABLE COUNTRY
(
	ID INT PRIMARY KEY IDENTITY(1,1),
	NAME VARCHAR(50) NOT NULL
)
--CREATEING TABLE FOR POLITICIAN--
CREATE TABLE POLITICIAN
(
	ID INT IDENTITY(1,1),
	NAME VARCHAR(50) NOT NULL,
	COUNTRYID INT FOREIGN KEY REFERENCES COUNTRY(ID)
)


--INSERTING DATA--
INSERT INTO COUNTRY
VALUES('USA')
INSERT INTO COUNTRY
VALUES('GERMANY')
INSERT INTO COUNTRY
VALUES('INDIA')
INSERT INTO COUNTRY
VALUES('AFRICA')
INSERT INTO COUNTRY
VALUES('RUSSIA')


--RETREIVING DATA FROM THE TABLE--
SELECT * FROM COUNTRY


--INSERTING DATA INTO THE POLITICIAN--
INSERT INTO POLITICIAN
VALUES('OBAMA',1)
INSERT INTO POLITICIAN
VALUES('HITLER',2)
INSERT INTO POLITICIAN
VALUES('NEHRU',3)
INSERT INTO POLITICIAN
VALUES('SUSHMA SWARAJ',3)
INSERT INTO POLITICIAN
VALUES('MANDELA',4)
INSERT INTO POLITICIAN
VALUES('SMRITI IRANI',NULL)



--RETRIEVAL OF DATA FROM THE POLITICIAN TABLE--
SELECT * FROM POLITICIAN



--USING JOIN RETREIVING DATA FROM BOTH THE TABLES 

SELECT P.NAME,C.NAME,P.COUNTRYID FROM COUNTRY C JOIN POLITICIAN P
ON C.ID=P.COUNTRYID
ORDER BY P.NAME ASC


SELECT  P.NAME,C.NAME,P.COUNTRYID FROM COUNTRY C LEFT OUTER JOIN POLITICIAN P
ON C.ID=P.COUNTRYID

 
 SELECT  P.NAME,C.NAME,P.COUNTRYID FROM COUNTRY C RIGHT OUTER JOIN POLITICIAN P
ON C.ID=P.COUNTRYID


 SELECT  P.NAME,C.NAME,P.COUNTRYID FROM COUNTRY C FULL OUTER JOIN POLITICIAN P
ON C.ID=P.COUNTRYID

SELECT  * FROM COUNTRY C  INNER JOIN POLITICIAN P
ON C.ID=P.COUNTRYID
ORDER BY C.NAME ASC


--ADDING A COLUMN TO EXISTING TABLE

ALTER TABLE POLITICIAN
ADD  AGE INT CHECK(AGE>25)  

ALTER TABLE POLITICIAN
ADD ACTIVE BIT 


--UPDATING THE eXISTING DATA

UPDATE  POLITICIAN
SET COUNTRYID=3 WHERE NAME='SMRITI IRANI' 


UPDATE  POLITICIAN
SET AGE='34' WHERE COUNTRYID=3
UPDATE  POLITICIAN
SET AGE='30' WHERE COUNTRYID=1
UPDATE  POLITICIAN
SET AGE='29' WHERE COUNTRYID=2


--DELETING THE ROWS

DELETE FROM POLITICIAN
WHERE ID=3



--DELETING ENTIRE COLUMN

ALTER TABLE POLITICIAN
DROP COLUMN ACTIVE

--USING DISTINCT 

SELECT DISTINCT COUNTRYID
FROM POLITICIAN

--USING AND  OR

SELECT * FROM POLITICIAN
WHERE AGE=34 AND COUNTRYID=3

SELECT * FROM POLITICIAN
WHERE AGE=34 OR COUNTRYID=2


--USING IN

SELECT * FROM COUNTRY
WHERE ID IN(1,2)

--MODIFYING COLUMN

ALTER TABLE POLITICIAN
ALTER COLUMN  NAME NVARCHAR(50)

--JOINING THE FOUR TABLES
SELECT P.NAME,PT.NAME,C.NAME FROM POLITICIAN P JOIN COUNTRY C 
ON P.COUNTRYID=C.ID
JOIN POLITICIANDETAIL PD ON PD.POLITICIANID=P.ID
JOIN PORTFOLIO PT ON PT.ID=PD.PORTFOLIOID









                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       













