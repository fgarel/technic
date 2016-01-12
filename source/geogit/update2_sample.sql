-- 
-- Acteur A
--
-- Acteur A ; Version 1
drop table if exists "A_1_case_00140_00100";
create table "A_1_case_00140_00100" as 
(select * from "case_00140_00100" where id like 'M11%');

drop table if exists "A_1_AffleurantSymbole";
create table "A_1_AffleurantSymbole" as 
(select * from "AffleurantSymbole" where id like 'M11%');

drop table if exists "A_1_Arbre";
create table "A_1_Arbre" as 
(select * from "Arbre" where id like 'M11%');

drop table if exists "A_1_Bordure";
create table "A_1_Bordure" as 
(select * from "Bordure" where id like 'M11%');

drop table if exists "A_1_Emprise";
create table "A_1_Emprise" as 
(select * from "Emprise" where id like 'M11%');

drop table if exists "A_1_Facade";
create table "A_1_Facade" as 
(select * from "Facade" where id like 'M11%');

drop table if exists "A_1_Haie";
create table "A_1_Haie" as 
(select * from "Haie" where id like 'M11%');

drop table if exists "A_1_Mur";
create table "A_1_Mur" as 
(select * from "Mur" where id like 'M11%');

drop table if exists "A_1_PointCanevas";
create table "A_1_PointCanevas" as 
(select * from "PointCanevas" where id like 'M11%');

-- Acteur A ; Version 2
drop table if exists "A_2_case_00140_00100";
create table "A_2_case_00140_00100" as 
(select * from "case_00140_00100" where id like 'M12%' or id like 'M21%');

drop table if exists "A_2_AffleurantSymbole";
create table "A_2_AffleurantSymbole" as 
(select * from "AffleurantSymbole" where id like 'M12%' or id like 'M21%');

drop table if exists "A_2_Arbre";
create table "A_2_Arbre" as 
(select * from "Arbre" where id like 'M12%' or id like 'M21%');

drop table if exists "A_2_Bordure";
create table "A_2_Bordure" as 
(select * from "Bordure" where id like 'M12%' or id like 'M21%');

drop table if exists "A_2_Emprise";
create table "A_2_Emprise" as 
(select * from "Emprise" where id like 'M12%' or id like 'M21%');

drop table if exists "A_2_Facade";
create table "A_2_Facade" as 
(select * from "Facade" where id like 'M12%' or id like 'M21%');

drop table if exists "A_2_Haie";
create table "A_2_Haie" as 
(select * from "Haie" where id like 'M12%' or id like 'M21%');

drop table if exists "A_2_Mur";
create table "A_2_Mur" as 
(select * from "Mur" where id like 'M12%' or id like 'M21%');

drop table if exists "A_2_PointCanevas";
create table "A_2_PointCanevas" as 
(select * from "PointCanevas" where id like 'M12%' or id like 'M21%');

-- Acteur A ; Version 3
drop table if exists "A_3_case_00140_00100";
create table "A_3_case_00140_00100" as 
(select * from "case_00140_00100" where id like 'M13%' or id like 'M22%' or id like 'M31%');

drop table if exists "A_3_AffleurantSymbole";
create table "A_3_AffleurantSymbole" as 
(select * from "AffleurantSymbole" where id like 'M13%' or id like 'M22%' or id like 'M31%');

drop table if exists "A_3_Arbre";
create table "A_3_Arbre" as 
(select * from "Arbre" where id like 'M13%' or id like 'M22%' or id like 'M31%');

drop table if exists "A_3_Bordure";
create table "A_3_Bordure" as 
(select * from "Bordure" where id like 'M13%' or id like 'M22%' or id like 'M31%');

drop table if exists "A_3_Emprise";
create table "A_3_Emprise" as 
(select * from "Emprise" where id like 'M13%' or id like 'M22%' or id like 'M31%');

drop table if exists "A_3_Facade";
create table "A_3_Facade" as 
(select * from "Facade" where id like 'M13%' or id like 'M22%' or id like 'M31%');

drop table if exists "A_3_Haie";
create table "A_3_Haie" as 
(select * from "Haie" where id like 'M13%' or id like 'M22%' or id like 'M31%');

drop table if exists "A_3_Mur";
create table "A_3_Mur" as 
(select * from "Mur" where id like 'M13%' or id like 'M22%' or id like 'M31%');

drop table if exists "A_3_PointCanevas";
create table "A_3_PointCanevas" as 
(select * from "PointCanevas" where id like 'M13%' or id like 'M22%' or id like 'M31%');

-- Acteur A ; Version 4
drop table if exists "A_4_case_00140_00100";
create table "A_4_case_00140_00100" as 
(select * from "case_00140_00100" where id like 'M14%' or id like 'M23%' or id like 'M32%' or id like 'M41%');

drop table if exists "A_4_AffleurantSymbole";
create table "A_4_AffleurantSymbole" as 
(select * from "AffleurantSymbole" where id like 'M14%' or id like 'M23%' or id like 'M32%' or id like 'M41%');

drop table if exists "A_4_Arbre";
create table "A_4_Arbre" as 
(select * from "Arbre" where id like 'M14%' or id like 'M23%' or id like 'M32%' or id like 'M41%');

drop table if exists "A_4_Bordure";
create table "A_4_Bordure" as 
(select * from "Bordure" where id like 'M14%' or id like 'M23%' or id like 'M32%' or id like 'M41%');

drop table if exists "A_4_Emprise";
create table "A_4_Emprise" as 
(select * from "Emprise" where id like 'M14%' or id like 'M23%' or id like 'M32%' or id like 'M41%');

drop table if exists "A_4_Facade";
create table "A_4_Facade" as 
(select * from "Facade" where id like 'M14%' or id like 'M23%' or id like 'M32%' or id like 'M41%');

drop table if exists "A_4_Haie";
create table "A_4_Haie" as 
(select * from "Haie" where id like 'M14%' or id like 'M23%' or id like 'M32%' or id like 'M41%');

drop table if exists "A_4_Mur";
create table "A_4_Mur" as 
(select * from "Mur" where id like 'M14%' or id like 'M23%' or id like 'M32%' or id like 'M41%');

drop table if exists "A_4_PointCaneavs";
create table "A_4_PointCanevas" as 
(select * from "PointCanevas" where id like 'M14%' or id like 'M23%' or id like 'M32%' or id like 'M41%');

-- Acteur A ; Version 5
drop table if exists "A_5_case_00140_00100";
create table "A_5_case_00140_00100" as 
(select * from "case_00140_00100" where id like 'M15%' or id like 'M24%' or id like 'M33%' or id like 'M42%' or id like 'M51%');

drop table if exists "A_5_AffleurantSymbole";
create table "A_5_AffleurantSymbole" as 
(select * from "AffleurantSymbole" where id like 'M15%' or id like 'M24%' or id like 'M33%' or id like 'M42%' or id like 'M51%');

drop table if exists "A_5_Arbre";
create table "A_5_Arbre" as 
(select * from "Arbre" where id like 'M15%' or id like 'M24%' or id like 'M33%' or id like 'M42%' or id like 'M51%');

drop table if exists "A_5_Bordure";
create table "A_5_Bordure" as 
(select * from "Bordure" where id like 'M15%' or id like 'M24%' or id like 'M33%' or id like 'M42%' or id like 'M51%');

drop table if exists "A_5_Emprise";
create table "A_5_Emprise" as 
(select * from "Emprise" where id like 'M15%' or id like 'M24%' or id like 'M33%' or id like 'M42%' or id like 'M51%');

drop table if exists "A_5_Facade";
create table "A_5_Facade" as 
(select * from "Facade" where id like 'M15%' or id like 'M24%' or id like 'M33%' or id like 'M42%' or id like 'M51%');

drop table if exists "A_5_Haie";
create table "A_5_Haie" as 
(select * from "Haie" where id like 'M15%' or id like 'M24%' or id like 'M33%' or id like 'M42%' or id like 'M51%');

drop table if exists "A_5_Mur";
create table "A_5_Mur" as 
(select * from "Mur" where id like 'M15%' or id like 'M24%' or id like 'M33%' or id like 'M42%' or id like 'M51%');

drop table if exists "A_5_PointCanevas";
create table "A_5_PointCanevas" as 
(select * from "PointCanevas" where id like 'M15%' or id like 'M24%' or id like 'M33%' or id like 'M42%' or id like 'M51%');



-- 
-- Acteur B
--
-- Acteur B ; Version 1
drop table if exists "B_1_case_00140_00100";
create table "B_1_case_00140_00100" as 
(select * from "case_00140_00100" where id like 'M51%');

drop table if exists "B_1_AffleurantSymbole";
create table "B_1_AffleurantSymbole" as 
(select * from "AffleurantSymbole" where id like 'M51%');

drop table if exists "B_1_Arbre";
create table "B_1_Arbre" as 
(select * from "Arbre" where id like 'M51%');

drop table if exists "B_1_Bordure";
create table "B_1_Bordure" as 
(select * from "Bordure" where id like 'M51%');

drop table if exists "B_1_Emprise";
create table "B_1_Emprise" as 
(select * from "Emprise" where id like 'M51%');

drop table if exists "B_1_Facade";
create table "B_1_Facade" as 
(select * from "Facade" where id like 'M51%');

drop table if exists "B_1_Haie";
create table "B_1_Haie" as 
(select * from "Haie" where id like 'M51%');

drop table if exists "B_1_Mur";
create table "B_1_Mur" as 
(select * from "Mur" where id like 'M51%');

drop table if exists "B_1_PointCanevas";
create table "B_1_PointCanevas" as 
(select * from "PointCanevas" where id like 'M51%');

-- Acteur B ; Version 2
drop table if exists "B_2_case_00140_00100";
create table "B_2_case_00140_00100" as 
(select * from "case_00140_00100" where id like 'M41%' or id like 'M52%');

drop table if exists "B_2_AffleurantSymbole";
create table "B_2_AffleurantSymbole" as 
(select * from "AffleurantSymbole" where id like 'M41%' or id like 'M52%');

drop table if exists "B_2_Arbre";
create table "B_2_Arbre" as 
(select * from "Arbre" where id like 'M41%' or id like 'M52%');

drop table if exists "B_2_Bordure";
create table "B_2_Bordure" as 
(select * from "Bordure" where id like 'M41%' or id like 'M52%');

drop table if exists "B_2_Emprise";
create table "B_2_Emprise" as 
(select * from "Emprise" where id like 'M41%' or id like 'M52%');

drop table if exists "B_2_Facade";
create table "B_2_Facade" as 
(select * from "Facade" where id like 'M41%' or id like 'M52%');

drop table if exists "B_2_Haie";
create table "B_2_Haie" as 
(select * from "Haie" where id like 'M41%' or id like 'M52%');

drop table if exists "B_2_Mur";
create table "B_2_Mur" as 
(select * from "Mur" where id like 'M41%' or id like 'M52%');

drop table if exists "B_2_PointCanevas";
create table "B_2_PoinCanevas" as 
(select * from "PointCanevas" where id like 'M41%' or id like 'M52%');

-- Acteur B ; Version 3
drop table if exists "B_3_case_00140_00100";
create table "B_3_case_00140_00100" as 
(select * from "case_00140_00100" where id like 'M31%' or id like 'M42%' or id like 'M53%');

drop table if exists "B_3_AffleurantSymbole";
create table "B_3_AffleurantSymbole" as 
(select * from "AffleurantSymbole" where id like 'M31%' or id like 'M42%' or id like 'M53%');

drop table if exists "B_3_Arbre";
create table "B_3_Arbre" as 
(select * from "Arbre" where id like 'M31%' or id like 'M42%' or id like 'M53%');

drop table if exists "B_3_Bordure";
create table "B_3_Bordure" as 
(select * from "Bordure" where id like 'M31%' or id like 'M42%' or id like 'M53%');

drop table if exists "B_3_Emprise";
create table "B_3_Emprise" as 
(select * from "Emprise" where id like 'M31%' or id like 'M42%' or id like 'M53%');

drop table if exists "B_3_Facade";
create table "B_3_Facade" as 
(select * from "Facade" where id like 'M31%' or id like 'M42%' or id like 'M53%');

drop table if exists "B_3_Haie";
create table "B_3_Haie" as 
(select * from "Haie" where id like 'M31%' or id like 'M42%' or id like 'M53%');

drop table if exists "B_3_Mur";
create table "B_3_Mur" as 
(select * from "Mur" where id like 'M31%' or id like 'M42%' or id like 'M53%');

drop table if exists "B_3_PointCanevas";
create table "B_3_PointCanevas" as 
(select * from "PointCanevas" where id like 'M31%' or id like 'M42%' or id like 'M53%');


-- Acteur B ; Version 4
drop table if exists "B_4_case_00140_00100";
create table "B_4_case_00140_00100" as 
(select * from "case_00140_00100" where id like 'M21%' or id like 'M32%' or id like 'M43%' or id like 'M54%');

drop table if exists "B_4_AffleurantSymbole";
create table "B_4_AffleurantSymbole" as 
(select * from "AffleurantSymbole" where id like 'M21%' or id like 'M32%' or id like 'M43%' or id like 'M54%');

drop table if exists "B_4_Arbre";
create table "B_4_Arbre" as 
(select * from "Arbre" where id like 'M21%' or id like 'M32%' or id like 'M43%' or id like 'M54%');

drop table if exists "B_4_Bordure";
create table "B_4_Bordure" as 
(select * from "Bordure" where id like 'M21%' or id like 'M32%' or id like 'M43%' or id like 'M54%');

drop table if exists "B_4_Emprise";
create table "B_4_Emprise" as 
(select * from "Emprise" where id like 'M21%' or id like 'M32%' or id like 'M43%' or id like 'M54%');

drop table if exists "B_4_Facade";
create table "B_4_Facade" as 
(select * from "Facade" where id like 'M21%' or id like 'M32%' or id like 'M43%' or id like 'M54%');

drop table if exists "B_4_Haie";
create table "B_4_Haie" as 
(select * from "Haie" where id like 'M21%' or id like 'M32%' or id like 'M43%' or id like 'M54%');

drop table if exists "B_4_Mur";
create table "B_4_Mur" as 
(select * from "Mur" where id like 'M21%' or id like 'M32%' or id like 'M43%' or id like 'M54%');

drop table if exists "B_4_PointCanevas";
create table "B_4_PointCanevas" as 
(select * from "PointCanevas" where id like 'M21%' or id like 'M32%' or id like 'M43%' or id like 'M54%');

-- Acteur B ; Version 5
drop table if exists "B_5_case_00140_00100";
create table "B_5_case_00140_00100" as 
(select * from "case_00140_00100" where id like 'M11%' or id like 'M22%' or id like 'M33%' or id like 'M44%' or id like 'M55%');

drop table if exists "B_5_AffleurantSymbole";
create table "B_5_AffleurantSymbole" as 
(select * from "AffleurantSymbole" where id like 'M11%' or id like 'M22%' or id like 'M33%' or id like 'M44%' or id like 'M55%');

drop table if exists "B_5_Arbre";
create table "B_5_Arbre" as 
(select * from "Arbre" where id like 'M11%' or id like 'M22%' or id like 'M33%' or id like 'M44%' or id like 'M55%');

drop table if exists "B_5_Bordure";
create table "B_5_Bordure" as 
(select * from "Bordure" where id like 'M11%' or id like 'M22%' or id like 'M33%' or id like 'M44%' or id like 'M55%');

drop table if exists "B_5_Emprise";
create table "B_5_Emprise" as 
(select * from "Emprise" where id like 'M11%' or id like 'M22%' or id like 'M33%' or id like 'M44%' or id like 'M55%');

drop table if exists "B_5_Facade";
create table "B_5_Facade" as 
(select * from "Facade" where id like 'M11%' or id like 'M22%' or id like 'M33%' or id like 'M44%' or id like 'M55%');

drop table if exists "B_5_Haie";
create table "B_5_Haie" as 
(select * from "Haie" where id like 'M11%' or id like 'M22%' or id like 'M33%' or id like 'M44%' or id like 'M55%');

drop table if exists "B_5_Mur";
create table "B_5_Mur" as 
(select * from "Mur" where id like 'M11%' or id like 'M22%' or id like 'M33%' or id like 'M44%' or id like 'M55%');

drop table if exists "B_5_PointCanevas";
create table "B_5_PointCanevas" as 
(select * from "PointCanevas" where id like 'M11%' or id like 'M22%' or id like 'M33%' or id like 'M44%' or id like 'M55%');

-- 
-- Acteur C
--
-- Acteur C ; Version 1
drop table if exists "C_1_case_00140_00100";
create table "C_1_case_00140_00100" as 
(select * from "case_00140_00100" where id like 'M55%');

drop table if exists "C_1_AffleurantSymbole";
create table "C_1_AffleurantSymbole" as 
(select * from "AffleurantSymbole" where id like 'M55%');

drop table if exists "C_1_Arbre";
create table "C_1_Arbre" as 
(select * from "Arbre" where id like 'M55%');

drop table if exists "C_1_Bordure";
create table "C_1_Bordure" as 
(select * from "Bordure" where id like 'M55%');

drop table if exists "C_1_Emprise";
create table "C_1_Emprise" as 
(select * from "Emprise" where id like 'M55%');

drop table if exists "C_1_Facade";
create table "C_1_Facade" as 
(select * from "Facade" where id like 'M55%');

drop table if exists "C_1_Haie";
create table "C_1_Haie" as 
(select * from "Haie" where id like 'M55%');

drop table if exists "C_1_Mur";
create table "C_1_Mur" as 
(select * from "Mur" where id like 'M55%');

drop table if exists "C_1_PointCanevas";
create table "C_1_PointCanevas" as 
(select * from "PointCanevas" where id like 'M55%');

-- Acteur C ; Version 2
drop table if exists "C_2_case_00140_00100";
create table "C_2_case_00140_00100" as 
(select * from "case_00140_00100" where id like 'M45%' or id like 'M54%');

drop table if exists "C_2_AffleurantSymbole";
create table "C_2_AffleurantSymbole" as 
(select * from "AffleurantSymbole" where id like 'M45%' or id like 'M54%');

drop table if exists "C_2_Arbre";
create table "C_2_Arbre" as 
(select * from "Arbre" where id like 'M45%' or id like 'M54%');

drop table if exists "C_2_Bordure";
create table "C_2_Bordure" as 
(select * from "Bordure" where id like 'M45%' or id like 'M54%');

drop table if exists "C_2_Emprise";
create table "C_2_Emprise" as 
(select * from "Emprise" where id like 'M45%' or id like 'M54%');

drop table if exists "C_2_Facade";
create table "C_2_Facade" as 
(select * from "Facade" where id like 'M45%' or id like 'M54%');

drop table if exists "C_2_Haie";
create table "C_2_Haie" as 
(select * from "Haie" where id like 'M45%' or id like 'M54%');

drop table if exists "C_2_Mur";
create table "C_2_Mur" as 
(select * from "Mur" where id like 'M45%' or id like 'M54%');

drop table if exists "C_2_PointCanevas";
create table "C_2_PointCanevas" as 
(select * from "PointCanevas" where id like 'M45%' or id like 'M54%');

-- Acteur C ; Version 3
drop table if exists "C_3_case_00140_00100";
create table "C_3_case_00140_00100" as 
(select * from "case_00140_00100" where id like 'M35%' or id like 'M44%' or id like 'M53%');

drop table if exists "C_3_AffleurantSymbole";
create table "C_3_AffleurantSymbole" as 
(select * from "AffleurantSymbole" where id like 'M35%' or id like 'M44%' or id like 'M53%');

drop table if exists "C_3_Arbre";
create table "C_3_Arbre" as 
(select * from "Arbre" where id like 'M35%' or id like 'M44%' or id like 'M53%');

drop table if exists "C_3_Bordure";
create table "C_3_Bordure" as 
(select * from "Bordure" where id like 'M35%' or id like 'M44%' or id like 'M53%');

drop table if exists "C_3_Emprise";
create table "C_3_Emprise" as 
(select * from "Emprise" where id like 'M35%' or id like 'M44%' or id like 'M53%');

drop table if exists "C_3_Facade";
create table "C_3_Facade" as 
(select * from "Facade" where id like 'M35%' or id like 'M44%' or id like 'M53%');

drop table if exists "C_3_Haie";
create table "C_3_Haie" as 
(select * from "Haie" where id like 'M35%' or id like 'M44%' or id like 'M53%');

drop table if exists "C_3_Mur";
create table "C_3_Mur" as 
(select * from "Mur" where id like 'M35%' or id like 'M44%' or id like 'M53%');

drop table if exists "C_3_PointCanevas";
create table "C_3_PointCanevas" as 
(select * from "PointCanevas" where id like 'M35%' or id like 'M44%' or id like 'M53%');

-- Acteur C ; Version 4
drop table if exists "C_4_case_00140_00100";
create table "C_4_case_00140_00100" as 
(select * from "case_00140_00100" where id like 'M25%' or id like 'M34%' or id like 'M43%' or id like 'M52%');

drop table if exists "C_4_AffleurantSymbole";
create table "C_4_AffleurantSymbole" as 
(select * from "AffleurantSymbole" where id like 'M25%' or id like 'M34%' or id like 'M43%' or id like 'M52%');

drop table if exists "C_4_Arbre";
create table "C_4_Arbre" as 
(select * from "Arbre" where id like 'M25%' or id like 'M34%' or id like 'M43%' or id like 'M52%');

drop table if exists "C_4_Bordure";
create table "C_4_Bordure" as 
(select * from "Bordure" where id like 'M25%' or id like 'M34%' or id like 'M43%' or id like 'M52%');

drop table if exists "C_4_Emprise";
create table "C_4_Emprise" as 
(select * from "Emprise" where id like 'M25%' or id like 'M34%' or id like 'M43%' or id like 'M52%');

drop table if exists "C_4_Facade";
create table "C_4_Facade" as 
(select * from "Facade" where id like 'M25%' or id like 'M34%' or id like 'M43%' or id like 'M52%');

drop table if exists "C_4_Haie";
create table "C_4_Haie" as 
(select * from "Haie" where id like 'M25%' or id like 'M34%' or id like 'M43%' or id like 'M52%');

drop table if exists "C_4_Mur";
create table "C_4_Mur" as 
(select * from "Mur" where id like 'M25%' or id like 'M34%' or id like 'M43%' or id like 'M52%');

drop table if exists "C_4_PointCanevas";
create table "C_4_PointCanevas" as 
(select * from "PointCanevas" where id like 'M25%' or id like 'M34%' or id like 'M43%' or id like 'M52%');

-- Acteur C ; Version 5
drop table if exists "C_5_case_00140_00100";
create table "C_5_case_00140_00100" as 
(select * from "case_00140_00100" where id like 'M15%' or id like 'M24%' or id like 'M33%' or id like 'M42%' or id like 'M51%');

drop table if exists "C_5_AffleurantSymbole";
create table "C_5_AffleurantSymbole" as 
(select * from "AffleurantSymbole" where id like 'M15%' or id like 'M24%' or id like 'M33%' or id like 'M42%' or id like 'M51%');

drop table if exists "C_5_Arbre";
create table "C_5_Arbre" as 
(select * from "Arbre" where id like 'M15%' or id like 'M24%' or id like 'M33%' or id like 'M42%' or id like 'M51%');

drop table if exists "C_5_Bordure";
create table "C_5_Bordure" as 
(select * from "Bordure" where id like 'M15%' or id like 'M24%' or id like 'M33%' or id like 'M42%' or id like 'M51%');

drop table if exists "C_5_Emprise";
create table "C_5_Emprise" as 
(select * from "Emprise" where id like 'M15%' or id like 'M24%' or id like 'M33%' or id like 'M42%' or id like 'M51%');

drop table if exists "C_5_Facade";
create table "C_5_Facade" as 
(select * from "Facade" where id like 'M15%' or id like 'M24%' or id like 'M33%' or id like 'M42%' or id like 'M51%');

drop table if exists "C_5_Haie";
create table "C_5_Haie" as 
(select * from "Haie" where id like 'M15%' or id like 'M24%' or id like 'M33%' or id like 'M42%' or id like 'M51%');

drop table if exists "C_5_Mur";
create table "C_5_Mur" as 
(select * from "Mur" where id like 'M15%' or id like 'M24%' or id like 'M33%' or id like 'M42%' or id like 'M51%');

drop table if exists "C_5_PointCanevas";
create table "C_5_PointCanevas" as 
(select * from "PointCanevas" where id like 'M15%' or id like 'M24%' or id like 'M33%' or id like 'M42%' or id like 'M51%');


-- 
-- Acteur D
--
-- Acteur D ; Version 1
drop table if exists "D_1_case_00140_00100";
create table "D_1_case_00140_00100" as 
(select * from "case_00140_00100" where id like 'M15%');

drop table if exists "D_1_AffleurantSymbole";
create table "D_1_AffleurantSymbole" as 
(select * from "AffleurantSymbole" where id like 'M15%');

drop table if exists "D_1_Arbre";
create table "D_1_Arbre" as 
(select * from "Arbre" where id like 'M15%');

drop table if exists "D_1_Bordure";
create table "D_1_Bordure" as 
(select * from "Bordure" where id like 'M15%');

drop table if exists "D_1_Emprise";
create table "D_1_Emprise" as 
(select * from "Emprise" where id like 'M15%');

drop table if exists "D_1_Facade";
create table "D_1_Facade" as 
(select * from "Facade" where id like 'M15%');

drop table if exists "D_1_Haie";
create table "D_1_Haie" as 
(select * from "Haie" where id like 'M15%');

drop table if exists "D_1_Mur";
create table "D_1_Mur" as 
(select * from "Mur" where id like 'M15%');

drop table if exists "D_1_PointCanevas";
create table "D_1_PointCanevas" as 
(select * from "PointCanevas" where id like 'M15%');

-- Acteur D ; Version 2
drop table if exists "D_2_case_00140_00100";
create table "D_2_case_00140_00100" as 
(select * from "case_00140_00100" where id like 'M14%' or id like 'M25%');

drop table if exists "D_2_AffleurantSymbole";
create table "D_2_AffleurantSymbole" as 
(select * from "AffleurantSymbole" where id like 'M14%' or id like 'M25%');

drop table if exists "D_2_Arbre";
create table "D_2_Arbre" as 
(select * from "Arbre" where id like 'M14%' or id like 'M25%');

drop table if exists "D_2_Bordure";
create table "D_2_Bordure" as 
(select * from "Bordure" where id like 'M14%' or id like 'M25%');

drop table if exists "D_2_Emprise";
create table "D_2_Emprise" as 
(select * from "Emprise" where id like 'M14%' or id like 'M25%');

drop table if exists "D_2_Facade";
create table "D_2_Facade" as 
(select * from "Facade" where id like 'M14%' or id like 'M25%');

drop table if exists "D_2_Haie";
create table "D_2_Haie" as 
(select * from "Haie" where id like 'M14%' or id like 'M25%');

drop table if exists "D_2_Mur";
create table "D_2_Mur" as 
(select * from "Mur" where id like 'M14%' or id like 'M25%');

drop table if exists "D_2_PointCanevas";
create table "D_2_PointCanevas" as 
(select * from "PointCanevas" where id like 'M14%' or id like 'M25%');

-- Acteur D ; Version 3
drop table if exists "D_3_case_00140_00100";
create table "D_3_case_00140_00100" as 
(select * from "case_00140_00100" where id like 'M13%' or id like 'M24%' or id like 'M35%');

drop table if exists "D_3_AffleurantSymbole";
create table "D_3_AffleurantSymbole" as 
(select * from "AffleurantSymbole" where id like 'M13%' or id like 'M24%' or id like 'M35%');

drop table if exists "D_3_Arbre";
create table "D_3_Arbre" as 
(select * from "Arbre" where id like 'M13%' or id like 'M24%' or id like 'M35%');

drop table if exists "D_3_Bordure";
create table "D_3_Bordure" as 
(select * from "Bordure" where id like 'M13%' or id like 'M24%' or id like 'M35%');

drop table if exists "D_3_Emprise";
create table "D_3_Emprise" as 
(select * from "Emprise" where id like 'M13%' or id like 'M24%' or id like 'M35%');

drop table if exists "D_3_Facade";
create table "D_3_Facade" as 
(select * from "Facade" where id like 'M13%' or id like 'M24%' or id like 'M35%');

drop table if exists "D_3_Haie";
create table "D_3_Haie" as 
(select * from "Haie" where id like 'M13%' or id like 'M24%' or id like 'M35%');

drop table if exists "D_3_Mur";
create table "D_3_Mur" as 
(select * from "Mur" where id like 'M13%' or id like 'M24%' or id like 'M35%');

drop table if exists "D_3_PointCanevas";
create table "D_3_Point_Canevas" as 
(select * from "Point_Canevas" where id like 'M13%' or id like 'M24%' or id like 'M35%');

-- Acteur D ; Version 4
drop table if exists "D_4_case_00140_00100";
create table "D_4_case_00140_00100" as 
(select * from "case_00140_00100" where id like 'M12%' or id like 'M23%' or id like 'M34%' or id like 'M45%');

drop table if exists "D_4_AffleurantSymbole";
create table "D_4_AffleurantSymbole" as 
(select * from "Affleurant" where id like 'M12%' or id like 'M23%' or id like 'M34%' or id like 'M45%');

drop table if exists "D_4_Arbre";
create table "D_4_Arbre" as 
(select * from "Arbre" where id like 'M12%' or id like 'M23%' or id like 'M34%' or id like 'M45%');

drop table if exists "D_4_Bordure";
create table "D_4_Bordure" as 
(select * from "Bordure" where id like 'M12%' or id like 'M23%' or id like 'M34%' or id like 'M45%');

drop table if exists "D_4_Emprise";
create table "D_4_Emprise" as 
(select * from "Emprise" where id like 'M12%' or id like 'M23%' or id like 'M34%' or id like 'M45%');

drop table if exists "D_4_Facade";
create table "D_4_Facade" as 
(select * from "Facade" where id like 'M12%' or id like 'M23%' or id like 'M34%' or id like 'M45%');

drop table if exists "D_4_Haie";
create table "D_4_Haie" as 
(select * from "Haie" where id like 'M12%' or id like 'M23%' or id like 'M34%' or id like 'M45%');

drop table if exists "D_4_Mur";
create table "D_4_Mur" as 
(select * from "Mur" where id like 'M12%' or id like 'M23%' or id like 'M34%' or id like 'M45%');

drop table if exists "D_4_PointCanevas";
create table "D_4_PointCanevs" as 
(select * from "PointCanevas" where id like 'M12%' or id like 'M23%' or id like 'M34%' or id like 'M45%');

-- Acteur D ; Version 5
drop table if exists "D_5_case_00140_00100";
create table "D_5_case_00140_00100" as 
(select * from "case_00140_00100" where id like 'M11%' or id like 'M22%' or id like 'M33%' or id like 'M44%' or id like 'M55%');

drop table if exists "D_5_AffleurantSymbole";
create table "D_5_AffleurantSymbole" as 
(select * from "AffleurantSymbole" where id like 'M11%' or id like 'M22%' or id like 'M33%' or id like 'M44%' or id like 'M55%');

drop table if exists "D_5_Arbre";
create table "D_5_Arbre" as 
(select * from "Arbre" where id like 'M11%' or id like 'M22%' or id like 'M33%' or id like 'M44%' or id like 'M55%');

drop table if exists "D_5_Bordure";
create table "D_5_Bordure" as 
(select * from "Bordure" where id like 'M11%' or id like 'M22%' or id like 'M33%' or id like 'M44%' or id like 'M55%');

drop table if exists "D_5_Emprise";
create table "D_5_Emprise" as 
(select * from "Emprise" where id like 'M11%' or id like 'M22%' or id like 'M33%' or id like 'M44%' or id like 'M55%');

drop table if exists "D_5_Facade";
create table "D_5_Facade" as 
(select * from "Facade" where id like 'M11%' or id like 'M22%' or id like 'M33%' or id like 'M44%' or id like 'M55%');

drop table if exists "D_5_Haie";
create table "D_5_Haie" as 
(select * from "Haie" where id like 'M11%' or id like 'M22%' or id like 'M33%' or id like 'M44%' or id like 'M55%');

drop table if exists "D_5_Mur";
create table "D_5_Mur" as 
(select * from "Mur" where id like 'M11%' or id like 'M22%' or id like 'M33%' or id like 'M44%' or id like 'M55%');

drop table if exists "D_5_PointCanevas";
create table "D_5_PointCanevas" as 
(select * from "PointCanevas" where id like 'M11%' or id like 'M22%' or id like 'M33%' or id like 'M44%' or id like 'M55%');



select * from "D_5_case_00140_00100";
select * from "D_5_AffleurantSymbole";
select * from "D_5_Arbre";
select * from "D_5_Bordure";
select * from "D_5_Emprise";
select * from "D_5_Facade";
select * from "D_5_Haie";
select * from "D_5_Mur";
select * from "D_5_PointCanevas";
