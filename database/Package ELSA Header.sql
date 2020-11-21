--------------------------------------------------------
--  File created - Sobota-listopadu-21-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Package ELSA
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "ST58214"."ELSA" AS
FUNCTION getPassword(
p_login IN uzivatel.login%TYPE
) RETURN uzivatel.heslo%TYPE;
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
END ELSA;

/
