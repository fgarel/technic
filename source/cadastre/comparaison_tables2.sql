
DROP SCHEMA IF EXISTS comparaison_auto CASCADE;
CREATE SCHEMA comparaison_auto AUTHORIZATION opengeo;

-- -------------------------------
-- comparaison des tables 01 et 02
-- -------------------------------

-- A = 11
select *
from table_01;

-- B = 10
select *
from table_02;

-- inner join = A inter B = 5
DROP VIEW IF EXISTS comparaison_auto.inter_01_02;
CREATE VIEW comparaison_auto.inter_01_02 AS
SELECT 
  table_01.id as table_01_id,
  table_01.libelle1 as table_01_libelle1,
  table_01.libelle2 as table_01_libelle2,
  table_02.id as table_02_id,
  table_02.libelle1 as table_02_libelle1,
  table_02.libelle2 as table_02_libelle2
FROM table_01
  INNER JOIN table_02
    ON table_01.id = table_02.id;

-- left join = A = 11
select *
from table_01
  left join table_02
    on table_01.id = table_02.id;
    
-- right join = B = 10
select *
from table_01
  right join table_02
    on table_01.id = table_02.id;

-- full join = A union B = 16
DROP VIEW IF EXISTS comparaison_auto.union_01_02;
create view comparaison_auto.union_01_02 as
select
  table_01.id as table_01_id,
  table_01.libelle1 as table_01_libelle1,
  table_01.libelle2 as table_01_libelle2,
  table_02.id as table_02_id,
  table_02.libelle1 as table_02_libelle1,
  table_02.libelle2 as table_02_libelle2
from table_01
  full join table_02
    on table_01.id = table_02.id;

--  = A - (A inter B) = 11 - 5 = 6
DROP VIEW IF EXISTS comparaison_auto.diff_01_02_01;
CREATE VIEW comparaison_auto.diff_01_02_01 AS
select
  table_01.id as table_01_id,
  table_01.libelle1 as table_01_libelle1,
  table_01.libelle2 as table_01_libelle2
from table_01
    WHERE NOT EXISTS (
      select *
      from table_02
      where table_01.id=table_02.id);
      
--  = B - (A inter B) = 10 - 5 = 5
DROP VIEW IF EXISTS comparaison_auto.diff_01_02_02;
CREATE VIEW comparaison_auto.diff_01_02_02 AS
select
  table_02.id as table_02_id,
  table_02.libelle1 as table_02_libelle1,
  table_02.libelle2 as table_02_libelle2
from table_02
    WHERE NOT EXISTS (
      select *
      from table_01
      where table_01.id=table_02.id);
      
--  = A - (A inter B) = 11 - 5 = 6
DROP VIEW IF EXISTS comparaison_auto.diff_01_02_00;
CREATE VIEW comparaison_auto.diff_01_02_00 AS
select
  table_01.id as table_01_id,
  table_01.libelle1 as table_01_libelle1,
  table_01.libelle2 as table_01_libelle2,
  table_02.id as table_02_id,
  table_02.libelle1 as table_02_libelle1,
  table_02.libelle2 as table_02_libelle2
from table_02
  full join table_01
    on table_01.id = table_02.id
    WHERE NOT EXISTS (
      select *
      from table_01
      where table_01.id=table_02.id);


-- -------------------------------
-- comparaison des tables 02 et 03
-- -------------------------------


-- inner join = A inter B
DROP VIEW IF EXISTS comparaison_auto.inter_02_03;
CREATE VIEW comparaison_auto.inter_02_03 AS
SELECT 
  table_02.id as table_02_id,
  table_02.libelle1 as table_02_libelle1,
  table_02.libelle2 as table_02_libelle2,
  table_03.id as table_03_id,
  table_03.libelle1 as table_03_libelle1,
  table_03.libelle2 as table_03_libelle2
FROM table_02
  INNER JOIN table_03
    ON table_02.id = table_03.id;

-- full join = A union B
DROP VIEW IF EXISTS comparaison_auto.union_02_03;
create view comparaison_auto.union_02_03 as
select
  table_02.id as table_02_id,
  table_02.libelle1 as table_02_libelle1,
  table_02.libelle2 as table_02_libelle2,
  table_03.id as table_03_id,
  table_03.libelle1 as table_03_libelle1,
  table_03.libelle2 as table_03_libelle2
from table_02
  full join table_03
    on table_02.id = table_03.id;

--  = A - (A inter B)
DROP VIEW IF EXISTS comparaison_auto.diff_02_03_00;
CREATE VIEW comparaison_auto.diff_02_03_00 AS
select
  table_02.id as table_02_id,
  table_02.libelle1 as table_02_libelle1,
  table_02.libelle2 as table_02_libelle2,
  table_03.id as table_03_id,
  table_03.libelle1 as table_03_libelle1,
  table_03.libelle2 as table_03_libelle2
from table_02
  full join table_03
    on table_02.id = table_03.id
    WHERE NOT EXISTS (
      select *
      from table_02
      where table_02.id=table_03.id);

--  = A - (A inter B)
DROP VIEW IF EXISTS comparaison_auto.diff_02_03_01;
CREATE VIEW comparaison_auto.diff_02_03_01 AS
select
  table_02.id as table_02_id,
  table_02.libelle1 as table_02_libelle1,
  table_02.libelle2 as table_02_libelle2
from table_02
    WHERE NOT EXISTS (
      select *
      from table_03
      where table_02.id=table_03.id);
      
--  = B - (A inter B)
DROP VIEW IF EXISTS comparaison_auto.diff_02_03_02;
CREATE VIEW comparaison_auto.diff_02_03_02 AS
select
  table_03.id as table_03_id,
  table_03.libelle1 as table_03_libelle1,
  table_03.libelle2 as table_03_libelle2
from table_03
    WHERE NOT EXISTS (
      select *
      from table_02
      where table_02.id=table_03.id);
      


