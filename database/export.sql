--------------------------------------------------------
--  File created - Sobota-prosince-12-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence DRUH_OTAZKY_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ST58214"."DRUH_OTAZKY_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 4 NOCACHE  ORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence KATEGORIE_MATERIALU_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ST58214"."KATEGORIE_MATERIALU_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 8 NOCACHE  ORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence KOMENTAR_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ST58214"."KOMENTAR_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 24 NOCACHE  ORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence KVIZ_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ST58214"."KVIZ_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 26 NOCACHE  ORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence NEVHODNE_SLOVO_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ST58214"."NEVHODNE_SLOVO_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 6 NOCACHE  ORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence OTAZKA_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ST58214"."OTAZKA_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 26 NOCACHE  ORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence PREDMET_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ST58214"."PREDMET_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 NOCACHE  ORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ROLE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ST58214"."ROLE_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 4 NOCACHE  ORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SKUPINA_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ST58214"."SKUPINA_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 5 NOCACHE  ORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SOUBOR_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ST58214"."SOUBOR_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  ORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence STUDIJNI_MATERIAL_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ST58214"."STUDIJNI_MATERIAL_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 26 NOCACHE  ORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence UPRAVA_MATERIALU_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ST58214"."UPRAVA_MATERIALU_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 7 NOCACHE  ORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence UZIVATEL_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ST58214"."UZIVATEL_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 22 NOCACHE  ORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence VYPLNENA_OTAZKA_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ST58214"."VYPLNENA_OTAZKA_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 23 NOCACHE  ORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence VYPLNENY_KVIZ_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ST58214"."VYPLNENY_KVIZ_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 20 NOCACHE  ORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ZPRAVA_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ST58214"."ZPRAVA_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 32 NOCACHE  ORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Table DRUH_OTAZKY
--------------------------------------------------------

  CREATE TABLE "ST58214"."DRUH_OTAZKY" 
   (	"ID_DRUHOTAZKY" NUMBER(*,0), 
	"NAZEV" VARCHAR2(128 BYTE), 
	"ZKRATKA" VARCHAR2(32 BYTE), 
	"POPIS" VARCHAR2(256 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "STUDENTI" ;
--------------------------------------------------------
--  DDL for Table KATEGORIE_MATERIALU
--------------------------------------------------------

  CREATE TABLE "ST58214"."KATEGORIE_MATERIALU" 
   (	"ID_KATEGORIEMATERIALU" NUMBER(*,0), 
	"NAZEV" VARCHAR2(128 BYTE), 
	"ZKRATKA" VARCHAR2(32 BYTE), 
	"POPIS" VARCHAR2(256 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "STUDENTI" ;
--------------------------------------------------------
--  DDL for Table KATEGORIZACE_MATERIALU
--------------------------------------------------------

  CREATE TABLE "ST58214"."KATEGORIZACE_MATERIALU" 
   (	"STUDIJNI_MATERIAL_ID" NUMBER(*,0), 
	"KATEGORIE_MATERIALU_ID" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "STUDENTI" ;
--------------------------------------------------------
--  DDL for Table KOMENTAR
--------------------------------------------------------

  CREATE TABLE "ST58214"."KOMENTAR" 
   (	"ID_KOMENTAR" NUMBER(*,0), 
	"TEXT" VARCHAR2(1024 BYTE), 
	"DATUMPRIDANI" DATE, 
	"DATUMZMENY" DATE, 
	"STUDIJNI_MATERIAL_ID" NUMBER(*,0), 
	"UZIVATEL_ID" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "STUDENTI" ;
--------------------------------------------------------
--  DDL for Table KVIZ
--------------------------------------------------------

  CREATE TABLE "ST58214"."KVIZ" 
   (	"ID_KVIZ" NUMBER(*,0), 
	"NAZEV" VARCHAR2(128 BYTE), 
	"POPIS" VARCHAR2(256 BYTE), 
	"STUDIJNI_MATERIAL_ID" NUMBER(*,0), 
	"UZIVATEL_ID" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "STUDENTI" ;
--------------------------------------------------------
--  DDL for Table NEVHODNE_SLOVO
--------------------------------------------------------

  CREATE TABLE "ST58214"."NEVHODNE_SLOVO" 
   (	"ID_NEVHODNE_SLOVO" NUMBER(*,0), 
	"TEXT" VARCHAR2(32 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "STUDENTI" ;
--------------------------------------------------------
--  DDL for Table OTAZKA
--------------------------------------------------------

  CREATE TABLE "ST58214"."OTAZKA" 
   (	"ID_OTAZKA" NUMBER(*,0), 
	"NAZEV" VARCHAR2(128 BYTE), 
	"OTAZKA" VARCHAR2(1024 BYTE), 
	"ODPOVED" VARCHAR2(1024 BYTE), 
	"BODY" NUMBER(*,0), 
	"PORADI" NUMBER(*,0), 
	"KVIZ_ID" NUMBER(*,0), 
	"DRUH_OTAZKY_ID" NUMBER(*,0), 
	"UZIVATEL_ID" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "STUDENTI" ;
--------------------------------------------------------
--  DDL for Table PREDMET
--------------------------------------------------------

  CREATE TABLE "ST58214"."PREDMET" 
   (	"ID_PREDMET" NUMBER(*,0), 
	"NAZEV" VARCHAR2(128 BYTE), 
	"ZKRATKA" VARCHAR2(8 BYTE), 
	"POPIS" VARCHAR2(256 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "STUDENTI" ;
--------------------------------------------------------
--  DDL for Table PREDMETY_SKUPINY
--------------------------------------------------------

  CREATE TABLE "ST58214"."PREDMETY_SKUPINY" 
   (	"SKUPINA_ID" NUMBER(*,0), 
	"PREDMET_ID" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "STUDENTI" ;
--------------------------------------------------------
--  DDL for Table PREDMETY_UZIVATELE
--------------------------------------------------------

  CREATE TABLE "ST58214"."PREDMETY_UZIVATELE" 
   (	"UZIVATEL_ID" NUMBER(*,0), 
	"PREDMET_ID" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "STUDENTI" ;
--------------------------------------------------------
--  DDL for Table ROLE
--------------------------------------------------------

  CREATE TABLE "ST58214"."ROLE" 
   (	"ID_ROLE" NUMBER(*,0), 
	"NAZEV" VARCHAR2(64 BYTE), 
	"OPRAVNENI" VARCHAR2(32 BYTE), 
	"POPIS" VARCHAR2(256 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "STUDENTI" ;
--------------------------------------------------------
--  DDL for Table SKUPINA
--------------------------------------------------------

  CREATE TABLE "ST58214"."SKUPINA" 
   (	"ID_SKUPINA" NUMBER(*,0), 
	"ROK_STUDIA" NUMBER(*,0), 
	"OBOR" VARCHAR2(256 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "STUDENTI" ;
--------------------------------------------------------
--  DDL for Table SOUBOR
--------------------------------------------------------

  CREATE TABLE "ST58214"."SOUBOR" 
   (	"ID_SOUBOR" NUMBER(*,0), 
	"NAZEV" VARCHAR2(64 BYTE), 
	"SOUBOR" BLOB, 
	"PRIPONA" VARCHAR2(8 BYTE), 
	"NAHRANO" DATE, 
	"UPRAVENO" DATE, 
	"UZIVATEL_ID" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "STUDENTI" 
 LOB ("SOUBOR") STORE AS SECUREFILE (
  TABLESPACE "STUDENTI" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES 
  STORAGE(INITIAL 106496 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
--------------------------------------------------------
--  DDL for Table STUDIJNI_MATERIAL
--------------------------------------------------------

  CREATE TABLE "ST58214"."STUDIJNI_MATERIAL" 
   (	"ID_STUDIJNIMATERIAL" NUMBER(*,0), 
	"NAZEV" VARCHAR2(128 BYTE), 
	"STRAN" NUMBER(*,0), 
	"DATUMVYTVORENI" DATE, 
	"DATUMZMENY" DATE, 
	"POPIS" VARCHAR2(512 BYTE), 
	"SOUBOR" BLOB, 
	"PRIPONA" CHAR(8 BYTE), 
	"PREDMET_ID" NUMBER(*,0), 
	"UZIVATEL_ID" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "STUDENTI" 
 LOB ("SOUBOR") STORE AS SECUREFILE (
  TABLESPACE "STUDENTI" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES 
  STORAGE(INITIAL 106496 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
--------------------------------------------------------
--  DDL for Table UPRAVA_MATERIALU
--------------------------------------------------------

  CREATE TABLE "ST58214"."UPRAVA_MATERIALU" 
   (	"ID_UPRAVAMATERIALU" NUMBER(*,0), 
	"DATUM" DATE, 
	"UZIVATEL_ID" NUMBER(*,0), 
	"STUDIJNI_MATERIAL_ID" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "STUDENTI" ;
--------------------------------------------------------
--  DDL for Table UZIVATEL
--------------------------------------------------------

  CREATE TABLE "ST58214"."UZIVATEL" 
   (	"ID_UZIVATEL" NUMBER(*,0), 
	"LOGIN" CHAR(7 BYTE), 
	"HESLO" CHAR(60 BYTE), 
	"JMENO" VARCHAR2(64 BYTE), 
	"PRIJMENI" VARCHAR2(64 BYTE), 
	"EMAIL" VARCHAR2(128 BYTE), 
	"TELEFON" VARCHAR2(9 BYTE), 
	"ADRESA" VARCHAR2(256 BYTE), 
	"IMAGE" BLOB, 
	"ROLE_ID" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "STUDENTI" 
 LOB ("IMAGE") STORE AS SECUREFILE (
  TABLESPACE "STUDENTI" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES 
  STORAGE(INITIAL 106496 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
--------------------------------------------------------
--  DDL for Table UZIVATELE_SKUPINY
--------------------------------------------------------

  CREATE TABLE "ST58214"."UZIVATELE_SKUPINY" 
   (	"UZIVATEL_ID" NUMBER(*,0), 
	"SKUPINA_ID" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "STUDENTI" ;
--------------------------------------------------------
--  DDL for Table VYPLNENA_OTAZKA
--------------------------------------------------------

  CREATE TABLE "ST58214"."VYPLNENA_OTAZKA" 
   (	"ID_VYPLNENA_OTAZKA" NUMBER(*,0), 
	"ODPOVED" VARCHAR2(1024 BYTE), 
	"OTAZKA_ID" NUMBER(*,0), 
	"VYPLNENY_KVIZ_ID" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "STUDENTI" ;
--------------------------------------------------------
--  DDL for Table VYPLNENY_KVIZ
--------------------------------------------------------

  CREATE TABLE "ST58214"."VYPLNENY_KVIZ" 
   (	"ID_VYPLNENY_KVIZ" NUMBER(*,0), 
	"BODY" NUMBER(*,0), 
	"MAX_BODY" NUMBER(*,0), 
	"UZIVATEL_ID" NUMBER(*,0), 
	"KVIZ_ID" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "STUDENTI" ;
--------------------------------------------------------
--  DDL for Table ZPRAVA
--------------------------------------------------------

  CREATE TABLE "ST58214"."ZPRAVA" 
   (	"ID_ZPRAVA" NUMBER(*,0), 
	"TEXT" VARCHAR2(1024 BYTE), 
	"DATUM" DATE, 
	"ODESILATEL_ID" NUMBER(*,0), 
	"PRIJEMCE_ID" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "STUDENTI" ;
--------------------------------------------------------
--  DDL for View HISTORIE_UPRAV
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ST58214"."HISTORIE_UPRAV" ("JMENO", "PRIJMENI", "ID_UPRAVAMATERIALU", "DATUM", "UZIVATEL_ID", "STUDIJNI_MATERIAL_ID") AS 
  SELECT
    uzivatel.jmeno,
    uzivatel.prijmeni,
    uprava_materialu."ID_UPRAVAMATERIALU",uprava_materialu."DATUM",uprava_materialu."UZIVATEL_ID",uprava_materialu."STUDIJNI_MATERIAL_ID"
FROM
         uprava_materialu
    INNER JOIN uzivatel ON uzivatel.id_uzivatel = uprava_materialu.uzivatel_id WITH READ ONLY
;
--------------------------------------------------------
--  DDL for View KATEGORIE_STUDIJNIHO_MATERIALU
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ST58214"."KATEGORIE_STUDIJNIHO_MATERIALU" ("STUDIJNI_MATERIAL_ID", "ID_KATEGORIEMATERIALU", "NAZEV", "ZKRATKA", "POPIS") AS 
  SELECT
    kategorizace_materialu.studijni_material_id,
    kategorie_materialu.id_kategoriematerialu,
    kategorie_materialu.nazev,
    kategorie_materialu.zkratka,
    kategorie_materialu.popis
FROM
         kategorizace_materialu
    INNER JOIN kategorie_materialu ON kategorie_materialu.id_kategoriematerialu = kategorizace_materialu.kategorie_materialu_id WITH READ ONLY
;
--------------------------------------------------------
--  DDL for View KOMENTARE
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ST58214"."KOMENTARE" ("ID_KOMENTAR", "TEXT", "DATUMPRIDANI", "DATUMZMENY", "STUDIJNI_MATERIAL_ID", "UZIVATEL_ID", "JMENO", "PRIJMENI") AS 
  SELECT
    komentar."ID_KOMENTAR",komentar."TEXT",komentar."DATUMPRIDANI",komentar."DATUMZMENY",komentar."STUDIJNI_MATERIAL_ID",komentar."UZIVATEL_ID",
    uzivatel.jmeno,
    uzivatel.prijmeni
FROM
         komentar
    INNER JOIN uzivatel ON uzivatel.id_uzivatel = komentar.uzivatel_id WITH READ ONLY
;
--------------------------------------------------------
--  DDL for View KVIZY
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ST58214"."KVIZY" ("ZKRATKA", "nazev_predmet", "nazev_studijni_material", "JMENO", "PRIJMENI", "ID_KVIZ", "NAZEV", "POPIS", "STUDIJNI_MATERIAL_ID", "UZIVATEL_ID") AS 
  SELECT
    predmet.zkratka,
    predmet.nazev AS "nazev_predmet",
    studijni_material.nazev AS "nazev_studijni_material",
    uzivatel.jmeno,
    uzivatel.prijmeni,
    kviz."ID_KVIZ",kviz."NAZEV",kviz."POPIS",kviz."STUDIJNI_MATERIAL_ID",kviz."UZIVATEL_ID"
FROM
         kviz
    INNER JOIN studijni_material ON studijni_material.id_studijnimaterial = kviz.studijni_material_id
    INNER JOIN predmet ON predmet.id_predmet = studijni_material.predmet_id
    INNER JOIN uzivatel ON uzivatel.id_uzivatel = kviz.uzivatel_id WITH READ ONLY
;
--------------------------------------------------------
--  DDL for View NEVHODNA_SLOVA
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ST58214"."NEVHODNA_SLOVA" ("ID_NEVHODNE_SLOVO", "TEXT") AS 
  SELECT
    nevhodne_slovo.id_nevhodne_slovo,
    nevhodne_slovo.text
FROM
    nevhodne_slovo WITH READ ONLY
;
--------------------------------------------------------
--  DDL for View ODEBIRANE_PREDMETY
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ST58214"."ODEBIRANE_PREDMETY" ("ID_PREDMET", "NAZEV", "ZKRATKA", "POPIS", "UZIVATEL_ID") AS 
  SELECT
    predmet."ID_PREDMET",predmet."NAZEV",predmet."ZKRATKA",predmet."POPIS",
    predmety_uzivatele.uzivatel_id
FROM
         predmety_uzivatele
    INNER JOIN predmet ON predmet.id_predmet = predmety_uzivatele.predmet_id WITH READ ONLY
;
--------------------------------------------------------
--  DDL for View OTAZKY
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ST58214"."OTAZKY" ("JMENO", "PRIJMENI", "nazev_kviz", "nazev_studijni_material", "nazev_predmet", "zkratka_predmet", "ID_OTAZKA", "NAZEV", "OTAZKA", "ODPOVED", "BODY", "PORADI", "KVIZ_ID", "DRUH_OTAZKY_ID", "UZIVATEL_ID", "id_druh_otazky", "nazev_druh_otazky", "zkratka_druh_otazky", "popis_druh_otazky") AS 
  SELECT
    uzivatel.jmeno,
    uzivatel.prijmeni,
    kviz.nazev                   AS "nazev_kviz",
    studijni_material.nazev      AS "nazev_studijni_material",
    predmet.nazev                AS "nazev_predmet",
    predmet.zkratka              AS "zkratka_predmet",
    otazka."ID_OTAZKA",otazka."NAZEV",otazka."OTAZKA",otazka."ODPOVED",otazka."BODY",otazka."PORADI",otazka."KVIZ_ID",otazka."DRUH_OTAZKY_ID",otazka."UZIVATEL_ID",
    druh_otazky.id_druhotazky    AS "id_druh_otazky",
    druh_otazky.nazev            AS "nazev_druh_otazky",
    druh_otazky.zkratka          AS "zkratka_druh_otazky",
    druh_otazky.popis            AS "popis_druh_otazky"
FROM
         otazka
    INNER JOIN kviz ON kviz.id_kviz = otazka.kviz_id
    INNER JOIN uzivatel ON uzivatel.id_uzivatel = otazka.uzivatel_id
    INNER JOIN studijni_material ON studijni_material.id_studijnimaterial = kviz.studijni_material_id
    INNER JOIN predmet ON predmet.id_predmet = studijni_material.predmet_id
    INNER JOIN druh_otazky ON druh_otazky.id_druhotazky = otazka.druh_otazky_id WITH READ ONLY
;
--------------------------------------------------------
--  DDL for View PREDMETY_SKUPIN
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ST58214"."PREDMETY_SKUPIN" ("ROK_STUDIA", "OBOR", "SKUPINA_ID", "PREDMET_ID", "NAZEV", "ZKRATKA") AS 
  SELECT
    skupina.rok_studia,
    skupina.obor,
    predmety_skupiny.skupina_id,
    predmety_skupiny.predmet_id,
    predmet.nazev,
    predmet.zkratka
FROM
         predmet
    INNER JOIN predmety_skupiny ON predmet.id_predmet = predmety_skupiny.predmet_id
    INNER JOIN skupina ON skupina.id_skupina = predmety_skupiny.skupina_id WITH READ ONLY
;
--------------------------------------------------------
--  DDL for View SKUPINY
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ST58214"."SKUPINY" ("ID_SKUPINA", "ROK_STUDIA", "OBOR") AS 
  SELECT
    skupina.id_skupina,
    skupina.rok_studia,
    skupina.obor
FROM
    skupina WITH READ ONLY
;
--------------------------------------------------------
--  DDL for View SOUBORY_UZIVATELU
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ST58214"."SOUBORY_UZIVATELU" ("JMENO", "PRIJMENI", "ID_SOUBOR", "NAZEV", "PRIPONA", "NAHRANO", "UPRAVENO", "UZIVATEL_ID") AS 
  SELECT
    uzivatel.jmeno,
    uzivatel.prijmeni,
    soubor.id_soubor,
    soubor.nazev,
    soubor.pripona,
    soubor.nahrano,
    soubor.upraveno,
    soubor.uzivatel_id
FROM
         soubor
    INNER JOIN uzivatel ON uzivatel.id_uzivatel = soubor.uzivatel_id WITH READ ONLY
;
--------------------------------------------------------
--  DDL for View STUDIJNI_MATERIALY
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ST58214"."STUDIJNI_MATERIALY" ("OPRAVNENI", "JMENO", "PRIJMENI", "nazev_predmet", "ZKRATKA", "ID_STUDIJNIMATERIAL", "NAZEV", "STRAN", "DATUMVYTVORENI", "DATUMZMENY", "POPIS", "SOUBOR", "PRIPONA", "PREDMET_ID", "UZIVATEL_ID") AS 
  SELECT
    role.opravneni,
    uzivatel.jmeno,
    uzivatel.prijmeni,
    predmet.nazev AS "nazev_predmet",
    predmet.zkratka,
    studijni_material."ID_STUDIJNIMATERIAL",studijni_material."NAZEV",studijni_material."STRAN",studijni_material."DATUMVYTVORENI",studijni_material."DATUMZMENY",studijni_material."POPIS",studijni_material."SOUBOR",studijni_material."PRIPONA",studijni_material."PREDMET_ID",studijni_material."UZIVATEL_ID"
FROM
         studijni_material
    INNER JOIN uzivatel ON uzivatel.id_uzivatel = studijni_material.uzivatel_id
    INNER JOIN role ON role.id_role = uzivatel.role_id
    INNER JOIN predmet ON predmet.id_predmet = studijni_material.predmet_id WITH READ ONLY
;
--------------------------------------------------------
--  DDL for View UZIVATELE
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ST58214"."UZIVATELE" ("ID_UZIVATEL", "LOGIN", "HESLO", "JMENO", "PRIJMENI", "EMAIL", "TELEFON", "ADRESA", "IMAGE", "ROLE_ID", "NAZEV", "OPRAVNENI", "POPIS") AS 
  SELECT
    uzivatel."ID_UZIVATEL",uzivatel."LOGIN",uzivatel."HESLO",uzivatel."JMENO",uzivatel."PRIJMENI",uzivatel."EMAIL",uzivatel."TELEFON",uzivatel."ADRESA",uzivatel."IMAGE",uzivatel."ROLE_ID",
    role.nazev,
    role.opravneni,
    role.popis
FROM
         uzivatel
    INNER JOIN role ON role.id_role = uzivatel.role_id WITH READ ONLY
;
--------------------------------------------------------
--  DDL for View UZIVATELE_SKUPIN
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ST58214"."UZIVATELE_SKUPIN" ("UZIVATEL_ID", "SKUPINA_ID", "ROK_STUDIA", "OBOR", "JMENO", "PRIJMENI") AS 
  SELECT
    uzivatele_skupiny.uzivatel_id,
    uzivatele_skupiny.skupina_id,
    skupina.rok_studia,
    skupina.obor,
    uzivatel.jmeno,
    uzivatel.prijmeni
FROM
         skupina
    INNER JOIN uzivatele_skupiny ON skupina.id_skupina = uzivatele_skupiny.skupina_id
    INNER JOIN uzivatel ON uzivatel.id_uzivatel = uzivatele_skupiny.uzivatel_id WITH READ ONLY
;
--------------------------------------------------------
--  DDL for View UZIVATEL_LOGIN
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ST58214"."UZIVATEL_LOGIN" ("ID_UZIVATEL", "LOGIN", "JMENO", "PRIJMENI", "EMAIL", "TELEFON", "ADRESA", "IMAGE", "OPRAVNENI") AS 
  SELECT
    uzivatel.id_uzivatel,
    uzivatel.login,
    uzivatel.jmeno,
    uzivatel.prijmeni,
    uzivatel.email,
    uzivatel.telefon,
    uzivatel.adresa,
    uzivatel.image,
    role.opravneni
FROM
         uzivatel
    INNER JOIN role ON role.id_role = uzivatel.role_id WITH READ ONLY
;
--------------------------------------------------------
--  DDL for View VYPLNENE_KVIZY
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ST58214"."VYPLNENE_KVIZY" ("NAZEV", "STUDIJNI_MATERIAL_ID", "JMENO", "PRIJMENI", "ID_VYPLNENY_KVIZ", "BODY", "MAX_BODY", "UZIVATEL_ID", "KVIZ_ID", "PREDMET_ID") AS 
  SELECT
    kviz.nazev,
    kviz.studijni_material_id,
    uzivatel.jmeno,
    uzivatel.prijmeni,
    vyplneny_kviz.id_vyplneny_kviz,
    vyplneny_kviz.body,
    vyplneny_kviz.max_body,
    vyplneny_kviz.uzivatel_id,
    vyplneny_kviz.kviz_id,
    studijni_material.predmet_id
FROM
         vyplneny_kviz
    INNER JOIN uzivatel ON uzivatel.id_uzivatel = vyplneny_kviz.uzivatel_id
    INNER JOIN kviz ON kviz.id_kviz = vyplneny_kviz.kviz_id
    INNER JOIN studijni_material ON studijni_material.id_studijnimaterial = kviz.studijni_material_id WITH READ ONLY
;
--------------------------------------------------------
--  DDL for View VYPLNENE_OTAZKY
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ST58214"."VYPLNENE_OTAZKY" ("ID_VYPLNENA_OTAZKA", "ODPOVED", "OTAZKA_ID", "VYPLNENY_KVIZ_ID", "NAZEV", "OTAZKA", "BODY", "odpoved_puvodni", "PORADI", "druh_otazky_nazev", "druh_otazky_zkratka", "druh_otazky_popis") AS 
  SELECT
    vyplnena_otazka.id_vyplnena_otazka,
    vyplnena_otazka.odpoved,
    vyplnena_otazka.otazka_id,
    vyplnena_otazka.vyplneny_kviz_id,
    otazka.nazev,
    otazka.otazka,
    otazka.body,
    otazka.odpoved       AS "odpoved_puvodni",
    otazka.poradi,
    druh_otazky.nazev    AS "druh_otazky_nazev",
    druh_otazky.zkratka AS "druh_otazky_zkratka",
    druh_otazky.popis AS "druh_otazky_popis"
FROM
         vyplnena_otazka
    INNER JOIN otazka ON otazka.id_otazka = vyplnena_otazka.otazka_id
    INNER JOIN druh_otazky ON druh_otazky.id_druhotazky = otazka.druh_otazky_id WITH READ ONLY
;
REM INSERTING into ST58214.DRUH_OTAZKY
SET DEFINE OFF;
Insert into ST58214.DRUH_OTAZKY (ID_DRUHOTAZKY,NAZEV,ZKRATKA,POPIS) values ('1','Výbìr z možností','SELECT','Odpovìï je nutné vybrat z pøedem napsaných možností.');
Insert into ST58214.DRUH_OTAZKY (ID_DRUHOTAZKY,NAZEV,ZKRATKA,POPIS) values ('2','Doplnìní textu','FILL','Na prázdná místa napište odpovìï.');
Insert into ST58214.DRUH_OTAZKY (ID_DRUHOTAZKY,NAZEV,ZKRATKA,POPIS) values ('3','Volná odpovìï','WRITE','Je nutné odpovìdìt na otázku vìtou.');
REM INSERTING into ST58214.KATEGORIE_MATERIALU
SET DEFINE OFF;
Insert into ST58214.KATEGORIE_MATERIALU (ID_KATEGORIEMATERIALU,NAZEV,ZKRATKA,POPIS) values ('1','Pøednáška','LECTURE','Jedná se materiály z/k pøednášce.');
Insert into ST58214.KATEGORIE_MATERIALU (ID_KATEGORIEMATERIALU,NAZEV,ZKRATKA,POPIS) values ('2','Cvièení','EXERCISE','Jedná se o materiály z/k cvièení.');
Insert into ST58214.KATEGORIE_MATERIALU (ID_KATEGORIEMATERIALU,NAZEV,ZKRATKA,POPIS) values ('3','Test','TEST','Jedná se o test z dané látky.');
Insert into ST58214.KATEGORIE_MATERIALU (ID_KATEGORIEMATERIALU,NAZEV,ZKRATKA,POPIS) values ('4','Prezentace','PRESENTATION','Jedná se prezentaci.');
Insert into ST58214.KATEGORIE_MATERIALU (ID_KATEGORIEMATERIALU,NAZEV,ZKRATKA,POPIS) values ('5','Dokument','DOCUMENT','Jedná se dokument.');
Insert into ST58214.KATEGORIE_MATERIALU (ID_KATEGORIEMATERIALU,NAZEV,ZKRATKA,POPIS) values ('6','Video','VIDEO','Jedná se video.');
Insert into ST58214.KATEGORIE_MATERIALU (ID_KATEGORIEMATERIALU,NAZEV,ZKRATKA,POPIS) values ('7','Obrázek','IMAGE','Jedná se obrázek.');
REM INSERTING into ST58214.KATEGORIZACE_MATERIALU
SET DEFINE OFF;
Insert into ST58214.KATEGORIZACE_MATERIALU (STUDIJNI_MATERIAL_ID,KATEGORIE_MATERIALU_ID) values ('1','1');
Insert into ST58214.KATEGORIZACE_MATERIALU (STUDIJNI_MATERIAL_ID,KATEGORIE_MATERIALU_ID) values ('1','2');
Insert into ST58214.KATEGORIZACE_MATERIALU (STUDIJNI_MATERIAL_ID,KATEGORIE_MATERIALU_ID) values ('1','7');
Insert into ST58214.KATEGORIZACE_MATERIALU (STUDIJNI_MATERIAL_ID,KATEGORIE_MATERIALU_ID) values ('2','1');
Insert into ST58214.KATEGORIZACE_MATERIALU (STUDIJNI_MATERIAL_ID,KATEGORIE_MATERIALU_ID) values ('3','1');
Insert into ST58214.KATEGORIZACE_MATERIALU (STUDIJNI_MATERIAL_ID,KATEGORIE_MATERIALU_ID) values ('4','1');
Insert into ST58214.KATEGORIZACE_MATERIALU (STUDIJNI_MATERIAL_ID,KATEGORIE_MATERIALU_ID) values ('5','1');
Insert into ST58214.KATEGORIZACE_MATERIALU (STUDIJNI_MATERIAL_ID,KATEGORIE_MATERIALU_ID) values ('6','1');
Insert into ST58214.KATEGORIZACE_MATERIALU (STUDIJNI_MATERIAL_ID,KATEGORIE_MATERIALU_ID) values ('7','1');
Insert into ST58214.KATEGORIZACE_MATERIALU (STUDIJNI_MATERIAL_ID,KATEGORIE_MATERIALU_ID) values ('8','1');
Insert into ST58214.KATEGORIZACE_MATERIALU (STUDIJNI_MATERIAL_ID,KATEGORIE_MATERIALU_ID) values ('9','1');
Insert into ST58214.KATEGORIZACE_MATERIALU (STUDIJNI_MATERIAL_ID,KATEGORIE_MATERIALU_ID) values ('10','1');
Insert into ST58214.KATEGORIZACE_MATERIALU (STUDIJNI_MATERIAL_ID,KATEGORIE_MATERIALU_ID) values ('11','1');
Insert into ST58214.KATEGORIZACE_MATERIALU (STUDIJNI_MATERIAL_ID,KATEGORIE_MATERIALU_ID) values ('12','1');
Insert into ST58214.KATEGORIZACE_MATERIALU (STUDIJNI_MATERIAL_ID,KATEGORIE_MATERIALU_ID) values ('13','1');
Insert into ST58214.KATEGORIZACE_MATERIALU (STUDIJNI_MATERIAL_ID,KATEGORIE_MATERIALU_ID) values ('14','1');
Insert into ST58214.KATEGORIZACE_MATERIALU (STUDIJNI_MATERIAL_ID,KATEGORIE_MATERIALU_ID) values ('15','1');
Insert into ST58214.KATEGORIZACE_MATERIALU (STUDIJNI_MATERIAL_ID,KATEGORIE_MATERIALU_ID) values ('16','1');
Insert into ST58214.KATEGORIZACE_MATERIALU (STUDIJNI_MATERIAL_ID,KATEGORIE_MATERIALU_ID) values ('17','1');
Insert into ST58214.KATEGORIZACE_MATERIALU (STUDIJNI_MATERIAL_ID,KATEGORIE_MATERIALU_ID) values ('18','1');
Insert into ST58214.KATEGORIZACE_MATERIALU (STUDIJNI_MATERIAL_ID,KATEGORIE_MATERIALU_ID) values ('19','1');
Insert into ST58214.KATEGORIZACE_MATERIALU (STUDIJNI_MATERIAL_ID,KATEGORIE_MATERIALU_ID) values ('20','1');
Insert into ST58214.KATEGORIZACE_MATERIALU (STUDIJNI_MATERIAL_ID,KATEGORIE_MATERIALU_ID) values ('21','1');
Insert into ST58214.KATEGORIZACE_MATERIALU (STUDIJNI_MATERIAL_ID,KATEGORIE_MATERIALU_ID) values ('22','1');
Insert into ST58214.KATEGORIZACE_MATERIALU (STUDIJNI_MATERIAL_ID,KATEGORIE_MATERIALU_ID) values ('24','2');
Insert into ST58214.KATEGORIZACE_MATERIALU (STUDIJNI_MATERIAL_ID,KATEGORIE_MATERIALU_ID) values ('25','1');
REM INSERTING into ST58214.KOMENTAR
SET DEFINE OFF;
Insert into ST58214.KOMENTAR (ID_KOMENTAR,TEXT,DATUMPRIDANI,DATUMZMENY,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('6','Toto je diskuzní forum pro materiál, pokud budete mít nìjaké dotazy, zde je napište.',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'12','4');
Insert into ST58214.KOMENTAR (ID_KOMENTAR,TEXT,DATUMPRIDANI,DATUMZMENY,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('7','Dobrý den, rád bych se zeptal na jeden pøíklad ze cvièení. Mohla by jste mi pomoci?',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'12','18');
Insert into ST58214.KOMENTAR (ID_KOMENTAR,TEXT,DATUMPRIDANI,DATUMZMENY,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('8','Jistì, jaký je problém?',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'12','4');
Insert into ST58214.KOMENTAR (ID_KOMENTAR,TEXT,DATUMPRIDANI,DATUMZMENY,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('9','No, vìc se má tak, že nevím kolik je 2+2, zdá se to být neøešitelný problém, pletu se snad?',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'12','18');
Insert into ST58214.KOMENTAR (ID_KOMENTAR,TEXT,DATUMPRIDANI,DATUMZMENY,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('10','Nebojte, nepletete, jedná se o chyták, otázka nemá øešení.',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'12','4');
Insert into ST58214.KOMENTAR (ID_KOMENTAR,TEXT,DATUMPRIDANI,DATUMZMENY,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('11','Toto je diskuzní forum pro materiál, pokud budete mít nìjaké dotazy, zde je napište.',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'13','5');
Insert into ST58214.KOMENTAR (ID_KOMENTAR,TEXT,DATUMPRIDANI,DATUMZMENY,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('12','Dobrý den, rád bych se zeptal na jeden pøíklad ze cvièení. Mohla by jste mi pomoci?',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'13','19');
Insert into ST58214.KOMENTAR (ID_KOMENTAR,TEXT,DATUMPRIDANI,DATUMZMENY,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('13','Jistì, jaký je problém?',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'13','5');
Insert into ST58214.KOMENTAR (ID_KOMENTAR,TEXT,DATUMPRIDANI,DATUMZMENY,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('14','No, vìc se má tak, že nevím kolik je 2+2, zdá se to být neøešitelný problém, pletu se snad?',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'13','19');
Insert into ST58214.KOMENTAR (ID_KOMENTAR,TEXT,DATUMPRIDANI,DATUMZMENY,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('15','Nebojte, nepletete, jedná se o chyták, otázka nemá øešení.',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'13','5');
Insert into ST58214.KOMENTAR (ID_KOMENTAR,TEXT,DATUMPRIDANI,DATUMZMENY,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('16','Toto je diskuzní forum pro materiál, pokud budete mít nìjaké dotazy, zde je napište.',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'22','5');
Insert into ST58214.KOMENTAR (ID_KOMENTAR,TEXT,DATUMPRIDANI,DATUMZMENY,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('17','Dobrý den, rád bych se zeptal na jeden pøíklad ze cvièení. Mohla by jste mi pomoci?',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'22','20');
Insert into ST58214.KOMENTAR (ID_KOMENTAR,TEXT,DATUMPRIDANI,DATUMZMENY,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('18','Jistì, jaký je problém?',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'22','5');
Insert into ST58214.KOMENTAR (ID_KOMENTAR,TEXT,DATUMPRIDANI,DATUMZMENY,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('19','No, vìc se má tak, že nevím kolik je 2+2, zdá se to být neøešitelný problém, pletu se snad?',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'22','20');
Insert into ST58214.KOMENTAR (ID_KOMENTAR,TEXT,DATUMPRIDANI,DATUMZMENY,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('20','Nebojte, nepletete, jedná se o chyták, otázka nemá øešení.',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'22','5');
Insert into ST58214.KOMENTAR (ID_KOMENTAR,TEXT,DATUMPRIDANI,DATUMZMENY,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('1','Toto je diskuzní forum pro materiál, pokud budete mít nìjaké dotazy, zde je napište.',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'1','4');
Insert into ST58214.KOMENTAR (ID_KOMENTAR,TEXT,DATUMPRIDANI,DATUMZMENY,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('2','Dobrý den, rád bych se zeptal na jeden pøíklad ze cvièení. Mohla by jste mi pomoci?',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'1','18');
Insert into ST58214.KOMENTAR (ID_KOMENTAR,TEXT,DATUMPRIDANI,DATUMZMENY,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('3','Jistì, jaký je problém?',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'1','4');
Insert into ST58214.KOMENTAR (ID_KOMENTAR,TEXT,DATUMPRIDANI,DATUMZMENY,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('4','No, vìc se má tak, že nevím kolik je 2+2, zdá se to být neøešitelný problém, pletu se snad?',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'1','18');
Insert into ST58214.KOMENTAR (ID_KOMENTAR,TEXT,DATUMPRIDANI,DATUMZMENY,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('5','Nebojte, nepletete, jedná se o chyták, otázka nemá øešení.',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'1','4');
REM INSERTING into ST58214.KVIZ
SET DEFINE OFF;
Insert into ST58214.KVIZ (ID_KVIZ,NAZEV,POPIS,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('2','Cvièení 2','Jednoduché cvièení z druhé hodiny.','2','4');
Insert into ST58214.KVIZ (ID_KVIZ,NAZEV,POPIS,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('3','Cvièení 3','Jednoduché cvièení z tøetí hodiny.','3','4');
Insert into ST58214.KVIZ (ID_KVIZ,NAZEV,POPIS,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('4','Cvièení 4','Jednoduché cvièení z ètvrté hodiny.','4','4');
Insert into ST58214.KVIZ (ID_KVIZ,NAZEV,POPIS,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('5','Cvièení 5','Jednoduché cvièení z páté hodiny.','5','4');
Insert into ST58214.KVIZ (ID_KVIZ,NAZEV,POPIS,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('6','Cvièení 6','Jednoduché cvièení z šesté hodiny.','6','4');
Insert into ST58214.KVIZ (ID_KVIZ,NAZEV,POPIS,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('7','Cvièení 7','Jednoduché cvièení z sedmé hodiny.','7','4');
Insert into ST58214.KVIZ (ID_KVIZ,NAZEV,POPIS,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('8','Cvièení 8','Jednoduché cvièení z osmé hodiny.','8','4');
Insert into ST58214.KVIZ (ID_KVIZ,NAZEV,POPIS,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('9','Cvièení 9','Jednoduché cvièení z deváté hodiny.','9','4');
Insert into ST58214.KVIZ (ID_KVIZ,NAZEV,POPIS,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('10','Cvièení 10','Jednoduché cvièení z desáté hodiny.','10','4');
Insert into ST58214.KVIZ (ID_KVIZ,NAZEV,POPIS,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('11','Cvièení 11','Jednoduché cvièení z jedenácté hodiny.','11','4');
Insert into ST58214.KVIZ (ID_KVIZ,NAZEV,POPIS,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('12','Cvièení 12','Jednoduché cvièení z první hodiny.','12','4');
Insert into ST58214.KVIZ (ID_KVIZ,NAZEV,POPIS,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('13','Cvièení 1','Jednoduché cvièení z první hodiny.','13','5');
Insert into ST58214.KVIZ (ID_KVIZ,NAZEV,POPIS,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('14','Cvièení 2','Jednoduché cvièení z druhé hodiny.','14','5');
Insert into ST58214.KVIZ (ID_KVIZ,NAZEV,POPIS,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('15','Cvièení 3','Jednoduché cvièení z tøetí hodiny.','15','5');
Insert into ST58214.KVIZ (ID_KVIZ,NAZEV,POPIS,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('16','Cvièení 4','Jednoduché cvièení z ètvrté hodiny.','16','5');
Insert into ST58214.KVIZ (ID_KVIZ,NAZEV,POPIS,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('17','Cvièení 5','Jednoduché cvièení z páté hodiny.','17','5');
Insert into ST58214.KVIZ (ID_KVIZ,NAZEV,POPIS,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('18','Cvièení 6','Jednoduché cvièení z šesté hodiny.','18','5');
Insert into ST58214.KVIZ (ID_KVIZ,NAZEV,POPIS,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('19','Cvièení 7','Jednoduché cvièení z sedmé hodiny.','19','5');
Insert into ST58214.KVIZ (ID_KVIZ,NAZEV,POPIS,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('20','Cvièení 8','Jednoduché cvièení z osmé hodiny.','20','5');
Insert into ST58214.KVIZ (ID_KVIZ,NAZEV,POPIS,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('21','Cvièení 9','Jednoduché cvièení z deváté hodiny.','21','5');
Insert into ST58214.KVIZ (ID_KVIZ,NAZEV,POPIS,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('22','Cvièení 10','Jednoduché cvièení z desáté hodiny.','22','5');
Insert into ST58214.KVIZ (ID_KVIZ,NAZEV,POPIS,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('1','Úvod','Jednoduché cvièení z první hodiny.','1','4');
Insert into ST58214.KVIZ (ID_KVIZ,NAZEV,POPIS,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('25','Test 1',null,'24','1');
REM INSERTING into ST58214.NEVHODNE_SLOVO
SET DEFINE OFF;
Insert into ST58214.NEVHODNE_SLOVO (ID_NEVHODNE_SLOVO,TEXT) values ('3','umøi');
REM INSERTING into ST58214.OTAZKA
SET DEFINE OFF;
Insert into ST58214.OTAZKA (ID_OTAZKA,NAZEV,OTAZKA,ODPOVED,BODY,PORADI,KVIZ_ID,DRUH_OTAZKY_ID,UZIVATEL_ID) values ('2','Pøíklad 1','Kolik je 2+2 ?

a, 3
b, 4
c, 5
d, nemá øešení','b','1','1','2','1','4');
Insert into ST58214.OTAZKA (ID_OTAZKA,NAZEV,OTAZKA,ODPOVED,BODY,PORADI,KVIZ_ID,DRUH_OTAZKY_ID,UZIVATEL_ID) values ('3','Pøíklad 1','Kolik je 2+2 ?

a, 3
b, 4
c, 5
d, nemá øešení','b','1','1','3','1','4');
Insert into ST58214.OTAZKA (ID_OTAZKA,NAZEV,OTAZKA,ODPOVED,BODY,PORADI,KVIZ_ID,DRUH_OTAZKY_ID,UZIVATEL_ID) values ('4','Pøíklad 1','Kolik je 2+2 ?

a, 3
b, 4
c, 5
d, nemá øešení','b','1','1','4','1','4');
Insert into ST58214.OTAZKA (ID_OTAZKA,NAZEV,OTAZKA,ODPOVED,BODY,PORADI,KVIZ_ID,DRUH_OTAZKY_ID,UZIVATEL_ID) values ('5','Pøíklad 1','Kolik je 2+2 ?

a, 3
b, 4
c, 5
d, nemá øešení','b','1','1','5','1','4');
Insert into ST58214.OTAZKA (ID_OTAZKA,NAZEV,OTAZKA,ODPOVED,BODY,PORADI,KVIZ_ID,DRUH_OTAZKY_ID,UZIVATEL_ID) values ('6','Pøíklad 1','Kolik je 2+2 ?

a, 3
b, 4
c, 5
d, nemá øešení','b','1','1','6','1','4');
Insert into ST58214.OTAZKA (ID_OTAZKA,NAZEV,OTAZKA,ODPOVED,BODY,PORADI,KVIZ_ID,DRUH_OTAZKY_ID,UZIVATEL_ID) values ('7','Pøíklad 1','Kolik je 2+2 ?

a, 3
b, 4
c, 5
d, nemá øešení','b','1','1','7','1','4');
Insert into ST58214.OTAZKA (ID_OTAZKA,NAZEV,OTAZKA,ODPOVED,BODY,PORADI,KVIZ_ID,DRUH_OTAZKY_ID,UZIVATEL_ID) values ('8','Pøíklad 1','Kolik je 2+2 ?

a, 3
b, 4
c, 5
d, nemá øešení','b','1','1','8','1','4');
Insert into ST58214.OTAZKA (ID_OTAZKA,NAZEV,OTAZKA,ODPOVED,BODY,PORADI,KVIZ_ID,DRUH_OTAZKY_ID,UZIVATEL_ID) values ('9','Pøíklad 1','Kolik je 2+2 ?

a, 3
b, 4
c, 5
d, nemá øešení','b','1','1','9','1','4');
Insert into ST58214.OTAZKA (ID_OTAZKA,NAZEV,OTAZKA,ODPOVED,BODY,PORADI,KVIZ_ID,DRUH_OTAZKY_ID,UZIVATEL_ID) values ('10','Pøíklad 1','Kolik je 2+2 ?

a, 3
b, 4
c, 5
d, nemá øešení','b','1','1','10','1','4');
Insert into ST58214.OTAZKA (ID_OTAZKA,NAZEV,OTAZKA,ODPOVED,BODY,PORADI,KVIZ_ID,DRUH_OTAZKY_ID,UZIVATEL_ID) values ('11','Pøíklad 1','Kolik je 2+2 ?

a, 3
b, 4
c, 5
d, nemá øešení','b','1','1','11','1','4');
Insert into ST58214.OTAZKA (ID_OTAZKA,NAZEV,OTAZKA,ODPOVED,BODY,PORADI,KVIZ_ID,DRUH_OTAZKY_ID,UZIVATEL_ID) values ('12','Pøíklad 1','Kolik je 2+2 ?

a, 3
b, 4
c, 5
d, nemá øešení','b','1','1','12','1','4');
Insert into ST58214.OTAZKA (ID_OTAZKA,NAZEV,OTAZKA,ODPOVED,BODY,PORADI,KVIZ_ID,DRUH_OTAZKY_ID,UZIVATEL_ID) values ('13','Pøíklad 1','Kolik je 2+2 ?

a, 3
b, 4
c, 5
d, nemá øešení','b','1','1','13','1','5');
Insert into ST58214.OTAZKA (ID_OTAZKA,NAZEV,OTAZKA,ODPOVED,BODY,PORADI,KVIZ_ID,DRUH_OTAZKY_ID,UZIVATEL_ID) values ('14','Pøíklad 1','Kolik je 2+2 ?

a, 3
b, 4
c, 5
d, nemá øešení','b','1','1','14','1','5');
Insert into ST58214.OTAZKA (ID_OTAZKA,NAZEV,OTAZKA,ODPOVED,BODY,PORADI,KVIZ_ID,DRUH_OTAZKY_ID,UZIVATEL_ID) values ('15','Pøíklad 1','Kolik je 2+2 ?

a, 3
b, 4
c, 5
d, nemá øešení','b','1','1','15','1','5');
Insert into ST58214.OTAZKA (ID_OTAZKA,NAZEV,OTAZKA,ODPOVED,BODY,PORADI,KVIZ_ID,DRUH_OTAZKY_ID,UZIVATEL_ID) values ('16','Pøíklad 1','Kolik je 2+2 ?

a, 3
b, 4
c, 5
d, nemá øešení','b','1','1','16','1','5');
Insert into ST58214.OTAZKA (ID_OTAZKA,NAZEV,OTAZKA,ODPOVED,BODY,PORADI,KVIZ_ID,DRUH_OTAZKY_ID,UZIVATEL_ID) values ('17','Pøíklad 1','Kolik je 2+2 ?

a, 3
b, 4
c, 5
d, nemá øešení','b','1','1','17','1','5');
Insert into ST58214.OTAZKA (ID_OTAZKA,NAZEV,OTAZKA,ODPOVED,BODY,PORADI,KVIZ_ID,DRUH_OTAZKY_ID,UZIVATEL_ID) values ('18','Pøíklad 1','Kolik je 2+2 ?

a, 3
b, 4
c, 5
d, nemá øešení','b','1','1','18','1','5');
Insert into ST58214.OTAZKA (ID_OTAZKA,NAZEV,OTAZKA,ODPOVED,BODY,PORADI,KVIZ_ID,DRUH_OTAZKY_ID,UZIVATEL_ID) values ('19','Pøíklad 1','Kolik je 2+2 ?

a, 3
b, 4
c, 5
d, nemá øešení','b','1','1','19','1','5');
Insert into ST58214.OTAZKA (ID_OTAZKA,NAZEV,OTAZKA,ODPOVED,BODY,PORADI,KVIZ_ID,DRUH_OTAZKY_ID,UZIVATEL_ID) values ('20','Pøíklad 1','Kolik je 2+2 ?

a, 3
b, 4
c, 5
d, nemá øešení','b','1','1','20','1','5');
Insert into ST58214.OTAZKA (ID_OTAZKA,NAZEV,OTAZKA,ODPOVED,BODY,PORADI,KVIZ_ID,DRUH_OTAZKY_ID,UZIVATEL_ID) values ('21','Pøíklad 1','Kolik je 2+2 ?

a, 3
b, 4
c, 5
d, nemá øešení','b','1','1','21','1','5');
Insert into ST58214.OTAZKA (ID_OTAZKA,NAZEV,OTAZKA,ODPOVED,BODY,PORADI,KVIZ_ID,DRUH_OTAZKY_ID,UZIVATEL_ID) values ('22','Pøíklad 1','Kolik je 2+2 ?

a, 3
b, 4
c, 5
d, nemá øešení','b','1','1','22','1','5');
Insert into ST58214.OTAZKA (ID_OTAZKA,NAZEV,OTAZKA,ODPOVED,BODY,PORADI,KVIZ_ID,DRUH_OTAZKY_ID,UZIVATEL_ID) values ('1','Pøíklad 1','Kolik je 2+2 ?

a, 3
b, 4
c, 5
d, nemá øešení','b','1','1','1','1','4');
Insert into ST58214.OTAZKA (ID_OTAZKA,NAZEV,OTAZKA,ODPOVED,BODY,PORADI,KVIZ_ID,DRUH_OTAZKY_ID,UZIVATEL_ID) values ('25','Pøíklad 2','Kolik má kolik znakù?

a, 3
b, 5
c, 7
d, žádné z uvedených','b','5','2','1','1','4');
REM INSERTING into ST58214.PREDMET
SET DEFINE OFF;
Insert into ST58214.PREDMET (ID_PREDMET,NAZEV,ZKRATKA,POPIS) values ('1','Databázové systémy 1','IDAS1','Pøedmìt databázové systémy.');
Insert into ST58214.PREDMET (ID_PREDMET,NAZEV,ZKRATKA,POPIS) values ('2','Angliètina pro akademické úèely I - B2','IPAAG',null);
Insert into ST58214.PREDMET (ID_PREDMET,NAZEV,ZKRATKA,POPIS) values ('3','Datové struktury','IDATS',null);
Insert into ST58214.PREDMET (ID_PREDMET,NAZEV,ZKRATKA,POPIS) values ('4','Mobilní technologie a aplikace','IMTA',null);
Insert into ST58214.PREDMET (ID_PREDMET,NAZEV,ZKRATKA,POPIS) values ('5','Modelování ve výpoètových SW','IMSW',null);
Insert into ST58214.PREDMET (ID_PREDMET,NAZEV,ZKRATKA,POPIS) values ('6','Operaèní systémy','IOSYS',null);
Insert into ST58214.PREDMET (ID_PREDMET,NAZEV,ZKRATKA,POPIS) values ('7','Poèítaèové sítì II','IPS2',null);
Insert into ST58214.PREDMET (ID_PREDMET,NAZEV,ZKRATKA,POPIS) values ('8','Øízená prázdninová praxe II','IRPP2',null);
Insert into ST58214.PREDMET (ID_PREDMET,NAZEV,ZKRATKA,POPIS) values ('9','Angliètina pro obory elektro a IT - B2','IPAIG',null);
Insert into ST58214.PREDMET (ID_PREDMET,NAZEV,ZKRATKA,POPIS) values ('10','Historie techniky 1','IHIT1',null);
Insert into ST58214.PREDMET (ID_PREDMET,NAZEV,ZKRATKA,POPIS) values ('11','Jazyk C','IUJC',null);
Insert into ST58214.PREDMET (ID_PREDMET,NAZEV,ZKRATKA,POPIS) values ('12','Objektovì orientované programování','IOOP',null);
Insert into ST58214.PREDMET (ID_PREDMET,NAZEV,ZKRATKA,POPIS) values ('13','Poèítaèová grafika I','IPOG1',null);
Insert into ST58214.PREDMET (ID_PREDMET,NAZEV,ZKRATKA,POPIS) values ('14','Poèítaèové sítì I','IPS1',null);
Insert into ST58214.PREDMET (ID_PREDMET,NAZEV,ZKRATKA,POPIS) values ('15','Statistika','ISTAT',null);
Insert into ST58214.PREDMET (ID_PREDMET,NAZEV,ZKRATKA,POPIS) values ('16','Základy marketingu','IZMAR',null);
Insert into ST58214.PREDMET (ID_PREDMET,NAZEV,ZKRATKA,POPIS) values ('17','Databázové systémy 2','IDAS2',null);
Insert into ST58214.PREDMET (ID_PREDMET,NAZEV,ZKRATKA,POPIS) values ('18','Správa operaèních systémù','ISOSY',null);
Insert into ST58214.PREDMET (ID_PREDMET,NAZEV,ZKRATKA,POPIS) values ('19','Návrh a tvorba WWW stránek','IWWW',null);
Insert into ST58214.PREDMET (ID_PREDMET,NAZEV,ZKRATKA,POPIS) values ('20','Jazyk C++ 1','IC++1',null);
REM INSERTING into ST58214.PREDMETY_SKUPINY
SET DEFINE OFF;
Insert into ST58214.PREDMETY_SKUPINY (SKUPINA_ID,PREDMET_ID) values ('1','1');
Insert into ST58214.PREDMETY_SKUPINY (SKUPINA_ID,PREDMET_ID) values ('1','17');
REM INSERTING into ST58214.PREDMETY_UZIVATELE
SET DEFINE OFF;
Insert into ST58214.PREDMETY_UZIVATELE (UZIVATEL_ID,PREDMET_ID) values ('1','1');
Insert into ST58214.PREDMETY_UZIVATELE (UZIVATEL_ID,PREDMET_ID) values ('1','2');
Insert into ST58214.PREDMETY_UZIVATELE (UZIVATEL_ID,PREDMET_ID) values ('1','6');
Insert into ST58214.PREDMETY_UZIVATELE (UZIVATEL_ID,PREDMET_ID) values ('1','8');
Insert into ST58214.PREDMETY_UZIVATELE (UZIVATEL_ID,PREDMET_ID) values ('1','13');
Insert into ST58214.PREDMETY_UZIVATELE (UZIVATEL_ID,PREDMET_ID) values ('4','1');
Insert into ST58214.PREDMETY_UZIVATELE (UZIVATEL_ID,PREDMET_ID) values ('18','1');
Insert into ST58214.PREDMETY_UZIVATELE (UZIVATEL_ID,PREDMET_ID) values ('18','4');
Insert into ST58214.PREDMETY_UZIVATELE (UZIVATEL_ID,PREDMET_ID) values ('18','7');
Insert into ST58214.PREDMETY_UZIVATELE (UZIVATEL_ID,PREDMET_ID) values ('18','13');
REM INSERTING into ST58214.ROLE
SET DEFINE OFF;
Insert into ST58214.ROLE (ID_ROLE,NAZEV,OPRAVNENI,POPIS) values ('1','Administrátor','ADMINISTRATOR','Administrátorský úèet');
Insert into ST58214.ROLE (ID_ROLE,NAZEV,OPRAVNENI,POPIS) values ('2','Uèitel','TEACHER','Uèitelský úèet');
Insert into ST58214.ROLE (ID_ROLE,NAZEV,OPRAVNENI,POPIS) values ('3','Student','STUDENT','Studentský úèet');
REM INSERTING into ST58214.SKUPINA
SET DEFINE OFF;
Insert into ST58214.SKUPINA (ID_SKUPINA,ROK_STUDIA,OBOR) values ('4','2020','Øízení procesù');
Insert into ST58214.SKUPINA (ID_SKUPINA,ROK_STUDIA,OBOR) values ('1','2020','SQL Databáze');
REM INSERTING into ST58214.SOUBOR
SET DEFINE OFF;
Insert into ST58214.SOUBOR (ID_SOUBOR,NAZEV,PRIPONA,NAHRANO,UPRAVENO,UZIVATEL_ID) values ('2','PLSQL 15 4','pdf',to_date('26.11.20','DD.MM.RR'),to_date('26.11.20','DD.MM.RR'),'1');
REM INSERTING into ST58214.STUDIJNI_MATERIAL
SET DEFINE OFF;
Insert into ST58214.STUDIJNI_MATERIAL (ID_STUDIJNIMATERIAL,NAZEV,STRAN,DATUMVYTVORENI,DATUMZMENY,POPIS,PRIPONA,PREDMET_ID,UZIVATEL_ID) values ('1','Základy s SQL 1','20',to_date('04.06.20','DD.MM.RR'),to_date('10.06.20','DD.MM.RR'),'Zde se nauèíme základy s SQL v databázovém systému Oracle DB','png     ','1','4');
Insert into ST58214.STUDIJNI_MATERIAL (ID_STUDIJNIMATERIAL,NAZEV,STRAN,DATUMVYTVORENI,DATUMZMENY,POPIS,PRIPONA,PREDMET_ID,UZIVATEL_ID) values ('2','Základy s SQL 2','20',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'Lekce 2',null,'1','4');
Insert into ST58214.STUDIJNI_MATERIAL (ID_STUDIJNIMATERIAL,NAZEV,STRAN,DATUMVYTVORENI,DATUMZMENY,POPIS,PRIPONA,PREDMET_ID,UZIVATEL_ID) values ('3','Základy s SQL 3','20',to_date('04.06.20','DD.MM.RR'),to_date('12.12.20','DD.MM.RR'),'Lekce 3',null,'1','4');
Insert into ST58214.STUDIJNI_MATERIAL (ID_STUDIJNIMATERIAL,NAZEV,STRAN,DATUMVYTVORENI,DATUMZMENY,POPIS,PRIPONA,PREDMET_ID,UZIVATEL_ID) values ('4','Základy s SQL 4','20',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'Lekce 4',null,'1','4');
Insert into ST58214.STUDIJNI_MATERIAL (ID_STUDIJNIMATERIAL,NAZEV,STRAN,DATUMVYTVORENI,DATUMZMENY,POPIS,PRIPONA,PREDMET_ID,UZIVATEL_ID) values ('5','Základy s SQL 5','20',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'Lekce 5',null,'1','4');
Insert into ST58214.STUDIJNI_MATERIAL (ID_STUDIJNIMATERIAL,NAZEV,STRAN,DATUMVYTVORENI,DATUMZMENY,POPIS,PRIPONA,PREDMET_ID,UZIVATEL_ID) values ('6','Základy s SQL 6','20',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'Lekce 6',null,'1','4');
Insert into ST58214.STUDIJNI_MATERIAL (ID_STUDIJNIMATERIAL,NAZEV,STRAN,DATUMVYTVORENI,DATUMZMENY,POPIS,PRIPONA,PREDMET_ID,UZIVATEL_ID) values ('7','Základy s SQL 7','20',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'Lekce 7',null,'1','4');
Insert into ST58214.STUDIJNI_MATERIAL (ID_STUDIJNIMATERIAL,NAZEV,STRAN,DATUMVYTVORENI,DATUMZMENY,POPIS,PRIPONA,PREDMET_ID,UZIVATEL_ID) values ('8','Základy s SQL 8','20',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'Lekce 8',null,'1','4');
Insert into ST58214.STUDIJNI_MATERIAL (ID_STUDIJNIMATERIAL,NAZEV,STRAN,DATUMVYTVORENI,DATUMZMENY,POPIS,PRIPONA,PREDMET_ID,UZIVATEL_ID) values ('9','Základy s SQL 9','20',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'Lekce 9',null,'1','4');
Insert into ST58214.STUDIJNI_MATERIAL (ID_STUDIJNIMATERIAL,NAZEV,STRAN,DATUMVYTVORENI,DATUMZMENY,POPIS,PRIPONA,PREDMET_ID,UZIVATEL_ID) values ('10','Základy s SQL 10','20',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'Lekce 10',null,'1','4');
Insert into ST58214.STUDIJNI_MATERIAL (ID_STUDIJNIMATERIAL,NAZEV,STRAN,DATUMVYTVORENI,DATUMZMENY,POPIS,PRIPONA,PREDMET_ID,UZIVATEL_ID) values ('11','Základy s SQL 11','20',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'Lekce 11',null,'1','4');
Insert into ST58214.STUDIJNI_MATERIAL (ID_STUDIJNIMATERIAL,NAZEV,STRAN,DATUMVYTVORENI,DATUMZMENY,POPIS,PRIPONA,PREDMET_ID,UZIVATEL_ID) values ('12','Základy s SQL 12 Final','20',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'Lekce 12 Final + test',null,'1','4');
Insert into ST58214.STUDIJNI_MATERIAL (ID_STUDIJNIMATERIAL,NAZEV,STRAN,DATUMVYTVORENI,DATUMZMENY,POPIS,PRIPONA,PREDMET_ID,UZIVATEL_ID) values ('13','Datové struktury 1','20',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'Pøednáška 1',null,'3','5');
Insert into ST58214.STUDIJNI_MATERIAL (ID_STUDIJNIMATERIAL,NAZEV,STRAN,DATUMVYTVORENI,DATUMZMENY,POPIS,PRIPONA,PREDMET_ID,UZIVATEL_ID) values ('14','Datové struktury 2','20',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'Pøednáška 2',null,'3','5');
Insert into ST58214.STUDIJNI_MATERIAL (ID_STUDIJNIMATERIAL,NAZEV,STRAN,DATUMVYTVORENI,DATUMZMENY,POPIS,PRIPONA,PREDMET_ID,UZIVATEL_ID) values ('15','Datové struktury 3','20',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'Pøednáška 3',null,'3','5');
Insert into ST58214.STUDIJNI_MATERIAL (ID_STUDIJNIMATERIAL,NAZEV,STRAN,DATUMVYTVORENI,DATUMZMENY,POPIS,PRIPONA,PREDMET_ID,UZIVATEL_ID) values ('16','Datové struktury 4','20',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'Pøednáška 4',null,'3','5');
Insert into ST58214.STUDIJNI_MATERIAL (ID_STUDIJNIMATERIAL,NAZEV,STRAN,DATUMVYTVORENI,DATUMZMENY,POPIS,PRIPONA,PREDMET_ID,UZIVATEL_ID) values ('17','Datové struktury 5','20',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'Pøednáška 5',null,'3','5');
Insert into ST58214.STUDIJNI_MATERIAL (ID_STUDIJNIMATERIAL,NAZEV,STRAN,DATUMVYTVORENI,DATUMZMENY,POPIS,PRIPONA,PREDMET_ID,UZIVATEL_ID) values ('18','Datové struktury 6','20',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'Pøednáška 6',null,'3','5');
Insert into ST58214.STUDIJNI_MATERIAL (ID_STUDIJNIMATERIAL,NAZEV,STRAN,DATUMVYTVORENI,DATUMZMENY,POPIS,PRIPONA,PREDMET_ID,UZIVATEL_ID) values ('19','Datové struktury 7','20',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'Pøednáška 7',null,'3','5');
Insert into ST58214.STUDIJNI_MATERIAL (ID_STUDIJNIMATERIAL,NAZEV,STRAN,DATUMVYTVORENI,DATUMZMENY,POPIS,PRIPONA,PREDMET_ID,UZIVATEL_ID) values ('20','Datové struktury 8','20',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'Pøednáška 8',null,'3','5');
Insert into ST58214.STUDIJNI_MATERIAL (ID_STUDIJNIMATERIAL,NAZEV,STRAN,DATUMVYTVORENI,DATUMZMENY,POPIS,PRIPONA,PREDMET_ID,UZIVATEL_ID) values ('21','Datové struktury 9','20',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'Pøednáška 9',null,'3','5');
Insert into ST58214.STUDIJNI_MATERIAL (ID_STUDIJNIMATERIAL,NAZEV,STRAN,DATUMVYTVORENI,DATUMZMENY,POPIS,PRIPONA,PREDMET_ID,UZIVATEL_ID) values ('22','Datové struktury 10','20',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'Pøednáška 10',null,'3','5');
Insert into ST58214.STUDIJNI_MATERIAL (ID_STUDIJNIMATERIAL,NAZEV,STRAN,DATUMVYTVORENI,DATUMZMENY,POPIS,PRIPONA,PREDMET_ID,UZIVATEL_ID) values ('25','Pøednáška 1','24',to_date('12.12.20','DD.MM.RR'),to_date('12.12.20','DD.MM.RR'),null,null,'4','1');
Insert into ST58214.STUDIJNI_MATERIAL (ID_STUDIJNIMATERIAL,NAZEV,STRAN,DATUMVYTVORENI,DATUMZMENY,POPIS,PRIPONA,PREDMET_ID,UZIVATEL_ID) values ('24','Cvièení 1','10',to_date('12.12.20','DD.MM.RR'),to_date('12.12.20','DD.MM.RR'),null,null,'2','1');
REM INSERTING into ST58214.UPRAVA_MATERIALU
SET DEFINE OFF;
Insert into ST58214.UPRAVA_MATERIALU (ID_UPRAVAMATERIALU,DATUM,UZIVATEL_ID,STUDIJNI_MATERIAL_ID) values ('6',to_date('12.12.20','DD.MM.RR'),'4','3');
Insert into ST58214.UPRAVA_MATERIALU (ID_UPRAVAMATERIALU,DATUM,UZIVATEL_ID,STUDIJNI_MATERIAL_ID) values ('5',to_date('12.12.20','DD.MM.RR'),'1','24');
Insert into ST58214.UPRAVA_MATERIALU (ID_UPRAVAMATERIALU,DATUM,UZIVATEL_ID,STUDIJNI_MATERIAL_ID) values ('4',to_date('10.06.20','DD.MM.RR'),'1','1');
REM INSERTING into ST58214.UZIVATEL
SET DEFINE OFF;
Insert into ST58214.UZIVATEL (ID_UZIVATEL,LOGIN,HESLO,JMENO,PRIJMENI,EMAIL,TELEFON,ADRESA,ROLE_ID) values ('1','admin  ','$2a$12$9eB4FHfTDqhXxD5R4Tf0ee.HLwk/HSgYc4zIvMLsop46meGdODOri','Administrátor',' ','admin@upce.cz',null,null,'1');
Insert into ST58214.UZIVATEL (ID_UZIVATEL,LOGIN,HESLO,JMENO,PRIJMENI,EMAIL,TELEFON,ADRESA,ROLE_ID) values ('2','system ','$2a$12$hiOOf6guKbvJ7MKGTWBIW.0MdFxGiB3O4pXoJoUMh9dc82./EKkfS','Systém',' ','system@upce.cz',null,null,'3');
Insert into ST58214.UZIVATEL (ID_UZIVATEL,LOGIN,HESLO,JMENO,PRIJMENI,EMAIL,TELEFON,ADRESA,ROLE_ID) values ('3','student','$2a$12$IkksthIwfjQO2mLt9vUlV.Clska8zq3HiMYWQPuFkrwZj.BcZxk66','Student',' ','student@upce.cz',null,null,'3');
Insert into ST58214.UZIVATEL (ID_UZIVATEL,LOGIN,HESLO,JMENO,PRIJMENI,EMAIL,TELEFON,ADRESA,ROLE_ID) values ('4','T001   ','$2a$12$1LmwdwDU4do3Ypc3qoFF1uMFw2olPYVCqWfheY2XkaCY9akR9O59y','Monika','Borkovcová','monika.borkovcova@upce.cz',null,null,'2');
Insert into ST58214.UZIVATEL (ID_UZIVATEL,LOGIN,HESLO,JMENO,PRIJMENI,EMAIL,TELEFON,ADRESA,ROLE_ID) values ('5','T002   ','$2a$12$Gs3FsFzxfAn/UZf0uw/TPujyct9GJFTmemJI6mkqRvA8doroeSDqy','Jan','Fikejz','jan.fikejz@upce.cz',null,null,'2');
Insert into ST58214.UZIVATEL (ID_UZIVATEL,LOGIN,HESLO,JMENO,PRIJMENI,EMAIL,TELEFON,ADRESA,ROLE_ID) values ('6','T003   ','$2a$12$Gs3FsFzxfAn/UZf0uw/TPujyct9GJFTmemJI6mkqRvA8doroeSDqy','Markéta','Denksteinová','marketa.denksteinova@upce.cz',null,null,'2');
Insert into ST58214.UZIVATEL (ID_UZIVATEL,LOGIN,HESLO,JMENO,PRIJMENI,EMAIL,TELEFON,ADRESA,ROLE_ID) values ('7','T004   ','$2a$12$Gs3FsFzxfAn/UZf0uw/TPujyct9GJFTmemJI6mkqRvA8doroeSDqy','Antonín','Kavièka','antonin.kavicka@upce.cz',null,null,'2');
Insert into ST58214.UZIVATEL (ID_UZIVATEL,LOGIN,HESLO,JMENO,PRIJMENI,EMAIL,TELEFON,ADRESA,ROLE_ID) values ('8','T005   ','$2a$12$oBcVeoM.wMxt4g7HeKGjSe4lzTfvuGCNxeU1W5Dvzuz646ASismbu','Jan','Panuš','jan.panus@upce.cz',null,null,'2');
Insert into ST58214.UZIVATEL (ID_UZIVATEL,LOGIN,HESLO,JMENO,PRIJMENI,EMAIL,TELEFON,ADRESA,ROLE_ID) values ('9','T006   ','$2a$12$oBcVeoM.wMxt4g7HeKGjSe4lzTfvuGCNxeU1W5Dvzuz646ASismbu','Jan','Merta','	jan.merta@student.upce.cz',null,null,'2');
Insert into ST58214.UZIVATEL (ID_UZIVATEL,LOGIN,HESLO,JMENO,PRIJMENI,EMAIL,TELEFON,ADRESA,ROLE_ID) values ('10','T007   ','$2a$12$oBcVeoM.wMxt4g7HeKGjSe4lzTfvuGCNxeU1W5Dvzuz646ASismbu','Tomáš','Hudec','tomas.hudec@upce.cz',null,null,'2');
Insert into ST58214.UZIVATEL (ID_UZIVATEL,LOGIN,HESLO,JMENO,PRIJMENI,EMAIL,TELEFON,ADRESA,ROLE_ID) values ('11','T008   ','$2a$12$oBcVeoM.wMxt4g7HeKGjSe4lzTfvuGCNxeU1W5Dvzuz646ASismbu','Soòa','Neradová','sona.neradova@upce.cz',null,null,'2');
Insert into ST58214.UZIVATEL (ID_UZIVATEL,LOGIN,HESLO,JMENO,PRIJMENI,EMAIL,TELEFON,ADRESA,ROLE_ID) values ('12','T009   ','$2a$12$oBcVeoM.wMxt4g7HeKGjSe4lzTfvuGCNxeU1W5Dvzuz646ASismbu','Miroslav','Dvoøák','miroslav.dvorak@upce.cz',null,null,'2');
Insert into ST58214.UZIVATEL (ID_UZIVATEL,LOGIN,HESLO,JMENO,PRIJMENI,EMAIL,TELEFON,ADRESA,ROLE_ID) values ('13','T010   ','$2a$12$oBcVeoM.wMxt4g7HeKGjSe4lzTfvuGCNxeU1W5Dvzuz646ASismbu','Jaroslav','Marek','jaroslav.marek@upce.cz',null,null,'2');
Insert into ST58214.UZIVATEL (ID_UZIVATEL,LOGIN,HESLO,JMENO,PRIJMENI,EMAIL,TELEFON,ADRESA,ROLE_ID) values ('14','T011   ','$2a$12$oBcVeoM.wMxt4g7HeKGjSe4lzTfvuGCNxeU1W5Dvzuz646ASismbu','Dana','Pøívratská','dana.privratska@upce.cz',null,null,'2');
Insert into ST58214.UZIVATEL (ID_UZIVATEL,LOGIN,HESLO,JMENO,PRIJMENI,EMAIL,TELEFON,ADRESA,ROLE_ID) values ('15','T012   ','$2a$12$oBcVeoM.wMxt4g7HeKGjSe4lzTfvuGCNxeU1W5Dvzuz646ASismbu','Petr','Veselý','petr.vesely@upce.cz',null,null,'2');
Insert into ST58214.UZIVATEL (ID_UZIVATEL,LOGIN,HESLO,JMENO,PRIJMENI,EMAIL,TELEFON,ADRESA,ROLE_ID) values ('16','T013   ','$2a$12$oBcVeoM.wMxt4g7HeKGjSe4lzTfvuGCNxeU1W5Dvzuz646ASismbu','Karel','Šimerda','karel.simerda@upce.cz',null,null,'2');
Insert into ST58214.UZIVATEL (ID_UZIVATEL,LOGIN,HESLO,JMENO,PRIJMENI,EMAIL,TELEFON,ADRESA,ROLE_ID) values ('17','T014   ','$2a$12$oBcVeoM.wMxt4g7HeKGjSe4lzTfvuGCNxeU1W5Dvzuz646ASismbu','Milan','Javùrek','milan.javurek@upce.cz',null,null,'2');
Insert into ST58214.UZIVATEL (ID_UZIVATEL,LOGIN,HESLO,JMENO,PRIJMENI,EMAIL,TELEFON,ADRESA,ROLE_ID) values ('18','ST58214','$2a$12$IaLy7R4H.Kj1zY08yBns4Oc7YBK8oo8x.xVD3xvTZJVfOmdaeK1Aq','Petr','Bednáø','st58214@student.upce.cz','123456789',null,'3');
Insert into ST58214.UZIVATEL (ID_UZIVATEL,LOGIN,HESLO,JMENO,PRIJMENI,EMAIL,TELEFON,ADRESA,ROLE_ID) values ('19','ST001  ','$2a$12$Gs3FsFzxfAn/UZf0uw/TPujyct9GJFTmemJI6mkqRvA8doroeSDqy','Lukáš','Janáèek','st001@student.upce.cz',null,null,'3');
Insert into ST58214.UZIVATEL (ID_UZIVATEL,LOGIN,HESLO,JMENO,PRIJMENI,EMAIL,TELEFON,ADRESA,ROLE_ID) values ('20','ST002  ','$2a$12$oBcVeoM.wMxt4g7HeKGjSe4lzTfvuGCNxeU1W5Dvzuz646ASismbu','Kryštof','Kysilka','st002@student.upce.cz',null,null,'3');
REM INSERTING into ST58214.UZIVATELE_SKUPINY
SET DEFINE OFF;
Insert into ST58214.UZIVATELE_SKUPINY (UZIVATEL_ID,SKUPINA_ID) values ('3','4');
Insert into ST58214.UZIVATELE_SKUPINY (UZIVATEL_ID,SKUPINA_ID) values ('4','1');
Insert into ST58214.UZIVATELE_SKUPINY (UZIVATEL_ID,SKUPINA_ID) values ('18','1');
Insert into ST58214.UZIVATELE_SKUPINY (UZIVATEL_ID,SKUPINA_ID) values ('19','1');
Insert into ST58214.UZIVATELE_SKUPINY (UZIVATEL_ID,SKUPINA_ID) values ('20','1');
REM INSERTING into ST58214.VYPLNENA_OTAZKA
SET DEFINE OFF;
Insert into ST58214.VYPLNENA_OTAZKA (ID_VYPLNENA_OTAZKA,ODPOVED,OTAZKA_ID,VYPLNENY_KVIZ_ID) values ('1','b','1','1');
Insert into ST58214.VYPLNENA_OTAZKA (ID_VYPLNENA_OTAZKA,ODPOVED,OTAZKA_ID,VYPLNENY_KVIZ_ID) values ('2','b','25','1');
Insert into ST58214.VYPLNENA_OTAZKA (ID_VYPLNENA_OTAZKA,ODPOVED,OTAZKA_ID,VYPLNENY_KVIZ_ID) values ('3','b','1','2');
Insert into ST58214.VYPLNENA_OTAZKA (ID_VYPLNENA_OTAZKA,ODPOVED,OTAZKA_ID,VYPLNENY_KVIZ_ID) values ('4','c','25','2');
Insert into ST58214.VYPLNENA_OTAZKA (ID_VYPLNENA_OTAZKA,ODPOVED,OTAZKA_ID,VYPLNENY_KVIZ_ID) values ('5','c','1','3');
Insert into ST58214.VYPLNENA_OTAZKA (ID_VYPLNENA_OTAZKA,ODPOVED,OTAZKA_ID,VYPLNENY_KVIZ_ID) values ('6','c','25','3');
Insert into ST58214.VYPLNENA_OTAZKA (ID_VYPLNENA_OTAZKA,ODPOVED,OTAZKA_ID,VYPLNENY_KVIZ_ID) values ('7','b','2','4');
Insert into ST58214.VYPLNENA_OTAZKA (ID_VYPLNENA_OTAZKA,ODPOVED,OTAZKA_ID,VYPLNENY_KVIZ_ID) values ('12','c','3','9');
Insert into ST58214.VYPLNENA_OTAZKA (ID_VYPLNENA_OTAZKA,ODPOVED,OTAZKA_ID,VYPLNENY_KVIZ_ID) values ('14','b','4','11');
Insert into ST58214.VYPLNENA_OTAZKA (ID_VYPLNENA_OTAZKA,ODPOVED,OTAZKA_ID,VYPLNENY_KVIZ_ID) values ('15','a','5','12');
Insert into ST58214.VYPLNENA_OTAZKA (ID_VYPLNENA_OTAZKA,ODPOVED,OTAZKA_ID,VYPLNENY_KVIZ_ID) values ('16','b','6','13');
Insert into ST58214.VYPLNENA_OTAZKA (ID_VYPLNENA_OTAZKA,ODPOVED,OTAZKA_ID,VYPLNENY_KVIZ_ID) values ('17','b','7','14');
Insert into ST58214.VYPLNENA_OTAZKA (ID_VYPLNENA_OTAZKA,ODPOVED,OTAZKA_ID,VYPLNENY_KVIZ_ID) values ('18','d','8','15');
Insert into ST58214.VYPLNENA_OTAZKA (ID_VYPLNENA_OTAZKA,ODPOVED,OTAZKA_ID,VYPLNENY_KVIZ_ID) values ('19','a','9','16');
Insert into ST58214.VYPLNENA_OTAZKA (ID_VYPLNENA_OTAZKA,ODPOVED,OTAZKA_ID,VYPLNENY_KVIZ_ID) values ('20','b','10','17');
Insert into ST58214.VYPLNENA_OTAZKA (ID_VYPLNENA_OTAZKA,ODPOVED,OTAZKA_ID,VYPLNENY_KVIZ_ID) values ('21','b','11','18');
Insert into ST58214.VYPLNENA_OTAZKA (ID_VYPLNENA_OTAZKA,ODPOVED,OTAZKA_ID,VYPLNENY_KVIZ_ID) values ('22','b','12','19');
REM INSERTING into ST58214.VYPLNENY_KVIZ
SET DEFINE OFF;
Insert into ST58214.VYPLNENY_KVIZ (ID_VYPLNENY_KVIZ,BODY,MAX_BODY,UZIVATEL_ID,KVIZ_ID) values ('1','6','6','18','1');
Insert into ST58214.VYPLNENY_KVIZ (ID_VYPLNENY_KVIZ,BODY,MAX_BODY,UZIVATEL_ID,KVIZ_ID) values ('2','1','6','19','1');
Insert into ST58214.VYPLNENY_KVIZ (ID_VYPLNENY_KVIZ,BODY,MAX_BODY,UZIVATEL_ID,KVIZ_ID) values ('3','0','6','20','1');
Insert into ST58214.VYPLNENY_KVIZ (ID_VYPLNENY_KVIZ,BODY,MAX_BODY,UZIVATEL_ID,KVIZ_ID) values ('4','1','1','18','2');
Insert into ST58214.VYPLNENY_KVIZ (ID_VYPLNENY_KVIZ,BODY,MAX_BODY,UZIVATEL_ID,KVIZ_ID) values ('9','0','1','18','3');
Insert into ST58214.VYPLNENY_KVIZ (ID_VYPLNENY_KVIZ,BODY,MAX_BODY,UZIVATEL_ID,KVIZ_ID) values ('11','1','1','18','4');
Insert into ST58214.VYPLNENY_KVIZ (ID_VYPLNENY_KVIZ,BODY,MAX_BODY,UZIVATEL_ID,KVIZ_ID) values ('12','0','1','18','5');
Insert into ST58214.VYPLNENY_KVIZ (ID_VYPLNENY_KVIZ,BODY,MAX_BODY,UZIVATEL_ID,KVIZ_ID) values ('13','1','1','18','6');
Insert into ST58214.VYPLNENY_KVIZ (ID_VYPLNENY_KVIZ,BODY,MAX_BODY,UZIVATEL_ID,KVIZ_ID) values ('14','1','1','18','7');
Insert into ST58214.VYPLNENY_KVIZ (ID_VYPLNENY_KVIZ,BODY,MAX_BODY,UZIVATEL_ID,KVIZ_ID) values ('15','0','1','18','8');
Insert into ST58214.VYPLNENY_KVIZ (ID_VYPLNENY_KVIZ,BODY,MAX_BODY,UZIVATEL_ID,KVIZ_ID) values ('16','0','1','18','9');
Insert into ST58214.VYPLNENY_KVIZ (ID_VYPLNENY_KVIZ,BODY,MAX_BODY,UZIVATEL_ID,KVIZ_ID) values ('17','1','1','18','10');
Insert into ST58214.VYPLNENY_KVIZ (ID_VYPLNENY_KVIZ,BODY,MAX_BODY,UZIVATEL_ID,KVIZ_ID) values ('18','1','1','18','11');
Insert into ST58214.VYPLNENY_KVIZ (ID_VYPLNENY_KVIZ,BODY,MAX_BODY,UZIVATEL_ID,KVIZ_ID) values ('19','1','1','18','12');
REM INSERTING into ST58214.ZPRAVA
SET DEFINE OFF;
Insert into ST58214.ZPRAVA (ID_ZPRAVA,TEXT,DATUM,ODESILATEL_ID,PRIJEMCE_ID) values ('24','Já se mám dobøe, jak se máš ty ? ',to_date('23.11.20','DD.MM.RR'),'18','1');
Insert into ST58214.ZPRAVA (ID_ZPRAVA,TEXT,DATUM,ODESILATEL_ID,PRIJEMCE_ID) values ('31','Informace o úètu byly upraveny.',to_date('10.12.20','DD.MM.RR'),'2','18');
Insert into ST58214.ZPRAVA (ID_ZPRAVA,TEXT,DATUM,ODESILATEL_ID,PRIJEMCE_ID) values ('23','Jak se máš ?',to_date('23.11.20','DD.MM.RR'),'1','18');
Insert into ST58214.ZPRAVA (ID_ZPRAVA,TEXT,DATUM,ODESILATEL_ID,PRIJEMCE_ID) values ('26','Jsi tu ještì ? ',to_date('23.11.20','DD.MM.RR'),'1','18');
Insert into ST58214.ZPRAVA (ID_ZPRAVA,TEXT,DATUM,ODESILATEL_ID,PRIJEMCE_ID) values ('11','Ahojky',to_date('23.11.20','DD.MM.RR'),'1','18');
Insert into ST58214.ZPRAVA (ID_ZPRAVA,TEXT,DATUM,ODESILATEL_ID,PRIJEMCE_ID) values ('12','Ahoj',to_date('23.11.20','DD.MM.RR'),'18','1');
Insert into ST58214.ZPRAVA (ID_ZPRAVA,TEXT,DATUM,ODESILATEL_ID,PRIJEMCE_ID) values ('13','Ahoj',to_date('23.11.20','DD.MM.RR'),'18','19');
Insert into ST58214.ZPRAVA (ID_ZPRAVA,TEXT,DATUM,ODESILATEL_ID,PRIJEMCE_ID) values ('14','Ahoj',to_date('23.11.20','DD.MM.RR'),'1','19');
Insert into ST58214.ZPRAVA (ID_ZPRAVA,TEXT,DATUM,ODESILATEL_ID,PRIJEMCE_ID) values ('22','Hi',to_date('23.11.20','DD.MM.RR'),'20','1');
REM INSERTING into ST58214.HISTORIE_UPRAV
SET DEFINE OFF;
Insert into ST58214.HISTORIE_UPRAV (JMENO,PRIJMENI,ID_UPRAVAMATERIALU,DATUM,UZIVATEL_ID,STUDIJNI_MATERIAL_ID) values ('Administrátor',' ','5',to_date('12.12.20','DD.MM.RR'),'1','24');
Insert into ST58214.HISTORIE_UPRAV (JMENO,PRIJMENI,ID_UPRAVAMATERIALU,DATUM,UZIVATEL_ID,STUDIJNI_MATERIAL_ID) values ('Administrátor',' ','4',to_date('10.06.20','DD.MM.RR'),'1','1');
Insert into ST58214.HISTORIE_UPRAV (JMENO,PRIJMENI,ID_UPRAVAMATERIALU,DATUM,UZIVATEL_ID,STUDIJNI_MATERIAL_ID) values ('Monika','Borkovcová','6',to_date('12.12.20','DD.MM.RR'),'4','3');
REM INSERTING into ST58214.KATEGORIE_STUDIJNIHO_MATERIALU
SET DEFINE OFF;
Insert into ST58214.KATEGORIE_STUDIJNIHO_MATERIALU (STUDIJNI_MATERIAL_ID,ID_KATEGORIEMATERIALU,NAZEV,ZKRATKA,POPIS) values ('1','1','Pøednáška','LECTURE','Jedná se materiály z/k pøednášce.');
Insert into ST58214.KATEGORIE_STUDIJNIHO_MATERIALU (STUDIJNI_MATERIAL_ID,ID_KATEGORIEMATERIALU,NAZEV,ZKRATKA,POPIS) values ('21','1','Pøednáška','LECTURE','Jedná se materiály z/k pøednášce.');
Insert into ST58214.KATEGORIE_STUDIJNIHO_MATERIALU (STUDIJNI_MATERIAL_ID,ID_KATEGORIEMATERIALU,NAZEV,ZKRATKA,POPIS) values ('22','1','Pøednáška','LECTURE','Jedná se materiály z/k pøednášce.');
Insert into ST58214.KATEGORIE_STUDIJNIHO_MATERIALU (STUDIJNI_MATERIAL_ID,ID_KATEGORIEMATERIALU,NAZEV,ZKRATKA,POPIS) values ('2','1','Pøednáška','LECTURE','Jedná se materiály z/k pøednášce.');
Insert into ST58214.KATEGORIE_STUDIJNIHO_MATERIALU (STUDIJNI_MATERIAL_ID,ID_KATEGORIEMATERIALU,NAZEV,ZKRATKA,POPIS) values ('3','1','Pøednáška','LECTURE','Jedná se materiály z/k pøednášce.');
Insert into ST58214.KATEGORIE_STUDIJNIHO_MATERIALU (STUDIJNI_MATERIAL_ID,ID_KATEGORIEMATERIALU,NAZEV,ZKRATKA,POPIS) values ('4','1','Pøednáška','LECTURE','Jedná se materiály z/k pøednášce.');
Insert into ST58214.KATEGORIE_STUDIJNIHO_MATERIALU (STUDIJNI_MATERIAL_ID,ID_KATEGORIEMATERIALU,NAZEV,ZKRATKA,POPIS) values ('5','1','Pøednáška','LECTURE','Jedná se materiály z/k pøednášce.');
Insert into ST58214.KATEGORIE_STUDIJNIHO_MATERIALU (STUDIJNI_MATERIAL_ID,ID_KATEGORIEMATERIALU,NAZEV,ZKRATKA,POPIS) values ('6','1','Pøednáška','LECTURE','Jedná se materiály z/k pøednášce.');
Insert into ST58214.KATEGORIE_STUDIJNIHO_MATERIALU (STUDIJNI_MATERIAL_ID,ID_KATEGORIEMATERIALU,NAZEV,ZKRATKA,POPIS) values ('7','1','Pøednáška','LECTURE','Jedná se materiály z/k pøednášce.');
Insert into ST58214.KATEGORIE_STUDIJNIHO_MATERIALU (STUDIJNI_MATERIAL_ID,ID_KATEGORIEMATERIALU,NAZEV,ZKRATKA,POPIS) values ('8','1','Pøednáška','LECTURE','Jedná se materiály z/k pøednášce.');
Insert into ST58214.KATEGORIE_STUDIJNIHO_MATERIALU (STUDIJNI_MATERIAL_ID,ID_KATEGORIEMATERIALU,NAZEV,ZKRATKA,POPIS) values ('9','1','Pøednáška','LECTURE','Jedná se materiály z/k pøednášce.');
Insert into ST58214.KATEGORIE_STUDIJNIHO_MATERIALU (STUDIJNI_MATERIAL_ID,ID_KATEGORIEMATERIALU,NAZEV,ZKRATKA,POPIS) values ('10','1','Pøednáška','LECTURE','Jedná se materiály z/k pøednášce.');
Insert into ST58214.KATEGORIE_STUDIJNIHO_MATERIALU (STUDIJNI_MATERIAL_ID,ID_KATEGORIEMATERIALU,NAZEV,ZKRATKA,POPIS) values ('11','1','Pøednáška','LECTURE','Jedná se materiály z/k pøednášce.');
Insert into ST58214.KATEGORIE_STUDIJNIHO_MATERIALU (STUDIJNI_MATERIAL_ID,ID_KATEGORIEMATERIALU,NAZEV,ZKRATKA,POPIS) values ('12','1','Pøednáška','LECTURE','Jedná se materiály z/k pøednášce.');
Insert into ST58214.KATEGORIE_STUDIJNIHO_MATERIALU (STUDIJNI_MATERIAL_ID,ID_KATEGORIEMATERIALU,NAZEV,ZKRATKA,POPIS) values ('13','1','Pøednáška','LECTURE','Jedná se materiály z/k pøednášce.');
Insert into ST58214.KATEGORIE_STUDIJNIHO_MATERIALU (STUDIJNI_MATERIAL_ID,ID_KATEGORIEMATERIALU,NAZEV,ZKRATKA,POPIS) values ('14','1','Pøednáška','LECTURE','Jedná se materiály z/k pøednášce.');
Insert into ST58214.KATEGORIE_STUDIJNIHO_MATERIALU (STUDIJNI_MATERIAL_ID,ID_KATEGORIEMATERIALU,NAZEV,ZKRATKA,POPIS) values ('15','1','Pøednáška','LECTURE','Jedná se materiály z/k pøednášce.');
Insert into ST58214.KATEGORIE_STUDIJNIHO_MATERIALU (STUDIJNI_MATERIAL_ID,ID_KATEGORIEMATERIALU,NAZEV,ZKRATKA,POPIS) values ('16','1','Pøednáška','LECTURE','Jedná se materiály z/k pøednášce.');
Insert into ST58214.KATEGORIE_STUDIJNIHO_MATERIALU (STUDIJNI_MATERIAL_ID,ID_KATEGORIEMATERIALU,NAZEV,ZKRATKA,POPIS) values ('17','1','Pøednáška','LECTURE','Jedná se materiály z/k pøednášce.');
Insert into ST58214.KATEGORIE_STUDIJNIHO_MATERIALU (STUDIJNI_MATERIAL_ID,ID_KATEGORIEMATERIALU,NAZEV,ZKRATKA,POPIS) values ('18','1','Pøednáška','LECTURE','Jedná se materiály z/k pøednášce.');
Insert into ST58214.KATEGORIE_STUDIJNIHO_MATERIALU (STUDIJNI_MATERIAL_ID,ID_KATEGORIEMATERIALU,NAZEV,ZKRATKA,POPIS) values ('19','1','Pøednáška','LECTURE','Jedná se materiály z/k pøednášce.');
Insert into ST58214.KATEGORIE_STUDIJNIHO_MATERIALU (STUDIJNI_MATERIAL_ID,ID_KATEGORIEMATERIALU,NAZEV,ZKRATKA,POPIS) values ('20','1','Pøednáška','LECTURE','Jedná se materiály z/k pøednášce.');
Insert into ST58214.KATEGORIE_STUDIJNIHO_MATERIALU (STUDIJNI_MATERIAL_ID,ID_KATEGORIEMATERIALU,NAZEV,ZKRATKA,POPIS) values ('25','1','Pøednáška','LECTURE','Jedná se materiály z/k pøednášce.');
Insert into ST58214.KATEGORIE_STUDIJNIHO_MATERIALU (STUDIJNI_MATERIAL_ID,ID_KATEGORIEMATERIALU,NAZEV,ZKRATKA,POPIS) values ('1','2','Cvièení','EXERCISE','Jedná se o materiály z/k cvièení.');
Insert into ST58214.KATEGORIE_STUDIJNIHO_MATERIALU (STUDIJNI_MATERIAL_ID,ID_KATEGORIEMATERIALU,NAZEV,ZKRATKA,POPIS) values ('24','2','Cvièení','EXERCISE','Jedná se o materiály z/k cvièení.');
Insert into ST58214.KATEGORIE_STUDIJNIHO_MATERIALU (STUDIJNI_MATERIAL_ID,ID_KATEGORIEMATERIALU,NAZEV,ZKRATKA,POPIS) values ('1','7','Obrázek','IMAGE','Jedná se obrázek.');
REM INSERTING into ST58214.KOMENTARE
SET DEFINE OFF;
Insert into ST58214.KOMENTARE (ID_KOMENTAR,TEXT,DATUMPRIDANI,DATUMZMENY,STUDIJNI_MATERIAL_ID,UZIVATEL_ID,JMENO,PRIJMENI) values ('10','Nebojte, nepletete, jedná se o chyták, otázka nemá øešení.',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'12','4','Monika','Borkovcová');
Insert into ST58214.KOMENTARE (ID_KOMENTAR,TEXT,DATUMPRIDANI,DATUMZMENY,STUDIJNI_MATERIAL_ID,UZIVATEL_ID,JMENO,PRIJMENI) values ('6','Toto je diskuzní forum pro materiál, pokud budete mít nìjaké dotazy, zde je napište.',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'12','4','Monika','Borkovcová');
Insert into ST58214.KOMENTARE (ID_KOMENTAR,TEXT,DATUMPRIDANI,DATUMZMENY,STUDIJNI_MATERIAL_ID,UZIVATEL_ID,JMENO,PRIJMENI) values ('1','Toto je diskuzní forum pro materiál, pokud budete mít nìjaké dotazy, zde je napište.',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'1','4','Monika','Borkovcová');
Insert into ST58214.KOMENTARE (ID_KOMENTAR,TEXT,DATUMPRIDANI,DATUMZMENY,STUDIJNI_MATERIAL_ID,UZIVATEL_ID,JMENO,PRIJMENI) values ('8','Jistì, jaký je problém?',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'12','4','Monika','Borkovcová');
Insert into ST58214.KOMENTARE (ID_KOMENTAR,TEXT,DATUMPRIDANI,DATUMZMENY,STUDIJNI_MATERIAL_ID,UZIVATEL_ID,JMENO,PRIJMENI) values ('3','Jistì, jaký je problém?',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'1','4','Monika','Borkovcová');
Insert into ST58214.KOMENTARE (ID_KOMENTAR,TEXT,DATUMPRIDANI,DATUMZMENY,STUDIJNI_MATERIAL_ID,UZIVATEL_ID,JMENO,PRIJMENI) values ('5','Nebojte, nepletete, jedná se o chyták, otázka nemá øešení.',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'1','4','Monika','Borkovcová');
Insert into ST58214.KOMENTARE (ID_KOMENTAR,TEXT,DATUMPRIDANI,DATUMZMENY,STUDIJNI_MATERIAL_ID,UZIVATEL_ID,JMENO,PRIJMENI) values ('16','Toto je diskuzní forum pro materiál, pokud budete mít nìjaké dotazy, zde je napište.',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'22','5','Jan','Fikejz');
Insert into ST58214.KOMENTARE (ID_KOMENTAR,TEXT,DATUMPRIDANI,DATUMZMENY,STUDIJNI_MATERIAL_ID,UZIVATEL_ID,JMENO,PRIJMENI) values ('15','Nebojte, nepletete, jedná se o chyták, otázka nemá øešení.',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'13','5','Jan','Fikejz');
Insert into ST58214.KOMENTARE (ID_KOMENTAR,TEXT,DATUMPRIDANI,DATUMZMENY,STUDIJNI_MATERIAL_ID,UZIVATEL_ID,JMENO,PRIJMENI) values ('13','Jistì, jaký je problém?',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'13','5','Jan','Fikejz');
Insert into ST58214.KOMENTARE (ID_KOMENTAR,TEXT,DATUMPRIDANI,DATUMZMENY,STUDIJNI_MATERIAL_ID,UZIVATEL_ID,JMENO,PRIJMENI) values ('20','Nebojte, nepletete, jedná se o chyták, otázka nemá øešení.',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'22','5','Jan','Fikejz');
Insert into ST58214.KOMENTARE (ID_KOMENTAR,TEXT,DATUMPRIDANI,DATUMZMENY,STUDIJNI_MATERIAL_ID,UZIVATEL_ID,JMENO,PRIJMENI) values ('18','Jistì, jaký je problém?',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'22','5','Jan','Fikejz');
Insert into ST58214.KOMENTARE (ID_KOMENTAR,TEXT,DATUMPRIDANI,DATUMZMENY,STUDIJNI_MATERIAL_ID,UZIVATEL_ID,JMENO,PRIJMENI) values ('11','Toto je diskuzní forum pro materiál, pokud budete mít nìjaké dotazy, zde je napište.',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'13','5','Jan','Fikejz');
Insert into ST58214.KOMENTARE (ID_KOMENTAR,TEXT,DATUMPRIDANI,DATUMZMENY,STUDIJNI_MATERIAL_ID,UZIVATEL_ID,JMENO,PRIJMENI) values ('9','No, vìc se má tak, že nevím kolik je 2+2, zdá se to být neøešitelný problém, pletu se snad?',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'12','18','Petr','Bednáø');
Insert into ST58214.KOMENTARE (ID_KOMENTAR,TEXT,DATUMPRIDANI,DATUMZMENY,STUDIJNI_MATERIAL_ID,UZIVATEL_ID,JMENO,PRIJMENI) values ('7','Dobrý den, rád bych se zeptal na jeden pøíklad ze cvièení. Mohla by jste mi pomoci?',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'12','18','Petr','Bednáø');
Insert into ST58214.KOMENTARE (ID_KOMENTAR,TEXT,DATUMPRIDANI,DATUMZMENY,STUDIJNI_MATERIAL_ID,UZIVATEL_ID,JMENO,PRIJMENI) values ('4','No, vìc se má tak, že nevím kolik je 2+2, zdá se to být neøešitelný problém, pletu se snad?',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'1','18','Petr','Bednáø');
Insert into ST58214.KOMENTARE (ID_KOMENTAR,TEXT,DATUMPRIDANI,DATUMZMENY,STUDIJNI_MATERIAL_ID,UZIVATEL_ID,JMENO,PRIJMENI) values ('2','Dobrý den, rád bych se zeptal na jeden pøíklad ze cvièení. Mohla by jste mi pomoci?',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'1','18','Petr','Bednáø');
Insert into ST58214.KOMENTARE (ID_KOMENTAR,TEXT,DATUMPRIDANI,DATUMZMENY,STUDIJNI_MATERIAL_ID,UZIVATEL_ID,JMENO,PRIJMENI) values ('12','Dobrý den, rád bych se zeptal na jeden pøíklad ze cvièení. Mohla by jste mi pomoci?',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'13','19','Lukáš','Janáèek');
Insert into ST58214.KOMENTARE (ID_KOMENTAR,TEXT,DATUMPRIDANI,DATUMZMENY,STUDIJNI_MATERIAL_ID,UZIVATEL_ID,JMENO,PRIJMENI) values ('14','No, vìc se má tak, že nevím kolik je 2+2, zdá se to být neøešitelný problém, pletu se snad?',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'13','19','Lukáš','Janáèek');
Insert into ST58214.KOMENTARE (ID_KOMENTAR,TEXT,DATUMPRIDANI,DATUMZMENY,STUDIJNI_MATERIAL_ID,UZIVATEL_ID,JMENO,PRIJMENI) values ('17','Dobrý den, rád bych se zeptal na jeden pøíklad ze cvièení. Mohla by jste mi pomoci?',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'22','20','Kryštof','Kysilka');
Insert into ST58214.KOMENTARE (ID_KOMENTAR,TEXT,DATUMPRIDANI,DATUMZMENY,STUDIJNI_MATERIAL_ID,UZIVATEL_ID,JMENO,PRIJMENI) values ('19','No, vìc se má tak, že nevím kolik je 2+2, zdá se to být neøešitelný problém, pletu se snad?',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'22','20','Kryštof','Kysilka');
REM INSERTING into ST58214.KVIZY
SET DEFINE OFF;
Insert into ST58214.KVIZY (ZKRATKA,"nazev_predmet","nazev_studijni_material",JMENO,PRIJMENI,ID_KVIZ,NAZEV,POPIS,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('IPAAG','Angliètina pro akademické úèely I - B2','Cvièení 1','Administrátor',' ','25','Test 1',null,'24','1');
Insert into ST58214.KVIZY (ZKRATKA,"nazev_predmet","nazev_studijni_material",JMENO,PRIJMENI,ID_KVIZ,NAZEV,POPIS,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('IDAS1','Databázové systémy 1','Základy s SQL 2','Monika','Borkovcová','2','Cvièení 2','Jednoduché cvièení z druhé hodiny.','2','4');
Insert into ST58214.KVIZY (ZKRATKA,"nazev_predmet","nazev_studijni_material",JMENO,PRIJMENI,ID_KVIZ,NAZEV,POPIS,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('IDAS1','Databázové systémy 1','Základy s SQL 3','Monika','Borkovcová','3','Cvièení 3','Jednoduché cvièení z tøetí hodiny.','3','4');
Insert into ST58214.KVIZY (ZKRATKA,"nazev_predmet","nazev_studijni_material",JMENO,PRIJMENI,ID_KVIZ,NAZEV,POPIS,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('IDAS1','Databázové systémy 1','Základy s SQL 4','Monika','Borkovcová','4','Cvièení 4','Jednoduché cvièení z ètvrté hodiny.','4','4');
Insert into ST58214.KVIZY (ZKRATKA,"nazev_predmet","nazev_studijni_material",JMENO,PRIJMENI,ID_KVIZ,NAZEV,POPIS,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('IDAS1','Databázové systémy 1','Základy s SQL 5','Monika','Borkovcová','5','Cvièení 5','Jednoduché cvièení z páté hodiny.','5','4');
Insert into ST58214.KVIZY (ZKRATKA,"nazev_predmet","nazev_studijni_material",JMENO,PRIJMENI,ID_KVIZ,NAZEV,POPIS,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('IDAS1','Databázové systémy 1','Základy s SQL 6','Monika','Borkovcová','6','Cvièení 6','Jednoduché cvièení z šesté hodiny.','6','4');
Insert into ST58214.KVIZY (ZKRATKA,"nazev_predmet","nazev_studijni_material",JMENO,PRIJMENI,ID_KVIZ,NAZEV,POPIS,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('IDAS1','Databázové systémy 1','Základy s SQL 7','Monika','Borkovcová','7','Cvièení 7','Jednoduché cvièení z sedmé hodiny.','7','4');
Insert into ST58214.KVIZY (ZKRATKA,"nazev_predmet","nazev_studijni_material",JMENO,PRIJMENI,ID_KVIZ,NAZEV,POPIS,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('IDAS1','Databázové systémy 1','Základy s SQL 8','Monika','Borkovcová','8','Cvièení 8','Jednoduché cvièení z osmé hodiny.','8','4');
Insert into ST58214.KVIZY (ZKRATKA,"nazev_predmet","nazev_studijni_material",JMENO,PRIJMENI,ID_KVIZ,NAZEV,POPIS,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('IDAS1','Databázové systémy 1','Základy s SQL 9','Monika','Borkovcová','9','Cvièení 9','Jednoduché cvièení z deváté hodiny.','9','4');
Insert into ST58214.KVIZY (ZKRATKA,"nazev_predmet","nazev_studijni_material",JMENO,PRIJMENI,ID_KVIZ,NAZEV,POPIS,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('IDAS1','Databázové systémy 1','Základy s SQL 10','Monika','Borkovcová','10','Cvièení 10','Jednoduché cvièení z desáté hodiny.','10','4');
Insert into ST58214.KVIZY (ZKRATKA,"nazev_predmet","nazev_studijni_material",JMENO,PRIJMENI,ID_KVIZ,NAZEV,POPIS,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('IDAS1','Databázové systémy 1','Základy s SQL 11','Monika','Borkovcová','11','Cvièení 11','Jednoduché cvièení z jedenácté hodiny.','11','4');
Insert into ST58214.KVIZY (ZKRATKA,"nazev_predmet","nazev_studijni_material",JMENO,PRIJMENI,ID_KVIZ,NAZEV,POPIS,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('IDAS1','Databázové systémy 1','Základy s SQL 12 Final','Monika','Borkovcová','12','Cvièení 12','Jednoduché cvièení z první hodiny.','12','4');
Insert into ST58214.KVIZY (ZKRATKA,"nazev_predmet","nazev_studijni_material",JMENO,PRIJMENI,ID_KVIZ,NAZEV,POPIS,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('IDAS1','Databázové systémy 1','Základy s SQL 1','Monika','Borkovcová','1','Úvod','Jednoduché cvièení z první hodiny.','1','4');
Insert into ST58214.KVIZY (ZKRATKA,"nazev_predmet","nazev_studijni_material",JMENO,PRIJMENI,ID_KVIZ,NAZEV,POPIS,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('IDATS','Datové struktury','Datové struktury 1','Jan','Fikejz','13','Cvièení 1','Jednoduché cvièení z první hodiny.','13','5');
Insert into ST58214.KVIZY (ZKRATKA,"nazev_predmet","nazev_studijni_material",JMENO,PRIJMENI,ID_KVIZ,NAZEV,POPIS,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('IDATS','Datové struktury','Datové struktury 2','Jan','Fikejz','14','Cvièení 2','Jednoduché cvièení z druhé hodiny.','14','5');
Insert into ST58214.KVIZY (ZKRATKA,"nazev_predmet","nazev_studijni_material",JMENO,PRIJMENI,ID_KVIZ,NAZEV,POPIS,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('IDATS','Datové struktury','Datové struktury 3','Jan','Fikejz','15','Cvièení 3','Jednoduché cvièení z tøetí hodiny.','15','5');
Insert into ST58214.KVIZY (ZKRATKA,"nazev_predmet","nazev_studijni_material",JMENO,PRIJMENI,ID_KVIZ,NAZEV,POPIS,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('IDATS','Datové struktury','Datové struktury 4','Jan','Fikejz','16','Cvièení 4','Jednoduché cvièení z ètvrté hodiny.','16','5');
Insert into ST58214.KVIZY (ZKRATKA,"nazev_predmet","nazev_studijni_material",JMENO,PRIJMENI,ID_KVIZ,NAZEV,POPIS,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('IDATS','Datové struktury','Datové struktury 5','Jan','Fikejz','17','Cvièení 5','Jednoduché cvièení z páté hodiny.','17','5');
Insert into ST58214.KVIZY (ZKRATKA,"nazev_predmet","nazev_studijni_material",JMENO,PRIJMENI,ID_KVIZ,NAZEV,POPIS,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('IDATS','Datové struktury','Datové struktury 6','Jan','Fikejz','18','Cvièení 6','Jednoduché cvièení z šesté hodiny.','18','5');
Insert into ST58214.KVIZY (ZKRATKA,"nazev_predmet","nazev_studijni_material",JMENO,PRIJMENI,ID_KVIZ,NAZEV,POPIS,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('IDATS','Datové struktury','Datové struktury 7','Jan','Fikejz','19','Cvièení 7','Jednoduché cvièení z sedmé hodiny.','19','5');
Insert into ST58214.KVIZY (ZKRATKA,"nazev_predmet","nazev_studijni_material",JMENO,PRIJMENI,ID_KVIZ,NAZEV,POPIS,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('IDATS','Datové struktury','Datové struktury 8','Jan','Fikejz','20','Cvièení 8','Jednoduché cvièení z osmé hodiny.','20','5');
Insert into ST58214.KVIZY (ZKRATKA,"nazev_predmet","nazev_studijni_material",JMENO,PRIJMENI,ID_KVIZ,NAZEV,POPIS,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('IDATS','Datové struktury','Datové struktury 9','Jan','Fikejz','21','Cvièení 9','Jednoduché cvièení z deváté hodiny.','21','5');
Insert into ST58214.KVIZY (ZKRATKA,"nazev_predmet","nazev_studijni_material",JMENO,PRIJMENI,ID_KVIZ,NAZEV,POPIS,STUDIJNI_MATERIAL_ID,UZIVATEL_ID) values ('IDATS','Datové struktury','Datové struktury 10','Jan','Fikejz','22','Cvièení 10','Jednoduché cvièení z desáté hodiny.','22','5');
REM INSERTING into ST58214.NEVHODNA_SLOVA
SET DEFINE OFF;
Insert into ST58214.NEVHODNA_SLOVA (ID_NEVHODNE_SLOVO,TEXT) values ('3','umøi');
REM INSERTING into ST58214.ODEBIRANE_PREDMETY
SET DEFINE OFF;
Insert into ST58214.ODEBIRANE_PREDMETY (ID_PREDMET,NAZEV,ZKRATKA,POPIS,UZIVATEL_ID) values ('1','Databázové systémy 1','IDAS1','Pøedmìt databázové systémy.','1');
Insert into ST58214.ODEBIRANE_PREDMETY (ID_PREDMET,NAZEV,ZKRATKA,POPIS,UZIVATEL_ID) values ('1','Databázové systémy 1','IDAS1','Pøedmìt databázové systémy.','4');
Insert into ST58214.ODEBIRANE_PREDMETY (ID_PREDMET,NAZEV,ZKRATKA,POPIS,UZIVATEL_ID) values ('1','Databázové systémy 1','IDAS1','Pøedmìt databázové systémy.','18');
Insert into ST58214.ODEBIRANE_PREDMETY (ID_PREDMET,NAZEV,ZKRATKA,POPIS,UZIVATEL_ID) values ('2','Angliètina pro akademické úèely I - B2','IPAAG',null,'1');
Insert into ST58214.ODEBIRANE_PREDMETY (ID_PREDMET,NAZEV,ZKRATKA,POPIS,UZIVATEL_ID) values ('4','Mobilní technologie a aplikace','IMTA',null,'18');
Insert into ST58214.ODEBIRANE_PREDMETY (ID_PREDMET,NAZEV,ZKRATKA,POPIS,UZIVATEL_ID) values ('6','Operaèní systémy','IOSYS',null,'1');
Insert into ST58214.ODEBIRANE_PREDMETY (ID_PREDMET,NAZEV,ZKRATKA,POPIS,UZIVATEL_ID) values ('7','Poèítaèové sítì II','IPS2',null,'18');
Insert into ST58214.ODEBIRANE_PREDMETY (ID_PREDMET,NAZEV,ZKRATKA,POPIS,UZIVATEL_ID) values ('8','Øízená prázdninová praxe II','IRPP2',null,'1');
Insert into ST58214.ODEBIRANE_PREDMETY (ID_PREDMET,NAZEV,ZKRATKA,POPIS,UZIVATEL_ID) values ('13','Poèítaèová grafika I','IPOG1',null,'18');
Insert into ST58214.ODEBIRANE_PREDMETY (ID_PREDMET,NAZEV,ZKRATKA,POPIS,UZIVATEL_ID) values ('13','Poèítaèová grafika I','IPOG1',null,'1');
REM INSERTING into ST58214.OTAZKY
SET DEFINE OFF;
Insert into ST58214.OTAZKY (JMENO,PRIJMENI,"nazev_kviz","nazev_studijni_material","nazev_predmet","zkratka_predmet",ID_OTAZKA,NAZEV,OTAZKA,ODPOVED,BODY,PORADI,KVIZ_ID,DRUH_OTAZKY_ID,UZIVATEL_ID,"id_druh_otazky","nazev_druh_otazky","zkratka_druh_otazky","popis_druh_otazky") values ('Monika','Borkovcová','Úvod','Základy s SQL 1','Databázové systémy 1','IDAS1','25','Pøíklad 2','Kolik má kolik znakù?

a, 3
b, 5
c, 7
d, žádné z uvedených','b','5','2','1','1','4','1','Výbìr z možností','SELECT','Odpovìï je nutné vybrat z pøedem napsaných možností.');
Insert into ST58214.OTAZKY (JMENO,PRIJMENI,"nazev_kviz","nazev_studijni_material","nazev_predmet","zkratka_predmet",ID_OTAZKA,NAZEV,OTAZKA,ODPOVED,BODY,PORADI,KVIZ_ID,DRUH_OTAZKY_ID,UZIVATEL_ID,"id_druh_otazky","nazev_druh_otazky","zkratka_druh_otazky","popis_druh_otazky") values ('Monika','Borkovcová','Úvod','Základy s SQL 1','Databázové systémy 1','IDAS1','1','Pøíklad 1','Kolik je 2+2 ?

a, 3
b, 4
c, 5
d, nemá øešení','b','1','1','1','1','4','1','Výbìr z možností','SELECT','Odpovìï je nutné vybrat z pøedem napsaných možností.');
Insert into ST58214.OTAZKY (JMENO,PRIJMENI,"nazev_kviz","nazev_studijni_material","nazev_predmet","zkratka_predmet",ID_OTAZKA,NAZEV,OTAZKA,ODPOVED,BODY,PORADI,KVIZ_ID,DRUH_OTAZKY_ID,UZIVATEL_ID,"id_druh_otazky","nazev_druh_otazky","zkratka_druh_otazky","popis_druh_otazky") values ('Monika','Borkovcová','Cvièení 2','Základy s SQL 2','Databázové systémy 1','IDAS1','2','Pøíklad 1','Kolik je 2+2 ?

a, 3
b, 4
c, 5
d, nemá øešení','b','1','1','2','1','4','1','Výbìr z možností','SELECT','Odpovìï je nutné vybrat z pøedem napsaných možností.');
Insert into ST58214.OTAZKY (JMENO,PRIJMENI,"nazev_kviz","nazev_studijni_material","nazev_predmet","zkratka_predmet",ID_OTAZKA,NAZEV,OTAZKA,ODPOVED,BODY,PORADI,KVIZ_ID,DRUH_OTAZKY_ID,UZIVATEL_ID,"id_druh_otazky","nazev_druh_otazky","zkratka_druh_otazky","popis_druh_otazky") values ('Monika','Borkovcová','Cvièení 3','Základy s SQL 3','Databázové systémy 1','IDAS1','3','Pøíklad 1','Kolik je 2+2 ?

a, 3
b, 4
c, 5
d, nemá øešení','b','1','1','3','1','4','1','Výbìr z možností','SELECT','Odpovìï je nutné vybrat z pøedem napsaných možností.');
Insert into ST58214.OTAZKY (JMENO,PRIJMENI,"nazev_kviz","nazev_studijni_material","nazev_predmet","zkratka_predmet",ID_OTAZKA,NAZEV,OTAZKA,ODPOVED,BODY,PORADI,KVIZ_ID,DRUH_OTAZKY_ID,UZIVATEL_ID,"id_druh_otazky","nazev_druh_otazky","zkratka_druh_otazky","popis_druh_otazky") values ('Monika','Borkovcová','Cvièení 4','Základy s SQL 4','Databázové systémy 1','IDAS1','4','Pøíklad 1','Kolik je 2+2 ?

a, 3
b, 4
c, 5
d, nemá øešení','b','1','1','4','1','4','1','Výbìr z možností','SELECT','Odpovìï je nutné vybrat z pøedem napsaných možností.');
Insert into ST58214.OTAZKY (JMENO,PRIJMENI,"nazev_kviz","nazev_studijni_material","nazev_predmet","zkratka_predmet",ID_OTAZKA,NAZEV,OTAZKA,ODPOVED,BODY,PORADI,KVIZ_ID,DRUH_OTAZKY_ID,UZIVATEL_ID,"id_druh_otazky","nazev_druh_otazky","zkratka_druh_otazky","popis_druh_otazky") values ('Monika','Borkovcová','Cvièení 5','Základy s SQL 5','Databázové systémy 1','IDAS1','5','Pøíklad 1','Kolik je 2+2 ?

a, 3
b, 4
c, 5
d, nemá øešení','b','1','1','5','1','4','1','Výbìr z možností','SELECT','Odpovìï je nutné vybrat z pøedem napsaných možností.');
Insert into ST58214.OTAZKY (JMENO,PRIJMENI,"nazev_kviz","nazev_studijni_material","nazev_predmet","zkratka_predmet",ID_OTAZKA,NAZEV,OTAZKA,ODPOVED,BODY,PORADI,KVIZ_ID,DRUH_OTAZKY_ID,UZIVATEL_ID,"id_druh_otazky","nazev_druh_otazky","zkratka_druh_otazky","popis_druh_otazky") values ('Monika','Borkovcová','Cvièení 6','Základy s SQL 6','Databázové systémy 1','IDAS1','6','Pøíklad 1','Kolik je 2+2 ?

a, 3
b, 4
c, 5
d, nemá øešení','b','1','1','6','1','4','1','Výbìr z možností','SELECT','Odpovìï je nutné vybrat z pøedem napsaných možností.');
Insert into ST58214.OTAZKY (JMENO,PRIJMENI,"nazev_kviz","nazev_studijni_material","nazev_predmet","zkratka_predmet",ID_OTAZKA,NAZEV,OTAZKA,ODPOVED,BODY,PORADI,KVIZ_ID,DRUH_OTAZKY_ID,UZIVATEL_ID,"id_druh_otazky","nazev_druh_otazky","zkratka_druh_otazky","popis_druh_otazky") values ('Monika','Borkovcová','Cvièení 7','Základy s SQL 7','Databázové systémy 1','IDAS1','7','Pøíklad 1','Kolik je 2+2 ?

a, 3
b, 4
c, 5
d, nemá øešení','b','1','1','7','1','4','1','Výbìr z možností','SELECT','Odpovìï je nutné vybrat z pøedem napsaných možností.');
Insert into ST58214.OTAZKY (JMENO,PRIJMENI,"nazev_kviz","nazev_studijni_material","nazev_predmet","zkratka_predmet",ID_OTAZKA,NAZEV,OTAZKA,ODPOVED,BODY,PORADI,KVIZ_ID,DRUH_OTAZKY_ID,UZIVATEL_ID,"id_druh_otazky","nazev_druh_otazky","zkratka_druh_otazky","popis_druh_otazky") values ('Monika','Borkovcová','Cvièení 8','Základy s SQL 8','Databázové systémy 1','IDAS1','8','Pøíklad 1','Kolik je 2+2 ?

a, 3
b, 4
c, 5
d, nemá øešení','b','1','1','8','1','4','1','Výbìr z možností','SELECT','Odpovìï je nutné vybrat z pøedem napsaných možností.');
Insert into ST58214.OTAZKY (JMENO,PRIJMENI,"nazev_kviz","nazev_studijni_material","nazev_predmet","zkratka_predmet",ID_OTAZKA,NAZEV,OTAZKA,ODPOVED,BODY,PORADI,KVIZ_ID,DRUH_OTAZKY_ID,UZIVATEL_ID,"id_druh_otazky","nazev_druh_otazky","zkratka_druh_otazky","popis_druh_otazky") values ('Monika','Borkovcová','Cvièení 9','Základy s SQL 9','Databázové systémy 1','IDAS1','9','Pøíklad 1','Kolik je 2+2 ?

a, 3
b, 4
c, 5
d, nemá øešení','b','1','1','9','1','4','1','Výbìr z možností','SELECT','Odpovìï je nutné vybrat z pøedem napsaných možností.');
Insert into ST58214.OTAZKY (JMENO,PRIJMENI,"nazev_kviz","nazev_studijni_material","nazev_predmet","zkratka_predmet",ID_OTAZKA,NAZEV,OTAZKA,ODPOVED,BODY,PORADI,KVIZ_ID,DRUH_OTAZKY_ID,UZIVATEL_ID,"id_druh_otazky","nazev_druh_otazky","zkratka_druh_otazky","popis_druh_otazky") values ('Monika','Borkovcová','Cvièení 10','Základy s SQL 10','Databázové systémy 1','IDAS1','10','Pøíklad 1','Kolik je 2+2 ?

a, 3
b, 4
c, 5
d, nemá øešení','b','1','1','10','1','4','1','Výbìr z možností','SELECT','Odpovìï je nutné vybrat z pøedem napsaných možností.');
Insert into ST58214.OTAZKY (JMENO,PRIJMENI,"nazev_kviz","nazev_studijni_material","nazev_predmet","zkratka_predmet",ID_OTAZKA,NAZEV,OTAZKA,ODPOVED,BODY,PORADI,KVIZ_ID,DRUH_OTAZKY_ID,UZIVATEL_ID,"id_druh_otazky","nazev_druh_otazky","zkratka_druh_otazky","popis_druh_otazky") values ('Monika','Borkovcová','Cvièení 11','Základy s SQL 11','Databázové systémy 1','IDAS1','11','Pøíklad 1','Kolik je 2+2 ?

a, 3
b, 4
c, 5
d, nemá øešení','b','1','1','11','1','4','1','Výbìr z možností','SELECT','Odpovìï je nutné vybrat z pøedem napsaných možností.');
Insert into ST58214.OTAZKY (JMENO,PRIJMENI,"nazev_kviz","nazev_studijni_material","nazev_predmet","zkratka_predmet",ID_OTAZKA,NAZEV,OTAZKA,ODPOVED,BODY,PORADI,KVIZ_ID,DRUH_OTAZKY_ID,UZIVATEL_ID,"id_druh_otazky","nazev_druh_otazky","zkratka_druh_otazky","popis_druh_otazky") values ('Monika','Borkovcová','Cvièení 12','Základy s SQL 12 Final','Databázové systémy 1','IDAS1','12','Pøíklad 1','Kolik je 2+2 ?

a, 3
b, 4
c, 5
d, nemá øešení','b','1','1','12','1','4','1','Výbìr z možností','SELECT','Odpovìï je nutné vybrat z pøedem napsaných možností.');
Insert into ST58214.OTAZKY (JMENO,PRIJMENI,"nazev_kviz","nazev_studijni_material","nazev_predmet","zkratka_predmet",ID_OTAZKA,NAZEV,OTAZKA,ODPOVED,BODY,PORADI,KVIZ_ID,DRUH_OTAZKY_ID,UZIVATEL_ID,"id_druh_otazky","nazev_druh_otazky","zkratka_druh_otazky","popis_druh_otazky") values ('Jan','Fikejz','Cvièení 1','Datové struktury 1','Datové struktury','IDATS','13','Pøíklad 1','Kolik je 2+2 ?

a, 3
b, 4
c, 5
d, nemá øešení','b','1','1','13','1','5','1','Výbìr z možností','SELECT','Odpovìï je nutné vybrat z pøedem napsaných možností.');
Insert into ST58214.OTAZKY (JMENO,PRIJMENI,"nazev_kviz","nazev_studijni_material","nazev_predmet","zkratka_predmet",ID_OTAZKA,NAZEV,OTAZKA,ODPOVED,BODY,PORADI,KVIZ_ID,DRUH_OTAZKY_ID,UZIVATEL_ID,"id_druh_otazky","nazev_druh_otazky","zkratka_druh_otazky","popis_druh_otazky") values ('Jan','Fikejz','Cvièení 2','Datové struktury 2','Datové struktury','IDATS','14','Pøíklad 1','Kolik je 2+2 ?

a, 3
b, 4
c, 5
d, nemá øešení','b','1','1','14','1','5','1','Výbìr z možností','SELECT','Odpovìï je nutné vybrat z pøedem napsaných možností.');
Insert into ST58214.OTAZKY (JMENO,PRIJMENI,"nazev_kviz","nazev_studijni_material","nazev_predmet","zkratka_predmet",ID_OTAZKA,NAZEV,OTAZKA,ODPOVED,BODY,PORADI,KVIZ_ID,DRUH_OTAZKY_ID,UZIVATEL_ID,"id_druh_otazky","nazev_druh_otazky","zkratka_druh_otazky","popis_druh_otazky") values ('Jan','Fikejz','Cvièení 3','Datové struktury 3','Datové struktury','IDATS','15','Pøíklad 1','Kolik je 2+2 ?

a, 3
b, 4
c, 5
d, nemá øešení','b','1','1','15','1','5','1','Výbìr z možností','SELECT','Odpovìï je nutné vybrat z pøedem napsaných možností.');
Insert into ST58214.OTAZKY (JMENO,PRIJMENI,"nazev_kviz","nazev_studijni_material","nazev_predmet","zkratka_predmet",ID_OTAZKA,NAZEV,OTAZKA,ODPOVED,BODY,PORADI,KVIZ_ID,DRUH_OTAZKY_ID,UZIVATEL_ID,"id_druh_otazky","nazev_druh_otazky","zkratka_druh_otazky","popis_druh_otazky") values ('Jan','Fikejz','Cvièení 4','Datové struktury 4','Datové struktury','IDATS','16','Pøíklad 1','Kolik je 2+2 ?

a, 3
b, 4
c, 5
d, nemá øešení','b','1','1','16','1','5','1','Výbìr z možností','SELECT','Odpovìï je nutné vybrat z pøedem napsaných možností.');
Insert into ST58214.OTAZKY (JMENO,PRIJMENI,"nazev_kviz","nazev_studijni_material","nazev_predmet","zkratka_predmet",ID_OTAZKA,NAZEV,OTAZKA,ODPOVED,BODY,PORADI,KVIZ_ID,DRUH_OTAZKY_ID,UZIVATEL_ID,"id_druh_otazky","nazev_druh_otazky","zkratka_druh_otazky","popis_druh_otazky") values ('Jan','Fikejz','Cvièení 5','Datové struktury 5','Datové struktury','IDATS','17','Pøíklad 1','Kolik je 2+2 ?

a, 3
b, 4
c, 5
d, nemá øešení','b','1','1','17','1','5','1','Výbìr z možností','SELECT','Odpovìï je nutné vybrat z pøedem napsaných možností.');
Insert into ST58214.OTAZKY (JMENO,PRIJMENI,"nazev_kviz","nazev_studijni_material","nazev_predmet","zkratka_predmet",ID_OTAZKA,NAZEV,OTAZKA,ODPOVED,BODY,PORADI,KVIZ_ID,DRUH_OTAZKY_ID,UZIVATEL_ID,"id_druh_otazky","nazev_druh_otazky","zkratka_druh_otazky","popis_druh_otazky") values ('Jan','Fikejz','Cvièení 6','Datové struktury 6','Datové struktury','IDATS','18','Pøíklad 1','Kolik je 2+2 ?

a, 3
b, 4
c, 5
d, nemá øešení','b','1','1','18','1','5','1','Výbìr z možností','SELECT','Odpovìï je nutné vybrat z pøedem napsaných možností.');
Insert into ST58214.OTAZKY (JMENO,PRIJMENI,"nazev_kviz","nazev_studijni_material","nazev_predmet","zkratka_predmet",ID_OTAZKA,NAZEV,OTAZKA,ODPOVED,BODY,PORADI,KVIZ_ID,DRUH_OTAZKY_ID,UZIVATEL_ID,"id_druh_otazky","nazev_druh_otazky","zkratka_druh_otazky","popis_druh_otazky") values ('Jan','Fikejz','Cvièení 7','Datové struktury 7','Datové struktury','IDATS','19','Pøíklad 1','Kolik je 2+2 ?

a, 3
b, 4
c, 5
d, nemá øešení','b','1','1','19','1','5','1','Výbìr z možností','SELECT','Odpovìï je nutné vybrat z pøedem napsaných možností.');
Insert into ST58214.OTAZKY (JMENO,PRIJMENI,"nazev_kviz","nazev_studijni_material","nazev_predmet","zkratka_predmet",ID_OTAZKA,NAZEV,OTAZKA,ODPOVED,BODY,PORADI,KVIZ_ID,DRUH_OTAZKY_ID,UZIVATEL_ID,"id_druh_otazky","nazev_druh_otazky","zkratka_druh_otazky","popis_druh_otazky") values ('Jan','Fikejz','Cvièení 8','Datové struktury 8','Datové struktury','IDATS','20','Pøíklad 1','Kolik je 2+2 ?

a, 3
b, 4
c, 5
d, nemá øešení','b','1','1','20','1','5','1','Výbìr z možností','SELECT','Odpovìï je nutné vybrat z pøedem napsaných možností.');
Insert into ST58214.OTAZKY (JMENO,PRIJMENI,"nazev_kviz","nazev_studijni_material","nazev_predmet","zkratka_predmet",ID_OTAZKA,NAZEV,OTAZKA,ODPOVED,BODY,PORADI,KVIZ_ID,DRUH_OTAZKY_ID,UZIVATEL_ID,"id_druh_otazky","nazev_druh_otazky","zkratka_druh_otazky","popis_druh_otazky") values ('Jan','Fikejz','Cvièení 9','Datové struktury 9','Datové struktury','IDATS','21','Pøíklad 1','Kolik je 2+2 ?

a, 3
b, 4
c, 5
d, nemá øešení','b','1','1','21','1','5','1','Výbìr z možností','SELECT','Odpovìï je nutné vybrat z pøedem napsaných možností.');
Insert into ST58214.OTAZKY (JMENO,PRIJMENI,"nazev_kviz","nazev_studijni_material","nazev_predmet","zkratka_predmet",ID_OTAZKA,NAZEV,OTAZKA,ODPOVED,BODY,PORADI,KVIZ_ID,DRUH_OTAZKY_ID,UZIVATEL_ID,"id_druh_otazky","nazev_druh_otazky","zkratka_druh_otazky","popis_druh_otazky") values ('Jan','Fikejz','Cvièení 10','Datové struktury 10','Datové struktury','IDATS','22','Pøíklad 1','Kolik je 2+2 ?

a, 3
b, 4
c, 5
d, nemá øešení','b','1','1','22','1','5','1','Výbìr z možností','SELECT','Odpovìï je nutné vybrat z pøedem napsaných možností.');
REM INSERTING into ST58214.PREDMETY_SKUPIN
SET DEFINE OFF;
Insert into ST58214.PREDMETY_SKUPIN (ROK_STUDIA,OBOR,SKUPINA_ID,PREDMET_ID,NAZEV,ZKRATKA) values ('2020','SQL Databáze','1','1','Databázové systémy 1','IDAS1');
Insert into ST58214.PREDMETY_SKUPIN (ROK_STUDIA,OBOR,SKUPINA_ID,PREDMET_ID,NAZEV,ZKRATKA) values ('2020','SQL Databáze','1','17','Databázové systémy 2','IDAS2');
REM INSERTING into ST58214.SKUPINY
SET DEFINE OFF;
Insert into ST58214.SKUPINY (ID_SKUPINA,ROK_STUDIA,OBOR) values ('4','2020','Øízení procesù');
Insert into ST58214.SKUPINY (ID_SKUPINA,ROK_STUDIA,OBOR) values ('1','2020','SQL Databáze');
REM INSERTING into ST58214.SOUBORY_UZIVATELU
SET DEFINE OFF;
Insert into ST58214.SOUBORY_UZIVATELU (JMENO,PRIJMENI,ID_SOUBOR,NAZEV,PRIPONA,NAHRANO,UPRAVENO,UZIVATEL_ID) values ('Administrátor',' ','2','PLSQL 15 4','pdf',to_date('26.11.20','DD.MM.RR'),to_date('26.11.20','DD.MM.RR'),'1');
REM INSERTING into ST58214.STUDIJNI_MATERIALY
SET DEFINE OFF;
Insert into ST58214.STUDIJNI_MATERIALY (OPRAVNENI,JMENO,PRIJMENI,"nazev_predmet",ZKRATKA,ID_STUDIJNIMATERIAL,NAZEV,STRAN,DATUMVYTVORENI,DATUMZMENY,POPIS,PRIPONA,PREDMET_ID,UZIVATEL_ID) values ('TEACHER','Monika','Borkovcová','Databázové systémy 1','IDAS1','1','Základy s SQL 1','20',to_date('04.06.20','DD.MM.RR'),to_date('10.06.20','DD.MM.RR'),'Zde se nauèíme základy s SQL v databázovém systému Oracle DB','png     ','1','4');
Insert into ST58214.STUDIJNI_MATERIALY (OPRAVNENI,JMENO,PRIJMENI,"nazev_predmet",ZKRATKA,ID_STUDIJNIMATERIAL,NAZEV,STRAN,DATUMVYTVORENI,DATUMZMENY,POPIS,PRIPONA,PREDMET_ID,UZIVATEL_ID) values ('TEACHER','Monika','Borkovcová','Databázové systémy 1','IDAS1','2','Základy s SQL 2','20',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'Lekce 2',null,'1','4');
Insert into ST58214.STUDIJNI_MATERIALY (OPRAVNENI,JMENO,PRIJMENI,"nazev_predmet",ZKRATKA,ID_STUDIJNIMATERIAL,NAZEV,STRAN,DATUMVYTVORENI,DATUMZMENY,POPIS,PRIPONA,PREDMET_ID,UZIVATEL_ID) values ('TEACHER','Monika','Borkovcová','Databázové systémy 1','IDAS1','3','Základy s SQL 3','20',to_date('04.06.20','DD.MM.RR'),to_date('12.12.20','DD.MM.RR'),'Lekce 3',null,'1','4');
Insert into ST58214.STUDIJNI_MATERIALY (OPRAVNENI,JMENO,PRIJMENI,"nazev_predmet",ZKRATKA,ID_STUDIJNIMATERIAL,NAZEV,STRAN,DATUMVYTVORENI,DATUMZMENY,POPIS,PRIPONA,PREDMET_ID,UZIVATEL_ID) values ('TEACHER','Monika','Borkovcová','Databázové systémy 1','IDAS1','4','Základy s SQL 4','20',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'Lekce 4',null,'1','4');
Insert into ST58214.STUDIJNI_MATERIALY (OPRAVNENI,JMENO,PRIJMENI,"nazev_predmet",ZKRATKA,ID_STUDIJNIMATERIAL,NAZEV,STRAN,DATUMVYTVORENI,DATUMZMENY,POPIS,PRIPONA,PREDMET_ID,UZIVATEL_ID) values ('TEACHER','Monika','Borkovcová','Databázové systémy 1','IDAS1','5','Základy s SQL 5','20',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'Lekce 5',null,'1','4');
Insert into ST58214.STUDIJNI_MATERIALY (OPRAVNENI,JMENO,PRIJMENI,"nazev_predmet",ZKRATKA,ID_STUDIJNIMATERIAL,NAZEV,STRAN,DATUMVYTVORENI,DATUMZMENY,POPIS,PRIPONA,PREDMET_ID,UZIVATEL_ID) values ('TEACHER','Monika','Borkovcová','Databázové systémy 1','IDAS1','6','Základy s SQL 6','20',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'Lekce 6',null,'1','4');
Insert into ST58214.STUDIJNI_MATERIALY (OPRAVNENI,JMENO,PRIJMENI,"nazev_predmet",ZKRATKA,ID_STUDIJNIMATERIAL,NAZEV,STRAN,DATUMVYTVORENI,DATUMZMENY,POPIS,PRIPONA,PREDMET_ID,UZIVATEL_ID) values ('TEACHER','Monika','Borkovcová','Databázové systémy 1','IDAS1','7','Základy s SQL 7','20',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'Lekce 7',null,'1','4');
Insert into ST58214.STUDIJNI_MATERIALY (OPRAVNENI,JMENO,PRIJMENI,"nazev_predmet",ZKRATKA,ID_STUDIJNIMATERIAL,NAZEV,STRAN,DATUMVYTVORENI,DATUMZMENY,POPIS,PRIPONA,PREDMET_ID,UZIVATEL_ID) values ('TEACHER','Monika','Borkovcová','Databázové systémy 1','IDAS1','8','Základy s SQL 8','20',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'Lekce 8',null,'1','4');
Insert into ST58214.STUDIJNI_MATERIALY (OPRAVNENI,JMENO,PRIJMENI,"nazev_predmet",ZKRATKA,ID_STUDIJNIMATERIAL,NAZEV,STRAN,DATUMVYTVORENI,DATUMZMENY,POPIS,PRIPONA,PREDMET_ID,UZIVATEL_ID) values ('TEACHER','Monika','Borkovcová','Databázové systémy 1','IDAS1','9','Základy s SQL 9','20',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'Lekce 9',null,'1','4');
Insert into ST58214.STUDIJNI_MATERIALY (OPRAVNENI,JMENO,PRIJMENI,"nazev_predmet",ZKRATKA,ID_STUDIJNIMATERIAL,NAZEV,STRAN,DATUMVYTVORENI,DATUMZMENY,POPIS,PRIPONA,PREDMET_ID,UZIVATEL_ID) values ('TEACHER','Monika','Borkovcová','Databázové systémy 1','IDAS1','10','Základy s SQL 10','20',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'Lekce 10',null,'1','4');
Insert into ST58214.STUDIJNI_MATERIALY (OPRAVNENI,JMENO,PRIJMENI,"nazev_predmet",ZKRATKA,ID_STUDIJNIMATERIAL,NAZEV,STRAN,DATUMVYTVORENI,DATUMZMENY,POPIS,PRIPONA,PREDMET_ID,UZIVATEL_ID) values ('TEACHER','Monika','Borkovcová','Databázové systémy 1','IDAS1','11','Základy s SQL 11','20',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'Lekce 11',null,'1','4');
Insert into ST58214.STUDIJNI_MATERIALY (OPRAVNENI,JMENO,PRIJMENI,"nazev_predmet",ZKRATKA,ID_STUDIJNIMATERIAL,NAZEV,STRAN,DATUMVYTVORENI,DATUMZMENY,POPIS,PRIPONA,PREDMET_ID,UZIVATEL_ID) values ('TEACHER','Monika','Borkovcová','Databázové systémy 1','IDAS1','12','Základy s SQL 12 Final','20',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'Lekce 12 Final + test',null,'1','4');
Insert into ST58214.STUDIJNI_MATERIALY (OPRAVNENI,JMENO,PRIJMENI,"nazev_predmet",ZKRATKA,ID_STUDIJNIMATERIAL,NAZEV,STRAN,DATUMVYTVORENI,DATUMZMENY,POPIS,PRIPONA,PREDMET_ID,UZIVATEL_ID) values ('ADMINISTRATOR','Administrátor',' ','Angliètina pro akademické úèely I - B2','IPAAG','24','Cvièení 1','10',to_date('12.12.20','DD.MM.RR'),to_date('12.12.20','DD.MM.RR'),null,null,'2','1');
Insert into ST58214.STUDIJNI_MATERIALY (OPRAVNENI,JMENO,PRIJMENI,"nazev_predmet",ZKRATKA,ID_STUDIJNIMATERIAL,NAZEV,STRAN,DATUMVYTVORENI,DATUMZMENY,POPIS,PRIPONA,PREDMET_ID,UZIVATEL_ID) values ('TEACHER','Jan','Fikejz','Datové struktury','IDATS','13','Datové struktury 1','20',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'Pøednáška 1',null,'3','5');
Insert into ST58214.STUDIJNI_MATERIALY (OPRAVNENI,JMENO,PRIJMENI,"nazev_predmet",ZKRATKA,ID_STUDIJNIMATERIAL,NAZEV,STRAN,DATUMVYTVORENI,DATUMZMENY,POPIS,PRIPONA,PREDMET_ID,UZIVATEL_ID) values ('TEACHER','Jan','Fikejz','Datové struktury','IDATS','14','Datové struktury 2','20',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'Pøednáška 2',null,'3','5');
Insert into ST58214.STUDIJNI_MATERIALY (OPRAVNENI,JMENO,PRIJMENI,"nazev_predmet",ZKRATKA,ID_STUDIJNIMATERIAL,NAZEV,STRAN,DATUMVYTVORENI,DATUMZMENY,POPIS,PRIPONA,PREDMET_ID,UZIVATEL_ID) values ('TEACHER','Jan','Fikejz','Datové struktury','IDATS','15','Datové struktury 3','20',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'Pøednáška 3',null,'3','5');
Insert into ST58214.STUDIJNI_MATERIALY (OPRAVNENI,JMENO,PRIJMENI,"nazev_predmet",ZKRATKA,ID_STUDIJNIMATERIAL,NAZEV,STRAN,DATUMVYTVORENI,DATUMZMENY,POPIS,PRIPONA,PREDMET_ID,UZIVATEL_ID) values ('TEACHER','Jan','Fikejz','Datové struktury','IDATS','16','Datové struktury 4','20',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'Pøednáška 4',null,'3','5');
Insert into ST58214.STUDIJNI_MATERIALY (OPRAVNENI,JMENO,PRIJMENI,"nazev_predmet",ZKRATKA,ID_STUDIJNIMATERIAL,NAZEV,STRAN,DATUMVYTVORENI,DATUMZMENY,POPIS,PRIPONA,PREDMET_ID,UZIVATEL_ID) values ('TEACHER','Jan','Fikejz','Datové struktury','IDATS','17','Datové struktury 5','20',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'Pøednáška 5',null,'3','5');
Insert into ST58214.STUDIJNI_MATERIALY (OPRAVNENI,JMENO,PRIJMENI,"nazev_predmet",ZKRATKA,ID_STUDIJNIMATERIAL,NAZEV,STRAN,DATUMVYTVORENI,DATUMZMENY,POPIS,PRIPONA,PREDMET_ID,UZIVATEL_ID) values ('TEACHER','Jan','Fikejz','Datové struktury','IDATS','18','Datové struktury 6','20',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'Pøednáška 6',null,'3','5');
Insert into ST58214.STUDIJNI_MATERIALY (OPRAVNENI,JMENO,PRIJMENI,"nazev_predmet",ZKRATKA,ID_STUDIJNIMATERIAL,NAZEV,STRAN,DATUMVYTVORENI,DATUMZMENY,POPIS,PRIPONA,PREDMET_ID,UZIVATEL_ID) values ('TEACHER','Jan','Fikejz','Datové struktury','IDATS','19','Datové struktury 7','20',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'Pøednáška 7',null,'3','5');
Insert into ST58214.STUDIJNI_MATERIALY (OPRAVNENI,JMENO,PRIJMENI,"nazev_predmet",ZKRATKA,ID_STUDIJNIMATERIAL,NAZEV,STRAN,DATUMVYTVORENI,DATUMZMENY,POPIS,PRIPONA,PREDMET_ID,UZIVATEL_ID) values ('TEACHER','Jan','Fikejz','Datové struktury','IDATS','20','Datové struktury 8','20',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'Pøednáška 8',null,'3','5');
Insert into ST58214.STUDIJNI_MATERIALY (OPRAVNENI,JMENO,PRIJMENI,"nazev_predmet",ZKRATKA,ID_STUDIJNIMATERIAL,NAZEV,STRAN,DATUMVYTVORENI,DATUMZMENY,POPIS,PRIPONA,PREDMET_ID,UZIVATEL_ID) values ('TEACHER','Jan','Fikejz','Datové struktury','IDATS','21','Datové struktury 9','20',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'Pøednáška 9',null,'3','5');
Insert into ST58214.STUDIJNI_MATERIALY (OPRAVNENI,JMENO,PRIJMENI,"nazev_predmet",ZKRATKA,ID_STUDIJNIMATERIAL,NAZEV,STRAN,DATUMVYTVORENI,DATUMZMENY,POPIS,PRIPONA,PREDMET_ID,UZIVATEL_ID) values ('TEACHER','Jan','Fikejz','Datové struktury','IDATS','22','Datové struktury 10','20',to_date('04.06.20','DD.MM.RR'),to_date('04.06.20','DD.MM.RR'),'Pøednáška 10',null,'3','5');
Insert into ST58214.STUDIJNI_MATERIALY (OPRAVNENI,JMENO,PRIJMENI,"nazev_predmet",ZKRATKA,ID_STUDIJNIMATERIAL,NAZEV,STRAN,DATUMVYTVORENI,DATUMZMENY,POPIS,PRIPONA,PREDMET_ID,UZIVATEL_ID) values ('ADMINISTRATOR','Administrátor',' ','Mobilní technologie a aplikace','IMTA','25','Pøednáška 1','24',to_date('12.12.20','DD.MM.RR'),to_date('12.12.20','DD.MM.RR'),null,null,'4','1');
REM INSERTING into ST58214.UZIVATELE
SET DEFINE OFF;
Insert into ST58214.UZIVATELE (ID_UZIVATEL,LOGIN,HESLO,JMENO,PRIJMENI,EMAIL,TELEFON,ADRESA,ROLE_ID,NAZEV,OPRAVNENI,POPIS) values ('1','admin  ','$2a$12$9eB4FHfTDqhXxD5R4Tf0ee.HLwk/HSgYc4zIvMLsop46meGdODOri','Administrátor',' ','admin@upce.cz',null,null,'1','Administrátor','ADMINISTRATOR','Administrátorský úèet');
Insert into ST58214.UZIVATELE (ID_UZIVATEL,LOGIN,HESLO,JMENO,PRIJMENI,EMAIL,TELEFON,ADRESA,ROLE_ID,NAZEV,OPRAVNENI,POPIS) values ('17','T014   ','$2a$12$oBcVeoM.wMxt4g7HeKGjSe4lzTfvuGCNxeU1W5Dvzuz646ASismbu','Milan','Javùrek','milan.javurek@upce.cz',null,null,'2','Uèitel','TEACHER','Uèitelský úèet');
Insert into ST58214.UZIVATELE (ID_UZIVATEL,LOGIN,HESLO,JMENO,PRIJMENI,EMAIL,TELEFON,ADRESA,ROLE_ID,NAZEV,OPRAVNENI,POPIS) values ('16','T013   ','$2a$12$oBcVeoM.wMxt4g7HeKGjSe4lzTfvuGCNxeU1W5Dvzuz646ASismbu','Karel','Šimerda','karel.simerda@upce.cz',null,null,'2','Uèitel','TEACHER','Uèitelský úèet');
Insert into ST58214.UZIVATELE (ID_UZIVATEL,LOGIN,HESLO,JMENO,PRIJMENI,EMAIL,TELEFON,ADRESA,ROLE_ID,NAZEV,OPRAVNENI,POPIS) values ('5','T002   ','$2a$12$Gs3FsFzxfAn/UZf0uw/TPujyct9GJFTmemJI6mkqRvA8doroeSDqy','Jan','Fikejz','jan.fikejz@upce.cz',null,null,'2','Uèitel','TEACHER','Uèitelský úèet');
Insert into ST58214.UZIVATELE (ID_UZIVATEL,LOGIN,HESLO,JMENO,PRIJMENI,EMAIL,TELEFON,ADRESA,ROLE_ID,NAZEV,OPRAVNENI,POPIS) values ('6','T003   ','$2a$12$Gs3FsFzxfAn/UZf0uw/TPujyct9GJFTmemJI6mkqRvA8doroeSDqy','Markéta','Denksteinová','marketa.denksteinova@upce.cz',null,null,'2','Uèitel','TEACHER','Uèitelský úèet');
Insert into ST58214.UZIVATELE (ID_UZIVATEL,LOGIN,HESLO,JMENO,PRIJMENI,EMAIL,TELEFON,ADRESA,ROLE_ID,NAZEV,OPRAVNENI,POPIS) values ('7','T004   ','$2a$12$Gs3FsFzxfAn/UZf0uw/TPujyct9GJFTmemJI6mkqRvA8doroeSDqy','Antonín','Kavièka','antonin.kavicka@upce.cz',null,null,'2','Uèitel','TEACHER','Uèitelský úèet');
Insert into ST58214.UZIVATELE (ID_UZIVATEL,LOGIN,HESLO,JMENO,PRIJMENI,EMAIL,TELEFON,ADRESA,ROLE_ID,NAZEV,OPRAVNENI,POPIS) values ('15','T012   ','$2a$12$oBcVeoM.wMxt4g7HeKGjSe4lzTfvuGCNxeU1W5Dvzuz646ASismbu','Petr','Veselý','petr.vesely@upce.cz',null,null,'2','Uèitel','TEACHER','Uèitelský úèet');
Insert into ST58214.UZIVATELE (ID_UZIVATEL,LOGIN,HESLO,JMENO,PRIJMENI,EMAIL,TELEFON,ADRESA,ROLE_ID,NAZEV,OPRAVNENI,POPIS) values ('9','T006   ','$2a$12$oBcVeoM.wMxt4g7HeKGjSe4lzTfvuGCNxeU1W5Dvzuz646ASismbu','Jan','Merta','	jan.merta@student.upce.cz',null,null,'2','Uèitel','TEACHER','Uèitelský úèet');
Insert into ST58214.UZIVATELE (ID_UZIVATEL,LOGIN,HESLO,JMENO,PRIJMENI,EMAIL,TELEFON,ADRESA,ROLE_ID,NAZEV,OPRAVNENI,POPIS) values ('10','T007   ','$2a$12$oBcVeoM.wMxt4g7HeKGjSe4lzTfvuGCNxeU1W5Dvzuz646ASismbu','Tomáš','Hudec','tomas.hudec@upce.cz',null,null,'2','Uèitel','TEACHER','Uèitelský úèet');
Insert into ST58214.UZIVATELE (ID_UZIVATEL,LOGIN,HESLO,JMENO,PRIJMENI,EMAIL,TELEFON,ADRESA,ROLE_ID,NAZEV,OPRAVNENI,POPIS) values ('11','T008   ','$2a$12$oBcVeoM.wMxt4g7HeKGjSe4lzTfvuGCNxeU1W5Dvzuz646ASismbu','Soòa','Neradová','sona.neradova@upce.cz',null,null,'2','Uèitel','TEACHER','Uèitelský úèet');
Insert into ST58214.UZIVATELE (ID_UZIVATEL,LOGIN,HESLO,JMENO,PRIJMENI,EMAIL,TELEFON,ADRESA,ROLE_ID,NAZEV,OPRAVNENI,POPIS) values ('12','T009   ','$2a$12$oBcVeoM.wMxt4g7HeKGjSe4lzTfvuGCNxeU1W5Dvzuz646ASismbu','Miroslav','Dvoøák','miroslav.dvorak@upce.cz',null,null,'2','Uèitel','TEACHER','Uèitelský úèet');
Insert into ST58214.UZIVATELE (ID_UZIVATEL,LOGIN,HESLO,JMENO,PRIJMENI,EMAIL,TELEFON,ADRESA,ROLE_ID,NAZEV,OPRAVNENI,POPIS) values ('13','T010   ','$2a$12$oBcVeoM.wMxt4g7HeKGjSe4lzTfvuGCNxeU1W5Dvzuz646ASismbu','Jaroslav','Marek','jaroslav.marek@upce.cz',null,null,'2','Uèitel','TEACHER','Uèitelský úèet');
Insert into ST58214.UZIVATELE (ID_UZIVATEL,LOGIN,HESLO,JMENO,PRIJMENI,EMAIL,TELEFON,ADRESA,ROLE_ID,NAZEV,OPRAVNENI,POPIS) values ('14','T011   ','$2a$12$oBcVeoM.wMxt4g7HeKGjSe4lzTfvuGCNxeU1W5Dvzuz646ASismbu','Dana','Pøívratská','dana.privratska@upce.cz',null,null,'2','Uèitel','TEACHER','Uèitelský úèet');
Insert into ST58214.UZIVATELE (ID_UZIVATEL,LOGIN,HESLO,JMENO,PRIJMENI,EMAIL,TELEFON,ADRESA,ROLE_ID,NAZEV,OPRAVNENI,POPIS) values ('4','T001   ','$2a$12$1LmwdwDU4do3Ypc3qoFF1uMFw2olPYVCqWfheY2XkaCY9akR9O59y','Monika','Borkovcová','monika.borkovcova@upce.cz',null,null,'2','Uèitel','TEACHER','Uèitelský úèet');
Insert into ST58214.UZIVATELE (ID_UZIVATEL,LOGIN,HESLO,JMENO,PRIJMENI,EMAIL,TELEFON,ADRESA,ROLE_ID,NAZEV,OPRAVNENI,POPIS) values ('8','T005   ','$2a$12$oBcVeoM.wMxt4g7HeKGjSe4lzTfvuGCNxeU1W5Dvzuz646ASismbu','Jan','Panuš','jan.panus@upce.cz',null,null,'2','Uèitel','TEACHER','Uèitelský úèet');
Insert into ST58214.UZIVATELE (ID_UZIVATEL,LOGIN,HESLO,JMENO,PRIJMENI,EMAIL,TELEFON,ADRESA,ROLE_ID,NAZEV,OPRAVNENI,POPIS) values ('19','ST001  ','$2a$12$Gs3FsFzxfAn/UZf0uw/TPujyct9GJFTmemJI6mkqRvA8doroeSDqy','Lukáš','Janáèek','st001@student.upce.cz',null,null,'3','Student','STUDENT','Studentský úèet');
Insert into ST58214.UZIVATELE (ID_UZIVATEL,LOGIN,HESLO,JMENO,PRIJMENI,EMAIL,TELEFON,ADRESA,ROLE_ID,NAZEV,OPRAVNENI,POPIS) values ('18','ST58214','$2a$12$IaLy7R4H.Kj1zY08yBns4Oc7YBK8oo8x.xVD3xvTZJVfOmdaeK1Aq','Petr','Bednáø','st58214@student.upce.cz','123456789',null,'3','Student','STUDENT','Studentský úèet');
Insert into ST58214.UZIVATELE (ID_UZIVATEL,LOGIN,HESLO,JMENO,PRIJMENI,EMAIL,TELEFON,ADRESA,ROLE_ID,NAZEV,OPRAVNENI,POPIS) values ('3','student','$2a$12$IkksthIwfjQO2mLt9vUlV.Clska8zq3HiMYWQPuFkrwZj.BcZxk66','Student',' ','student@upce.cz',null,null,'3','Student','STUDENT','Studentský úèet');
Insert into ST58214.UZIVATELE (ID_UZIVATEL,LOGIN,HESLO,JMENO,PRIJMENI,EMAIL,TELEFON,ADRESA,ROLE_ID,NAZEV,OPRAVNENI,POPIS) values ('20','ST002  ','$2a$12$oBcVeoM.wMxt4g7HeKGjSe4lzTfvuGCNxeU1W5Dvzuz646ASismbu','Kryštof','Kysilka','st002@student.upce.cz',null,null,'3','Student','STUDENT','Studentský úèet');
Insert into ST58214.UZIVATELE (ID_UZIVATEL,LOGIN,HESLO,JMENO,PRIJMENI,EMAIL,TELEFON,ADRESA,ROLE_ID,NAZEV,OPRAVNENI,POPIS) values ('2','system ','$2a$12$hiOOf6guKbvJ7MKGTWBIW.0MdFxGiB3O4pXoJoUMh9dc82./EKkfS','Systém',' ','system@upce.cz',null,null,'3','Student','STUDENT','Studentský úèet');
REM INSERTING into ST58214.UZIVATELE_SKUPIN
SET DEFINE OFF;
Insert into ST58214.UZIVATELE_SKUPIN (UZIVATEL_ID,SKUPINA_ID,ROK_STUDIA,OBOR,JMENO,PRIJMENI) values ('3','4','2020','Øízení procesù','Student',' ');
Insert into ST58214.UZIVATELE_SKUPIN (UZIVATEL_ID,SKUPINA_ID,ROK_STUDIA,OBOR,JMENO,PRIJMENI) values ('4','1','2020','SQL Databáze','Monika','Borkovcová');
Insert into ST58214.UZIVATELE_SKUPIN (UZIVATEL_ID,SKUPINA_ID,ROK_STUDIA,OBOR,JMENO,PRIJMENI) values ('18','1','2020','SQL Databáze','Petr','Bednáø');
Insert into ST58214.UZIVATELE_SKUPIN (UZIVATEL_ID,SKUPINA_ID,ROK_STUDIA,OBOR,JMENO,PRIJMENI) values ('19','1','2020','SQL Databáze','Lukáš','Janáèek');
Insert into ST58214.UZIVATELE_SKUPIN (UZIVATEL_ID,SKUPINA_ID,ROK_STUDIA,OBOR,JMENO,PRIJMENI) values ('20','1','2020','SQL Databáze','Kryštof','Kysilka');
REM INSERTING into ST58214.UZIVATEL_LOGIN
SET DEFINE OFF;
Insert into ST58214.UZIVATEL_LOGIN (ID_UZIVATEL,LOGIN,JMENO,PRIJMENI,EMAIL,TELEFON,ADRESA,OPRAVNENI) values ('1','admin  ','Administrátor',' ','admin@upce.cz',null,null,'ADMINISTRATOR');
Insert into ST58214.UZIVATEL_LOGIN (ID_UZIVATEL,LOGIN,JMENO,PRIJMENI,EMAIL,TELEFON,ADRESA,OPRAVNENI) values ('17','T014   ','Milan','Javùrek','milan.javurek@upce.cz',null,null,'TEACHER');
Insert into ST58214.UZIVATEL_LOGIN (ID_UZIVATEL,LOGIN,JMENO,PRIJMENI,EMAIL,TELEFON,ADRESA,OPRAVNENI) values ('16','T013   ','Karel','Šimerda','karel.simerda@upce.cz',null,null,'TEACHER');
Insert into ST58214.UZIVATEL_LOGIN (ID_UZIVATEL,LOGIN,JMENO,PRIJMENI,EMAIL,TELEFON,ADRESA,OPRAVNENI) values ('5','T002   ','Jan','Fikejz','jan.fikejz@upce.cz',null,null,'TEACHER');
Insert into ST58214.UZIVATEL_LOGIN (ID_UZIVATEL,LOGIN,JMENO,PRIJMENI,EMAIL,TELEFON,ADRESA,OPRAVNENI) values ('6','T003   ','Markéta','Denksteinová','marketa.denksteinova@upce.cz',null,null,'TEACHER');
Insert into ST58214.UZIVATEL_LOGIN (ID_UZIVATEL,LOGIN,JMENO,PRIJMENI,EMAIL,TELEFON,ADRESA,OPRAVNENI) values ('7','T004   ','Antonín','Kavièka','antonin.kavicka@upce.cz',null,null,'TEACHER');
Insert into ST58214.UZIVATEL_LOGIN (ID_UZIVATEL,LOGIN,JMENO,PRIJMENI,EMAIL,TELEFON,ADRESA,OPRAVNENI) values ('15','T012   ','Petr','Veselý','petr.vesely@upce.cz',null,null,'TEACHER');
Insert into ST58214.UZIVATEL_LOGIN (ID_UZIVATEL,LOGIN,JMENO,PRIJMENI,EMAIL,TELEFON,ADRESA,OPRAVNENI) values ('9','T006   ','Jan','Merta','	jan.merta@student.upce.cz',null,null,'TEACHER');
Insert into ST58214.UZIVATEL_LOGIN (ID_UZIVATEL,LOGIN,JMENO,PRIJMENI,EMAIL,TELEFON,ADRESA,OPRAVNENI) values ('10','T007   ','Tomáš','Hudec','tomas.hudec@upce.cz',null,null,'TEACHER');
Insert into ST58214.UZIVATEL_LOGIN (ID_UZIVATEL,LOGIN,JMENO,PRIJMENI,EMAIL,TELEFON,ADRESA,OPRAVNENI) values ('11','T008   ','Soòa','Neradová','sona.neradova@upce.cz',null,null,'TEACHER');
Insert into ST58214.UZIVATEL_LOGIN (ID_UZIVATEL,LOGIN,JMENO,PRIJMENI,EMAIL,TELEFON,ADRESA,OPRAVNENI) values ('12','T009   ','Miroslav','Dvoøák','miroslav.dvorak@upce.cz',null,null,'TEACHER');
Insert into ST58214.UZIVATEL_LOGIN (ID_UZIVATEL,LOGIN,JMENO,PRIJMENI,EMAIL,TELEFON,ADRESA,OPRAVNENI) values ('13','T010   ','Jaroslav','Marek','jaroslav.marek@upce.cz',null,null,'TEACHER');
Insert into ST58214.UZIVATEL_LOGIN (ID_UZIVATEL,LOGIN,JMENO,PRIJMENI,EMAIL,TELEFON,ADRESA,OPRAVNENI) values ('14','T011   ','Dana','Pøívratská','dana.privratska@upce.cz',null,null,'TEACHER');
Insert into ST58214.UZIVATEL_LOGIN (ID_UZIVATEL,LOGIN,JMENO,PRIJMENI,EMAIL,TELEFON,ADRESA,OPRAVNENI) values ('4','T001   ','Monika','Borkovcová','monika.borkovcova@upce.cz',null,null,'TEACHER');
Insert into ST58214.UZIVATEL_LOGIN (ID_UZIVATEL,LOGIN,JMENO,PRIJMENI,EMAIL,TELEFON,ADRESA,OPRAVNENI) values ('8','T005   ','Jan','Panuš','jan.panus@upce.cz',null,null,'TEACHER');
Insert into ST58214.UZIVATEL_LOGIN (ID_UZIVATEL,LOGIN,JMENO,PRIJMENI,EMAIL,TELEFON,ADRESA,OPRAVNENI) values ('19','ST001  ','Lukáš','Janáèek','st001@student.upce.cz',null,null,'STUDENT');
Insert into ST58214.UZIVATEL_LOGIN (ID_UZIVATEL,LOGIN,JMENO,PRIJMENI,EMAIL,TELEFON,ADRESA,OPRAVNENI) values ('18','ST58214','Petr','Bednáø','st58214@student.upce.cz','123456789',null,'STUDENT');
Insert into ST58214.UZIVATEL_LOGIN (ID_UZIVATEL,LOGIN,JMENO,PRIJMENI,EMAIL,TELEFON,ADRESA,OPRAVNENI) values ('3','student','Student',' ','student@upce.cz',null,null,'STUDENT');
Insert into ST58214.UZIVATEL_LOGIN (ID_UZIVATEL,LOGIN,JMENO,PRIJMENI,EMAIL,TELEFON,ADRESA,OPRAVNENI) values ('20','ST002  ','Kryštof','Kysilka','st002@student.upce.cz',null,null,'STUDENT');
Insert into ST58214.UZIVATEL_LOGIN (ID_UZIVATEL,LOGIN,JMENO,PRIJMENI,EMAIL,TELEFON,ADRESA,OPRAVNENI) values ('2','system ','Systém',' ','system@upce.cz',null,null,'STUDENT');
REM INSERTING into ST58214.VYPLNENE_KVIZY
SET DEFINE OFF;
Insert into ST58214.VYPLNENE_KVIZY (NAZEV,STUDIJNI_MATERIAL_ID,JMENO,PRIJMENI,ID_VYPLNENY_KVIZ,BODY,MAX_BODY,UZIVATEL_ID,KVIZ_ID,PREDMET_ID) values ('Úvod','1','Petr','Bednáø','1','6','6','18','1','1');
Insert into ST58214.VYPLNENE_KVIZY (NAZEV,STUDIJNI_MATERIAL_ID,JMENO,PRIJMENI,ID_VYPLNENY_KVIZ,BODY,MAX_BODY,UZIVATEL_ID,KVIZ_ID,PREDMET_ID) values ('Úvod','1','Lukáš','Janáèek','2','1','6','19','1','1');
Insert into ST58214.VYPLNENE_KVIZY (NAZEV,STUDIJNI_MATERIAL_ID,JMENO,PRIJMENI,ID_VYPLNENY_KVIZ,BODY,MAX_BODY,UZIVATEL_ID,KVIZ_ID,PREDMET_ID) values ('Úvod','1','Kryštof','Kysilka','3','0','6','20','1','1');
Insert into ST58214.VYPLNENE_KVIZY (NAZEV,STUDIJNI_MATERIAL_ID,JMENO,PRIJMENI,ID_VYPLNENY_KVIZ,BODY,MAX_BODY,UZIVATEL_ID,KVIZ_ID,PREDMET_ID) values ('Cvièení 2','2','Petr','Bednáø','4','1','1','18','2','1');
Insert into ST58214.VYPLNENE_KVIZY (NAZEV,STUDIJNI_MATERIAL_ID,JMENO,PRIJMENI,ID_VYPLNENY_KVIZ,BODY,MAX_BODY,UZIVATEL_ID,KVIZ_ID,PREDMET_ID) values ('Cvièení 3','3','Petr','Bednáø','9','0','1','18','3','1');
Insert into ST58214.VYPLNENE_KVIZY (NAZEV,STUDIJNI_MATERIAL_ID,JMENO,PRIJMENI,ID_VYPLNENY_KVIZ,BODY,MAX_BODY,UZIVATEL_ID,KVIZ_ID,PREDMET_ID) values ('Cvièení 4','4','Petr','Bednáø','11','1','1','18','4','1');
Insert into ST58214.VYPLNENE_KVIZY (NAZEV,STUDIJNI_MATERIAL_ID,JMENO,PRIJMENI,ID_VYPLNENY_KVIZ,BODY,MAX_BODY,UZIVATEL_ID,KVIZ_ID,PREDMET_ID) values ('Cvièení 5','5','Petr','Bednáø','12','0','1','18','5','1');
Insert into ST58214.VYPLNENE_KVIZY (NAZEV,STUDIJNI_MATERIAL_ID,JMENO,PRIJMENI,ID_VYPLNENY_KVIZ,BODY,MAX_BODY,UZIVATEL_ID,KVIZ_ID,PREDMET_ID) values ('Cvièení 6','6','Petr','Bednáø','13','1','1','18','6','1');
Insert into ST58214.VYPLNENE_KVIZY (NAZEV,STUDIJNI_MATERIAL_ID,JMENO,PRIJMENI,ID_VYPLNENY_KVIZ,BODY,MAX_BODY,UZIVATEL_ID,KVIZ_ID,PREDMET_ID) values ('Cvièení 7','7','Petr','Bednáø','14','1','1','18','7','1');
Insert into ST58214.VYPLNENE_KVIZY (NAZEV,STUDIJNI_MATERIAL_ID,JMENO,PRIJMENI,ID_VYPLNENY_KVIZ,BODY,MAX_BODY,UZIVATEL_ID,KVIZ_ID,PREDMET_ID) values ('Cvièení 8','8','Petr','Bednáø','15','0','1','18','8','1');
Insert into ST58214.VYPLNENE_KVIZY (NAZEV,STUDIJNI_MATERIAL_ID,JMENO,PRIJMENI,ID_VYPLNENY_KVIZ,BODY,MAX_BODY,UZIVATEL_ID,KVIZ_ID,PREDMET_ID) values ('Cvièení 9','9','Petr','Bednáø','16','0','1','18','9','1');
Insert into ST58214.VYPLNENE_KVIZY (NAZEV,STUDIJNI_MATERIAL_ID,JMENO,PRIJMENI,ID_VYPLNENY_KVIZ,BODY,MAX_BODY,UZIVATEL_ID,KVIZ_ID,PREDMET_ID) values ('Cvièení 10','10','Petr','Bednáø','17','1','1','18','10','1');
Insert into ST58214.VYPLNENE_KVIZY (NAZEV,STUDIJNI_MATERIAL_ID,JMENO,PRIJMENI,ID_VYPLNENY_KVIZ,BODY,MAX_BODY,UZIVATEL_ID,KVIZ_ID,PREDMET_ID) values ('Cvièení 11','11','Petr','Bednáø','18','1','1','18','11','1');
Insert into ST58214.VYPLNENE_KVIZY (NAZEV,STUDIJNI_MATERIAL_ID,JMENO,PRIJMENI,ID_VYPLNENY_KVIZ,BODY,MAX_BODY,UZIVATEL_ID,KVIZ_ID,PREDMET_ID) values ('Cvièení 12','12','Petr','Bednáø','19','1','1','18','12','1');
REM INSERTING into ST58214.VYPLNENE_OTAZKY
SET DEFINE OFF;
Insert into ST58214.VYPLNENE_OTAZKY (ID_VYPLNENA_OTAZKA,ODPOVED,OTAZKA_ID,VYPLNENY_KVIZ_ID,NAZEV,OTAZKA,BODY,"odpoved_puvodni",PORADI,"druh_otazky_nazev","druh_otazky_zkratka","druh_otazky_popis") values ('1','b','1','1','Pøíklad 1','Kolik je 2+2 ?

a, 3
b, 4
c, 5
d, nemá øešení','1','b','1','Výbìr z možností','SELECT','Odpovìï je nutné vybrat z pøedem napsaných možností.');
Insert into ST58214.VYPLNENE_OTAZKY (ID_VYPLNENA_OTAZKA,ODPOVED,OTAZKA_ID,VYPLNENY_KVIZ_ID,NAZEV,OTAZKA,BODY,"odpoved_puvodni",PORADI,"druh_otazky_nazev","druh_otazky_zkratka","druh_otazky_popis") values ('2','b','25','1','Pøíklad 2','Kolik má kolik znakù?

a, 3
b, 5
c, 7
d, žádné z uvedených','5','b','2','Výbìr z možností','SELECT','Odpovìï je nutné vybrat z pøedem napsaných možností.');
Insert into ST58214.VYPLNENE_OTAZKY (ID_VYPLNENA_OTAZKA,ODPOVED,OTAZKA_ID,VYPLNENY_KVIZ_ID,NAZEV,OTAZKA,BODY,"odpoved_puvodni",PORADI,"druh_otazky_nazev","druh_otazky_zkratka","druh_otazky_popis") values ('3','b','1','2','Pøíklad 1','Kolik je 2+2 ?

a, 3
b, 4
c, 5
d, nemá øešení','1','b','1','Výbìr z možností','SELECT','Odpovìï je nutné vybrat z pøedem napsaných možností.');
Insert into ST58214.VYPLNENE_OTAZKY (ID_VYPLNENA_OTAZKA,ODPOVED,OTAZKA_ID,VYPLNENY_KVIZ_ID,NAZEV,OTAZKA,BODY,"odpoved_puvodni",PORADI,"druh_otazky_nazev","druh_otazky_zkratka","druh_otazky_popis") values ('4','c','25','2','Pøíklad 2','Kolik má kolik znakù?

a, 3
b, 5
c, 7
d, žádné z uvedených','5','b','2','Výbìr z možností','SELECT','Odpovìï je nutné vybrat z pøedem napsaných možností.');
Insert into ST58214.VYPLNENE_OTAZKY (ID_VYPLNENA_OTAZKA,ODPOVED,OTAZKA_ID,VYPLNENY_KVIZ_ID,NAZEV,OTAZKA,BODY,"odpoved_puvodni",PORADI,"druh_otazky_nazev","druh_otazky_zkratka","druh_otazky_popis") values ('5','c','1','3','Pøíklad 1','Kolik je 2+2 ?

a, 3
b, 4
c, 5
d, nemá øešení','1','b','1','Výbìr z možností','SELECT','Odpovìï je nutné vybrat z pøedem napsaných možností.');
Insert into ST58214.VYPLNENE_OTAZKY (ID_VYPLNENA_OTAZKA,ODPOVED,OTAZKA_ID,VYPLNENY_KVIZ_ID,NAZEV,OTAZKA,BODY,"odpoved_puvodni",PORADI,"druh_otazky_nazev","druh_otazky_zkratka","druh_otazky_popis") values ('6','c','25','3','Pøíklad 2','Kolik má kolik znakù?

a, 3
b, 5
c, 7
d, žádné z uvedených','5','b','2','Výbìr z možností','SELECT','Odpovìï je nutné vybrat z pøedem napsaných možností.');
Insert into ST58214.VYPLNENE_OTAZKY (ID_VYPLNENA_OTAZKA,ODPOVED,OTAZKA_ID,VYPLNENY_KVIZ_ID,NAZEV,OTAZKA,BODY,"odpoved_puvodni",PORADI,"druh_otazky_nazev","druh_otazky_zkratka","druh_otazky_popis") values ('7','b','2','4','Pøíklad 1','Kolik je 2+2 ?

a, 3
b, 4
c, 5
d, nemá øešení','1','b','1','Výbìr z možností','SELECT','Odpovìï je nutné vybrat z pøedem napsaných možností.');
Insert into ST58214.VYPLNENE_OTAZKY (ID_VYPLNENA_OTAZKA,ODPOVED,OTAZKA_ID,VYPLNENY_KVIZ_ID,NAZEV,OTAZKA,BODY,"odpoved_puvodni",PORADI,"druh_otazky_nazev","druh_otazky_zkratka","druh_otazky_popis") values ('12','c','3','9','Pøíklad 1','Kolik je 2+2 ?

a, 3
b, 4
c, 5
d, nemá øešení','1','b','1','Výbìr z možností','SELECT','Odpovìï je nutné vybrat z pøedem napsaných možností.');
Insert into ST58214.VYPLNENE_OTAZKY (ID_VYPLNENA_OTAZKA,ODPOVED,OTAZKA_ID,VYPLNENY_KVIZ_ID,NAZEV,OTAZKA,BODY,"odpoved_puvodni",PORADI,"druh_otazky_nazev","druh_otazky_zkratka","druh_otazky_popis") values ('14','b','4','11','Pøíklad 1','Kolik je 2+2 ?

a, 3
b, 4
c, 5
d, nemá øešení','1','b','1','Výbìr z možností','SELECT','Odpovìï je nutné vybrat z pøedem napsaných možností.');
Insert into ST58214.VYPLNENE_OTAZKY (ID_VYPLNENA_OTAZKA,ODPOVED,OTAZKA_ID,VYPLNENY_KVIZ_ID,NAZEV,OTAZKA,BODY,"odpoved_puvodni",PORADI,"druh_otazky_nazev","druh_otazky_zkratka","druh_otazky_popis") values ('15','a','5','12','Pøíklad 1','Kolik je 2+2 ?

a, 3
b, 4
c, 5
d, nemá øešení','1','b','1','Výbìr z možností','SELECT','Odpovìï je nutné vybrat z pøedem napsaných možností.');
Insert into ST58214.VYPLNENE_OTAZKY (ID_VYPLNENA_OTAZKA,ODPOVED,OTAZKA_ID,VYPLNENY_KVIZ_ID,NAZEV,OTAZKA,BODY,"odpoved_puvodni",PORADI,"druh_otazky_nazev","druh_otazky_zkratka","druh_otazky_popis") values ('16','b','6','13','Pøíklad 1','Kolik je 2+2 ?

a, 3
b, 4
c, 5
d, nemá øešení','1','b','1','Výbìr z možností','SELECT','Odpovìï je nutné vybrat z pøedem napsaných možností.');
Insert into ST58214.VYPLNENE_OTAZKY (ID_VYPLNENA_OTAZKA,ODPOVED,OTAZKA_ID,VYPLNENY_KVIZ_ID,NAZEV,OTAZKA,BODY,"odpoved_puvodni",PORADI,"druh_otazky_nazev","druh_otazky_zkratka","druh_otazky_popis") values ('17','b','7','14','Pøíklad 1','Kolik je 2+2 ?

a, 3
b, 4
c, 5
d, nemá øešení','1','b','1','Výbìr z možností','SELECT','Odpovìï je nutné vybrat z pøedem napsaných možností.');
Insert into ST58214.VYPLNENE_OTAZKY (ID_VYPLNENA_OTAZKA,ODPOVED,OTAZKA_ID,VYPLNENY_KVIZ_ID,NAZEV,OTAZKA,BODY,"odpoved_puvodni",PORADI,"druh_otazky_nazev","druh_otazky_zkratka","druh_otazky_popis") values ('18','d','8','15','Pøíklad 1','Kolik je 2+2 ?

a, 3
b, 4
c, 5
d, nemá øešení','1','b','1','Výbìr z možností','SELECT','Odpovìï je nutné vybrat z pøedem napsaných možností.');
Insert into ST58214.VYPLNENE_OTAZKY (ID_VYPLNENA_OTAZKA,ODPOVED,OTAZKA_ID,VYPLNENY_KVIZ_ID,NAZEV,OTAZKA,BODY,"odpoved_puvodni",PORADI,"druh_otazky_nazev","druh_otazky_zkratka","druh_otazky_popis") values ('19','a','9','16','Pøíklad 1','Kolik je 2+2 ?

a, 3
b, 4
c, 5
d, nemá øešení','1','b','1','Výbìr z možností','SELECT','Odpovìï je nutné vybrat z pøedem napsaných možností.');
Insert into ST58214.VYPLNENE_OTAZKY (ID_VYPLNENA_OTAZKA,ODPOVED,OTAZKA_ID,VYPLNENY_KVIZ_ID,NAZEV,OTAZKA,BODY,"odpoved_puvodni",PORADI,"druh_otazky_nazev","druh_otazky_zkratka","druh_otazky_popis") values ('20','b','10','17','Pøíklad 1','Kolik je 2+2 ?

a, 3
b, 4
c, 5
d, nemá øešení','1','b','1','Výbìr z možností','SELECT','Odpovìï je nutné vybrat z pøedem napsaných možností.');
Insert into ST58214.VYPLNENE_OTAZKY (ID_VYPLNENA_OTAZKA,ODPOVED,OTAZKA_ID,VYPLNENY_KVIZ_ID,NAZEV,OTAZKA,BODY,"odpoved_puvodni",PORADI,"druh_otazky_nazev","druh_otazky_zkratka","druh_otazky_popis") values ('21','b','11','18','Pøíklad 1','Kolik je 2+2 ?

a, 3
b, 4
c, 5
d, nemá øešení','1','b','1','Výbìr z možností','SELECT','Odpovìï je nutné vybrat z pøedem napsaných možností.');
Insert into ST58214.VYPLNENE_OTAZKY (ID_VYPLNENA_OTAZKA,ODPOVED,OTAZKA_ID,VYPLNENY_KVIZ_ID,NAZEV,OTAZKA,BODY,"odpoved_puvodni",PORADI,"druh_otazky_nazev","druh_otazky_zkratka","druh_otazky_popis") values ('22','b','12','19','Pøíklad 1','Kolik je 2+2 ?

a, 3
b, 4
c, 5
d, nemá øešení','1','b','1','Výbìr z možností','SELECT','Odpovìï je nutné vybrat z pøedem napsaných možností.');
--------------------------------------------------------
--  DDL for Index DRUH_OTAZKY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ST58214"."DRUH_OTAZKY_PK" ON "ST58214"."DRUH_OTAZKY" ("ID_DRUHOTAZKY") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "STUDENTI" ;
--------------------------------------------------------
--  DDL for Index KATEGORIE_MATERIALU_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ST58214"."KATEGORIE_MATERIALU_PK" ON "ST58214"."KATEGORIE_MATERIALU" ("ID_KATEGORIEMATERIALU") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "STUDENTI" ;
--------------------------------------------------------
--  DDL for Index KATEGORIZACE_MATERIALU_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ST58214"."KATEGORIZACE_MATERIALU_PK" ON "ST58214"."KATEGORIZACE_MATERIALU" ("STUDIJNI_MATERIAL_ID", "KATEGORIE_MATERIALU_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "STUDENTI" ;
--------------------------------------------------------
--  DDL for Index KOMENTAR_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ST58214"."KOMENTAR_PK" ON "ST58214"."KOMENTAR" ("ID_KOMENTAR") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "STUDENTI" ;
--------------------------------------------------------
--  DDL for Index KVIZ_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ST58214"."KVIZ_PK" ON "ST58214"."KVIZ" ("ID_KVIZ") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "STUDENTI" ;
--------------------------------------------------------
--  DDL for Index NEVHODNE_SLOVO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ST58214"."NEVHODNE_SLOVO_PK" ON "ST58214"."NEVHODNE_SLOVO" ("ID_NEVHODNE_SLOVO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "STUDENTI" ;
--------------------------------------------------------
--  DDL for Index OTAZKA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ST58214"."OTAZKA_PK" ON "ST58214"."OTAZKA" ("ID_OTAZKA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "STUDENTI" ;
--------------------------------------------------------
--  DDL for Index PREDMET_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ST58214"."PREDMET_PK" ON "ST58214"."PREDMET" ("ID_PREDMET") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "STUDENTI" ;
--------------------------------------------------------
--  DDL for Index PREDMETY_SKUPINY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ST58214"."PREDMETY_SKUPINY_PK" ON "ST58214"."PREDMETY_SKUPINY" ("SKUPINA_ID", "PREDMET_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "STUDENTI" ;
--------------------------------------------------------
--  DDL for Index PREDMETY_UZIVATELE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ST58214"."PREDMETY_UZIVATELE_PK" ON "ST58214"."PREDMETY_UZIVATELE" ("UZIVATEL_ID", "PREDMET_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "STUDENTI" ;
--------------------------------------------------------
--  DDL for Index ROLE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ST58214"."ROLE_PK" ON "ST58214"."ROLE" ("ID_ROLE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "STUDENTI" ;
--------------------------------------------------------
--  DDL for Index SKUPINA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ST58214"."SKUPINA_PK" ON "ST58214"."SKUPINA" ("ID_SKUPINA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "STUDENTI" ;
--------------------------------------------------------
--  DDL for Index SOUBOR_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ST58214"."SOUBOR_PK" ON "ST58214"."SOUBOR" ("ID_SOUBOR") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "STUDENTI" ;
--------------------------------------------------------
--  DDL for Index STUDIJNI_MATERIAL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ST58214"."STUDIJNI_MATERIAL_PK" ON "ST58214"."STUDIJNI_MATERIAL" ("ID_STUDIJNIMATERIAL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "STUDENTI" ;
--------------------------------------------------------
--  DDL for Index UPRAVA_MATERIALU_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ST58214"."UPRAVA_MATERIALU_PK" ON "ST58214"."UPRAVA_MATERIALU" ("ID_UPRAVAMATERIALU") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "STUDENTI" ;
--------------------------------------------------------
--  DDL for Index UZIVATELE_SKUPINY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ST58214"."UZIVATELE_SKUPINY_PK" ON "ST58214"."UZIVATELE_SKUPINY" ("UZIVATEL_ID", "SKUPINA_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "STUDENTI" ;
--------------------------------------------------------
--  DDL for Index UZIVATEL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ST58214"."UZIVATEL_PK" ON "ST58214"."UZIVATEL" ("ID_UZIVATEL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "STUDENTI" ;
--------------------------------------------------------
--  DDL for Index VYPLNENA_OTAZKA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ST58214"."VYPLNENA_OTAZKA_PK" ON "ST58214"."VYPLNENA_OTAZKA" ("ID_VYPLNENA_OTAZKA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "STUDENTI" ;
--------------------------------------------------------
--  DDL for Index VYPLNENY_KVIZ_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ST58214"."VYPLNENY_KVIZ_PK" ON "ST58214"."VYPLNENY_KVIZ" ("ID_VYPLNENY_KVIZ") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "STUDENTI" ;
--------------------------------------------------------
--  DDL for Index ZPRAVA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ST58214"."ZPRAVA_PK" ON "ST58214"."ZPRAVA" ("ID_ZPRAVA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "STUDENTI" ;
--------------------------------------------------------
--  DDL for Trigger CHECK_KOMENTAR
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "ST58214"."CHECK_KOMENTAR" 
BEFORE INSERT ON komentar
FOR EACH ROW
DECLARE
    v_result BOOLEAN;
BEGIN
    v_result := ELSA.isStringValid(:new.text);
    IF v_result = FALSE THEN
        RAISE_APPLICATION_ERROR(-20111, 'Nalezeno nevhodné slovo.');
    END IF;
END;
/
ALTER TRIGGER "ST58214"."CHECK_KOMENTAR" ENABLE;
--------------------------------------------------------
--  DDL for Trigger DRUH_OTAZKY_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "ST58214"."DRUH_OTAZKY_TRG" BEFORE
    INSERT ON druh_otazky
    FOR EACH ROW
     WHEN ( new.id_druhotazky IS NULL ) BEGIN
    :new.id_druhotazky := druh_otazky_seq.nextval;
END;

/
ALTER TRIGGER "ST58214"."DRUH_OTAZKY_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger KATEGORIE_MATERIALU_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "ST58214"."KATEGORIE_MATERIALU_TRG" BEFORE
    INSERT ON kategorie_materialu
    FOR EACH ROW
     WHEN ( new.id_kategoriematerialu IS NULL ) BEGIN
    :new.id_kategoriematerialu := kategorie_materialu_seq.nextval;
END;

/
ALTER TRIGGER "ST58214"."KATEGORIE_MATERIALU_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger KOMENTAR_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "ST58214"."KOMENTAR_TRG" BEFORE
    INSERT ON komentar
    FOR EACH ROW
     WHEN ( new.id_komentar IS NULL ) BEGIN
    :new.id_komentar := komentar_seq.nextval;
END;

/
ALTER TRIGGER "ST58214"."KOMENTAR_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger KVIZ_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "ST58214"."KVIZ_TRG" BEFORE
    INSERT ON kviz
    FOR EACH ROW
     WHEN ( new.id_kviz IS NULL ) BEGIN
    :new.id_kviz := kviz_seq.nextval;
END;

/
ALTER TRIGGER "ST58214"."KVIZ_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger NEVHODNE_SLOVO_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "ST58214"."NEVHODNE_SLOVO_TRG" BEFORE
    INSERT ON nevhodne_slovo
    FOR EACH ROW
     WHEN ( new.id_nevhodne_slovo IS NULL ) BEGIN
    :new.id_nevhodne_slovo := nevhodne_slovo_seq.nextval;
END;

/
ALTER TRIGGER "ST58214"."NEVHODNE_SLOVO_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger OTAZKA_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "ST58214"."OTAZKA_TRG" BEFORE
    INSERT ON otazka
    FOR EACH ROW
     WHEN ( new.id_otazka IS NULL ) BEGIN
    :new.id_otazka := otazka_seq.nextval;
END;

/
ALTER TRIGGER "ST58214"."OTAZKA_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PREDMET_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "ST58214"."PREDMET_TRG" BEFORE
    INSERT ON predmet
    FOR EACH ROW
     WHEN ( new.id_predmet IS NULL ) BEGIN
    :new.id_predmet := predmet_seq.nextval;
END;

/
ALTER TRIGGER "ST58214"."PREDMET_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger ROLE_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "ST58214"."ROLE_TRG" BEFORE
    INSERT ON role
    FOR EACH ROW
     WHEN ( new.id_role IS NULL ) BEGIN
    :new.id_role := role_seq.nextval;
END;

/
ALTER TRIGGER "ST58214"."ROLE_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger SKUPINA_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "ST58214"."SKUPINA_TRG" BEFORE
    INSERT ON skupina
    FOR EACH ROW
     WHEN ( new.id_skupina IS NULL ) BEGIN
    :new.id_skupina := skupina_seq.nextval;
END;

/
ALTER TRIGGER "ST58214"."SKUPINA_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger SOUBOR_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "ST58214"."SOUBOR_TRG" BEFORE
    INSERT ON soubor
    FOR EACH ROW
     WHEN ( new.id_soubor IS NULL ) BEGIN
    :new.id_soubor := soubor_seq.nextval;
END;

/
ALTER TRIGGER "ST58214"."SOUBOR_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger STUDIJNI_MATERIAL_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "ST58214"."STUDIJNI_MATERIAL_TRG" BEFORE
    INSERT ON studijni_material
    FOR EACH ROW
     WHEN ( new.id_studijnimaterial IS NULL ) BEGIN
    :new.id_studijnimaterial := studijni_material_seq.nextval;
END;

/
ALTER TRIGGER "ST58214"."STUDIJNI_MATERIAL_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger SYSTEM_MESSAGE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "ST58214"."SYSTEM_MESSAGE" 
AFTER INSERT OR UPDATE ON uzivatel
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO zprava VALUES(ZPRAVA_SEQ.NEXTVAL, 'Registrace byla úspìšná.', SYSDATE, 2, :old.id_uzivatel);
    ELSIF UPDATING THEN
        INSERT INTO zprava VALUES(ZPRAVA_SEQ.NEXTVAL, 'Informace o úètu byly upraveny.', SYSDATE, 2, :old.id_uzivatel);
    END IF;
END;
/
ALTER TRIGGER "ST58214"."SYSTEM_MESSAGE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger UPRAVA_MATERIALU_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "ST58214"."UPRAVA_MATERIALU_TRG" BEFORE
    INSERT ON uprava_materialu
    FOR EACH ROW
     WHEN ( new.id_upravamaterialu IS NULL ) BEGIN
    :new.id_upravamaterialu := uprava_materialu_seq.nextval;
END;

/
ALTER TRIGGER "ST58214"."UPRAVA_MATERIALU_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger UZIVATEL_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "ST58214"."UZIVATEL_TRG" BEFORE
    INSERT ON uzivatel
    FOR EACH ROW
     WHEN ( new.id_uzivatel IS NULL ) BEGIN
    :new.id_uzivatel := uzivatel_seq.nextval;
END;

/
ALTER TRIGGER "ST58214"."UZIVATEL_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VYPLNENA_OTAZKA_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "ST58214"."VYPLNENA_OTAZKA_TRG" BEFORE
    INSERT ON vyplnena_otazka
    FOR EACH ROW
     WHEN ( new.id_vyplnena_otazka IS NULL ) BEGIN
    :new.id_vyplnena_otazka := vyplnena_otazka_seq.nextval;
END;

/
ALTER TRIGGER "ST58214"."VYPLNENA_OTAZKA_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VYPLNENY_KVIZ_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "ST58214"."VYPLNENY_KVIZ_TRG" BEFORE
    INSERT ON vyplneny_kviz
    FOR EACH ROW
     WHEN ( new.id_vyplneny_kviz IS NULL ) BEGIN
    :new.id_vyplneny_kviz := vyplneny_kviz_seq.nextval;
END;

/
ALTER TRIGGER "ST58214"."VYPLNENY_KVIZ_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger ZPRAVA_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "ST58214"."ZPRAVA_TRG" BEFORE
    INSERT ON zprava
    FOR EACH ROW
     WHEN ( new.id_zprava IS NULL ) BEGIN
    :new.id_zprava := zprava_seq.nextval;
END;

/
ALTER TRIGGER "ST58214"."ZPRAVA_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Package ELSA
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "ST58214"."ELSA" AS

TYPE STRING_ARRAY IS TABLE OF VARCHAR2(1024);

FUNCTION getPassword(
p_login IN uzivatel.login%TYPE
) RETURN uzivatel.heslo%TYPE;

FUNCTION isStringValid(p_string VARCHAR2) RETURN BOOLEAN;

FUNCTION evaluateSubject(
    p_user_id IN uzivatel.id_uzivatel%TYPE,
    p_subject_id IN predmet.id_predmet%TYPE
) RETURN NUMBER;

FUNCTION validateSubject(
    p_subject_id predmet.id_predmet%TYPE,
    p_mode NUMBER
) RETURN VARCHAR2;

PROCEDURE register(
p_login IN uzivatel.login%TYPE,
p_heslo IN uzivatel.heslo%TYPE,
p_jmeno IN uzivatel.jmeno%TYPE,
p_prijmeni IN uzivatel.prijmeni%TYPE,
p_email IN uzivatel.email%TYPE
);
PROCEDURE subscribeSubject(
p_uzivatel_id IN predmety_uzivatele.uzivatel_id%TYPE,
p_predmet_id IN predmety_uzivatele.predmet_id%TYPE
);
PROCEDURE unsubscribeSubject(
p_uzivatel_id IN predmety_uzivatele.uzivatel_id%TYPE,
p_predmet_id IN predmety_uzivatele.predmet_id%TYPE
);
PROCEDURE addSubject(
p_nazev IN predmet.nazev%TYPE,
p_zkratka IN predmet.zkratka%TYPE,
p_popis IN predmet.popis%TYPE
);
PROCEDURE addStudyMaterial(
p_nazev IN studijni_material.nazev%TYPE,
p_stran IN studijni_material.stran%TYPE,
p_popis IN studijni_material.popis%TYPE, 
p_soubor IN studijni_material.soubor%TYPE,
p_pripona IN studijni_material.pripona%TYPE,
p_predmet_id IN studijni_material.predmet_id%TYPE,
p_uzivatel_id IN studijni_material.uzivatel_id%TYPE
);
PROCEDURE addStudyMaterialType(
p_studijni_material_id IN kategorizace_materialu.studijni_material_id%TYPE,
p_kategorie_materialu_id IN kategorizace_materialu.kategorie_materialu_id%TYPE
);
PROCEDURE addQuiz(
p_nazev IN kviz.nazev%TYPE,
p_popis IN kviz.popis%TYPE, 
p_studijni_material_id IN kviz.studijni_material_id%TYPE,
p_uzivatel_id IN kviz.uzivatel_id%TYPE);
PROCEDURE addQuestion(
p_nazev IN otazka.nazev%TYPE,
p_otazka IN otazka.otazka%TYPE,
p_odpoved IN otazka.odpoved%TYPE,
p_body IN otazka.body%TYPE,
p_poradi IN otazka.poradi%TYPE,
p_kviz_id IN otazka.kviz_id%TYPE,
p_druh_otazky_id IN otazka.druh_otazky_id%TYPE,
p_uzivatel_id IN otazka.uzivatel_id%TYPE
);
PROCEDURE addComment(
p_text IN komentar.text%TYPE,
p_studijni_material_id IN komentar.studijni_material_id%TYPE,
p_uzivatel_id IN komentar.uzivatel_id%TYPE
);
PROCEDURE createStudyMaterialType(
p_nazev IN kategorie_materialu.nazev%TYPE,
p_zkratka IN kategorie_materialu.zkratka%TYPE,
p_popis IN kategorie_materialu.popis%TYPE
);
PROCEDURE createQuestionType(
p_nazev IN druh_otazky.nazev%TYPE,
p_zkratka IN druh_otazky.zkratka%TYPE,
p_popis IN druh_otazky.popis%TYPE
);
PROCEDURE removeSubject(
p_id_predmet IN predmet.id_predmet%TYPE
);
PROCEDURE removeStudyMaterial(
p_id_studijniMaterial IN studijni_material.id_studijniMaterial%TYPE
);
PROCEDURE removeQuiz(
p_id_kviz IN kviz.id_kviz%TYPE
);
PROCEDURE removeQuestion(
p_id_otazka IN otazka.id_otazka%TYPE
);
PROCEDURE removeComment(
p_id_komentar IN komentar.id_komentar%TYPE
);
PROCEDURE removeStudyMaterialType(
p_studijni_material_id IN kategorizace_materialu.studijni_material_id%TYPE,
p_kategorie_materialu_id IN kategorizace_materialu.kategorie_materialu_id%TYPE
);
PROCEDURE deleteStudyMaterialType(
p_id_kategoriematerialu IN kategorie_materialu.id_kategoriematerialu%TYPE
);
PROCEDURE deleteQuestionType(
p_id_druhotazky IN druh_otazky.id_druhotazky%TYPE
);
PROCEDURE removeUser(
p_id_uzivatel IN uzivatel.id_uzivatel%TYPE
);
PROCEDURE editSubject(
p_nazev IN predmet.nazev%TYPE,
p_zkratka IN predmet.zkratka%TYPE,
p_popis IN predmet.popis%TYPE,
p_id_predmet IN predmet.id_predmet%TYPE
);
PROCEDURE editStudyMaterial(
p_nazev IN studijni_material.nazev%TYPE,
p_stran IN studijni_material.stran%TYPE,
p_popis IN studijni_material.popis%TYPE,
p_id_studijnimaterial IN studijni_material.id_studijnimaterial%TYPE
);
PROCEDURE editStudyMaterialFile(
p_nazev IN studijni_material.nazev%TYPE,
p_stran IN studijni_material.stran%TYPE,
p_popis IN studijni_material.popis%TYPE, 
p_soubor IN studijni_material.soubor%TYPE,
p_pripona IN studijni_material.pripona%TYPE,
p_id_studijnimaterial IN studijni_material.id_studijnimaterial%TYPE
);
PROCEDURE addStudyMaterialChange(
p_uzivatel_id IN uprava_materialu.uzivatel_id%TYPE,
p_studijni_material_id IN uprava_materialu.studijni_material_id%TYPE
);
PROCEDURE editQuiz(
p_nazev IN kviz.nazev%TYPE,
p_popis IN kviz.popis%TYPE,
p_id_kviz IN kviz.id_kviz%TYPE
);
PROCEDURE editQuestion(
p_nazev IN otazka.nazev%TYPE,
p_otazka IN otazka.otazka%TYPE,
p_odpoved IN otazka.odpoved%TYPE,
p_body IN otazka.body%TYPE,
p_poradi IN otazka.poradi%TYPE,
p_druh_otazky_id IN otazka.druh_otazky_id%TYPE,
p_id_otazka IN otazka.id_otazka%TYPE
);
PROCEDURE editImage(
p_image IN uzivatel.image%TYPE,
p_id_uzivatel IN uzivatel.id_uzivatel%TYPE
);
PROCEDURE editProfileInformation(
p_jmeno IN uzivatel.jmeno%TYPE,
p_prijmeni IN uzivatel.prijmeni%TYPE,
p_email IN uzivatel.email%TYPE,
p_telefon IN uzivatel.telefon%TYPE,
p_adresa IN uzivatel.adresa%TYPE,
p_id_uzivatel IN uzivatel.id_uzivatel%TYPE
);
PROCEDURE editLoginInformation(
p_login IN uzivatel.login%TYPE,
p_id_uzivatel IN uzivatel.id_uzivatel%TYPE
);
PROCEDURE editLoginInformationPassword(
p_login IN uzivatel.login%TYPE,
p_heslo IN uzivatel.heslo%TYPE,
p_id_uzivatel IN uzivatel.id_uzivatel%TYPE
);
PROCEDURE editComment(
p_text IN komentar.text%TYPE,
p_id_komentar IN komentar.id_komentar%TYPE
);
PROCEDURE editStudyMaterialType(
p_nazev IN kategorie_materialu.nazev%TYPE,
p_zkratka IN kategorie_materialu.zkratka%TYPE,
p_popis IN kategorie_materialu.popis%TYPE,
p_id_kategoriematerialu IN kategorie_materialu.id_kategoriematerialu%TYPE
);
PROCEDURE editQuestionType(
p_nazev IN druh_otazky.nazev%TYPE,
p_zkratka IN druh_otazky.zkratka%TYPE,
p_popis IN druh_otazky.popis%TYPE,
p_id_druhotazky IN druh_otazky.id_druhotazky%TYPE
);
PROCEDURE changePermission(
p_role_id IN uzivatel.role_id%TYPE,
p_id_uzivatel IN uzivatel.id_uzivatel%TYPE
);
PROCEDURE find(
p_title IN studijni_material.nazev%TYPE,
p_predmet_id IN studijni_material.predmet_id%TYPE,
p_kategorie_materialu_id IN NUMBER,
p_uzivatel_id IN studijni_material.uzivatel_id%TYPE,
p_data OUT SYS_REFCURSOR
);
PROCEDURE addMessage(
p_text IN zprava.text%TYPE,
p_sender_id IN zprava.odesilatel_id%TYPE,
p_recipient_id IN zprava.prijemce_id%TYPE
);
PROCEDURE getCommunications(
p_uzivatel_id IN uzivatel.id_uzivatel%TYPE,
p_mistnosti OUT SYS_REFCURSOR
);

PROCEDURE getCommunication(
p_uzivatel_1 IN uzivatel.id_uzivatel%TYPE,
p_uzivatel_2 IN uzivatel.id_uzivatel%TYPE,
p_data OUT SYS_REFCURSOR
);

PROCEDURE removeMessage(
p_id_zprava IN zprava.id_zprava%TYPE
);

PROCEDURE addCloudFile (
p_nazev IN soubor.nazev%TYPE,
p_soubor IN soubor.soubor%TYPE,
p_pripona IN soubor.pripona%TYPE,
p_uzivatel_id IN soubor.uzivatel_id%TYPE
);

PROCEDURE editCloudFile (
p_nazev IN soubor.nazev%TYPE,
p_id_soubor IN soubor.id_soubor%TYPE
);

PROCEDURE getFileFromCloudFile(
p_id_soubor IN soubor.id_soubor%TYPE,
p_soubor OUT soubor.soubor%TYPE
);

PROCEDURE removeCloudFile(
p_id_soubor IN soubor.id_soubor%TYPE
);

PROCEDURE removeForbiddenWord(
p_id_nevhodne_slovo IN nevhodne_slovo.id_nevhodne_slovo%TYPE
);

PROCEDURE addForbiddenWord(
p_text IN nevhodne_slovo.text%TYPE
);

PROCEDURE addGroup(
p_rok_studia IN skupina.rok_studia%TYPE,
p_obor IN skupina.obor%TYPE
);

PROCEDURE editGroup(
p_rok_studia IN skupina.rok_studia%TYPE,
p_obor IN skupina.obor%TYPE,
p_id_skupina IN skupina.id_skupina%TYPE
);

PROCEDURE removeGroup(
p_id_skupina IN skupina.id_skupina%TYPE
);

PROCEDURE addUserToGroup(
p_uzivatel_id IN uzivatele_skupiny.uzivatel_id%TYPE,
p_skupina_id IN uzivatele_skupiny.skupina_id%TYPE
);

PROCEDURE removeUserFromGroup(
p_uzivatel_id IN uzivatele_skupiny.uzivatel_id%TYPE,
p_skupina_id IN uzivatele_skupiny.skupina_id%TYPE
);

PROCEDURE addSubjectToGroup(
p_predmet_id IN predmety_skupiny.predmet_id%TYPE,
p_skupina_id IN predmety_skupiny.skupina_id%TYPE
);

PROCEDURE removeSubjectFromGroup(
p_predmet_id IN predmety_skupiny.predmet_id%TYPE,
p_skupina_id IN predmety_skupiny.skupina_id%TYPE
);

PROCEDURE submitQuiz(
    p_uzivatel_id vyplneny_kviz.uzivatel_id%TYPE,
    p_kviz_id vyplneny_kviz.kviz_id%TYPE,
    p_body vyplneny_kviz.kviz_id%TYPE,
    p_odpoved ELSA.STRING_ARRAY,
    p_otazka_id ELSA.STRING_ARRAY
);

PROCEDURE getUsersEvaluationOnSubject(
    p_predmet_id IN studijni_material.predmet_id%TYPE,
    p_uzivatele OUT SYS_REFCURSOR
);

PROCEDURE getUserEvaluationOnSubject(
    p_predmet_id IN studijni_material.predmet_id%TYPE,
    p_uzivatel_id IN vyplneny_kviz.uzivatel_id%TYPE,
    p_uzivatele OUT SYS_REFCURSOR
);

PROCEDURE finalEvaluation(
    p_user_id IN uzivatel.id_uzivatel%TYPE,
    p_group_id IN skupina.id_skupina%TYPE
);

END ELSA;

/
--------------------------------------------------------
--  DDL for Package Body ELSA
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "ST58214"."ELSA" AS

FUNCTION getPassword(p_login IN uzivatel.login%TYPE) 
RETURN uzivatel.heslo%TYPE AS v_password uzivatel.heslo%TYPE;
BEGIN
    SELECT heslo INTO v_password FROM uzivatel WHERE login = p_login;
    RETURN v_password; 
END getPassword;


FUNCTION isStringValid(p_string VARCHAR2) RETURN BOOLEAN AS
CURSOR c_data IS SELECT text FROM nevhodne_slovo;
v_count NUMBER := 0;
e_violation EXCEPTION;
BEGIN
    FOR item IN c_data LOOP
        SELECT REGEXP_COUNT(p_string, item.text) INTO v_count FROM DUAL;
        IF v_count > 0 THEN
            DBMS_OUTPUT.PUT_LINE(item.text);
            RAISE e_violation;
        END IF;
    END LOOP;
    
    RETURN TRUE;
    
    EXCEPTION WHEN e_violation THEN
        RETURN FALSE;
END isStringValid;

FUNCTION evaluateSubject(
    p_user_id IN uzivatel.id_uzivatel%TYPE,
    p_subject_id IN predmet.id_predmet%TYPE
) RETURN NUMBER AS
    v_sum_points NUMBER;
    v_obtained_points NUMBER;
    v_user_id NUMBER;
BEGIN

    SELECT SUM(body) INTO v_sum_points FROM otazka 
    INNER JOIN kviz ON otazka.kviz_id = kviz.id_kviz 
    INNER JOIN studijni_material ON kviz.studijni_material_id = studijni_material.id_studijnimaterial 
    WHERE studijni_material.predmet_id = p_subject_id;
    
    IF v_sum_points = 0 THEN
        RETURN 0;
    END IF;

    SELECT uzivatel_id, SUM(VYPLNENE_KVIZY.body) INTO v_user_id, v_obtained_points
    FROM VYPLNENE_KVIZY 
    WHERE predmet_id = p_subject_id AND uzivatel_id = p_user_id
    GROUP BY uzivatel_id;
    
    RETURN (v_obtained_points / v_sum_points) * 100;
    
    EXCEPTION 
    WHEN OTHERS THEN
        RETURN 0;
END evaluateSubject;

FUNCTION validateSubject(
    p_subject_id predmet.id_predmet%TYPE,
    p_mode NUMBER
) RETURN VARCHAR2 AS
    v_count NUMBER;
    v_info VARCHAR2(128);
BEGIN
    IF p_mode = 1 THEN
        SELECT COUNT(id_studijnimaterial) INTO v_count FROM studijni_material WHERE predmet_id = p_subject_id;
        
        IF v_count > 0 THEN
            RETURN 'Doplnìné';
        ELSE 
            RETURN 'Žádné';
        END IF;
    ELSIF p_mode = 2 THEN
    
        SELECT validateSubject(p_subject_id, 1) INTO v_info FROM DUAL;
    
        IF v_info = 'Žádné' THEN
            RETURN 'Žádné';
        END IF;
    
        SELECT SUM(quiz_count) INTO v_count FROM (
            SELECT id_studijnimaterial, COUNT(id_kviz) quiz_count FROM (
                SELECT id_kviz, id_studijnimaterial
                FROM kviz 
                INNER JOIN studijni_material ON studijni_material.id_studijnimaterial = kviz.studijni_material_id
            WHERE studijni_material.predmet_id = p_subject_id) 
        GROUP BY id_studijnimaterial);
        
        IF v_count > 0 THEN
            RETURN 'Doplnìné';
        ELSE 
            RETURN 'Žádné';
        END IF;
    ELSIF p_mode = 3 THEN
    
        SELECT validateSubject(p_subject_id, 2) INTO v_info FROM DUAL;
           
        IF v_info = 'Žádné' THEN
            RETURN 'Žádné';
        END IF;
    
        SELECT MIN(question_count) INTO v_count FROM (
            SELECT id_kviz, COUNT(id_otazka) question_count FROM (
                SELECT id_kviz, id_otazka
                FROM otazka 
                INNER JOIN kviz ON otazka.kviz_id = kviz.id_kviz
                INNER JOIN studijni_material ON studijni_material.id_studijnimaterial = kviz.studijni_material_id
            WHERE studijni_material.predmet_id = p_subject_id) 
        GROUP BY id_kviz);
        
        IF v_count > 0 THEN
            RETURN 'Doplnìné';
        ELSE 
            RETURN 'Nedoplnìné';
        END IF;
    ELSE
        RETURN 'Špatný režim';
    END IF;
    
    EXCEPTION 
        WHEN OTHERS THEN
            RETURN 'Nedoplnìné';
END validateSubject;

PROCEDURE register(
    p_login IN uzivatel.login%TYPE,
    p_heslo IN uzivatel.heslo%TYPE,
    p_jmeno IN uzivatel.jmeno%TYPE,
    p_prijmeni IN uzivatel.prijmeni%TYPE,
    p_email IN uzivatel.email%TYPE
) AS
BEGIN
    INSERT INTO UZIVATEL(id_uzivatel, login, heslo, jmeno, prijmeni, email, role_id)
    VALUES(UZIVATEL_SEQ.NEXTVAL, p_login, p_heslo, p_jmeno, p_prijmeni, p_email, 3);
END register;


PROCEDURE subscribeSubject(
    p_uzivatel_id IN predmety_uzivatele.uzivatel_id%TYPE,
    p_predmet_id IN predmety_uzivatele.predmet_id%TYPE
) AS
BEGIN
    INSERT INTO predmety_uzivatele(uzivatel_id, predmet_id)
    VALUES(p_uzivatel_id, p_predmet_id);
END subscribeSubject;


PROCEDURE unsubscribeSubject(
    p_uzivatel_id IN predmety_uzivatele.uzivatel_id%TYPE,
    p_predmet_id IN predmety_uzivatele.predmet_id%TYPE
) AS
BEGIN
    DELETE FROM predmety_uzivatele WHERE predmet_id = p_predmet_id AND uzivatel_id = p_uzivatel_id;
END unsubscribeSubject;


PROCEDURE addSubject(
    p_nazev IN predmet.nazev%TYPE,
    p_zkratka IN predmet.zkratka%TYPE,
    p_popis IN predmet.popis%TYPE
) AS
BEGIN
    INSERT INTO predmet(id_predmet, nazev, zkratka, popis)
    VALUES(PREDMET_SEQ.NEXTVAL, p_nazev, p_zkratka, p_popis);
END addSubject;


PROCEDURE addStudyMaterial(
    p_nazev IN studijni_material.nazev%TYPE,
    p_stran IN studijni_material.stran%TYPE,
    p_popis IN studijni_material.popis%TYPE, 
    p_soubor IN studijni_material.soubor%TYPE,
    p_pripona IN studijni_material.pripona%TYPE,
    p_predmet_id IN studijni_material.predmet_id%TYPE,
    p_uzivatel_id IN studijni_material.uzivatel_id%TYPE
) AS
BEGIN
    INSERT INTO studijni_material(
        id_studijniMaterial,nazev, stran, datumvytvoreni,
        datumzmeny, popis, soubor, pripona, predmet_id, uzivatel_id)
    VALUES(
        STUDIJNI_MATERIAL_SEQ.NEXTVAL, p_nazev, p_stran, SYSDATE,
        SYSDATE, p_popis, p_soubor, p_pripona, p_predmet_id, p_uzivatel_id);
END addStudyMaterial;


PROCEDURE addStudyMaterialType(
    p_studijni_material_id IN kategorizace_materialu.studijni_material_id%TYPE,
    p_kategorie_materialu_id IN kategorizace_materialu.kategorie_materialu_id%TYPE
) AS
BEGIN
    INSERT INTO kategorizace_materialu(studijni_material_id, kategorie_materialu_id)
    VALUES(p_studijni_material_id, p_kategorie_materialu_id);
END addStudyMaterialType;


PROCEDURE addQuiz(
    p_nazev IN kviz.nazev%TYPE,
    p_popis IN kviz.popis%TYPE, 
    p_studijni_material_id IN kviz.studijni_material_id%TYPE,
    p_uzivatel_id IN kviz.uzivatel_id%TYPE
) AS
BEGIN
    INSERT INTO KVIZ(id_kviz, nazev, popis, studijni_material_id, uzivatel_id)
    VALUES(KVIZ_SEQ.NEXTVAL, p_nazev, p_popis, p_studijni_material_id, p_uzivatel_id);
END addQuiz;


PROCEDURE addQuestion(
    p_nazev IN otazka.nazev%TYPE,
    p_otazka IN otazka.otazka%TYPE,
    p_odpoved IN otazka.odpoved%TYPE,
    p_body IN otazka.body%TYPE,
    p_poradi IN otazka.poradi%TYPE,
    p_kviz_id IN otazka.kviz_id%TYPE,
    p_druh_otazky_id IN otazka.druh_otazky_id%TYPE,
    p_uzivatel_id IN otazka.uzivatel_id%TYPE
) AS
BEGIN
    INSERT INTO OTAZKA(id_otazka, nazev, otazka, odpoved,
        body, poradi, kviz_id, druh_otazky_id, uzivatel_id)
    VALUES(OTAZKA_SEQ.NEXTVAL, p_nazev, p_otazka, p_odpoved,
        p_body, p_poradi, p_kviz_id, p_druh_otazky_id, p_uzivatel_id);
END addQuestion;


PROCEDURE addComment(
    p_text IN komentar.text%TYPE,
    p_studijni_material_id IN komentar.studijni_material_id%TYPE,
    p_uzivatel_id IN komentar.uzivatel_id%TYPE
) AS
BEGIN
    INSERT INTO komentar(id_komentar, text, datumpridani,
        datumzmeny, studijni_material_id, uzivatel_id) 
    VALUES(KOMENTAR_SEQ.NEXTVAL, p_text, SYSDATE, SYSDATE,
        p_studijni_material_id, p_uzivatel_id);
END addComment;


PROCEDURE createStudyMaterialType(
    p_nazev IN kategorie_materialu.nazev%TYPE,
    p_zkratka IN kategorie_materialu.zkratka%TYPE,
    p_popis IN kategorie_materialu.popis%TYPE
) AS
BEGIN
    INSERT INTO kategorie_materialu(id_kategoriematerialu, nazev, zkratka, popis)
    VALUES(KATEGORIE_MATERIALU_SEQ.NEXTVAL, p_nazev, p_zkratka, p_popis);
END createStudyMaterialType;


PROCEDURE createQuestionType(
p_nazev IN druh_otazky.nazev%TYPE,
p_zkratka IN druh_otazky.zkratka%TYPE,
p_popis IN druh_otazky.popis%TYPE
) AS
BEGIN
INSERT INTO druh_otazky(id_druhotazky, nazev, zkratka, popis)
VALUES(DRUH_OTAZKY_SEQ.NEXTVAL, p_nazev, p_zkratka, p_popis);
END createQuestionType;


PROCEDURE removeSubject(
    p_id_predmet IN predmet.id_predmet%TYPE
) AS
BEGIN
    DELETE FROM predmet WHERE id_predmet = p_id_predmet;
END removeSubject;


PROCEDURE removeStudyMaterial(
    p_id_studijniMaterial IN studijni_material.id_studijniMaterial%TYPE
) AS
BEGIN
    DELETE FROM studijni_material WHERE id_studijniMaterial = p_id_studijniMaterial;
END removeStudyMaterial;


PROCEDURE removeQuiz(
    p_id_kviz IN kviz.id_kviz%TYPE
) AS
BEGIN
    DELETE FROM kviz WHERE id_kviz = p_id_kviz;
END removeQuiz;


PROCEDURE removeQuestion(
    p_id_otazka IN otazka.id_otazka%TYPE
) AS
BEGIN
    DELETE FROM otazka WHERE id_otazka = p_id_otazka;
END removeQuestion;


PROCEDURE removeComment(
    p_id_komentar IN komentar.id_komentar%TYPE
) AS
BEGIN
    DELETE FROM komentar WHERE id_komentar = p_id_komentar;
END removeComment;


PROCEDURE removeStudyMaterialType(
    p_studijni_material_id IN kategorizace_materialu.studijni_material_id%TYPE,
    p_kategorie_materialu_id IN kategorizace_materialu.kategorie_materialu_id%TYPE
) AS
BEGIN
    DELETE FROM kategorizace_materialu WHERE studijni_material_id = p_studijni_material_id 
    AND kategorie_materialu_id = p_kategorie_materialu_id;
END removeStudyMaterialType;


PROCEDURE deleteStudyMaterialType(
    p_id_kategoriematerialu IN kategorie_materialu.id_kategoriematerialu%TYPE
) AS
BEGIN
    DELETE FROM kategorie_materialu WHERE id_kategoriematerialu = p_id_kategoriematerialu;
END deleteStudyMaterialType;


PROCEDURE deleteQuestionType(
    p_id_druhotazky IN druh_otazky.id_druhotazky%TYPE
) AS
BEGIN
    DELETE FROM druh_otazky WHERE id_druhotazky = p_id_druhotazky;
END deleteQuestionType;


PROCEDURE removeUser(
    p_id_uzivatel IN uzivatel.id_uzivatel%TYPE
) AS
BEGIN
    DELETE FROM uzivatel WHERE id_uzivatel = p_id_uzivatel;
END removeUser;


PROCEDURE editSubject(
    p_nazev IN predmet.nazev%TYPE,
    p_zkratka IN predmet.zkratka%TYPE,
    p_popis IN predmet.popis%TYPE,
    p_id_predmet IN predmet.id_predmet%TYPE
) AS
BEGIN
    UPDATE predmet SET nazev = p_nazev, zkratka = p_zkratka, popis = p_popis
    WHERE id_predmet = p_id_predmet;
END editSubject;


PROCEDURE editStudyMaterial(
    p_nazev IN studijni_material.nazev%TYPE,
    p_stran IN studijni_material.stran%TYPE,
    p_popis IN studijni_material.popis%TYPE,
    p_id_studijnimaterial IN studijni_material.id_studijnimaterial%TYPE
) AS
BEGIN
    UPDATE studijni_material 
    SET nazev = p_nazev, stran = p_stran, datumzmeny = SYSDATE, popis = p_popis 
    WHERE id_studijnimaterial = p_id_studijnimaterial;
END editStudyMaterial;


PROCEDURE editStudyMaterialFile(
    p_nazev IN studijni_material.nazev%TYPE,
    p_stran IN studijni_material.stran%TYPE,
    p_popis IN studijni_material.popis%TYPE, 
    p_soubor IN studijni_material.soubor%TYPE,
    p_pripona IN studijni_material.pripona%TYPE,
    p_id_studijnimaterial IN studijni_material.id_studijnimaterial%TYPE
) AS
BEGIN
    UPDATE studijni_material 
    SET nazev = p_nazev, stran = p_stran, datumzmeny = SYSDATE, 
    popis = p_popis, soubor = p_soubor, pripona = p_pripona 
    WHERE id_studijnimaterial = p_id_studijnimaterial;
END editStudyMaterialFile;


PROCEDURE addStudyMaterialChange(
    p_uzivatel_id IN uprava_materialu.uzivatel_id%TYPE,
    p_studijni_material_id IN uprava_materialu.studijni_material_id%TYPE
) AS
BEGIN
    INSERT INTO uprava_materialu(id_upravamaterialu, datum, uzivatel_id, studijni_material_id)
    VALUES(UPRAVA_MATERIALU_SEQ.NEXTVAL, SYSDATE, p_uzivatel_id, p_studijni_material_id);
END addStudyMaterialChange;


PROCEDURE editQuiz(
    p_nazev IN kviz.nazev%TYPE,
    p_popis IN kviz.popis%TYPE,
    p_id_kviz IN kviz.id_kviz%TYPE
) AS
BEGIN
    UPDATE kviz SET nazev = p_nazev, popis = p_popis WHERE id_kviz = p_id_kviz;
END editQuiz;


PROCEDURE editQuestion(
    p_nazev IN otazka.nazev%TYPE,
    p_otazka IN otazka.otazka%TYPE,
    p_odpoved IN otazka.odpoved%TYPE,
    p_body IN otazka.body%TYPE,
    p_poradi IN otazka.poradi%TYPE,
    p_druh_otazky_id IN otazka.druh_otazky_id%TYPE,
    p_id_otazka IN otazka.id_otazka%TYPE
) AS
BEGIN
    UPDATE otazka 
    SET nazev = p_nazev, otazka = p_otazka, odpoved = p_odpoved,
    body = p_body, poradi = p_poradi, druh_otazky_id = p_druh_otazky_id 
    WHERE id_otazka = p_id_otazka;
END editQuestion;


PROCEDURE editImage(
    p_image IN uzivatel.image%TYPE,
    p_id_uzivatel IN uzivatel.id_uzivatel%TYPE
) AS
BEGIN
    UPDATE uzivatel SET image = p_image WHERE id_uzivatel = p_id_uzivatel;
END editImage;


PROCEDURE editProfileInformation(
    p_jmeno IN uzivatel.jmeno%TYPE,
    p_prijmeni IN uzivatel.prijmeni%TYPE,
    p_email IN uzivatel.email%TYPE,
    p_telefon IN uzivatel.telefon%TYPE,
    p_adresa IN uzivatel.adresa%TYPE,
    p_id_uzivatel IN uzivatel.id_uzivatel%TYPE
) AS
BEGIN
    UPDATE uzivatel
    SET jmeno = p_jmeno, prijmeni = p_prijmeni, email = p_email,
    telefon = p_telefon, adresa = p_adresa
    WHERE id_uzivatel = p_id_uzivatel;
END editProfileInformation;


PROCEDURE editLoginInformation(
    p_login IN uzivatel.login%TYPE,
    p_id_uzivatel IN uzivatel.id_uzivatel%TYPE
) AS
BEGIN
    UPDATE uzivatel SET login = p_login WHERE id_uzivatel = p_id_uzivatel;
END editLoginInformation;


PROCEDURE editLoginInformationPassword(
    p_login IN uzivatel.login%TYPE,
    p_heslo IN uzivatel.heslo%TYPE,
    p_id_uzivatel IN uzivatel.id_uzivatel%TYPE
) AS
BEGIN
    UPDATE uzivatel SET login = p_login, heslo = p_heslo WHERE id_uzivatel = p_id_uzivatel;
END editLoginInformationPassword;


PROCEDURE editComment(
    p_text IN komentar.text%TYPE,
    p_id_komentar IN komentar.id_komentar%TYPE
) AS
BEGIN
    UPDATE komentar SET text = p_text, datumzmeny = SYSDATE WHERE id_komentar = p_id_komentar;
END editComment;


PROCEDURE editStudyMaterialType(
    p_nazev IN kategorie_materialu.nazev%TYPE,
    p_zkratka IN kategorie_materialu.zkratka%TYPE,
    p_popis IN kategorie_materialu.popis%TYPE,
    p_id_kategoriematerialu IN kategorie_materialu.id_kategoriematerialu%TYPE
) AS
BEGIN
    UPDATE kategorie_materialu 
    SET nazev = p_nazev, zkratka = p_zkratka, popis = p_popis 
    WHERE id_kategoriematerialu = p_id_kategoriematerialu;
END editStudyMaterialType;


PROCEDURE editQuestionType(
    p_nazev IN druh_otazky.nazev%TYPE,
    p_zkratka IN druh_otazky.zkratka%TYPE,
    p_popis IN druh_otazky.popis%TYPE,
    p_id_druhotazky IN druh_otazky.id_druhotazky%TYPE
) AS
BEGIN
    UPDATE druh_otazky SET nazev = p_nazev, zkratka = p_zkratka, popis = p_popis
    WHERE id_druhotazky = p_id_druhotazky;
END editQuestionType;


PROCEDURE changePermission(
    p_role_id IN uzivatel.role_id%TYPE,
    p_id_uzivatel IN uzivatel.id_uzivatel%TYPE
) AS
BEGIN
    UPDATE uzivatel SET role_id = p_role_id 
    WHERE id_uzivatel = p_id_uzivatel;
END changePermission;


PROCEDURE find(
    p_title IN studijni_material.nazev%TYPE,
    p_predmet_id IN studijni_material.predmet_id%TYPE,
    p_kategorie_materialu_id IN NUMBER,
    p_uzivatel_id IN studijni_material.uzivatel_id%TYPE,
    p_data OUT SYS_REFCURSOR
) AS
BEGIN
IF p_kategorie_materialu_id = 0 THEN
    IF p_title = '%' THEN
        IF p_predmet_id != 0 AND p_uzivatel_id != 0 THEN
            OPEN p_data FOR SELECT * FROM studijni_materialy WHERE uzivatel_id = p_uzivatel_id AND predmet_id = p_predmet_id;
        ELSIF p_predmet_id = 0 AND p_uzivatel_id != 0 THEN
            OPEN p_data FOR SELECT * FROM studijni_materialy WHERE uzivatel_id = p_uzivatel_id;
        ELSIF p_uzivatel_id = 0 AND p_predmet_id != 0 THEN
            OPEN p_data FOR SELECT * FROM studijni_materialy WHERE predmet_id = p_predmet_id;
        ELSE
            OPEN p_data FOR SELECT * FROM studijni_materialy;
        END IF;
    ELSE
        IF p_predmet_id != 0 AND p_uzivatel_id != 0 THEN
            OPEN p_data FOR SELECT * FROM studijni_materialy 
            WHERE nazev LIKE '%' || p_title || '%' AND uzivatel_id = p_uzivatel_id AND predmet_id = p_predmet_id;
        ELSIF p_predmet_id = 0 AND p_uzivatel_id != 0 THEN
            OPEN p_data FOR SELECT * FROM studijni_materialy 
            WHERE nazev LIKE '%' || p_title || '%' AND uzivatel_id = p_uzivatel_id;
        ELSIF p_uzivatel_id = 0 AND p_predmet_id != 0 THEN
            OPEN p_data FOR SELECT * FROM studijni_materialy 
            WHERE nazev LIKE '%' || p_title || '%' AND predmet_id = p_predmet_id;
        ELSE
            OPEN p_data FOR SELECT * FROM studijni_materialy 
            WHERE nazev LIKE '%' || p_title || '%';
        END IF;
    END IF;
ELSE
    IF p_title = '%' THEN
        IF p_predmet_id != 0 AND p_uzivatel_id != 0 THEN
            OPEN p_data FOR SELECT * FROM kategorizace_materialu 
            INNER JOIN studijni_materialy ON kategorizace_materialu.studijni_material_id = studijni_materialy.id_studijnimaterial 
            WHERE kategorie_materialu_id = p_kategorie_materialu_id AND uzivatel_id = p_uzivatel_id AND predmet_id = p_predmet_id;
        ELSIF p_predmet_id = 0 AND p_uzivatel_id != 0 THEN
            OPEN p_data FOR SELECT * FROM kategorizace_materialu 
            INNER JOIN studijni_materialy ON kategorizace_materialu.studijni_material_id = studijni_materialy.id_studijnimaterial 
            WHERE kategorie_materialu_id = p_kategorie_materialu_id AND uzivatel_id = p_uzivatel_id;
        ELSIF p_uzivatel_id = 0 AND p_predmet_id != 0 THEN
            OPEN p_data FOR SELECT * FROM kategorizace_materialu 
            INNER JOIN studijni_materialy ON kategorizace_materialu.studijni_material_id = studijni_materialy.id_studijnimaterial 
            WHERE kategorie_materialu_id = p_kategorie_materialu_id AND predmet_id = p_predmet_id;
        ELSE
            OPEN p_data FOR SELECT * FROM kategorizace_materialu 
            INNER JOIN studijni_materialy ON kategorizace_materialu.studijni_material_id = studijni_materialy.id_studijnimaterial 
            WHERE kategorie_materialu_id = p_kategorie_materialu_id;
        END IF;
    ELSE
        IF p_predmet_id != 0 AND p_uzivatel_id != 0 THEN
            OPEN p_data FOR SELECT * FROM kategorizace_materialu 
            INNER JOIN studijni_materialy ON kategorizace_materialu.studijni_material_id = studijni_materialy.id_studijnimaterial 
            WHERE kategorie_materialu_id = p_kategorie_materialu_id AND nazev LIKE '%' || p_title || '%' 
            AND uzivatel_id = p_uzivatel_id AND predmet_id = p_predmet_id;
        ELSIF p_predmet_id = 0 AND p_uzivatel_id != 0 THEN
            OPEN p_data FOR SELECT * FROM kategorizace_materialu 
            INNER JOIN studijni_materialy ON kategorizace_materialu.studijni_material_id = studijni_materialy.id_studijnimaterial 
            WHERE kategorie_materialu_id = p_kategorie_materialu_id AND nazev LIKE '%' || p_title || '%'
            AND uzivatel_id = p_uzivatel_id;
        ELSIF p_uzivatel_id = 0 AND p_predmet_id != 0 THEN
            OPEN p_data FOR SELECT * FROM kategorizace_materialu 
            INNER JOIN studijni_materialy ON kategorizace_materialu.studijni_material_id = studijni_materialy.id_studijnimaterial 
            WHERE kategorie_materialu_id = p_kategorie_materialu_id AND nazev LIKE '%' || p_title || '%' 
            AND predmet_id = p_predmet_id;
        ELSE
            OPEN p_data FOR SELECT * FROM kategorizace_materialu 
            INNER JOIN studijni_materialy ON kategorizace_materialu.studijni_material_id = studijni_materialy.id_studijnimaterial 
            WHERE kategorie_materialu_id = p_kategorie_materialu_id AND nazev LIKE '%' || p_title || '%';
        END IF;
    END IF;
END IF;
END find;


PROCEDURE addMessage(
    p_text IN zprava.text%TYPE,
    p_sender_id IN zprava.odesilatel_id%TYPE,
    p_recipient_id IN zprava.prijemce_id%TYPE
) AS
e_id_not_found EXCEPTION;
BEGIN
    DECLARE
    v_id uzivatel.id_uzivatel%TYPE;
    BEGIN
        SELECT id_uzivatel INTO v_id FROM uzivatel WHERE id_uzivatel = p_sender_id;
        EXCEPTION WHEN NO_DATA_FOUND THEN
        RAISE e_id_not_found;
    END;
    DECLARE
    v_id uzivatel.id_uzivatel%TYPE;
    BEGIN
        SELECT id_uzivatel INTO v_id FROM uzivatel WHERE id_uzivatel = p_recipient_id;
        EXCEPTION WHEN NO_DATA_FOUND THEN
        RAISE e_id_not_found;
    END;

INSERT INTO zprava VALUES(ZPRAVA_SEQ.NEXTVAL, p_text, SYSDATE, p_sender_id, p_recipient_id);
DBMS_OUTPUT.PUT_LINE('Zpráva zapsána');

EXCEPTION
WHEN e_id_not_found THEN
DBMS_OUTPUT.PUT_LINE('Prijemce/odesilatel nenalezen');
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('Doslo k chybe');
END addMessage;


PROCEDURE getCommunications(
    p_uzivatel_id IN uzivatel.id_uzivatel%TYPE,
    p_mistnosti OUT SYS_REFCURSOR
) AS
    e_user_not_found EXCEPTION;
BEGIN
DECLARE
    v_id uzivatel.id_uzivatel%TYPE;
BEGIN
    SELECT id_uzivatel INTO v_id FROM uzivatel WHERE id_uzivatel = p_uzivatel_id;
    EXCEPTION WHEN NO_DATA_FOUND THEN
    RAISE e_user_not_found;
END;
OPEN p_mistnosti FOR
    SELECT uzivatel.jmeno, uzivatel.prijmeni, zprava.prijemce_id
    FROM zprava INNER JOIN uzivatel ON uzivatel.id_uzivatel = prijemce_id 
    WHERE zprava.odesilatel_id = p_uzivatel_id GROUP BY uzivatel.jmeno, uzivatel.prijmeni, zprava.prijemce_id
    UNION
    SELECT uzivatel.jmeno, uzivatel.prijmeni, zprava.odesilatel_id
    FROM zprava INNER JOIN uzivatel ON uzivatel.id_uzivatel = odesilatel_id 
    WHERE zprava.prijemce_id = p_uzivatel_id GROUP BY uzivatel.jmeno, uzivatel.prijmeni, zprava.odesilatel_id;
EXCEPTION
    WHEN e_user_not_found THEN
        DBMS_OUTPUT.PUT_LINE('Uzivatel nenalezen');
        RAISE;
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Doslo k chybe');
        RAISE;
END getCommunications;


PROCEDURE getCommunication(
    p_uzivatel_1 IN uzivatel.id_uzivatel%TYPE,
    p_uzivatel_2 IN uzivatel.id_uzivatel%TYPE,
    p_data OUT SYS_REFCURSOR
) AS
BEGIN
OPEN p_data FOR
    SELECT u1.jmeno odesilatel_jmeno, u1.prijmeni odesilatel_prijmeni, 
    u2.jmeno prijemce_jmeno, u2.prijmeni prijemce_prijmeni,
    id_zprava, text, datum, odesilatel_id, prijemce_id 
    FROM (SELECT * FROM zprava WHERE odesilatel_id = p_uzivatel_1 OR prijemce_id = p_uzivatel_1) 
    INNER JOIN uzivatel u1 ON u1.id_uzivatel = odesilatel_id
    INNER JOIN uzivatel u2 ON u2.id_uzivatel = prijemce_id
    WHERE odesilatel_id = p_uzivatel_2 OR prijemce_id = p_uzivatel_2 
    ORDER BY datum DESC;
END getCommunication;



PROCEDURE removeMessage(
    p_id_zprava IN zprava.id_zprava%TYPE
) AS
BEGIN
    DELETE FROM zprava WHERE id_zprava = p_id_zprava;
END removeMessage;


PROCEDURE addCloudFile (
    p_nazev IN soubor.nazev%TYPE,
    p_soubor IN soubor.soubor%TYPE,
    p_pripona IN soubor.pripona%TYPE,
    p_uzivatel_id IN soubor.uzivatel_id%TYPE
) AS 
BEGIN
    INSERT INTO soubor (id_soubor, nazev, soubor, pripona, nahrano, upraveno, uzivatel_id)
    VALUES (SOUBOR_SEQ.NEXTVAL, p_nazev, p_soubor, p_pripona, SYSDATE, SYSDATE, p_uzivatel_id);

    EXCEPTION WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END addCloudFile;


PROCEDURE editCloudFile (
    p_nazev IN soubor.nazev%TYPE,
    p_id_soubor IN soubor.id_soubor%TYPE
) AS
BEGIN
    UPDATE soubor SET nazev = p_nazev WHERE id_soubor = p_id_soubor;
END editCloudFile;


PROCEDURE getFileFromCloudFile(
    p_id_soubor IN soubor.id_soubor%TYPE,
    p_soubor OUT soubor.soubor%TYPE
) AS
BEGIN
    SELECT soubor INTO p_soubor FROM soubor WHERE id_soubor = p_id_soubor;
END getFileFromCloudFile;

PROCEDURE removeCloudFile(
    p_id_soubor IN soubor.id_soubor%TYPE
) AS
BEGIN
    DELETE FROM soubor WHERE id_soubor = p_id_soubor;
END removeCloudFile;


PROCEDURE removeForbiddenWord(
    p_id_nevhodne_slovo IN nevhodne_slovo.id_nevhodne_slovo%TYPE
) AS
BEGIN
    DELETE FROM nevhodne_slovo WHERE id_nevhodne_slovo = p_id_nevhodne_slovo;
END removeForbiddenWord;


PROCEDURE addForbiddenWord(
    p_text IN nevhodne_slovo.text%TYPE
) AS
BEGIN
    INSERT INTO nevhodne_slovo (id_nevhodne_slovo, text) VALUES (NEVHODNE_SLOVO_SEQ.NEXTVAL, p_text);
END addForbiddenWord;


PROCEDURE addGroup(
    p_rok_studia IN skupina.rok_studia%TYPE,
    p_obor IN skupina.obor%TYPE
) AS
BEGIN
    INSERT INTO skupina (id_skupina, rok_studia, obor) VALUES (SKUPINA_SEQ.NEXTVAL, p_rok_studia, p_obor);
END addGroup;

PROCEDURE editGroup(
    p_rok_studia IN skupina.rok_studia%TYPE,
    p_obor IN skupina.obor%TYPE,
    p_id_skupina IN skupina.id_skupina%TYPE
) AS
BEGIN
    UPDATE skupina SET rok_studia = p_rok_studia, obor = p_obor WHERE id_skupina = p_id_skupina;
END editGroup;

PROCEDURE removeGroup(
    p_id_skupina IN skupina.id_skupina%TYPE
) AS
BEGIN
    DELETE FROM skupina WHERE id_skupina = p_id_skupina;
END removeGroup;


PROCEDURE addUserToGroup(
    p_uzivatel_id IN uzivatele_skupiny.uzivatel_id%TYPE,
    p_skupina_id IN uzivatele_skupiny.skupina_id%TYPE
) AS
BEGIN
    INSERT INTO uzivatele_skupiny (uzivatel_id, skupina_id) VALUES (p_uzivatel_id, p_skupina_id);
END addUserToGroup;

PROCEDURE removeUserFromGroup(
    p_uzivatel_id IN uzivatele_skupiny.uzivatel_id%TYPE,
    p_skupina_id IN uzivatele_skupiny.skupina_id%TYPE
) AS
BEGIN
    DELETE FROM uzivatele_skupiny WHERE uzivatel_id = p_uzivatel_id AND skupina_id = p_skupina_id;
END removeUserFromGroup;

PROCEDURE addSubjectToGroup(
    p_predmet_id IN predmety_skupiny.predmet_id%TYPE,
    p_skupina_id IN predmety_skupiny.skupina_id%TYPE
) AS
BEGIN
    INSERT INTO predmety_skupiny (skupina_id, predmet_id) VALUES (p_skupina_id, p_predmet_id);
END addSubjectToGroup;

PROCEDURE removeSubjectFromGroup(
    p_predmet_id IN predmety_skupiny.predmet_id%TYPE,
    p_skupina_id IN predmety_skupiny.skupina_id%TYPE
) AS
BEGIN
    DELETE FROM predmety_skupiny WHERE skupina_id = p_skupina_id AND predmet_id = p_predmet_id;
END removeSubjectFromGroup;

PROCEDURE submitQuiz(
    p_uzivatel_id vyplneny_kviz.uzivatel_id%TYPE,
    p_kviz_id vyplneny_kviz.kviz_id%TYPE,
    p_body vyplneny_kviz.kviz_id%TYPE,
    p_odpoved ELSA.STRING_ARRAY,
    p_otazka_id ELSA.STRING_ARRAY
) AS
    e_error EXCEPTION;
    v_max_body otazka.body%TYPE;
    v_vyplneny_kviz_id vyplneny_kviz.id_vyplneny_kviz%TYPE;
BEGIN
    SELECT SUM(body) INTO v_max_body FROM otazka WHERE kviz_id = p_kviz_id;

    INSERT INTO vyplneny_kviz(id_vyplneny_kviz, body, max_body, uzivatel_id, kviz_id) 
    VALUES(VYPLNENY_KVIZ_SEQ.NEXTVAL, p_body, v_max_body, p_uzivatel_id, p_kviz_id);
    v_vyplneny_kviz_id := VYPLNENY_KVIZ_SEQ.CURRVAL;

    IF p_otazka_id.COUNT <> p_odpoved.COUNT THEN
        RAISE e_error;
    END IF;

    FOR i IN 1..p_otazka_id.COUNT
    LOOP
        INSERT INTO vyplnena_otazka(id_vyplnena_otazka, odpoved, otazka_id, vyplneny_kviz_id)
        VALUES(VYPLNENA_OTAZKA_SEQ.NEXTVAL, p_odpoved(i), TO_NUMBER(p_otazka_id(i)), v_vyplneny_kviz_id);
    END LOOP;

    EXCEPTION WHEN e_error THEN
        ROLLBACK;
        RAISE;
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END submitQuiz;


PROCEDURE getUsersEvaluationOnSubject(
    p_predmet_id IN studijni_material.predmet_id%TYPE,
    p_uzivatele OUT SYS_REFCURSOR
) AS
    v_sum_body NUMBER;
    v_count_kvizy NUMBER;
BEGIN

    SELECT SUM(body) INTO v_sum_body FROM otazka 
    INNER JOIN kviz ON otazka.kviz_id = kviz.id_kviz 
    INNER JOIN studijni_material ON kviz.studijni_material_id = studijni_material.id_studijnimaterial 
    WHERE studijni_material.predmet_id = p_predmet_id;

    SELECT COUNT(id_kviz) INTO v_count_kvizy FROM kviz
    INNER JOIN studijni_material ON kviz.studijni_material_id = studijni_material.id_studijnimaterial 
    WHERE studijni_material.predmet_id = p_predmet_id;

    OPEN p_uzivatele FOR 
        SELECT uzivatel_id, jmeno, prijmeni, 
        SUM(VYPLNENE_KVIZY.body) AS "ziskano_bodu", 
        COUNT(VYPLNENE_KVIZY.body) AS "splnenych_kvizu",
        v_sum_body AS "max_body",
        v_count_kvizy AS "max_kvizu"
        FROM VYPLNENE_KVIZY 
        WHERE predmet_id = p_predmet_id 
        GROUP BY uzivatel_id, jmeno, prijmeni;

    EXCEPTION WHEN TOO_MANY_ROWS THEN
        ROLLBACK;
        RAISE;

END getUsersEvaluationOnSubject;


PROCEDURE getUserEvaluationOnSubject(
    p_predmet_id IN studijni_material.predmet_id%TYPE,
    p_uzivatel_id IN vyplneny_kviz.uzivatel_id%TYPE,
    p_uzivatele OUT SYS_REFCURSOR
) AS
    v_sum_body NUMBER;
    v_count_kvizy NUMBER;
BEGIN

    SELECT SUM(body) INTO v_sum_body FROM otazka 
    INNER JOIN kviz ON otazka.kviz_id = kviz.id_kviz 
    INNER JOIN studijni_material ON kviz.studijni_material_id = studijni_material.id_studijnimaterial 
    WHERE studijni_material.predmet_id = p_predmet_id;

    SELECT COUNT(id_kviz) INTO v_count_kvizy FROM kviz
    INNER JOIN studijni_material ON kviz.studijni_material_id = studijni_material.id_studijnimaterial 
    WHERE studijni_material.predmet_id = p_predmet_id;

    OPEN p_uzivatele FOR 
        SELECT uzivatel_id, jmeno, prijmeni, 
        SUM(VYPLNENE_KVIZY.body) AS "ziskano_bodu", 
        COUNT(VYPLNENE_KVIZY.body) AS "splnenych_kvizu",
        v_sum_body AS "max_body",
        v_count_kvizy AS "max_kvizu"
        FROM VYPLNENE_KVIZY 
        WHERE predmet_id = p_predmet_id AND uzivatel_id = p_uzivatel_id
        GROUP BY uzivatel_id, jmeno, prijmeni;

    EXCEPTION WHEN TOO_MANY_ROWS THEN
        ROLLBACK;
        RAISE;

END getUserEvaluationOnSubject;

PROCEDURE finalEvaluation(
    p_user_id IN uzivatel.id_uzivatel%TYPE,
    p_group_id IN skupina.id_skupina%TYPE
) AS 
    v_first_name uzivatel.jmeno%TYPE;
    v_last_name uzivatel.prijmeni%TYPE;
BEGIN
    SELECT jmeno, prijmeni INTO v_first_name, v_last_name FROM uzivatel WHERE id_uzivatel = p_user_id;

    DBMS_OUTPUT.PUT_LINE('Vysvìdèení studenta: ' || v_first_name || ' ' || v_last_name);
    FOR x IN (
    SELECT predmet.nazev title, predmet.zkratka shortcut, ROUND(evaluateSubject(p_user_id, predmet_id)) avg
    FROM predmety_skupiny
    INNER JOIN predmet ON id_predmet = predmet_id
    WHERE skupina_id = p_group_id) 
    LOOP
        
         DBMS_OUTPUT.PUT('Pøedmìt: ' || x.title || ' (' || x.shortcut || ') Prùmìr: ' || x.avg || '% ');
        IF x.avg >= 95 THEN
         DBMS_OUTPUT.PUT_LINE('Známka: A');
        ELSIF x.avg >= 90 AND x.avg < 95 THEN
         DBMS_OUTPUT.PUT_LINE('Známka: B');
         ELSIF x.avg >= 85 AND x.avg < 90 THEN
         DBMS_OUTPUT.PUT_LINE('Známka: C');
         ELSIF x.avg >= 80 AND x.avg < 85 THEN
         DBMS_OUTPUT.PUT_LINE('Známka: D');
         ELSIF x.avg >= 70 AND x.avg < 80 THEN
         DBMS_OUTPUT.PUT_LINE('Známka: E');
         ELSE
         DBMS_OUTPUT.PUT_LINE('Známka: F');
        END IF;
    END LOOP;
END finalEvaluation;

END ELSA;

/
--------------------------------------------------------
--  Constraints for Table DRUH_OTAZKY
--------------------------------------------------------

  ALTER TABLE "ST58214"."DRUH_OTAZKY" MODIFY ("ID_DRUHOTAZKY" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."DRUH_OTAZKY" MODIFY ("NAZEV" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."DRUH_OTAZKY" MODIFY ("ZKRATKA" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."DRUH_OTAZKY" ADD CONSTRAINT "DRUH_OTAZKY_PK" PRIMARY KEY ("ID_DRUHOTAZKY")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "STUDENTI"  ENABLE;
--------------------------------------------------------
--  Constraints for Table KATEGORIE_MATERIALU
--------------------------------------------------------

  ALTER TABLE "ST58214"."KATEGORIE_MATERIALU" MODIFY ("ID_KATEGORIEMATERIALU" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."KATEGORIE_MATERIALU" MODIFY ("NAZEV" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."KATEGORIE_MATERIALU" MODIFY ("ZKRATKA" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."KATEGORIE_MATERIALU" ADD CONSTRAINT "KATEGORIE_MATERIALU_PK" PRIMARY KEY ("ID_KATEGORIEMATERIALU")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "STUDENTI"  ENABLE;
--------------------------------------------------------
--  Constraints for Table KATEGORIZACE_MATERIALU
--------------------------------------------------------

  ALTER TABLE "ST58214"."KATEGORIZACE_MATERIALU" MODIFY ("STUDIJNI_MATERIAL_ID" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."KATEGORIZACE_MATERIALU" MODIFY ("KATEGORIE_MATERIALU_ID" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."KATEGORIZACE_MATERIALU" ADD CONSTRAINT "KATEGORIZACE_MATERIALU_PK" PRIMARY KEY ("STUDIJNI_MATERIAL_ID", "KATEGORIE_MATERIALU_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "STUDENTI"  ENABLE;
--------------------------------------------------------
--  Constraints for Table KOMENTAR
--------------------------------------------------------

  ALTER TABLE "ST58214"."KOMENTAR" MODIFY ("ID_KOMENTAR" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."KOMENTAR" MODIFY ("TEXT" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."KOMENTAR" MODIFY ("DATUMPRIDANI" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."KOMENTAR" MODIFY ("DATUMZMENY" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."KOMENTAR" MODIFY ("STUDIJNI_MATERIAL_ID" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."KOMENTAR" MODIFY ("UZIVATEL_ID" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."KOMENTAR" ADD CONSTRAINT "KOMENTAR_PK" PRIMARY KEY ("ID_KOMENTAR")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "STUDENTI"  ENABLE;
--------------------------------------------------------
--  Constraints for Table KVIZ
--------------------------------------------------------

  ALTER TABLE "ST58214"."KVIZ" MODIFY ("ID_KVIZ" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."KVIZ" MODIFY ("NAZEV" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."KVIZ" MODIFY ("STUDIJNI_MATERIAL_ID" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."KVIZ" MODIFY ("UZIVATEL_ID" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."KVIZ" ADD CONSTRAINT "KVIZ_PK" PRIMARY KEY ("ID_KVIZ")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "STUDENTI"  ENABLE;
--------------------------------------------------------
--  Constraints for Table NEVHODNE_SLOVO
--------------------------------------------------------

  ALTER TABLE "ST58214"."NEVHODNE_SLOVO" MODIFY ("ID_NEVHODNE_SLOVO" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."NEVHODNE_SLOVO" MODIFY ("TEXT" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."NEVHODNE_SLOVO" ADD CONSTRAINT "NEVHODNE_SLOVO_PK" PRIMARY KEY ("ID_NEVHODNE_SLOVO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "STUDENTI"  ENABLE;
--------------------------------------------------------
--  Constraints for Table OTAZKA
--------------------------------------------------------

  ALTER TABLE "ST58214"."OTAZKA" MODIFY ("ID_OTAZKA" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."OTAZKA" MODIFY ("NAZEV" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."OTAZKA" MODIFY ("OTAZKA" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."OTAZKA" MODIFY ("BODY" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."OTAZKA" MODIFY ("PORADI" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."OTAZKA" MODIFY ("KVIZ_ID" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."OTAZKA" MODIFY ("DRUH_OTAZKY_ID" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."OTAZKA" MODIFY ("UZIVATEL_ID" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."OTAZKA" ADD CONSTRAINT "OTAZKA_PK" PRIMARY KEY ("ID_OTAZKA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "STUDENTI"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PREDMET
--------------------------------------------------------

  ALTER TABLE "ST58214"."PREDMET" MODIFY ("ID_PREDMET" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."PREDMET" MODIFY ("NAZEV" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."PREDMET" MODIFY ("ZKRATKA" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."PREDMET" ADD CONSTRAINT "PREDMET_PK" PRIMARY KEY ("ID_PREDMET")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "STUDENTI"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PREDMETY_SKUPINY
--------------------------------------------------------

  ALTER TABLE "ST58214"."PREDMETY_SKUPINY" MODIFY ("SKUPINA_ID" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."PREDMETY_SKUPINY" MODIFY ("PREDMET_ID" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."PREDMETY_SKUPINY" ADD CONSTRAINT "PREDMETY_SKUPINY_PK" PRIMARY KEY ("SKUPINA_ID", "PREDMET_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "STUDENTI"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PREDMETY_UZIVATELE
--------------------------------------------------------

  ALTER TABLE "ST58214"."PREDMETY_UZIVATELE" MODIFY ("UZIVATEL_ID" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."PREDMETY_UZIVATELE" MODIFY ("PREDMET_ID" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."PREDMETY_UZIVATELE" ADD CONSTRAINT "PREDMETY_UZIVATELE_PK" PRIMARY KEY ("UZIVATEL_ID", "PREDMET_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "STUDENTI"  ENABLE;
--------------------------------------------------------
--  Constraints for Table ROLE
--------------------------------------------------------

  ALTER TABLE "ST58214"."ROLE" MODIFY ("ID_ROLE" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."ROLE" MODIFY ("NAZEV" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."ROLE" MODIFY ("OPRAVNENI" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."ROLE" ADD CONSTRAINT "ROLE_PK" PRIMARY KEY ("ID_ROLE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "STUDENTI"  ENABLE;
--------------------------------------------------------
--  Constraints for Table SKUPINA
--------------------------------------------------------

  ALTER TABLE "ST58214"."SKUPINA" MODIFY ("ID_SKUPINA" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."SKUPINA" MODIFY ("ROK_STUDIA" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."SKUPINA" MODIFY ("OBOR" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."SKUPINA" ADD CONSTRAINT "SKUPINA_PK" PRIMARY KEY ("ID_SKUPINA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "STUDENTI"  ENABLE;
--------------------------------------------------------
--  Constraints for Table SOUBOR
--------------------------------------------------------

  ALTER TABLE "ST58214"."SOUBOR" MODIFY ("ID_SOUBOR" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."SOUBOR" MODIFY ("NAZEV" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."SOUBOR" MODIFY ("SOUBOR" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."SOUBOR" MODIFY ("PRIPONA" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."SOUBOR" MODIFY ("NAHRANO" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."SOUBOR" MODIFY ("UPRAVENO" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."SOUBOR" MODIFY ("UZIVATEL_ID" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."SOUBOR" ADD CONSTRAINT "SOUBOR_PK" PRIMARY KEY ("ID_SOUBOR")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "STUDENTI"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STUDIJNI_MATERIAL
--------------------------------------------------------

  ALTER TABLE "ST58214"."STUDIJNI_MATERIAL" MODIFY ("ID_STUDIJNIMATERIAL" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."STUDIJNI_MATERIAL" MODIFY ("NAZEV" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."STUDIJNI_MATERIAL" MODIFY ("STRAN" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."STUDIJNI_MATERIAL" MODIFY ("DATUMVYTVORENI" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."STUDIJNI_MATERIAL" MODIFY ("DATUMZMENY" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."STUDIJNI_MATERIAL" MODIFY ("PREDMET_ID" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."STUDIJNI_MATERIAL" MODIFY ("UZIVATEL_ID" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."STUDIJNI_MATERIAL" ADD CONSTRAINT "STUDIJNI_MATERIAL_PK" PRIMARY KEY ("ID_STUDIJNIMATERIAL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "STUDENTI"  ENABLE;
--------------------------------------------------------
--  Constraints for Table UPRAVA_MATERIALU
--------------------------------------------------------

  ALTER TABLE "ST58214"."UPRAVA_MATERIALU" MODIFY ("ID_UPRAVAMATERIALU" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."UPRAVA_MATERIALU" MODIFY ("DATUM" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."UPRAVA_MATERIALU" MODIFY ("UZIVATEL_ID" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."UPRAVA_MATERIALU" MODIFY ("STUDIJNI_MATERIAL_ID" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."UPRAVA_MATERIALU" ADD CONSTRAINT "UPRAVA_MATERIALU_PK" PRIMARY KEY ("ID_UPRAVAMATERIALU")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "STUDENTI"  ENABLE;
--------------------------------------------------------
--  Constraints for Table UZIVATEL
--------------------------------------------------------

  ALTER TABLE "ST58214"."UZIVATEL" MODIFY ("ID_UZIVATEL" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."UZIVATEL" MODIFY ("LOGIN" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."UZIVATEL" MODIFY ("HESLO" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."UZIVATEL" MODIFY ("JMENO" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."UZIVATEL" MODIFY ("PRIJMENI" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."UZIVATEL" MODIFY ("EMAIL" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."UZIVATEL" ADD CONSTRAINT "UZIVATEL_PK" PRIMARY KEY ("ID_UZIVATEL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "STUDENTI"  ENABLE;
--------------------------------------------------------
--  Constraints for Table UZIVATELE_SKUPINY
--------------------------------------------------------

  ALTER TABLE "ST58214"."UZIVATELE_SKUPINY" MODIFY ("UZIVATEL_ID" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."UZIVATELE_SKUPINY" MODIFY ("SKUPINA_ID" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."UZIVATELE_SKUPINY" ADD CONSTRAINT "UZIVATELE_SKUPINY_PK" PRIMARY KEY ("UZIVATEL_ID", "SKUPINA_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "STUDENTI"  ENABLE;
--------------------------------------------------------
--  Constraints for Table VYPLNENA_OTAZKA
--------------------------------------------------------

  ALTER TABLE "ST58214"."VYPLNENA_OTAZKA" MODIFY ("ID_VYPLNENA_OTAZKA" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."VYPLNENA_OTAZKA" MODIFY ("ODPOVED" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."VYPLNENA_OTAZKA" MODIFY ("OTAZKA_ID" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."VYPLNENA_OTAZKA" MODIFY ("VYPLNENY_KVIZ_ID" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."VYPLNENA_OTAZKA" ADD CONSTRAINT "VYPLNENA_OTAZKA_PK" PRIMARY KEY ("ID_VYPLNENA_OTAZKA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "STUDENTI"  ENABLE;
--------------------------------------------------------
--  Constraints for Table VYPLNENY_KVIZ
--------------------------------------------------------

  ALTER TABLE "ST58214"."VYPLNENY_KVIZ" MODIFY ("ID_VYPLNENY_KVIZ" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."VYPLNENY_KVIZ" MODIFY ("BODY" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."VYPLNENY_KVIZ" MODIFY ("MAX_BODY" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."VYPLNENY_KVIZ" MODIFY ("UZIVATEL_ID" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."VYPLNENY_KVIZ" MODIFY ("KVIZ_ID" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."VYPLNENY_KVIZ" ADD CONSTRAINT "VYPLNENY_KVIZ_PK" PRIMARY KEY ("ID_VYPLNENY_KVIZ")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "STUDENTI"  ENABLE;
--------------------------------------------------------
--  Constraints for Table ZPRAVA
--------------------------------------------------------

  ALTER TABLE "ST58214"."ZPRAVA" MODIFY ("ID_ZPRAVA" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."ZPRAVA" MODIFY ("TEXT" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."ZPRAVA" MODIFY ("DATUM" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."ZPRAVA" MODIFY ("ODESILATEL_ID" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."ZPRAVA" MODIFY ("PRIJEMCE_ID" NOT NULL ENABLE);
  ALTER TABLE "ST58214"."ZPRAVA" ADD CONSTRAINT "ZPRAVA_PK" PRIMARY KEY ("ID_ZPRAVA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "STUDENTI"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table KATEGORIZACE_MATERIALU
--------------------------------------------------------

  ALTER TABLE "ST58214"."KATEGORIZACE_MATERIALU" ADD CONSTRAINT "KM_KATEGORIE_MATERIALU_FK" FOREIGN KEY ("KATEGORIE_MATERIALU_ID")
	  REFERENCES "ST58214"."KATEGORIE_MATERIALU" ("ID_KATEGORIEMATERIALU") ENABLE;
  ALTER TABLE "ST58214"."KATEGORIZACE_MATERIALU" ADD CONSTRAINT "KM_STUDIJNI_MATERIAL_FK" FOREIGN KEY ("STUDIJNI_MATERIAL_ID")
	  REFERENCES "ST58214"."STUDIJNI_MATERIAL" ("ID_STUDIJNIMATERIAL") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table KOMENTAR
--------------------------------------------------------

  ALTER TABLE "ST58214"."KOMENTAR" ADD CONSTRAINT "K_STUDIJNI_MATERIAL_FKV1" FOREIGN KEY ("STUDIJNI_MATERIAL_ID")
	  REFERENCES "ST58214"."STUDIJNI_MATERIAL" ("ID_STUDIJNIMATERIAL") ON DELETE CASCADE ENABLE;
  ALTER TABLE "ST58214"."KOMENTAR" ADD CONSTRAINT "K_UZIVATEL_FKV1" FOREIGN KEY ("UZIVATEL_ID")
	  REFERENCES "ST58214"."UZIVATEL" ("ID_UZIVATEL") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table KVIZ
--------------------------------------------------------

  ALTER TABLE "ST58214"."KVIZ" ADD CONSTRAINT "K_STUDIJNI_MATERIAL_FK" FOREIGN KEY ("STUDIJNI_MATERIAL_ID")
	  REFERENCES "ST58214"."STUDIJNI_MATERIAL" ("ID_STUDIJNIMATERIAL") ON DELETE CASCADE ENABLE;
  ALTER TABLE "ST58214"."KVIZ" ADD CONSTRAINT "K_UZIVATEL_FK" FOREIGN KEY ("UZIVATEL_ID")
	  REFERENCES "ST58214"."UZIVATEL" ("ID_UZIVATEL") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table OTAZKA
--------------------------------------------------------

  ALTER TABLE "ST58214"."OTAZKA" ADD CONSTRAINT "OTAZKA_DRUH_OTAZKY_FK" FOREIGN KEY ("DRUH_OTAZKY_ID")
	  REFERENCES "ST58214"."DRUH_OTAZKY" ("ID_DRUHOTAZKY") ENABLE;
  ALTER TABLE "ST58214"."OTAZKA" ADD CONSTRAINT "OTAZKA_KVIZ_FK" FOREIGN KEY ("KVIZ_ID")
	  REFERENCES "ST58214"."KVIZ" ("ID_KVIZ") ON DELETE CASCADE ENABLE;
  ALTER TABLE "ST58214"."OTAZKA" ADD CONSTRAINT "OTAZKA_UZIVATEL_FK" FOREIGN KEY ("UZIVATEL_ID")
	  REFERENCES "ST58214"."UZIVATEL" ("ID_UZIVATEL") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PREDMETY_SKUPINY
--------------------------------------------------------

  ALTER TABLE "ST58214"."PREDMETY_SKUPINY" ADD CONSTRAINT "PREDMETY_SKUPINY_PREDMET_FK" FOREIGN KEY ("PREDMET_ID")
	  REFERENCES "ST58214"."PREDMET" ("ID_PREDMET") ON DELETE CASCADE ENABLE;
  ALTER TABLE "ST58214"."PREDMETY_SKUPINY" ADD CONSTRAINT "PREDMETY_SKUPINY_SKUPINA_FK" FOREIGN KEY ("SKUPINA_ID")
	  REFERENCES "ST58214"."SKUPINA" ("ID_SKUPINA") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PREDMETY_UZIVATELE
--------------------------------------------------------

  ALTER TABLE "ST58214"."PREDMETY_UZIVATELE" ADD CONSTRAINT "PU_P_FK" FOREIGN KEY ("PREDMET_ID")
	  REFERENCES "ST58214"."PREDMET" ("ID_PREDMET") ON DELETE CASCADE ENABLE;
  ALTER TABLE "ST58214"."PREDMETY_UZIVATELE" ADD CONSTRAINT "PU_U_FK" FOREIGN KEY ("UZIVATEL_ID")
	  REFERENCES "ST58214"."UZIVATEL" ("ID_UZIVATEL") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SOUBOR
--------------------------------------------------------

  ALTER TABLE "ST58214"."SOUBOR" ADD CONSTRAINT "SOUBOR_UZIVATEL_FK" FOREIGN KEY ("UZIVATEL_ID")
	  REFERENCES "ST58214"."UZIVATEL" ("ID_UZIVATEL") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table STUDIJNI_MATERIAL
--------------------------------------------------------

  ALTER TABLE "ST58214"."STUDIJNI_MATERIAL" ADD CONSTRAINT "SM_PREDMET_FK" FOREIGN KEY ("PREDMET_ID")
	  REFERENCES "ST58214"."PREDMET" ("ID_PREDMET") ON DELETE CASCADE ENABLE;
  ALTER TABLE "ST58214"."STUDIJNI_MATERIAL" ADD CONSTRAINT "SM_UZIVATEL_FK" FOREIGN KEY ("UZIVATEL_ID")
	  REFERENCES "ST58214"."UZIVATEL" ("ID_UZIVATEL") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table UPRAVA_MATERIALU
--------------------------------------------------------

  ALTER TABLE "ST58214"."UPRAVA_MATERIALU" ADD CONSTRAINT "UM_STUDIJNI_MATERIAL_FK" FOREIGN KEY ("STUDIJNI_MATERIAL_ID")
	  REFERENCES "ST58214"."STUDIJNI_MATERIAL" ("ID_STUDIJNIMATERIAL") ON DELETE CASCADE ENABLE;
  ALTER TABLE "ST58214"."UPRAVA_MATERIALU" ADD CONSTRAINT "UM_UZIVATEL_FK" FOREIGN KEY ("UZIVATEL_ID")
	  REFERENCES "ST58214"."UZIVATEL" ("ID_UZIVATEL") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table UZIVATEL
--------------------------------------------------------

  ALTER TABLE "ST58214"."UZIVATEL" ADD CONSTRAINT "UZIVATEL_ROLE_FK" FOREIGN KEY ("ROLE_ID")
	  REFERENCES "ST58214"."ROLE" ("ID_ROLE") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table UZIVATELE_SKUPINY
--------------------------------------------------------

  ALTER TABLE "ST58214"."UZIVATELE_SKUPINY" ADD CONSTRAINT "UZIVATELE_SKUPINY_SKUPINA_FK" FOREIGN KEY ("SKUPINA_ID")
	  REFERENCES "ST58214"."SKUPINA" ("ID_SKUPINA") ON DELETE CASCADE ENABLE;
  ALTER TABLE "ST58214"."UZIVATELE_SKUPINY" ADD CONSTRAINT "UZIVATELE_SKUPINY_UZIVATEL_FK" FOREIGN KEY ("UZIVATEL_ID")
	  REFERENCES "ST58214"."UZIVATEL" ("ID_UZIVATEL") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table VYPLNENA_OTAZKA
--------------------------------------------------------

  ALTER TABLE "ST58214"."VYPLNENA_OTAZKA" ADD CONSTRAINT "VYPLNENA_OTAZKA_OTAZKA_FK" FOREIGN KEY ("OTAZKA_ID")
	  REFERENCES "ST58214"."OTAZKA" ("ID_OTAZKA") ON DELETE CASCADE ENABLE;
  ALTER TABLE "ST58214"."VYPLNENA_OTAZKA" ADD CONSTRAINT "VYPLNENA_OTAZKA_V_K_FK" FOREIGN KEY ("VYPLNENY_KVIZ_ID")
	  REFERENCES "ST58214"."VYPLNENY_KVIZ" ("ID_VYPLNENY_KVIZ") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table VYPLNENY_KVIZ
--------------------------------------------------------

  ALTER TABLE "ST58214"."VYPLNENY_KVIZ" ADD CONSTRAINT "VYPLNENY_KVIZ_KVIZ_FK" FOREIGN KEY ("KVIZ_ID")
	  REFERENCES "ST58214"."KVIZ" ("ID_KVIZ") ON DELETE CASCADE ENABLE;
  ALTER TABLE "ST58214"."VYPLNENY_KVIZ" ADD CONSTRAINT "VYPLNENY_KVIZ_UZIVATEL_FK" FOREIGN KEY ("UZIVATEL_ID")
	  REFERENCES "ST58214"."UZIVATEL" ("ID_UZIVATEL") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ZPRAVA
--------------------------------------------------------

  ALTER TABLE "ST58214"."ZPRAVA" ADD CONSTRAINT "ZPRAVA_UZIVATEL_O_FK" FOREIGN KEY ("ODESILATEL_ID")
	  REFERENCES "ST58214"."UZIVATEL" ("ID_UZIVATEL") ON DELETE CASCADE ENABLE;
  ALTER TABLE "ST58214"."ZPRAVA" ADD CONSTRAINT "ZPRAVA_UZIVATEL_P_FK" FOREIGN KEY ("PRIJEMCE_ID")
	  REFERENCES "ST58214"."UZIVATEL" ("ID_UZIVATEL") ON DELETE CASCADE ENABLE;
