select st_asewkt(wkb_geometry) from "999_02_00047_00026_13_b_18_fp2";
select st_asewkt(wkb_geometry) from "releve_complementaire_rue_kaestler" limit 100;

--DECLARE qgisf3_0 BINARY CURSOR FOR SELECT st_asbinary(st_force2d("wkb_geometry"),'NDR'),"ogc_fid" FROM "public"."releve_complementaire_rue_kaestler"