--------------------------------------------------------
--  File created - Ètvrtek-listopadu-26-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Package Body ELSA
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "ST58214"."ELSA" AS

FUNCTION getPassword(p_login IN uzivatel.login%TYPE) RETURN uzivatel.heslo%TYPE AS v_password uzivatel.heslo%TYPE;
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
INSERT INTO studijni_material(id_studijniMaterial, nazev, stran, datumvytvoreni, datumzmeny, popis, soubor, pripona, predmet_id, uzivatel_id)
VALUES(STUDIJNI_MATERIAL_SEQ.NEXTVAL, p_nazev, p_stran, SYSDATE, SYSDATE, p_popis, p_soubor, p_pripona, p_predmet_id, p_uzivatel_id);
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
INSERT INTO OTAZKA(id_otazka, nazev, otazka, odpoved, body, poradi, kviz_id, druh_otazky_id, uzivatel_id)
VALUES(OTAZKA_SEQ.NEXTVAL, p_nazev, p_otazka, p_odpoved, p_body, p_poradi, p_kviz_id, p_druh_otazky_id, p_uzivatel_id);
END addQuestion;


PROCEDURE addComment(
p_text IN komentar.text%TYPE,
p_studijni_material_id IN komentar.studijni_material_id%TYPE,
p_uzivatel_id IN komentar.uzivatel_id%TYPE
) AS
BEGIN
INSERT INTO komentar(id_komentar, text, datumpridani, datumzmeny, studijni_material_id, uzivatel_id) 
VALUES(KOMENTAR_SEQ.NEXTVAL, p_text, SYSDATE, SYSDATE, p_studijni_material_id, p_uzivatel_id);
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
DELETE FROM kategorizace_materialu WHERE studijni_material_id = p_studijni_material_id AND kategorie_materialu_id = p_kategorie_materialu_id;
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
UPDATE predmet SET nazev = p_nazev, zkratka = p_zkratka, popis = p_popis WHERE id_predmet = p_id_predmet;
END editSubject;


PROCEDURE editStudyMaterial(
p_nazev IN studijni_material.nazev%TYPE,
p_stran IN studijni_material.stran%TYPE,
p_popis IN studijni_material.popis%TYPE,
p_id_studijnimaterial IN studijni_material.id_studijnimaterial%TYPE
) AS
BEGIN
UPDATE studijni_material SET nazev = p_nazev, stran = p_stran, datumzmeny = SYSDATE, popis = p_popis WHERE id_studijnimaterial = p_id_studijnimaterial;
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
UPDATE studijni_material SET nazev = p_nazev, stran = p_stran, datumzmeny = SYSDATE, popis = p_popis, soubor = p_soubor, pripona = p_pripona WHERE id_studijnimaterial = p_id_studijnimaterial;
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
UPDATE otazka SET nazev = p_nazev, otazka = p_otazka, odpoved = p_odpoved, body = p_body, poradi = p_poradi, druh_otazky_id = p_druh_otazky_id WHERE id_otazka = p_id_otazka;
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
UPDATE uzivatel SET jmeno = p_jmeno, prijmeni = p_prijmeni, email = p_email, telefon = p_telefon, adresa = p_adresa WHERE id_uzivatel = p_id_uzivatel;
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
UPDATE kategorie_materialu SET nazev = p_nazev, zkratka = p_zkratka, popis = p_popis WHERE id_kategoriematerialu = p_id_kategoriematerialu;
END editStudyMaterialType;


PROCEDURE editQuestionType(
p_nazev IN druh_otazky.nazev%TYPE,
p_zkratka IN druh_otazky.zkratka%TYPE,
p_popis IN druh_otazky.popis%TYPE,
p_id_druhotazky IN druh_otazky.id_druhotazky%TYPE
) AS
BEGIN
UPDATE druh_otazky SET nazev = p_nazev, zkratka = p_zkratka, popis = p_popis WHERE id_druhotazky = p_id_druhotazky;
END editQuestionType;


PROCEDURE changePermission(
p_role_id IN uzivatel.role_id%TYPE,
p_id_uzivatel IN uzivatel.id_uzivatel%TYPE
) AS
BEGIN
UPDATE uzivatel SET role_id = p_role_id WHERE id_uzivatel = p_id_uzivatel;
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
            OPEN p_data FOR SELECT * FROM studijni_materialy WHERE nazev LIKE '%' || p_title || '%' AND uzivatel_id = p_uzivatel_id AND predmet_id = p_predmet_id;
        ELSIF p_predmet_id = 0 AND p_uzivatel_id != 0 THEN
            OPEN p_data FOR SELECT * FROM studijni_materialy WHERE nazev LIKE '%' || p_title || '%' AND uzivatel_id = p_uzivatel_id;
        ELSIF p_uzivatel_id = 0 AND p_predmet_id != 0 THEN
            OPEN p_data FOR SELECT * FROM studijni_materialy WHERE nazev LIKE '%' || p_title || '%' AND predmet_id = p_predmet_id;
        ELSE
            OPEN p_data FOR SELECT * FROM studijni_materialy WHERE nazev LIKE '%' || p_title || '%';
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
            WHERE kategorie_materialu_id = p_kategorie_materialu_id AND nazev LIKE '%' || p_title || '%' AND uzivatel_id = p_uzivatel_id AND predmet_id = p_predmet_id;
        ELSIF p_predmet_id = 0 AND p_uzivatel_id != 0 THEN
            OPEN p_data FOR SELECT * FROM kategorizace_materialu 
            INNER JOIN studijni_materialy ON kategorizace_materialu.studijni_material_id = studijni_materialy.id_studijnimaterial 
            WHERE kategorie_materialu_id = p_kategorie_materialu_id AND nazev LIKE '%' || p_title || '%' AND uzivatel_id = p_uzivatel_id;
        ELSIF p_uzivatel_id = 0 AND p_predmet_id != 0 THEN
            OPEN p_data FOR SELECT * FROM kategorizace_materialu 
            INNER JOIN studijni_materialy ON kategorizace_materialu.studijni_material_id = studijni_materialy.id_studijnimaterial 
            WHERE kategorie_materialu_id = p_kategorie_materialu_id AND nazev LIKE '%' || p_title || '%' AND predmet_id = p_predmet_id;
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
SELECT u1.jmeno odesilatel_jmeno, u1.prijmeni odesilatel_prijmeni, u2.jmeno prijemce_jmeno, u2.prijmeni prijemce_prijmeni, id_zprava, text, datum, odesilatel_id, prijemce_id 
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

END ELSA;

/
