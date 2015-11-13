-- 
-- Acteur A
--
-- Acteur A ; Version 1
drop table if exists A_1_affleurant;
create table A_1_affleurant as 
(select * from affleurant where id like 'M11%');

drop table if exists A_1_batiment;
create table A_1_batiment as 
(select * from batiment where id like 'M11%');

drop table if exists A_1_bordure;
create table A_1_bordure as 
(select * from bordure where id like 'M11%');

drop table if exists A_1_case_00140_00100;
create table A_1_case_00140_00100 as 
(select * from case_00140_00100 where id like 'M11%');

drop table if exists A_1_cloture;
create table A_1_cloture as 
(select * from cloture where id like 'M11%');

-- Acteur A ; Version 2
drop table if exists A_2_affleurant;
create table A_2_affleurant as 
(select * from affleurant where id like 'M12%' or id like 'M21%');

drop table if exists A_2_batiment;
create table A_2_batiment as 
(select * from batiment where id like 'M12%' or id like 'M21%');

drop table if exists A_2_bordure;
create table A_2_bordure as 
(select * from bordure where id like 'M12%' or id like 'M21%');

drop table if exists A_2_case_00140_00100;
create table A_2_case_00140_00100 as 
(select * from case_00140_00100 where id like 'M12%' or id like 'M21%');

drop table if exists A_2_cloture;
create table A_2_cloture as 
(select * from cloture where id like 'M12%' or id like 'M21%');

-- Acteur A ; Version 3
drop table if exists A_3_affleurant;
create table A_3_affleurant as 
(select * from affleurant where id like 'M13%' or id like 'M22%' or id like 'M31%');

drop table if exists A_3_batiment;
create table A_3_batiment as 
(select * from batiment where id like 'M13%' or id like 'M22%' or id like 'M31%');

drop table if exists A_3_bordure;
create table A_3_bordure as 
(select * from bordure where id like 'M13%' or id like 'M22%' or id like 'M31%');

drop table if exists A_3_case_00140_00100;
create table A_3_case_00140_00100 as 
(select * from case_00140_00100 where id like 'M13%' or id like 'M22%' or id like 'M31%');

drop table if exists A_3_cloture;
create table A_3_cloture as 
(select * from cloture where id like 'M13%' or id like 'M22%' or id like 'M31%');

-- Acteur A ; Version 4
drop table if exists A_4_affleurant;
create table A_4_affleurant as 
(select * from affleurant where id like 'M14%' or id like 'M23%' or id like 'M32%' or id like 'M41%');

drop table if exists A_4_batiment;
create table A_4_batiment as 
(select * from batiment where id like 'M14%' or id like 'M23%' or id like 'M32%' or id like 'M41%');

drop table if exists A_4_bordure;
create table A_4_bordure as 
(select * from bordure where id like 'M14%' or id like 'M23%' or id like 'M32%' or id like 'M41%');

drop table if exists A_4_case_00140_00100;
create table A_4_case_00140_00100 as 
(select * from case_00140_00100 where id like 'M14%' or id like 'M23%' or id like 'M32%' or id like 'M41%');

drop table if exists A_4_cloture;
create table A_4_cloture as 
(select * from cloture where id like 'M14%' or id like 'M23%' or id like 'M32%' or id like 'M41%');

-- Acteur A ; Version 5
drop table if exists A_5_affleurant;
create table A_5_affleurant as 
(select * from affleurant where id like 'M15%' or id like 'M24%' or id like 'M33%' or id like 'M42%' or id like 'M51%');

drop table if exists A_5_batiment;
create table A_5_batiment as 
(select * from batiment where id like 'M15%' or id like 'M24%' or id like 'M33%' or id like 'M42%' or id like 'M51%');

drop table if exists A_5_bordure;
create table A_5_bordure as 
(select * from bordure where id like 'M15%' or id like 'M24%' or id like 'M33%' or id like 'M42%' or id like 'M51%');

drop table if exists A_5_case_00140_00100;
create table A_5_case_00140_00100 as 
(select * from case_00140_00100 where id like 'M15%' or id like 'M24%' or id like 'M33%' or id like 'M42%' or id like 'M51%');

drop table if exists A_5_cloture;
create table A_5_cloture as 
(select * from cloture where id like 'M15%' or id like 'M24%' or id like 'M33%' or id like 'M42%' or id like 'M51%');


-- 
-- Acteur B
--
-- Acteur B ; Version 1
drop table if exists B_1_affleurant;
create table B_1_affleurant as 
(select * from affleurant where id like 'M51%');

drop table if exists B_1_batiment;
create table B_1_batiment as 
(select * from batiment where id like 'M51%');

drop table if exists B_1_bordure;
create table B_1_bordure as 
(select * from bordure where id like 'M51%');

drop table if exists B_1_case_00140_00100;
create table B_1_case_00140_00100 as 
(select * from case_00140_00100 where id like 'M51%');

drop table if exists B_1_cloture;
create table B_1_cloture as 
(select * from cloture where id like 'M51%');

-- Acteur B ; Version 2
drop table if exists B_2_affleurant;
create table B_2_affleurant as 
(select * from affleurant where id like 'M41%' or id like 'M52%');

drop table if exists B_2_batiment;
create table B_2_batiment as 
(select * from batiment where id like 'M41%' or id like 'M52%');

drop table if exists B_2_bordure;
create table B_2_bordure as 
(select * from bordure where id like 'M41%' or id like 'M52%');

drop table if exists B_2_case_00140_00100;
create table B_2_case_00140_00100 as 
(select * from case_00140_00100 where id like 'M41%' or id like 'M52%');

drop table if exists B_2_cloture;
create table B_2_cloture as 
(select * from cloture where id like 'M41%' or id like 'M52%');

-- Acteur B ; Version 3
drop table if exists B_3_affleurant;
create table B_3_affleurant as 
(select * from affleurant where id like 'M31%' or id like 'M42%' or id like 'M53%');

drop table if exists B_3_batiment;
create table B_3_batiment as 
(select * from batiment where id like 'M31%' or id like 'M42%' or id like 'M53%');

drop table if exists B_3_bordure;
create table B_3_bordure as 
(select * from bordure where id like 'M31%' or id like 'M42%' or id like 'M53%');

drop table if exists B_3_case_00140_00100;
create table B_3_case_00140_00100 as 
(select * from case_00140_00100 where id like 'M31%' or id like 'M42%' or id like 'M53%');

drop table if exists B_3_cloture;
create table B_3_cloture as 
(select * from cloture where id like 'M31%' or id like 'M42%' or id like 'M53%');

-- Acteur B ; Version 4
drop table if exists B_4_affleurant;
create table B_4_affleurant as 
(select * from affleurant where id like 'M21%' or id like 'M32%' or id like 'M43%' or id like 'M54%');

drop table if exists B_4_batiment;
create table B_4_batiment as 
(select * from batiment where id like 'M21%' or id like 'M32%' or id like 'M43%' or id like 'M54%');

drop table if exists B_4_bordure;
create table B_4_bordure as 
(select * from bordure where id like 'M21%' or id like 'M32%' or id like 'M43%' or id like 'M54%');

drop table if exists B_4_case_00140_00100;
create table B_4_case_00140_00100 as 
(select * from case_00140_00100 where id like 'M21%' or id like 'M32%' or id like 'M43%' or id like 'M54%');

drop table if exists B_4_cloture;
create table B_4_cloture as 
(select * from cloture where id like 'M21%' or id like 'M32%' or id like 'M43%' or id like 'M54%');

-- Acteur B ; Version 5
drop table if exists B_5_affleurant;
create table B_5_affleurant as 
(select * from affleurant where id like 'M11%' or id like 'M22%' or id like 'M33%' or id like 'M44%' or id like 'M55%');

drop table if exists B_5_batiment;
create table B_5_batiment as 
(select * from batiment where id like 'M11%' or id like 'M22%' or id like 'M33%' or id like 'M44%' or id like 'M55%');

drop table if exists B_5_bordure;
create table B_5_bordure as 
(select * from bordure where id like 'M11%' or id like 'M22%' or id like 'M33%' or id like 'M44%' or id like 'M55%');

drop table if exists B_5_case_00140_00100;
create table B_5_case_00140_00100 as 
(select * from case_00140_00100 where id like 'M11%' or id like 'M22%' or id like 'M33%' or id like 'M44%' or id like 'M55%');

drop table if exists B_5_cloture;
create table B_5_cloture as 
(select * from cloture where id like 'M11%' or id like 'M22%' or id like 'M33%' or id like 'M44%' or id like 'M55%');

-- 
-- Acteur C
--
-- Acteur C ; Version 1
drop table if exists C_1_affleurant;
create table C_1_affleurant as 
(select * from affleurant where id like 'M55%');

drop table if exists C_1_batiment;
create table C_1_batiment as 
(select * from batiment where id like 'M55%');

drop table if exists C_1_bordure;
create table C_1_bordure as 
(select * from bordure where id like 'M55%');

drop table if exists C_1_case_00140_00100;
create table C_1_case_00140_00100 as 
(select * from case_00140_00100 where id like 'M55%');

drop table if exists C_1_cloture;
create table C_1_cloture as 
(select * from cloture where id like 'M55%');

-- Acteur C ; Version 2
drop table if exists C_2_affleurant;
create table C_2_affleurant as 
(select * from affleurant where id like 'M45%' or id like 'M54%');

drop table if exists C_2_batiment;
create table C_2_batiment as 
(select * from batiment where id like 'M45%' or id like 'M54%');

drop table if exists C_2_bordure;
create table C_2_bordure as 
(select * from bordure where id like 'M45%' or id like 'M54%');

drop table if exists C_2_case_00140_00100;
create table C_2_case_00140_00100 as 
(select * from case_00140_00100 where id like 'M45%' or id like 'M54%');

drop table if exists C_2_cloture;
create table C_2_cloture as 
(select * from cloture where id like 'M45%' or id like 'M54%');

-- Acteur C ; Version 3
drop table if exists C_3_affleurant;
create table C_3_affleurant as 
(select * from affleurant where id like 'M35%' or id like 'M44%' or id like 'M53%');

drop table if exists C_3_batiment;
create table C_3_batiment as 
(select * from batiment where id like 'M35%' or id like 'M44%' or id like 'M53%');

drop table if exists C_3_bordure;
create table C_3_bordure as 
(select * from bordure where id like 'M35%' or id like 'M44%' or id like 'M53%');

drop table if exists C_3_case_00140_00100;
create table C_3_case_00140_00100 as 
(select * from case_00140_00100 where id like 'M35%' or id like 'M44%' or id like 'M53%');

drop table if exists C_3_cloture;
create table C_3_cloture as 
(select * from cloture where id like 'M35%' or id like 'M44%' or id like 'M53%');

-- Acteur C ; Version 4
drop table if exists C_4_affleurant;
create table C_4_affleurant as 
(select * from affleurant where id like 'M25%' or id like 'M34%' or id like 'M43%' or id like 'M52%');

drop table if exists C_4_batiment;
create table C_4_batiment as 
(select * from batiment where id like 'M25%' or id like 'M34%' or id like 'M43%' or id like 'M52%');

drop table if exists C_4_bordure;
create table C_4_bordure as 
(select * from bordure where id like 'M25%' or id like 'M34%' or id like 'M43%' or id like 'M52%');

drop table if exists C_4_case_00140_00100;
create table C_4_case_00140_00100 as 
(select * from case_00140_00100 where id like 'M25%' or id like 'M34%' or id like 'M43%' or id like 'M52%');

drop table if exists C_4_cloture;
create table C_4_cloture as 
(select * from cloture where id like 'M25%' or id like 'M34%' or id like 'M43%' or id like 'M52%');

-- Acteur C ; Version 5
drop table if exists C_5_affleurant;
create table C_5_affleurant as 
(select * from affleurant where id like 'M15%' or id like 'M24%' or id like 'M33%' or id like 'M42%' or id like 'M51%');

drop table if exists C_5_batiment;
create table C_5_batiment as 
(select * from batiment where id like 'M15%' or id like 'M24%' or id like 'M33%' or id like 'M42%' or id like 'M51%');

drop table if exists C_5_bordure;
create table C_5_bordure as 
(select * from bordure where id like 'M15%' or id like 'M24%' or id like 'M33%' or id like 'M42%' or id like 'M51%');

drop table if exists C_5_case_00140_00100;
create table C_5_case_00140_00100 as 
(select * from case_00140_00100 where id like 'M15%' or id like 'M24%' or id like 'M33%' or id like 'M42%' or id like 'M51%');

drop table if exists C_5_cloture;
create table C_5_cloture as 
(select * from cloture where id like 'M15%' or id like 'M24%' or id like 'M33%' or id like 'M42%' or id like 'M51%');


-- 
-- Acteur D
--
-- Acteur D ; Version 1
drop table if exists D_1_affleurant;
create table D_1_affleurant as 
(select * from affleurant where id like 'M15%');

drop table if exists D_1_batiment;
create table D_1_batiment as 
(select * from batiment where id like 'M15%');

drop table if exists D_1_bordure;
create table D_1_bordure as 
(select * from bordure where id like 'M15%');

drop table if exists D_1_case_00140_00100;
create table D_1_case_00140_00100 as 
(select * from case_00140_00100 where id like 'M15%');

drop table if exists D_1_cloture;
create table D_1_cloture as 
(select * from cloture where id like 'M15%');

-- Acteur D ; Version 2
drop table if exists D_2_affleurant;
create table D_2_affleurant as 
(select * from affleurant where id like 'M14%' or id like 'M25%');

drop table if exists D_2_batiment;
create table D_2_batiment as 
(select * from batiment where id like 'M14%' or id like 'M25%');

drop table if exists D_2_bordure;
create table D_2_bordure as 
(select * from bordure where id like 'M14%' or id like 'M25%');

drop table if exists D_2_case_00140_00100;
create table D_2_case_00140_00100 as 
(select * from case_00140_00100 where id like 'M14%' or id like 'M25%');

drop table if exists D_2_cloture;
create table D_2_cloture as 
(select * from cloture where id like 'M14%' or id like 'M25%');

-- Acteur D ; Version 3
drop table if exists D_3_affleurant;
create table D_3_affleurant as 
(select * from affleurant where id like 'M13%' or id like 'M24%' or id like 'M35%');

drop table if exists D_3_batiment;
create table D_3_batiment as 
(select * from batiment where id like 'M13%' or id like 'M24%' or id like 'M35%');

drop table if exists D_3_bordure;
create table D_3_bordure as 
(select * from bordure where id like 'M13%' or id like 'M24%' or id like 'M35%');

drop table if exists D_3_case_00140_00100;
create table D_3_case_00140_00100 as 
(select * from case_00140_00100 where id like 'M13%' or id like 'M24%' or id like 'M35%');

drop table if exists D_3_cloture;
create table D_3_cloture as 
(select * from cloture where id like 'M13%' or id like 'M24%' or id like 'M35%');

-- Acteur D ; Version 4
drop table if exists D_4_affleurant;
create table D_4_affleurant as 
(select * from affleurant where id like 'M12%' or id like 'M23%' or id like 'M34%' or id like 'M45%');

drop table if exists D_4_batiment;
create table D_4_batiment as 
(select * from batiment where id like 'M12%' or id like 'M23%' or id like 'M34%' or id like 'M45%');

drop table if exists D_4_bordure;
create table D_4_bordure as 
(select * from bordure where id like 'M12%' or id like 'M23%' or id like 'M34%' or id like 'M45%');

drop table if exists D_4_case_00140_00100;
create table D_4_case_00140_00100 as 
(select * from case_00140_00100 where id like 'M12%' or id like 'M23%' or id like 'M34%' or id like 'M45%');

drop table if exists D_4_cloture;
create table D_4_cloture as 
(select * from cloture where id like 'M12%' or id like 'M23%' or id like 'M34%' or id like 'M45%');

-- Acteur D ; Version 5
drop table if exists D_5_affleurant;
create table D_5_affleurant as 
(select * from affleurant where id like 'M11%' or id like 'M22%' or id like 'M33%' or id like 'M44%' or id like 'M55%');

drop table if exists D_5_batiment;
create table D_5_batiment as 
(select * from batiment where id like 'M11%' or id like 'M22%' or id like 'M33%' or id like 'M44%' or id like 'M55%');

drop table if exists D_5_bordure;
create table D_5_bordure as 
(select * from bordure where id like 'M11%' or id like 'M22%' or id like 'M33%' or id like 'M44%' or id like 'M55%');

drop table if exists D_5_case_00140_00100;
create table D_5_case_00140_00100 as 
(select * from case_00140_00100 where id like 'M11%' or id like 'M22%' or id like 'M33%' or id like 'M44%' or id like 'M55%');

drop table if exists D_5_cloture;
create table D_5_cloture as 
(select * from cloture where id like 'M11%' or id like 'M22%' or id like 'M33%' or id like 'M44%' or id like 'M55%');


select * from D_5_affleurant;
select * from D_5_batiment;
select * from D_5_bordure;
select * from D_5_case_00140_00100;
select * from D_5_cloture;