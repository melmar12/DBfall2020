/* hard - repeated integers */ 
DROP table if exists A;
DROP table if exists B;

Create table A (i int);
Create table B (i int);

Insert into A values (11);
Insert into A values (6);
Insert into A values (11);
Insert into A values (87);
Insert into A values (36);
Insert into A values (10);

Insert into B values (51);
Insert into B values (25);
Insert into B values (51);
Insert into B values (10);
Insert into B values (87);
Insert into B values (11);