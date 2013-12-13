-- Suppression de la table revdi_article_lotlocal
DROP TABLE IF EXISTS revdi_article_lotlocal;
-- Creation de la table revdi_article_lotlocal
CREATE TABLE revdi_article_lotlocal (
"ccodepl" CHARACTER VARYING(2) NOT NULL,
"ccodirl" CHARACTER VARYING(1) NOT NULL,
"ccocoml" CHARACTER VARYING(3) NOT NULL,
"ccoprel" CHARACTER VARYING(3) NOT NULL,
"ccosecl" CHARACTER VARYING(2) NOT NULL,
"dnuplal" CHARACTER VARYING(4) NOT NULL,
"dnupdl" CHARACTER VARYING(3) NOT NULL,
"dnulot" CHARACTER VARYING(7) NOT NULL,
"cenr" CHARACTER VARYING(2) NOT NULL,
"ccodebpb" CHARACTER VARYING(2) NOT NULL,
"ccodird" CHARACTER VARYING(1) NOT NULL,
"ccocomb" CHARACTER VARYING(3) NOT NULL,
"ccopreb" CHARACTER VARYING(3) NOT NULL,
"invloc" CHARACTER VARYING(10) NOT NULL,
"dnumql" CHARACTER VARYING(7) NOT NULL,
"ddenql" CHARACTER VARYING(7) NOT NULL);
-- Ajout des commentaires pour la table revdi_article_lotlocal
COMMENT ON COLUMN revdi_article_lotlocal."ccodepl" IS 'code département';
COMMENT ON COLUMN revdi_article_lotlocal."ccodirl" IS 'code direction';
COMMENT ON COLUMN revdi_article_lotlocal."ccocoml" IS 'code commune INSEE';
COMMENT ON COLUMN revdi_article_lotlocal."ccoprel" IS 'code préfixe';
COMMENT ON COLUMN revdi_article_lotlocal."ccosecl" IS 'code section';
COMMENT ON COLUMN revdi_article_lotlocal."dnuplal" IS 'numero de plan';
COMMENT ON COLUMN revdi_article_lotlocal."dnupdl" IS 'numero de PDL';
COMMENT ON COLUMN revdi_article_lotlocal."dnulot" IS 'numero de lot';
COMMENT ON COLUMN revdi_article_lotlocal."cenr" IS 'code enregistrement';
COMMENT ON COLUMN revdi_article_lotlocal."ccodebpb" IS 'code département';
COMMENT ON COLUMN revdi_article_lotlocal."ccodird" IS 'code direction';
COMMENT ON COLUMN revdi_article_lotlocal."ccocomb" IS 'code commune INSEE';
COMMENT ON COLUMN revdi_article_lotlocal."ccopreb" IS 'code préfixe';
COMMENT ON COLUMN revdi_article_lotlocal."invloc" IS 'numéro invariant du local';
COMMENT ON COLUMN revdi_article_lotlocal."dnumql" IS 'numérateur du lot';
COMMENT ON COLUMN revdi_article_lotlocal."ddenql" IS 'dénominateur du lot';
