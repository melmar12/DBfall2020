/* containment {1,2} ⊂ {1,2,2} -> F */
DROP table if exists A;
DROP table if exists B;

Create table A (i int);
Create table B (i int);

Insert into A values (1);
Insert into A values (2);

Insert into B values (1);
Insert into B values (2);
Insert into B values (2);