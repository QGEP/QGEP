------ This file generates the VSA-DSS database (Modul VSA-DSS) in en on QQIS
------ For questions etc. please contact Stefan Burckhardt stefan.burckhardt@sjib.ch
------ version 09.08.2014 21:35:25
BEGIN;
-- CREATE SCHEMA qgep;
-------
CREATE TABLE qgep.is_value_list_base
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
abbr_en character varying(3),
abbr_de character varying(3),
abbr_fr character varying(3),
active boolean,
CONSTRAINT pkey_qgep_value_list_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);


CREATE TABLE qgep.od_mutation
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_mutation_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_mutation_obj_id ON qgep.od_mutation USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_mutation_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_mutation ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_mutation');
COMMENT ON COLUMN qgep.od_mutation.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_mutation ADD COLUMN attribute  varchar(50) ;
COMMENT ON COLUMN qgep.od_mutation.attribute IS 'Attribute name of chosen object / Attributname des gewählten Objektes / Nom de l''attribut de l''objet à sélectionner';
 ALTER TABLE qgep.od_mutation ADD COLUMN class  varchar(50) ;
COMMENT ON COLUMN qgep.od_mutation.class IS 'Class name of chosen object / Klassenname des gewählten Objektes / Nom de classe de l''objet à sélectionner';
 ALTER TABLE qgep.od_mutation ADD COLUMN date_mutation  timestamp without time zone ;
COMMENT ON COLUMN qgep.od_mutation.date_mutation IS 'if changed: Date/Time of changement. If deleted date/time of deleting / Bei geaendert Datum/Zeit der Änderung. Bei gelöscht Datum/Zeit der Löschung / changée: Date/Temps du changement. effacée: Date/Temps de la suppression';
 ALTER TABLE qgep.od_mutation ADD COLUMN date_time  timestamp without time zone ;
COMMENT ON COLUMN qgep.od_mutation.date_time IS 'Date/Time of collecting data in the field. Else Date/Time of creating data set on the system / Datum/Zeit der Aufnahme im Feld falls vorhanden bei erstellt. Sonst Datum/Uhrzeit der Erstellung auf dem System / Date/temps de la relève, sinon date/temps de création dans le système';
 ALTER TABLE qgep.od_mutation ADD COLUMN kind  integer ;
COMMENT ON COLUMN qgep.od_mutation.kind IS 'Date/Time of collecting data in the field. Else Date/Time of creating data set on the system / Datum/Zeit der Aufnahme im Feld falls vorhanden bei erstellt. Sonst Datum/Uhrzeit der Erstellung auf dem System / Date/temps de la relève, sinon date/temps de création dans le système';
 ALTER TABLE qgep.od_mutation ADD COLUMN last_value  varchar(100) ;
COMMENT ON COLUMN qgep.od_mutation.last_value IS 'last_value changed to text. Only with type=changed and deleted / Letzter Wert umgewandelt in Text. Nur bei ART=geaendert oder geloescht / Dernière valeur modifiée du texte. Seulement avec GENRE = changee ou effacee';
 ALTER TABLE qgep.od_mutation ADD COLUMN object  varchar(20) ;
COMMENT ON COLUMN qgep.od_mutation.object IS 'OBJ_ID of Object / OBJ_ID des Objektes / OBJ_ID de l''objet';
 ALTER TABLE qgep.od_mutation ADD COLUMN recorded_by  varchar(80) ;
COMMENT ON COLUMN qgep.od_mutation.recorded_by IS 'Name of person who recorded the dataset / Name des Aufnehmers im Feld / Nom de la personne, qui a relevé les données';
 ALTER TABLE qgep.od_mutation ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_mutation.remark IS 'General remarks / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_mutation ADD COLUMN system_user  varchar(20) ;
COMMENT ON COLUMN qgep.od_mutation.system_user IS 'Name of system user / Name des Systembenutzers / Usager du système informatique';
 ALTER TABLE qgep.od_mutation ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_mutation.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_mutation ADD COLUMN dataowner varchar(80) ;
COMMENT ON COLUMN qgep.od_mutation.dataowner IS 'Metaattribute dataowner - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Maître des données gestionnaire de données, qui est la personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_mutation ADD COLUMN provider varchar(80) ;
COMMENT ON COLUMN qgep.od_mutation.provider IS 'Metaattribute provider - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / FOURNISSEUR DES DONNEES Organisation qui crée lenregistrement de ces données ';
-------
CREATE TABLE qgep.txt_text
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_txt_text_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_txt_text_obj_id ON qgep.txt_text USING btree (obj_id);
CREATE SEQUENCE qgep.seq_txt_text_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.txt_text ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('txt_text');
COMMENT ON COLUMN qgep.txt_text.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.txt_text ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.txt_text.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.txt_text ADD COLUMN dataowner varchar(80) ;
COMMENT ON COLUMN qgep.txt_text.dataowner IS 'Metaattribute dataowner - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Maître des données gestionnaire de données, qui est la personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.txt_text ADD COLUMN provider varchar(80) ;
COMMENT ON COLUMN qgep.txt_text.provider IS 'Metaattribute provider - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / FOURNISSEUR DES DONNEES Organisation qui crée lenregistrement de ces données ';
-------
CREATE TABLE qgep.od_organisation
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_organisation_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_organisation_obj_id ON qgep.od_organisation USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_organisation_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_organisation ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_organisation');
COMMENT ON COLUMN qgep.od_organisation.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_organisation ADD COLUMN identifier  varchar(80) ;
 CREATE UNIQUE INDEX in_od_organisation_identifier ON qgep.od_organisation USING btree (identifier);
COMMENT ON COLUMN qgep.od_organisation.identifier IS 'It is suggested to use real names, e.g. Sample_Community and not only Community. Or "Waste Water Association WWTP Example" and not only Waste Water Association because there will be multiple objects / Es wird empfohlen reale Namen zu nehmen, z.B. Mustergemeinde und nicht Gemeinde. Oder Abwasserverband ARA Muster und nicht nur Abwasserverband, da es sonst Probleme gibt bei der Zusammenführung der Daten. / Utilisez les noms réels, par ex. commune "exemple" et pas seulement commune. Ou "Association pour l''épuration des eaux usées STEP XXX" et pas seulement  Association pour l''épuration des eaux usées. Sinon vous risquer des problèmes en réunissant les donnée';
 ALTER TABLE qgep.od_organisation ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_organisation.remark IS 'yyy Fehler bei Zuordnung / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_organisation ADD COLUMN uid  varchar(12) ;
COMMENT ON COLUMN qgep.od_organisation.uid IS 'yyyReferenz zur Unternehmensidentifikation des Bundesamts fuer Statistik (www.uid.admin.ch), e.g. z.B. CHE123456789 / Referenz zur Unternehmensidentifikation des Bundesamts fuer Statistik (www.uid.admin.ch), z.B. CHE123456789 / Référence pour lidentification des entreprises selon lOffice fédéral de la statistique OFS (www.uid.admin.ch), par exemple: CHE123456789';
 ALTER TABLE qgep.od_organisation ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_organisation.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_organisation ADD COLUMN dataowner varchar(80) ;
COMMENT ON COLUMN qgep.od_organisation.dataowner IS 'Metaattribute dataowner - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Maître des données gestionnaire de données, qui est la personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_organisation ADD COLUMN provider varchar(80) ;
COMMENT ON COLUMN qgep.od_organisation.provider IS 'Metaattribute provider - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / FOURNISSEUR DES DONNEES Organisation qui crée lenregistrement de ces données ';
-------
CREATE TABLE qgep.od_zone
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_zone_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_zone_obj_id ON qgep.od_zone USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_zone_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_zone ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_zone');
COMMENT ON COLUMN qgep.od_zone.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_zone ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_zone_identifier ON qgep.od_zone USING btree (identifier);
COMMENT ON COLUMN qgep.od_zone.identifier IS '';
 ALTER TABLE qgep.od_zone ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_zone.remark IS 'General remarks / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_zone ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_zone.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_zone ADD COLUMN dataowner varchar(80) ;
COMMENT ON COLUMN qgep.od_zone.dataowner IS 'Metaattribute dataowner - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Maître des données gestionnaire de données, qui est la personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_zone ADD COLUMN provider varchar(80) ;
COMMENT ON COLUMN qgep.od_zone.provider IS 'Metaattribute provider - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / FOURNISSEUR DES DONNEES Organisation qui crée lenregistrement de ces données ';
-------
CREATE TABLE qgep.od_sludge_treatment
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_sludge_treatment_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_sludge_treatment_obj_id ON qgep.od_sludge_treatment USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_sludge_treatment_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_sludge_treatment ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_sludge_treatment');
COMMENT ON COLUMN qgep.od_sludge_treatment.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_sludge_treatment ADD COLUMN composting  decimal(7,2) ;
COMMENT ON COLUMN qgep.od_sludge_treatment.composting IS 'Dimensioning value / Dimensionierungswert / Valeur de dimensionnement';
 ALTER TABLE qgep.od_sludge_treatment ADD COLUMN dehydration  decimal(7,2) ;
COMMENT ON COLUMN qgep.od_sludge_treatment.dehydration IS 'Dimensioning value / Dimensionierungswert / Valeur de dimensionnement';
 ALTER TABLE qgep.od_sludge_treatment ADD COLUMN digested_sludge_combustion  decimal(7,2) ;
COMMENT ON COLUMN qgep.od_sludge_treatment.digested_sludge_combustion IS 'yyy_Dimensioning value der Verbrennungsanlage / Dimensionierungswert der Verbrennungsanlage / Valeur de dimensionnement de l''installation d''incinération';
 ALTER TABLE qgep.od_sludge_treatment ADD COLUMN drying  decimal(7,2) ;
COMMENT ON COLUMN qgep.od_sludge_treatment.drying IS 'yyy_Leistung thermische Trocknung / Leistung thermische Trocknung / Puissance du séchage thermique';
 ALTER TABLE qgep.od_sludge_treatment ADD COLUMN fresh_sludge_combustion  decimal(7,2) ;
COMMENT ON COLUMN qgep.od_sludge_treatment.fresh_sludge_combustion IS 'yyy_Dimensioning value der Verbrennungsanlage / Dimensionierungswert der Verbrennungsanlage / Valeur de dimensionnement de l''installation d''incinération';
 ALTER TABLE qgep.od_sludge_treatment ADD COLUMN hygenisation  decimal(7,2) ;
COMMENT ON COLUMN qgep.od_sludge_treatment.hygenisation IS 'Dimensioning value / Dimensionierungswert / Valeur de dimensionnement';
 ALTER TABLE qgep.od_sludge_treatment ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_sludge_treatment_identifier ON qgep.od_sludge_treatment USING btree (identifier);
COMMENT ON COLUMN qgep.od_sludge_treatment.identifier IS 'Dimensioning value / Dimensionierungswert / Valeur de dimensionnement';
 ALTER TABLE qgep.od_sludge_treatment ADD COLUMN predensification_of_excess_sludge  decimal(9,2) ;
COMMENT ON COLUMN qgep.od_sludge_treatment.predensification_of_excess_sludge IS 'Dimensioning value / Dimensionierungswert / Valeur de dimensionnement';
 ALTER TABLE qgep.od_sludge_treatment ADD COLUMN predensification_of_mixed_sludge  decimal(9,2) ;
COMMENT ON COLUMN qgep.od_sludge_treatment.predensification_of_mixed_sludge IS 'Dimensioning value / Dimensionierungswert / Valeur de dimensionnement';
 ALTER TABLE qgep.od_sludge_treatment ADD COLUMN predensification_of_primary_sludge  decimal(9,2) ;
COMMENT ON COLUMN qgep.od_sludge_treatment.predensification_of_primary_sludge IS 'Dimensioning value / Dimensionierungswert / Valeur de dimensionnement';
 ALTER TABLE qgep.od_sludge_treatment ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_sludge_treatment.remark IS 'General remarks / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_sludge_treatment ADD COLUMN stabilisation  integer ;
COMMENT ON COLUMN qgep.od_sludge_treatment.stabilisation IS 'yyy_Art der Schlammstabilisierung / Art der Schlammstabilisierung / Type de stabilisation des boues';
 ALTER TABLE qgep.od_sludge_treatment ADD COLUMN stacking_of_dehydrated_sludge  decimal(9,2) ;
COMMENT ON COLUMN qgep.od_sludge_treatment.stacking_of_dehydrated_sludge IS 'Dimensioning value / Dimensionierungswert / Valeur de dimensionnement';
 ALTER TABLE qgep.od_sludge_treatment ADD COLUMN stacking_of_liquid_sludge  decimal(9,2) ;
COMMENT ON COLUMN qgep.od_sludge_treatment.stacking_of_liquid_sludge IS 'Dimensioning value / Dimensionierungswert / Valeur de dimensionnement';
 ALTER TABLE qgep.od_sludge_treatment ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_sludge_treatment.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_sludge_treatment ADD COLUMN dataowner varchar(80) ;
COMMENT ON COLUMN qgep.od_sludge_treatment.dataowner IS 'Metaattribute dataowner - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Maître des données gestionnaire de données, qui est la personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_sludge_treatment ADD COLUMN provider varchar(80) ;
COMMENT ON COLUMN qgep.od_sludge_treatment.provider IS 'Metaattribute provider - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / FOURNISSEUR DES DONNEES Organisation qui crée lenregistrement de ces données ';
-------
CREATE TABLE qgep.od_wwtp_energy_use
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_wwtp_energy_use_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_wwtp_energy_use_obj_id ON qgep.od_wwtp_energy_use USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_wwtp_energy_use_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_wwtp_energy_use ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_wwtp_energy_use');
COMMENT ON COLUMN qgep.od_wwtp_energy_use.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_wwtp_energy_use ADD COLUMN gas_motor  integer ;
COMMENT ON COLUMN qgep.od_wwtp_energy_use.gas_motor IS 'electric power / elektrische Leistung / Puissance électrique';
 ALTER TABLE qgep.od_wwtp_energy_use ADD COLUMN heat_pump  integer ;
COMMENT ON COLUMN qgep.od_wwtp_energy_use.heat_pump IS 'Energy production based on the heat production on the WWTP / Energienutzung aufgrund des Wärmeanfalls auf der ARA / Utilisation de l''énergie thermique de la STEP';
 ALTER TABLE qgep.od_wwtp_energy_use ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_wwtp_energy_use_identifier ON qgep.od_wwtp_energy_use USING btree (identifier);
COMMENT ON COLUMN qgep.od_wwtp_energy_use.identifier IS 'Energy production based on the heat production on the WWTP / Energienutzung aufgrund des Wärmeanfalls auf der ARA / Utilisation de l''''énergie thermique de la STEP';
 ALTER TABLE qgep.od_wwtp_energy_use ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_wwtp_energy_use.remark IS 'General remarks / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_wwtp_energy_use ADD COLUMN turbining  integer ;
COMMENT ON COLUMN qgep.od_wwtp_energy_use.turbining IS 'Energy production based on the (bio)gaz production on the WWTP / Energienutzung aufgrund des Gasanfalls auf der ARA / Production d''énergie issue de la production de gaz de la STEP';
 ALTER TABLE qgep.od_wwtp_energy_use ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_wwtp_energy_use.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_wwtp_energy_use ADD COLUMN dataowner varchar(80) ;
COMMENT ON COLUMN qgep.od_wwtp_energy_use.dataowner IS 'Metaattribute dataowner - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Maître des données gestionnaire de données, qui est la personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_wwtp_energy_use ADD COLUMN provider varchar(80) ;
COMMENT ON COLUMN qgep.od_wwtp_energy_use.provider IS 'Metaattribute provider - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / FOURNISSEUR DES DONNEES Organisation qui crée lenregistrement de ces données ';
-------
CREATE TABLE qgep.od_waste_water_treatment
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_waste_water_treatment_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_waste_water_treatment_obj_id ON qgep.od_waste_water_treatment USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_waste_water_treatment_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_waste_water_treatment ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_waste_water_treatment');
COMMENT ON COLUMN qgep.od_waste_water_treatment.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_waste_water_treatment ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_waste_water_treatment_identifier ON qgep.od_waste_water_treatment USING btree (identifier);
COMMENT ON COLUMN qgep.od_waste_water_treatment.identifier IS '';
 ALTER TABLE qgep.od_waste_water_treatment ADD COLUMN kind  integer ;
COMMENT ON COLUMN qgep.od_waste_water_treatment.kind IS 'Type of wastewater  treatment / Verfahren für die Abwasserbehandlung / Genre de traitement des eaux usées';
 ALTER TABLE qgep.od_waste_water_treatment ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_waste_water_treatment.remark IS 'General remarks / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_waste_water_treatment ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_waste_water_treatment.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_waste_water_treatment ADD COLUMN dataowner varchar(80) ;
COMMENT ON COLUMN qgep.od_waste_water_treatment.dataowner IS 'Metaattribute dataowner - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Maître des données gestionnaire de données, qui est la personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_waste_water_treatment ADD COLUMN provider varchar(80) ;
COMMENT ON COLUMN qgep.od_waste_water_treatment.provider IS 'Metaattribute provider - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / FOURNISSEUR DES DONNEES Organisation qui crée lenregistrement de ces données ';
-------
CREATE TABLE qgep.od_control_center
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_control_center_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_control_center_obj_id ON qgep.od_control_center USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_control_center_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_control_center ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_control_center');
COMMENT ON COLUMN qgep.od_control_center.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_control_center ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_control_center_identifier ON qgep.od_control_center USING btree (identifier);
COMMENT ON COLUMN qgep.od_control_center.identifier IS '';
SELECT AddGeometryColumn('qgep', 'od_control_center', 'situation_geometry', 21781, 'POINT', 2, true);
CREATE INDEX in_qgep_od_control_center_situation_geometry ON qgep.od_control_center USING gist (situation_geometry );
COMMENT ON COLUMN qgep.od_control_center.situation_geometry IS 'National position coordinates (East, North) / Landeskoordinate Ost/Nord / Coordonnées nationales Est/Nord';
 ALTER TABLE qgep.od_control_center ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_control_center.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_control_center ADD COLUMN dataowner varchar(80) ;
COMMENT ON COLUMN qgep.od_control_center.dataowner IS 'Metaattribute dataowner - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Maître des données gestionnaire de données, qui est la personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_control_center ADD COLUMN provider varchar(80) ;
COMMENT ON COLUMN qgep.od_control_center.provider IS 'Metaattribute provider - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / FOURNISSEUR DES DONNEES Organisation qui crée lenregistrement de ces données ';
-------
CREATE TABLE qgep.od_aquifier
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_aquifier_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_aquifier_obj_id ON qgep.od_aquifier USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_aquifier_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_aquifier ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_aquifier');
COMMENT ON COLUMN qgep.od_aquifier.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_aquifier ADD COLUMN average_groundwater_level  decimal(7,3) ;
COMMENT ON COLUMN qgep.od_aquifier.average_groundwater_level IS 'Average level of groundwater table / Höhe des mittleren Grundwasserspiegels / Niveau moyen de la nappe';
 ALTER TABLE qgep.od_aquifier ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_aquifier_identifier ON qgep.od_aquifier USING btree (identifier);
COMMENT ON COLUMN qgep.od_aquifier.identifier IS 'Average level of groundwater table / Höhe des mittleren Grundwasserspiegels / Niveau moyen de la nappe';
 ALTER TABLE qgep.od_aquifier ADD COLUMN maximal_groundwater_level  decimal(7,3) ;
COMMENT ON COLUMN qgep.od_aquifier.maximal_groundwater_level IS 'Maximal level of ground water table / Maximale Lage des Grundwasserspiegels / Niveau maximal de la nappe';
 ALTER TABLE qgep.od_aquifier ADD COLUMN minimal_groundwater_level  decimal(7,3) ;
COMMENT ON COLUMN qgep.od_aquifier.minimal_groundwater_level IS 'Minimal level of groundwater table / Minimale Lage des Grundwasserspiegels / Niveau minimal de la nappe';
SELECT AddGeometryColumn('qgep', 'od_aquifier', 'perimeter_geometry', 21781, 'POLYGON', 2, true);
CREATE INDEX in_qgep_od_aquifier_perimeter_geometry ON qgep.od_aquifier USING gist (perimeter_geometry );
COMMENT ON COLUMN qgep.od_aquifier.perimeter_geometry IS 'Boundary points of the perimeter / Begrenzungspunkte der Fläche / Points de délimitation de la surface';
 ALTER TABLE qgep.od_aquifier ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_aquifier.remark IS 'General remarks / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_aquifier ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_aquifier.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_aquifier ADD COLUMN dataowner varchar(80) ;
COMMENT ON COLUMN qgep.od_aquifier.dataowner IS 'Metaattribute dataowner - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Maître des données gestionnaire de données, qui est la personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_aquifier ADD COLUMN provider varchar(80) ;
COMMENT ON COLUMN qgep.od_aquifier.provider IS 'Metaattribute provider - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / FOURNISSEUR DES DONNEES Organisation qui crée lenregistrement de ces données ';
-------
CREATE TABLE qgep.od_water_catchment
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_water_catchment_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_water_catchment_obj_id ON qgep.od_water_catchment USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_water_catchment_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_water_catchment ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_water_catchment');
COMMENT ON COLUMN qgep.od_water_catchment.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_water_catchment ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_water_catchment_identifier ON qgep.od_water_catchment USING btree (identifier);
COMMENT ON COLUMN qgep.od_water_catchment.identifier IS '';
 ALTER TABLE qgep.od_water_catchment ADD COLUMN kind  integer ;
COMMENT ON COLUMN qgep.od_water_catchment.kind IS 'Type of water catchment / Art der Trinkwasserfassung / Genre de prise d''eau';
 ALTER TABLE qgep.od_water_catchment ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_water_catchment.remark IS 'General remarks / Allgemeine Bemerkungen / Remarques générales';
SELECT AddGeometryColumn('qgep', 'od_water_catchment', 'situation_geometry', 21781, 'POINT', 2, true);
CREATE INDEX in_qgep_od_water_catchment_situation_geometry ON qgep.od_water_catchment USING gist (situation_geometry );
COMMENT ON COLUMN qgep.od_water_catchment.situation_geometry IS 'National position coordinates (East, North) / Landeskoordinate Ost/Nord / Coordonnées nationales Est/Nord';
 ALTER TABLE qgep.od_water_catchment ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_water_catchment.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_water_catchment ADD COLUMN dataowner varchar(80) ;
COMMENT ON COLUMN qgep.od_water_catchment.dataowner IS 'Metaattribute dataowner - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Maître des données gestionnaire de données, qui est la personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_water_catchment ADD COLUMN provider varchar(80) ;
COMMENT ON COLUMN qgep.od_water_catchment.provider IS 'Metaattribute provider - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / FOURNISSEUR DES DONNEES Organisation qui crée lenregistrement de ces données ';
-------
CREATE TABLE qgep.od_water_control_structure
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_water_control_structure_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_water_control_structure_obj_id ON qgep.od_water_control_structure USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_water_control_structure_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_water_control_structure ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_water_control_structure');
COMMENT ON COLUMN qgep.od_water_control_structure.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_water_control_structure ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_water_control_structure_identifier ON qgep.od_water_control_structure USING btree (identifier);
COMMENT ON COLUMN qgep.od_water_control_structure.identifier IS '';
 ALTER TABLE qgep.od_water_control_structure ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_water_control_structure.remark IS 'General remarks / Allgemeine Bemerkungen / Remarques générales';
SELECT AddGeometryColumn('qgep', 'od_water_control_structure', 'situation_geometry', 21781, 'POINT', 2, true);
CREATE INDEX in_qgep_od_water_control_structure_situation_geometry ON qgep.od_water_control_structure USING gist (situation_geometry );
COMMENT ON COLUMN qgep.od_water_control_structure.situation_geometry IS 'National position coordinates (East, North) / Landeskoordinate Ost/Nord / Coordonnées nationales Est/Nord';
 ALTER TABLE qgep.od_water_control_structure ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_water_control_structure.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_water_control_structure ADD COLUMN dataowner varchar(80) ;
COMMENT ON COLUMN qgep.od_water_control_structure.dataowner IS 'Metaattribute dataowner - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Maître des données gestionnaire de données, qui est la personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_water_control_structure ADD COLUMN provider varchar(80) ;
COMMENT ON COLUMN qgep.od_water_control_structure.provider IS 'Metaattribute provider - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / FOURNISSEUR DES DONNEES Organisation qui crée lenregistrement de ces données ';
-------
CREATE TABLE qgep.od_river_bed
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_river_bed_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_river_bed_obj_id ON qgep.od_river_bed USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_river_bed_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_river_bed ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_river_bed');
COMMENT ON COLUMN qgep.od_river_bed.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_river_bed ADD COLUMN control_grade_of_river  integer ;
COMMENT ON COLUMN qgep.od_river_bed.control_grade_of_river IS 'yyy_Flächenhafter Verbauungsgrad der Gewässersohle in %. Aufteilung in Klassen. / Flächenhafter Verbauungsgrad der Gewässersohle in %. Aufteilung in Klassen. / Pourcentage de la surface avec aménagement du fond du lit. Classification';
 ALTER TABLE qgep.od_river_bed ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_river_bed_identifier ON qgep.od_river_bed USING btree (identifier);
COMMENT ON COLUMN qgep.od_river_bed.identifier IS 'yyy_Flächenhafter Verbauungsgrad der Gewässersohle in %. Aufteilung in Klassen. / Flächenhafter Verbauungsgrad der Gewässersohle in %. Aufteilung in Klassen. / Pourcentage de la surface avec aménagement du fond du lit. Classification';
 ALTER TABLE qgep.od_river_bed ADD COLUMN kind  integer ;
COMMENT ON COLUMN qgep.od_river_bed.kind IS 'type of bed / Sohlentyp / Type de fond';
 ALTER TABLE qgep.od_river_bed ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_river_bed.remark IS 'General remarks / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_river_bed ADD COLUMN river_control_type  integer ;
COMMENT ON COLUMN qgep.od_river_bed.river_control_type IS 'Type of river control / Art des Sohlenverbaus / Genre d''aménagement du fond';
 ALTER TABLE qgep.od_river_bed ADD COLUMN width  decimal(7,2) ;
COMMENT ON COLUMN qgep.od_river_bed.width IS 'yyy_Bei Hochwasser umgelagerter Bereich (frei von höheren Wasserpflanzen) / Bei Hochwasser umgelagerter Bereich (frei von höheren Wasserpflanzen) / Zone de charriage par hautes eaux (absence de plantes aquatiques supérieures)';
 ALTER TABLE qgep.od_river_bed ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_river_bed.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_river_bed ADD COLUMN dataowner varchar(80) ;
COMMENT ON COLUMN qgep.od_river_bed.dataowner IS 'Metaattribute dataowner - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Maître des données gestionnaire de données, qui est la personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_river_bed ADD COLUMN provider varchar(80) ;
COMMENT ON COLUMN qgep.od_river_bed.provider IS 'Metaattribute provider - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / FOURNISSEUR DES DONNEES Organisation qui crée lenregistrement de ces données ';
-------
CREATE TABLE qgep.od_bathing_area
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_bathing_area_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_bathing_area_obj_id ON qgep.od_bathing_area USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_bathing_area_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_bathing_area ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_bathing_area');
COMMENT ON COLUMN qgep.od_bathing_area.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_bathing_area ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_bathing_area_identifier ON qgep.od_bathing_area USING btree (identifier);
COMMENT ON COLUMN qgep.od_bathing_area.identifier IS '';
 ALTER TABLE qgep.od_bathing_area ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_bathing_area.remark IS 'General remarks / Allgemeine Bemerkungen / Remarques générales';
SELECT AddGeometryColumn('qgep', 'od_bathing_area', 'situation_geometry', 21781, 'POINT', 2, true);
CREATE INDEX in_qgep_od_bathing_area_situation_geometry ON qgep.od_bathing_area USING gist (situation_geometry );
COMMENT ON COLUMN qgep.od_bathing_area.situation_geometry IS 'National position coordinates (East, North) / Landeskoordinate Ost/Nord / Coordonnées nationales Est/Nord';
 ALTER TABLE qgep.od_bathing_area ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_bathing_area.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_bathing_area ADD COLUMN dataowner varchar(80) ;
COMMENT ON COLUMN qgep.od_bathing_area.dataowner IS 'Metaattribute dataowner - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Maître des données gestionnaire de données, qui est la personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_bathing_area ADD COLUMN provider varchar(80) ;
COMMENT ON COLUMN qgep.od_bathing_area.provider IS 'Metaattribute provider - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / FOURNISSEUR DES DONNEES Organisation qui crée lenregistrement de ces données ';
-------
CREATE TABLE qgep.od_sector_water_body
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_sector_water_body_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_sector_water_body_obj_id ON qgep.od_sector_water_body USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_sector_water_body_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_sector_water_body ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_sector_water_body');
COMMENT ON COLUMN qgep.od_sector_water_body.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_sector_water_body ADD COLUMN code_bwg  varchar(50) ;
COMMENT ON COLUMN qgep.od_sector_water_body.code_bwg IS 'Code as published by the Federal Office for Water and Geology (FOWG) / Code gemäss Format des Bundesamtes für Wasser und Geologie (BWG) / Code selon le format de l''Office fédéral des eaux et de la géologie (OFEG)';
 ALTER TABLE qgep.od_sector_water_body ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_sector_water_body_identifier ON qgep.od_sector_water_body USING btree (identifier);
COMMENT ON COLUMN qgep.od_sector_water_body.identifier IS 'yyy_Eindeutiger Name des Sektors, ID des Bundesamtes für Wasserwirtschaft  und Geologie (BWG, früher BWW) falls Sektor von diesem bezogen wurde. / Eindeutiger Name des Sektors, ID des Bundesamtes für Wasserwirtschaft  und Geologie (BWG, früher BWW) falls Sektor von diesem bezogen wurde. / Nom univoque du secteur, identificateur de l''office fédéral des eaux et de la géologie (OFEG, anciennement OFEE) si existant';
 ALTER TABLE qgep.od_sector_water_body ADD COLUMN kind  integer ;
COMMENT ON COLUMN qgep.od_sector_water_body.kind IS 'Shore or water course line. Important to distinguish lake traversals and waterbodies / Ufer oder Gewässerlinie. Zur Unterscheidung der Seesektoren wichtig. / Rives ou limites d''eau. Permet la différenciation des différents secteurs d''un lac ou cours d''eau';
 ALTER TABLE qgep.od_sector_water_body ADD COLUMN km_down  decimal(9,3) ;
COMMENT ON COLUMN qgep.od_sector_water_body.km_down IS 'yyy_Adresskilometer beim Sektorende (nur definieren, falls es sich um den letzten Sektor handelt oder ein Sprung in der Adresskilometrierung von einem Sektor zum nächsten  existiert) / Adresskilometer beim Sektorende (nur definieren, falls es sich um den letzten Sektor handelt oder ein Sprung in der Adresskilometrierung von einem Sektor zum nächsten  existiert) / Kilomètre de la fin du secteur (à définir uniquement s''il s''agit du dernier secteur ou lors d''un saut dans le kilométrage d''un secteur à un autre)';
 ALTER TABLE qgep.od_sector_water_body ADD COLUMN km_up  decimal(9,3) ;
COMMENT ON COLUMN qgep.od_sector_water_body.km_up IS 'yyy_Adresskilometer beim Sektorbeginn / Adresskilometer beim Sektorbeginn / Kilomètre du début du secteur';
SELECT AddGeometryColumn('qgep', 'od_sector_water_body', 'progression_geometry', 21781, 'LINESTRING', 2, true);
CREATE INDEX in_qgep_od_sector_water_body_progression_geometry ON qgep.od_sector_water_body USING gist (progression_geometry );
COMMENT ON COLUMN qgep.od_sector_water_body.progression_geometry IS 'yyy_Reihenfolge von Punkten die den Verlauf eines Gewässersektors beschreiben / Reihenfolge von Punkten die den Verlauf eines Gewässersektors beschreiben / Suite de points qui décrivent le tracé d''un secteur d''un cours d''eau';
 ALTER TABLE qgep.od_sector_water_body ADD COLUMN ref_length  decimal(7,2) ;
COMMENT ON COLUMN qgep.od_sector_water_body.ref_length IS 'yyy_Basislänge in Zusammenhang mit der Gewässerkilometrierung (siehe GEWISS - SYSEAU) / Basislänge in Zusammenhang mit der Gewässerkilometrierung (siehe GEWISS - SYSEAU) / Longueur de référence pour ce kilométrage des cours d''eau (voir GEWISS - SYSEAU)';
 ALTER TABLE qgep.od_sector_water_body ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_sector_water_body.remark IS 'General remarks / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_sector_water_body ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_sector_water_body.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_sector_water_body ADD COLUMN dataowner varchar(80) ;
COMMENT ON COLUMN qgep.od_sector_water_body.dataowner IS 'Metaattribute dataowner - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Maître des données gestionnaire de données, qui est la personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_sector_water_body ADD COLUMN provider varchar(80) ;
COMMENT ON COLUMN qgep.od_sector_water_body.provider IS 'Metaattribute provider - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / FOURNISSEUR DES DONNEES Organisation qui crée lenregistrement de ces données ';
-------
CREATE TABLE qgep.od_water_course_segment
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_water_course_segment_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_water_course_segment_obj_id ON qgep.od_water_course_segment USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_water_course_segment_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_water_course_segment ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_water_course_segment');
COMMENT ON COLUMN qgep.od_water_course_segment.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_water_course_segment ADD COLUMN algae_growth  integer ;
COMMENT ON COLUMN qgep.od_water_course_segment.algae_growth IS 'Coverage with algae / Bewuchs mit Algen / Couverture végétale par des algues';
 ALTER TABLE qgep.od_water_course_segment ADD COLUMN altitudinal_zone  integer ;
COMMENT ON COLUMN qgep.od_water_course_segment.altitudinal_zone IS 'Alltiduinal zone of a water course / Höhenstufentypen eines Gewässers / Type d''étage d''altitude des cours d''eau';
 ALTER TABLE qgep.od_water_course_segment ADD COLUMN bed_with  decimal(7,2) ;
COMMENT ON COLUMN qgep.od_water_course_segment.bed_with IS 'Average bed with / mittlere Sohlenbreite / Largeur moyenne du lit';
 ALTER TABLE qgep.od_water_course_segment ADD COLUMN dead_wood  integer ;
COMMENT ON COLUMN qgep.od_water_course_segment.dead_wood IS 'Accumulations of dead wood in water course section / Ansammlungen von Totholz im Gewässerabschnitt / Amas de bois mort dans le cours d''eau';
 ALTER TABLE qgep.od_water_course_segment ADD COLUMN depth_variability  integer ;
COMMENT ON COLUMN qgep.od_water_course_segment.depth_variability IS 'Variability of depth of water course / Variabilität der Gewässertiefe / Variabilité de la profondeur d''eau';
 ALTER TABLE qgep.od_water_course_segment ADD COLUMN discharge_regime  integer ;
COMMENT ON COLUMN qgep.od_water_course_segment.discharge_regime IS 'yyy_Grad der antropogenen Beeinflussung des charakteristischen Ganges des Abflusses. / Grad der antropogenen Beeinflussung des charakteristischen Ganges des Abflusses. / Degré d''intervention anthropogène sur le régime hydraulique';
 ALTER TABLE qgep.od_water_course_segment ADD COLUMN ecom_classification  integer ;
COMMENT ON COLUMN qgep.od_water_course_segment.ecom_classification IS 'Summary attribut of ecomorphological classification of level F / Summenattribut aus der ökomorphologischen Klassifizierung nach Stufe F / Attribut issu de la classification écomorphologique du niveau R';
SELECT AddGeometryColumn('qgep', 'od_water_course_segment', 'from_geometry', 21781, 'POINT', 2, true);
CREATE INDEX in_qgep_od_water_course_segment_from_geometry ON qgep.od_water_course_segment USING gist (from_geometry );
COMMENT ON COLUMN qgep.od_water_course_segment.from_geometry IS 'Position of segment start point in water course / Lage des Abschnittanfangs  im Gewässerverlauf / Situation du début du tronçon';
 ALTER TABLE qgep.od_water_course_segment ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_water_course_segment_identifier ON qgep.od_water_course_segment USING btree (identifier);
COMMENT ON COLUMN qgep.od_water_course_segment.identifier IS 'Position of segment start point in water course / Lage des Abschnittanfangs  im Gewässerverlauf / Situation du début du tronçon';
 ALTER TABLE qgep.od_water_course_segment ADD COLUMN kind  integer ;
COMMENT ON COLUMN qgep.od_water_course_segment.kind IS 'Position of segment start point in water course / Lage des Abschnittanfangs  im Gewässerverlauf / Situation du début du tronçon';
 ALTER TABLE qgep.od_water_course_segment ADD COLUMN length_profile  integer ;
COMMENT ON COLUMN qgep.od_water_course_segment.length_profile IS 'Character of length profile / Charakterisierung des Gewässerlängsprofil / Caractérisation du profil en long';
 ALTER TABLE qgep.od_water_course_segment ADD COLUMN macrophyte_coverage  integer ;
COMMENT ON COLUMN qgep.od_water_course_segment.macrophyte_coverage IS 'Coverage with macrophytes / Bewuchs mit Makrophyten / Couverture végétale par des macrophytes (végétation aquatique (macroscopique))';
 ALTER TABLE qgep.od_water_course_segment ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_water_course_segment.remark IS 'General remarks / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_water_course_segment ADD COLUMN section_morphology  integer ;
COMMENT ON COLUMN qgep.od_water_course_segment.section_morphology IS 'yyy_Linienführung eines Gewässerabschnittes / Linienführung eines Gewässerabschnittes / Tracé d''un cours d''eau';
 ALTER TABLE qgep.od_water_course_segment ADD COLUMN size  smallint ;
COMMENT ON COLUMN qgep.od_water_course_segment.size IS 'Classification by Strahler / Ordnungszahl nach Strahler / Classification selon Strahler';
 ALTER TABLE qgep.od_water_course_segment ADD COLUMN slope  integer ;
COMMENT ON COLUMN qgep.od_water_course_segment.slope IS 'Average slope of water course segment / Mittleres Gefälle des Gewässerabschnittes / Pente moyenne du fond du tronçon cours d''eau';
SELECT AddGeometryColumn('qgep', 'od_water_course_segment', 'to_geometry', 21781, 'POINT', 2, true);
CREATE INDEX in_qgep_od_water_course_segment_to_geometry ON qgep.od_water_course_segment USING gist (to_geometry );
COMMENT ON COLUMN qgep.od_water_course_segment.to_geometry IS 'Position of segment end point in water course / Lage Abschnitt-Ende im Gewässerverlauf / Situation de la fin du tronçon';
 ALTER TABLE qgep.od_water_course_segment ADD COLUMN utilisation  integer ;
COMMENT ON COLUMN qgep.od_water_course_segment.utilisation IS 'Primary utilisation of water course segment / Primäre Nutzung des Gewässerabschnittes / Utilisation primaire du tronçon de cours d''eau';
 ALTER TABLE qgep.od_water_course_segment ADD COLUMN water_hardness  integer ;
COMMENT ON COLUMN qgep.od_water_course_segment.water_hardness IS 'Chemical water hardness / Chemische Wasserhärte / Dureté chimique de l''eau';
 ALTER TABLE qgep.od_water_course_segment ADD COLUMN width_variability  integer ;
COMMENT ON COLUMN qgep.od_water_course_segment.width_variability IS 'yyy_Breitenvariabilität des Wasserspiegels bei niedrigem bis mittlerem Abfluss / Breitenvariabilität des Wasserspiegels bei niedrigem bis mittlerem Abfluss / Variabilité de la largeur du lit mouillé par basses et moyennes eaux';
 ALTER TABLE qgep.od_water_course_segment ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_water_course_segment.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_water_course_segment ADD COLUMN dataowner varchar(80) ;
COMMENT ON COLUMN qgep.od_water_course_segment.dataowner IS 'Metaattribute dataowner - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Maître des données gestionnaire de données, qui est la personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_water_course_segment ADD COLUMN provider varchar(80) ;
COMMENT ON COLUMN qgep.od_water_course_segment.provider IS 'Metaattribute provider - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / FOURNISSEUR DES DONNEES Organisation qui crée lenregistrement de ces données ';
-------
CREATE TABLE qgep.od_fish_pass
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_fish_pass_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_fish_pass_obj_id ON qgep.od_fish_pass USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_fish_pass_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_fish_pass ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_fish_pass');
COMMENT ON COLUMN qgep.od_fish_pass.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_fish_pass ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_fish_pass_identifier ON qgep.od_fish_pass USING btree (identifier);
COMMENT ON COLUMN qgep.od_fish_pass.identifier IS '';
 ALTER TABLE qgep.od_fish_pass ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_fish_pass.remark IS 'General remarks / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_fish_pass ADD COLUMN vertical_drop  decimal(7,2) ;
COMMENT ON COLUMN qgep.od_fish_pass.vertical_drop IS 'Vertical difference of water level before and after fishpass / Differenz des Wasserspiegels vor und nach dem Fischpass / Différence de la hauteur du plan d''eau avant et après l''échelle à poisson';
 ALTER TABLE qgep.od_fish_pass ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_fish_pass.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_fish_pass ADD COLUMN dataowner varchar(80) ;
COMMENT ON COLUMN qgep.od_fish_pass.dataowner IS 'Metaattribute dataowner - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Maître des données gestionnaire de données, qui est la personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_fish_pass ADD COLUMN provider varchar(80) ;
COMMENT ON COLUMN qgep.od_fish_pass.provider IS 'Metaattribute provider - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / FOURNISSEUR DES DONNEES Organisation qui crée lenregistrement de ces données ';
-------
CREATE TABLE qgep.od_river_bank
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_river_bank_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_river_bank_obj_id ON qgep.od_river_bank USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_river_bank_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_river_bank ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_river_bank');
COMMENT ON COLUMN qgep.od_river_bank.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_river_bank ADD COLUMN control_grade_of_river  integer ;
COMMENT ON COLUMN qgep.od_river_bank.control_grade_of_river IS 'yyy_Flächenhafter Verbauungsgrad des Böschungsfusses in %. Aufteilung in Klassen. / Flächenhafter Verbauungsgrad des Böschungsfusses in %. Aufteilung in Klassen. / Degré d''aménagement du pied du talus du cours d''eau';
 ALTER TABLE qgep.od_river_bank ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_river_bank_identifier ON qgep.od_river_bank USING btree (identifier);
COMMENT ON COLUMN qgep.od_river_bank.identifier IS 'yyy_Flächenhafter Verbauungsgrad des Böschungsfusses in %. Aufteilung in Klassen. / Flächenhafter Verbauungsgrad des Böschungsfusses in %. Aufteilung in Klassen. / Degré d''''aménagement du pied du talus du cours d''''eau';
 ALTER TABLE qgep.od_river_bank ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_river_bank.remark IS 'General remarks / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_river_bank ADD COLUMN river_control_type  integer ;
COMMENT ON COLUMN qgep.od_river_bank.river_control_type IS 'yyy_Verbauungsart des Böschungsfusses / Verbauungsart des Böschungsfusses / Genre d''aménagement du pied de la berge du cours d''eau';
 ALTER TABLE qgep.od_river_bank ADD COLUMN shores  integer ;
COMMENT ON COLUMN qgep.od_river_bank.shores IS 'yyy_Beschaffenheit des Bereiches oberhalb des Böschungsfusses / Beschaffenheit des Bereiches oberhalb des Böschungsfusses / Nature de la zone en dessus du pied de la berge du cours d''eau';
 ALTER TABLE qgep.od_river_bank ADD COLUMN side  integer ;
COMMENT ON COLUMN qgep.od_river_bank.side IS 'yyy_Linke oder rechte Uferseite in Fliessrichtung / Linke oder rechte Uferseite in Fliessrichtung / Berges sur le côté gauche ou droite du cours d''eau par rapport au sens d''écoulement';
 ALTER TABLE qgep.od_river_bank ADD COLUMN utilisation_of_shore_surroundings  integer ;
COMMENT ON COLUMN qgep.od_river_bank.utilisation_of_shore_surroundings IS 'yyy_Nutzung des Gewässerumlandes / Nutzung des Gewässerumlandes / Utilisation du sol des environs';
 ALTER TABLE qgep.od_river_bank ADD COLUMN vegetation  integer ;
COMMENT ON COLUMN qgep.od_river_bank.vegetation IS 'yyy_Nutzung des Gewässerumlandes / Nutzung des Gewässerumlandes / Utilisation du sol des environs';
 ALTER TABLE qgep.od_river_bank ADD COLUMN width  decimal(7,2) ;
COMMENT ON COLUMN qgep.od_river_bank.width IS 'yyy_Breite des Bereiches oberhalb des Böschungsfusses bis zum Gebiet mit "intensiver Landnutzung" / Breite des Bereiches oberhalb des Böschungsfusses bis zum Gebiet mit "intensiver Landnutzung" / Distance horizontale de la zone comprise entre le pied de la berge et la zone d''utilisation intensive du sol';
 ALTER TABLE qgep.od_river_bank ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_river_bank.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_river_bank ADD COLUMN dataowner varchar(80) ;
COMMENT ON COLUMN qgep.od_river_bank.dataowner IS 'Metaattribute dataowner - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Maître des données gestionnaire de données, qui est la personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_river_bank ADD COLUMN provider varchar(80) ;
COMMENT ON COLUMN qgep.od_river_bank.provider IS 'Metaattribute provider - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / FOURNISSEUR DES DONNEES Organisation qui crée lenregistrement de ces données ';
-------
CREATE TABLE qgep.od_surface_water_bodies
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_surface_water_bodies_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_surface_water_bodies_obj_id ON qgep.od_surface_water_bodies USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_surface_water_bodies_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_surface_water_bodies ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_surface_water_bodies');
COMMENT ON COLUMN qgep.od_surface_water_bodies.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_surface_water_bodies ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_surface_water_bodies_identifier ON qgep.od_surface_water_bodies USING btree (identifier);
COMMENT ON COLUMN qgep.od_surface_water_bodies.identifier IS '';
 ALTER TABLE qgep.od_surface_water_bodies ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_surface_water_bodies.remark IS 'General remarks / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_surface_water_bodies ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_surface_water_bodies.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_surface_water_bodies ADD COLUMN dataowner varchar(80) ;
COMMENT ON COLUMN qgep.od_surface_water_bodies.dataowner IS 'Metaattribute dataowner - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Maître des données gestionnaire de données, qui est la personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_surface_water_bodies ADD COLUMN provider varchar(80) ;
COMMENT ON COLUMN qgep.od_surface_water_bodies.provider IS 'Metaattribute provider - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / FOURNISSEUR DES DONNEES Organisation qui crée lenregistrement de ces données ';
-------
CREATE TABLE qgep.od_profile_geometry
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_profile_geometry_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_profile_geometry_obj_id ON qgep.od_profile_geometry USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_profile_geometry_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_profile_geometry ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_profile_geometry');
COMMENT ON COLUMN qgep.od_profile_geometry.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_profile_geometry ADD COLUMN position  smallint ;
COMMENT ON COLUMN qgep.od_profile_geometry.position IS 'yyy_Position der Detailpunkte der Geometrie / Position der Detailpunkte der Geometrie / Position des points d''appui de la géométrie';
 ALTER TABLE qgep.od_profile_geometry ADD COLUMN x  real ;
COMMENT ON COLUMN qgep.od_profile_geometry.x IS 'x';
 ALTER TABLE qgep.od_profile_geometry ADD COLUMN y  real ;
COMMENT ON COLUMN qgep.od_profile_geometry.y IS 'y';
 ALTER TABLE qgep.od_profile_geometry ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_profile_geometry.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_profile_geometry ADD COLUMN dataowner varchar(80) ;
COMMENT ON COLUMN qgep.od_profile_geometry.dataowner IS 'Metaattribute dataowner - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Maître des données gestionnaire de données, qui est la personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_profile_geometry ADD COLUMN provider varchar(80) ;
COMMENT ON COLUMN qgep.od_profile_geometry.provider IS 'Metaattribute provider - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / FOURNISSEUR DES DONNEES Organisation qui crée lenregistrement de ces données ';
-------
CREATE TABLE qgep.od_hydr_geometry
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_hydr_geometry_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_hydr_geometry_obj_id ON qgep.od_hydr_geometry USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_hydr_geometry_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_hydr_geometry ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_hydr_geometry');
COMMENT ON COLUMN qgep.od_hydr_geometry.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_hydr_geometry ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_hydr_geometry_identifier ON qgep.od_hydr_geometry USING btree (identifier);
COMMENT ON COLUMN qgep.od_hydr_geometry.identifier IS '';
 ALTER TABLE qgep.od_hydr_geometry ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_hydr_geometry.remark IS 'General remarks / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_hydr_geometry ADD COLUMN storage_volume  decimal(9,2) ;
COMMENT ON COLUMN qgep.od_hydr_geometry.storage_volume IS 'yyy_Speicherinhalt im Becken und im Zulauf zwischen Wehrkrone und dem Wasserspiegel bei Qan. Bei Regenbeckenüberlaufbecken im Nebenschluss ist der Stauraum beim vorgelagerten Trennbauwerk bzw. Regenüberlauf zu erfassen (vgl. Erläuterungen Inhalt_Fangteil  / Speicherinhalt im Becken und im Zulauf zwischen Wehrkrone und dem Wasserspiegel bei Qan. Bei Regenbeckenüberlaufbecken im Nebenschluss ist der Stauraum beim vorgelagerten Trennbauwerk bzw. Regenüberlauf zu erfassen (vgl. Erläuterungen Inhalt_Fangteil reps / Volume de stockage dans un bassin et dans la canalisation damenée entre la crête et le niveau deau de Qdim (débit conservé). Lors de bassins deaux pluviales en connexion latérale, le volume de stockage est à saisir à louvrage de répartition, resp. dév';
 ALTER TABLE qgep.od_hydr_geometry ADD COLUMN usable_capacity_storage  decimal(9,2) ;
COMMENT ON COLUMN qgep.od_hydr_geometry.usable_capacity_storage IS 'yyy_Inhalt der Kammer unterhalb der Wehrkrone ohne Stauraum im Zulaufkanal. Letzterer wird unter dem Attribut Stauraum erfasst (bei Anordnung im Hauptschluss auf der Stammkarte des Hauptbauwerkes, bei Anordnung im Nebenschluss auf der Stammkarte des vorge / Inhalt der Kammer unterhalb der Wehrkrone ohne Stauraum im Zulaufkanal. Letzterer wird unter dem Attribut Stauraum erfasst (bei Anordnung im Hauptschluss auf der Stammkarte des Hauptbauwerkes, bei Anordnung im Nebenschluss auf der Stammkarte des vorgelage / Volume de la chambre sous la crête, sans volume de stockage de la canalisation damenée. Ce dernier est saisi par lattribut volume de stockage (lors de disposition en connexion directe ceci se fait dans la fiche technique de louvrage principal, lors de ';
 ALTER TABLE qgep.od_hydr_geometry ADD COLUMN usable_capacity_treatment  decimal(9,2) ;
COMMENT ON COLUMN qgep.od_hydr_geometry.usable_capacity_treatment IS 'yyy_Inhalt der Kammer unterhalb der Wehrkrone inkl. Einlaufbereich, Auslaufbereich und Sedimentationsbereich, ohne Stauraum im Zulaufkanal.  Letzterer wird unter dem Attribut Stauraum erfasst (bei Anordnung im Hauptschluss auf der Stammkarte des Hauptbauw / Inhalt der Kammer unterhalb der Wehrkrone inkl. Einlaufbereich, Auslaufbereich und Sedimentationsbereich, ohne Stauraum im Zulaufkanal. Letzterer wird unter dem Attribut Stauraum erfasst (bei Anordnung im Hauptschluss auf der Stammkarte des Hauptbauwerkes / Volume de la chambre sous la crête, incl. lentrée, la sortie et la partie de sédimentation, sans volume de stockage de la canalisation damenée. Ce dernier est saisi par lattribut volume de stockage (lors de disposition en connexion directe ceci se fait';
 ALTER TABLE qgep.od_hydr_geometry ADD COLUMN utilisable_capacity  decimal(9,2) ;
COMMENT ON COLUMN qgep.od_hydr_geometry.utilisable_capacity IS 'yyy_Inhalt der Kammer unterhalb Notüberlauf oder Bypass (maximal mobilisierbares Volumen, inkl. Stauraum im Zulaufkanal). Für RRB und RRK. Für RÜB Nutzinhalt_Fangteil und Nutzinhalt_Klaerteil benutzen. Zusätzlich auch Stauraum erfassen. / Inhalt der Kammer unterhalb Notüberlauf oder Bypass (maximal mobilisierbares Volumen, inkl. Stauraum im Zulaufkanal). Für RRB und RRK. Für RÜB Nutzinhalt_Fangteil und Nutzinhalt_Klaerteil benutzen. Zusätzlich auch Stauraum erfassen. / Pour les bassins et canalisations daccumulation : Volume de la chambre sous la surverse de secours ou bypass (volume mobilisable maximum, incl. le volume de stockage de la canalisation damenée). Pour les BEP il sagit du VOLUME_UTILE_STOCKAGE et du VOLU';
 ALTER TABLE qgep.od_hydr_geometry ADD COLUMN volume_pump_sump  decimal(9,2) ;
COMMENT ON COLUMN qgep.od_hydr_geometry.volume_pump_sump IS 'yyy_Volumen des Pumpensumpfs von der Sohle bis zur maximal möglichen Wasserspiegellage (inkl. Kanalspeichervolumen im Zulaufkanal). / Volumen des Pumpensumpfs von der Sohle bis zur maximal möglichen Wasserspiegellage (inkl. Kanalspeichervolumen im Zulaufkanal). / Volume du puisard calculée à partir du radier jusquau niveau deau maximum possible (incl. le volume de stockage de la canalisation damenée).';
 ALTER TABLE qgep.od_hydr_geometry ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_hydr_geometry.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_hydr_geometry ADD COLUMN dataowner varchar(80) ;
COMMENT ON COLUMN qgep.od_hydr_geometry.dataowner IS 'Metaattribute dataowner - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Maître des données gestionnaire de données, qui est la personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_hydr_geometry ADD COLUMN provider varchar(80) ;
COMMENT ON COLUMN qgep.od_hydr_geometry.provider IS 'Metaattribute provider - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / FOURNISSEUR DES DONNEES Organisation qui crée lenregistrement de ces données ';
-------
CREATE TABLE qgep.od_hq_relation
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_hq_relation_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_hq_relation_obj_id ON qgep.od_hq_relation USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_hq_relation_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_hq_relation ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_hq_relation');
COMMENT ON COLUMN qgep.od_hq_relation.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_hq_relation ADD COLUMN altitude  decimal(7,3) ;
COMMENT ON COLUMN qgep.od_hq_relation.altitude IS 'yyy_Zum Abfluss (Q2) korrelierender Wasserspiegel (h) / Zum Abfluss (Q2) korrelierender Wasserspiegel (h) / Niveau d''eau correspondant (h) au débit (Q2)';
 ALTER TABLE qgep.od_hq_relation ADD COLUMN flow  decimal(9,3) ;
COMMENT ON COLUMN qgep.od_hq_relation.flow IS 'Flow (Q2) in direction of WWTP / Abflussmenge (Q2) Richtung ARA / Débit d''eau (Q2) en direction de la STEP';
 ALTER TABLE qgep.od_hq_relation ADD COLUMN flow_from  decimal(9,3) ;
COMMENT ON COLUMN qgep.od_hq_relation.flow_from IS 'yyy_Zufluss (Q1) / Zufluss (Q1) / Débit dentrée  (Q1)';
 ALTER TABLE qgep.od_hq_relation ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_hq_relation.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_hq_relation ADD COLUMN dataowner varchar(80) ;
COMMENT ON COLUMN qgep.od_hq_relation.dataowner IS 'Metaattribute dataowner - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Maître des données gestionnaire de données, qui est la personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_hq_relation ADD COLUMN provider varchar(80) ;
COMMENT ON COLUMN qgep.od_hq_relation.provider IS 'Metaattribute provider - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / FOURNISSEUR DES DONNEES Organisation qui crée lenregistrement de ces données ';
-------
CREATE TABLE qgep.od_reach_point
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_reach_point_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_reach_point_obj_id ON qgep.od_reach_point USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_reach_point_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_reach_point ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_reach_point');
COMMENT ON COLUMN qgep.od_reach_point.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_reach_point ADD COLUMN elevation_accuracy  integer ;
COMMENT ON COLUMN qgep.od_reach_point.elevation_accuracy IS 'yyy_Quantifizierung der Genauigkeit der Höhenlage der Kote in Relation zum Höhenfixpunktnetz (z.B. Grundbuchvermessung oder Landesnivellement). / Quantifizierung der Genauigkeit der Höhenlage der Kote in Relation zum Höhenfixpunktnetz (z.B. Grundbuchvermessung oder Landesnivellement). / Plage de précision des coordonnées altimétriques du point de tronçon';
 ALTER TABLE qgep.od_reach_point ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_reach_point_identifier ON qgep.od_reach_point USING btree (identifier);
COMMENT ON COLUMN qgep.od_reach_point.identifier IS 'yyy_Quantifizierung der Genauigkeit der Höhenlage der Kote in Relation zum Höhenfixpunktnetz (z.B. Grundbuchvermessung oder Landesnivellement). / Quantifizierung der Genauigkeit der Höhenlage der Kote in Relation zum Höhenfixpunktnetz (z.B. Grundbuchvermessung oder Landesnivellement). / Plage de précision des coordonnées altimétriques du point de tronçon';
 ALTER TABLE qgep.od_reach_point ADD COLUMN level  decimal(7,3) ;
COMMENT ON COLUMN qgep.od_reach_point.level IS 'yyy_Sohlenhöhe des Haltungsendes / Sohlenhöhe des Haltungsendes / Cote du radier de la fin du tronçon';
 ALTER TABLE qgep.od_reach_point ADD COLUMN outlet_shape  integer ;
COMMENT ON COLUMN qgep.od_reach_point.outlet_shape IS 'Kind of outlet shape / Art des Auslaufs / Types de sortie';
 ALTER TABLE qgep.od_reach_point ADD COLUMN position_of_connection  smallint ;
COMMENT ON COLUMN qgep.od_reach_point.position_of_connection IS 'yyy_Anschlussstelle bezogen auf Querschnitt im Kanal; in Fliessrichtung  (für Haus- und Strassenanschlüsse) / Anschlussstelle bezogen auf Querschnitt im Kanal; in Fliessrichtung  (für Haus- und Strassenanschlüsse) / Emplacement de raccordement Référence à la section transversale dans le canal dans le sens découlement (pour les raccordements domestiques et de rue).';
 ALTER TABLE qgep.od_reach_point ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_reach_point.remark IS 'General remarks / Allgemeine Bemerkungen / Remarques générales';
SELECT AddGeometryColumn('qgep', 'od_reach_point', 'situation_geometry', 21781, 'POINT', 2, true);
CREATE INDEX in_qgep_od_reach_point_situation_geometry ON qgep.od_reach_point USING gist (situation_geometry );
COMMENT ON COLUMN qgep.od_reach_point.situation_geometry IS 'National position coordinates (East, North) / Landeskoordinate Ost/Nord / Coordonnées nationales Est/Nord';
 ALTER TABLE qgep.od_reach_point ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_reach_point.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_reach_point ADD COLUMN dataowner varchar(80) ;
COMMENT ON COLUMN qgep.od_reach_point.dataowner IS 'Metaattribute dataowner - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Maître des données gestionnaire de données, qui est la personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_reach_point ADD COLUMN provider varchar(80) ;
COMMENT ON COLUMN qgep.od_reach_point.provider IS 'Metaattribute provider - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / FOURNISSEUR DES DONNEES Organisation qui crée lenregistrement de ces données ';
-------
CREATE TABLE qgep.od_structure_part
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_structure_part_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_structure_part_obj_id ON qgep.od_structure_part USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_structure_part_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_structure_part ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_structure_part');
COMMENT ON COLUMN qgep.od_structure_part.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_structure_part ADD COLUMN identifier  varchar(20) ;
 CREATE INDEX in_od_structure_part_identifier ON qgep.od_structure_part USING btree (identifier);
COMMENT ON COLUMN qgep.od_structure_part.identifier IS '';
 ALTER TABLE qgep.od_structure_part ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_structure_part.remark IS 'General remarks / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_structure_part ADD COLUMN renovation_demand  integer ;
COMMENT ON COLUMN qgep.od_structure_part.renovation_demand IS 'yyy_Zustandsinformation zum structure_part / Zustandsinformation zum Bauwerksteil / Information sur l''état de l''élément de l''ouvrage';
 ALTER TABLE qgep.od_structure_part ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_structure_part.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_structure_part ADD COLUMN dataowner varchar(80) ;
COMMENT ON COLUMN qgep.od_structure_part.dataowner IS 'Metaattribute dataowner - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Maître des données gestionnaire de données, qui est la personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_structure_part ADD COLUMN provider varchar(80) ;
COMMENT ON COLUMN qgep.od_structure_part.provider IS 'Metaattribute provider - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / FOURNISSEUR DES DONNEES Organisation qui crée lenregistrement de ces données ';
-------
CREATE TABLE qgep.od_throttle_shut_off_unit
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_throttle_shut_off_unit_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_throttle_shut_off_unit_obj_id ON qgep.od_throttle_shut_off_unit USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_throttle_shut_off_unit_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_throttle_shut_off_unit ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_throttle_shut_off_unit');
COMMENT ON COLUMN qgep.od_throttle_shut_off_unit.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_throttle_shut_off_unit ADD COLUMN actuation  integer ;
COMMENT ON COLUMN qgep.od_throttle_shut_off_unit.actuation IS 'Actuation of the throttle or shut-off unit / Antrieb der Einbaute / Entraînement des installations';
 ALTER TABLE qgep.od_throttle_shut_off_unit ADD COLUMN adjustability  integer ;
COMMENT ON COLUMN qgep.od_throttle_shut_off_unit.adjustability IS 'Possibility to adjust the position / Möglichkeit zur Verstellung / Possibilité de modifier la position';
 ALTER TABLE qgep.od_throttle_shut_off_unit ADD COLUMN control  integer ;
COMMENT ON COLUMN qgep.od_throttle_shut_off_unit.control IS 'Open or closed loop control unit for the installation / Steuer- und Regelorgan für die Einbaute / Dispositifs de commande et de régulation des installations';
 ALTER TABLE qgep.od_throttle_shut_off_unit ADD COLUMN cross_section  decimal(8,2) ;
COMMENT ON COLUMN qgep.od_throttle_shut_off_unit.cross_section IS 'Cross section (geometric area) of throttle or shut-off unit / Geometrischer Drosselquerschnitt: Fgeom / Section géométrique de l''élément régulateur';
 ALTER TABLE qgep.od_throttle_shut_off_unit ADD COLUMN effective_cross_section  decimal(8,2) ;
COMMENT ON COLUMN qgep.od_throttle_shut_off_unit.effective_cross_section IS 'Effective cross section (area) / Wirksamer Drosselquerschnitt : Fid / Section du limiteur hydrauliquement active';
 ALTER TABLE qgep.od_throttle_shut_off_unit ADD COLUMN gross_costs  decimal(10,2) ;
COMMENT ON COLUMN qgep.od_throttle_shut_off_unit.gross_costs IS 'Gross costs / Brutto Erstellungskosten / Coûts bruts de réalisation';
 ALTER TABLE qgep.od_throttle_shut_off_unit ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_throttle_shut_off_unit_identifier ON qgep.od_throttle_shut_off_unit USING btree (identifier);
COMMENT ON COLUMN qgep.od_throttle_shut_off_unit.identifier IS 'Gross costs / Brutto Erstellungskosten / Coûts bruts de réalisation';
 ALTER TABLE qgep.od_throttle_shut_off_unit ADD COLUMN kind  integer ;
COMMENT ON COLUMN qgep.od_throttle_shut_off_unit.kind IS 'Type of flow control / Art der Durchflussregulierung / Genre de régulation du débit';
 ALTER TABLE qgep.od_throttle_shut_off_unit ADD COLUMN manufacturer  varchar(50) ;
COMMENT ON COLUMN qgep.od_throttle_shut_off_unit.manufacturer IS 'Manufacturer of the electro-mechaninc equipment or installation / Hersteller der elektro-mech. Ausrüstung oder Einrichtung / Fabricant d''équipement électromécanique ou d''installations';
 ALTER TABLE qgep.od_throttle_shut_off_unit ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_throttle_shut_off_unit.remark IS 'General remarks / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_throttle_shut_off_unit ADD COLUMN signal_transmission  integer ;
COMMENT ON COLUMN qgep.od_throttle_shut_off_unit.signal_transmission IS 'Signal or data transfer from or to a telecommunication station sending_receiving / Signalübermittlung von und zu einer Fernwirkanlage / Transmission des signaux de et vers une station de télécommande';
 ALTER TABLE qgep.od_throttle_shut_off_unit ADD COLUMN subsidies  decimal(10,2) ;
COMMENT ON COLUMN qgep.od_throttle_shut_off_unit.subsidies IS 'yyy_Staats- und Bundesbeiträge / Staats- und Bundesbeiträge / Contributions des cantons et de la confédération';
 ALTER TABLE qgep.od_throttle_shut_off_unit ADD COLUMN throttle_unit_opening_current  smallint ;
COMMENT ON COLUMN qgep.od_throttle_shut_off_unit.throttle_unit_opening_current IS 'yyy_Folgende Werte sind anzugeben: Leapingwehr: Schrägdistanz der Blech- resp. Bodenöffnung. Drosselstrecke: keine zusätzlichen Angaben. Schieber / Schütz: lichte Höhe der Öffnung (ab Sohle bis UK Schieberplatte, tiefster Punkt). Abflussregulator: keine z / Folgende Werte sind anzugeben: Leapingwehr: Schrägdistanz der Blech- resp. Bodenöffnung. Drosselstrecke: keine zusätzlichen Angaben. Schieber / Schütz: lichte Höhe der Öffnung (ab Sohle bis UK Schieberplatte, tiefster Punkt). Abflussregulator: keine zusät / Les valeurs suivantes doivent être indiquées: Leaping weir: Longueur ouverture de fond, Cond. détranglement : aucune indication suppl., Vanne : hauteur max de louverture (du radier jusquau bord inférieur plaque, point le plus bas), Régulateur de débit ';
 ALTER TABLE qgep.od_throttle_shut_off_unit ADD COLUMN throttle_unit_opening_current_optimized  smallint ;
COMMENT ON COLUMN qgep.od_throttle_shut_off_unit.throttle_unit_opening_current_optimized IS 'yyy_Folgende Werte sind anzugeben: Leapingwehr: Schrägdistanz der Blech- resp. Bodenöffnung. Drosselstrecke: keine zusätzlichen Angaben. Schieber / Schütz: lichte Höhe der Öffnung (ab Sohle bis UK Schieberplatte, tiefster Punkt). Abflussregulator: keine z / Folgende Werte sind anzugeben: Leapingwehr: Schrägdistanz der Blech- resp. Bodenöffnung. Drosselstrecke: keine zusätzlichen Angaben. Schieber / Schütz: lichte Höhe der Öffnung (ab Sohle bis UK Schieberplatte, tiefster Punkt). Abflussregulator: keine zusät / Les valeurs suivantes doivent être indiquées: Leaping weir: Longueur ouverture de fond, Cond. détranglement : aucune indication suppl., Vanne : hauteur max de louverture (du radier jusquau bord inférieur plaque, point le plus bas), Régulateur de débit ';
 ALTER TABLE qgep.od_throttle_shut_off_unit ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_throttle_shut_off_unit.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_throttle_shut_off_unit ADD COLUMN dataowner varchar(80) ;
COMMENT ON COLUMN qgep.od_throttle_shut_off_unit.dataowner IS 'Metaattribute dataowner - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Maître des données gestionnaire de données, qui est la personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_throttle_shut_off_unit ADD COLUMN provider varchar(80) ;
COMMENT ON COLUMN qgep.od_throttle_shut_off_unit.provider IS 'Metaattribute provider - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / FOURNISSEUR DES DONNEES Organisation qui crée lenregistrement de ces données ';
-------
CREATE TABLE qgep.od_maintenance_event
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_maintenance_event_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_maintenance_event_obj_id ON qgep.od_maintenance_event USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_maintenance_event_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_maintenance_event ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_maintenance_event');
COMMENT ON COLUMN qgep.od_maintenance_event.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_maintenance_event ADD COLUMN base_data  varchar(50) ;
COMMENT ON COLUMN qgep.od_maintenance_event.base_data IS 'e.g. damage protocol / Z.B. Schadensprotokoll / par ex. protocole de dommages';
 ALTER TABLE qgep.od_maintenance_event ADD COLUMN cost  decimal(10,2) ;
COMMENT ON COLUMN qgep.od_maintenance_event.cost IS 'e.g. damage protocol / Z.B. Schadensprotokoll / par ex. protocole de dommages';
 ALTER TABLE qgep.od_maintenance_event ADD COLUMN data_details  varchar(50) ;
COMMENT ON COLUMN qgep.od_maintenance_event.data_details IS 'yyy_Ort, wo sich weitere Detailinformationen zum Ereignis finden (z.B. Nr. eines Videobandes) / Ort, wo sich weitere Detailinformationen zum Ereignis finden (z.B. Nr. eines Videobandes) / Lieu où se trouvent les données détaillées (par ex. n° d''une bande vidéo)';
 ALTER TABLE qgep.od_maintenance_event ADD COLUMN duration  smallint ;
COMMENT ON COLUMN qgep.od_maintenance_event.duration IS 'Duration of event in days / Dauer des Ereignisses in Tagen / Durée de l''événement en jours';
 ALTER TABLE qgep.od_maintenance_event ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_maintenance_event_identifier ON qgep.od_maintenance_event USING btree (identifier);
COMMENT ON COLUMN qgep.od_maintenance_event.identifier IS 'Duration of event in days / Dauer des Ereignisses in Tagen / Durée de l''''événement en jours';
 ALTER TABLE qgep.od_maintenance_event ADD COLUMN kind  integer ;
COMMENT ON COLUMN qgep.od_maintenance_event.kind IS 'Type of event / Art des Ereignisses / Genre d''événement';
 ALTER TABLE qgep.od_maintenance_event ADD COLUMN operator  varchar(50) ;
COMMENT ON COLUMN qgep.od_maintenance_event.operator IS 'yyy_Operating company or administration und Sachbearbeiter / Ausführende Firma oder Verwaltung und Sachbearbeiter / Bureau et responsable de saisie du bureau';
 ALTER TABLE qgep.od_maintenance_event ADD COLUMN reason  varchar(50) ;
COMMENT ON COLUMN qgep.od_maintenance_event.reason IS 'Reason for this event / Ursache für das Ereignis / Cause de l''événement';
 ALTER TABLE qgep.od_maintenance_event ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_maintenance_event.remark IS 'General remarks / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_maintenance_event ADD COLUMN result  varchar(50) ;
COMMENT ON COLUMN qgep.od_maintenance_event.result IS 'Result or important comments for this event / Resultat oder wichtige Bemerkungen aus Sicht des Bearbeiters / Résultat ou commentaire importante de l''événement';
 ALTER TABLE qgep.od_maintenance_event ADD COLUMN status  integer ;
COMMENT ON COLUMN qgep.od_maintenance_event.status IS 'Disposition state of the maintenance event / Phase in der sich das Erhaltungsereignis befindet / Phase dans laquelle se trouve l''événement de maintenance';
 ALTER TABLE qgep.od_maintenance_event ADD COLUMN time_point  timestamp without time zone ;
COMMENT ON COLUMN qgep.od_maintenance_event.time_point IS 'Date and time of the event / Zeitpunkt des Ereignisses / Date et heure de l''événement';
 ALTER TABLE qgep.od_maintenance_event ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_maintenance_event.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_maintenance_event ADD COLUMN dataowner varchar(80) ;
COMMENT ON COLUMN qgep.od_maintenance_event.dataowner IS 'Metaattribute dataowner - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Maître des données gestionnaire de données, qui est la personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_maintenance_event ADD COLUMN provider varchar(80) ;
COMMENT ON COLUMN qgep.od_maintenance_event.provider IS 'Metaattribute provider - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / FOURNISSEUR DES DONNEES Organisation qui crée lenregistrement de ces données ';
-------
CREATE TABLE qgep.od_pipe_profile
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_pipe_profile_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_pipe_profile_obj_id ON qgep.od_pipe_profile USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_pipe_profile_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_pipe_profile ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_pipe_profile');
COMMENT ON COLUMN qgep.od_pipe_profile.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_pipe_profile ADD COLUMN height_width_ratio  decimal(5,2) ;
COMMENT ON COLUMN qgep.od_pipe_profile.height_width_ratio IS 'height-width ratio / Verhältnis der Höhe zur Breite / Rapport entre la hauteur et la largeur';
 ALTER TABLE qgep.od_pipe_profile ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_pipe_profile_identifier ON qgep.od_pipe_profile USING btree (identifier);
COMMENT ON COLUMN qgep.od_pipe_profile.identifier IS 'height-width ratio / Verhältnis der Höhe zur Breite / Rapport entre la hauteur et la largeur';
 ALTER TABLE qgep.od_pipe_profile ADD COLUMN profile_type  integer ;
COMMENT ON COLUMN qgep.od_pipe_profile.profile_type IS 'Type of profile / Typ des Profils / Type du profil';
 ALTER TABLE qgep.od_pipe_profile ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_pipe_profile.remark IS 'General remarks / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_pipe_profile ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_pipe_profile.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_pipe_profile ADD COLUMN dataowner varchar(80) ;
COMMENT ON COLUMN qgep.od_pipe_profile.dataowner IS 'Metaattribute dataowner - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Maître des données gestionnaire de données, qui est la personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_pipe_profile ADD COLUMN provider varchar(80) ;
COMMENT ON COLUMN qgep.od_pipe_profile.provider IS 'Metaattribute provider - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / FOURNISSEUR DES DONNEES Organisation qui crée lenregistrement de ces données ';
-------
CREATE TABLE qgep.od_retention_body
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_retention_body_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_retention_body_obj_id ON qgep.od_retention_body USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_retention_body_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_retention_body ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_retention_body');
COMMENT ON COLUMN qgep.od_retention_body.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_retention_body ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_retention_body_identifier ON qgep.od_retention_body USING btree (identifier);
COMMENT ON COLUMN qgep.od_retention_body.identifier IS '';
 ALTER TABLE qgep.od_retention_body ADD COLUMN kind  integer ;
COMMENT ON COLUMN qgep.od_retention_body.kind IS 'Type of retention / Arten der Retention / Genre de rétention';
 ALTER TABLE qgep.od_retention_body ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_retention_body.remark IS 'General remarks / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_retention_body ADD COLUMN volume  decimal(9,2) ;
COMMENT ON COLUMN qgep.od_retention_body.volume IS 'yyy_Nutzbares Volumen des Retentionskörpers / Nutzbares Volumen des Retentionskörpers / Volume effectif du volume de rétention';
 ALTER TABLE qgep.od_retention_body ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_retention_body.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_retention_body ADD COLUMN dataowner varchar(80) ;
COMMENT ON COLUMN qgep.od_retention_body.dataowner IS 'Metaattribute dataowner - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Maître des données gestionnaire de données, qui est la personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_retention_body ADD COLUMN provider varchar(80) ;
COMMENT ON COLUMN qgep.od_retention_body.provider IS 'Metaattribute provider - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / FOURNISSEUR DES DONNEES Organisation qui crée lenregistrement de ces données ';
-------
CREATE TABLE qgep.od_wastewater_networkelement
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_wastewater_networkelement_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_wastewater_networkelement_obj_id ON qgep.od_wastewater_networkelement USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_wastewater_networkelement_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_wastewater_networkelement ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_wastewater_networkelement');
COMMENT ON COLUMN qgep.od_wastewater_networkelement.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_wastewater_networkelement ADD COLUMN identifier  varchar(25) ;
 CREATE INDEX in_od_wastewater_networkelement_identifier ON qgep.od_wastewater_networkelement USING btree (identifier);
COMMENT ON COLUMN qgep.od_wastewater_networkelement.identifier IS '';
 ALTER TABLE qgep.od_wastewater_networkelement ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_wastewater_networkelement.remark IS 'General remarks / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_wastewater_networkelement ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_wastewater_networkelement.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_wastewater_networkelement ADD COLUMN dataowner varchar(80) ;
COMMENT ON COLUMN qgep.od_wastewater_networkelement.dataowner IS 'Metaattribute dataowner - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Maître des données gestionnaire de données, qui est la personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_wastewater_networkelement ADD COLUMN provider varchar(80) ;
COMMENT ON COLUMN qgep.od_wastewater_networkelement.provider IS 'Metaattribute provider - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / FOURNISSEUR DES DONNEES Organisation qui crée lenregistrement de ces données ';
-------
CREATE TABLE qgep.od_overflow
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_overflow_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_overflow_obj_id ON qgep.od_overflow USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_overflow_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_overflow ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_overflow');
COMMENT ON COLUMN qgep.od_overflow.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_overflow ADD COLUMN actuation  integer ;
COMMENT ON COLUMN qgep.od_overflow.actuation IS 'Actuation of installation / Antrieb der Einbaute / Entraînement des installations';
 ALTER TABLE qgep.od_overflow ADD COLUMN adjustability  integer ;
COMMENT ON COLUMN qgep.od_overflow.adjustability IS 'yyy_Möglichkeit zur Verstellung / Möglichkeit zur Verstellung / Possibilité de modifier la position';
 ALTER TABLE qgep.od_overflow ADD COLUMN brand  varchar(50) ;
COMMENT ON COLUMN qgep.od_overflow.brand IS 'Manufacturer of the electro-mechaninc equipment or installation / Hersteller der elektro-mechanischen Ausrüstung oder Einrichtung / Fabricant d''équipement électromécanique ou d''installations';
 ALTER TABLE qgep.od_overflow ADD COLUMN control  integer ;
COMMENT ON COLUMN qgep.od_overflow.control IS 'yyy_Steuer- und Regelorgan für die Einbaute / Steuer- und Regelorgan für die Einbaute / Dispositifs de commande et de régulation des installations';
 ALTER TABLE qgep.od_overflow ADD COLUMN discharge_point  varchar(20) ;
COMMENT ON COLUMN qgep.od_overflow.discharge_point IS 'Identifier of discharge_point in which the overflow is discharging (redundant attribute with network follow up or result of that). Is only needed if overflow is discharging into a river (directly or via a rainwater drainage). / Bezeichnung der Einleitstelle in die der Ueberlauf entlastet (redundantes Attribut zur Netzverfolgung oder Resultat davon). Muss nur erfasst werden, wenn das Abwasser vom Notüberlauf in ein Gewässer eingeleitet wird (direkt oder über eine Regenabwasserlei / Désignation de l''exutoire: A indiquer uniquement lorsque leau déversée est rejetée dans un cours deau (directement ou indirectement via une conduite deaux pluviales).';
 ALTER TABLE qgep.od_overflow ADD COLUMN function  integer ;
COMMENT ON COLUMN qgep.od_overflow.function IS 'yyy_Teil des Mischwasserabflusses, der aus einem Überlauf in einen Vorfluter oder in ein Abwasserbauwerk abgeleitet wird / Teil des Mischwasserabflusses, der aus einem Überlauf in einen Vorfluter oder in ein Abwasserbauwerk abgeleitet wird / Type de déversoir';
 ALTER TABLE qgep.od_overflow ADD COLUMN gross_costs  decimal(10,2) ;
COMMENT ON COLUMN qgep.od_overflow.gross_costs IS 'Gross costs / Brutto Erstellungskosten / Coûts bruts de réalisation';
 ALTER TABLE qgep.od_overflow ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_overflow_identifier ON qgep.od_overflow USING btree (identifier);
COMMENT ON COLUMN qgep.od_overflow.identifier IS 'Gross costs / Brutto Erstellungskosten / Coûts bruts de réalisation';
 ALTER TABLE qgep.od_overflow ADD COLUMN qon_dim  decimal(9,3) ;
COMMENT ON COLUMN qgep.od_overflow.qon_dim IS 'yyy_Wassermenge, bei welcher der Überlauf gemäss Dimensionierung anspringt / Wassermenge, bei welcher der Überlauf gemäss Dimensionierung anspringt / Débit à partir duquel le déversoir devrait être fonctionnel (selon dimensionnement)';
 ALTER TABLE qgep.od_overflow ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_overflow.remark IS 'General remarks / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_overflow ADD COLUMN signal_transmission  integer ;
COMMENT ON COLUMN qgep.od_overflow.signal_transmission IS 'Signal or data transfer from or to a telecommunication station / Signalübermittlung von und zu einer Fernwirkanlage / Transmission des signaux de et vers une station de télécommande';
 ALTER TABLE qgep.od_overflow ADD COLUMN subsidies  decimal(10,2) ;
COMMENT ON COLUMN qgep.od_overflow.subsidies IS 'yyy_Staats- und Bundesbeiträge / Staats- und Bundesbeiträge / Contributions des cantons et de la confédération';
 ALTER TABLE qgep.od_overflow ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_overflow.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_overflow ADD COLUMN dataowner varchar(80) ;
COMMENT ON COLUMN qgep.od_overflow.dataowner IS 'Metaattribute dataowner - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Maître des données gestionnaire de données, qui est la personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_overflow ADD COLUMN provider varchar(80) ;
COMMENT ON COLUMN qgep.od_overflow.provider IS 'Metaattribute provider - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / FOURNISSEUR DES DONNEES Organisation qui crée lenregistrement de ces données ';
-------
CREATE TABLE qgep.od_mechanical_pretreatment
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_mechanical_pretreatment_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_mechanical_pretreatment_obj_id ON qgep.od_mechanical_pretreatment USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_mechanical_pretreatment_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_mechanical_pretreatment ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_mechanical_pretreatment');
COMMENT ON COLUMN qgep.od_mechanical_pretreatment.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_mechanical_pretreatment ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_mechanical_pretreatment_identifier ON qgep.od_mechanical_pretreatment USING btree (identifier);
COMMENT ON COLUMN qgep.od_mechanical_pretreatment.identifier IS '';
 ALTER TABLE qgep.od_mechanical_pretreatment ADD COLUMN kind  integer ;
COMMENT ON COLUMN qgep.od_mechanical_pretreatment.kind IS 'yyy_Arten der mechanischen Vorreinigung / Behandlung (gemäss VSA Richtlinie Regenwasserentsorgung (2002)) / Arten der mechanischen Vorreinigung / Behandlung (gemäss VSA Richtlinie Regenwasserentsorgung (2002)) / Genre de pré-épuration mécanique (selon directive VSA "Evacuation des eaux pluviales, édition 2002)';
 ALTER TABLE qgep.od_mechanical_pretreatment ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_mechanical_pretreatment.remark IS 'General remarks / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_mechanical_pretreatment ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_mechanical_pretreatment.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_mechanical_pretreatment ADD COLUMN dataowner varchar(80) ;
COMMENT ON COLUMN qgep.od_mechanical_pretreatment.dataowner IS 'Metaattribute dataowner - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Maître des données gestionnaire de données, qui est la personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_mechanical_pretreatment ADD COLUMN provider varchar(80) ;
COMMENT ON COLUMN qgep.od_mechanical_pretreatment.provider IS 'Metaattribute provider - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / FOURNISSEUR DES DONNEES Organisation qui crée lenregistrement de ces données ';
-------
CREATE TABLE qgep.od_wastewater_structure
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_wastewater_structure_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_wastewater_structure_obj_id ON qgep.od_wastewater_structure USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_wastewater_structure_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_wastewater_structure ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_wastewater_structure');
COMMENT ON COLUMN qgep.od_wastewater_structure.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_wastewater_structure ADD COLUMN accessibility  integer ;
COMMENT ON COLUMN qgep.od_wastewater_structure.accessibility IS 'yyy_Möglichkeit der Zugänglichkeit ins Innere eines Abwasserbauwerks für eine Person (nicht für ein Fahrzeug) / Möglichkeit der Zugänglichkeit ins Innere eines Abwasserbauwerks für eine Person (nicht für ein Fahrzeug) / Possibilités daccès à louvrage dassainissement pour une personne (non pour un véhicule)';
 ALTER TABLE qgep.od_wastewater_structure ADD COLUMN contract_section  varchar(50) ;
COMMENT ON COLUMN qgep.od_wastewater_structure.contract_section IS 'Number of contract section / Nummer des Bauloses / Numéro du lot de construction';
SELECT AddGeometryColumn('qgep', 'od_wastewater_structure', 'detail_geometry_geometry', 21781, 'POLYGON', 2, true);
CREATE INDEX in_qgep_od_wastewater_structure_detail_geometry_geometry ON qgep.od_wastewater_structure USING gist (detail_geometry_geometry );
COMMENT ON COLUMN qgep.od_wastewater_structure.detail_geometry_geometry IS 'Detail geometry especially with special structures. For manhole usually use dimension1 and 2. Also with normed infiltratin structures.  Channels usually do not have a detail_geometry. / Detaillierte Geometrie insbesondere bei Spezialbauwerken. Für Normschächte i.d. R.  Dimension1 und 2 verwenden. Dito bei normierten Versickerungsanlagen.  Kanäle haben normalerweise keine Detailgeometrie. / Géométrie détaillée particulièrement pour un OUVRAGE_SPECIAL. Pour lattribut CHAMBRE_STANDARD utilisez Dimension1 et 2, de même pour une INSTALLATION_INFILTRATION normée.  Les canalisations nont en général pas de géométrie détaillée.';
SELECT AddGeometryColumn('qgep', 'od_wastewater_structure', 'detail_geometry_3d_geometry', 21781, 'POLYGON', 3, true);
CREATE INDEX in_qgep_od_wastewater_structure_detail_geometry_3d_geometry ON qgep.od_wastewater_structure USING gist (detail_geometry_3d_geometry );
COMMENT ON COLUMN qgep.od_wastewater_structure.detail_geometry_3d_geometry IS 'Detail geometry (3D) especially with special structures. For manhole usually use dimension1 and 2. Also with normed infiltratin structures.  Channels usually do not have a detail_geometry. / Detaillierte Geometrie (3D) insbesondere bei Spezialbauwerken. Bei Normschächten mit Dimension1 und 2 arbeiten. Dito bei normierten Versickerungsanlagen. Kanäle haben normalerweise keine Detailgeometrie. / Géométrie détaillée (3D) particulièrement pour un OUVRAGE_SPECIAL. Pour lattribut CHAMBRE_STANDARD utilisez Dimension1 et 2, de même pour une INSTALLATION_INFILTRATION normée.Les canalisations nont en général pas de géométrie détaillée.';
 ALTER TABLE qgep.od_wastewater_structure ADD COLUMN financing  integer ;
COMMENT ON COLUMN qgep.od_wastewater_structure.financing IS ' Method of financing  (Financing based on GschG Art. 60a). / Finanzierungart (Finanzierung gemäss GschG Art. 60a). / Type de financement (financement selon LEaux Art. 60a)';
 ALTER TABLE qgep.od_wastewater_structure ADD COLUMN gross_costs  decimal(10,2) ;
COMMENT ON COLUMN qgep.od_wastewater_structure.gross_costs IS 'Gross costs of construction / Brutto Erstellungskosten / Coûts bruts des travaux de construction';
 ALTER TABLE qgep.od_wastewater_structure ADD COLUMN identifier  varchar(25) ;
 CREATE INDEX in_od_wastewater_structure_identifier ON qgep.od_wastewater_structure USING btree (identifier);
COMMENT ON COLUMN qgep.od_wastewater_structure.identifier IS 'yyy_Pro Datenherr eindeutige Bezeichnung / Pro Datenherr eindeutige Bezeichnung / Désignation unique pour chaque maître des données';
 ALTER TABLE qgep.od_wastewater_structure ADD COLUMN inspection_interval  decimal(4,2) ;
COMMENT ON COLUMN qgep.od_wastewater_structure.inspection_interval IS 'yyy_Abstände, in welchen das Abwasserbauwerk inspiziert werden sollte (Jahre) / Abstände, in welchen das Abwasserbauwerk inspiziert werden sollte (Jahre) / Fréquence à laquelle un ouvrage du réseau dassainissement devrait subir une inspection (années)';
 ALTER TABLE qgep.od_wastewater_structure ADD COLUMN location_name  varchar(50) ;
COMMENT ON COLUMN qgep.od_wastewater_structure.location_name IS 'Street name or name of the location of the structure / Strassenname oder Ortsbezeichnung  zum Bauwerk / Nom de la route ou du lieu de l''ouvrage';
 ALTER TABLE qgep.od_wastewater_structure ADD COLUMN records  TEXT ;
COMMENT ON COLUMN qgep.od_wastewater_structure.records IS 'yyy_Plan Nr. der Ausführungsdokumentation. Kurzbeschrieb weiterer Akten (Betriebsanleitung vom , etc.) / Plan Nr. der Ausführungsdokumentation. Kurzbeschrieb weiterer Akten (Betriebsanleitung vom , etc.) / N° de plan de la documentation dexécution, description de dossiers, manuels, etc.';
 ALTER TABLE qgep.od_wastewater_structure ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_wastewater_structure.remark IS 'General remarks / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_wastewater_structure ADD COLUMN renovation_necessity  integer ;
COMMENT ON COLUMN qgep.od_wastewater_structure.renovation_necessity IS 'yyy_Dringlichkeitsstufen und Zeithorizont für bauliche Massnahmen gemäss VSA-Richtline "Erhaltung von Kanalisationen" / Dringlichkeitsstufen und Zeithorizont für bauliche Massnahmen gemäss VSA-Richtline "Erhaltung von Kanalisationen" / 	Degrés durgence et délai de réalisation des mesures constructives selon la directive VSA "Maintien des canalisations"';
 ALTER TABLE qgep.od_wastewater_structure ADD COLUMN replacement_value  decimal(10,2) ;
COMMENT ON COLUMN qgep.od_wastewater_structure.replacement_value IS 'yyy_Wiederbeschaffungswert des Bauwerks. Zusätzlich muss auch das Attribut WBW_Basisjahr erfasst werden / Wiederbeschaffungswert des Bauwerks. Zusätzlich muss auch das Attribut WBW_Basisjahr erfasst werden / Valeur de remplacement de l''OUVRAGE_RESEAU_AS. On à besoin aussi de saisir l''attribut VR_ANNEE_REFERENCE';
 ALTER TABLE qgep.od_wastewater_structure ADD COLUMN rv_base_year  smallint ;
COMMENT ON COLUMN qgep.od_wastewater_structure.rv_base_year IS 'yyy_Basisjahr für die Kalkulation des Wiederbeschaffungswerts (siehe auch Wiederbeschaffungswert) / Basisjahr für die Kalkulation des Wiederbeschaffungswerts (siehe auch Attribut Wiederbeschaffungswert) / Année de référence pour le calcul de la valeur de remplacement (cf. valeur de remplacement)';
 ALTER TABLE qgep.od_wastewater_structure ADD COLUMN rv_construction_type  integer ;
COMMENT ON COLUMN qgep.od_wastewater_structure.rv_construction_type IS 'yyy_Grobe Einteilung der Bauart des Abwasserbauwerks als Inputwert für die Berechnung des Wiederbeschaffungswerts. / Grobe Einteilung der Bauart des Abwasserbauwerks als Inputwert für die Berechnung des Wiederbeschaffungswerts. / Valeur de remplacement du type de construction';
 ALTER TABLE qgep.od_wastewater_structure ADD COLUMN status  integer ;
COMMENT ON COLUMN qgep.od_wastewater_structure.status IS 'Operating and planning status of the structure / Betriebs- bzw. Planungszustand des Bauwerks / Etat de fonctionnement et de planification de louvrage';
 ALTER TABLE qgep.od_wastewater_structure ADD COLUMN structure_condition  integer ;
COMMENT ON COLUMN qgep.od_wastewater_structure.structure_condition IS 'yyy_Zustandsklassen. Beschreibung des baulichen Zustands des Kanals. Nicht zu verwechseln mit den Sanierungsstufen, welche die Prioritäten der Massnahmen bezeichnen (Attribut Sanierungsbedarf). / Zustandsklassen 0 bis 4 gemäss VSA-Richtline "Erhaltung von Kanalisationen". Beschreibung des baulichen Zustands des Abwasserbauwerks. Nicht zu verwechseln mit den Sanierungsstufen, welche die Prioritäten der Massnahmen bezeichnen (Attribut Sanierungsbeda / Classes d''état. Description de l''état constructif selon la directive VSA "Maintien des canalisations" (2007/2009). Ne pas confondre avec les degrés de remise en état (attribut NECESSITE_ASSAINIR)';
 ALTER TABLE qgep.od_wastewater_structure ADD COLUMN subsidies  decimal(10,2) ;
COMMENT ON COLUMN qgep.od_wastewater_structure.subsidies IS 'yyy_Staats- und Bundesbeiträge / Staats- und Bundesbeiträge / Contributions des cantons et de la Confédération';
 ALTER TABLE qgep.od_wastewater_structure ADD COLUMN year_of_construction  smallint ;
COMMENT ON COLUMN qgep.od_wastewater_structure.year_of_construction IS 'yyy_Jahr der Inbetriebsetzung (Schlussabnahme). Falls unbekannt = 1800 setzen (tiefster Wert des Wertebereiches) / Jahr der Inbetriebsetzung (Schlussabnahme). Falls unbekannt = 1800 setzen (tiefster Wert des Wertebereichs) / Année de mise en service (réception finale)';
 ALTER TABLE qgep.od_wastewater_structure ADD COLUMN year_of_replacement  smallint ;
COMMENT ON COLUMN qgep.od_wastewater_structure.year_of_replacement IS 'yyy_Jahr, in dem die Lebensdauer des Bauwerks voraussichtlich abläuft / Jahr, in dem die Lebensdauer des Bauwerks voraussichtlich abläuft / Année pour laquelle on prévoit que la durée de vie de l''ouvrage soit écoulée';
 ALTER TABLE qgep.od_wastewater_structure ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_wastewater_structure.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_wastewater_structure ADD COLUMN dataowner varchar(80) ;
COMMENT ON COLUMN qgep.od_wastewater_structure.dataowner IS 'Metaattribute dataowner - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Maître des données gestionnaire de données, qui est la personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_wastewater_structure ADD COLUMN provider varchar(80) ;
COMMENT ON COLUMN qgep.od_wastewater_structure.provider IS 'Metaattribute provider - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / FOURNISSEUR DES DONNEES Organisation qui crée lenregistrement de ces données ';
-------
CREATE TABLE qgep.od_hydraulic_characteristic_data
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_hydraulic_characteristic_data_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_hydraulic_characteristic_data_obj_id ON qgep.od_hydraulic_characteristic_data USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_hydraulic_characteristic_data_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_hydraulic_characteristic_data ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_hydraulic_characteristic_data');
COMMENT ON COLUMN qgep.od_hydraulic_characteristic_data.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_hydraulic_characteristic_data ADD COLUMN aggregate_number  smallint ;
COMMENT ON COLUMN qgep.od_hydraulic_characteristic_data.aggregate_number IS '';
 ALTER TABLE qgep.od_hydraulic_characteristic_data ADD COLUMN delivery_height_geodaetic  decimal(6,2) ;
COMMENT ON COLUMN qgep.od_hydraulic_characteristic_data.delivery_height_geodaetic IS '';
 ALTER TABLE qgep.od_hydraulic_characteristic_data ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_hydraulic_characteristic_data_identifier ON qgep.od_hydraulic_characteristic_data USING btree (identifier);
COMMENT ON COLUMN qgep.od_hydraulic_characteristic_data.identifier IS '';
 ALTER TABLE qgep.od_hydraulic_characteristic_data ADD COLUMN is_overflowing  integer ;
COMMENT ON COLUMN qgep.od_hydraulic_characteristic_data.is_overflowing IS 'yyy_Angabe, ob die Entlastung beim Dimensionierungsereignis anspringt / Angabe, ob die Entlastung beim Dimensionierungsereignis anspringt / Indication, si le déversoir déverse lors des événements pour lesquels il a été dimensionné.';
 ALTER TABLE qgep.od_hydraulic_characteristic_data ADD COLUMN main_weir_kind  integer ;
COMMENT ON COLUMN qgep.od_hydraulic_characteristic_data.main_weir_kind IS 'yyy_Art des Hauptwehrs am Knoten, falls mehrere Überläufe / Art des Hauptwehrs am Knoten, falls mehrere Überläufe / Genre du déversoir principal du noeud concerné s''il y a plusieurs déversoirs.';
 ALTER TABLE qgep.od_hydraulic_characteristic_data ADD COLUMN overcharge  smallint ;
COMMENT ON COLUMN qgep.od_hydraulic_characteristic_data.overcharge IS 'yyy_Optimale Mehrbelastung nach der Umsetzung der Massnahmen. / Ist: Mehrbelastung der untenliegenden Kanäle beim Dimensionierungsereignis = 100 * (Qab  Qan) / Qan 	[%]. Verhältnis zwischen der abgeleiteten Abwassermengen Richtung ARA beim Anspringen des Entlastungsbauwerkes (Qan) und Qab (Abwassermenge, welche beim  / Etat actuel: Surcharge optimale à létat actuel avant la réalisation déventuelles mesures;  actuel optimisé: Surcharge optimale à létat actuel avant la réalisation déventuelles mesures; prévu: Optimale Mehrbelastung nach der Umsetzung der Massnahmen.';
 ALTER TABLE qgep.od_hydraulic_characteristic_data ADD COLUMN overflow_duration  decimal(6,1) ;
COMMENT ON COLUMN qgep.od_hydraulic_characteristic_data.overflow_duration IS 'yyy_Mittlere Überlaufdauer pro Jahr. Bei Ist_Zustand: Berechnung mit geplanten Massnahmen. Bei Ist_optimiert:  Berechnung mit optimierten Einstellungen im Ist-Zustand vor der Umsetzung von allfälligen weiteren Massnahmen. Planungszustand: Berechnung mit g / Mittlere Überlaufdauer pro Jahr. Bei Ist_Zustand: Berechnung mit geplanten Massnahmen. Bei Ist_optimiert:  Berechnung mit optimierten Einstellungen im Ist-Zustand vor der Umsetzung von allfälligen weiteren Massnahmen. Planungszustand: Berechnung mit gepla / Durée moyenne de déversement par an.  Actuel: Durée moyenne de déversement par an selon des simulations pour de longs temps de retour (z > 10). Actuel optimizé: Calcul en mode optimal à létat actuel avant la réalisation déventuelles mesures. Prévu: Calc';
 ALTER TABLE qgep.od_hydraulic_characteristic_data ADD COLUMN overflow_freight  integer ;
COMMENT ON COLUMN qgep.od_hydraulic_characteristic_data.overflow_freight IS 'yyy_Mittlere Ueberlaufschmutzfracht pro Jahr / Mittlere Ueberlaufschmutzfracht pro Jahr / Charge polluante moyenne déversée par année';
 ALTER TABLE qgep.od_hydraulic_characteristic_data ADD COLUMN overflow_frequency  decimal(3,1) ;
COMMENT ON COLUMN qgep.od_hydraulic_characteristic_data.overflow_frequency IS 'yyy_Mittlere Überlaufhäufigkeit pro Jahr. Ist Zustand: Durchschnittliche Überlaufhäufigkeit pro Jahr von Entlastungsanlagen gemäss Langzeitsimulation (Dauer mindestens 10 Jahre). Ist optimiert: Berechnung mit optimierten Einstellungen im Ist-Zustand vor d / Mittlere Überlaufhäufigkeit pro Jahr. Ist Zustand: Durchschnittliche Überlaufhäufigkeit pro Jahr von Entlastungsanlagen gemäss Langzeitsimulation (Dauer mindestens 10 Jahre). Ist optimiert: Berechnung mit optimierten Einstellungen im Ist-Zustand vor der U / Fréquence moyenne de déversement par an. Fréquence moyenne de déversement par an selon des simulations pour de longs temps de retour (z > 10). Actuel optimizé: Calcul en mode optimal à létat actuel avant la réalisation déventuelles mesures. Prévu: Calcu';
 ALTER TABLE qgep.od_hydraulic_characteristic_data ADD COLUMN overflow_volume  decimal(9,2) ;
COMMENT ON COLUMN qgep.od_hydraulic_characteristic_data.overflow_volume IS 'yyy_Mittlere Überlaufwassermenge pro Jahr. Durchschnittliche Überlaufmenge pro Jahr von Entlastungsanlagen gemäss Langzeitsimulation (Dauer mindestens 10 Jahre). Ist optimiert: Berechnung mit optimierten Einstellungen im Ist-Zustand vor der Umsetzung von  / Mittlere Überlaufwassermenge pro Jahr. Durchschnittliche Überlaufmenge pro Jahr von Entlastungsanlagen gemäss Langzeitsimulation (Dauer mindestens 10 Jahre). Ist optimiert: Berechnung mit optimierten Einstellungen im Ist-Zustand vor der Umsetzung von allf / Volume moyen déversé par an. Volume moyen déversé par an selon des simulations pour de longs temps de retour (z > 10). Actuel optimizé: Calcul en mode optimal à létat actuel avant la réalisation déventuelles mesures. Prévu: Calcul après la réalisation d';
 ALTER TABLE qgep.od_hydraulic_characteristic_data ADD COLUMN pump_characteristics  integer ;
COMMENT ON COLUMN qgep.od_hydraulic_characteristic_data.pump_characteristics IS 'yyy_Bei speziellen Betriebsarten ist die Funktion separat zu dokumentieren und der Stammkarte beizulegen. / Bei speziellen Betriebsarten ist die Funktion separat zu dokumentieren und der Stammkarte beizulegen. / Pour de régime de fonctionnement spéciaux, cette fonction doit être documentée séparément et annexée à la fiche technique';
 ALTER TABLE qgep.od_hydraulic_characteristic_data ADD COLUMN pump_flow_max  decimal(9,3) ;
COMMENT ON COLUMN qgep.od_hydraulic_characteristic_data.pump_flow_max IS 'yyy_Maximaler Förderstrom der Pumpen (gesamtes Bauwerk). Tritt in der Regel bei der minimalen Förderhöhe ein. / Maximaler Förderstrom der Pumpen (gesamtes Bauwerk). Tritt in der Regel bei der minimalen Förderhöhe ein. / Débit de refoulement maximal de toutes les pompes de louvrage. Survient normalement à la hauteur min de refoulement.';
 ALTER TABLE qgep.od_hydraulic_characteristic_data ADD COLUMN pump_flow_min  decimal(9,3) ;
COMMENT ON COLUMN qgep.od_hydraulic_characteristic_data.pump_flow_min IS 'yyy_Minimaler Förderstrom der Pumpen zusammen (gesamtes Bauwerk). Tritt in der Regel bei der maximalen Förderhöhe ein. / Minimaler Förderstrom der Pumpen zusammen (gesamtes Bauwerk). Tritt in der Regel bei der maximalen Förderhöhe ein. / Débit de refoulement minimal de toutes les pompes de louvrage. Survient normalement à la hauteur max de refoulement.';
 ALTER TABLE qgep.od_hydraulic_characteristic_data ADD COLUMN pump_usage_current  integer ;
COMMENT ON COLUMN qgep.od_hydraulic_characteristic_data.pump_usage_current IS 'yyy_Nutzungsart_Ist des gepumpten Abwassers. / Nutzungsart_Ist des gepumpten Abwassers. / Genre d''utilisation actuel de l''eau usée pompée';
 ALTER TABLE qgep.od_hydraulic_characteristic_data ADD COLUMN q_discharge  decimal(9,3) ;
COMMENT ON COLUMN qgep.od_hydraulic_characteristic_data.q_discharge IS 'yyy_Qab gemäss GEP / Qab gemäss GEP / Qeff selon PGEE';
 ALTER TABLE qgep.od_hydraulic_characteristic_data ADD COLUMN qon  decimal(9,3) ;
COMMENT ON COLUMN qgep.od_hydraulic_characteristic_data.qon IS 'yyy_Wassermenge, bei welcher der Überlauf anspringt / Wassermenge, bei welcher der Überlauf anspringt / Débit à partir duquel le déversoir devrait être fonctionnel';
 ALTER TABLE qgep.od_hydraulic_characteristic_data ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_hydraulic_characteristic_data.remark IS 'yyy_Wassermenge, bei welcher der Überlauf anspringt / Wassermenge, bei welcher der Überlauf anspringt / Débit à partir duquel le déversoir devrait être fonctionnel / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_hydraulic_characteristic_data ADD COLUMN status  integer ;
COMMENT ON COLUMN qgep.od_hydraulic_characteristic_data.status IS 'yyy_Planungszustand der Hydraulischen Kennwerte (zwingend). Ueberlaufcharakteristik und Gesamteinzugsgebiet kann für verschiedene Stati gebildet werden und leitet sich aus dem Status der Hydr_Kennwerte ab. / Planungszustand der Hydraulischen Kennwerte (zwingend). Ueberlaufcharakteristik und Gesamteinzugsgebiet kann für verschiedene Stati gebildet werden und leitet sich aus dem Status der Hydr_Kennwerte ab. / Etat prévu des caractéristiques hydrauliques (obligatoire). Les caractéristiques de déversement et le bassin versant global peuvent être représentés à différents états et se laissent déduire à partir de lattribut PARAMETRES_HYDR';
 ALTER TABLE qgep.od_hydraulic_characteristic_data ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_hydraulic_characteristic_data.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_hydraulic_characteristic_data ADD COLUMN dataowner varchar(80) ;
COMMENT ON COLUMN qgep.od_hydraulic_characteristic_data.dataowner IS 'Metaattribute dataowner - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Maître des données gestionnaire de données, qui est la personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_hydraulic_characteristic_data ADD COLUMN provider varchar(80) ;
COMMENT ON COLUMN qgep.od_hydraulic_characteristic_data.provider IS 'Metaattribute provider - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / FOURNISSEUR DES DONNEES Organisation qui crée lenregistrement de ces données ';
-------
CREATE TABLE qgep.od_hydr_geom_relation
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_hydr_geom_relation_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_hydr_geom_relation_obj_id ON qgep.od_hydr_geom_relation USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_hydr_geom_relation_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_hydr_geom_relation ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_hydr_geom_relation');
COMMENT ON COLUMN qgep.od_hydr_geom_relation.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_hydr_geom_relation ADD COLUMN water_depth  decimal(7,2) ;
COMMENT ON COLUMN qgep.od_hydr_geom_relation.water_depth IS 'yyy_Massgebende Wassertiefe / Massgebende Wassertiefe / Profondeur d''eau déterminante';
 ALTER TABLE qgep.od_hydr_geom_relation ADD COLUMN water_surface  decimal(8,2) ;
COMMENT ON COLUMN qgep.od_hydr_geom_relation.water_surface IS 'yyy_Freie Wasserspiegelfläche; für Speicherfunktionen massgebend / Freie Wasserspiegelfläche; für Speicherfunktionen massgebend / Surface du plan d''eau; déterminant pour les fonctions d''accumulation';
 ALTER TABLE qgep.od_hydr_geom_relation ADD COLUMN wet_cross_section_area  decimal(8,2) ;
COMMENT ON COLUMN qgep.od_hydr_geom_relation.wet_cross_section_area IS 'yyy_Hydraulisch wirksamer Querschnitt für Verlustberechnungen / Hydraulisch wirksamer Querschnitt für Verlustberechnungen / Section hydrauliquement active pour les calculs des pertes de charge';
 ALTER TABLE qgep.od_hydr_geom_relation ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_hydr_geom_relation.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_hydr_geom_relation ADD COLUMN dataowner varchar(80) ;
COMMENT ON COLUMN qgep.od_hydr_geom_relation.dataowner IS 'Metaattribute dataowner - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Maître des données gestionnaire de données, qui est la personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_hydr_geom_relation ADD COLUMN provider varchar(80) ;
COMMENT ON COLUMN qgep.od_hydr_geom_relation.provider IS 'Metaattribute provider - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / FOURNISSEUR DES DONNEES Organisation qui crée lenregistrement de ces données ';
-------
CREATE TABLE qgep.od_accident
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_accident_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_accident_obj_id ON qgep.od_accident USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_accident_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_accident ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_accident');
COMMENT ON COLUMN qgep.od_accident.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_accident ADD COLUMN date  timestamp without time zone ;
COMMENT ON COLUMN qgep.od_accident.date IS 'Date of accident / Datum des Ereignisses / Date de l''événement';
 ALTER TABLE qgep.od_accident ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_accident_identifier ON qgep.od_accident USING btree (identifier);
COMMENT ON COLUMN qgep.od_accident.identifier IS 'Date of accident / Datum des Ereignisses / Date de l''''événement';
 ALTER TABLE qgep.od_accident ADD COLUMN place  varchar(50) ;
COMMENT ON COLUMN qgep.od_accident.place IS 'Adress of the location of accident / Adresse der Unfallstelle / Adresse du lieu de l''accident';
 ALTER TABLE qgep.od_accident ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_accident.remark IS 'General remarks / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_accident ADD COLUMN responsible  varchar(50) ;
COMMENT ON COLUMN qgep.od_accident.responsible IS 'Name of the responsible of the accident / Name Adresse des Verursachers / Nom et adresse de l''auteur';
SELECT AddGeometryColumn('qgep', 'od_accident', 'situation_geometry', 21781, 'POINT', 2, true);
CREATE INDEX in_qgep_od_accident_situation_geometry ON qgep.od_accident USING gist (situation_geometry );
COMMENT ON COLUMN qgep.od_accident.situation_geometry IS 'National position coordinates (North, East) of accident / Landeskoordinate Ost/Nord des Unfallortes / Coordonnées nationales Est/Nord du lieu d''accident';
 ALTER TABLE qgep.od_accident ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_accident.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_accident ADD COLUMN dataowner varchar(80) ;
COMMENT ON COLUMN qgep.od_accident.dataowner IS 'Metaattribute dataowner - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Maître des données gestionnaire de données, qui est la personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_accident ADD COLUMN provider varchar(80) ;
COMMENT ON COLUMN qgep.od_accident.provider IS 'Metaattribute provider - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / FOURNISSEUR DES DONNEES Organisation qui crée lenregistrement de ces données ';
-------
CREATE TABLE qgep.od_overflow_characteristic
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_overflow_characteristic_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_overflow_characteristic_obj_id ON qgep.od_overflow_characteristic USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_overflow_characteristic_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_overflow_characteristic ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_overflow_characteristic');
COMMENT ON COLUMN qgep.od_overflow_characteristic.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_overflow_characteristic ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_overflow_characteristic_identifier ON qgep.od_overflow_characteristic USING btree (identifier);
COMMENT ON COLUMN qgep.od_overflow_characteristic.identifier IS '';
 ALTER TABLE qgep.od_overflow_characteristic ADD COLUMN kind_overflow_characteristic  integer ;
COMMENT ON COLUMN qgep.od_overflow_characteristic.kind_overflow_characteristic IS 'yyy_Die Kennlinie ist als Q /Q- (bei Bodenöffnungen) oder als H/Q-Tabelle (bei Streichwehren) zu dokumentieren. Bei einer freien Aufteilung muss die Kennlinie nicht dokumentiert werden. Bei Abflussverhältnissen in Einstaubereichen ist die Funktion separat / Die Kennlinie ist als Q /Q- (bei Bodenöffnungen) oder als H/Q-Tabelle (bei Streichwehren) zu dokumentieren. Bei einer freien Aufteilung muss die Kennlinie nicht dokumentiert werden. Bei Abflussverhältnissen in Einstaubereichen ist die Funktion separat in  / La courbe est à documenter sous forme de rapport Q/Q (Leaping weir) ou H/Q (déversoir latéral). Les conditions découlement dans la chambre daccumulation sont à fournir en annexe.';
 ALTER TABLE qgep.od_overflow_characteristic ADD COLUMN overflow_characteristic_digital  integer ;
COMMENT ON COLUMN qgep.od_overflow_characteristic.overflow_characteristic_digital IS 'yyy_Falls Kennlinie_digital = ja müssen die Attribute für die Q-Q oder H-Q Beziehung  in Ueberlaufcharakteristik ausgefüllt sein in HQ_Relation. / Falls Kennlinie_digital = ja müssen die Attribute für die Q-Q oder H-Q Beziehung in HQ_Relation ausgefüllt sein. / Si courbe de fonctionnement numérique = oui, les attributs pour les relations Q-Q et H-Q doivent être saisis dans la classe RELATION_HQ.';
 ALTER TABLE qgep.od_overflow_characteristic ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_overflow_characteristic.remark IS 'General remarks / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_overflow_characteristic ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_overflow_characteristic.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_overflow_characteristic ADD COLUMN dataowner varchar(80) ;
COMMENT ON COLUMN qgep.od_overflow_characteristic.dataowner IS 'Metaattribute dataowner - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Maître des données gestionnaire de données, qui est la personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_overflow_characteristic ADD COLUMN provider varchar(80) ;
COMMENT ON COLUMN qgep.od_overflow_characteristic.provider IS 'Metaattribute provider - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / FOURNISSEUR DES DONNEES Organisation qui crée lenregistrement de ces données ';
-------
CREATE TABLE qgep.od_connection_object
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_connection_object_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_connection_object_obj_id ON qgep.od_connection_object USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_connection_object_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_connection_object ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_connection_object');
COMMENT ON COLUMN qgep.od_connection_object.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_connection_object ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_connection_object_identifier ON qgep.od_connection_object USING btree (identifier);
COMMENT ON COLUMN qgep.od_connection_object.identifier IS '';
 ALTER TABLE qgep.od_connection_object ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_connection_object.remark IS 'General remarks / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_connection_object ADD COLUMN sewer_infiltration_water_production  decimal(9,3) ;
COMMENT ON COLUMN qgep.od_connection_object.sewer_infiltration_water_production IS 'yyy_Durchschnittlicher Fremdwasseranfall für Fremdwasserquellen wie Laufbrunnen oder Reservoirüberlauf / Durchschnittlicher Fremdwasseranfall für Fremdwasserquellen wie Laufbrunnen oder Reservoirüberlauf / Apport moyen d''eaux claires parasites (ECP) par des sources d''ECP, telles que fontaines ou trops-plein de réservoirs';
 ALTER TABLE qgep.od_connection_object ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_connection_object.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_connection_object ADD COLUMN dataowner varchar(80) ;
COMMENT ON COLUMN qgep.od_connection_object.dataowner IS 'Metaattribute dataowner - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Maître des données gestionnaire de données, qui est la personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_connection_object ADD COLUMN provider varchar(80) ;
COMMENT ON COLUMN qgep.od_connection_object.provider IS 'Metaattribute provider - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / FOURNISSEUR DES DONNEES Organisation qui crée lenregistrement de ces données ';
-------
CREATE TABLE qgep.od_surface_runoff_parameters
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_surface_runoff_parameters_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_surface_runoff_parameters_obj_id ON qgep.od_surface_runoff_parameters USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_surface_runoff_parameters_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_surface_runoff_parameters ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_surface_runoff_parameters');
COMMENT ON COLUMN qgep.od_surface_runoff_parameters.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_surface_runoff_parameters ADD COLUMN evaporation_loss  decimal(4,1) ;
COMMENT ON COLUMN qgep.od_surface_runoff_parameters.evaporation_loss IS 'Loss by evaporation / Verlust durch Verdunstung / Pertes par évaporation au sol';
 ALTER TABLE qgep.od_surface_runoff_parameters ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_surface_runoff_parameters_identifier ON qgep.od_surface_runoff_parameters USING btree (identifier);
COMMENT ON COLUMN qgep.od_surface_runoff_parameters.identifier IS 'Loss by evaporation / Verlust durch Verdunstung / Pertes par évaporation au sol';
 ALTER TABLE qgep.od_surface_runoff_parameters ADD COLUMN infiltration_loss  decimal(4,1) ;
COMMENT ON COLUMN qgep.od_surface_runoff_parameters.infiltration_loss IS 'Loss by infiltration / Verlust durch Infiltration / Pertes par infiltration';
 ALTER TABLE qgep.od_surface_runoff_parameters ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_surface_runoff_parameters.remark IS 'General remarks / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_surface_runoff_parameters ADD COLUMN surface_storage  decimal(4,1) ;
COMMENT ON COLUMN qgep.od_surface_runoff_parameters.surface_storage IS 'Loss by filing depressions in the surface / Verlust durch Muldenfüllung / Pertes par remplissage de dépressions';
 ALTER TABLE qgep.od_surface_runoff_parameters ADD COLUMN wetting_loss  decimal(4,1) ;
COMMENT ON COLUMN qgep.od_surface_runoff_parameters.wetting_loss IS 'Loss of wetting plantes and surface during rainfall / Verlust durch Haftung des Niederschlages an Pflanzen- und andere Oberfläche / Pertes par rétention des précipitations sur la végétation et autres surfaces';
 ALTER TABLE qgep.od_surface_runoff_parameters ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_surface_runoff_parameters.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_surface_runoff_parameters ADD COLUMN dataowner varchar(80) ;
COMMENT ON COLUMN qgep.od_surface_runoff_parameters.dataowner IS 'Metaattribute dataowner - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Maître des données gestionnaire de données, qui est la personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_surface_runoff_parameters ADD COLUMN provider varchar(80) ;
COMMENT ON COLUMN qgep.od_surface_runoff_parameters.provider IS 'Metaattribute provider - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / FOURNISSEUR DES DONNEES Organisation qui crée lenregistrement de ces données ';
-------
CREATE TABLE qgep.od_hazard_source
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_hazard_source_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_hazard_source_obj_id ON qgep.od_hazard_source USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_hazard_source_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_hazard_source ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_hazard_source');
COMMENT ON COLUMN qgep.od_hazard_source.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_hazard_source ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_hazard_source_identifier ON qgep.od_hazard_source USING btree (identifier);
COMMENT ON COLUMN qgep.od_hazard_source.identifier IS '';
 ALTER TABLE qgep.od_hazard_source ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_hazard_source.remark IS 'General remarks / Allgemeine Bemerkungen / Remarques générales';
SELECT AddGeometryColumn('qgep', 'od_hazard_source', 'situation_geometry', 21781, 'POINT', 2, true);
CREATE INDEX in_qgep_od_hazard_source_situation_geometry ON qgep.od_hazard_source USING gist (situation_geometry );
COMMENT ON COLUMN qgep.od_hazard_source.situation_geometry IS 'National position coordinates (East, North) / Landeskoordinate Ost/Nord / Coordonnées nationales Est/Nord';
 ALTER TABLE qgep.od_hazard_source ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_hazard_source.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_hazard_source ADD COLUMN dataowner varchar(80) ;
COMMENT ON COLUMN qgep.od_hazard_source.dataowner IS 'Metaattribute dataowner - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Maître des données gestionnaire de données, qui est la personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_hazard_source ADD COLUMN provider varchar(80) ;
COMMENT ON COLUMN qgep.od_hazard_source.provider IS 'Metaattribute provider - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / FOURNISSEUR DES DONNEES Organisation qui crée lenregistrement de ces données ';
-------
CREATE TABLE qgep.od_substance
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_substance_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_substance_obj_id ON qgep.od_substance USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_substance_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_substance ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_substance');
COMMENT ON COLUMN qgep.od_substance.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_substance ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_substance_identifier ON qgep.od_substance USING btree (identifier);
COMMENT ON COLUMN qgep.od_substance.identifier IS '';
 ALTER TABLE qgep.od_substance ADD COLUMN kind  varchar(50) ;
COMMENT ON COLUMN qgep.od_substance.kind IS 'yyy_Liste der wassergefährdenden Stoffe / Liste der wassergefährdenden Stoffe / Liste des substances de nature à polluer les eaux';
 ALTER TABLE qgep.od_substance ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_substance.remark IS 'General remarks / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_substance ADD COLUMN stockage  varchar(50) ;
COMMENT ON COLUMN qgep.od_substance.stockage IS 'yyy_Art der Lagerung der abwassergefährdenden Stoffe / Art der Lagerung der abwassergefährdenden Stoffe / Genre de stockage des substances dangereuses';
 ALTER TABLE qgep.od_substance ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_substance.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_substance ADD COLUMN dataowner varchar(80) ;
COMMENT ON COLUMN qgep.od_substance.dataowner IS 'Metaattribute dataowner - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Maître des données gestionnaire de données, qui est la personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_substance ADD COLUMN provider varchar(80) ;
COMMENT ON COLUMN qgep.od_substance.provider IS 'Metaattribute provider - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / FOURNISSEUR DES DONNEES Organisation qui crée lenregistrement de ces données ';
-------
CREATE TABLE qgep.od_catchment_area
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_catchment_area_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_catchment_area_obj_id ON qgep.od_catchment_area USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_catchment_area_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_catchment_area ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_catchment_area');
COMMENT ON COLUMN qgep.od_catchment_area.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN direct_discharge_current  integer ;
COMMENT ON COLUMN qgep.od_catchment_area.direct_discharge_current IS 'The rain water is currently fully or partially discharged into a water body / Das Regenabwasser wird ganz oder teilweise über eine SAA-Leitung in ein Gewässer eingeleitet / Les eaux pluviales sont rejetées complètement ou partiellement via une conduite OAS dans un cours deau';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN direct_discharge_planned  integer ;
COMMENT ON COLUMN qgep.od_catchment_area.direct_discharge_planned IS 'The rain water will be discharged fully or partially over a SAA pipe into a water body / Das Regenabwasser wird in Zukunft ganz oder teilweise über eine SAA-Leitung in ein Gewässer eingeleitet / Les eaux pluviales seront rejetées complètement ou partiellement via une conduite OAS dans un cours deau';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN discharge_coefficient_rw_current  smallint ;
COMMENT ON COLUMN qgep.od_catchment_area.discharge_coefficient_rw_current IS 'yyy_Abflussbeiwert für den Regenabwasseranschluss im Ist-Zustand / Abflussbeiwert für den Regenabwasseranschluss im Ist-Zustand / Coefficient de ruissellement pour le raccordement actuel des eaux pluviales';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN discharge_coefficient_rw_planned  smallint ;
COMMENT ON COLUMN qgep.od_catchment_area.discharge_coefficient_rw_planned IS 'yyy_Abflussbeiwert für den Regenabwasseranschluss im Planungszustand / Abflussbeiwert für den Regenabwasseranschluss im Planungszustand / Coefficient de ruissellement prévu pour le raccordement des eaux pluviales';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN discharge_coefficient_ww_current  smallint ;
COMMENT ON COLUMN qgep.od_catchment_area.discharge_coefficient_ww_current IS 'yy_Abflussbeiwert für den Schmutz- oder Mischabwasseranschluss im Ist-Zustand / Abflussbeiwert für den Schmutz- oder Mischabwasseranschluss im Ist-Zustand / Coefficient de ruissellement pour les raccordements eaux usées et eaux mixtes actuels';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN discharge_coefficient_ww_planned  smallint ;
COMMENT ON COLUMN qgep.od_catchment_area.discharge_coefficient_ww_planned IS 'yyy_Abflussbeiwert für den Schmutz- oder Mischabwasseranschluss im Planungszustand / Abflussbeiwert für den Schmutz- oder Mischabwasseranschluss im Planungszustand / Coefficient de ruissellement pour le raccordement prévu des eaux usées ou mixtes';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN drainage_system_current  integer ;
COMMENT ON COLUMN qgep.od_catchment_area.drainage_system_current IS 'yyy_Effektive Entwässerungsart im Ist-Zustand / Effektive Entwässerungsart im Ist-Zustand / Genre dévacuation des eaux réel à létat actuel';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN drainage_system_planned  integer ;
COMMENT ON COLUMN qgep.od_catchment_area.drainage_system_planned IS 'yyy_Entwässerungsart im Planungszustand (nach Umsetzung des Entwässerungskonzepts). Dieses Attribut hat Auflagecharakter. Es ist verbindlich für die Beurteilung von Baugesuchen / Entwässerungsart im Planungszustand (nach Umsetzung des Entwässerungskonzepts). Dieses Attribut hat Auflagecharakter. Es ist verbindlich für die Beurteilung von Baugesuchen / Genre dévacuation des eaux à létat de planification (mise en uvre du concept dévacuation). Cet attribut est exigé. Il est obligatoire pour lexamen des demandes de permit de construire';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_catchment_area_identifier ON qgep.od_catchment_area USING btree (identifier);
COMMENT ON COLUMN qgep.od_catchment_area.identifier IS 'yyy_Entwässerungsart im Planungszustand (nach Umsetzung des Entwässerungskonzepts). Dieses Attribut hat Auflagecharakter. Es ist verbindlich für die Beurteilung von Baugesuchen / Entwässerungsart im Planungszustand (nach Umsetzung des Entwässerungskonzepts). Dieses Attribut hat Auflagecharakter. Es ist verbindlich für die Beurteilung von Baugesuchen / Genre dévacuation des eaux à létat de planification (mise en uvre du concept dévacuation). Cet attribut est exigé. Il est obligatoire pour lexamen des demandes de permit de construire';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN infiltration_current  integer ;
COMMENT ON COLUMN qgep.od_catchment_area.infiltration_current IS 'yyy_Das Regenabwasser wird ganz oder teilweise einer Versickerungsanlage zugeführt / Das Regenabwasser wird ganz oder teilweise einer Versickerungsanlage zugeführt / Les eaux pluviales sont amenées complètement ou partiellement à une installation dinfiltration';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN infiltration_planned  integer ;
COMMENT ON COLUMN qgep.od_catchment_area.infiltration_planned IS 'In the future the rain water will  be completly or partially infiltrated in a infiltration unit. / Das Regenabwasser wird in Zukunft ganz oder teilweise einer Versickerungsanlage zugeführt / Les eaux pluviales seront amenées complètement ou partiellement à une installation dinfiltration';
SELECT AddGeometryColumn('qgep', 'od_catchment_area', 'perimeter_geometry', 21781, 'POLYGON', 2, true);
CREATE INDEX in_qgep_od_catchment_area_perimeter_geometry ON qgep.od_catchment_area USING gist (perimeter_geometry );
COMMENT ON COLUMN qgep.od_catchment_area.perimeter_geometry IS 'Boundary points of the perimeter sub catchement area / Begrenzungspunkte des Teileinzugsgebiets / Points de délimitation du bassin versant partiel';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN population_density_current  smallint ;
COMMENT ON COLUMN qgep.od_catchment_area.population_density_current IS 'yyy_Dichte der (physischen) Einwohner im Ist-Zustand / Dichte der (physischen) Einwohner im Ist-Zustand / Densité (physique) de la population actuelle';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN population_density_planned  smallint ;
COMMENT ON COLUMN qgep.od_catchment_area.population_density_planned IS 'yyy_Dichte der (physischen) Einwohner im Planungszustand / Dichte der (physischen) Einwohner im Planungszustand / Densité (physique) de la population prévue';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_catchment_area.remark IS 'General remarks / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN retention_current  integer ;
COMMENT ON COLUMN qgep.od_catchment_area.retention_current IS 'yyy_Das Regen- oder Mischabwasser wird über Rückhalteeinrichtungen verzögert ins Kanalnetz eingeleitet. / Das Regen- oder Mischabwasser wird über Rückhalteeinrichtungen verzögert ins Kanalnetz eingeleitet. / Les eaux pluviales et mixtes sont rejetées de manière régulée dans le réseau des canalisations par un ouvrage de rétention.';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN retention_planned  integer ;
COMMENT ON COLUMN qgep.od_catchment_area.retention_planned IS 'yyy_Das Regen- oder Mischabwasser wird in Zukunft über Rückhalteeinrichtungen verzögert ins Kanalnetz eingeleitet. / Das Regen- oder Mischabwasser wird in Zukunft über Rückhalteeinrichtungen verzögert ins Kanalnetz eingeleitet. / Les eaux pluviales et mixtes seront rejetées de manière régulée dans le réseau des canalisations par un ouvrage de rétention.';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN runoff_limit_current  decimal(4,1) ;
COMMENT ON COLUMN qgep.od_catchment_area.runoff_limit_current IS 'yyy_Abflussbegrenzung, falls eine entsprechende Auflage bereits umgesetzt ist. / Abflussbegrenzung, falls eine entsprechende Auflage bereits umgesetzt ist. / Restriction de débit, si une exigence est déjà mise en uvre';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN runoff_limit_planned  decimal(4,1) ;
COMMENT ON COLUMN qgep.od_catchment_area.runoff_limit_planned IS 'yyy_Abflussbegrenzung, falls eine entsprechende Auflage aus dem Entwässerungskonzept vorliegt. Dieses Attribut hat Auflagecharakter. Es ist verbindlich für die Beurteilung von Baugesuchen / Abflussbegrenzung, falls eine entsprechende Auflage aus dem Entwässerungskonzept vorliegt. Dieses Attribut hat Auflagecharakter. Es ist verbindlich für die Beurteilung von Baugesuchen / Restriction de débit, si une exigence correspondante existe dans le concept dévacuation des eaux. Cet attribut est une exigence et obligatoire pour lexamen de demandes de permit de construire';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN seal_factor_rw_current  smallint ;
COMMENT ON COLUMN qgep.od_catchment_area.seal_factor_rw_current IS 'yyy_Befestigungsgrad für den Regenabwasseranschluss im Ist-Zustand / Befestigungsgrad für den Regenabwasseranschluss im Ist-Zustand / Taux d''imperméabilisation pour le raccordement eaux pluviales actuel';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN seal_factor_rw_planned  smallint ;
COMMENT ON COLUMN qgep.od_catchment_area.seal_factor_rw_planned IS 'yyy_Befestigungsgrad für den Regenabwasseranschluss im Planungszustand / Befestigungsgrad für den Regenabwasseranschluss im Planungszustand / Taux d''imperméabilisation pour le raccordement eaux pluviales prévu';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN seal_factor_ww_current  smallint ;
COMMENT ON COLUMN qgep.od_catchment_area.seal_factor_ww_current IS 'yyy_Befestigungsgrad für den Schmutz- oder Mischabwasseranschluss im Ist-Zustand / Befestigungsgrad für den Schmutz- oder Mischabwasseranschluss im Ist-Zustand / Taux d''imperméabilisation pour les raccordements eaux usées et eaux mixtes actuels';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN seal_factor_ww_planned  smallint ;
COMMENT ON COLUMN qgep.od_catchment_area.seal_factor_ww_planned IS 'yyy_Befestigungsgrad für den Schmutz- oder Mischabwasseranschluss im Planungszustand / Befestigungsgrad für den Schmutz- oder Mischabwasseranschluss im Planungszustand / Taux d''imperméabilisation pour les raccordements eaux usées et eaux mixtes prévus';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN sewer_infiltration_water_production_current  decimal(9,3) ;
COMMENT ON COLUMN qgep.od_catchment_area.sewer_infiltration_water_production_current IS 'yyy_Mittlerer Fremdwasseranfall, der im Ist-Zustand in die Schmutz- oder Mischabwasserkanalisation eingeleitet wird / Mittlerer Fremdwasseranfall, der im Ist-Zustand in die Schmutz- oder Mischabwasserkanalisation eingeleitet wird / Débit  d''eaux claires parasites (ECP) moyen actuel, rejeté dans les canalisation deaux usées ou mixtes';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN sewer_infiltration_water_production_planned  decimal(9,3) ;
COMMENT ON COLUMN qgep.od_catchment_area.sewer_infiltration_water_production_planned IS 'yyy_Mittlerer Fremdwasseranfall, der im Planungszustand in die Schmutz- oder Mischabwasserkanalisation eingeleitet wird. / Mittlerer Fremdwasseranfall, der im Planungszustand in die Schmutz- oder Mischabwasserkanalisation eingeleitet wird. / Débit  d''eaux claires parasites (ECP) moyen prévu, rejeté dans les canalisation deaux usées ou mixtes';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN surface_area  decimal(8,2) ;
COMMENT ON COLUMN qgep.od_catchment_area.surface_area IS 'yyy_redundantes Attribut Flaeche, welches die aus dem Perimeter errechnete Flaeche [ha] enthält / Redundantes Attribut Flaeche, welches die aus dem Perimeter errechnete Flaeche [ha] enthält / Attribut redondant indiquant la surface calculée à partir du périmètre en ha';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN waste_water_production_current  decimal(9,3) ;
COMMENT ON COLUMN qgep.od_catchment_area.waste_water_production_current IS 'yyy_Mittlerer Schmutzabwasseranfall, der im Ist-Zustand in die Schmutz- oder Mischabwasserkanalisation eingeleitet wird / Mittlerer Schmutzabwasseranfall, der im Ist-Zustand in die Schmutz- oder Mischabwasserkanalisation eingeleitet wird / Débit moyen actuel des eaux usées rejetées dans les canalisations deaux usées ou d''eaux mixtes';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN waste_water_production_planned  decimal(9,3) ;
COMMENT ON COLUMN qgep.od_catchment_area.waste_water_production_planned IS 'yyy_Mittlerer Schmutzabwasseranfall, der im Planungszustand in die Schmutz- oder Mischabwasserkanalisation eingeleitet wird. / Mittlerer Schmutzabwasseranfall, der im Planungszustand in die Schmutz- oder Mischabwasserkanalisation eingeleitet wird. / Débit moyen prévu des eaux usées rejetées dans les canalisations deaux usées ou d''eaux mixtes.';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_catchment_area.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN dataowner varchar(80) ;
COMMENT ON COLUMN qgep.od_catchment_area.dataowner IS 'Metaattribute dataowner - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Maître des données gestionnaire de données, qui est la personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN provider varchar(80) ;
COMMENT ON COLUMN qgep.od_catchment_area.provider IS 'Metaattribute provider - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / FOURNISSEUR DES DONNEES Organisation qui crée lenregistrement de ces données ';
-------
CREATE TABLE qgep.od_measuring_device
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_measuring_device_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_measuring_device_obj_id ON qgep.od_measuring_device USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_measuring_device_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_measuring_device ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_measuring_device');
COMMENT ON COLUMN qgep.od_measuring_device.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_measuring_device ADD COLUMN brand  varchar(50) ;
COMMENT ON COLUMN qgep.od_measuring_device.brand IS 'Brand / Name of producer / Name des Herstellers / Nom du fabricant';
 ALTER TABLE qgep.od_measuring_device ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_measuring_device_identifier ON qgep.od_measuring_device USING btree (identifier);
COMMENT ON COLUMN qgep.od_measuring_device.identifier IS 'Brand / Name of producer / Name des Herstellers / Nom du fabricant';
 ALTER TABLE qgep.od_measuring_device ADD COLUMN kind  integer ;
COMMENT ON COLUMN qgep.od_measuring_device.kind IS 'Type of measuring device / Typ des Messgerätes / Type de l''appareil de mesure';
 ALTER TABLE qgep.od_measuring_device ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_measuring_device.remark IS 'General remarks / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_measuring_device ADD COLUMN serial_number  varchar(50) ;
COMMENT ON COLUMN qgep.od_measuring_device.serial_number IS 'General remarks / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_measuring_device ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_measuring_device.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_measuring_device ADD COLUMN dataowner varchar(80) ;
COMMENT ON COLUMN qgep.od_measuring_device.dataowner IS 'Metaattribute dataowner - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Maître des données gestionnaire de données, qui est la personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_measuring_device ADD COLUMN provider varchar(80) ;
COMMENT ON COLUMN qgep.od_measuring_device.provider IS 'Metaattribute provider - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / FOURNISSEUR DES DONNEES Organisation qui crée lenregistrement de ces données ';
-------
CREATE TABLE qgep.od_measurement_series
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_measurement_series_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_measurement_series_obj_id ON qgep.od_measurement_series USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_measurement_series_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_measurement_series ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_measurement_series');
COMMENT ON COLUMN qgep.od_measurement_series.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_measurement_series ADD COLUMN dimension  varchar(50) ;
COMMENT ON COLUMN qgep.od_measurement_series.dimension IS 'yyy_Messtypen (Einheit) / Messtypen (Einheit) / Types de mesures';
 ALTER TABLE qgep.od_measurement_series ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_measurement_series_identifier ON qgep.od_measurement_series USING btree (identifier);
COMMENT ON COLUMN qgep.od_measurement_series.identifier IS 'yyy_Messtypen (Einheit) / Messtypen (Einheit) / Types de mesures';
 ALTER TABLE qgep.od_measurement_series ADD COLUMN kind  integer ;
COMMENT ON COLUMN qgep.od_measurement_series.kind IS 'Type of measurment series / Art der Messreihe / Genre de série de mesures';
 ALTER TABLE qgep.od_measurement_series ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_measurement_series.remark IS 'General remarks / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_measurement_series ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_measurement_series.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_measurement_series ADD COLUMN dataowner varchar(80) ;
COMMENT ON COLUMN qgep.od_measurement_series.dataowner IS 'Metaattribute dataowner - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Maître des données gestionnaire de données, qui est la personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_measurement_series ADD COLUMN provider varchar(80) ;
COMMENT ON COLUMN qgep.od_measurement_series.provider IS 'Metaattribute provider - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / FOURNISSEUR DES DONNEES Organisation qui crée lenregistrement de ces données ';
-------
CREATE TABLE qgep.od_measurement_result
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_measurement_result_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_measurement_result_obj_id ON qgep.od_measurement_result USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_measurement_result_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_measurement_result ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_measurement_result');
COMMENT ON COLUMN qgep.od_measurement_result.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_measurement_result ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_measurement_result_identifier ON qgep.od_measurement_result USING btree (identifier);
COMMENT ON COLUMN qgep.od_measurement_result.identifier IS '';
 ALTER TABLE qgep.od_measurement_result ADD COLUMN measurement_type  integer ;
COMMENT ON COLUMN qgep.od_measurement_result.measurement_type IS 'Type of measurment, e.g. proportional to time or volume / Art der Messung, z.B zeit- oder mengenproportional / Type de mesure, par ex. proportionnel au temps ou au débit';
 ALTER TABLE qgep.od_measurement_result ADD COLUMN measuring_duration  decimal(7,0) ;
COMMENT ON COLUMN qgep.od_measurement_result.measuring_duration IS 'Duration of measurment in seconds / Dauer der Messung in Sekunden / Durée de la mesure';
 ALTER TABLE qgep.od_measurement_result ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_measurement_result.remark IS 'General remarks / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_measurement_result ADD COLUMN time  timestamp without time zone ;
COMMENT ON COLUMN qgep.od_measurement_result.time IS 'Date and time at beginning of measurment / Zeitpunkt des Messbeginns / Date et heure du début de la mesure';
 ALTER TABLE qgep.od_measurement_result ADD COLUMN value  real ;
COMMENT ON COLUMN qgep.od_measurement_result.value IS 'yyy_Gemessene Grösse / Gemessene Grösse / Valeur mesurée';
 ALTER TABLE qgep.od_measurement_result ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_measurement_result.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_measurement_result ADD COLUMN dataowner varchar(80) ;
COMMENT ON COLUMN qgep.od_measurement_result.dataowner IS 'Metaattribute dataowner - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Maître des données gestionnaire de données, qui est la personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_measurement_result ADD COLUMN provider varchar(80) ;
COMMENT ON COLUMN qgep.od_measurement_result.provider IS 'Metaattribute provider - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / FOURNISSEUR DES DONNEES Organisation qui crée lenregistrement de ces données ';
-------
CREATE TABLE qgep.od_measuring_point
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_measuring_point_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_measuring_point_obj_id ON qgep.od_measuring_point USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_measuring_point_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_measuring_point ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_measuring_point');
COMMENT ON COLUMN qgep.od_measuring_point.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_measuring_point ADD COLUMN damming_device  integer ;
COMMENT ON COLUMN qgep.od_measuring_point.damming_device IS '';
 ALTER TABLE qgep.od_measuring_point ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_measuring_point_identifier ON qgep.od_measuring_point USING btree (identifier);
COMMENT ON COLUMN qgep.od_measuring_point.identifier IS '';
 ALTER TABLE qgep.od_measuring_point ADD COLUMN kind  varchar(50) ;
COMMENT ON COLUMN qgep.od_measuring_point.kind IS 'yyy_Art der Untersuchungsstelle ( Regenmessungen, Abflussmessungen, etc.) / Art der Untersuchungsstelle ( Regenmessungen, Abflussmessungen, etc.) / Genre de mesure (mesures de pluviométrie, mesures de débit, etc.)';
 ALTER TABLE qgep.od_measuring_point ADD COLUMN purpose  integer ;
COMMENT ON COLUMN qgep.od_measuring_point.purpose IS 'Purpose of measurement / Zweck der Messung / Objet de la mesure';
 ALTER TABLE qgep.od_measuring_point ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_measuring_point.remark IS 'General remarks / Allgemeine Bemerkungen / Remarques générales';
SELECT AddGeometryColumn('qgep', 'od_measuring_point', 'situation_geometry', 21781, 'POINT', 2, true);
CREATE INDEX in_qgep_od_measuring_point_situation_geometry ON qgep.od_measuring_point USING gist (situation_geometry );
COMMENT ON COLUMN qgep.od_measuring_point.situation_geometry IS 'National position coordinates (East, North) / Landeskoordinate Ost/Nord / Coordonnées nationales Est/Nord';
 ALTER TABLE qgep.od_measuring_point ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_measuring_point.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_measuring_point ADD COLUMN dataowner varchar(80) ;
COMMENT ON COLUMN qgep.od_measuring_point.dataowner IS 'Metaattribute dataowner - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Maître des données gestionnaire de données, qui est la personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_measuring_point ADD COLUMN provider varchar(80) ;
COMMENT ON COLUMN qgep.od_measuring_point.provider IS 'Metaattribute provider - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / FOURNISSEUR DES DONNEES Organisation qui crée lenregistrement de ces données ';
-------
CREATE TABLE qgep.od_planning_zone
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_planning_zone_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_planning_zone_obj_id ON qgep.od_planning_zone USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_planning_zone_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_planning_zone ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_planning_zone');
COMMENT ON COLUMN qgep.od_planning_zone.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_planning_zone ADD COLUMN kind  integer ;
COMMENT ON COLUMN qgep.od_planning_zone.kind IS 'Type of planning zone / Art der Bauzone / Genre de zones à bâtir';
SELECT AddGeometryColumn('qgep', 'od_planning_zone', 'perimeter_geometry', 21781, 'POLYGON', 2, true);
CREATE INDEX in_qgep_od_planning_zone_perimeter_geometry ON qgep.od_planning_zone USING gist (perimeter_geometry );
COMMENT ON COLUMN qgep.od_planning_zone.perimeter_geometry IS 'Boundary points of the perimeter / Begrenzungspunkte der Fläche / Points de délimitation de la surface';
-------
CREATE TABLE qgep.od_groundwater_protection_zone
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_groundwater_protection_zone_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_groundwater_protection_zone_obj_id ON qgep.od_groundwater_protection_zone USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_groundwater_protection_zone_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_groundwater_protection_zone ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_groundwater_protection_zone');
COMMENT ON COLUMN qgep.od_groundwater_protection_zone.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_groundwater_protection_zone ADD COLUMN kind  integer ;
COMMENT ON COLUMN qgep.od_groundwater_protection_zone.kind IS 'yyy_Zonenarten. Grundwasserschutzzonen bestehen aus dem Fassungsbereich (Zone S1), der Engeren Schutzzone (Zone S2) und der Weiteren Schutzzone (Zone S3). / Zonenarten. Grundwasserschutzzonen bestehen aus dem Fassungsbereich (Zone S1), der Engeren Schutzzone (Zone S2) und der Weiteren Schutzzone (Zone S3). / Genre de zones';
SELECT AddGeometryColumn('qgep', 'od_groundwater_protection_zone', 'perimeter_geometry', 21781, 'POLYGON', 2, true);
CREATE INDEX in_qgep_od_groundwater_protection_zone_perimeter_geometry ON qgep.od_groundwater_protection_zone USING gist (perimeter_geometry );
COMMENT ON COLUMN qgep.od_groundwater_protection_zone.perimeter_geometry IS 'Boundary points of the perimeter / Begrenzungspunkte der Fläche / Points de délimitation de la surface';
-------
CREATE TABLE qgep.od_ground_water_protection_perimeter
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_ground_water_protection_perimeter_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_ground_water_protection_perimeter_obj_id ON qgep.od_ground_water_protection_perimeter USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_ground_water_protection_perimeter_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_ground_water_protection_perimeter ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_ground_water_protection_perimeter');
COMMENT ON COLUMN qgep.od_ground_water_protection_perimeter.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
SELECT AddGeometryColumn('qgep', 'od_ground_water_protection_perimeter', 'perimeter_geometry', 21781, 'POLYGON', 2, true);
CREATE INDEX in_qgep_od_ground_water_protection_perimeter_perimeter_geometry ON qgep.od_ground_water_protection_perimeter USING gist (perimeter_geometry );
COMMENT ON COLUMN qgep.od_ground_water_protection_perimeter.perimeter_geometry IS 'Boundary points of the perimeter / Begrenzungspunkte der Fläche / Points de délimitation de la surface';
-------
CREATE TABLE qgep.od_water_body_protection_sector
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_water_body_protection_sector_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_water_body_protection_sector_obj_id ON qgep.od_water_body_protection_sector USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_water_body_protection_sector_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_water_body_protection_sector ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_water_body_protection_sector');
COMMENT ON COLUMN qgep.od_water_body_protection_sector.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_water_body_protection_sector ADD COLUMN kind  integer ;
COMMENT ON COLUMN qgep.od_water_body_protection_sector.kind IS 'yyy_Art des Schutzbereiches für  oberflächliches Gewässer und Grundwasser bezüglich Gefährdung / Art des Schutzbereiches für  oberflächliches Gewässer und Grundwasser bezüglich Gefährdung / Type de zones de protection des eaux superficielles et souterraines';
SELECT AddGeometryColumn('qgep', 'od_water_body_protection_sector', 'perimeter_geometry', 21781, 'POLYGON', 2, true);
CREATE INDEX in_qgep_od_water_body_protection_sector_perimeter_geometry ON qgep.od_water_body_protection_sector USING gist (perimeter_geometry );
COMMENT ON COLUMN qgep.od_water_body_protection_sector.perimeter_geometry IS 'Boundary points of the perimeter / Begrenzungspunkte der Fläche / Points de délimitation de la surface';
-------
CREATE TABLE qgep.od_drainage_system
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_drainage_system_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_drainage_system_obj_id ON qgep.od_drainage_system USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_drainage_system_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_drainage_system ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_drainage_system');
COMMENT ON COLUMN qgep.od_drainage_system.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_drainage_system ADD COLUMN kind  integer ;
COMMENT ON COLUMN qgep.od_drainage_system.kind IS 'yyy_Art des Entwässerungssystems in dem ein bestimmtes Gebiet entwässert werden soll (SOLL Zustand) / Art des Entwässerungssystems in dem ein bestimmtes Gebiet entwässert werden soll (SOLL Zustand) / Genre de système d''évacuation choisi pour une région déterminée (Etat prévu)';
SELECT AddGeometryColumn('qgep', 'od_drainage_system', 'perimeter_geometry', 21781, 'POLYGON', 2, true);
CREATE INDEX in_qgep_od_drainage_system_perimeter_geometry ON qgep.od_drainage_system USING gist (perimeter_geometry );
COMMENT ON COLUMN qgep.od_drainage_system.perimeter_geometry IS 'Boundary points of the perimeter / Begrenzungspunkte der Fläche / Points de délimitation de la surface';
-------
CREATE TABLE qgep.od_infiltration_zone
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_infiltration_zone_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_infiltration_zone_obj_id ON qgep.od_infiltration_zone USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_infiltration_zone_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_infiltration_zone ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_infiltration_zone');
COMMENT ON COLUMN qgep.od_infiltration_zone.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_infiltration_zone ADD COLUMN infiltration_capacity  integer ;
COMMENT ON COLUMN qgep.od_infiltration_zone.infiltration_capacity IS 'yyy_Versickerungsmöglichkeit im Bereich / Versickerungsmöglichkeit im Bereich / Potentiel d''infiltration de la zone';
SELECT AddGeometryColumn('qgep', 'od_infiltration_zone', 'perimeter_geometry', 21781, 'POLYGON', 2, true);
CREATE INDEX in_qgep_od_infiltration_zone_perimeter_geometry ON qgep.od_infiltration_zone USING gist (perimeter_geometry );
COMMENT ON COLUMN qgep.od_infiltration_zone.perimeter_geometry IS 'Boundary points of the perimeter / Begrenzungspunkte der Fläche / Points de délimitation de la surface';
-------
CREATE TABLE qgep.od_cover
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_cover_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_cover_obj_id ON qgep.od_cover USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_cover_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_cover ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_cover');
COMMENT ON COLUMN qgep.od_cover.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_cover ADD COLUMN brand  varchar(50) ;
COMMENT ON COLUMN qgep.od_cover.brand IS 'Name of manufacturer / Name der Herstellerfirma / Nom de l''entreprise de fabrication';
 ALTER TABLE qgep.od_cover ADD COLUMN cover_shape  integer ;
COMMENT ON COLUMN qgep.od_cover.cover_shape IS 'shape of cover / Form des Deckels / Forme du couvercle';
 ALTER TABLE qgep.od_cover ADD COLUMN depth  smallint ;
COMMENT ON COLUMN qgep.od_cover.depth IS 'yyy_redundantes Funktionsattribut Maechtigkeit. Numerisch [mm]. Funktion (berechneter Wert) = zugehöriger Deckel.Kote minus Abwasserknoten.Sohlenkote.(falls die Sohlenkote nicht separat erfasst, dann ist es die tiefer liegende Hal-tungspunkt.Kote) / redundantes Funktionsattribut Maechtigkeit. Numerisch [mm]. Funktion (berechneter Wert) = zugehöriger Deckel.Kote minus Abwasserknoten.Sohlenkote.(falls die Sohlenkote nicht separat erfasst, dann ist es die tiefer liegende Haltungspunkt.Kote) / Attribut de fonction EPAISSEUR redondant, numérique [mm]. Fonction (valeur calculée) = COUVERCLE.COTE correspondant moins NUD_RESEAU.COTE_RADIER (si la cote radier ne peut pas être saisie séparément, prendre la POINT_TRONCON.COTE la plus basse.';
 ALTER TABLE qgep.od_cover ADD COLUMN diameter  smallint ;
COMMENT ON COLUMN qgep.od_cover.diameter IS 'yyy_Abmessung des Deckels (bei eckigen Deckeln minimale Abmessung) / Abmessung des Deckels (bei eckigen Deckeln minimale Abmessung) / Dimension du couvercle (dimension minimale pour couvercle anguleux)';
 ALTER TABLE qgep.od_cover ADD COLUMN fastening  integer ;
COMMENT ON COLUMN qgep.od_cover.fastening IS 'yyy_Befestigungsart des Deckels / Befestigungsart des Deckels / Genre de fixation du couvercle';
 ALTER TABLE qgep.od_cover ADD COLUMN level  decimal(7,3) ;
COMMENT ON COLUMN qgep.od_cover.level IS 'Height of cover / Deckelhöhe / Cote du couvercle';
 ALTER TABLE qgep.od_cover ADD COLUMN material  integer ;
COMMENT ON COLUMN qgep.od_cover.material IS 'Material of cover / Deckelmaterial / Matériau du couvercle';
 ALTER TABLE qgep.od_cover ADD COLUMN positional_accuracy  integer ;
COMMENT ON COLUMN qgep.od_cover.positional_accuracy IS 'Quantfication of accuarcy of position of cover (center hole) / Quantifizierung der Genauigkeit der Lage des Deckels (Pickelloch) / Plage de précision des coordonnées planimétriques du couvercle.';
SELECT AddGeometryColumn('qgep', 'od_cover', 'situation_geometry', 21781, 'POINT', 2, true);
CREATE INDEX in_qgep_od_cover_situation_geometry ON qgep.od_cover USING gist (situation_geometry );
COMMENT ON COLUMN qgep.od_cover.situation_geometry IS 'Situation of cover (cover hole), National position coordinates (East, North) / Lage des Deckels (Pickelloch) / Positionnement du couvercle (milieu du couvercle)';
 ALTER TABLE qgep.od_cover ADD COLUMN sludge_bucket  integer ;
COMMENT ON COLUMN qgep.od_cover.sludge_bucket IS 'yyy_Angabe, ob der Deckel mit einem Schlammeimer versehen ist oder nicht / Angabe, ob der Deckel mit einem Schlammeimer versehen ist oder nicht / Indication si le couvercle est pourvu ou non d''un ramasse-boues';
 ALTER TABLE qgep.od_cover ADD COLUMN venting  integer ;
COMMENT ON COLUMN qgep.od_cover.venting IS 'venting with wholes for aeration / Deckel mit Lüftungslöchern versehen / Couvercle pourvu de trous d''aération';
-------
CREATE TABLE qgep.od_access_aid
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_access_aid_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_access_aid_obj_id ON qgep.od_access_aid USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_access_aid_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_access_aid ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_access_aid');
COMMENT ON COLUMN qgep.od_access_aid.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_access_aid ADD COLUMN kind  integer ;
COMMENT ON COLUMN qgep.od_access_aid.kind IS 'yyy_Art des Einstiegs in das Bauwerk / Art des Einstiegs in das Bauwerk / Genre d''accès à l''ouvrage';
-------
CREATE TABLE qgep.od_electric_equipment
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_electric_equipment_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_electric_equipment_obj_id ON qgep.od_electric_equipment USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_electric_equipment_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_electric_equipment ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_electric_equipment');
COMMENT ON COLUMN qgep.od_electric_equipment.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_electric_equipment ADD COLUMN gross_costs  decimal(10,2) ;
COMMENT ON COLUMN qgep.od_electric_equipment.gross_costs IS 'Gross costs of electromechanical equipment / Brutto Erstellungskosten der elektromechanischen Ausrüstung / Coûts bruts des équipements électromécaniques';
 ALTER TABLE qgep.od_electric_equipment ADD COLUMN kind  integer ;
COMMENT ON COLUMN qgep.od_electric_equipment.kind IS 'yyy_Elektrische Installationen und Geräte / Elektrische Installationen und Geräte / Installations et appareils électriques';
 ALTER TABLE qgep.od_electric_equipment ADD COLUMN year_of_replacement  smallint ;
COMMENT ON COLUMN qgep.od_electric_equipment.year_of_replacement IS 'yyy_Jahr, in dem die Lebensdauer der elektrischen Einrichtung voraussichtlich ausläuft / Jahr, in dem die Lebensdauer der elektrischen Einrichtung voraussichtlich ausläuft / Année pour laquelle on prévoit que la durée de vie de l''équipement soit écoulée';
-------
CREATE TABLE qgep.od_dryweather_flume
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_dryweather_flume_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_dryweather_flume_obj_id ON qgep.od_dryweather_flume USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_dryweather_flume_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_dryweather_flume ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_dryweather_flume');
COMMENT ON COLUMN qgep.od_dryweather_flume.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_dryweather_flume ADD COLUMN material  integer ;
COMMENT ON COLUMN qgep.od_dryweather_flume.material IS 'yyy_Material der Ausbildung oder Auskleidung der Trockenwetterrinne / Material der Ausbildung oder Auskleidung der Trockenwetterrinne / Matériau de fabrication ou de revêtement de la cunette de débit temps sec';
-------
CREATE TABLE qgep.od_electromechanical_equipment
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_electromechanical_equipment_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_electromechanical_equipment_obj_id ON qgep.od_electromechanical_equipment USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_electromechanical_equipment_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_electromechanical_equipment ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_electromechanical_equipment');
COMMENT ON COLUMN qgep.od_electromechanical_equipment.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_electromechanical_equipment ADD COLUMN gross_costs  decimal(10,2) ;
COMMENT ON COLUMN qgep.od_electromechanical_equipment.gross_costs IS 'Gross costs of electromechanical equipment / Brutto Erstellungskosten der elektromechanischen Ausrüstung / Coûts bruts des équipements électromécaniques';
 ALTER TABLE qgep.od_electromechanical_equipment ADD COLUMN kind  integer ;
COMMENT ON COLUMN qgep.od_electromechanical_equipment.kind IS 'yyy_Elektromechanische Teile eines Bauwerks / Elektromechanische Teile eines Bauwerks / Eléments électromécaniques d''un ouvrage';
 ALTER TABLE qgep.od_electromechanical_equipment ADD COLUMN year_of_replacement  smallint ;
COMMENT ON COLUMN qgep.od_electromechanical_equipment.year_of_replacement IS 'yyy_Jahr in dem die Lebensdauer der elektromechanischen Ausrüstung voraussichtlich abläuft / Jahr in dem die Lebensdauer der elektromechanischen Ausrüstung voraussichtlich abläuft / Année pour laquelle on prévoit que la durée de vie de l''équipement soit écoulée';
-------
CREATE TABLE qgep.od_dryweather_downspout
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_dryweather_downspout_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_dryweather_downspout_obj_id ON qgep.od_dryweather_downspout USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_dryweather_downspout_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_dryweather_downspout ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_dryweather_downspout');
COMMENT ON COLUMN qgep.od_dryweather_downspout.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_dryweather_downspout ADD COLUMN diameter  smallint ;
COMMENT ON COLUMN qgep.od_dryweather_downspout.diameter IS 'yyy_Abmessung des Deckels (bei eckigen Deckeln minimale Abmessung) / Abmessung des Deckels (bei eckigen Deckeln minimale Abmessung) / Dimension du couvercle (dimension minimale pour couvercle anguleux)';
-------
CREATE TABLE qgep.od_benching
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_benching_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_benching_obj_id ON qgep.od_benching USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_benching_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_benching ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_benching');
COMMENT ON COLUMN qgep.od_benching.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_benching ADD COLUMN kind  integer ;
COMMENT ON COLUMN qgep.od_benching.kind IS 'For further attributes structure_part / Weitere Attribute siehe BauwerksTeil / Pour les autres attributs voir sous ELEMENT_OUVRAGE';
-------
CREATE TABLE qgep.od_backflow_prevention
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_backflow_prevention_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_backflow_prevention_obj_id ON qgep.od_backflow_prevention USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_backflow_prevention_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_backflow_prevention ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_backflow_prevention');
COMMENT ON COLUMN qgep.od_backflow_prevention.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_backflow_prevention ADD COLUMN gross_costs  decimal(10,2) ;
COMMENT ON COLUMN qgep.od_backflow_prevention.gross_costs IS 'Gross costs / Brutto Erstellungskosten / Coûts bruts de réalisation';
 ALTER TABLE qgep.od_backflow_prevention ADD COLUMN kind  integer ;
COMMENT ON COLUMN qgep.od_backflow_prevention.kind IS 'Ist keine Rückstausicherung vorhanden, wird keine Rueckstausicherung erfasst. /  Ist keine Rückstausicherung vorhanden, wird keine Rueckstausicherung erfasst / En absence de protection, laisser la composante vide';
 ALTER TABLE qgep.od_backflow_prevention ADD COLUMN year_of_replacement  smallint ;
COMMENT ON COLUMN qgep.od_backflow_prevention.year_of_replacement IS 'yyy_Jahr in dem die Lebensdauer der Rückstausicherung voraussichtlich abläuft / Jahr in dem die Lebensdauer der Rückstausicherung voraussichtlich abläuft / Année pour laquelle on prévoit que la durée de vie de l''équipement soit écoulée';
-------
CREATE TABLE qgep.od_tank_emptying
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_tank_emptying_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_tank_emptying_obj_id ON qgep.od_tank_emptying USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_tank_emptying_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_tank_emptying ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_tank_emptying');
COMMENT ON COLUMN qgep.od_tank_emptying.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_tank_emptying ADD COLUMN flow  decimal(9,3) ;
COMMENT ON COLUMN qgep.od_tank_emptying.flow IS 'yyy_Bei mehreren Pumpen / Schiebern muss die maximale Gesamtmenge erfasst werden. / Bei mehreren Pumpen / Schiebern muss die maximale Gesamtmenge erfasst werden. / Lors de présence de plusieurs pompes/vannes, indiquer le débit total.';
 ALTER TABLE qgep.od_tank_emptying ADD COLUMN gross_costs  decimal(10,2) ;
COMMENT ON COLUMN qgep.od_tank_emptying.gross_costs IS 'Gross costs of electromechanical equipment of tank emptying / Brutto Erstellungskosten der elektromechnischen Ausrüstung für die Beckenentleerung / Coûts bruts des équipements électromécaniques vidange de bassins';
 ALTER TABLE qgep.od_tank_emptying ADD COLUMN type  integer ;
COMMENT ON COLUMN qgep.od_tank_emptying.type IS 'Gross costs of electromechanical equipment of tank emptying / Brutto Erstellungskosten der elektromechnischen Ausrüstung für die Beckenentleerung / Coûts bruts des équipements électromécaniques vidange de bassins';
 ALTER TABLE qgep.od_tank_emptying ADD COLUMN year_of_replacement  smallint ;
COMMENT ON COLUMN qgep.od_tank_emptying.year_of_replacement IS 'yyy_Jahr in dem die Lebensdauer der elektromechanischen Ausrüstung voraussichtlich abläuft / Jahr in dem die Lebensdauer der elektromechanischen Ausrüstung voraussichtlich abläuft / Année pour laquelle on prévoit que la durée de vie de l''équipement soit écoulée';
-------
CREATE TABLE qgep.od_tank_cleaning
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_tank_cleaning_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_tank_cleaning_obj_id ON qgep.od_tank_cleaning USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_tank_cleaning_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_tank_cleaning ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_tank_cleaning');
COMMENT ON COLUMN qgep.od_tank_cleaning.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_tank_cleaning ADD COLUMN gross_costs  decimal(10,2) ;
COMMENT ON COLUMN qgep.od_tank_cleaning.gross_costs IS 'Gross costs of electromechanical equipment of tank cleaning / Brutto Erstellungskosten der elektromechnischen Ausrüstung für die Beckenreinigung / Coûts bruts des équipements électromécaniques nettoyage de bassins';
 ALTER TABLE qgep.od_tank_cleaning ADD COLUMN type  integer ;
COMMENT ON COLUMN qgep.od_tank_cleaning.type IS 'Gross costs of electromechanical equipment of tank cleaning / Brutto Erstellungskosten der elektromechnischen Ausrüstung für die Beckenreinigung / Coûts bruts des équipements électromécaniques nettoyage de bassins';
 ALTER TABLE qgep.od_tank_cleaning ADD COLUMN year_of_replacement  smallint ;
COMMENT ON COLUMN qgep.od_tank_cleaning.year_of_replacement IS 'yyy_Jahr in dem die Lebensdauer der elektromechanischen Ausrüstung voraussichtlich abläuft / Jahr in dem die Lebensdauer der elektromechanischen Ausrüstung voraussichtlich abläuft / Année pour laquelle on prévoit que la durée de vie de l''équipement soit écoulée';
-------
CREATE TABLE qgep.od_solids_retention
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_solids_retention_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_solids_retention_obj_id ON qgep.od_solids_retention USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_solids_retention_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_solids_retention ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_solids_retention');
COMMENT ON COLUMN qgep.od_solids_retention.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_solids_retention ADD COLUMN dimensioning_value  decimal(9,3) ;
COMMENT ON COLUMN qgep.od_solids_retention.dimensioning_value IS 'yyy_Wassermenge, Dimensionierungswert des Feststoffrückhaltes / Wassermenge, Dimensionierungswert des Feststoffrückhaltes / Volume, débit de dimensionnement';
 ALTER TABLE qgep.od_solids_retention ADD COLUMN gross_costs  decimal(10,2) ;
COMMENT ON COLUMN qgep.od_solids_retention.gross_costs IS 'Gross costs of electromechanical equipment / Brutto Erstellungskosten der elektromechnischen Ausrüstung für die Beckenentleerung / Coûts bruts des équipements électromécaniques';
 ALTER TABLE qgep.od_solids_retention ADD COLUMN overflow_level  decimal(7,3) ;
COMMENT ON COLUMN qgep.od_solids_retention.overflow_level IS 'Overflow level of solids retention in in m.a.sl. / Anspringkote Feststoffrückhalt in m.ü.M. / Cote du début du déversement de la retenue de matières solides en m.s.m.';
 ALTER TABLE qgep.od_solids_retention ADD COLUMN type  integer ;
COMMENT ON COLUMN qgep.od_solids_retention.type IS 'yyy_(Elektromechanische) Teile zum Feststoffrückhalt eines Bauwerks / (Elektromechanische) Teile zum Feststoffrückhalt eines Bauwerks / Eléments (électromécaniques) pour la retenue de matières solides dun ouvrage';
 ALTER TABLE qgep.od_solids_retention ADD COLUMN year_of_replacement  smallint ;
COMMENT ON COLUMN qgep.od_solids_retention.year_of_replacement IS 'yyy_Jahr in dem die Lebensdauer der elektromechanischen Ausrüstung voraussichtlich abläuft / Jahr in dem die Lebensdauer der elektromechanischen Ausrüstung voraussichtlich abläuft / Année pour laquelle on prévoit que la durée de vie de l''équipement soit écoulée';
-------
CREATE TABLE qgep.od_wwtp_structure
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_wwtp_structure_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_wwtp_structure_obj_id ON qgep.od_wwtp_structure USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_wwtp_structure_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_wwtp_structure ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_wwtp_structure');
COMMENT ON COLUMN qgep.od_wwtp_structure.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_wwtp_structure ADD COLUMN kind  integer ;
COMMENT ON COLUMN qgep.od_wwtp_structure.kind IS 'yyy_Art des Beckens oder Verfahrens im ARA Bauwerk / Art des Beckens oder Verfahrens im ARA Bauwerk / Genre de l''louvrage ou genre de traitement dans l''ouvrage STEP';
-------
CREATE TABLE qgep.od_channel
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_channel_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_channel_obj_id ON qgep.od_channel USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_channel_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_channel ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_channel');
COMMENT ON COLUMN qgep.od_channel.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_channel ADD COLUMN bedding_encasement  integer ;
COMMENT ON COLUMN qgep.od_channel.bedding_encasement IS 'yyy_Art und Weise der unmittelbaren Rohrumgebung im Boden: Bettungsschicht (Unterlage der Leitung),  Verdämmung (seitliche Auffüllung), Schutzschicht / Art und Weise der unmittelbaren Rohrumgebung im Boden: Bettungsschicht (Unterlage der Leitung),  Verdämmung (seitliche Auffüllung), Schutzschicht / Lit de pose (assise de la conduite), bourrage latéral (remblai latéral), couche de protection';
 ALTER TABLE qgep.od_channel ADD COLUMN connection_type  integer ;
COMMENT ON COLUMN qgep.od_channel.connection_type IS 'Types of connection / Verbindungstypen / Types de raccordement';
 ALTER TABLE qgep.od_channel ADD COLUMN function_hierarchic  integer ;
COMMENT ON COLUMN qgep.od_channel.function_hierarchic IS 'yyy_Art des Kanals hinsichtlich Bedeutung im Entwässerungssystem / Art des Kanals hinsichtlich Bedeutung im Entwässerungssystem / Genre de canalisation par rapport à sa fonction dans le système d''évacuation';
-- see end of table CREATE INDEX in_od_channel_function_hierarchic ON qgep.od_channel_usage_current USING btree (function_hierarchic, usage_current);
 ALTER TABLE qgep.od_channel ADD COLUMN function_hydraulic  integer ;
COMMENT ON COLUMN qgep.od_channel.function_hydraulic IS 'yyy_Art des Kanals hinsichtlich hydraulischer Ausführung / Art des Kanals hinsichtlich hydraulischer Ausführung / Genre de canalisation par rapport à sa fonction hydraulique';
 ALTER TABLE qgep.od_channel ADD COLUMN jetting_interval  decimal(4,2) ;
COMMENT ON COLUMN qgep.od_channel.jetting_interval IS 'yyy_Abstände in welchen der Kanal gespült werden sollte / Abstände in welchen der Kanal gespült werden sollte / Fréquence à laquelle une canalisation devrait subir un curage (années)';
 ALTER TABLE qgep.od_channel ADD COLUMN pipe_length  decimal(7,2) ;
COMMENT ON COLUMN qgep.od_channel.pipe_length IS 'yyy_Baulänge der Einzelrohre oder Fugenabstände bei Ortsbetonkanälen / Baulänge der Einzelrohre oder Fugenabstände bei Ortsbetonkanälen / Longueur de chaque tuyau ou distance des joints pour les canalisations en béton coulé sur place';
 ALTER TABLE qgep.od_channel ADD COLUMN usage_current  integer ;
COMMENT ON COLUMN qgep.od_channel.usage_current IS 'yyy_Für Primäre Abwasseranlagen gilt: heute zulässige Nutzung. Für Sekundäre Abwasseranlagen gilt: heute tatsächliche Nutzung / Für primäre Abwasseranlagen gilt: Heute zulässige Nutzung. Für sekundäre Abwasseranlagen gilt: Heute tatsächliche Nutzung / Pour les ouvrages du réseau primaire: utilisation actuelle autorisée pour les ouvrages du réseau secondaire: utilisation actuelle réelle';
 ALTER TABLE qgep.od_channel ADD COLUMN usage_planned  integer ;
COMMENT ON COLUMN qgep.od_channel.usage_planned IS 'yyy_Durch das Konzept vorgesehene Nutzung (vergleiche auch Nutzungsart_Ist) / Durch das Konzept vorgesehene Nutzung (vergleiche auch Nutzungsart_Ist) / Utilisation prévue par le concept d''assainissement (voir aussi GENRE_UTILISATION_ACTUELLE)';
 --SB CREATE INDEX in_od_channel_function_hierarchic ON qgep.od_channel_usage_current USING btree (function_hierarchic, usage_current);
 CREATE INDEX in_od_channel_usage_function_hierarchic_current ON qgep.od_channel USING btree (function_hierarchic, usage_current);
 -------
 -------
CREATE TABLE qgep.od_special_structure
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_special_structure_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_special_structure_obj_id ON qgep.od_special_structure USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_special_structure_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_special_structure ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_special_structure');
COMMENT ON COLUMN qgep.od_special_structure.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_special_structure ADD COLUMN bypass  integer ;
COMMENT ON COLUMN qgep.od_special_structure.bypass IS 'yyy_Bypass zur Umleitung des Wassers (z.B. während Unterhalt oder  im Havariefall) / Bypass zur Umleitung des Wassers (z.B. während Unterhalt oder  im Havariefall) / Bypass pour détourner les eaux (par exemple durant des opérations de maintenance ou en cas davaries)';
 ALTER TABLE qgep.od_special_structure ADD COLUMN depth  smallint ;
COMMENT ON COLUMN qgep.od_special_structure.depth IS 'yyy_Funktion (berechneter Wert) = repräsentative Abwasserknoten.Sohlenkote minus zugehörige Deckenkote des Bauwerks falls Detailgeometrie vorhanden, sonst Funktion (berechneter Wert) = Abwasserknoten.Sohlenkote minus zugehörige Deckel.Kote des Bauwerks / Funktion (berechneter Wert) = repräsentative Abwasserknoten.Sohlenkote minus zugehörige Deckenkote des Bauwerks falls Detailgeometrie vorhanden, sonst Funktion (berechneter Wert) = Abwasserknoten.Sohlenkote minus zugehörige Deckel.Kote des Bauwerks / Fonction (valeur calculée) = NOEUD_RESEAU.COTE_RADIER représentatif moins COTE_PLAFOND de louvrage correspondant si la géométrie détaillée est disponible, sinon fonction (valeur calculée) = NUD_RESEAU.COT_RADIER moins COUVERCLE.COTE de louvrage corresp';
 ALTER TABLE qgep.od_special_structure ADD COLUMN emergency_spillway  integer ;
COMMENT ON COLUMN qgep.od_special_structure.emergency_spillway IS 'zzz_Das Attribut beschreibt, wohin die das Volumen übersteigende Menge abgeleitet wird (bei Regenrückhaltebecken / Regenrückhaltekanal). / Das Attribut beschreibt, wohin die das Volumen übersteigende Menge abgeleitet wird (bei Regenrückhaltebecken / Regenrückhaltekanal). / Lattribut décrit vers où le débit déversé sécoule. (bassin daccumulation / canal daccumulation)';
 ALTER TABLE qgep.od_special_structure ADD COLUMN function  integer ;
COMMENT ON COLUMN qgep.od_special_structure.function IS 'Kind of function / Art der Nutzung / Genre d''utilisation';
 CREATE INDEX in_od_special_structure_function ON qgep.od_special_structure USING btree (function);
 ALTER TABLE qgep.od_special_structure ADD COLUMN stormwater_tank_arrangement  integer ;
COMMENT ON COLUMN qgep.od_special_structure.stormwater_tank_arrangement IS 'yyy_Anordnung des Regenbeckens im System. Zusätzlich zu erfassen falls Spezialbauwerk.Funktion = Regenbecken_* / Anordnung des Regenbeckens im System. Zusätzlich zu erfassen falls Spezialbauwerk.Funktion = Regenbecken_* / Disposition d''un bassin d''eaux pluviales dans le réseau d''assainissement. Attribut additionnel pour les valeurs BEP_* de OUVRAGE_SPECIAL.FONCTION.';
 ALTER TABLE qgep.od_special_structure ADD COLUMN upper_elevation  decimal(7,3) ;
COMMENT ON COLUMN qgep.od_special_structure.upper_elevation IS 'Highest point of structure (ceiling), outside / Höchster Punkt des Bauwerks (Decke), aussen / Point le plus élevé de la construction';
-------
CREATE TABLE qgep.od_discharge_point
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_discharge_point_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_discharge_point_obj_id ON qgep.od_discharge_point USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_discharge_point_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_discharge_point ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_discharge_point');
COMMENT ON COLUMN qgep.od_discharge_point.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_discharge_point ADD COLUMN depth  smallint ;
COMMENT ON COLUMN qgep.od_discharge_point.depth IS 'yyy_Funktion (berechneter Wert) = repräsentative Abwasserknoten.Sohlenkote minus zugehörige Deckenkote des Bauwerks falls Detailgeometrie vorhanden, sonst Funktion (berechneter Wert) = Abwasserknoten.Sohlenkote minus zugehörige Deckel.Kote des Bauwerks / Funktion (berechneter Wert) = repräsentative Abwasserknoten.Sohlenkote minus zugehörige Deckenkote des Bauwerks falls Detailgeometrie vorhanden, sonst Funktion (berechneter Wert) = Abwasserknoten.Sohlenkote minus zugehörige Deckel.Kote des Bauwerks / Fonction (valeur calculée) = NOEUD_RESEAU.COTE_RADIER représentatif moins COTE_PLAFOND de louvrage correspondant si la géométrie détaillée est disponible, sinon fonction (valeur calculée) = NUD_RESEAU.COT_RADIER moins COUVERCLE.COTE de louvrage corresp';
 ALTER TABLE qgep.od_discharge_point ADD COLUMN highwater_level  decimal(7,3) ;
COMMENT ON COLUMN qgep.od_discharge_point.highwater_level IS 'yyy_Massgebliche Hochwasserkote des Vorflutereinlaufs / Massgebliche Hochwasserkote des Vorflutereinlaufs / Cote de crue déterminante au point de rejet';
 ALTER TABLE qgep.od_discharge_point ADD COLUMN relevance  integer ;
COMMENT ON COLUMN qgep.od_discharge_point.relevance IS 'Relevance of discharge point for water course / Gewässerrelevanz der Einleitstelle / Il est conseillé dutiliser des noms réels, tels qSignifiance pour milieu récepteur';
 ALTER TABLE qgep.od_discharge_point ADD COLUMN terrain_level  decimal(7,3) ;
COMMENT ON COLUMN qgep.od_discharge_point.terrain_level IS 'Terrain level if there is no cover at the discharge point (structure), e.g. just pipe ending / Terrainkote, falls kein Deckel vorhanden bei Einleitstelle (Kanalende ohne Bauwerk oder Bauwerk ohne Deckel) / Cote terrain s''il n''y a pas de couvercle à l''exutoire par example seulement fin du conduite';
 ALTER TABLE qgep.od_discharge_point ADD COLUMN upper_elevation  decimal(7,3) ;
COMMENT ON COLUMN qgep.od_discharge_point.upper_elevation IS 'Highest point of structure (ceiling), outside / Höchster Punkt des Bauwerks (Decke), aussen / Point le plus élevé de l''ouvrage';
 ALTER TABLE qgep.od_discharge_point ADD COLUMN waterlevel_hydraulic  decimal(7,3) ;
COMMENT ON COLUMN qgep.od_discharge_point.waterlevel_hydraulic IS 'yyy_Wasserspiegelkote für die hydraulische Berechnung (IST-Zustand)-
. Berechneter Wasserspiegel bei der Einleitstelle. Wo nichts anders gefordert, ist der Wasserspiegel bei einem HQ30 einzusetzen. / Wasserspiegelkote für die hydraulische Berechnung (IST-Zustand). Berechneter Wasserspiegel bei der Einleitstelle. Wo nichts anders gefordert, ist der Wasserspiegel bei einem HQ30 einzusetzen. / Niveau deau calculé à lexutoire. Si aucun exigence est demandée, indiquer le niveau deau pour un HQ30.';
-------
CREATE TABLE qgep.od_infiltration_installation
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_infiltration_installation_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_infiltration_installation_obj_id ON qgep.od_infiltration_installation USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_infiltration_installation_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_infiltration_installation ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_infiltration_installation');
COMMENT ON COLUMN qgep.od_infiltration_installation.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_infiltration_installation ADD COLUMN absorption_capacity  decimal(9,3) ;
COMMENT ON COLUMN qgep.od_infiltration_installation.absorption_capacity IS 'yyy_Schluckvermögen des Bodens. / Schluckvermögen des Bodens. / Capacité d''absorption du sol';
 ALTER TABLE qgep.od_infiltration_installation ADD COLUMN defects  integer ;
COMMENT ON COLUMN qgep.od_infiltration_installation.defects IS 'yyy_Gibt die aktuellen Mängel der Versickerungsanlage an (IST-Zustand). / Gibt die aktuellen Mängel der Versickerungsanlage an (IST-Zustand). / Indique les défauts actuels de l''installation d''infiltration (etat_actuel).';
 ALTER TABLE qgep.od_infiltration_installation ADD COLUMN depth  smallint ;
COMMENT ON COLUMN qgep.od_infiltration_installation.depth IS 'yyy_Funktion (berechneter Wert) = repräsentative Abwasserknoten.Sohlenkote minus zugehörige Deckenkote des Bauwerks falls Detailgeometrie vorhanden, sonst Funktion (berechneter Wert) = Abwasserknoten.Sohlenkote minus zugehörige Deckel.Kote des Bauwerks / Funktion (berechneter Wert) = repräsentative Abwasserknoten.Sohlenkote minus zugehörige Deckenkote des Bauwerks falls Detailgeometrie vorhanden, sonst Funktion (berechneter Wert) = Abwasserknoten.Sohlenkote minus zugehörige Deckel.Kote des Bauwerks / Fonction (valeur calculée) = NOEUD_RESEAU.COTE_RADIER représentatif moins COTE_PLAFOND de louvrage correspondant si la géométrie détaillée est disponible, sinon fonction (valeur calculée) = NUD_RESEAU.COT_RADIER moins COUVERCLE.COTE de louvrage corresp';
 ALTER TABLE qgep.od_infiltration_installation ADD COLUMN dimension1  smallint ;
COMMENT ON COLUMN qgep.od_infiltration_installation.dimension1 IS 'Dimension1 of infiltration installations (largest inside dimension) if used with norm elements. Else leave empty.. / Dimension1 der Versickerungsanlage (grösstes Innenmass) bei der Verwendung von Normbauteilen. Sonst leer lassen und mit Detailgeometrie beschreiben. / Dimension1 de linstallation dinfiltration (plus grande mesure intérieure) lorsquelle est utilisée pour des éléments douvrage normés. Sinon, à laisser libre et prendre la description de la géométrie détaillée.';
 ALTER TABLE qgep.od_infiltration_installation ADD COLUMN dimension2  smallint ;
COMMENT ON COLUMN qgep.od_infiltration_installation.dimension2 IS 'Dimension2 of infiltration installations (smallest inside dimension). With circle shaped installations leave dimension2 empty, with ovoid shaped ones fill it in. With rectangular shaped manholes use detailled_geometry to describe further. / Dimension2 der Versickerungsanlage (kleinstes Innenmass) bei der Verwendung von Normbauteilen. Sonst leer lassen und mit Detailgeometrie beschreiben. / Dimension2 de la chambre (plus petite mesure intérieure). La dimension2 est à saisir pour des chambres ovales et à laisser libre pour des chambres circulaires. Pour les chambres rectangulaires il faut utiliser la géométrie détaillée.';
 ALTER TABLE qgep.od_infiltration_installation ADD COLUMN distance_to_aquifer  decimal(7,2) ;
COMMENT ON COLUMN qgep.od_infiltration_installation.distance_to_aquifer IS 'yyy_Flurabstand (Vertikale Distanz Terrainoberfläche zum Grundwasserleiter). / Flurabstand (Vertikale Distanz Terrainoberfläche zum Grundwasserleiter). / Distance à l''aquifère (distance verticale de la surface du terrain à l''aquifère)';
 ALTER TABLE qgep.od_infiltration_installation ADD COLUMN effective_area  decimal(8,2) ;
COMMENT ON COLUMN qgep.od_infiltration_installation.effective_area IS 'yyy_Für den Abfluss wirksame Fläche / Für den Abfluss wirksame Fläche / Surface qui participe à l''écoulement';
 ALTER TABLE qgep.od_infiltration_installation ADD COLUMN emergency_spillway  integer ;
COMMENT ON COLUMN qgep.od_infiltration_installation.emergency_spillway IS 'yyy_Endpunkt allfälliger Verrohrung des Notüberlaufes der Versickerungsanlage / Endpunkt allfälliger Verrohrung des Notüberlaufes der Versickerungsanlage / Point cumulant des conduites du trop plein d''une installation d''infiltration';
 ALTER TABLE qgep.od_infiltration_installation ADD COLUMN kind  integer ;
COMMENT ON COLUMN qgep.od_infiltration_installation.kind IS 'yyy_Arten von Versickerungsmethoden. / Arten von Versickerungsmethoden. / Genre de méthode d''infiltration.';
 ALTER TABLE qgep.od_infiltration_installation ADD COLUMN labeling  integer ;
COMMENT ON COLUMN qgep.od_infiltration_installation.labeling IS 'yyy_Kennzeichnung der Schachtdeckel der Anlage als Versickerungsanlage.  Nur bei Anlagen mit Schächten. / Kennzeichnung der Schachtdeckel der Anlage als Versickerungsanlage.  Nur bei Anlagen mit Schächten. / Désignation inscrite du couvercle de l''installation d''infiltration. Uniquement pour des installations avec couvercle';
 ALTER TABLE qgep.od_infiltration_installation ADD COLUMN seepage_utilization  integer ;
COMMENT ON COLUMN qgep.od_infiltration_installation.seepage_utilization IS 'yyy_Arten des zu versickernden Wassers. / Arten des zu versickernden Wassers. / Genre d''eau à infiltrer';
 ALTER TABLE qgep.od_infiltration_installation ADD COLUMN upper_elevation  decimal(7,3) ;
COMMENT ON COLUMN qgep.od_infiltration_installation.upper_elevation IS 'Highest point of structure (ceiling), outside / Höchster Punkt des Bauwerks (Decke), aussen / Point le plus élevé de la construction';
 ALTER TABLE qgep.od_infiltration_installation ADD COLUMN vehicle_access  integer ;
COMMENT ON COLUMN qgep.od_infiltration_installation.vehicle_access IS 'yyy_Zugänglichkeit für Saugwagen. Sie bezieht sich auf die gesamte Versickerungsanlage / Vorbehandlungsanlagen und kann in den Bemerkungen weiter spezifiziert werden / Zugänglichkeit für Saugwagen. Sie bezieht sich auf die gesamte Versickerungsanlage / Vorbehandlungsanlagen und kann in den Bemerkungen weiter spezifiziert werden / Accessibilité pour des camions de vidange. Se réfère à toute l''installation d''infiltration / de prétraitement et peut être spécifiée sous REMARQUE';
 ALTER TABLE qgep.od_infiltration_installation ADD COLUMN watertightness  integer ;
COMMENT ON COLUMN qgep.od_infiltration_installation.watertightness IS 'yyy_Wasserdichtheit gegen Oberflächenwasser.  Nur bei Anlagen mit Schächten. / Wasserdichtheit gegen Oberflächenwasser.  Nur bei Anlagen mit Schächten. / Etanchéité contre des eaux superficielles. Uniquement pour des installations avec chambres';
-------
CREATE TABLE qgep.od_manhole
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_manhole_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_manhole_obj_id ON qgep.od_manhole USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_manhole_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_manhole ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_manhole');
COMMENT ON COLUMN qgep.od_manhole.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_manhole ADD COLUMN depth  smallint ;
COMMENT ON COLUMN qgep.od_manhole.depth IS 'yy_Funktion (berechneter Wert) = zugehöriger Abwasserknoten.Sohlenkote minus Deckel.Kote (falls Sohlenkote nicht seperat erfasst, dann ist es die tiefer liegende Haltungspunkt.Kote). Siehe auch SIA 405 2015 4.3.4. / Funktion (berechneter Wert) = zugehöriger Abwasserknoten.Sohlenkote minus Deckel.Kote (falls Sohlenkote nicht separat erfasst, dann ist es die tiefer liegende Haltungspunkt.Kote). Siehe auch SIA 405 2015 4.3.4. / Fonction (valeur calculée) = NOEUD_RESEAU.COTE_RADIER correspondant moins COUVERCLE.COTE (si le radier nest pas saisi séparément, cest la POINT_TRONCON.COTE le plus bas). Cf. SIA 405 cahier technique 2015 4.3.4.';
 ALTER TABLE qgep.od_manhole ADD COLUMN dimension1  smallint ;
COMMENT ON COLUMN qgep.od_manhole.dimension1 IS 'Dimension2 of infiltration installations (largest inside dimension). / Dimension1 des Schachtes (grösstes Innenmass). / Dimension1 de la chambre (plus grande mesure intérieure).';
 ALTER TABLE qgep.od_manhole ADD COLUMN dimension2  smallint ;
COMMENT ON COLUMN qgep.od_manhole.dimension2 IS 'Dimension2 of manhole (smallest inside dimension). With circle shaped manholes leave dimension2 empty, with ovoid manholes fill it in. With rectangular shaped manholes use detailled_geometry to describe further. / Dimension2 des Schachtes (kleinstes Innenmass). Bei runden Schächten wird Dimension2 leer gelassen, bei ovalen abgefüllt. Für eckige Schächte Detailgeometrie verwenden. / Dimension2 de la chambre (plus petite mesure intérieure)';
 ALTER TABLE qgep.od_manhole ADD COLUMN function  integer ;
COMMENT ON COLUMN qgep.od_manhole.function IS 'Kind of function / Art der Nutzung / Genre d''utilisation';
 CREATE INDEX in_od_manhole_function ON qgep.od_manhole USING btree (function);
 ALTER TABLE qgep.od_manhole ADD COLUMN material  integer ;
COMMENT ON COLUMN qgep.od_manhole.material IS 'yyy_Hauptmaterial aus dem das Bauwerk besteht zur groben Klassifizierung. / Hauptmaterial aus dem das Bauwerk besteht zur groben Klassifizierung. / Matériau dont est construit l''ouvrage, pour une classification sommaire';
 ALTER TABLE qgep.od_manhole ADD COLUMN surface_inflow  integer ;
COMMENT ON COLUMN qgep.od_manhole.surface_inflow IS 'yyy_Zuflussmöglichkeit  von Oberflächenwasser direkt in den Schacht / Zuflussmöglichkeit  von Oberflächenwasser direkt in den Schacht / Arrivée directe d''eaux superficielles dans la chambre';
-------
CREATE TABLE qgep.od_lake
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_lake_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_lake_obj_id ON qgep.od_lake USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_lake_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_lake ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_lake');
COMMENT ON COLUMN qgep.od_lake.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
SELECT AddGeometryColumn('qgep', 'od_lake', 'perimeter_geometry', 21781, 'POLYGON', 2, true);
CREATE INDEX in_qgep_od_lake_perimeter_geometry ON qgep.od_lake USING gist (perimeter_geometry );
COMMENT ON COLUMN qgep.od_lake.perimeter_geometry IS 'Boundary points of the perimeter / Begrenzungspunkte der Fläche / Points de délimitation de la surface';
-------
CREATE TABLE qgep.od_river
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_river_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_river_obj_id ON qgep.od_river USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_river_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_river ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_river');
COMMENT ON COLUMN qgep.od_river.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_river ADD COLUMN kind  integer ;
COMMENT ON COLUMN qgep.od_river.kind IS 'yyy_Art des Fliessgewässers. Klassifizierung nach GEWISS / Art des Fliessgewässers. Klassifizierung nach GEWISS / Type de cours d''eau. Classification selon GEWISS';
-------
CREATE TABLE qgep.od_dam
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_dam_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_dam_obj_id ON qgep.od_dam USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_dam_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_dam ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_dam');
COMMENT ON COLUMN qgep.od_dam.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_dam ADD COLUMN kind  integer ;
COMMENT ON COLUMN qgep.od_dam.kind IS 'Type of dam or weir / Art des Wehres / Genre d''ouvrage de retenue';
 ALTER TABLE qgep.od_dam ADD COLUMN vertical_drop  decimal(7,2) ;
COMMENT ON COLUMN qgep.od_dam.vertical_drop IS 'Vertical difference of water level before and after chute / Differenz des Wasserspiegels vor und nach dem Absturz / Différence de la hauteur du plan d''eau avant et après la chute';
-------
CREATE TABLE qgep.od_chute
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_chute_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_chute_obj_id ON qgep.od_chute USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_chute_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_chute ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_chute');
COMMENT ON COLUMN qgep.od_chute.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_chute ADD COLUMN kind  integer ;
COMMENT ON COLUMN qgep.od_chute.kind IS 'Type of chute / Art des Absturzes / Type de seuil';
 ALTER TABLE qgep.od_chute ADD COLUMN material  integer ;
COMMENT ON COLUMN qgep.od_chute.material IS 'Construction material of chute / Material aus welchem der Absturz besteht / Matériau de construction du seuil';
 ALTER TABLE qgep.od_chute ADD COLUMN vertical_drop  decimal(7,2) ;
COMMENT ON COLUMN qgep.od_chute.vertical_drop IS 'Vertical difference of water level before and after chute / Differenz des Wasserspiegels vor und nach dem Absturz / Différence de la hauteur du plan d''eau avant et après la chute';
-------
CREATE TABLE qgep.od_ford
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_ford_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_ford_obj_id ON qgep.od_ford USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_ford_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_ford ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_ford');
COMMENT ON COLUMN qgep.od_ford.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
-------
CREATE TABLE qgep.od_rock_ramp
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_rock_ramp_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_rock_ramp_obj_id ON qgep.od_rock_ramp USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_rock_ramp_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_rock_ramp ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_rock_ramp');
COMMENT ON COLUMN qgep.od_rock_ramp.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_rock_ramp ADD COLUMN stabilisation  integer ;
COMMENT ON COLUMN qgep.od_rock_ramp.stabilisation IS 'Type of stabilisation of rock ramp / Befestigungsart der Sohlrampe / Genre de consolidation de la rampe';
 ALTER TABLE qgep.od_rock_ramp ADD COLUMN vertical_drop  decimal(7,2) ;
COMMENT ON COLUMN qgep.od_rock_ramp.vertical_drop IS 'Vertical difference of water level before and after chute / Differenz des Wasserspiegels vor und nach dem Absturz / Différence de la hauteur du plan d''eau avant et après la chute';
-------
CREATE TABLE qgep.od_blocking_debris
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_blocking_debris_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_blocking_debris_obj_id ON qgep.od_blocking_debris USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_blocking_debris_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_blocking_debris ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_blocking_debris');
COMMENT ON COLUMN qgep.od_blocking_debris.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_blocking_debris ADD COLUMN vertical_drop  decimal(7,2) ;
COMMENT ON COLUMN qgep.od_blocking_debris.vertical_drop IS 'yyy_Vertical difference of water level before and after Sperre / Differenz des Wasserspiegels vor und nach der Sperre / Différence de la hauteur du plan d''eau avant et après le barrage';
-------
CREATE TABLE qgep.od_passage
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_passage_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_passage_obj_id ON qgep.od_passage USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_passage_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_passage ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_passage');
COMMENT ON COLUMN qgep.od_passage.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
-------
CREATE TABLE qgep.od_lock
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_lock_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_lock_obj_id ON qgep.od_lock USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_lock_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_lock ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_lock');
COMMENT ON COLUMN qgep.od_lock.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_lock ADD COLUMN vertical_drop  decimal(7,2) ;
COMMENT ON COLUMN qgep.od_lock.vertical_drop IS 'yyy_Vertical difference of water level before and after Schleuse / Differenz im Wasserspiegel oberhalb und unterhalb der Schleuse / Différence des plans d''eau entre l''amont et l''aval de l''écluse';
-------
CREATE TABLE qgep.od_param_ca_mouse1
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_param_ca_mouse1_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_param_ca_mouse1_obj_id ON qgep.od_param_ca_mouse1 USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_param_ca_mouse1_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_param_ca_mouse1 ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_param_ca_mouse1');
COMMENT ON COLUMN qgep.od_param_ca_mouse1.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_param_ca_mouse1 ADD COLUMN dry_wheather_flow  decimal(9,3) ;
COMMENT ON COLUMN qgep.od_param_ca_mouse1.dry_wheather_flow IS 'Parameter for calculation of surface runoff for surface runoff modell A1 / Parameter zur Bestimmung des Oberflächenabflusses für das Oberflächenabflussmodell A1 von MOUSE / Paramètre pour calculer l''écoulement superficiel selon le modèle A1 de MOUSE';
 ALTER TABLE qgep.od_param_ca_mouse1 ADD COLUMN flow_path_length  decimal(7,2) ;
COMMENT ON COLUMN qgep.od_param_ca_mouse1.flow_path_length IS 'yyy_Parameter zur Bestimmung des Oberflächenabflusses für das Oberflächenabflussmodell A1 von MOUSE / Parameter zur Bestimmung des Oberflächenabflusses für das Oberflächenabflussmodell A1 von MOUSE / Paramètre pour calculer l''écoulement superficiel selon le modèle A1 de MOUSE';
 ALTER TABLE qgep.od_param_ca_mouse1 ADD COLUMN flow_path_slope  smallint ;
COMMENT ON COLUMN qgep.od_param_ca_mouse1.flow_path_slope IS 'yyy_Parameter zur Bestimmung des Oberflächenabflusses für das Oberflächenabflussmodell A1 von MOUSE [%o] / Parameter zur Bestimmung des Oberflächenabflusses für das Oberflächenabflussmodell A1 von MOUSE [%o] / Paramètre pour calculer l''écoulement superficiel selon le modèle A1 de MOUSE [%o]';
 ALTER TABLE qgep.od_param_ca_mouse1 ADD COLUMN population_equivalent  smallint ;
COMMENT ON COLUMN qgep.od_param_ca_mouse1.population_equivalent IS 'yyy_Parameter zur Bestimmung des Oberflächenabflusses für das Oberflächenabflussmodell A1 von MOUSE [%o] / Parameter zur Bestimmung des Oberflächenabflusses für das Oberflächenabflussmodell A1 von MOUSE [%o] / Paramètre pour calculer l''''écoulement superficiel selon le modèle A1 de MOUSE [%o]';
 ALTER TABLE qgep.od_param_ca_mouse1 ADD COLUMN surface_ca_mouse  decimal(8,2) ;
COMMENT ON COLUMN qgep.od_param_ca_mouse1.surface_ca_mouse IS 'yyy_Parameter zur Bestimmung des Oberflächenabflusses für das Oberflächenabflussmodell A1 von MOUSE / Parameter zur Bestimmung des Oberflächenabflusses für das Oberflächenabflussmodell A1 von MOUSE / Paramètre pour calculer l''écoulement superficiel selon le modèle A1 de MOUSE';
 ALTER TABLE qgep.od_param_ca_mouse1 ADD COLUMN usage  varchar(50) ;
COMMENT ON COLUMN qgep.od_param_ca_mouse1.usage IS 'Classification based on surface runoff modell MOUSE 2000/2001 / Klassifikation gemäss Oberflächenabflussmodell von MOUSE 2000/2001 / Classification selon le modèle surface de MOUSE 2000/2001';
-------
CREATE TABLE qgep.od_param_ca_general
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_param_ca_general_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_param_ca_general_obj_id ON qgep.od_param_ca_general USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_param_ca_general_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_param_ca_general ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_param_ca_general');
COMMENT ON COLUMN qgep.od_param_ca_general.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_param_ca_general ADD COLUMN dry_wheather_flow  decimal(9,3) ;
COMMENT ON COLUMN qgep.od_param_ca_general.dry_wheather_flow IS 'Dry wheather flow / Débit temps sec';
 ALTER TABLE qgep.od_param_ca_general ADD COLUMN flow_path_length  decimal(7,2) ;
COMMENT ON COLUMN qgep.od_param_ca_general.flow_path_length IS 'Length of flow path / Fliessweglänge / longueur de la ligne d''écoulement';
 ALTER TABLE qgep.od_param_ca_general ADD COLUMN flow_path_slope  smallint ;
COMMENT ON COLUMN qgep.od_param_ca_general.flow_path_slope IS 'Slope of flow path [%o] / Fliessweggefälle [%o] / Pente de la ligne d''écoulement [%o]';
 ALTER TABLE qgep.od_param_ca_general ADD COLUMN population_equivalent  smallint ;
COMMENT ON COLUMN qgep.od_param_ca_general.population_equivalent IS 'Slope of flow path [%o] / Fliessweggefälle [%o] / Pente de la ligne d''''écoulement [%o]';
 ALTER TABLE qgep.od_param_ca_general ADD COLUMN surface_ca  decimal(8,2) ;
COMMENT ON COLUMN qgep.od_param_ca_general.surface_ca IS 'yyy_Surface bassin versant MOUSE1 / Fläche des Einzugsgebietes für MOUSE1 / Surface bassin versant MOUSE1';
-------
CREATE TABLE qgep.od_private
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_private_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_private_obj_id ON qgep.od_private USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_private_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_private ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_private');
COMMENT ON COLUMN qgep.od_private.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_private ADD COLUMN kind  varchar(50) ;
COMMENT ON COLUMN qgep.od_private.kind IS 'For further attributes see organisation / Weitere Attribute siehe Organisation / Pour les autres attributs voir sous ORGANISATION';
-------
CREATE TABLE qgep.od_administrative_office
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_administrative_office_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_administrative_office_obj_id ON qgep.od_administrative_office USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_administrative_office_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_administrative_office ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_administrative_office');
COMMENT ON COLUMN qgep.od_administrative_office.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
-------
CREATE TABLE qgep.od_canton
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_canton_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_canton_obj_id ON qgep.od_canton USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_canton_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_canton ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_canton');
COMMENT ON COLUMN qgep.od_canton.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
SELECT AddGeometryColumn('qgep', 'od_canton', 'perimeter_geometry', 21781, 'POLYGON', 2, true);
CREATE INDEX in_qgep_od_canton_perimeter_geometry ON qgep.od_canton USING gist (perimeter_geometry );
COMMENT ON COLUMN qgep.od_canton.perimeter_geometry IS 'Border of canton / Kantonsgrenze / Limites cantonales';
-------
CREATE TABLE qgep.od_cooperative
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_cooperative_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_cooperative_obj_id ON qgep.od_cooperative USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_cooperative_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_cooperative ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_cooperative');
COMMENT ON COLUMN qgep.od_cooperative.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
-------
CREATE TABLE qgep.od_municipality
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_municipality_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_municipality_obj_id ON qgep.od_municipality USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_municipality_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_municipality ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_municipality');
COMMENT ON COLUMN qgep.od_municipality.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_municipality ADD COLUMN altitude  decimal(7,3) ;
COMMENT ON COLUMN qgep.od_municipality.altitude IS 'Average altitude of settlement area / Mittlere Höhe des Siedlungsgebietes / Altitude moyenne de l''agglomération';
 ALTER TABLE qgep.od_municipality ADD COLUMN gwdp_year  smallint ;
COMMENT ON COLUMN qgep.od_municipality.gwdp_year IS 'Year of legal validity of General Water Drainage Planning (GWDP) / Rechtsgültiges GEP aus dem Jahr / PGEE en vigueur depuis';
 ALTER TABLE qgep.od_municipality ADD COLUMN municipality_number  smallint ;
COMMENT ON COLUMN qgep.od_municipality.municipality_number IS 'Official number of federal office for statistics / Offizielle Nummer gemäss Bundesamt für Statistik / Numéro officiel de la commune selon l''Office fédéral de la statistique';
SELECT AddGeometryColumn('qgep', 'od_municipality', 'perimeter_geometry', 21781, 'POLYGON', 2, true);
CREATE INDEX in_qgep_od_municipality_perimeter_geometry ON qgep.od_municipality USING gist (perimeter_geometry );
COMMENT ON COLUMN qgep.od_municipality.perimeter_geometry IS 'Border of the municipality / Gemeindegrenze / Limites communales';
 ALTER TABLE qgep.od_municipality ADD COLUMN population  smallint ;
COMMENT ON COLUMN qgep.od_municipality.population IS 'Permanent opulation (based on statistics of the municipality) / Ständige Einwohner (laut Einwohnerkontrolle der Gemeinde) / Habitants permanents (selon le contrôle des habitants de la commune)';
 ALTER TABLE qgep.od_municipality ADD COLUMN total_surface  decimal(8,2) ;
COMMENT ON COLUMN qgep.od_municipality.total_surface IS 'Total surface without lakes / Fläche ohne Seeanteil / Surface sans partie de lac';
-------
CREATE TABLE qgep.od_waste_water_association
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_waste_water_association_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_waste_water_association_obj_id ON qgep.od_waste_water_association USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_waste_water_association_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_waste_water_association ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_waste_water_association');
COMMENT ON COLUMN qgep.od_waste_water_association.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
-------
CREATE TABLE qgep.od_waste_water_treatment_plant
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_waste_water_treatment_plant_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_waste_water_treatment_plant_obj_id ON qgep.od_waste_water_treatment_plant USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_waste_water_treatment_plant_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_waste_water_treatment_plant ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_waste_water_treatment_plant');
COMMENT ON COLUMN qgep.od_waste_water_treatment_plant.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_waste_water_treatment_plant ADD COLUMN bod5  smallint ;
COMMENT ON COLUMN qgep.od_waste_water_treatment_plant.bod5 IS '5 day biochemical oxygen demand measured at a temperatur of 20 degree celsius. YYY / Biochemischer Sauerstoffbedarf nach 5 Tagen Messzeit und bei einer Temperatur vom 20 Grad Celsius. Er stellt den Verbrauch an gelöstem Sauerstoff durch die Lebensvorgänge der im Wasser oder Abwasser enthaltenen Mikroorganismen (Bakterienprotozoen) beim  A / Elle représente la quantité doxygène dépensée par les phénomènes doxydation chimique, dune part, et, dautre part, la dégradation des matières organiques par voie aérobie, nécessaire à la destruction des composés organiques. Elle sexprime en milligram';
 ALTER TABLE qgep.od_waste_water_treatment_plant ADD COLUMN cod  smallint ;
COMMENT ON COLUMN qgep.od_waste_water_treatment_plant.cod IS 'Abbreviation for chemical oxygen demand (COD). / Abkürzung für den chemischen Sauerstoffbedarf. Die englische Abkürzung lautet COD. Mit einem starken Oxydationsmittel wird mehr oder weniger erfolgreich versucht, die organischen Verbindungen der Abwasserprobe zu CO2 und H2O zu oxydieren. Als Oxydationsmi / Elle représente la teneur totale de leau en matières organiques, quelles soient ou non biodégradables. Le principe repose sur la recherche dun besoin doxygène de léchantillon pour dégrader la matière organique. Mais dans ce cas, loxygène est fourni ';
 ALTER TABLE qgep.od_waste_water_treatment_plant ADD COLUMN elimination_cod  smallint ;
COMMENT ON COLUMN qgep.od_waste_water_treatment_plant.elimination_cod IS 'Dimensioning value elimination rate in percent / Dimensionierungswert Eliminationsrate in % / Valeur de dimensionnement, taux d''élimination en %';
 ALTER TABLE qgep.od_waste_water_treatment_plant ADD COLUMN elimination_n  smallint ;
COMMENT ON COLUMN qgep.od_waste_water_treatment_plant.elimination_n IS 'Denitrification at at waster water temperature of below 10 degree celsius / Denitrifikation bei einer Abwassertemperatur von > 10 Grad / Dénitrification à une température des eaux supérieure à 10°C';
 ALTER TABLE qgep.od_waste_water_treatment_plant ADD COLUMN elimination_nh4  smallint ;
COMMENT ON COLUMN qgep.od_waste_water_treatment_plant.elimination_nh4 IS 'Dimensioning value elimination rate in percent / Dimensionierungswert: Eliminationsrate in % / Valeur de dimensionnement, taux d''élimination en %';
 ALTER TABLE qgep.od_waste_water_treatment_plant ADD COLUMN elimination_p  smallint ;
COMMENT ON COLUMN qgep.od_waste_water_treatment_plant.elimination_p IS 'Dimensioning value elimination rate in percent / Dimensionierungswert Eliminationsrate in % / Valeur de dimensionnement, taux d''élimination en %';
 ALTER TABLE qgep.od_waste_water_treatment_plant ADD COLUMN installation_number  smallint ;
COMMENT ON COLUMN qgep.od_waste_water_treatment_plant.installation_number IS 'WWTP Number from Federal Office for the Environment (FOEN) / ARA-Nummer gemäss Bundesamt für Umwelt (BAFU) / Numéro de la STEP selon l''Office fédéral de l''environnement (OFEV)';
 ALTER TABLE qgep.od_waste_water_treatment_plant ADD COLUMN kind  varchar(50) ;
COMMENT ON COLUMN qgep.od_waste_water_treatment_plant.kind IS 'WWTP Number from Federal Office for the Environment (FOEN) / ARA-Nummer gemäss Bundesamt für Umwelt (BAFU) / Numéro de la STEP selon l''''Office fédéral de l''''environnement (OFEV)';
 ALTER TABLE qgep.od_waste_water_treatment_plant ADD COLUMN nh4  smallint ;
COMMENT ON COLUMN qgep.od_waste_water_treatment_plant.nh4 IS 'yyy_Dimensioning value Ablauf Vorklärung. NH4 [gNH4/m3] / Dimensionierungswert Ablauf Vorklärung. NH4 [gNH4/m3] / Valeur de dimensionnement, NH4 à la sortie du décanteur primaire. NH4 [gNH4/m3]';
 ALTER TABLE qgep.od_waste_water_treatment_plant ADD COLUMN start_year  smallint ;
COMMENT ON COLUMN qgep.od_waste_water_treatment_plant.start_year IS 'Start of operation (year) / Jahr der Inbetriebnahme / Année de la mise en exploitation';
-------
CREATE TABLE qgep.od_wastewater_node
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_wastewater_node_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_wastewater_node_obj_id ON qgep.od_wastewater_node USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_wastewater_node_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_wastewater_node ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_wastewater_node');
COMMENT ON COLUMN qgep.od_wastewater_node.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_wastewater_node ADD COLUMN backflow_level  decimal(7,3) ;
COMMENT ON COLUMN qgep.od_wastewater_node.backflow_level IS 'yyy_1. Massgebende Rückstaukote bezogen auf den Berechnungsregen (dss)  2. Höhe, unter der innerhalb der Grundstücksentwässerung besondere Massnahmen gegen Rückstau zu treffen sind. (DIN 4045) / 1. Massgebende Rückstaukote bezogen auf den Berechnungsregen (dss)  2. Höhe, unter der innerhalb der Grundstücksentwässerung besondere Massnahmen gegen Rückstau zu treffen sind. (DIN 4045) / Cote de refoulement déterminante calculée à partir des pluies de projet';
 ALTER TABLE qgep.od_wastewater_node ADD COLUMN bottom_level  decimal(7,3) ;
COMMENT ON COLUMN qgep.od_wastewater_node.bottom_level IS 'yyy_Tiefster Punkt des Abwasserbauwerks / Tiefster Punkt des Abwasserbauwerks / Point le plus bas du noeud';
SELECT AddGeometryColumn('qgep', 'od_wastewater_node', 'situation_geometry', 21781, 'POINT', 2, true);
CREATE INDEX in_qgep_od_wastewater_node_situation_geometry ON qgep.od_wastewater_node USING gist (situation_geometry );
COMMENT ON COLUMN qgep.od_wastewater_node.situation_geometry IS 'yyy Situation of node. Decisive reference point for sewer network simulation  (In der Regel Lage des Pickellochs oder Lage des Trockenwetterauslauf) / Lage des Knotens, massgebender Bezugspunkt für die Kanalnetzberechnung. (In der Regel Lage des Pickellochs oder Lage des Trockenwetterauslaufs) / Positionnement du nud. Point de référence déterminant pour le calcul de réseau de canalisations (en règle générale positionnement du milieu du couvercle ou de la sortie temps sec)';
-------
CREATE TABLE qgep.od_reach
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_reach_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_reach_obj_id ON qgep.od_reach USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_reach_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_reach ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_reach');
COMMENT ON COLUMN qgep.od_reach.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_reach ADD COLUMN clear_height  smallint ;
COMMENT ON COLUMN qgep.od_reach.clear_height IS 'Maximal height (inside) of profile / Maximale Innenhöhe des Kanalprofiles / Hauteur intérieure maximale du profil';
 ALTER TABLE qgep.od_reach ADD COLUMN coefficient_of_friction  smallint ;
COMMENT ON COLUMN qgep.od_reach.coefficient_of_friction IS 'yyy http://www.linguee.com/english-german/search?source=auto&query=reibungsbeiwert / Hydraulische Kenngrösse zur Beschreibung der Beschaffenheit der Kanalwandung. Beiwert für die Formeln nach Manning-Strickler (K oder kstr) / Constante de rugosité selon Manning-Strickler (K ou kstr)';
 ALTER TABLE qgep.od_reach ADD COLUMN elevation_determination  integer ;
COMMENT ON COLUMN qgep.od_reach.elevation_determination IS 'yyy_Definiert die Hoehenbestimmung einer Haltung. / Definiert die Hoehenbestimmung einer Haltung. / Définition de la détermination altimétrique d''un tronçon.';
 ALTER TABLE qgep.od_reach ADD COLUMN horizontal_positioning  integer ;
COMMENT ON COLUMN qgep.od_reach.horizontal_positioning IS 'yyy_Definiert die Lagegenauigkeit der Verlaufspunkte. / Definiert die Lagegenauigkeit der Verlaufspunkte. / Définit la précision de la détermination du tracé.';
 ALTER TABLE qgep.od_reach ADD COLUMN inside_coating  integer ;
COMMENT ON COLUMN qgep.od_reach.inside_coating IS 'yyy_Schutz der Innenwände des Kanals / Schutz der Innenwände des Kanals / Protection de la paroi intérieur de la canalisation';
 ALTER TABLE qgep.od_reach ADD COLUMN length_effective  decimal(7,2) ;
COMMENT ON COLUMN qgep.od_reach.length_effective IS 'yyy_Tatsächliche schräge Länge (d.h. nicht in horizontale Ebene projiziert)  inklusive Kanalkrümmungen / Tatsächliche schräge Länge (d.h. nicht in horizontale Ebene projiziert)  inklusive Kanalkrümmungen / Longueur effective (non projetée) incluant les parties incurvées';
 ALTER TABLE qgep.od_reach ADD COLUMN material  integer ;
COMMENT ON COLUMN qgep.od_reach.material IS 'Material of reach / pipe / Rohrmaterial / Matériau du tuyau';
SELECT AddGeometryColumn('qgep', 'od_reach', 'progression_geometry', 21781, 'LINESTRING', 2, true);
CREATE INDEX in_qgep_od_reach_progression_geometry ON qgep.od_reach USING gist (progression_geometry );
-- kf COMMENT ON COLUMN qgep.od_reach.progression IS 'Start, inflextion and endpoints of a pipe / Anfangs-, Knick- und Endpunkte der Leitung / Points de départ, intermédiaires et darrivée de la conduite.';
COMMENT ON COLUMN qgep.od_reach.progression_geometry IS 'Start, inflextion and endpoints of a pipe / Anfangs-, Knick- und Endpunkte der Leitung / Points de départ, intermédiaires et darrivée de la conduite.';
SELECT AddGeometryColumn('qgep', 'od_reach', 'progression_3d_geometry', 21781, 'LINESTRING', 3, true);
CREATE INDEX in_qgep_od_reach_progression_3d_geometry ON qgep.od_reach USING gist (progression_3d_geometry );
COMMENT ON COLUMN qgep.od_reach.progression_3d_geometry IS 'Start, inflextion and endpoints of a pipe (3D coordinates) / Anfangs-, Knick- und Endpunkte der Leitung (3D Koordinaten) / Points de départ, intermédiaires et darrivée de la conduite (coordonnées 3D)';
 ALTER TABLE qgep.od_reach ADD COLUMN reliner_material  integer ;
COMMENT ON COLUMN qgep.od_reach.reliner_material IS 'Material of reliner / Material des Reliners / Materiaux du relining';
 ALTER TABLE qgep.od_reach ADD COLUMN reliner_nominal_size  smallint ;
COMMENT ON COLUMN qgep.od_reach.reliner_nominal_size IS 'yyy_Profilhöhe des Inliners (innen). Beim Export in Hydrauliksoftware müsste dieser Wert statt Haltung.Lichte_Hoehe übernommen werden um korrekt zu simulieren. / Profilhöhe des Inliners (innen). Beim Export in Hydrauliksoftware müsste dieser Wert statt Haltung.Lichte_Hoehe übernommen werden um korrekt zu simulieren. / Hauteur intérieure maximale du profil de l''inliner. A l''export dans le software hydraulique il faut utiliser cette attribut au lieu de HAUTEUR_MAX_PROFIL';
 ALTER TABLE qgep.od_reach ADD COLUMN relining_construction  integer ;
COMMENT ON COLUMN qgep.od_reach.relining_construction IS 'yyy_Bautechnik für das Relining. Zusätzlich wird der Einbau des Reliners als  Erhaltungsereignis abgebildet: Erhaltungsereignis.Art = Reparatur für Partieller_Liner, sonst Renovierung. / Bautechnik für das Relining. Zusätzlich wird der Einbau des Reliners als  Erhaltungsereignis abgebildet: Erhaltungsereignis.Art = Reparatur für Partieller_Liner, sonst Renovierung. / Relining technique de construction. En addition la construction du reliner doit être modeler comme événement maintenance: Genre = reparation pour liner_partiel, autrement genre = renovation.';
 ALTER TABLE qgep.od_reach ADD COLUMN relining_kind  integer ;
COMMENT ON COLUMN qgep.od_reach.relining_kind IS 'Kind of relining / Art des Relinings / Genre du relining';
 ALTER TABLE qgep.od_reach ADD COLUMN ring_stiffness  smallint ;
COMMENT ON COLUMN qgep.od_reach.ring_stiffness IS 'yyy Ringsteifigkeitsklasse - Druckfestigkeit gegen Belastungen von aussen (gemäss ISO 13966 ) / Ringsteifigkeitsklasse - Druckfestigkeit gegen Belastungen von aussen (gemäss ISO 13966 ) / Rigidité annulaire pour des pressions extérieures (selon ISO 13966)';
 ALTER TABLE qgep.od_reach ADD COLUMN slope_building_plan  smallint ;
COMMENT ON COLUMN qgep.od_reach.slope_building_plan IS 'yyy_Auf dem alten Plan eingezeichnetes Plangefälle [%o]. Nicht kontrolliert im Feld. Kann nicht für die hydraulische Berechnungen übernommen werden. Für Liegenschaftsentwässerung und Meliorationsleitungen. Darstellung als z.B. 3.5%oP auf Plänen. / Auf dem alten Plan eingezeichnetes Plangefälle [%o]. Nicht kontrolliert im Feld. Kann nicht für die hydraulische Berechnungen übernommen werden. Für Liegenschaftsentwässerung und Meliorationsleitungen. Darstellung als z.B. 3.5%oP auf Plänen. / Pente indiquée sur d''anciens plans non contrôlée [%o]. Ne peut pas être reprise pour des calculs hydrauliques. Indication pour des canalisations de biens-fonds ou d''amélioration foncière. Représentation sur de plan: 3.5 p';
 ALTER TABLE qgep.od_reach ADD COLUMN wall_roughness  decimal(5,2) ;
COMMENT ON COLUMN qgep.od_reach.wall_roughness IS 'yyy Hydraulische Kenngrösse zur Beschreibung der Beschaffenheit der Kanalwandung. Beiwert für die Formeln nach Prandtl-Colebrook (ks oder kb) / Hydraulische Kenngrösse zur Beschreibung der Beschaffenheit der Kanalwandung. Beiwert für die Formeln nach Prandtl-Colebrook (ks oder kb) / Coefficient de rugosité d''après Prandtl Colebrook (ks ou kb)';
-------
CREATE TABLE qgep.od_pump
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_pump_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_pump_obj_id ON qgep.od_pump USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_pump_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_pump ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_pump');
COMMENT ON COLUMN qgep.od_pump.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_pump ADD COLUMN contruction_type  integer ;
COMMENT ON COLUMN qgep.od_pump.contruction_type IS 'Types of pumps / Pumpenarten / Types de pompe';
 ALTER TABLE qgep.od_pump ADD COLUMN operating_point  decimal(9,2) ;
COMMENT ON COLUMN qgep.od_pump.operating_point IS 'Flow for pumps with fixed operating point / Fördermenge für Pumpen mit fixem Arbeitspunkt / Débit refoulé par la pompe avec point de travail fixe';
 ALTER TABLE qgep.od_pump ADD COLUMN placement_of_actuation  integer ;
COMMENT ON COLUMN qgep.od_pump.placement_of_actuation IS 'Type of placement of the actuation / Art der Aufstellung des Motors / Genre de montage';
 ALTER TABLE qgep.od_pump ADD COLUMN placement_of_pump  integer ;
COMMENT ON COLUMN qgep.od_pump.placement_of_pump IS 'Type of placement of the pomp / Art der Aufstellung der Pumpe / Genre de montage de la pompe';
 ALTER TABLE qgep.od_pump ADD COLUMN pump_flow_max_single  decimal(9,3) ;
COMMENT ON COLUMN qgep.od_pump.pump_flow_max_single IS 'yyy_Maximaler Förderstrom der Pumpen (einzeln als Bauwerkskomponente). Tritt in der Regel bei der minimalen Förderhöhe ein. / Maximaler Förderstrom der Pumpe (einzeln als Bauwerkskomponente). Tritt in der Regel bei der minimalen Förderhöhe ein. / Débit de refoulement maximal des pompes individuelles en tant que composante douvrage. Survient normalement à la hauteur min de refoulement.';
 ALTER TABLE qgep.od_pump ADD COLUMN pump_flow_min_single  decimal(9,3) ;
COMMENT ON COLUMN qgep.od_pump.pump_flow_min_single IS 'yyy_Minimaler Förderstrom der Pumpe (einzeln als Bauwerkskomponente). Tritt in der Regel bei der maximalen Förderhöhe ein. / Minimaler Förderstrom der Pumpe (einzeln als Bauwerkskomponente). Tritt in der Regel bei der maximalen Förderhöhe ein. / Débit de refoulement maximal de toutes les pompes de louvrage (STAP) ou des pompes individuelles en tant que composante douvrage. Survient normalement à la hauteur min de refoulement.';
 ALTER TABLE qgep.od_pump ADD COLUMN start_level  decimal(7,3) ;
COMMENT ON COLUMN qgep.od_pump.start_level IS 'yyy_Kote des Wasserspiegels im Pumpensumpf, bei der die Pumpe eingeschaltet wird (Einschaltkote) / Kote des Wasserspiegels im Pumpensumpf, bei der die Pumpe eingeschaltet wird (Einschaltkote) / Cote du niveau d''eau dans le puisard à laquelle s''enclenche la pompe';
 ALTER TABLE qgep.od_pump ADD COLUMN stop_level  decimal(7,3) ;
COMMENT ON COLUMN qgep.od_pump.stop_level IS 'yyy_Kote des Wasserspiegels im Pumpensumpf, bei der die Pumpe ausgeschaltet wird (Ausschaltkote) / Kote des Wasserspiegels im Pumpensumpf, bei der die Pumpe ausgeschaltet wird (Ausschaltkote) / Cote du niveau d''eau dans le puisard à laquelle s''arrête la pompe';
 ALTER TABLE qgep.od_pump ADD COLUMN usage_current  integer ;
COMMENT ON COLUMN qgep.od_pump.usage_current IS 'yyy_Nutzungsart_Ist des gepumpten Abwassers. / Nutzungsart_Ist des gepumpten Abwassers. / Genre d''utilisation actuel de l''eau usée pompée';
-------
CREATE TABLE qgep.od_leapingweir
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_leapingweir_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_leapingweir_obj_id ON qgep.od_leapingweir USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_leapingweir_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_leapingweir ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_leapingweir');
COMMENT ON COLUMN qgep.od_leapingweir.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_leapingweir ADD COLUMN lenght  decimal(7,2) ;
COMMENT ON COLUMN qgep.od_leapingweir.lenght IS 'yyy_Maximale Abmessung der Bodenöffnung in Fliessrichtung / Maximale Abmessung der Bodenöffnung in Fliessrichtung / Dimension maximale de l''ouverture de fond parallèlement au courant';
 ALTER TABLE qgep.od_leapingweir ADD COLUMN opening_shape  integer ;
COMMENT ON COLUMN qgep.od_leapingweir.opening_shape IS 'Shape of opening in the floor / Form der  Bodenöffnung / Forme de l''ouverture de fond';
 ALTER TABLE qgep.od_leapingweir ADD COLUMN width  decimal(7,2) ;
COMMENT ON COLUMN qgep.od_leapingweir.width IS 'yyy_Maximale Abmessung der Bodenöffnung quer zur Fliessrichtung / Maximale Abmessung der Bodenöffnung quer zur Fliessrichtung / Dimension maximale de l''ouverture de fond perpendiculairement à la direction d''écoulement';
-------
CREATE TABLE qgep.od_prank_weir
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_prank_weir_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_prank_weir_obj_id ON qgep.od_prank_weir USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_prank_weir_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_prank_weir ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_prank_weir');
COMMENT ON COLUMN qgep.od_prank_weir.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_prank_weir ADD COLUMN hydraulic_overflow_length  decimal(7,2) ;
COMMENT ON COLUMN qgep.od_prank_weir.hydraulic_overflow_length IS 'yyy_Hydraulisch wirksame Wehrlänge / Hydraulisch wirksame Wehrlänge / Longueur du déversoir hydrauliquement active';
 ALTER TABLE qgep.od_prank_weir ADD COLUMN level_max  decimal(7,3) ;
COMMENT ON COLUMN qgep.od_prank_weir.level_max IS 'yyy_Höhe des höchsten Punktes der Überfallkante / Höhe des höchsten Punktes der Überfallkante / Niveau max. de la crête déversante';
 ALTER TABLE qgep.od_prank_weir ADD COLUMN level_min  decimal(7,3) ;
COMMENT ON COLUMN qgep.od_prank_weir.level_min IS 'yyy_Höhe des tiefsten Punktes der Überfallkante / Höhe des tiefsten Punktes der Überfallkante / Niveau min. de la crête déversante';
 ALTER TABLE qgep.od_prank_weir ADD COLUMN weir_edge  integer ;
COMMENT ON COLUMN qgep.od_prank_weir.weir_edge IS 'yyy_Ausbildung der Überfallkante / Ausbildung der Überfallkante / Forme de la crête';
 ALTER TABLE qgep.od_prank_weir ADD COLUMN weir_kind  integer ;
COMMENT ON COLUMN qgep.od_prank_weir.weir_kind IS 'yyy_Art der Wehrschweille des Streichwehrs / Art der Wehrschwelle des Streichwehrs / Genre de surverse du déversoir latéral';
-------
CREATE TABLE qgep.od_individual_surface
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_individual_surface_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_individual_surface_obj_id ON qgep.od_individual_surface USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_individual_surface_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_individual_surface ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_individual_surface');
COMMENT ON COLUMN qgep.od_individual_surface.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_individual_surface ADD COLUMN function  integer ;
COMMENT ON COLUMN qgep.od_individual_surface.function IS 'Type of usage of surface / Art der Nutzung der Fläche / Genre d''utilisation de la surface';
 ALTER TABLE qgep.od_individual_surface ADD COLUMN inclination  smallint ;
COMMENT ON COLUMN qgep.od_individual_surface.inclination IS 'yyy_Mittlere Neigung der Oberfläche in Promill / Mittlere Neigung der Oberfläche in Promill / Pente moyenne de la surface en promille';
 ALTER TABLE qgep.od_individual_surface ADD COLUMN pavement  integer ;
COMMENT ON COLUMN qgep.od_individual_surface.pavement IS 'Type of pavement / Art der Befestigung / Genre de couverture du sol';
SELECT AddGeometryColumn('qgep', 'od_individual_surface', 'perimeter_geometry', 21781, 'POLYGON', 2, true);
CREATE INDEX in_qgep_od_individual_surface_perimeter_geometry ON qgep.od_individual_surface USING gist (perimeter_geometry );
COMMENT ON COLUMN qgep.od_individual_surface.perimeter_geometry IS 'Boundary points of the perimeter / Begrenzungspunkte der Fläche / Points de délimitation de la surface';
-------
CREATE TABLE qgep.od_building
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_building_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_building_obj_id ON qgep.od_building USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_building_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_building ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_building');
COMMENT ON COLUMN qgep.od_building.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_building ADD COLUMN house_number  varchar(50) ;
COMMENT ON COLUMN qgep.od_building.house_number IS 'House number based on cadastral register / Hausnummer gemäss Grundbuch / Numéro de bâtiment selon le registre foncier';
 ALTER TABLE qgep.od_building ADD COLUMN location_name  varchar(50) ;
COMMENT ON COLUMN qgep.od_building.location_name IS 'Street name or name of the location / Strassenname oder Ortsbezeichnung / Nom de la route ou du lieu';
SELECT AddGeometryColumn('qgep', 'od_building', 'perimeter_geometry', 21781, 'POLYGON', 2, true);
CREATE INDEX in_qgep_od_building_perimeter_geometry ON qgep.od_building USING gist (perimeter_geometry );
COMMENT ON COLUMN qgep.od_building.perimeter_geometry IS 'Boundary points of the perimeter / Begrenzungspunkte der Fläche / Points de délimitation de la surface';
SELECT AddGeometryColumn('qgep', 'od_building', 'reference_point_geometry', 21781, 'POINT', 2, true);
CREATE INDEX in_qgep_od_building_reference_point_geometry ON qgep.od_building USING gist (reference_point_geometry );
COMMENT ON COLUMN qgep.od_building.reference_point_geometry IS 'National position coordinates (East, North) (relevant point for e.g. address) / Landeskoordinate Ost/Nord (massgebender Bezugspunkt für z.B. Adressdaten ) / Coordonnées nationales Est/Nord (Point de référence pour la détermination de l''adresse par exemple)';
-------
CREATE TABLE qgep.od_reservoir
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_reservoir_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_reservoir_obj_id ON qgep.od_reservoir USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_reservoir_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_reservoir ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_reservoir');
COMMENT ON COLUMN qgep.od_reservoir.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_reservoir ADD COLUMN location_name  varchar(50) ;
COMMENT ON COLUMN qgep.od_reservoir.location_name IS 'Street name or name of the location / Strassenname oder Ortsbezeichnung / Nom de la route ou du lieu';
SELECT AddGeometryColumn('qgep', 'od_reservoir', 'situation_geometry', 21781, 'POINT', 2, true);
CREATE INDEX in_qgep_od_reservoir_situation_geometry ON qgep.od_reservoir USING gist (situation_geometry );
COMMENT ON COLUMN qgep.od_reservoir.situation_geometry IS 'National position coordinates (East, North) / Landeskoordinate Ost/Nord / Coordonnées nationales Est/Nord';
-------
CREATE TABLE qgep.od_fountain
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_fountain_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_fountain_obj_id ON qgep.od_fountain USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_fountain_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_fountain ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_fountain');
COMMENT ON COLUMN qgep.od_fountain.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_fountain ADD COLUMN location_name  varchar(50) ;
COMMENT ON COLUMN qgep.od_fountain.location_name IS 'Street name or name of the location / Strassenname oder Ortsbezeichnung / Nom de la route ou du lieu';
SELECT AddGeometryColumn('qgep', 'od_fountain', 'situation_geometry', 21781, 'POINT', 2, true);
CREATE INDEX in_qgep_od_fountain_situation_geometry ON qgep.od_fountain USING gist (situation_geometry );
COMMENT ON COLUMN qgep.od_fountain.situation_geometry IS 'National position coordinates (East, North) / Landeskoordinate Ost/Nord / Coordonnées nationales Est/Nord';
------------ Relationships and Value Tables ----------- ;
CREATE TABLE qgep.vl_mutation_kind () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_mutation_kind ADD CONSTRAINT pkey_qgep_vl_mutation_kind PRIMARY KEY (code);
 INSERT INTO qgep.vl_mutation_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5523,'created','erstellt','cree', '', '', '', 'true');
 INSERT INTO qgep.vl_mutation_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5582,'changed','geaendert','changee', '', '', '', 'true');
 INSERT INTO qgep.vl_mutation_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5583,'deleted','geloescht','effacee', '', '', '', 'true');
 ALTER TABLE qgep.od_mutation ADD CONSTRAINT fkey_vl_mutation_kind FOREIGN KEY (kind)
 REFERENCES qgep.vl_mutation_kind (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_sludge_treatment_stabilisation () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_sludge_treatment_stabilisation ADD CONSTRAINT pkey_qgep_vl_sludge_treatment_stabilisation  PRIMARY KEY (code);
 INSERT INTO qgep.vl_sludge_treatment_stabilisation (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (141,'aerob_cold','aerobkalt','aerobie_froid', '', '', '', 'true');
 INSERT INTO qgep.vl_sludge_treatment_stabilisation (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (332,'aerobthermophil','aerobthermophil','aerobie_thermophile', '', '', '', 'true');
 INSERT INTO qgep.vl_sludge_treatment_stabilisation (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (333,'anaerob_cold','anaerobkalt','anaerobie_froid', '', '', '', 'true');
 INSERT INTO qgep.vl_sludge_treatment_stabilisation (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (334,'anaerob_mesophil','anaerobmesophil','anaerobie_mesophile', '', '', '', 'true');
 INSERT INTO qgep.vl_sludge_treatment_stabilisation (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (335,'anaerob_thermophil','anaerobthermophil','anaerobie_thermophile', '', '', '', 'true');
 INSERT INTO qgep.vl_sludge_treatment_stabilisation (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2994,'other','andere','autres', '', '', '', 'true');
 INSERT INTO qgep.vl_sludge_treatment_stabilisation (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3004,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_sludge_treatment ADD CONSTRAINT fkey_vl_sludge_treatment_stabilisation FOREIGN KEY (stabilisation)
 REFERENCES qgep.vl_sludge_treatment_stabilisation (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_waste_water_treatment_kind () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_waste_water_treatment_kind ADD CONSTRAINT pkey_qgep_vl_waste_water_treatment_kind PRIMARY KEY (code);
 INSERT INTO qgep.vl_waste_water_treatment_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3210,'other','andere','autres', '', '', '', 'true');
 INSERT INTO qgep.vl_waste_water_treatment_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (387,'biological','biologisch','biologique', '', '', '', 'true');
 INSERT INTO qgep.vl_waste_water_treatment_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (388,'chemical','chemisch','chimique', '', '', '', 'true');
 INSERT INTO qgep.vl_waste_water_treatment_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (389,'filtration','Filtration','filtration', '', '', '', 'true');
 INSERT INTO qgep.vl_waste_water_treatment_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (366,'mechanical','mechanisch','mecanique', '', '', '', 'true');
 INSERT INTO qgep.vl_waste_water_treatment_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3076,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_waste_water_treatment ADD CONSTRAINT fkey_vl_waste_water_treatment_kind FOREIGN KEY (kind)
 REFERENCES qgep.vl_waste_water_treatment_kind (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_water_catchment_kind () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_water_catchment_kind ADD CONSTRAINT pkey_qgep_vl_water_catchment_kind PRIMARY KEY (code);
 INSERT INTO qgep.vl_water_catchment_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (24,'process_water','Brauchwasser','eau_industrielle', '', '', '', 'true');
 INSERT INTO qgep.vl_water_catchment_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (25,'drinking_water','Trinkwasser','eau_potable', '', '', '', 'true');
 INSERT INTO qgep.vl_water_catchment_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3075,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_water_catchment ADD CONSTRAINT fkey_vl_water_catchment_kind FOREIGN KEY (kind)
 REFERENCES qgep.vl_water_catchment_kind (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_river_bed_control_grade_of_river () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_river_bed_control_grade_of_river ADD CONSTRAINT pkey_qgep_vl_river_bed_control_grade_of_river PRIMARY KEY (code);
 INSERT INTO qgep.vl_river_bed_control_grade_of_river (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (142,'none','keine','nul', '', '', '', 'true');
 INSERT INTO qgep.vl_river_bed_control_grade_of_river (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2607,'moderate','maessig','moyen', '', '', '', 'true');
 INSERT INTO qgep.vl_river_bed_control_grade_of_river (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2608,'heavily','stark','fort', '', '', '', 'true');
 INSERT INTO qgep.vl_river_bed_control_grade_of_river (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2609,'predominantly','ueberwiegend','preponderant', '', '', '', 'true');
 INSERT INTO qgep.vl_river_bed_control_grade_of_river (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3085,'unknown','unbekannt','inconnu', '', '', '', 'true');
 INSERT INTO qgep.vl_river_bed_control_grade_of_river (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2606,'sporadic','vereinzelt','localise', '', '', '', 'true');
 INSERT INTO qgep.vl_river_bed_control_grade_of_river (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2610,'complete','vollstaendig','total', '', '', '', 'true');
 ALTER TABLE qgep.od_river_bed ADD CONSTRAINT fkey_vl_river_bed_control_grade_of_river FOREIGN KEY (control_grade_of_river)
 REFERENCES qgep.vl_river_bed_control_grade_of_river (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_river_bed_kind () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_river_bed_kind ADD CONSTRAINT pkey_qgep_vl_river_bed_kind PRIMARY KEY (code);
 INSERT INTO qgep.vl_river_bed_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (290,'hard','hart','dur', '', '', '', 'true');
 INSERT INTO qgep.vl_river_bed_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3089,'unknown','unbekannt','inconnu', '', '', '', 'true');
 INSERT INTO qgep.vl_river_bed_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (289,'soft','weich','tendre', '', '', '', 'true');
 ALTER TABLE qgep.od_river_bed ADD CONSTRAINT fkey_vl_river_bed_kind FOREIGN KEY (kind)
 REFERENCES qgep.vl_river_bed_kind (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_river_bed_river_control_type () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_river_bed_river_control_type ADD CONSTRAINT pkey_qgep_vl_river_bed_river_control_type PRIMARY KEY (code);
 INSERT INTO qgep.vl_river_bed_river_control_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3481,'other_impermeable','andere_dicht','autres_impermeables', '', '', '', 'true');
 INSERT INTO qgep.vl_river_bed_river_control_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (338,'concrete_chequer_brick','Betongittersteine','briques_perforees_en_beton', '', '', '', 'true');
 INSERT INTO qgep.vl_river_bed_river_control_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3479,'wood','Holz','bois', '', '', '', 'true');
 INSERT INTO qgep.vl_river_bed_river_control_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3477,'no_control_structure','keine_Verbauung','aucun_amenagement', '', '', '', 'true');
 INSERT INTO qgep.vl_river_bed_river_control_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3478,'rock_fill_or_loose_boulders','Steinschuettung_Blockwurf','pierres_naturelles', '', '', '', 'true');
 INSERT INTO qgep.vl_river_bed_river_control_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3079,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_river_bed ADD CONSTRAINT fkey_vl_river_bed_river_control_type FOREIGN KEY (river_control_type)
 REFERENCES qgep.vl_river_bed_river_control_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_sector_water_body_kind () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_sector_water_body_kind ADD CONSTRAINT pkey_qgep_vl_sector_water_body_kind PRIMARY KEY (code);
 INSERT INTO qgep.vl_sector_water_body_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2657,'waterbody','Gewaesser','lac_ou_cours_d_eau', '', '', '', 'true');
 INSERT INTO qgep.vl_sector_water_body_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2729,'parallel_section','ParallelerAbschnitt','troncon_parallele', '', '', '', 'true');
 INSERT INTO qgep.vl_sector_water_body_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2728,'lake_traversal','Seetraverse','element_traversant_un_lac', '', '', '', 'true');
 INSERT INTO qgep.vl_sector_water_body_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2656,'shore','Ufer','rives', '', '', '', 'true');
 INSERT INTO qgep.vl_sector_water_body_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3054,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_sector_water_body ADD CONSTRAINT fkey_vl_sector_water_body_kind FOREIGN KEY (kind)
 REFERENCES qgep.vl_sector_water_body_kind (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_water_course_segment_algae_growth () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_water_course_segment_algae_growth ADD CONSTRAINT pkey_qgep_vl_water_course_segment_algae_growth PRIMARY KEY (code);
 INSERT INTO qgep.vl_water_course_segment_algae_growth (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2623,'none_or_marginal','kein_gering','absent_faible', '', '', '', 'true');
 INSERT INTO qgep.vl_water_course_segment_algae_growth (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2624,'moderate_to_strong','maessig_stark','moyen_fort', '', '', '', 'true');
 INSERT INTO qgep.vl_water_course_segment_algae_growth (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2625,'excessive_rampant','uebermaessig_wuchernd','tres_fort_proliferation', '', '', '', 'true');
 INSERT INTO qgep.vl_water_course_segment_algae_growth (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3050,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_water_course_segment ADD CONSTRAINT fkey_vl_water_course_segment_algae_growth FOREIGN KEY (algae_growth)
 REFERENCES qgep.vl_water_course_segment_algae_growth (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_water_course_segment_altitudinal_zone () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_water_course_segment_altitudinal_zone ADD CONSTRAINT pkey_qgep_vl_water_course_segment_altitudinal_zone PRIMARY KEY (code);
 INSERT INTO qgep.vl_water_course_segment_altitudinal_zone (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (320,'alpine','alpin','alpin', '', '', '', 'true');
 INSERT INTO qgep.vl_water_course_segment_altitudinal_zone (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (294,'foothill_zone','kollin','des_collines', '', '', '', 'true');
 INSERT INTO qgep.vl_water_course_segment_altitudinal_zone (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (295,'montane','montan','montagnard', '', '', '', 'true');
 INSERT INTO qgep.vl_water_course_segment_altitudinal_zone (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (319,'subalpine','subalpin','subalpin', '', '', '', 'true');
 INSERT INTO qgep.vl_water_course_segment_altitudinal_zone (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3020,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_water_course_segment ADD CONSTRAINT fkey_vl_water_course_segment_altitudinal_zone FOREIGN KEY (altitudinal_zone)
 REFERENCES qgep.vl_water_course_segment_altitudinal_zone (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_water_course_segment_dead_wood () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_water_course_segment_dead_wood ADD CONSTRAINT pkey_qgep_vl_water_course_segment_dead_wood PRIMARY KEY (code);
 INSERT INTO qgep.vl_water_course_segment_dead_wood (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2629,'accumulations','Ansammlungen','amas', '', '', '', 'true');
 INSERT INTO qgep.vl_water_course_segment_dead_wood (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2631,'none_or_sporadic','kein_vereinzelt','absent_localise', '', '', '', 'true');
 INSERT INTO qgep.vl_water_course_segment_dead_wood (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3052,'unknown','unbekannt','inconnu', '', '', '', 'true');
 INSERT INTO qgep.vl_water_course_segment_dead_wood (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2630,'scattered','zerstreut','dissemine', '', '', '', 'true');
 ALTER TABLE qgep.od_water_course_segment ADD CONSTRAINT fkey_vl_water_course_segment_dead_wood FOREIGN KEY (dead_wood)
 REFERENCES qgep.vl_water_course_segment_dead_wood (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_water_course_segment_depth_variability () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_water_course_segment_depth_variability ADD CONSTRAINT pkey_qgep_vl_water_course_segment_depth_variability PRIMARY KEY (code);
 INSERT INTO qgep.vl_water_course_segment_depth_variability (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2617,'pronounced','ausgepraegt','prononcee', '', '', '', 'true');
 INSERT INTO qgep.vl_water_course_segment_depth_variability (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2619,'none','keine','aucune', '', '', '', 'true');
 INSERT INTO qgep.vl_water_course_segment_depth_variability (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2618,'moderate','maessig','moyenne', '', '', '', 'true');
 INSERT INTO qgep.vl_water_course_segment_depth_variability (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3049,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_water_course_segment ADD CONSTRAINT fkey_vl_water_course_segment_depth_variability FOREIGN KEY (depth_variability)
 REFERENCES qgep.vl_water_course_segment_depth_variability (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_water_course_segment_discharge_regime () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_water_course_segment_discharge_regime ADD CONSTRAINT pkey_qgep_vl_water_course_segment_discharge_regime PRIMARY KEY (code);
 INSERT INTO qgep.vl_water_course_segment_discharge_regime (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (297,'compromised','beeintraechtigt','modifie', '', '', '', 'true');
 INSERT INTO qgep.vl_water_course_segment_discharge_regime (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (428,'artificial','kuenstlich','artificiel', '', '', '', 'true');
 INSERT INTO qgep.vl_water_course_segment_discharge_regime (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (427,'hardly_natural','naturfern','peu_naturel', '', '', '', 'true');
 INSERT INTO qgep.vl_water_course_segment_discharge_regime (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (296,'close_to_natural','naturnah','presque_naturel', '', '', '', 'true');
 INSERT INTO qgep.vl_water_course_segment_discharge_regime (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3091,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_water_course_segment ADD CONSTRAINT fkey_vl_water_course_segment_discharge_regime FOREIGN KEY (discharge_regime)
 REFERENCES qgep.vl_water_course_segment_discharge_regime (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_water_course_segment_ecom_classification () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_water_course_segment_ecom_classification ADD CONSTRAINT pkey_qgep_vl_water_course_segment_ecom_classification PRIMARY KEY (code);
 INSERT INTO qgep.vl_water_course_segment_ecom_classification (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3496,'covered','eingedolt','mis_sous_terre', '', '', '', 'true');
 INSERT INTO qgep.vl_water_course_segment_ecom_classification (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3495,'artificial','kuenstlich_naturfremd','artificiel_peu_naturel', '', '', '', 'true');
 INSERT INTO qgep.vl_water_course_segment_ecom_classification (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3492,'natural_or_seminatural','natuerlich_naturnah','naturel_presque_naturel', '', '', '', 'true');
 INSERT INTO qgep.vl_water_course_segment_ecom_classification (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3491,'not_classified','nicht_klassiert','pas_classifie', '', '', '', 'true');
 INSERT INTO qgep.vl_water_course_segment_ecom_classification (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3494,'heavily_compromised','stark_beeintraechtigt','fortement_modifie', '', '', '', 'true');
 INSERT INTO qgep.vl_water_course_segment_ecom_classification (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3493,'partially_compromised','wenig_beeintraechtigt','peu_modifie', '', '', '', 'true');
 ALTER TABLE qgep.od_water_course_segment ADD CONSTRAINT fkey_vl_water_course_segment_ecom_classification FOREIGN KEY (ecom_classification)
 REFERENCES qgep.vl_water_course_segment_ecom_classification (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_water_course_segment_kind () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_water_course_segment_kind ADD CONSTRAINT pkey_qgep_vl_water_course_segment_kind PRIMARY KEY (code);
 INSERT INTO qgep.vl_water_course_segment_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2710,'covered','eingedolt','mis_sous_terre', '', '', '', 'true');
 INSERT INTO qgep.vl_water_course_segment_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2709,'open','offen','ouvert', '', '', '', 'true');
 INSERT INTO qgep.vl_water_course_segment_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3058,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_water_course_segment ADD CONSTRAINT fkey_vl_water_course_segment_kind FOREIGN KEY (kind)
 REFERENCES qgep.vl_water_course_segment_kind (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_water_course_segment_length_profile () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_water_course_segment_length_profile ADD CONSTRAINT pkey_qgep_vl_water_course_segment_length_profile PRIMARY KEY (code);
 INSERT INTO qgep.vl_water_course_segment_length_profile (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (97,'downwelling','kaskadenartig','avec_des_cascades', '', '', '', 'true');
 INSERT INTO qgep.vl_water_course_segment_length_profile (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3602,'rapids_or_potholes','Schnellen_Kolke','avec_rapides_marmites', '', '', '', 'true');
 INSERT INTO qgep.vl_water_course_segment_length_profile (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (99,'continuous','stetig','continu', '', '', '', 'true');
 INSERT INTO qgep.vl_water_course_segment_length_profile (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3035,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_water_course_segment ADD CONSTRAINT fkey_vl_water_course_segment_length_profile FOREIGN KEY (length_profile)
 REFERENCES qgep.vl_water_course_segment_length_profile (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_water_course_segment_macrophyte_coverage () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_water_course_segment_macrophyte_coverage ADD CONSTRAINT pkey_qgep_vl_water_course_segment_macrophyte_coverage PRIMARY KEY (code);
 INSERT INTO qgep.vl_water_course_segment_macrophyte_coverage (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2626,'none_or_marginal','kein_gering','absent_faible', '', '', '', 'true');
 INSERT INTO qgep.vl_water_course_segment_macrophyte_coverage (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2627,'moderate_to_strong','maessig_stark','moyen_fort', '', '', '', 'true');
 INSERT INTO qgep.vl_water_course_segment_macrophyte_coverage (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2628,'excessive_rampant','uebermaessig_wuchernd','tres_fort_proliferation', '', '', '', 'true');
 INSERT INTO qgep.vl_water_course_segment_macrophyte_coverage (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3051,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_water_course_segment ADD CONSTRAINT fkey_vl_water_course_segment_macrophyte_coverage FOREIGN KEY (macrophyte_coverage)
 REFERENCES qgep.vl_water_course_segment_macrophyte_coverage (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_water_course_segment_section_morphology () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_water_course_segment_section_morphology ADD CONSTRAINT pkey_qgep_vl_water_course_segment_section_morphology PRIMARY KEY (code);
 INSERT INTO qgep.vl_water_course_segment_section_morphology (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4575,'straight','gerade','rectiligne', '', '', '', 'true');
 INSERT INTO qgep.vl_water_course_segment_section_morphology (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4580,'moderately_bent','leichtbogig','legerement_incurve', '', '', '', 'true');
 INSERT INTO qgep.vl_water_course_segment_section_morphology (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4579,'meandering','maeandrierend','en_meandres', '', '', '', 'true');
 INSERT INTO qgep.vl_water_course_segment_section_morphology (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4578,'heavily_bent','starkbogig','fortement_incurve', '', '', '', 'true');
 INSERT INTO qgep.vl_water_course_segment_section_morphology (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4576,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_water_course_segment ADD CONSTRAINT fkey_vl_water_course_segment_section_morphology FOREIGN KEY (section_morphology)
 REFERENCES qgep.vl_water_course_segment_section_morphology (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_water_course_segment_slope () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_water_course_segment_slope ADD CONSTRAINT pkey_qgep_vl_water_course_segment_slope PRIMARY KEY (code);
 INSERT INTO qgep.vl_water_course_segment_slope (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (291,'shallow_dipping','flach','plat', '', '', '', 'true');
 INSERT INTO qgep.vl_water_course_segment_slope (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (292,'moderate_slope','mittel','moyen', '', '', '', 'true');
 INSERT INTO qgep.vl_water_course_segment_slope (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (293,'steep','steil','raide', '', '', '', 'true');
 INSERT INTO qgep.vl_water_course_segment_slope (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3019,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_water_course_segment ADD CONSTRAINT fkey_vl_water_course_segment_slope FOREIGN KEY (slope)
 REFERENCES qgep.vl_water_course_segment_slope (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_water_course_segment_utilisation () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_water_course_segment_utilisation ADD CONSTRAINT pkey_qgep_vl_water_course_segment_utilisation PRIMARY KEY (code);
 INSERT INTO qgep.vl_water_course_segment_utilisation (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (384,'recreation','Erholung','detente', '', '', '', 'true');
 INSERT INTO qgep.vl_water_course_segment_utilisation (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (429,'fishing','Fischerei','peche', '', '', '', 'true');
 INSERT INTO qgep.vl_water_course_segment_utilisation (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (385,'dam','Stauanlage','installation_de_retenue', '', '', '', 'true');
 INSERT INTO qgep.vl_water_course_segment_utilisation (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3039,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_water_course_segment ADD CONSTRAINT fkey_vl_water_course_segment_utilisation FOREIGN KEY (utilisation)
 REFERENCES qgep.vl_water_course_segment_utilisation (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_water_course_segment_water_hardness () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_water_course_segment_water_hardness ADD CONSTRAINT pkey_qgep_vl_water_course_segment_water_hardness PRIMARY KEY (code);
 INSERT INTO qgep.vl_water_course_segment_water_hardness (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (321,'limestone','Kalk','calcaire', '', '', '', 'true');
 INSERT INTO qgep.vl_water_course_segment_water_hardness (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (322,'silicate','Silikat','silicieuse', '', '', '', 'true');
 INSERT INTO qgep.vl_water_course_segment_water_hardness (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3024,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_water_course_segment ADD CONSTRAINT fkey_vl_water_course_segment_water_hardness FOREIGN KEY (water_hardness)
 REFERENCES qgep.vl_water_course_segment_water_hardness (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_water_course_segment_width_variability () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_water_course_segment_width_variability ADD CONSTRAINT pkey_qgep_vl_water_course_segment_width_variability PRIMARY KEY (code);
 INSERT INTO qgep.vl_water_course_segment_width_variability (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (176,'pronounced','ausgepraegt','prononcee', '', '', '', 'true');
 INSERT INTO qgep.vl_water_course_segment_width_variability (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (177,'limited','eingeschraenkt','limitee', '', '', '', 'true');
 INSERT INTO qgep.vl_water_course_segment_width_variability (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (178,'none','keine','nulle', '', '', '', 'true');
 INSERT INTO qgep.vl_water_course_segment_width_variability (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3078,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_water_course_segment ADD CONSTRAINT fkey_vl_water_course_segment_width_variability FOREIGN KEY (width_variability)
 REFERENCES qgep.vl_water_course_segment_width_variability (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_river_bank_control_grade_of_river () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_river_bank_control_grade_of_river ADD CONSTRAINT pkey_qgep_vl_river_bank_control_grade_of_river PRIMARY KEY (code);
 INSERT INTO qgep.vl_river_bank_control_grade_of_river (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (341,'none','keine','nul', '', '', '', 'true');
 INSERT INTO qgep.vl_river_bank_control_grade_of_river (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2612,'moderate','maessig','moyen', '', '', '', 'true');
 INSERT INTO qgep.vl_river_bank_control_grade_of_river (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2613,'strong','stark','fort', '', '', '', 'true');
 INSERT INTO qgep.vl_river_bank_control_grade_of_river (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2614,'predominantly','ueberwiegend','preponderant', '', '', '', 'true');
 INSERT INTO qgep.vl_river_bank_control_grade_of_river (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3026,'unknown','unbekannt','inconnu', '', '', '', 'true');
 INSERT INTO qgep.vl_river_bank_control_grade_of_river (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2611,'sporadic','vereinzelt','localise', '', '', '', 'true');
 INSERT INTO qgep.vl_river_bank_control_grade_of_river (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2615,'complete','vollstaendig','total', '', '', '', 'true');
 ALTER TABLE qgep.od_river_bank ADD CONSTRAINT fkey_vl_river_bank_control_grade_of_river FOREIGN KEY (control_grade_of_river)
 REFERENCES qgep.vl_river_bank_control_grade_of_river (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_river_bank_river_control_type () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_river_bank_river_control_type ADD CONSTRAINT pkey_qgep_vl_river_bank_river_control_type PRIMARY KEY (code);
 INSERT INTO qgep.vl_river_bank_river_control_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3489,'other_impermeable','andere_dicht','autres_impermeables', '', '', '', 'true');
 INSERT INTO qgep.vl_river_bank_river_control_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3486,'concrete_chequer_brick_impermeable','Betongitterstein_dicht','brique_perforee_en_beton_impermeable', '', '', '', 'true');
 INSERT INTO qgep.vl_river_bank_river_control_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3485,'wood_permeable','Holz_durchlaessig','bois_permeable', '', '', '', 'true');
 INSERT INTO qgep.vl_river_bank_river_control_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3482,'no_control_structure','keine_Verbauung','aucun_amenagement', '', '', '', 'true');
 INSERT INTO qgep.vl_river_bank_river_control_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3483,'living_control_structure_permeable','Lebendverbau_durchlaessig','materiau_vegetal_permeable', '', '', '', 'true');
 INSERT INTO qgep.vl_river_bank_river_control_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3488,'wall_impermeable','Mauer_dicht','mur_impermeable', '', '', '', 'true');
 INSERT INTO qgep.vl_river_bank_river_control_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3487,'natural_stone_impermeable','Naturstein_dicht','pierre_naturelle_impermeable', '', '', '', 'true');
 INSERT INTO qgep.vl_river_bank_river_control_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3484,'loose_natural_stone_permeable','Naturstein_locker_durchlaessig','pierre_naturelle_lache', '', '', '', 'true');
 INSERT INTO qgep.vl_river_bank_river_control_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3080,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_river_bank ADD CONSTRAINT fkey_vl_river_bank_river_control_type FOREIGN KEY (river_control_type)
 REFERENCES qgep.vl_river_bank_river_control_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_river_bank_shores () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_river_bank_shores ADD CONSTRAINT pkey_qgep_vl_river_bank_shores PRIMARY KEY (code);
 INSERT INTO qgep.vl_river_bank_shores (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (404,'inappropriate_to_river','gewaesserfremd','atypique_d_un_cours_d_eau', '', '', '', 'true');
 INSERT INTO qgep.vl_river_bank_shores (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (403,'appropriate_to_river','gewaessergerecht','typique_d_un_cours_d_eau', '', '', '', 'true');
 INSERT INTO qgep.vl_river_bank_shores (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (405,'artificial','kuenstlich','artificielle', '', '', '', 'true');
 INSERT INTO qgep.vl_river_bank_shores (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3081,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_river_bank ADD CONSTRAINT fkey_vl_river_bank_shores FOREIGN KEY (shores)
 REFERENCES qgep.vl_river_bank_shores (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_river_bank_side () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_river_bank_side ADD CONSTRAINT pkey_qgep_vl_river_bank_side PRIMARY KEY (code);
 INSERT INTO qgep.vl_river_bank_side (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (420,'left','links','gauche', '', '', '', 'true');
 INSERT INTO qgep.vl_river_bank_side (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (421,'right','rechts','droite', '', '', '', 'true');
 INSERT INTO qgep.vl_river_bank_side (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3065,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_river_bank ADD CONSTRAINT fkey_vl_river_bank_side FOREIGN KEY (side)
 REFERENCES qgep.vl_river_bank_side (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_river_bank_utilisation_of_shore_surroundings () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_river_bank_utilisation_of_shore_surroundings ADD CONSTRAINT pkey_qgep_vl_river_bank_utilisation_of_shore_surroundings PRIMARY KEY (code);
 INSERT INTO qgep.vl_river_bank_utilisation_of_shore_surroundings (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (424,'developed_area','Bebauungen','constructions', '', '', '', 'true');
 INSERT INTO qgep.vl_river_bank_utilisation_of_shore_surroundings (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (425,'grassland','Gruenland','espaces_verts', '', '', '', 'true');
 INSERT INTO qgep.vl_river_bank_utilisation_of_shore_surroundings (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3068,'unknown','unbekannt','inconnu', '', '', '', 'true');
 INSERT INTO qgep.vl_river_bank_utilisation_of_shore_surroundings (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (426,'forest','Wald','foret', '', '', '', 'true');
 ALTER TABLE qgep.od_river_bank ADD CONSTRAINT fkey_vl_river_bank_utilisation_of_shore_surroundings FOREIGN KEY (utilisation_of_shore_surroundings)
 REFERENCES qgep.vl_river_bank_utilisation_of_shore_surroundings (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_river_bank_vegetation () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_river_bank_vegetation ADD CONSTRAINT pkey_qgep_vl_river_bank_vegetation PRIMARY KEY (code);
 INSERT INTO qgep.vl_river_bank_vegetation (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (325,'missing','fehlend','absente', '', '', '', 'true');
 INSERT INTO qgep.vl_river_bank_vegetation (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (323,'typical_for_habitat','standorttypisch','typique_du_lieu', '', '', '', 'true');
 INSERT INTO qgep.vl_river_bank_vegetation (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (324,'atypical_for_habitat','standortuntypisch','non_typique_du_lieu', '', '', '', 'true');
 INSERT INTO qgep.vl_river_bank_vegetation (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3025,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_river_bank ADD CONSTRAINT fkey_vl_river_bank_vegetation FOREIGN KEY (vegetation)
 REFERENCES qgep.vl_river_bank_vegetation (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_profile_geometry ADD COLUMN fk_pipe_profile varchar (16);
ALTER TABLE qgep.od_profile_geometry ADD CONSTRAINT rel_profile_geometry_pipe_profile FOREIGN KEY (fk_pipe_profile) REFERENCES qgep.od_pipe_profile(obj_id);
CREATE TABLE qgep.vl_reach_point_elevation_accuracy () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_reach_point_elevation_accuracy ADD CONSTRAINT pkey_qgep_vl_reach_point_elevation_accuracy PRIMARY KEY (code);
 INSERT INTO qgep.vl_reach_point_elevation_accuracy (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3248,'more_than_6cm','groesser_6cm','plusque_6cm', '', 'G06', 'S06', 'true');
 INSERT INTO qgep.vl_reach_point_elevation_accuracy (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3245,'plusminus_1cm','plusminus_1cm','plus_moins_1cm', '', 'P01', 'P01', 'true');
 INSERT INTO qgep.vl_reach_point_elevation_accuracy (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3246,'plusminus_3cm','plusminus_3cm','plus_moins_3cm', '', 'P03', 'P03', 'true');
 INSERT INTO qgep.vl_reach_point_elevation_accuracy (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3247,'plusminus_6cm','plusminus_6cm','plus_moins_6cm', '', 'P06', 'P06', 'true');
 INSERT INTO qgep.vl_reach_point_elevation_accuracy (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5376,'unknown','unbekannt','inconnue', '', 'U', 'I', 'true');
 ALTER TABLE qgep.od_reach_point ADD CONSTRAINT fkey_vl_reach_point_elevation_accuracy FOREIGN KEY (elevation_accuracy)
 REFERENCES qgep.vl_reach_point_elevation_accuracy (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_reach_point_outlet_shape () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_reach_point_outlet_shape ADD CONSTRAINT pkey_qgep_vl_reach_point_outlet_shape PRIMARY KEY (code);
 INSERT INTO qgep.vl_reach_point_outlet_shape (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5374,'round_edged','abgerundet','arrondie', 'RE', 'AR', 'AR', 'true');
 INSERT INTO qgep.vl_reach_point_outlet_shape (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (298,'orifice','blendenfoermig','en_forme_de_seuil_ou_diaphragme', 'O', 'BF', 'FSD', 'true');
 INSERT INTO qgep.vl_reach_point_outlet_shape (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3358,'no_cross_section_change','keine_Querschnittsaenderung','pas_de_changement_de_section', '', 'KQ', 'PCS', 'true');
 INSERT INTO qgep.vl_reach_point_outlet_shape (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (286,'sharp_edged','scharfkantig','aretes_vives', '', 'SK', 'AV', 'true');
 INSERT INTO qgep.vl_reach_point_outlet_shape (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5375,'unknown','unbekannt','inconnue', '', 'U', 'I', 'true');
 ALTER TABLE qgep.od_reach_point ADD CONSTRAINT fkey_vl_reach_point_outlet_shape FOREIGN KEY (outlet_shape)
 REFERENCES qgep.vl_reach_point_outlet_shape (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_reach_point ADD COLUMN fk_wastewater_networkelement varchar (16);
ALTER TABLE qgep.od_reach_point ADD CONSTRAINT rel_reach_point_wastewater_networkelement FOREIGN KEY (fk_wastewater_networkelement) REFERENCES qgep.od_wastewater_networkelement(obj_id);
CREATE TABLE qgep.vl_structure_part_renovation_demand () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_structure_part_renovation_demand ADD CONSTRAINT pkey_qgep_vl_structure_part_renovation_demand PRIMARY KEY (code);
 INSERT INTO qgep.vl_structure_part_renovation_demand (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (138,'not_necessary','nicht_notwendig','pas_necessaire', 'NN', 'NN', 'PN', 'true');
 INSERT INTO qgep.vl_structure_part_renovation_demand (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (137,'necessary','notwendig','necessaire', 'N', 'N', 'N', 'true');
 INSERT INTO qgep.vl_structure_part_renovation_demand (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5358,'unknown','unbekannt','inconnue', '', 'U', 'I', 'true');
 ALTER TABLE qgep.od_structure_part ADD CONSTRAINT fkey_vl_structure_part_renovation_demand FOREIGN KEY (renovation_demand)
 REFERENCES qgep.vl_structure_part_renovation_demand (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_structure_part ADD COLUMN fk_wastewater_structure varchar (16);
ALTER TABLE qgep.od_structure_part ADD CONSTRAINT rel_structure_part_wastewater_structure FOREIGN KEY (fk_wastewater_structure) REFERENCES qgep.od_wastewater_structure(obj_id);
CREATE TABLE qgep.vl_throttle_shut_off_unit_actuation () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_throttle_shut_off_unit_actuation ADD CONSTRAINT pkey_qgep_vl_throttle_shut_off_unit_actuation PRIMARY KEY (code);
 INSERT INTO qgep.vl_throttle_shut_off_unit_actuation (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3213,'other','andere','autres', '', '', '', 'true');
 INSERT INTO qgep.vl_throttle_shut_off_unit_actuation (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3154,'gaz_engine','Benzinmotor','moteur_a_essence', '', '', '', 'true');
 INSERT INTO qgep.vl_throttle_shut_off_unit_actuation (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3155,'diesel_engine','Dieselmotor','moteur_diesel', '', '', '', 'true');
 INSERT INTO qgep.vl_throttle_shut_off_unit_actuation (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3156,'electric_engine','Elektromotor','moteur_electrique', '', '', '', 'true');
 INSERT INTO qgep.vl_throttle_shut_off_unit_actuation (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3152,'hydraulic','hydraulisch','hydraulique', '', '', '', 'true');
 INSERT INTO qgep.vl_throttle_shut_off_unit_actuation (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3153,'none','keiner','aucun', '', '', '', 'true');
 INSERT INTO qgep.vl_throttle_shut_off_unit_actuation (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3157,'manual','manuell','manuel', '', '', '', 'true');
 INSERT INTO qgep.vl_throttle_shut_off_unit_actuation (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3158,'pneumatic','pneumatisch','pneumatique', '', '', '', 'true');
 INSERT INTO qgep.vl_throttle_shut_off_unit_actuation (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3151,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_throttle_shut_off_unit ADD CONSTRAINT fkey_vl_throttle_shut_off_unit_actuation FOREIGN KEY (actuation)
 REFERENCES qgep.vl_throttle_shut_off_unit_actuation (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_throttle_shut_off_unit_adjustability () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_throttle_shut_off_unit_adjustability ADD CONSTRAINT pkey_qgep_vl_throttle_shut_off_unit_adjustability PRIMARY KEY (code);
 INSERT INTO qgep.vl_throttle_shut_off_unit_adjustability (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3159,'fixed','fest','fixe', '', '', '', 'true');
 INSERT INTO qgep.vl_throttle_shut_off_unit_adjustability (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3161,'unknown','unbekannt','inconnu', '', '', '', 'true');
 INSERT INTO qgep.vl_throttle_shut_off_unit_adjustability (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3160,'adjustable','verstellbar','reglable', '', '', '', 'true');
 ALTER TABLE qgep.od_throttle_shut_off_unit ADD CONSTRAINT fkey_vl_throttle_shut_off_unit_adjustability FOREIGN KEY (adjustability)
 REFERENCES qgep.vl_throttle_shut_off_unit_adjustability (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_throttle_shut_off_unit_control () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_throttle_shut_off_unit_control ADD CONSTRAINT pkey_qgep_vl_throttle_shut_off_unit_control PRIMARY KEY (code);
 INSERT INTO qgep.vl_throttle_shut_off_unit_control (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3162,'closed_loop_control','geregelt','avec_regulation', '', '', '', 'true');
 INSERT INTO qgep.vl_throttle_shut_off_unit_control (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3163,'open_loop_control','gesteuert','avec_commande', '', '', '', 'true');
 INSERT INTO qgep.vl_throttle_shut_off_unit_control (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3165,'none','keine','aucun', '', '', '', 'true');
 INSERT INTO qgep.vl_throttle_shut_off_unit_control (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3164,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_throttle_shut_off_unit ADD CONSTRAINT fkey_vl_throttle_shut_off_unit_control FOREIGN KEY (control)
 REFERENCES qgep.vl_throttle_shut_off_unit_control (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_throttle_shut_off_unit_kind () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_throttle_shut_off_unit_kind ADD CONSTRAINT pkey_qgep_vl_throttle_shut_off_unit_kind PRIMARY KEY (code);
 INSERT INTO qgep.vl_throttle_shut_off_unit_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2973,'other','andere','autres', '', '', '', 'true');
 INSERT INTO qgep.vl_throttle_shut_off_unit_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2746,'orifice','Blende','diaphragme_ou_seuil', '', '', '', 'true');
 INSERT INTO qgep.vl_throttle_shut_off_unit_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2691,'stop_log','Dammbalken','batardeau', '', '', '', 'true');
 INSERT INTO qgep.vl_throttle_shut_off_unit_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (252,'throttle_flap','Drosselklappe','clapet_de_limitation', '', '', '', 'true');
 INSERT INTO qgep.vl_throttle_shut_off_unit_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (135,'throttle_valve','Drosselschieber','vanne_de_limitation', '', '', '', 'true');
 INSERT INTO qgep.vl_throttle_shut_off_unit_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6490,'throttle_section','Drosselstrecke','conduite_d_etranglement', '', '', '', 'true');
 INSERT INTO qgep.vl_throttle_shut_off_unit_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6491,'leapingweir','Leapingwehr','leaping_weir', '', '', '', 'true');
 INSERT INTO qgep.vl_throttle_shut_off_unit_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6492,'pomp','Pumpe','pompe', '', '', '', 'true');
 INSERT INTO qgep.vl_throttle_shut_off_unit_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2690,'backflow_flap','Rueckstauklappe','clapet_de_non_retour_a_battant', '', '', '', 'true');
 INSERT INTO qgep.vl_throttle_shut_off_unit_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2688,'valve','Schieber','vanne', '', '', '', 'true');
 INSERT INTO qgep.vl_throttle_shut_off_unit_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (134,'tube_throttle','Schlauchdrossel','limiteur_a_membrane', '', '', '', 'true');
 INSERT INTO qgep.vl_throttle_shut_off_unit_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2689,'sliding_valve','Schuetze','vanne_ecluse', '', '', '', 'true');
 INSERT INTO qgep.vl_throttle_shut_off_unit_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5755,'gate_shield','Stauschild','plaque_de_retenue', '', '', '', 'true');
 INSERT INTO qgep.vl_throttle_shut_off_unit_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3046,'unknown','unbekannt','inconnu', '', '', '', 'true');
 INSERT INTO qgep.vl_throttle_shut_off_unit_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (133,'whirl_throttle','Wirbeldrossel','limiteur_a_vortex', '', '', '', 'true');
 ALTER TABLE qgep.od_throttle_shut_off_unit ADD CONSTRAINT fkey_vl_throttle_shut_off_unit_kind FOREIGN KEY (kind)
 REFERENCES qgep.vl_throttle_shut_off_unit_kind (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_throttle_shut_off_unit_signal_transmission () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_throttle_shut_off_unit_signal_transmission ADD CONSTRAINT pkey_qgep_vl_throttle_shut_off_unit_signal_transmission PRIMARY KEY (code);
 INSERT INTO qgep.vl_throttle_shut_off_unit_signal_transmission (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3171,'receiving','empfangen','recevoir', '', '', '', 'true');
 INSERT INTO qgep.vl_throttle_shut_off_unit_signal_transmission (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3172,'sending','senden','emettre', '', '', '', 'true');
 INSERT INTO qgep.vl_throttle_shut_off_unit_signal_transmission (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3169,'sending_receiving','senden_empfangen','emettre_recevoir', '', '', '', 'true');
 INSERT INTO qgep.vl_throttle_shut_off_unit_signal_transmission (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3170,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_throttle_shut_off_unit ADD CONSTRAINT fkey_vl_throttle_shut_off_unit_signal_transmission FOREIGN KEY (signal_transmission)
 REFERENCES qgep.vl_throttle_shut_off_unit_signal_transmission (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_throttle_shut_off_unit ADD COLUMN fk_wastewater_node varchar (16);
ALTER TABLE qgep.od_throttle_shut_off_unit ADD CONSTRAINT rel_throttle_shut_off_unit_wastewater_node FOREIGN KEY (fk_wastewater_node) REFERENCES qgep.od_wastewater_node(obj_id);
CREATE TABLE qgep.vl_maintenance_event_kind () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_maintenance_event_kind ADD CONSTRAINT pkey_qgep_vl_maintenance_event_kind PRIMARY KEY (code);
 INSERT INTO qgep.vl_maintenance_event_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2982,'other','andere','autres', '', '', '', 'true');
 INSERT INTO qgep.vl_maintenance_event_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (120,'replacement','Erneuerung','renouvellement', '', '', '', 'true');
 INSERT INTO qgep.vl_maintenance_event_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (28,'cleaning','Reinigung','nettoyage', '', '', '', 'true');
 INSERT INTO qgep.vl_maintenance_event_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4529,'renovation','Renovierung','renovation', '', '', '', 'true');
 INSERT INTO qgep.vl_maintenance_event_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4528,'repair','Reparatur','reparation', '', '', '', 'true');
 INSERT INTO qgep.vl_maintenance_event_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4530,'restoration','Sanierung','rehabilitation', '', '', '', 'true');
 INSERT INTO qgep.vl_maintenance_event_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3045,'unknown','unbekannt','inconnu', '', '', '', 'true');
 INSERT INTO qgep.vl_maintenance_event_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4564,'inspection','Untersuchung','examen', '', '', '', 'true');
 ALTER TABLE qgep.od_maintenance_event ADD CONSTRAINT fkey_vl_maintenance_event_kind FOREIGN KEY (kind)
 REFERENCES qgep.vl_maintenance_event_kind (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_maintenance_event_status () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_maintenance_event_status ADD CONSTRAINT pkey_qgep_vl_maintenance_event_status PRIMARY KEY (code);
 INSERT INTO qgep.vl_maintenance_event_status (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2550,'accomplished','ausgefuehrt','execute', '', '', '', 'true');
 INSERT INTO qgep.vl_maintenance_event_status (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2549,'planned','geplant','prevu', '', '', '', 'true');
 INSERT INTO qgep.vl_maintenance_event_status (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3678,'not_possible','nicht_moeglich','impossible', '', '', '', 'true');
 INSERT INTO qgep.vl_maintenance_event_status (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3047,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_maintenance_event ADD CONSTRAINT fkey_vl_maintenance_event_status FOREIGN KEY (status)
 REFERENCES qgep.vl_maintenance_event_status (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_maintenance_event ADD COLUMN fk_wastewater_structure varchar (16);
ALTER TABLE qgep.od_maintenance_event ADD CONSTRAINT rel_maintenance_event_wastewater_structure FOREIGN KEY (fk_wastewater_structure) REFERENCES qgep.od_wastewater_structure(obj_id);
CREATE TABLE qgep.vl_pipe_profile_profile_type () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_pipe_profile_profile_type ADD CONSTRAINT pkey_qgep_vl_pipe_profile_profile_type PRIMARY KEY (code);
 INSERT INTO qgep.vl_pipe_profile_profile_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5377,'other','andere','autre', 'O', 'A', 'AU', 'true');
 INSERT INTO qgep.vl_pipe_profile_profile_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3351,'egg','Eiprofil','ovoide', 'E', 'E', 'OV', 'true');
 INSERT INTO qgep.vl_pipe_profile_profile_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3350,'circle','Kreisprofil','circulaire', '', 'K', 'CI', 'true');
 INSERT INTO qgep.vl_pipe_profile_profile_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3352,'mouth','Maulprofil','profil_en_voute', '', 'M', 'V', 'true');
 INSERT INTO qgep.vl_pipe_profile_profile_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3354,'open','offenes_Profil','profil_ouvert', '', 'OP', 'PO', 'true');
 INSERT INTO qgep.vl_pipe_profile_profile_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3353,'rectangular','Rechteckprofil','rectangulaire', '', 'R', 'R', 'true');
 INSERT INTO qgep.vl_pipe_profile_profile_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3355,'special','Spezialprofil','profil_special', '', 'S', 'PS', 'true');
 INSERT INTO qgep.vl_pipe_profile_profile_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3357,'unknown','unbekannt','inconnu', '', 'U', 'I', 'true');
 ALTER TABLE qgep.od_pipe_profile ADD CONSTRAINT fkey_vl_pipe_profile_profile_type FOREIGN KEY (profile_type)
 REFERENCES qgep.vl_pipe_profile_profile_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_retention_body_kind () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_retention_body_kind ADD CONSTRAINT pkey_qgep_vl_retention_body_kind PRIMARY KEY (code);
 INSERT INTO qgep.vl_retention_body_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2992,'other','andere','autres', '', '', '', 'true');
 INSERT INTO qgep.vl_retention_body_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (346,'retention_in_habitat','Biotop','retention_dans_bassins_et_depressions', '', '', '', 'true');
 INSERT INTO qgep.vl_retention_body_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (345,'roof_retention','Dachretention','retention_sur_toits', '', '', '', 'true');
 INSERT INTO qgep.vl_retention_body_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (348,'parking_lot','Parkplatz','retention_sur_routes_et_places', '', '', '', 'true');
 INSERT INTO qgep.vl_retention_body_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (347,'accumulation_channel','Staukanal','retention_dans_canalisations_stockage', '', '', '', 'true');
 INSERT INTO qgep.vl_retention_body_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3031,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_retention_body ADD CONSTRAINT fkey_vl_retention_body_kind FOREIGN KEY (kind)
 REFERENCES qgep.vl_retention_body_kind (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_retention_body ADD COLUMN fk_infiltration_installation varchar (16);
ALTER TABLE qgep.od_retention_body ADD CONSTRAINT rel_retention_body_infiltration_installation FOREIGN KEY (fk_infiltration_installation) REFERENCES qgep.od_infiltration_installation(obj_id);
ALTER TABLE qgep.od_wastewater_networkelement ADD COLUMN fk_wastewater_structure varchar (16);
ALTER TABLE qgep.od_wastewater_networkelement ADD CONSTRAINT rel_wastewater_networkelement_wastewater_structure FOREIGN KEY (fk_wastewater_structure) REFERENCES qgep.od_wastewater_structure(obj_id);
CREATE TABLE qgep.vl_overflow_actuation () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_overflow_actuation ADD CONSTRAINT pkey_qgep_vl_overflow_actuation PRIMARY KEY (code);
 INSERT INTO qgep.vl_overflow_actuation (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3667,'other','andere','autres', '', '', '', 'true');
 INSERT INTO qgep.vl_overflow_actuation (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (301,'gaz_engine','Benzinmotor','moteur_a_essence', '', '', '', 'true');
 INSERT INTO qgep.vl_overflow_actuation (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (302,'diesel_engine','Dieselmotor','moteur_diesel', '', '', '', 'true');
 INSERT INTO qgep.vl_overflow_actuation (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (303,'electric_engine','Elektromotor','moteur_electrique', '', '', '', 'true');
 INSERT INTO qgep.vl_overflow_actuation (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (433,'hydraulic','hydraulisch','hydraulique', '', '', '', 'true');
 INSERT INTO qgep.vl_overflow_actuation (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (300,'none','keiner','aucun', '', '', '', 'true');
 INSERT INTO qgep.vl_overflow_actuation (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (305,'manual','manuell','manuel', '', '', '', 'true');
 INSERT INTO qgep.vl_overflow_actuation (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (304,'pneumatic','pneumatisch','pneumatique', '', '', '', 'true');
 INSERT INTO qgep.vl_overflow_actuation (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3005,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_overflow ADD CONSTRAINT fkey_vl_overflow_actuation FOREIGN KEY (actuation)
 REFERENCES qgep.vl_overflow_actuation (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_overflow_adjustability () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_overflow_adjustability ADD CONSTRAINT pkey_qgep_vl_overflow_adjustability PRIMARY KEY (code);
 INSERT INTO qgep.vl_overflow_adjustability (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (355,'fixed','fest','fixe', '', '', '', 'true');
 INSERT INTO qgep.vl_overflow_adjustability (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3021,'unknown','unbekannt','inconnu', '', '', '', 'true');
 INSERT INTO qgep.vl_overflow_adjustability (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (356,'adjustable','verstellbar','reglable', '', '', '', 'true');
 ALTER TABLE qgep.od_overflow ADD CONSTRAINT fkey_vl_overflow_adjustability FOREIGN KEY (adjustability)
 REFERENCES qgep.vl_overflow_adjustability (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_overflow_control () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_overflow_control ADD CONSTRAINT pkey_qgep_vl_overflow_control PRIMARY KEY (code);
 INSERT INTO qgep.vl_overflow_control (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (308,'closed_loop_control','geregelt','avec_regulation', '', '', '', 'true');
 INSERT INTO qgep.vl_overflow_control (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (307,'open_loop_control','gesteuert','avec_commande', '', '', '', 'true');
 INSERT INTO qgep.vl_overflow_control (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (306,'none','keine','aucun', '', '', '', 'true');
 INSERT INTO qgep.vl_overflow_control (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3028,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_overflow ADD CONSTRAINT fkey_vl_overflow_control FOREIGN KEY (control)
 REFERENCES qgep.vl_overflow_control (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_overflow_function () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_overflow_function ADD CONSTRAINT pkey_qgep_vl_overflow_function PRIMARY KEY (code);
 INSERT INTO qgep.vl_overflow_function (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3228,'other','andere','autres', '', '', '', 'true');
 INSERT INTO qgep.vl_overflow_function (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3384,'internal','intern','interne', '', '', '', 'true');
 INSERT INTO qgep.vl_overflow_function (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (217,'emergency_overflow','Notentlastung','deversoir_de_secours', '', '', '', 'true');
 INSERT INTO qgep.vl_overflow_function (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5544,'stormwater_overflow','Regenueberlauf','deversoir_d_orage', '', '', '', 'true');
 INSERT INTO qgep.vl_overflow_function (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5546,'internal_overflow','Trennueberlauf','deversoir_interne', '', '', '', 'true');
 INSERT INTO qgep.vl_overflow_function (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3010,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_overflow ADD CONSTRAINT fkey_vl_overflow_function FOREIGN KEY (function)
 REFERENCES qgep.vl_overflow_function (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_overflow_signal_transmission () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_overflow_signal_transmission ADD CONSTRAINT pkey_qgep_vl_overflow_signal_transmission PRIMARY KEY (code);
 INSERT INTO qgep.vl_overflow_signal_transmission (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2694,'receiving','empfangen','recevoir', '', '', '', 'true');
 INSERT INTO qgep.vl_overflow_signal_transmission (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2693,'sending','senden','emettre', '', '', '', 'true');
 INSERT INTO qgep.vl_overflow_signal_transmission (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2695,'sending_receiving','senden_empfangen','emettre_recevoir', '', '', '', 'true');
 INSERT INTO qgep.vl_overflow_signal_transmission (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3056,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_overflow ADD CONSTRAINT fkey_vl_overflow_signal_transmission FOREIGN KEY (signal_transmission)
 REFERENCES qgep.vl_overflow_signal_transmission (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_overflow ADD COLUMN fk_wastewater_node varchar (16);
ALTER TABLE qgep.od_overflow ADD CONSTRAINT rel_overflow_wastewater_node FOREIGN KEY (fk_wastewater_node) REFERENCES qgep.od_wastewater_node(obj_id);
ALTER TABLE qgep.od_overflow ADD COLUMN fk_overflow_to varchar (16);
ALTER TABLE qgep.od_overflow ADD CONSTRAINT rel_overflow_overflow_to FOREIGN KEY (fk_overflow_to) REFERENCES qgep.od_wastewater_node(obj_id);
CREATE TABLE qgep.vl_mechanical_pretreatment_kind () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_mechanical_pretreatment_kind ADD CONSTRAINT pkey_qgep_vl_mechanical_pretreatment_kind PRIMARY KEY (code);
 INSERT INTO qgep.vl_mechanical_pretreatment_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3317,'filter_bag','Filtersack','percolateur', '', '', '', 'true');
 INSERT INTO qgep.vl_mechanical_pretreatment_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3319,'artificial_adsorber','KuenstlicherAdsorber','adsorbeur_artificiel', '', '', '', 'true');
 INSERT INTO qgep.vl_mechanical_pretreatment_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3318,'swale_french_drain_system','MuldenRigolenSystem','systeme_cuvettes_rigoles', '', '', '', 'true');
 INSERT INTO qgep.vl_mechanical_pretreatment_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3320,'slurry_collector','Schlammsammler','collecteur_de_boue', '', '', '', 'true');
 INSERT INTO qgep.vl_mechanical_pretreatment_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3321,'floating_matter_separator','Schwimmstoffabscheider','separateur_materiaux_flottants', '', '', '', 'true');
 INSERT INTO qgep.vl_mechanical_pretreatment_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3322,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_mechanical_pretreatment ADD CONSTRAINT fkey_vl_mechanical_pretreatment_kind FOREIGN KEY (kind)
 REFERENCES qgep.vl_mechanical_pretreatment_kind (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_mechanical_pretreatment ADD COLUMN fk_infiltration_installation varchar (16);
ALTER TABLE qgep.od_mechanical_pretreatment ADD CONSTRAINT rel_mechanical_pretreatment_infiltration_installation FOREIGN KEY (fk_infiltration_installation) REFERENCES qgep.od_infiltration_installation(obj_id);
ALTER TABLE qgep.od_mechanical_pretreatment ADD COLUMN fk_wastewater_structure varchar (16);
ALTER TABLE qgep.od_mechanical_pretreatment ADD CONSTRAINT rel_mechanical_pretreatment_wastewater_structure FOREIGN KEY (fk_wastewater_structure) REFERENCES qgep.od_wastewater_structure(obj_id);
CREATE TABLE qgep.vl_wastewater_structure_accessibility () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_wastewater_structure_accessibility ADD CONSTRAINT pkey_qgep_vl_wastewater_structure_accessibility PRIMARY KEY (code);
 INSERT INTO qgep.vl_wastewater_structure_accessibility (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3444,'covered','ueberdeckt','couvert', '', 'UED', 'CO', 'true');
 INSERT INTO qgep.vl_wastewater_structure_accessibility (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3447,'unknown','unbekannt','inconnu', '', 'U', 'I', 'true');
 INSERT INTO qgep.vl_wastewater_structure_accessibility (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3446,'inaccessible','unzugaenglich','inaccessible', '', 'UZG', 'NA', 'true');
 INSERT INTO qgep.vl_wastewater_structure_accessibility (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3445,'accessible','zugaenglich','accessible', '', 'ZG', 'A', 'true');
 ALTER TABLE qgep.od_wastewater_structure ADD CONSTRAINT fkey_vl_wastewater_structure_accessibility FOREIGN KEY (accessibility)
 REFERENCES qgep.vl_wastewater_structure_accessibility (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_wastewater_structure_financing () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_wastewater_structure_financing ADD CONSTRAINT pkey_qgep_vl_wastewater_structure_financing PRIMARY KEY (code);
 INSERT INTO qgep.vl_wastewater_structure_financing (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5510,'public','oeffentlich','public', 'PU', 'OE', 'PU', 'true');
 INSERT INTO qgep.vl_wastewater_structure_financing (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5511,'private','privat','prive', 'PR', 'PR', 'PR', 'true');
 INSERT INTO qgep.vl_wastewater_structure_financing (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5512,'unknown','unbekannt','inconnu', 'U', 'U', 'I', 'true');
 ALTER TABLE qgep.od_wastewater_structure ADD CONSTRAINT fkey_vl_wastewater_structure_financing FOREIGN KEY (financing)
 REFERENCES qgep.vl_wastewater_structure_financing (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_wastewater_structure_renovation_necessity () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_wastewater_structure_renovation_necessity ADD CONSTRAINT pkey_qgep_vl_wastewater_structure_renovation_necessity PRIMARY KEY (code);
 INSERT INTO qgep.vl_wastewater_structure_renovation_necessity (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5370,'urgent','dringend','urgente', 'UR', 'DR', 'UR', 'true');
 INSERT INTO qgep.vl_wastewater_structure_renovation_necessity (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5368,'none','keiner','aucune', 'N', 'K', 'AN', 'true');
 INSERT INTO qgep.vl_wastewater_structure_renovation_necessity (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2,'short_term','kurzfristig','a_court_terme', 'ST', 'KF', 'CT', 'true');
 INSERT INTO qgep.vl_wastewater_structure_renovation_necessity (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4,'long_term','langfristig','a_long_terme', 'LT', 'LF', 'LT', 'true');
 INSERT INTO qgep.vl_wastewater_structure_renovation_necessity (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3,'medium_term','mittelfristig','a_moyen_terme', '', 'MF', 'MT', 'true');
 INSERT INTO qgep.vl_wastewater_structure_renovation_necessity (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5369,'unknown','unbekannt','inconnue', '', 'U', 'I', 'true');
 ALTER TABLE qgep.od_wastewater_structure ADD CONSTRAINT fkey_vl_wastewater_structure_renovation_necessity FOREIGN KEY (renovation_necessity)
 REFERENCES qgep.vl_wastewater_structure_renovation_necessity (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_wastewater_structure_rv_construction_type () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_wastewater_structure_rv_construction_type ADD CONSTRAINT pkey_qgep_vl_wastewater_structure_rv_construction_type PRIMARY KEY (code);
 INSERT INTO qgep.vl_wastewater_structure_rv_construction_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4602,'other','andere','autre', '', '', '', 'true');
 INSERT INTO qgep.vl_wastewater_structure_rv_construction_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4603,'field','Feld','dans_les_champs', 'FI', 'FE', 'FE', 'true');
 INSERT INTO qgep.vl_wastewater_structure_rv_construction_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4606,'renovation_conduction_excavator','Sanierungsleitung_Bagger','conduite_d_assainissement_retro', 'RCE', 'SBA', 'CAR', 'true');
 INSERT INTO qgep.vl_wastewater_structure_rv_construction_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4605,'renovation_conduction_ditch_cutter','Sanierungsleitung_Grabenfraese','conduite_d_assainissement_trancheuse', 'RCD', 'SGF', 'CAT', 'true');
 INSERT INTO qgep.vl_wastewater_structure_rv_construction_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4604,'road','Strasse','sous_route', 'ST', 'ST', 'ST', 'true');
 INSERT INTO qgep.vl_wastewater_structure_rv_construction_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4601,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_wastewater_structure ADD CONSTRAINT fkey_vl_wastewater_structure_rv_construction_type FOREIGN KEY (rv_construction_type)
 REFERENCES qgep.vl_wastewater_structure_rv_construction_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_wastewater_structure_status () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_wastewater_structure_status ADD CONSTRAINT pkey_qgep_vl_wastewater_structure_status PRIMARY KEY (code);
 INSERT INTO qgep.vl_wastewater_structure_status (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3633,'inoperative','ausser_Betrieb','hors_service', 'NO', 'AB', 'H', 'true');
 INSERT INTO qgep.vl_wastewater_structure_status (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6528,'operational.operational','in_Betrieb.in_Betrieb','en_service.en_service', '', 'I', 'E', 'true');
 INSERT INTO qgep.vl_wastewater_structure_status (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6530,'operational.tentative','in_Betrieb.provisorisch','en_service.provisoire', 'T', 'T', 'P', 'true');
 INSERT INTO qgep.vl_wastewater_structure_status (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6533,'operational.will_be_suspended','in_Betrieb.wird_aufgehoben','en_service.sera_supprime', '', 'WA', 'SS', 'true');
 INSERT INTO qgep.vl_wastewater_structure_status (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6523,'abanndoned.suspended_not_filled','tot.aufgehoben_nicht_verfuellt','abandonne.supprime_non_demoli', 'SN', 'AN', 'S', 'true');
 INSERT INTO qgep.vl_wastewater_structure_status (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6524,'abanndoned.suspended_unknown','tot.aufgehoben_unbekannt','abandonne.supprime_inconnu', 'SU', 'AU', 'AI', 'true');
 INSERT INTO qgep.vl_wastewater_structure_status (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6532,'abanndoned.filled','tot.verfuellt','abandonne.demoli', '', 'V', 'D', 'true');
 INSERT INTO qgep.vl_wastewater_structure_status (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3027,'unknown','unbekannt','inconnu', '', 'U', 'I', 'true');
 INSERT INTO qgep.vl_wastewater_structure_status (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6526,'other.calculation_alternative','weitere.Berechnungsvariante','autre.variante_de_calcul', 'CA', 'B', 'C', 'true');
 INSERT INTO qgep.vl_wastewater_structure_status (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6527,'other.planned','weitere.geplant','autre.prevu', '', 'G', 'PL', 'true');
 INSERT INTO qgep.vl_wastewater_structure_status (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6529,'other.project','weitere.Projekt','autre.projet', '', 'N', 'PR', 'true');
 ALTER TABLE qgep.od_wastewater_structure ADD CONSTRAINT fkey_vl_wastewater_structure_status FOREIGN KEY (status)
 REFERENCES qgep.vl_wastewater_structure_status (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_wastewater_structure_structure_condition () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_wastewater_structure_structure_condition ADD CONSTRAINT pkey_qgep_vl_wastewater_structure_structure_condition PRIMARY KEY (code);
 INSERT INTO qgep.vl_wastewater_structure_structure_condition (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3037,'unknown','unbekannt','inconnu', '', 'U', 'I', 'true');
 INSERT INTO qgep.vl_wastewater_structure_structure_condition (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3363,'Z0','Z0','Z0', '', 'Z0', 'Z0', 'true');
 INSERT INTO qgep.vl_wastewater_structure_structure_condition (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3359,'Z1','Z1','Z1', '', 'Z1', 'Z1', 'true');
 INSERT INTO qgep.vl_wastewater_structure_structure_condition (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3360,'Z2','Z2','Z2', '', 'Z2', 'Z2', 'true');
 INSERT INTO qgep.vl_wastewater_structure_structure_condition (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3361,'Z3','Z3','Z3', '', 'Z3', 'Z3', 'true');
 INSERT INTO qgep.vl_wastewater_structure_structure_condition (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3362,'Z4','Z4','Z4', '', 'Z4', 'Z4', 'true');
 ALTER TABLE qgep.od_wastewater_structure ADD CONSTRAINT fkey_vl_wastewater_structure_structure_condition FOREIGN KEY (structure_condition)
 REFERENCES qgep.vl_wastewater_structure_structure_condition (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_wastewater_structure ADD COLUMN fk_owner varchar (16);
ALTER TABLE qgep.od_wastewater_structure ADD CONSTRAINT rel_wastewater_structure_owner FOREIGN KEY (fk_owner) REFERENCES qgep.od_organisation(obj_id);
ALTER TABLE qgep.od_wastewater_structure ADD COLUMN fk_operator varchar (16);
ALTER TABLE qgep.od_wastewater_structure ADD CONSTRAINT rel_wastewater_structure_operator FOREIGN KEY (fk_operator) REFERENCES qgep.od_organisation(obj_id);
CREATE TABLE qgep.vl_hydraulic_characteristic_data_is_overflowing () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_hydraulic_characteristic_data_is_overflowing ADD CONSTRAINT pkey_qgep_vl_hydraulic_characteristic_data_is_overflowing PRIMARY KEY (code);
 INSERT INTO qgep.vl_hydraulic_characteristic_data_is_overflowing (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5774,'yes','ja','oui', '', '', '', 'true');
 INSERT INTO qgep.vl_hydraulic_characteristic_data_is_overflowing (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5775,'no','nein','non', '', '', '', 'true');
 INSERT INTO qgep.vl_hydraulic_characteristic_data_is_overflowing (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5778,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_hydraulic_characteristic_data ADD CONSTRAINT fkey_vl_hydraulic_characteristic_data_is_overflowing FOREIGN KEY (is_overflowing)
 REFERENCES qgep.vl_hydraulic_characteristic_data_is_overflowing (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_hydraulic_characteristic_data_main_weir_kind () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_hydraulic_characteristic_data_main_weir_kind ADD CONSTRAINT pkey_qgep_vl_hydraulic_characteristic_data_main_weir_kind PRIMARY KEY (code);
 INSERT INTO qgep.vl_hydraulic_characteristic_data_main_weir_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6422,'leapingweir','Leapingwehr','LEAPING_WEIR', '', '', '', 'true');
 INSERT INTO qgep.vl_hydraulic_characteristic_data_main_weir_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6420,'spillway_raised','Streichwehr_hochgezogen','deversoir_lateral_a_seuil_sureleve', '', '', '', 'true');
 INSERT INTO qgep.vl_hydraulic_characteristic_data_main_weir_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6421,'spillway_low','Streichwehr_niedrig','deversoir_lateral_a_seuil_abaisse', '', '', '', 'true');
 ALTER TABLE qgep.od_hydraulic_characteristic_data ADD CONSTRAINT fkey_vl_hydraulic_characteristic_data_main_weir_kind FOREIGN KEY (main_weir_kind)
 REFERENCES qgep.vl_hydraulic_characteristic_data_main_weir_kind (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_hydraulic_characteristic_data_pump_characteristics () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_hydraulic_characteristic_data_pump_characteristics ADD CONSTRAINT pkey_qgep_vl_hydraulic_characteristic_data_pump_characteristics PRIMARY KEY (code);
 INSERT INTO qgep.vl_hydraulic_characteristic_data_pump_characteristics (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6374,'alternating','alternierend','alterne', '', '', '', 'true');
 INSERT INTO qgep.vl_hydraulic_characteristic_data_pump_characteristics (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6375,'other','andere','autres', '', '', '', 'true');
 INSERT INTO qgep.vl_hydraulic_characteristic_data_pump_characteristics (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6376,'single','einzeln','individuel', '', '', '', 'true');
 INSERT INTO qgep.vl_hydraulic_characteristic_data_pump_characteristics (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6377,'parallel','parallel','parallele', '', '', '', 'true');
 INSERT INTO qgep.vl_hydraulic_characteristic_data_pump_characteristics (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6378,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_hydraulic_characteristic_data ADD CONSTRAINT fkey_vl_hydraulic_characteristic_data_pump_characteristics FOREIGN KEY (pump_characteristics)
 REFERENCES qgep.vl_hydraulic_characteristic_data_pump_characteristics (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_hydraulic_characteristic_data_pump_usage_current () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_hydraulic_characteristic_data_pump_usage_current ADD CONSTRAINT pkey_qgep_vl_hydraulic_characteristic_data_pump_usage_current PRIMARY KEY (code);
 INSERT INTO qgep.vl_hydraulic_characteristic_data_pump_usage_current (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6361,'other','andere','autres', '', '', '', 'true');
 INSERT INTO qgep.vl_hydraulic_characteristic_data_pump_usage_current (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6362,'creek_water','Bachwasser','eaux_cours_d_eau', '', '', '', 'true');
 INSERT INTO qgep.vl_hydraulic_characteristic_data_pump_usage_current (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6363,'discharged_combined_wastewater','entlastetes_Mischabwasser','eaux_mixtes_deversees', '', '', '', 'true');
 INSERT INTO qgep.vl_hydraulic_characteristic_data_pump_usage_current (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6364,'industrial_wastewater','Industrieabwasser','eaux_industrielles', '', 'CW', 'EUC', 'true');
 INSERT INTO qgep.vl_hydraulic_characteristic_data_pump_usage_current (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6365,'combined_wastewater','Mischabwasser','eaux_mixtes', '', 'MW', 'EUM', 'true');
 INSERT INTO qgep.vl_hydraulic_characteristic_data_pump_usage_current (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6366,'rain_wastewater','Regenabwasser','eaux_pluviales', '', 'RW', 'EUP', 'true');
 INSERT INTO qgep.vl_hydraulic_characteristic_data_pump_usage_current (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6367,'clean_wastewater','Reinabwasser','eaux_claires', '', 'KW', 'EUR', 'true');
 INSERT INTO qgep.vl_hydraulic_characteristic_data_pump_usage_current (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6368,'wastewater','Schmutzabwasser','eaux_usees', '', 'SW', 'EU', 'true');
 INSERT INTO qgep.vl_hydraulic_characteristic_data_pump_usage_current (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6369,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_hydraulic_characteristic_data ADD CONSTRAINT fkey_vl_hydraulic_characteristic_data_pump_usage_current FOREIGN KEY (pump_usage_current)
 REFERENCES qgep.vl_hydraulic_characteristic_data_pump_usage_current (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_hydraulic_characteristic_data_status () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_hydraulic_characteristic_data_status ADD CONSTRAINT pkey_qgep_vl_hydraulic_characteristic_data_status PRIMARY KEY (code);
 INSERT INTO qgep.vl_hydraulic_characteristic_data_status (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6371,'planned','geplant','prevu', '', '', '', 'true');
 INSERT INTO qgep.vl_hydraulic_characteristic_data_status (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6372,'current','Ist','actuel', '', '', '', 'true');
 INSERT INTO qgep.vl_hydraulic_characteristic_data_status (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6373,'current_optimized','Ist_optimiert','actuel_opt', '', '', '', 'true');
 ALTER TABLE qgep.od_hydraulic_characteristic_data ADD CONSTRAINT fkey_vl_hydraulic_characteristic_data_status FOREIGN KEY (status)
 REFERENCES qgep.vl_hydraulic_characteristic_data_status (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_hydraulic_characteristic_data ADD COLUMN fk_wastewater_node varchar (16);
ALTER TABLE qgep.od_hydraulic_characteristic_data ADD CONSTRAINT rel_hydraulic_characteristic_data_wastewater_node FOREIGN KEY (fk_wastewater_node) REFERENCES qgep.od_wastewater_node(obj_id);
CREATE TABLE qgep.vl_overflow_characteristic_kind_overflow_characteristic () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_overflow_characteristic_kind_overflow_characteristic ADD CONSTRAINT pkey_qgep_vl_overflow_characteristic_kind_overflow_characteristic PRIMARY KEY (code);
 INSERT INTO qgep.vl_overflow_characteristic_kind_overflow_characteristic (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6220,'hq','HQ','HQ', '', '', '', 'true');
 INSERT INTO qgep.vl_overflow_characteristic_kind_overflow_characteristic (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6221,'qq','QQ','QQ', '', '', '', 'true');
 INSERT INTO qgep.vl_overflow_characteristic_kind_overflow_characteristic (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6228,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_overflow_characteristic ADD CONSTRAINT fkey_vl_overflow_characteristic_kind_overflow_characteristic FOREIGN KEY (kind_overflow_characteristic)
 REFERENCES qgep.vl_overflow_characteristic_kind_overflow_characteristic (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_overflow_characteristic_overflow_characteristic_digital () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_overflow_characteristic_overflow_characteristic_digital ADD CONSTRAINT pkey_qgep_vl_overflow_characteristic_overflow_characteristic_digital PRIMARY KEY (code);
 INSERT INTO qgep.vl_overflow_characteristic_overflow_characteristic_digital (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6223,'yes','ja','oui', '', '', '', 'true');
 INSERT INTO qgep.vl_overflow_characteristic_overflow_characteristic_digital (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6224,'no','nein','non', '', '', '', 'true');
 INSERT INTO qgep.vl_overflow_characteristic_overflow_characteristic_digital (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6225,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_overflow_characteristic ADD CONSTRAINT fkey_vl_overflow_characteristic_overflow_characteristic_digital FOREIGN KEY (overflow_characteristic_digital)
 REFERENCES qgep.vl_overflow_characteristic_overflow_characteristic_digital (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_connection_object ADD COLUMN fk_wastewater_networkelement varchar (16);
ALTER TABLE qgep.od_connection_object ADD CONSTRAINT rel_connection_object_wastewater_networkelement FOREIGN KEY (fk_wastewater_networkelement) REFERENCES qgep.od_wastewater_networkelement(obj_id);
ALTER TABLE qgep.od_connection_object ADD COLUMN fk_owner varchar (16);
ALTER TABLE qgep.od_connection_object ADD CONSTRAINT rel_connection_object_owner FOREIGN KEY (fk_owner) REFERENCES qgep.od_organisation(obj_id);
ALTER TABLE qgep.od_connection_object ADD COLUMN fk_operator varchar (16);
ALTER TABLE qgep.od_connection_object ADD CONSTRAINT rel_connection_object_operator FOREIGN KEY (fk_operator) REFERENCES qgep.od_organisation(obj_id);
ALTER TABLE qgep.od_hazard_source ADD COLUMN fk_owner varchar (16);
ALTER TABLE qgep.od_hazard_source ADD CONSTRAINT rel_hazard_source_owner FOREIGN KEY (fk_owner) REFERENCES qgep.od_organisation(obj_id);
CREATE TABLE qgep.vl_catchment_area_direct_discharge_current () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_catchment_area_direct_discharge_current ADD CONSTRAINT pkey_qgep_vl_catchment_area_direct_discharge_current PRIMARY KEY (code);
 INSERT INTO qgep.vl_catchment_area_direct_discharge_current (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5457,'yes','ja','oui', '', '', '', 'true');
 INSERT INTO qgep.vl_catchment_area_direct_discharge_current (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5458,'no','nein','non', '', '', '', 'true');
 INSERT INTO qgep.vl_catchment_area_direct_discharge_current (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5463,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_catchment_area ADD CONSTRAINT fkey_vl_catchment_area_direct_discharge_current FOREIGN KEY (direct_discharge_current)
 REFERENCES qgep.vl_catchment_area_direct_discharge_current (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_catchment_area_direct_discharge_planned () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_catchment_area_direct_discharge_planned ADD CONSTRAINT pkey_qgep_vl_catchment_area_direct_discharge_planned PRIMARY KEY (code);
 INSERT INTO qgep.vl_catchment_area_direct_discharge_planned (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5459,'yes','ja','oui', '', '', '', 'true');
 INSERT INTO qgep.vl_catchment_area_direct_discharge_planned (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5460,'no','nein','non', '', '', '', 'true');
 INSERT INTO qgep.vl_catchment_area_direct_discharge_planned (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5464,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_catchment_area ADD CONSTRAINT fkey_vl_catchment_area_direct_discharge_planned FOREIGN KEY (direct_discharge_planned)
 REFERENCES qgep.vl_catchment_area_direct_discharge_planned (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_catchment_area_drainage_system_current () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_catchment_area_drainage_system_current ADD CONSTRAINT pkey_qgep_vl_catchment_area_drainage_system_current PRIMARY KEY (code);
 INSERT INTO qgep.vl_catchment_area_drainage_system_current (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5186,'mixed_system','Mischsystem','systeme_unitaire', '', '', '', 'true');
 INSERT INTO qgep.vl_catchment_area_drainage_system_current (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5188,'modified_system','ModifiziertesSystem','systeme_modifie', '', '', '', 'true');
 INSERT INTO qgep.vl_catchment_area_drainage_system_current (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5185,'not_connected','nicht_angeschlossen','non_raccorde', '', '', '', 'true');
 INSERT INTO qgep.vl_catchment_area_drainage_system_current (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5537,'not_drained','nicht_entwaessert','non_evacue', '', '', '', 'true');
 INSERT INTO qgep.vl_catchment_area_drainage_system_current (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5392,'rain_wastewater_system','Regenabwassersystem','systeme_eaux_pluviales', '', '', '', 'true');
 INSERT INTO qgep.vl_catchment_area_drainage_system_current (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5187,'separated_system','Trennsystem','systeme_separatif', '', '', '', 'true');
 INSERT INTO qgep.vl_catchment_area_drainage_system_current (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5189,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_catchment_area ADD CONSTRAINT fkey_vl_catchment_area_drainage_system_current FOREIGN KEY (drainage_system_current)
 REFERENCES qgep.vl_catchment_area_drainage_system_current (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_catchment_area_drainage_system_planned () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_catchment_area_drainage_system_planned ADD CONSTRAINT pkey_qgep_vl_catchment_area_drainage_system_planned PRIMARY KEY (code);
 INSERT INTO qgep.vl_catchment_area_drainage_system_planned (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5191,'mixed_system','Mischsystem','systeme_unitaire', '', '', '', 'true');
 INSERT INTO qgep.vl_catchment_area_drainage_system_planned (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5193,'modified_system','ModifiziertesSystem','systeme_modifie', '', '', '', 'true');
 INSERT INTO qgep.vl_catchment_area_drainage_system_planned (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5194,'not_connected','nicht_angeschlossen','non_raccorde', '', '', '', 'true');
 INSERT INTO qgep.vl_catchment_area_drainage_system_planned (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5536,'not_drained','nicht_entwaessert','non_evacue', '', '', '', 'true');
 INSERT INTO qgep.vl_catchment_area_drainage_system_planned (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5192,'separated_system','Trennsystem','systeme_separatif', '', '', '', 'true');
 INSERT INTO qgep.vl_catchment_area_drainage_system_planned (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5195,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_catchment_area ADD CONSTRAINT fkey_vl_catchment_area_drainage_system_planned FOREIGN KEY (drainage_system_planned)
 REFERENCES qgep.vl_catchment_area_drainage_system_planned (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_catchment_area_infiltration_current () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_catchment_area_infiltration_current ADD CONSTRAINT pkey_qgep_vl_catchment_area_infiltration_current PRIMARY KEY (code);
 INSERT INTO qgep.vl_catchment_area_infiltration_current (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5452,'yes','ja','oui', '', '', '', 'true');
 INSERT INTO qgep.vl_catchment_area_infiltration_current (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5453,'no','nein','non', '', '', '', 'true');
 INSERT INTO qgep.vl_catchment_area_infiltration_current (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5165,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_catchment_area ADD CONSTRAINT fkey_vl_catchment_area_infiltration_current FOREIGN KEY (infiltration_current)
 REFERENCES qgep.vl_catchment_area_infiltration_current (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_catchment_area_infiltration_planned () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_catchment_area_infiltration_planned ADD CONSTRAINT pkey_qgep_vl_catchment_area_infiltration_planned PRIMARY KEY (code);
 INSERT INTO qgep.vl_catchment_area_infiltration_planned (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5461,'yes','ja','oui', '', '', '', 'true');
 INSERT INTO qgep.vl_catchment_area_infiltration_planned (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5462,'no','nein','non', '', '', '', 'true');
 INSERT INTO qgep.vl_catchment_area_infiltration_planned (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5170,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_catchment_area ADD CONSTRAINT fkey_vl_catchment_area_infiltration_planned FOREIGN KEY (infiltration_planned)
 REFERENCES qgep.vl_catchment_area_infiltration_planned (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_catchment_area_retention_current () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_catchment_area_retention_current ADD CONSTRAINT pkey_qgep_vl_catchment_area_retention_current PRIMARY KEY (code);
 INSERT INTO qgep.vl_catchment_area_retention_current (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5467,'yes','ja','oui', '', '', '', 'true');
 INSERT INTO qgep.vl_catchment_area_retention_current (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5468,'no','nein','non', '', '', '', 'true');
 INSERT INTO qgep.vl_catchment_area_retention_current (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5469,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_catchment_area ADD CONSTRAINT fkey_vl_catchment_area_retention_current FOREIGN KEY (retention_current)
 REFERENCES qgep.vl_catchment_area_retention_current (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_catchment_area_retention_planned () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_catchment_area_retention_planned ADD CONSTRAINT pkey_qgep_vl_catchment_area_retention_planned PRIMARY KEY (code);
 INSERT INTO qgep.vl_catchment_area_retention_planned (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5470,'yes','ja','oui', '', '', '', 'true');
 INSERT INTO qgep.vl_catchment_area_retention_planned (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5471,'no','nein','non', '', '', '', 'true');
 INSERT INTO qgep.vl_catchment_area_retention_planned (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5472,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_catchment_area ADD CONSTRAINT fkey_vl_catchment_area_retention_planned FOREIGN KEY (retention_planned)
 REFERENCES qgep.vl_catchment_area_retention_planned (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_catchment_area ADD COLUMN fk_wastewater_networkelement_rw_current varchar (16);
ALTER TABLE qgep.od_catchment_area ADD CONSTRAINT rel_catchment_area_wastewater_networkelement_rw_current FOREIGN KEY (fk_wastewater_networkelement_rw_current) REFERENCES qgep.od_wastewater_networkelement(obj_id);
ALTER TABLE qgep.od_catchment_area ADD COLUMN fk_wastewater_networkelement_rw_planned varchar (16);
ALTER TABLE qgep.od_catchment_area ADD CONSTRAINT rel_catchment_area_wastewater_networkelement_rw_planned FOREIGN KEY (fk_wastewater_networkelement_rw_planned) REFERENCES qgep.od_wastewater_networkelement(obj_id);
ALTER TABLE qgep.od_catchment_area ADD COLUMN fk_wastewater_networkelement_ww_planned varchar (16);
ALTER TABLE qgep.od_catchment_area ADD CONSTRAINT rel_catchment_area_wastewater_networkelement_ww_planned FOREIGN KEY (fk_wastewater_networkelement_ww_planned) REFERENCES qgep.od_wastewater_networkelement(obj_id);
ALTER TABLE qgep.od_catchment_area ADD COLUMN fk_wastewater_networkelement_ww_current varchar (16);
ALTER TABLE qgep.od_catchment_area ADD CONSTRAINT rel_catchment_area_wastewater_networkelement_ww_current FOREIGN KEY (fk_wastewater_networkelement_ww_current) REFERENCES qgep.od_wastewater_networkelement(obj_id);
CREATE TABLE qgep.vl_measuring_device_kind () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_measuring_device_kind ADD CONSTRAINT pkey_qgep_vl_measuring_device_kind PRIMARY KEY (code);
 INSERT INTO qgep.vl_measuring_device_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5702,'other','andere','autres', '', '', '', 'true');
 INSERT INTO qgep.vl_measuring_device_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5703,'static_sounding_stick','Drucksonde','sonde_de_pression', '', '', '', 'true');
 INSERT INTO qgep.vl_measuring_device_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5704,'bubbler_system','Lufteinperlung','injection_bulles_d_air', '', '', '', 'true');
 INSERT INTO qgep.vl_measuring_device_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5705,'EMF_partly_filled','MID_teilgefuellt','MID_partiellement_rempli', '', '', '', 'true');
 INSERT INTO qgep.vl_measuring_device_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5706,'EMF_filled','MID_vollgefuellt','MID_rempli', '', '', '', 'true');
 INSERT INTO qgep.vl_measuring_device_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5707,'radar','Radar','radar', '', '', '', 'true');
 INSERT INTO qgep.vl_measuring_device_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5708,'float','Schwimmer','flotteur', '', '', '', 'true');
 INSERT INTO qgep.vl_measuring_device_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6322,'ultrasound','Ultraschall','ultrason', '', '', '', 'true');
 INSERT INTO qgep.vl_measuring_device_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5709,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_measuring_device ADD CONSTRAINT fkey_vl_measuring_device_kind FOREIGN KEY (kind)
 REFERENCES qgep.vl_measuring_device_kind (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_measurement_series_kind () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_measurement_series_kind ADD CONSTRAINT pkey_qgep_vl_measurement_series_kind PRIMARY KEY (code);
 INSERT INTO qgep.vl_measurement_series_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3217,'other','andere','autres', '', '', '', 'true');
 INSERT INTO qgep.vl_measurement_series_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2646,'continuous','kontinuierlich','continu', '', '', '', 'true');
 INSERT INTO qgep.vl_measurement_series_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2647,'rain_weather','Regenwetter','temps_de_pluie', '', '', '', 'true');
 INSERT INTO qgep.vl_measurement_series_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3053,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_measurement_series ADD CONSTRAINT fkey_vl_measurement_series_kind FOREIGN KEY (kind)
 REFERENCES qgep.vl_measurement_series_kind (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_measurement_result_measurement_type () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_measurement_result_measurement_type ADD CONSTRAINT pkey_qgep_vl_measurement_result_measurement_type PRIMARY KEY (code);
 INSERT INTO qgep.vl_measurement_result_measurement_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5732,'other','andere','autres', '', '', '', 'true');
 INSERT INTO qgep.vl_measurement_result_measurement_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5733,'flow','Durchfluss','debit', '', '', '', 'true');
 INSERT INTO qgep.vl_measurement_result_measurement_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5734,'level','Niveau','niveau', '', '', '', 'true');
 INSERT INTO qgep.vl_measurement_result_measurement_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5735,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_measurement_result ADD CONSTRAINT fkey_vl_measurement_result_measurement_type FOREIGN KEY (measurement_type)
 REFERENCES qgep.vl_measurement_result_measurement_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_measuring_point_damming_device () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_measuring_point_damming_device ADD CONSTRAINT pkey_qgep_vl_measuring_point_damming_device PRIMARY KEY (code);
 INSERT INTO qgep.vl_measuring_point_damming_device (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5720,'other','andere','autres', '', '', '', 'true');
 INSERT INTO qgep.vl_measuring_point_damming_device (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5721,'none','keiner','aucun', '', '', '', 'true');
 INSERT INTO qgep.vl_measuring_point_damming_device (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5722,'overflow_weir','Ueberfallwehr','lame_deversante', '', '', '', 'true');
 INSERT INTO qgep.vl_measuring_point_damming_device (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5724,'unknown','unbekannt','inconnu', '', '', '', 'true');
 INSERT INTO qgep.vl_measuring_point_damming_device (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5723,'venturi_necking','Venturieinschnuerung','etranglement_venturi', '', '', '', 'true');
 ALTER TABLE qgep.od_measuring_point ADD CONSTRAINT fkey_vl_measuring_point_damming_device FOREIGN KEY (damming_device)
 REFERENCES qgep.vl_measuring_point_damming_device (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_measuring_point_purpose () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_measuring_point_purpose ADD CONSTRAINT pkey_qgep_vl_measuring_point_purpose PRIMARY KEY (code);
 INSERT INTO qgep.vl_measuring_point_purpose (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4595,'both','beides','les_deux', '', '', '', 'true');
 INSERT INTO qgep.vl_measuring_point_purpose (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4593,'cost_sharing','Kostenverteilung','repartition_des_couts', '', '', '', 'true');
 INSERT INTO qgep.vl_measuring_point_purpose (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4594,'technical_purpose','technischer_Zweck','but_technique', '', '', '', 'true');
 INSERT INTO qgep.vl_measuring_point_purpose (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4592,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_measuring_point ADD CONSTRAINT fkey_vl_measuring_point_purpose FOREIGN KEY (purpose)
 REFERENCES qgep.vl_measuring_point_purpose (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_measuring_point ADD COLUMN fk_operator varchar (16);
ALTER TABLE qgep.od_measuring_point ADD CONSTRAINT rel_measuring_point_operator FOREIGN KEY (fk_operator) REFERENCES qgep.od_organisation(obj_id);
ALTER TABLE qgep.od_measuring_point ADD COLUMN fk_wastewater_structure varchar (16);
ALTER TABLE qgep.od_measuring_point ADD CONSTRAINT rel_measuring_point_wastewater_structure FOREIGN KEY (fk_wastewater_structure) REFERENCES qgep.od_wastewater_structure(obj_id);
ALTER TABLE qgep.od_planning_zone ADD CONSTRAINT oorel_od_planning_zone_zone FOREIGN KEY (obj_id) REFERENCES qgep.od_zone(obj_id);
CREATE TABLE qgep.vl_planning_zone_kind () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_planning_zone_kind ADD CONSTRAINT pkey_qgep_vl_planning_zone_kind PRIMARY KEY (code);
 INSERT INTO qgep.vl_planning_zone_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2990,'other','andere','autres', '', '', '', 'true');
 INSERT INTO qgep.vl_planning_zone_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (31,'commercial_zone','Gewerbezone','zone_artisanale', '', '', '', 'true');
 INSERT INTO qgep.vl_planning_zone_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (32,'industrial_zone','Industriezone','zone_industrielle', '', '', '', 'true');
 INSERT INTO qgep.vl_planning_zone_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (30,'agricultural_zone','Landwirtschaftszone','zone_agricole', '', '', '', 'true');
 INSERT INTO qgep.vl_planning_zone_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3077,'unknown','unbekannt','inconnu', '', '', '', 'true');
 INSERT INTO qgep.vl_planning_zone_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (29,'residential_zone','Wohnzone','zone_d_habitations', '', '', '', 'true');
 ALTER TABLE qgep.od_planning_zone ADD CONSTRAINT fkey_vl_planning_zone_kind FOREIGN KEY (kind)
 REFERENCES qgep.vl_planning_zone_kind (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_groundwater_protection_zone ADD CONSTRAINT oorel_od_groundwater_protection_zone_zone FOREIGN KEY (obj_id) REFERENCES qgep.od_zone(obj_id);
CREATE TABLE qgep.vl_groundwater_protection_zone_kind () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_groundwater_protection_zone_kind ADD CONSTRAINT pkey_qgep_vl_groundwater_protection_zone_kind PRIMARY KEY (code);
 INSERT INTO qgep.vl_groundwater_protection_zone_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (440,'S1','S1','S1', '', '', '', 'true');
 INSERT INTO qgep.vl_groundwater_protection_zone_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (441,'S2','S2','S2', '', '', '', 'true');
 INSERT INTO qgep.vl_groundwater_protection_zone_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (442,'S3','S3','S3', '', '', '', 'true');
 INSERT INTO qgep.vl_groundwater_protection_zone_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3040,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_groundwater_protection_zone ADD CONSTRAINT fkey_vl_groundwater_protection_zone_kind FOREIGN KEY (kind)
 REFERENCES qgep.vl_groundwater_protection_zone_kind (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_ground_water_protection_perimeter ADD CONSTRAINT oorel_od_ground_water_protection_perimeter_zone FOREIGN KEY (obj_id) REFERENCES qgep.od_zone(obj_id);
ALTER TABLE qgep.od_water_body_protection_sector ADD CONSTRAINT oorel_od_water_body_protection_sector_zone FOREIGN KEY (obj_id) REFERENCES qgep.od_zone(obj_id);
CREATE TABLE qgep.vl_water_body_protection_sector_kind () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_water_body_protection_sector_kind ADD CONSTRAINT pkey_qgep_vl_water_body_protection_sector_kind PRIMARY KEY (code);
 INSERT INTO qgep.vl_water_body_protection_sector_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (430,'A','A','A', '', '', '', 'true');
 INSERT INTO qgep.vl_water_body_protection_sector_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3652,'Ao','Ao','Ao', '', '', '', 'true');
 INSERT INTO qgep.vl_water_body_protection_sector_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3649,'Au','Au','Au', '', '', '', 'true');
 INSERT INTO qgep.vl_water_body_protection_sector_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (431,'B','B','B', '', '', '', 'true');
 INSERT INTO qgep.vl_water_body_protection_sector_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (432,'C','C','C', '', '', '', 'true');
 INSERT INTO qgep.vl_water_body_protection_sector_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3069,'unknown','unbekannt','inconnu', '', '', '', 'true');
 INSERT INTO qgep.vl_water_body_protection_sector_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3651,'Zo','Zo','Zo', '', '', '', 'true');
 INSERT INTO qgep.vl_water_body_protection_sector_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3650,'Zu','Zu','Zu', '', '', '', 'true');
 ALTER TABLE qgep.od_water_body_protection_sector ADD CONSTRAINT fkey_vl_water_body_protection_sector_kind FOREIGN KEY (kind)
 REFERENCES qgep.vl_water_body_protection_sector_kind (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_drainage_system ADD CONSTRAINT oorel_od_drainage_system_zone FOREIGN KEY (obj_id) REFERENCES qgep.od_zone(obj_id);
CREATE TABLE qgep.vl_drainage_system_kind () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_drainage_system_kind ADD CONSTRAINT pkey_qgep_vl_drainage_system_kind PRIMARY KEY (code);
 INSERT INTO qgep.vl_drainage_system_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4783,'amelioration','Melioration','melioration', '', '', '', 'true');
 INSERT INTO qgep.vl_drainage_system_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2722,'mixed_system','Mischsystem','systeme_unitaire', '', '', '', 'true');
 INSERT INTO qgep.vl_drainage_system_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2724,'modified_system','ModifiziertesSystem','systeme_modifie', '', '', '', 'true');
 INSERT INTO qgep.vl_drainage_system_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4544,'not_connected','nicht_angeschlossen','non_raccorde', '', '', '', 'true');
 INSERT INTO qgep.vl_drainage_system_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2723,'separated_system','Trennsystem','systeme_separatif', '', '', '', 'true');
 INSERT INTO qgep.vl_drainage_system_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3060,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_drainage_system ADD CONSTRAINT fkey_vl_drainage_system_kind FOREIGN KEY (kind)
 REFERENCES qgep.vl_drainage_system_kind (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_infiltration_zone ADD CONSTRAINT oorel_od_infiltration_zone_zone FOREIGN KEY (obj_id) REFERENCES qgep.od_zone(obj_id);
CREATE TABLE qgep.vl_infiltration_zone_infiltration_capacity () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_infiltration_zone_infiltration_capacity ADD CONSTRAINT pkey_qgep_vl_infiltration_zone_infiltration_capacity PRIMARY KEY (code);
 INSERT INTO qgep.vl_infiltration_zone_infiltration_capacity (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (371,'good','gut','bonnes', '', '', '', 'true');
 INSERT INTO qgep.vl_infiltration_zone_infiltration_capacity (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (374,'none','keine','aucune', '', '', '', 'true');
 INSERT INTO qgep.vl_infiltration_zone_infiltration_capacity (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (372,'moderate','maessig','moyennes', '', '', '', 'true');
 INSERT INTO qgep.vl_infiltration_zone_infiltration_capacity (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (373,'bad','schlecht','mauvaises', '', '', '', 'true');
 INSERT INTO qgep.vl_infiltration_zone_infiltration_capacity (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3073,'unknown','unbekannt','inconnu', '', '', '', 'true');
 INSERT INTO qgep.vl_infiltration_zone_infiltration_capacity (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2996,'not_allowed','unzulaessig','non_admis', '', '', '', 'true');
 ALTER TABLE qgep.od_infiltration_zone ADD CONSTRAINT fkey_vl_infiltration_zone_infiltration_capacity FOREIGN KEY (infiltration_capacity)
 REFERENCES qgep.vl_infiltration_zone_infiltration_capacity (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_cover ADD CONSTRAINT oorel_od_cover_structure_part FOREIGN KEY (obj_id) REFERENCES qgep.od_structure_part(obj_id);
CREATE TABLE qgep.vl_cover_cover_shape () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_cover_cover_shape ADD CONSTRAINT pkey_qgep_vl_cover_cover_shape PRIMARY KEY (code);
 INSERT INTO qgep.vl_cover_cover_shape (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5353,'other','andere','autre', 'O', 'A', 'AU', 'true');
 INSERT INTO qgep.vl_cover_cover_shape (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3499,'rectangular','eckig','anguleux', 'R', 'E', 'AX', 'true');
 INSERT INTO qgep.vl_cover_cover_shape (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3498,'round','rund','rond', '', 'R', 'R', 'true');
 INSERT INTO qgep.vl_cover_cover_shape (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5354,'unknown','unbekannt','inconnue', '', 'U', 'I', 'true');
 ALTER TABLE qgep.od_cover ADD CONSTRAINT fkey_vl_cover_cover_shape FOREIGN KEY (cover_shape)
 REFERENCES qgep.vl_cover_cover_shape (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_cover_fastening () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_cover_fastening ADD CONSTRAINT pkey_qgep_vl_cover_fastening PRIMARY KEY (code);
 INSERT INTO qgep.vl_cover_fastening (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5350,'not_bolted','nicht_verschraubt','non_vissee', '', 'NVS', 'NVS', 'true');
 INSERT INTO qgep.vl_cover_fastening (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5351,'unknown','unbekannt','inconnue', '', 'U', 'I', 'true');
 INSERT INTO qgep.vl_cover_fastening (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5352,'bolted','verschraubt','vissee', '', 'VS', 'VS', 'true');
 ALTER TABLE qgep.od_cover ADD CONSTRAINT fkey_vl_cover_fastening FOREIGN KEY (fastening)
 REFERENCES qgep.vl_cover_fastening (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_cover_material () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_cover_material ADD CONSTRAINT pkey_qgep_vl_cover_material PRIMARY KEY (code);
 INSERT INTO qgep.vl_cover_material (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5355,'other','andere','autre', 'O', 'A', 'AU', 'true');
 INSERT INTO qgep.vl_cover_material (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (234,'concrete','Beton','beton', 'C', 'B', 'B', 'true');
 INSERT INTO qgep.vl_cover_material (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (233,'cast_iron','Guss','fonte', '', 'G', 'F', 'true');
 INSERT INTO qgep.vl_cover_material (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5547,'cast_iron_with_pavement_filling','Guss_mit_Belagsfuellung','fonte_avec_remplissage_en_robe', 'CIP', 'GBL', 'FRE', 'true');
 INSERT INTO qgep.vl_cover_material (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (235,'cast_iron_with_concrete_filling','Guss_mit_Betonfuellung','fonte_avec_remplissage_en_beton', '', 'GBT', 'FRB', 'true');
 INSERT INTO qgep.vl_cover_material (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3015,'unknown','unbekannt','inconnu', '', 'U', 'I', 'true');
 ALTER TABLE qgep.od_cover ADD CONSTRAINT fkey_vl_cover_material FOREIGN KEY (material)
 REFERENCES qgep.vl_cover_material (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_cover_positional_accuracy () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_cover_positional_accuracy ADD CONSTRAINT pkey_qgep_vl_cover_positional_accuracy PRIMARY KEY (code);
 INSERT INTO qgep.vl_cover_positional_accuracy (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3243,'more_than_50cm','groesser_50cm','plusque_50cm', '', 'G50', 'S50', 'true');
 INSERT INTO qgep.vl_cover_positional_accuracy (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3241,'plusminus_10cm','plusminus_10cm','plus_moins_10cm', '', 'P10', 'P10', 'true');
 INSERT INTO qgep.vl_cover_positional_accuracy (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3236,'plusminus_3cm','plusminus_3cm','plus_moins_3cm', '', 'P03', 'P03', 'true');
 INSERT INTO qgep.vl_cover_positional_accuracy (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3242,'plusminus_50cm','plusminus_50cm','plus_moins_50cm', '', 'P50', 'P50', 'true');
 INSERT INTO qgep.vl_cover_positional_accuracy (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5349,'unknown','unbekannt','inconnue', '', 'U', 'I', 'true');
 ALTER TABLE qgep.od_cover ADD CONSTRAINT fkey_vl_cover_positional_accuracy FOREIGN KEY (positional_accuracy)
 REFERENCES qgep.vl_cover_positional_accuracy (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_cover_sludge_bucket () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_cover_sludge_bucket ADD CONSTRAINT pkey_qgep_vl_cover_sludge_bucket PRIMARY KEY (code);
 INSERT INTO qgep.vl_cover_sludge_bucket (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (423,'inexistent','nicht_vorhanden','inexistant', '', 'NV', 'IE', 'true');
 INSERT INTO qgep.vl_cover_sludge_bucket (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3066,'unknown','unbekannt','inconnu', '', 'U', 'I', 'true');
 INSERT INTO qgep.vl_cover_sludge_bucket (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (422,'existent','vorhanden','existant', '', 'V', 'E', 'true');
 ALTER TABLE qgep.od_cover ADD CONSTRAINT fkey_vl_cover_sludge_bucket FOREIGN KEY (sludge_bucket)
 REFERENCES qgep.vl_cover_sludge_bucket (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_cover_venting () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_cover_venting ADD CONSTRAINT pkey_qgep_vl_cover_venting PRIMARY KEY (code);
 INSERT INTO qgep.vl_cover_venting (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (229,'vented','entlueftet','aere', '', 'EL', 'AE', 'true');
 INSERT INTO qgep.vl_cover_venting (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (230,'not_vented','nicht_entlueftet','non_aere', '', 'NEL', 'NAE', 'true');
 INSERT INTO qgep.vl_cover_venting (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5348,'unknown','unbekannt','inconnue', '', 'U', 'I', 'true');
 ALTER TABLE qgep.od_cover ADD CONSTRAINT fkey_vl_cover_venting FOREIGN KEY (venting)
 REFERENCES qgep.vl_cover_venting (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_access_aid ADD CONSTRAINT oorel_od_access_aid_structure_part FOREIGN KEY (obj_id) REFERENCES qgep.od_structure_part(obj_id);
CREATE TABLE qgep.vl_access_aid_kind () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_access_aid_kind ADD CONSTRAINT pkey_qgep_vl_access_aid_kind PRIMARY KEY (code);
 INSERT INTO qgep.vl_access_aid_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5357,'other','andere','autre', 'O', 'A', 'AU', 'true');
 INSERT INTO qgep.vl_access_aid_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (243,'pressurized_door','Drucktuere','porte_etanche', 'PD', 'D', 'PE', 'true');
 INSERT INTO qgep.vl_access_aid_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (92,'none','keine','aucun_equipement_d_acces', '', 'K', 'AN', 'true');
 INSERT INTO qgep.vl_access_aid_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (240,'ladder','Leiter','echelle', '', 'L', 'EC', 'true');
 INSERT INTO qgep.vl_access_aid_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (241,'step_iron','Steigeisen','echelons', '', 'S', 'ECO', 'true');
 INSERT INTO qgep.vl_access_aid_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3473,'staircase','Treppe','escalier', '', 'R', 'ES', 'true');
 INSERT INTO qgep.vl_access_aid_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (91,'footstep_niches','Trittnischen','marchepieds', '', 'N', 'N', 'true');
 INSERT INTO qgep.vl_access_aid_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3230,'door','Tuere','porte', '', 'T', 'P', 'true');
 INSERT INTO qgep.vl_access_aid_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3048,'unknown','unbekannt','inconnu', '', 'U', 'I', 'true');
 ALTER TABLE qgep.od_access_aid ADD CONSTRAINT fkey_vl_access_aid_kind FOREIGN KEY (kind)
 REFERENCES qgep.vl_access_aid_kind (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_electric_equipment ADD CONSTRAINT oorel_od_electric_equipment_structure_part FOREIGN KEY (obj_id) REFERENCES qgep.od_structure_part(obj_id);
CREATE TABLE qgep.vl_electric_equipment_kind () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_electric_equipment_kind ADD CONSTRAINT pkey_qgep_vl_electric_equipment_kind PRIMARY KEY (code);
 INSERT INTO qgep.vl_electric_equipment_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2980,'other','andere','autres', '', '', '', 'true');
 INSERT INTO qgep.vl_electric_equipment_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (376,'illumination','Beleuchtung','eclairage', '', '', '', 'true');
 INSERT INTO qgep.vl_electric_equipment_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3255,'remote_control_system','Fernwirkanlage','installation_de_telecommande', '', '', '', 'true');
 INSERT INTO qgep.vl_electric_equipment_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (378,'radio_unit','Funk','radio', '', '', '', 'true');
 INSERT INTO qgep.vl_electric_equipment_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (377,'phone','Telephon','telephone', '', '', '', 'true');
 INSERT INTO qgep.vl_electric_equipment_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3038,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_electric_equipment ADD CONSTRAINT fkey_vl_electric_equipment_kind FOREIGN KEY (kind)
 REFERENCES qgep.vl_electric_equipment_kind (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_dryweather_flume ADD CONSTRAINT oorel_od_dryweather_flume_structure_part FOREIGN KEY (obj_id) REFERENCES qgep.od_structure_part(obj_id);
CREATE TABLE qgep.vl_dryweather_flume_material () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_dryweather_flume_material ADD CONSTRAINT pkey_qgep_vl_dryweather_flume_material PRIMARY KEY (code);
 INSERT INTO qgep.vl_dryweather_flume_material (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3221,'other','andere','autres', 'O', 'A', 'AU', 'true');
 INSERT INTO qgep.vl_dryweather_flume_material (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (354,'combined','kombiniert','combine', '', 'KOM', 'COM', 'true');
 INSERT INTO qgep.vl_dryweather_flume_material (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5356,'plastic','Kunststoff','matiere_synthetique', '', 'KU', 'MS', 'true');
 INSERT INTO qgep.vl_dryweather_flume_material (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (238,'stoneware','Steinzeug','gres', '', 'STZ', 'GR', 'true');
 INSERT INTO qgep.vl_dryweather_flume_material (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3017,'unknown','unbekannt','inconnu', '', 'U', 'I', 'true');
 INSERT INTO qgep.vl_dryweather_flume_material (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (237,'cement_mortar','Zementmoertel','mortier_de_ciment', '', 'ZM', 'MC', 'true');
 ALTER TABLE qgep.od_dryweather_flume ADD CONSTRAINT fkey_vl_dryweather_flume_material FOREIGN KEY (material)
 REFERENCES qgep.vl_dryweather_flume_material (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_electromechanical_equipment ADD CONSTRAINT oorel_od_electromechanical_equipment_structure_part FOREIGN KEY (obj_id) REFERENCES qgep.od_structure_part(obj_id);
CREATE TABLE qgep.vl_electromechanical_equipment_kind () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_electromechanical_equipment_kind ADD CONSTRAINT pkey_qgep_vl_electromechanical_equipment_kind PRIMARY KEY (code);
 INSERT INTO qgep.vl_electromechanical_equipment_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2981,'other','andere','autres', '', '', '', 'true');
 INSERT INTO qgep.vl_electromechanical_equipment_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (380,'leakage_water_pump','Leckwasserpumpe','pompe_d_epuisement', '', '', '', 'true');
 INSERT INTO qgep.vl_electromechanical_equipment_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (337,'air_dehumidifier','Luftentfeuchter','deshumidificateur', '', '', '', 'true');
 INSERT INTO qgep.vl_electromechanical_equipment_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (381,'scraper_installation','Raeumeinrichtung','dispositif_de_curage', '', '', '', 'true');
 INSERT INTO qgep.vl_electromechanical_equipment_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3072,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_electromechanical_equipment ADD CONSTRAINT fkey_vl_electromechanical_equipment_kind FOREIGN KEY (kind)
 REFERENCES qgep.vl_electromechanical_equipment_kind (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_dryweather_downspout ADD CONSTRAINT oorel_od_dryweather_downspout_structure_part FOREIGN KEY (obj_id) REFERENCES qgep.od_structure_part(obj_id);
ALTER TABLE qgep.od_benching ADD CONSTRAINT oorel_od_benching_structure_part FOREIGN KEY (obj_id) REFERENCES qgep.od_structure_part(obj_id);
CREATE TABLE qgep.vl_benching_kind () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_benching_kind ADD CONSTRAINT pkey_qgep_vl_benching_kind PRIMARY KEY (code);
 INSERT INTO qgep.vl_benching_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5319,'other','andere','autre', '', '', '', 'true');
 INSERT INTO qgep.vl_benching_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (94,'double_sided','beidseitig','double', 'DS', 'BB', 'D', 'true');
 INSERT INTO qgep.vl_benching_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (93,'one_sided','einseitig','simple', 'OS', 'EB', 'S', 'true');
 INSERT INTO qgep.vl_benching_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3231,'none','kein','aucun', '', 'KB', 'AN', 'true');
 INSERT INTO qgep.vl_benching_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3033,'unknown','unbekannt','inconnu', '', 'U', 'I', 'true');
 ALTER TABLE qgep.od_benching ADD CONSTRAINT fkey_vl_benching_kind FOREIGN KEY (kind)
 REFERENCES qgep.vl_benching_kind (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_backflow_prevention ADD CONSTRAINT oorel_od_backflow_prevention_structure_part FOREIGN KEY (obj_id) REFERENCES qgep.od_structure_part(obj_id);
CREATE TABLE qgep.vl_backflow_prevention_kind () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_backflow_prevention_kind ADD CONSTRAINT pkey_qgep_vl_backflow_prevention_kind PRIMARY KEY (code);
 INSERT INTO qgep.vl_backflow_prevention_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5760,'other','andere','autres', '', '', '', 'true');
 INSERT INTO qgep.vl_backflow_prevention_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5759,'pump','Pumpe','pompe', '', '', '', 'true');
 INSERT INTO qgep.vl_backflow_prevention_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5757,'backflow_flap','Rueckstauklappe','clapet_de_non_retour_a_battant', '', '', '', 'true');
 INSERT INTO qgep.vl_backflow_prevention_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5758,'gate_shield','Stauschild','plaque_de_retenue', '', '', '', 'true');
 ALTER TABLE qgep.od_backflow_prevention ADD CONSTRAINT fkey_vl_backflow_prevention_kind FOREIGN KEY (kind)
 REFERENCES qgep.vl_backflow_prevention_kind (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_tank_emptying ADD CONSTRAINT oorel_od_tank_emptying_structure_part FOREIGN KEY (obj_id) REFERENCES qgep.od_structure_part(obj_id);
CREATE TABLE qgep.vl_tank_emptying_type () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_tank_emptying_type ADD CONSTRAINT pkey_qgep_vl_tank_emptying_type PRIMARY KEY (code);
 INSERT INTO qgep.vl_tank_emptying_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5626,'other','andere','autre', '', '', '', 'true');
 INSERT INTO qgep.vl_tank_emptying_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5627,'none','keine','aucun', '', '', '', 'true');
 INSERT INTO qgep.vl_tank_emptying_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5628,'pump','Pumpe','pompe', '', '', '', 'true');
 INSERT INTO qgep.vl_tank_emptying_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5629,'valve','Schieber','vanne', '', '', '', 'true');
 ALTER TABLE qgep.od_tank_emptying ADD CONSTRAINT fkey_vl_tank_emptying_type FOREIGN KEY (type)
 REFERENCES qgep.vl_tank_emptying_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_tank_cleaning ADD CONSTRAINT oorel_od_tank_cleaning_structure_part FOREIGN KEY (obj_id) REFERENCES qgep.od_structure_part(obj_id);
CREATE TABLE qgep.vl_tank_cleaning_type () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_tank_cleaning_type ADD CONSTRAINT pkey_qgep_vl_tank_cleaning_type PRIMARY KEY (code);
 INSERT INTO qgep.vl_tank_cleaning_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5621,'airjet','Air_Jet','aeration_et_brassage', '', '', '', 'true');
 INSERT INTO qgep.vl_tank_cleaning_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5620,'other','andere','autre', '', '', '', 'true');
 INSERT INTO qgep.vl_tank_cleaning_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5622,'none','keine','aucun', '', '', '', 'true');
 INSERT INTO qgep.vl_tank_cleaning_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5623,'surge_flushing','Schwallspuelung','rincage_en_cascade', '', '', '', 'true');
 INSERT INTO qgep.vl_tank_cleaning_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5624,'tipping_bucket','Spuelkippe','bac_de_rincage', '', '', '', 'true');
 ALTER TABLE qgep.od_tank_cleaning ADD CONSTRAINT fkey_vl_tank_cleaning_type FOREIGN KEY (type)
 REFERENCES qgep.vl_tank_cleaning_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_solids_retention ADD CONSTRAINT oorel_od_solids_retention_structure_part FOREIGN KEY (obj_id) REFERENCES qgep.od_structure_part(obj_id);
CREATE TABLE qgep.vl_solids_retention_type () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_solids_retention_type ADD CONSTRAINT pkey_qgep_vl_solids_retention_type PRIMARY KEY (code);
 INSERT INTO qgep.vl_solids_retention_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5664,'other','andere','autres', '', '', '', 'true');
 INSERT INTO qgep.vl_solids_retention_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5665,'fine_screen','Feinrechen','grille_fine', '', '', '', 'true');
 INSERT INTO qgep.vl_solids_retention_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5666,'coarse_screen','Grobrechen','grille_grossiere', '', '', '', 'true');
 INSERT INTO qgep.vl_solids_retention_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5667,'sieve','Sieb','tamis', '', '', '', 'true');
 INSERT INTO qgep.vl_solids_retention_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5668,'scumboard','Tauchwand','paroi_plongeante', '', '', '', 'true');
 INSERT INTO qgep.vl_solids_retention_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5669,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_solids_retention ADD CONSTRAINT fkey_vl_solids_retention_type FOREIGN KEY (type)
 REFERENCES qgep.vl_solids_retention_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_wwtp_structure ADD CONSTRAINT oorel_od_wwtp_structure_wastewater_structure FOREIGN KEY (obj_id) REFERENCES qgep.od_wastewater_structure(obj_id);
CREATE TABLE qgep.vl_wwtp_structure_kind () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_wwtp_structure_kind ADD CONSTRAINT pkey_qgep_vl_wwtp_structure_kind PRIMARY KEY (code);
 INSERT INTO qgep.vl_wwtp_structure_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (331,'sedimentation_basin','Absetzbecken','bassin_de_decantation', '', '', '', 'true');
 INSERT INTO qgep.vl_wwtp_structure_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2974,'other','andere','autres', '', '', '', 'true');
 INSERT INTO qgep.vl_wwtp_structure_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (327,'aeration_tank','Belebtschlammbecken','bassin_a_boues_activees', '', '', '', 'true');
 INSERT INTO qgep.vl_wwtp_structure_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (329,'fixed_bed_reactor','Festbettreaktor','reacteur_a_biomasse_fixee', '', '', '', 'true');
 INSERT INTO qgep.vl_wwtp_structure_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (330,'submerged_trickling_filter','Tauchtropfkoerper','disque_bacterien_immerge', '', '', '', 'true');
 INSERT INTO qgep.vl_wwtp_structure_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (328,'trickling_filter','Tropfkoerper','lit_bacterien', '', '', '', 'true');
 INSERT INTO qgep.vl_wwtp_structure_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3032,'unknown','unbekannt','inconnu', '', '', '', 'true');
 INSERT INTO qgep.vl_wwtp_structure_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (326,'primary_clarifier','Vorklaerbecken','decanteurs_primaires', '', '', '', 'true');
 ALTER TABLE qgep.od_wwtp_structure ADD CONSTRAINT fkey_vl_wwtp_structure_kind FOREIGN KEY (kind)
 REFERENCES qgep.vl_wwtp_structure_kind (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_channel ADD CONSTRAINT oorel_od_channel_wastewater_structure FOREIGN KEY (obj_id) REFERENCES qgep.od_wastewater_structure(obj_id);
CREATE TABLE qgep.vl_channel_bedding_encasement () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_channel_bedding_encasement ADD CONSTRAINT pkey_qgep_vl_channel_bedding_encasement PRIMARY KEY (code);
 INSERT INTO qgep.vl_channel_bedding_encasement (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5325,'other','andere','autre', '', '', '', 'true');
 INSERT INTO qgep.vl_channel_bedding_encasement (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5332,'in_soil','erdverlegt','enterre', 'IS', 'EV', 'ET', 'true');
 INSERT INTO qgep.vl_channel_bedding_encasement (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5328,'in_channel_suspended','in_Kanal_aufgehaengt','suspendu_dans_le_canal', '', 'IKA', 'CS', 'true');
 INSERT INTO qgep.vl_channel_bedding_encasement (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5339,'in_channel_concrete_casted','in_Kanal_einbetoniert','betonne_dans_le_canal', '', 'IKB', 'CB', 'true');
 INSERT INTO qgep.vl_channel_bedding_encasement (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5331,'in_walk_in_passage','in_Leitungsgang','en_galerie', '', 'ILG', 'G', 'true');
 INSERT INTO qgep.vl_channel_bedding_encasement (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5337,'in_jacking_pipe_concrete','in_Vortriebsrohr_Beton','en_pousse_tube_en_beton', '', 'IVB', 'TB', 'true');
 INSERT INTO qgep.vl_channel_bedding_encasement (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5336,'in_jacking_pipe_steel','in_Vortriebsrohr_Stahl','en_pousse_tube_en_acier', '', 'IVS', 'TA', 'true');
 INSERT INTO qgep.vl_channel_bedding_encasement (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5335,'sand','Sand','sable', '', 'SA', 'SA', 'true');
 INSERT INTO qgep.vl_channel_bedding_encasement (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5333,'sia_type_1','SIA_Typ1','SIA_type_1', '', 'B1', 'B1', 'true');
 INSERT INTO qgep.vl_channel_bedding_encasement (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5330,'sia_type_2','SIA_Typ2','SIA_type_2', '', 'B2', 'B2', 'true');
 INSERT INTO qgep.vl_channel_bedding_encasement (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5334,'sia_type_3','SIA_Typ3','SIA_type_3', '', 'B3', 'B3', 'true');
 INSERT INTO qgep.vl_channel_bedding_encasement (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5340,'sia_type_4','SIA_Typ4','SIA_type_4', '', 'B4', 'B4', 'true');
 INSERT INTO qgep.vl_channel_bedding_encasement (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5327,'bed_plank','Sohlbrett','radier_en_planches', '', 'SB', 'RP', 'true');
 INSERT INTO qgep.vl_channel_bedding_encasement (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5329,'unknown','unbekannt','inconnu', '', 'U', 'I', 'true');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_bedding_encasement FOREIGN KEY (bedding_encasement)
 REFERENCES qgep.vl_channel_bedding_encasement (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_channel_connection_type () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_channel_connection_type ADD CONSTRAINT pkey_qgep_vl_channel_connection_type PRIMARY KEY (code);
 INSERT INTO qgep.vl_channel_connection_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5341,'other','andere','autre', 'O', 'A', 'AU', 'true');
 INSERT INTO qgep.vl_channel_connection_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (190,'electric_welded_sleeves','Elektroschweissmuffen','manchon_electrosoudable', 'EWS', 'EL', 'MSA', 'true');
 INSERT INTO qgep.vl_channel_connection_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (187,'flat_sleeves','Flachmuffen','manchon_plat', '', 'FM', 'MP', 'true');
 INSERT INTO qgep.vl_channel_connection_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (193,'flange','Flansch','bride', '', 'FL', 'B', 'true');
 INSERT INTO qgep.vl_channel_connection_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (185,'bell_shaped_sleeves','Glockenmuffen','emboitement_a_cloche', '', 'GL', 'EC', 'true');
 INSERT INTO qgep.vl_channel_connection_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (192,'coupling','Kupplung','raccord', '', 'KU', 'R', 'true');
 INSERT INTO qgep.vl_channel_connection_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (194,'screwed_sleeves','Schraubmuffen','manchon_visse', '', 'SC', 'MV', 'true');
 INSERT INTO qgep.vl_channel_connection_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (189,'butt_welded','spiegelgeschweisst','manchon_soude_au_miroir', '', 'SP', 'MSM', 'true');
 INSERT INTO qgep.vl_channel_connection_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (186,'beaked_sleeves','Spitzmuffen','emboitement_simple', '', 'SM', 'ES', 'true');
 INSERT INTO qgep.vl_channel_connection_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (191,'push_fit_sleeves','Steckmuffen','raccord_a_serrage', '', 'ST', 'RS', 'true');
 INSERT INTO qgep.vl_channel_connection_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (188,'slip_on_sleeves','Ueberschiebmuffen','manchon_coulissant', '', 'UE', 'MC', 'true');
 INSERT INTO qgep.vl_channel_connection_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3036,'unknown','unbekannt','inconnu', '', 'U', 'I', 'true');
 INSERT INTO qgep.vl_channel_connection_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3666,'jacking_pipe_coupling','Vortriebsrohrkupplung','raccord_pour_tube_de_pousse_tube', '', 'VK', 'RTD', 'true');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_connection_type FOREIGN KEY (connection_type)
 REFERENCES qgep.vl_channel_connection_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_channel_function_hierarchic () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_channel_function_hierarchic ADD CONSTRAINT pkey_qgep_vl_channel_function_hierarchic PRIMARY KEY (code);
 INSERT INTO qgep.vl_channel_function_hierarchic (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5066,'pwwf.other','PAA.andere','OAP.autre', '', '', '', 'true');
 INSERT INTO qgep.vl_channel_function_hierarchic (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5068,'pwwf.water_bodies','PAA.Gewaesser','OAP.cours_d_eau', '', '', '', 'true');
 INSERT INTO qgep.vl_channel_function_hierarchic (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5069,'pwwf.main_drain','PAA.Hauptsammelkanal','OAP.collecteur_principal', '', '', '', 'true');
 INSERT INTO qgep.vl_channel_function_hierarchic (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5070,'pwwf.main_drain_regional','PAA.Hauptsammelkanal_regional','OAP.collecteur_principal_regional', '', '', '', 'true');
 INSERT INTO qgep.vl_channel_function_hierarchic (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5064,'pwwf.residential_drainage','PAA.Liegenschaftsentwaesserung','OAP.evacuation_bien_fonds', '', '', '', 'true');
 INSERT INTO qgep.vl_channel_function_hierarchic (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5071,'pwwf.collector_sewer','PAA.Sammelkanal','OAP.collecteur', '', '', '', 'true');
 INSERT INTO qgep.vl_channel_function_hierarchic (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5062,'pwwf.renovation_conduction','PAA.Sanierungsleitung','OAP.conduite_d_assainissement', '', '', '', 'true');
 INSERT INTO qgep.vl_channel_function_hierarchic (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5072,'pwwf.road_drainage','PAA.Strassenentwaesserung','OAP.evacuation_des_eaux_de_routes', '', '', '', 'true');
 INSERT INTO qgep.vl_channel_function_hierarchic (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5074,'pwwf.unknown','PAA.unbekannt','OAP.inconnue', '', '', '', 'true');
 INSERT INTO qgep.vl_channel_function_hierarchic (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5067,'swwf.other','SAA.andere','OAS.autre', '', '', '', 'true');
 INSERT INTO qgep.vl_channel_function_hierarchic (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5065,'swwf.residential_drainage','SAA.Liegenschaftsentwaesserung','OAS.evacuation_bien_fonds', '', '', '', 'true');
 INSERT INTO qgep.vl_channel_function_hierarchic (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5063,'swwf.renovation_conduction','SAA.Sanierungsleitung','OAS.conduite_d_assainissement', '', '', '', 'true');
 INSERT INTO qgep.vl_channel_function_hierarchic (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5073,'swwf.road_drainage','SAA.Strassenentwaesserung','OAS.evacuation_des_eaux_de_routes', '', '', '', 'true');
 INSERT INTO qgep.vl_channel_function_hierarchic (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5075,'swwf.unknown','SAA.unbekannt','OAS.inconnue', '', '', '', 'true');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_function_hierarchic FOREIGN KEY (function_hierarchic)
 REFERENCES qgep.vl_channel_function_hierarchic (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_channel_function_hydraulic () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_channel_function_hydraulic ADD CONSTRAINT pkey_qgep_vl_channel_function_hydraulic PRIMARY KEY (code);
 INSERT INTO qgep.vl_channel_function_hydraulic (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5320,'other','andere','autre', '', '', '', 'true');
 INSERT INTO qgep.vl_channel_function_hydraulic (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2546,'drainage_transportation_pipe','Drainagetransportleitung','conduite_de_transport_pour_le_drainage', 'DTP', 'DT', 'CTD', 'true');
 INSERT INTO qgep.vl_channel_function_hydraulic (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (22,'restriction_pipe','Drosselleitung','conduite_d_etranglement', 'RP', 'DR', 'CE', 'true');
 INSERT INTO qgep.vl_channel_function_hydraulic (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3610,'inverted_syphon','Duekerleitung','siphon_inverse', 'IS', 'DU', 'S', 'true');
 INSERT INTO qgep.vl_channel_function_hydraulic (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (367,'gravity_pipe','Freispiegelleitung','conduite_a_ecoulement_gravitaire', '', 'FL', 'CEL', 'true');
 INSERT INTO qgep.vl_channel_function_hydraulic (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (23,'pump_pressure_pipe','Pumpendruckleitung','conduite_de_refoulement', '', 'DL', 'CR', 'true');
 INSERT INTO qgep.vl_channel_function_hydraulic (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (145,'seepage_water_drain','Sickerleitung','conduite_de_drainage', 'SP', 'SI', 'CI', 'true');
 INSERT INTO qgep.vl_channel_function_hydraulic (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (21,'retention_pipe','Speicherleitung','conduite_de_retention', '', 'SK', 'CA', 'true');
 INSERT INTO qgep.vl_channel_function_hydraulic (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (144,'jetting_pipe','Spuelleitung','conduite_de_rincage', 'JP', 'SL', 'CC', 'true');
 INSERT INTO qgep.vl_channel_function_hydraulic (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5321,'unknown','unbekannt','inconnue', '', '', '', 'true');
 INSERT INTO qgep.vl_channel_function_hydraulic (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3655,'vacuum_pipe','Vakuumleitung','conduite_sous_vide', '', 'VL', 'CV', 'true');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_function_hydraulic FOREIGN KEY (function_hydraulic)
 REFERENCES qgep.vl_channel_function_hydraulic (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_channel_usage_current () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_channel_usage_current ADD CONSTRAINT pkey_qgep_vl_channel_usage_current PRIMARY KEY (code);
 INSERT INTO qgep.vl_channel_usage_current (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5322,'other','andere','autre', '', '', '', 'true');
 INSERT INTO qgep.vl_channel_usage_current (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4518,'creek_water','Bachwasser','eaux_cours_d_eau', '', '', '', 'true');
 INSERT INTO qgep.vl_channel_usage_current (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4516,'discharged_combined_wastewater','entlastetes_Mischabwasser','eaux_mixtes_deversees', 'DCW', 'EW', 'EUD', 'true');
 INSERT INTO qgep.vl_channel_usage_current (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4524,'industrial_wastewater','Industrieabwasser','eaux_industrielles', '', 'CW', 'EUC', 'true');
 INSERT INTO qgep.vl_channel_usage_current (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4522,'combined_wastewater','Mischabwasser','eaux_mixtes', '', 'MW', 'EUM', 'true');
 INSERT INTO qgep.vl_channel_usage_current (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4520,'rain_wastewater','Regenabwasser','eaux_pluviales', '', 'RW', 'EUP', 'true');
 INSERT INTO qgep.vl_channel_usage_current (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4514,'clean_wastewater','Reinabwasser','eaux_claires', '', 'KW', 'EUR', 'true');
 INSERT INTO qgep.vl_channel_usage_current (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4526,'wastewater','Schmutzabwasser','eaux_usees', '', 'SW', 'EU', 'true');
 INSERT INTO qgep.vl_channel_usage_current (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4571,'unknown','unbekannt','inconnu', '', 'U', 'I', 'true');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_usage_current FOREIGN KEY (usage_current)
 REFERENCES qgep.vl_channel_usage_current (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_channel_usage_planned () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_channel_usage_planned ADD CONSTRAINT pkey_qgep_vl_channel_usage_planned PRIMARY KEY (code);
 INSERT INTO qgep.vl_channel_usage_planned (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5323,'other','andere','autre', '', '', '', 'true');
 INSERT INTO qgep.vl_channel_usage_planned (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4519,'creek_water','Bachwasser','eaux_cours_d_eau', '', '', '', 'true');
 INSERT INTO qgep.vl_channel_usage_planned (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4517,'discharged_combined_wastewater','entlastetes_Mischabwasser','eaux_mixtes_deversees', 'DCW', 'EW', 'EUD', 'true');
 INSERT INTO qgep.vl_channel_usage_planned (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4525,'industrial_wastewater','Industrieabwasser','eaux_industrielles', '', 'CW', 'EUC', 'true');
 INSERT INTO qgep.vl_channel_usage_planned (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4523,'combined_wastewater','Mischabwasser','eaux_mixtes', '', 'MW', 'EUM', 'true');
 INSERT INTO qgep.vl_channel_usage_planned (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4521,'rain_wastewater','Regenabwasser','eaux_pluviales', '', 'RW', 'EUP', 'true');
 INSERT INTO qgep.vl_channel_usage_planned (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4515,'clean_wastewater','Reinabwasser','eaux_claires', '', 'KW', 'EUR', 'true');
 INSERT INTO qgep.vl_channel_usage_planned (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4527,'wastewater','Schmutzabwasser','eaux_usees', '', 'SW', 'EU', 'true');
 INSERT INTO qgep.vl_channel_usage_planned (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4569,'unknown','unbekannt','inconnu', '', 'U', 'I', 'true');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_usage_planned FOREIGN KEY (usage_planned)
 REFERENCES qgep.vl_channel_usage_planned (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_special_structure ADD CONSTRAINT oorel_od_special_structure_wastewater_structure FOREIGN KEY (obj_id) REFERENCES qgep.od_wastewater_structure(obj_id);
CREATE TABLE qgep.vl_special_structure_bypass () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_special_structure_bypass ADD CONSTRAINT pkey_qgep_vl_special_structure_bypass PRIMARY KEY (code);
 INSERT INTO qgep.vl_special_structure_bypass (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2682,'inexistent','nicht_vorhanden','inexistant', '', 'NV', 'IE', 'true');
 INSERT INTO qgep.vl_special_structure_bypass (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3055,'unknown','unbekannt','inconnu', '', 'U', 'I', 'true');
 INSERT INTO qgep.vl_special_structure_bypass (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2681,'existent','vorhanden','existant', '', 'V', 'E', 'true');
 ALTER TABLE qgep.od_special_structure ADD CONSTRAINT fkey_vl_special_structure_bypass FOREIGN KEY (bypass)
 REFERENCES qgep.vl_special_structure_bypass (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_special_structure_emergency_spillway () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_special_structure_emergency_spillway ADD CONSTRAINT pkey_qgep_vl_special_structure_emergency_spillway PRIMARY KEY (code);
 INSERT INTO qgep.vl_special_structure_emergency_spillway (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5866,'other','andere','autres', '', '', '', 'true');
 INSERT INTO qgep.vl_special_structure_emergency_spillway (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5864,'in_combined_waste_water_drain','inMischabwasserkanalisation','dans_canalisation_eaux_mixtes', '', '', '', 'true');
 INSERT INTO qgep.vl_special_structure_emergency_spillway (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5865,'in_rain_waste_water_drain','inRegenabwasserkanalisation','dans_canalisation_eaux_pluviales', '', '', '', 'true');
 INSERT INTO qgep.vl_special_structure_emergency_spillway (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5863,'in_waste_water_drain','inSchmutzabwasserkanalisation','dans_canalisation_eaux_usees', '', '', '', 'true');
 INSERT INTO qgep.vl_special_structure_emergency_spillway (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5878,'none','keiner','aucun', '', '', '', 'true');
 INSERT INTO qgep.vl_special_structure_emergency_spillway (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5867,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_special_structure ADD CONSTRAINT fkey_vl_special_structure_emergency_spillway FOREIGN KEY (emergency_spillway)
 REFERENCES qgep.vl_special_structure_emergency_spillway (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_special_structure_function () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_special_structure_function ADD CONSTRAINT pkey_qgep_vl_special_structure_function PRIMARY KEY (code);
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6397,'pit_without_drain','abflussloseGrube','fosse_etanche', '', '', '', 'true');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (245,'drop_structure','Absturzbauwerk','ouvrage_de_chute', 'DS', 'AK', 'OC', 'true');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6398,'hydrolizing_tank','Abwasserfaulraum','fosse_digestive', '', '', '', 'true');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5371,'other','andere','autre', 'O', 'A', 'AU', 'true');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (386,'venting','Be_Entlueftung','aeration', 'VE', 'BE', 'AE', 'true');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3234,'inverse_syphon_chamber','Duekerkammer','chambre_avec_siphon_inverse', 'ISC', 'DK', 'SI', 'true');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5091,'syphon_head','Duekeroberhaupt','entree_de_siphon', 'SH', 'DO', 'ESI', 'true');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6399,'septic_tank_two_chambers','Faulgrube','fosse_septique', '', '', '', 'true');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3348,'terrain_depression','Gelaendemulde','depression_de_terrain', '', 'GM', 'DT', 'true');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (336,'bolders_bedload_catchement_dam','Geschiebefang','depotoir_pour_alluvions', '', 'GF', 'DA', 'true');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5494,'cesspit','Guellegrube','fosse_a_purin', '', '', '', 'true');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6478,'septic_tank','Klaergrube','fosse_de_decantation', '', 'KG', 'FD', 'true');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2998,'manhole','Kontrollschacht','regard_de_visite', '', 'KS', 'RV', 'true');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2768,'oil_separator','Oelabscheider','separateur_d_hydrocarbures', '', 'OA', 'SH', 'true');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (246,'pump_station','Pumpwerk','station_de_pompage', '', 'PW', 'SP', 'true');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3673,'stormwater_tank_with_overflow','Regenbecken_Durchlaufbecken','BEP_decantation', '', 'DB', 'BDE', 'true');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3674,'stormwater_tank_retaining_first_flush','Regenbecken_Fangbecken','BEP_retention', '', 'FB', 'BRE', 'true');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5574,'stormwater_retaining_channel','Regenbecken_Fangkanal','BEP_canal_retention', 'TRE', 'FK', 'BCR', 'true');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3675,'stormwater_sedimentation_tank','Regenbecken_Regenklaerbecken','BEP_clarification', '', 'RKB', 'BCL', 'true');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3676,'stormwater_retention_tank','Regenbecken_Regenrueckhaltebecken','BEP_accumulation', '', 'RRB', 'BAC', 'true');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5575,'stormwater_retention_channel','Regenbecken_Regenrueckhaltekanal','BEP_canal_accumulation', 'TRC', 'RRK', 'BCA', 'true');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5576,'stormwater_storage_channel','Regenbecken_Stauraumkanal','BEP_canal_stockage', 'TSC', 'SRK', 'BCS', 'true');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3677,'stormwater_composite_tank','Regenbecken_Verbundbecken','BEP_combine', '', 'VB', 'BCO', 'true');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5372,'stormwater_overflow','Regenueberlauf','deversoir_d_orage', '', 'RU', 'DO', 'true');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5373,'floating_material_separator','Schwimmstoffabscheider','separateur_de_materiaux_flottants', '', 'SW', 'SMF', 'true');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (383,'side_access','seitlicherZugang','acces_lateral', '', 'SZ', 'AL', 'true');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (227,'jetting_manhole','Spuelschacht','chambre_de_chasse', '', 'SS', 'CC', 'true');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4799,'separating_structure','Trennbauwerk','ouvrage_de_repartition', '', 'TB', 'OR', 'true');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3008,'unknown','unbekannt','inconnu', '', 'U', 'I', 'true');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2745,'vortex_manhole','Wirbelfallschacht','chambre_de_chute_a_vortex', '', 'WF', 'CT', 'true');
 ALTER TABLE qgep.od_special_structure ADD CONSTRAINT fkey_vl_special_structure_function FOREIGN KEY (function)
 REFERENCES qgep.vl_special_structure_function (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_special_structure_stormwater_tank_arrangement () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_special_structure_stormwater_tank_arrangement ADD CONSTRAINT pkey_qgep_vl_special_structure_stormwater_tank_arrangement PRIMARY KEY (code);
 INSERT INTO qgep.vl_special_structure_stormwater_tank_arrangement (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4608,'main_connection','Hauptschluss','connexion_directe', '', 'HS', 'CD', 'true');
 INSERT INTO qgep.vl_special_structure_stormwater_tank_arrangement (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4609,'side_connection','Nebenschluss','connexion_laterale', '', 'NS', 'CL', 'true');
 INSERT INTO qgep.vl_special_structure_stormwater_tank_arrangement (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4610,'unknown','unbekannt','inconnue', '', '', '', 'true');
 ALTER TABLE qgep.od_special_structure ADD CONSTRAINT fkey_vl_special_structure_stormwater_tank_arrangement FOREIGN KEY (stormwater_tank_arrangement)
 REFERENCES qgep.vl_special_structure_stormwater_tank_arrangement (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_discharge_point ADD CONSTRAINT oorel_od_discharge_point_wastewater_structure FOREIGN KEY (obj_id) REFERENCES qgep.od_wastewater_structure(obj_id);
CREATE TABLE qgep.vl_discharge_point_relevance () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_discharge_point_relevance ADD CONSTRAINT pkey_qgep_vl_discharge_point_relevance PRIMARY KEY (code);
 INSERT INTO qgep.vl_discharge_point_relevance (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5580,'relevant_for_water_course','gewaesserrelevant','pertinent_pour_milieu_recepteur', '', '', '', 'true');
 INSERT INTO qgep.vl_discharge_point_relevance (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5581,'non_relevant_for_water_course','nicht_gewaesserrelevant','insignifiant_pour_milieu_recepteur', '', '', '', 'true');
 ALTER TABLE qgep.od_discharge_point ADD CONSTRAINT fkey_vl_discharge_point_relevance FOREIGN KEY (relevance)
 REFERENCES qgep.vl_discharge_point_relevance (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_infiltration_installation ADD CONSTRAINT oorel_od_infiltration_installation_wastewater_structure FOREIGN KEY (obj_id) REFERENCES qgep.od_wastewater_structure(obj_id);
CREATE TABLE qgep.vl_infiltration_installation_defects () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_infiltration_installation_defects ADD CONSTRAINT pkey_qgep_vl_infiltration_installation_defects PRIMARY KEY (code);
 INSERT INTO qgep.vl_infiltration_installation_defects (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5361,'none','keine','aucunes', '', 'K', 'AN', 'true');
 INSERT INTO qgep.vl_infiltration_installation_defects (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3276,'marginal','unwesentliche','modestes', '', 'UW', 'MI', 'true');
 INSERT INTO qgep.vl_infiltration_installation_defects (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3275,'substantial','wesentliche','importantes', '', 'W', 'MA', 'true');
 ALTER TABLE qgep.od_infiltration_installation ADD CONSTRAINT fkey_vl_infiltration_installation_defects FOREIGN KEY (defects)
 REFERENCES qgep.vl_infiltration_installation_defects (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_infiltration_installation_emergency_spillway () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_infiltration_installation_emergency_spillway ADD CONSTRAINT pkey_qgep_vl_infiltration_installation_emergency_spillway PRIMARY KEY (code);
 INSERT INTO qgep.vl_infiltration_installation_emergency_spillway (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5365,'in_combined_waste_water_drain','inMischwasserkanalisation','dans_canalisation_eaux_mixtes', '', 'IMK', 'CEM', 'true');
 INSERT INTO qgep.vl_infiltration_installation_emergency_spillway (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3307,'in_rain_waste_water_drain','inRegenwasserkanalisation','dans_canalisation_eaux_pluviales', '', 'IRK', 'CEP', 'true');
 INSERT INTO qgep.vl_infiltration_installation_emergency_spillway (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3304,'in_water_body','inVorfluter','au_cours_d_eau_recepteur', '', 'IV', 'CE', 'true');
 INSERT INTO qgep.vl_infiltration_installation_emergency_spillway (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3303,'none','keiner','aucun', '', 'K', 'AN', 'true');
 INSERT INTO qgep.vl_infiltration_installation_emergency_spillway (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3305,'surface_discharge','oberflaechlichausmuendend','deversement_en_surface', '', 'OA', 'DS', 'true');
 INSERT INTO qgep.vl_infiltration_installation_emergency_spillway (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3308,'unknown','unbekannt','inconnu', '', 'U', 'I', 'true');
 ALTER TABLE qgep.od_infiltration_installation ADD CONSTRAINT fkey_vl_infiltration_installation_emergency_spillway FOREIGN KEY (emergency_spillway)
 REFERENCES qgep.vl_infiltration_installation_emergency_spillway (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_infiltration_installation_kind () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_infiltration_installation_kind ADD CONSTRAINT pkey_qgep_vl_infiltration_installation_kind PRIMARY KEY (code);
 INSERT INTO qgep.vl_infiltration_installation_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3282,'with_soil_passage','andere_mit_Bodenpassage','autre_avec_passage_a_travers_sol', 'WSP', 'AMB', 'APC', 'true');
 INSERT INTO qgep.vl_infiltration_installation_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3285,'without_soil_passage','andere_ohne_Bodenpassage','autre_sans_passage_a_travers_sol', 'WOP', 'AOB', 'ASC', 'true');
 INSERT INTO qgep.vl_infiltration_installation_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3279,'surface_infiltration','Flaechenfoermige_Versickerung','infiltration_superficielle_sur_place', '', 'FV', 'IS', 'true');
 INSERT INTO qgep.vl_infiltration_installation_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (277,'gravel_formation','Kieskoerper','corps_de_gravier', '', 'KK', 'VG', 'true');
 INSERT INTO qgep.vl_infiltration_installation_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3284,'combination_manhole_pipe','Kombination_Schacht_Strang','combinaison_puits_bande', '', 'KOM', 'CPT', 'true');
 INSERT INTO qgep.vl_infiltration_installation_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3281,'swale_french_drain_infiltration','MuldenRigolenversickerung','cuvettes_rigoles_filtrantes', '', 'MRV', 'ICR', 'true');
 INSERT INTO qgep.vl_infiltration_installation_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3087,'unknown','unbekannt','inconnu', '', 'U', 'I', 'true');
 INSERT INTO qgep.vl_infiltration_installation_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3280,'percolation_over_the_shoulder','Versickerung_ueber_die_Schulter','infiltration_par_les_bas_cotes', '', 'VUS', 'IDB', 'true');
 INSERT INTO qgep.vl_infiltration_installation_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (276,'infiltration_basin','Versickerungsbecken','bassin_d_infiltration', '', 'VB', 'BI', 'true');
 INSERT INTO qgep.vl_infiltration_installation_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (278,'adsorbing_well','Versickerungsschacht','puits_d_infiltration', '', 'VS', 'PI', 'true');
 INSERT INTO qgep.vl_infiltration_installation_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3283,'infiltration_pipe_sections_gallery','Versickerungsstrang_Galerie','bande_infiltration_galerie', '', 'VG', 'TIG', 'true');
 ALTER TABLE qgep.od_infiltration_installation ADD CONSTRAINT fkey_vl_infiltration_installation_kind FOREIGN KEY (kind)
 REFERENCES qgep.vl_infiltration_installation_kind (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_infiltration_installation_labeling () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_infiltration_installation_labeling ADD CONSTRAINT pkey_qgep_vl_infiltration_installation_labeling PRIMARY KEY (code);
 INSERT INTO qgep.vl_infiltration_installation_labeling (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5362,'labeled','beschriftet','signalee', 'L', 'BS', 'SI', 'true');
 INSERT INTO qgep.vl_infiltration_installation_labeling (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5363,'not_labeled','nichtbeschriftet','non_signalee', '', 'NBS', 'NSI', 'true');
 INSERT INTO qgep.vl_infiltration_installation_labeling (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5364,'unknown','unbekannt','inconnue', '', 'U', 'I', 'true');
 ALTER TABLE qgep.od_infiltration_installation ADD CONSTRAINT fkey_vl_infiltration_installation_labeling FOREIGN KEY (labeling)
 REFERENCES qgep.vl_infiltration_installation_labeling (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_infiltration_installation_seepage_utilization () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_infiltration_installation_seepage_utilization ADD CONSTRAINT pkey_qgep_vl_infiltration_installation_seepage_utilization PRIMARY KEY (code);
 INSERT INTO qgep.vl_infiltration_installation_seepage_utilization (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (274,'rain_water','Regenabwasser','eaux_pluviales', '', 'RW', 'EP', 'true');
 INSERT INTO qgep.vl_infiltration_installation_seepage_utilization (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (273,'clean_water','Reinabwasser','eaux_claires', '', 'KW', 'EC', 'true');
 INSERT INTO qgep.vl_infiltration_installation_seepage_utilization (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5359,'unknown','unbekannt','inconnue', '', 'U', 'I', 'true');
 ALTER TABLE qgep.od_infiltration_installation ADD CONSTRAINT fkey_vl_infiltration_installation_seepage_utilization FOREIGN KEY (seepage_utilization)
 REFERENCES qgep.vl_infiltration_installation_seepage_utilization (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_infiltration_installation_vehicle_access () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_infiltration_installation_vehicle_access ADD CONSTRAINT pkey_qgep_vl_infiltration_installation_vehicle_access PRIMARY KEY (code);
 INSERT INTO qgep.vl_infiltration_installation_vehicle_access (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3289,'unknown','unbekannt','inconnu', '', 'U', 'I', 'true');
 INSERT INTO qgep.vl_infiltration_installation_vehicle_access (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3288,'inaccessible','unzugaenglich','inaccessible', '', 'ZU', 'IAC', 'true');
 INSERT INTO qgep.vl_infiltration_installation_vehicle_access (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3287,'accessible','zugaenglich','accessible', '', 'Z', 'AC', 'true');
 ALTER TABLE qgep.od_infiltration_installation ADD CONSTRAINT fkey_vl_infiltration_installation_vehicle_access FOREIGN KEY (vehicle_access)
 REFERENCES qgep.vl_infiltration_installation_vehicle_access (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_infiltration_installation_watertightness () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_infiltration_installation_watertightness ADD CONSTRAINT pkey_qgep_vl_infiltration_installation_watertightness PRIMARY KEY (code);
 INSERT INTO qgep.vl_infiltration_installation_watertightness (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3295,'not_watertight','nichtwasserdicht','non_etanche', '', 'NWD', 'NE', 'true');
 INSERT INTO qgep.vl_infiltration_installation_watertightness (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5360,'unknown','unbekannt','inconnue', '', 'U', 'I', 'true');
 INSERT INTO qgep.vl_infiltration_installation_watertightness (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3294,'watertight','wasserdicht','etanche', '', 'WD', 'E', 'true');
 ALTER TABLE qgep.od_infiltration_installation ADD CONSTRAINT fkey_vl_infiltration_installation_watertightness FOREIGN KEY (watertightness)
 REFERENCES qgep.vl_infiltration_installation_watertightness (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_manhole ADD CONSTRAINT oorel_od_manhole_wastewater_structure FOREIGN KEY (obj_id) REFERENCES qgep.od_wastewater_structure(obj_id);
CREATE TABLE qgep.vl_manhole_function () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_manhole_function ADD CONSTRAINT pkey_qgep_vl_manhole_function PRIMARY KEY (code);
 INSERT INTO qgep.vl_manhole_function (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4532,'drop_structure','Absturzbauwerk','ouvrage_de_chute', 'DS', 'AK', 'OC', 'true');
 INSERT INTO qgep.vl_manhole_function (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5344,'other','andere','autre', 'O', 'A', 'AU', 'true');
 INSERT INTO qgep.vl_manhole_function (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4533,'venting','Be_Entlueftung','aeration', 'VE', 'BE', 'AE', 'true');
 INSERT INTO qgep.vl_manhole_function (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3267,'rain_water_manhole','Dachwasserschacht','chambre_recolte_eaux_toitures', 'RWM', 'DS', 'CRT', 'true');
 INSERT INTO qgep.vl_manhole_function (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3266,'gully','Einlaufschacht','chambre_avec_grille_d_entree', 'G', 'ES', 'CG', 'true');
 INSERT INTO qgep.vl_manhole_function (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3472,'drainage_channel','Entwaesserungsrinne','rigole_de_drainage', '', 'ER', 'RD', 'true');
 INSERT INTO qgep.vl_manhole_function (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (228,'rail_track_gully','Geleiseschacht','evacuation_des_eaux_des_voies_ferrees', '', 'GL', 'EVF', 'true');
 INSERT INTO qgep.vl_manhole_function (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (204,'manhole','Kontrollschacht','regard_de_visite', '', 'KS', 'CC', 'true');
 INSERT INTO qgep.vl_manhole_function (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (1008,'oil_separator','Oelabscheider','separateur_d_hydrocarbures', 'OS', 'OA', 'SH', 'true');
 INSERT INTO qgep.vl_manhole_function (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4536,'pump_station','Pumpwerk','station_de_pompage', '', 'PW', 'SP', 'true');
 INSERT INTO qgep.vl_manhole_function (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5346,'stormwater_overflow','Regenueberlauf','deversoir_d_orage', '', 'HE', 'DO', 'true');
 INSERT INTO qgep.vl_manhole_function (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2742,'slurry_collector','Schlammsammler','depotoir', '', 'SA', 'D', 'true');
 INSERT INTO qgep.vl_manhole_function (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5347,'floating_material_separator','Schwimmstoffabscheider','separateur_de_materiaux_flottants', '', 'SW', 'SMF', 'true');
 INSERT INTO qgep.vl_manhole_function (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4537,'jetting_manhole','Spuelschacht','chambre_de_chasse', '', 'SS', 'CC', 'true');
 INSERT INTO qgep.vl_manhole_function (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4798,'separating_structure','Trennbauwerk','ouvrage_de_repartition', '', 'TB', 'OR', 'true');
 INSERT INTO qgep.vl_manhole_function (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5345,'unknown','unbekannt','inconnue', '', 'U', 'I', 'true');
 ALTER TABLE qgep.od_manhole ADD CONSTRAINT fkey_vl_manhole_function FOREIGN KEY (function)
 REFERENCES qgep.vl_manhole_function (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_manhole_material () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_manhole_material ADD CONSTRAINT pkey_qgep_vl_manhole_material PRIMARY KEY (code);
 INSERT INTO qgep.vl_manhole_material (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4540,'other','andere','autre', '', '', '', 'true');
 INSERT INTO qgep.vl_manhole_material (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4541,'concrete','Beton','beton', '', '', '', 'true');
 INSERT INTO qgep.vl_manhole_material (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4542,'plastic','Kunststoff','matiere_plastique', '', '', '', 'true');
 INSERT INTO qgep.vl_manhole_material (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4543,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_manhole ADD CONSTRAINT fkey_vl_manhole_material FOREIGN KEY (material)
 REFERENCES qgep.vl_manhole_material (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_manhole_surface_inflow () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_manhole_surface_inflow ADD CONSTRAINT pkey_qgep_vl_manhole_surface_inflow PRIMARY KEY (code);
 INSERT INTO qgep.vl_manhole_surface_inflow (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5342,'other','andere','autre', 'O', 'A', 'AU', 'true');
 INSERT INTO qgep.vl_manhole_surface_inflow (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2741,'none','keiner','aucune', '', 'K', 'AN', 'true');
 INSERT INTO qgep.vl_manhole_surface_inflow (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2739,'grid','Rost','grille_d_ecoulement', '', 'R', 'G', 'true');
 INSERT INTO qgep.vl_manhole_surface_inflow (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5343,'unknown','unbekannt','inconnue', '', 'U', 'I', 'true');
 INSERT INTO qgep.vl_manhole_surface_inflow (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2740,'intake_from_side','Zulauf_seitlich','arrivee_laterale', '', 'ZS', 'AL', 'true');
 ALTER TABLE qgep.od_manhole ADD CONSTRAINT fkey_vl_manhole_surface_inflow FOREIGN KEY (surface_inflow)
 REFERENCES qgep.vl_manhole_surface_inflow (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_lake ADD CONSTRAINT oorel_od_lake_surface_water_bodies FOREIGN KEY (obj_id) REFERENCES qgep.od_surface_water_bodies(obj_id);
ALTER TABLE qgep.od_river ADD CONSTRAINT oorel_od_river_surface_water_bodies FOREIGN KEY (obj_id) REFERENCES qgep.od_surface_water_bodies(obj_id);
CREATE TABLE qgep.vl_river_kind () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_river_kind ADD CONSTRAINT pkey_qgep_vl_river_kind PRIMARY KEY (code);
 INSERT INTO qgep.vl_river_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3397,'englacial_river','Gletscherbach','ruisseau_de_glacier', '', '', '', 'true');
 INSERT INTO qgep.vl_river_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3399,'marsh_river','Moorbach','ruisseau_de_tourbiere', '', '', '', 'true');
 INSERT INTO qgep.vl_river_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3398,'lake_outflow','Seeausfluss','effluent_d_un_lac', '', '', '', 'true');
 INSERT INTO qgep.vl_river_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3396,'travertine_river','Travertinbach','ruisseau_sur_fond_tufcalcaire', '', '', '', 'true');
 INSERT INTO qgep.vl_river_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3400,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_river ADD CONSTRAINT fkey_vl_river_kind FOREIGN KEY (kind)
 REFERENCES qgep.vl_river_kind (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_dam ADD CONSTRAINT oorel_od_dam_water_control_structure FOREIGN KEY (obj_id) REFERENCES qgep.od_water_control_structure(obj_id);
CREATE TABLE qgep.vl_dam_kind () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_dam_kind ADD CONSTRAINT pkey_qgep_vl_dam_kind PRIMARY KEY (code);
 INSERT INTO qgep.vl_dam_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (416,'retaining_weir','Stauwehr','digue_reservoir', '', '', '', 'true');
 INSERT INTO qgep.vl_dam_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (417,'spillway','Streichwehr','deversoir_lateral', '', '', '', 'true');
 INSERT INTO qgep.vl_dam_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (419,'dam','Talsperre','barrage', '', '', '', 'true');
 INSERT INTO qgep.vl_dam_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (418,'tyrolean_weir','Tirolerwehr','prise_tyrolienne', '', '', '', 'true');
 INSERT INTO qgep.vl_dam_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3064,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_dam ADD CONSTRAINT fkey_vl_dam_kind FOREIGN KEY (kind)
 REFERENCES qgep.vl_dam_kind (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_chute ADD CONSTRAINT oorel_od_chute_water_control_structure FOREIGN KEY (obj_id) REFERENCES qgep.od_water_control_structure(obj_id);
CREATE TABLE qgep.vl_chute_kind () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_chute_kind ADD CONSTRAINT pkey_qgep_vl_chute_kind PRIMARY KEY (code);
 INSERT INTO qgep.vl_chute_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3591,'artificial','kuenstlich','artificiel', '', '', '', 'true');
 INSERT INTO qgep.vl_chute_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3592,'natural','natuerlich','naturel', '', '', '', 'true');
 INSERT INTO qgep.vl_chute_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3593,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_chute ADD CONSTRAINT fkey_vl_chute_kind FOREIGN KEY (kind)
 REFERENCES qgep.vl_chute_kind (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_chute_material () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_chute_material ADD CONSTRAINT pkey_qgep_vl_chute_material PRIMARY KEY (code);
 INSERT INTO qgep.vl_chute_material (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2633,'other','andere','autres', '', '', '', 'true');
 INSERT INTO qgep.vl_chute_material (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (409,'concrete_or_rock_pavement','Beton_Steinpflaesterung','beton_pavage_de_pierres', '', '', '', 'true');
 INSERT INTO qgep.vl_chute_material (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (411,'rocks_or_boulders','Fels_Steinbloecke','rocher_blocs_de_rocher', '', '', '', 'true');
 INSERT INTO qgep.vl_chute_material (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (408,'wood','Holz','bois', '', '', '', 'true');
 INSERT INTO qgep.vl_chute_material (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (410,'natural_none','natuerlich_kein','naturel_aucun', '', '', '', 'true');
 INSERT INTO qgep.vl_chute_material (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3061,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_chute ADD CONSTRAINT fkey_vl_chute_material FOREIGN KEY (material)
 REFERENCES qgep.vl_chute_material (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_ford ADD CONSTRAINT oorel_od_ford_water_control_structure FOREIGN KEY (obj_id) REFERENCES qgep.od_water_control_structure(obj_id);
ALTER TABLE qgep.od_rock_ramp ADD CONSTRAINT oorel_od_rock_ramp_water_control_structure FOREIGN KEY (obj_id) REFERENCES qgep.od_water_control_structure(obj_id);
CREATE TABLE qgep.vl_rock_ramp_stabilisation () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_rock_ramp_stabilisation ADD CONSTRAINT pkey_qgep_vl_rock_ramp_stabilisation PRIMARY KEY (code);
 INSERT INTO qgep.vl_rock_ramp_stabilisation (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2635,'other_smooth','andere_glatt','autres_lisse', '', '', '', 'true');
 INSERT INTO qgep.vl_rock_ramp_stabilisation (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2634,'other_rough','andere_rauh','autres_rugueux', '', '', '', 'true');
 INSERT INTO qgep.vl_rock_ramp_stabilisation (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (415,'concrete_channel','Betonrinne','lit_en_beton', '', '', '', 'true');
 INSERT INTO qgep.vl_rock_ramp_stabilisation (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (412,'rocks_or_boulders','Blockwurf','enrochement', '', '', '', 'true');
 INSERT INTO qgep.vl_rock_ramp_stabilisation (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (413,'paved','gepflaestert','pavement', '', '', '', 'true');
 INSERT INTO qgep.vl_rock_ramp_stabilisation (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (414,'wooden_beam','Holzbalken','poutres_en_bois', '', '', '', 'true');
 INSERT INTO qgep.vl_rock_ramp_stabilisation (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3063,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_rock_ramp ADD CONSTRAINT fkey_vl_rock_ramp_stabilisation FOREIGN KEY (stabilisation)
 REFERENCES qgep.vl_rock_ramp_stabilisation (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_blocking_debris ADD CONSTRAINT oorel_od_blocking_debris_water_control_structure FOREIGN KEY (obj_id) REFERENCES qgep.od_water_control_structure(obj_id);
ALTER TABLE qgep.od_passage ADD CONSTRAINT oorel_od_passage_water_control_structure FOREIGN KEY (obj_id) REFERENCES qgep.od_water_control_structure(obj_id);
ALTER TABLE qgep.od_lock ADD CONSTRAINT oorel_od_lock_water_control_structure FOREIGN KEY (obj_id) REFERENCES qgep.od_water_control_structure(obj_id);
ALTER TABLE qgep.od_param_ca_mouse1 ADD CONSTRAINT oorel_od_param_ca_mouse1_surface_runoff_parameters FOREIGN KEY (obj_id) REFERENCES qgep.od_surface_runoff_parameters(obj_id);
ALTER TABLE qgep.od_param_ca_general ADD CONSTRAINT oorel_od_param_ca_general_surface_runoff_parameters FOREIGN KEY (obj_id) REFERENCES qgep.od_surface_runoff_parameters(obj_id);
ALTER TABLE qgep.od_private ADD CONSTRAINT oorel_od_private_organisation FOREIGN KEY (obj_id) REFERENCES qgep.od_organisation(obj_id);
ALTER TABLE qgep.od_administrative_office ADD CONSTRAINT oorel_od_administrative_office_organisation FOREIGN KEY (obj_id) REFERENCES qgep.od_organisation(obj_id);
ALTER TABLE qgep.od_canton ADD CONSTRAINT oorel_od_canton_organisation FOREIGN KEY (obj_id) REFERENCES qgep.od_organisation(obj_id);
ALTER TABLE qgep.od_cooperative ADD CONSTRAINT oorel_od_cooperative_organisation FOREIGN KEY (obj_id) REFERENCES qgep.od_organisation(obj_id);
ALTER TABLE qgep.od_municipality ADD CONSTRAINT oorel_od_municipality_organisation FOREIGN KEY (obj_id) REFERENCES qgep.od_organisation(obj_id);
ALTER TABLE qgep.od_waste_water_association ADD CONSTRAINT oorel_od_waste_water_association_organisation FOREIGN KEY (obj_id) REFERENCES qgep.od_organisation(obj_id);
ALTER TABLE qgep.od_waste_water_treatment_plant ADD CONSTRAINT oorel_od_waste_water_treatment_plant_organisation FOREIGN KEY (obj_id) REFERENCES qgep.od_organisation(obj_id);
ALTER TABLE qgep.od_wastewater_node ADD CONSTRAINT oorel_od_wastewater_node_wastewater_networkelement FOREIGN KEY (obj_id) REFERENCES qgep.od_wastewater_networkelement(obj_id);
ALTER TABLE qgep.od_reach ADD CONSTRAINT oorel_od_reach_wastewater_networkelement FOREIGN KEY (obj_id) REFERENCES qgep.od_wastewater_networkelement(obj_id);
CREATE TABLE qgep.vl_reach_elevation_determination () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_reach_elevation_determination ADD CONSTRAINT pkey_qgep_vl_reach_elevation_determination PRIMARY KEY (code);
 INSERT INTO qgep.vl_reach_elevation_determination (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4780,'accurate','genau','precise', '', 'LG', 'P', 'true');
 INSERT INTO qgep.vl_reach_elevation_determination (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4778,'unknown','unbekannt','inconnue', '', 'U', 'I', 'true');
 INSERT INTO qgep.vl_reach_elevation_determination (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4779,'inaccurate','ungenau','imprecise', '', 'LU', 'IP', 'true');
 ALTER TABLE qgep.od_reach ADD CONSTRAINT fkey_vl_reach_elevation_determination FOREIGN KEY (elevation_determination)
 REFERENCES qgep.vl_reach_elevation_determination (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_reach_horizontal_positioning () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_reach_horizontal_positioning ADD CONSTRAINT pkey_qgep_vl_reach_horizontal_positioning PRIMARY KEY (code);
 INSERT INTO qgep.vl_reach_horizontal_positioning (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5378,'accurate','genau','precise', '', 'LG', 'P', 'true');
 INSERT INTO qgep.vl_reach_horizontal_positioning (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5379,'unknown','unbekannt','inconnue', '', 'U', 'I', 'true');
 INSERT INTO qgep.vl_reach_horizontal_positioning (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5380,'inaccurate','ungenau','imprecise', '', 'LU', 'IP', 'true');
 ALTER TABLE qgep.od_reach ADD CONSTRAINT fkey_vl_reach_horizontal_positioning FOREIGN KEY (horizontal_positioning)
 REFERENCES qgep.vl_reach_horizontal_positioning (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_reach_inside_coating () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_reach_inside_coating ADD CONSTRAINT pkey_qgep_vl_reach_inside_coating PRIMARY KEY (code);
 INSERT INTO qgep.vl_reach_inside_coating (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5383,'other','andere','autre', 'O', 'A', 'AU', 'true');
 INSERT INTO qgep.vl_reach_inside_coating (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (248,'coating','Anstrich_Beschichtung','peinture_revetement', 'C', 'B', 'PR', 'true');
 INSERT INTO qgep.vl_reach_inside_coating (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (250,'brick_lining','Kanalklinkerauskleidung','revetement_en_brique', '', 'KL', 'RB', 'true');
 INSERT INTO qgep.vl_reach_inside_coating (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (251,'stoneware_lining','Steinzeugauskleidung','revetement_en_gres', '', 'ST', 'RG', 'true');
 INSERT INTO qgep.vl_reach_inside_coating (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5384,'unknown','unbekannt','inconnue', '', 'U', 'I', 'true');
 INSERT INTO qgep.vl_reach_inside_coating (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (249,'cement_mortar_lining','Zementmoertelauskleidung','revetement_en_mortier_de_ciment', '', 'ZM', 'RM', 'true');
 ALTER TABLE qgep.od_reach ADD CONSTRAINT fkey_vl_reach_inside_coating FOREIGN KEY (inside_coating)
 REFERENCES qgep.vl_reach_inside_coating (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_reach_material () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_reach_material ADD CONSTRAINT pkey_qgep_vl_reach_material PRIMARY KEY (code);
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5381,'other','andere','autre', 'O', 'A', 'AU', 'true');
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2754,'asbestos_cement','Asbestzement','amiante_ciment', 'AC', 'AZ', 'AC', 'true');
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3638,'concrete_normal','Beton_Normalbeton','beton_normal', 'CN', 'NB', 'BN', 'true');
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3639,'concrete_insitu','Beton_Ortsbeton','beton_coule_sur_place', 'CI', 'OB', 'BCP', 'true');
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3640,'concrete_presspipe','Beton_Pressrohrbeton','beton_pousse_tube', 'CP', 'PRB', 'BPT', 'true');
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3641,'concrete_special','Beton_Spezialbeton','beton_special', 'CS', 'SB', 'BS', 'true');
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3256,'concrete_unknown','Beton_unbekannt','beton_inconnu', 'CU', 'BU', 'BI', 'true');
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (147,'fiber_cement','Faserzement','fibrociment', 'FC', 'FZ', 'FC', 'true');
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2755,'bricks','Gebrannte_Steine','terre_cuite', 'BR', 'SG', 'TC', 'true');
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (148,'cast_ductile_iron','Guss_duktil','fonte_ductile', 'ID', 'GD', 'FD', 'true');
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3648,'cast_gray_iron','Guss_Grauguss','fonte_grise', 'CGI', 'GG', 'FG', 'true');
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5076,'plastic_epoxy_resin','Kunststoff_Epoxydharz','matiere_synthetique_resine_d_epoxy', 'PER', 'EP', 'EP', 'true');
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5077,'plastic_highdensity_polyethylene','Kunststoff_Hartpolyethylen','matiere_synthetique_polyethylene_dur', 'HPE', 'HPE', 'PD', 'true');
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5078,'plastic_polyester_GUP','Kunststoff_Polyester_GUP','matiere_synthetique_polyester_GUP', 'GUP', 'GUP', 'GUP', 'true');
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5079,'plastic_polyethylene','Kunststoff_Polyethylen','matiere_synthetique_polyethylene', 'PE', 'PE', 'PE', 'true');
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5080,'plastic_polypropylene','Kunststoff_Polypropylen','matiere_synthetique_polypropylene', 'PP', 'PP', 'PP', 'true');
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5081,'plastic_PVC','Kunststoff_Polyvinilchlorid','matiere_synthetique_PVC', 'PVC', 'PVC', 'PVC', 'true');
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5382,'plastic_unknown','Kunststoff_unbekannt','matiere_synthetique_inconnue', 'PU', 'KUU', 'MSI', 'true');
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (153,'steel','Stahl','acier', 'ST', 'ST', 'AC', 'true');
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3654,'steel_stainless','Stahl_rostfrei','acier_inoxydable', 'SST', 'STI', 'ACI', 'true');
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (154,'stoneware','Steinzeug','gres', 'SW', 'STZ', 'GR', 'true');
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2761,'clay','Ton','argile', 'CL', 'T', 'AR', 'true');
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3016,'unknown','unbekannt','inconnu', 'U', 'U', 'I', 'true');
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2762,'cement','Zement','ciment', 'C', 'Z', 'C', 'true');
 ALTER TABLE qgep.od_reach ADD CONSTRAINT fkey_vl_reach_material FOREIGN KEY (material)
 REFERENCES qgep.vl_reach_material (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_reach_reliner_material () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_reach_reliner_material ADD CONSTRAINT pkey_qgep_vl_reach_reliner_material PRIMARY KEY (code);
 INSERT INTO qgep.vl_reach_reliner_material (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6459,'other','andere','autre', '', '', '', 'true');
 INSERT INTO qgep.vl_reach_reliner_material (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6461,'epoxy_resin_glass_fibre_laminate','Epoxidharz_Glasfaserlaminat','resine_epoxy_lamine_en_fibre_de_verre', '', '', '', 'true');
 INSERT INTO qgep.vl_reach_reliner_material (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6460,'epoxy_resin_plastic_felt','Epoxidharz_Kunststofffilz','resine_epoxy_feutre_synthetique', '', '', '', 'true');
 INSERT INTO qgep.vl_reach_reliner_material (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6483,'GUP_pipe','GUP_Rohr','tuyau_PRV', '', '', '', 'true');
 INSERT INTO qgep.vl_reach_reliner_material (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6462,'HDPE','HDPE','HDPE', '', '', '', 'true');
 INSERT INTO qgep.vl_reach_reliner_material (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6484,'isocyanate_resin_glass_fibre_laminate','Isocyanatharze_Glasfaserlaminat','isocyanat_resine_lamine_en_fibre_de_verre', '', '', '', 'true');
 INSERT INTO qgep.vl_reach_reliner_material (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6485,'isocyanate_resin_plastic_felt','Isocyanatharze_Kunststofffilz','isocyanat_resine_lamine_feutre_synthetique', '', '', '', 'true');
 INSERT INTO qgep.vl_reach_reliner_material (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6464,'polyester_resin_glass_fibre_laminate','Polyesterharz_Glasfaserlaminat','resine_de_polyester_lamine_en_fibre_de_verre', '', '', '', 'true');
 INSERT INTO qgep.vl_reach_reliner_material (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6463,'polyester_resin_plastic_felt','Polyesterharz_Kunststofffilz','resine_de_polyester_feutre_synthetique', '', '', '', 'true');
 INSERT INTO qgep.vl_reach_reliner_material (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6482,'polypropylene','Polypropylen','polypropylene', '', '', '', 'true');
 INSERT INTO qgep.vl_reach_reliner_material (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6465,'PVC','Polyvinilchlorid','PVC', '', '', '', 'true');
 INSERT INTO qgep.vl_reach_reliner_material (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6466,'bottom_with_polyester_concret_shell','Sohle_mit_Schale_aus_Polyesterbeton','radier_avec_pellicule_en_beton_polyester', '', '', '', 'true');
 INSERT INTO qgep.vl_reach_reliner_material (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6467,'unknown','unbekannt','inconnu', '', '', '', 'true');
 INSERT INTO qgep.vl_reach_reliner_material (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6486,'UP_resin_LED_synthetic_fibre_liner','UP_Harz_LED_Synthesefaserliner','UP_resine_LED_fibre_synthetiques_liner', '', '', '', 'true');
 INSERT INTO qgep.vl_reach_reliner_material (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6468,'vinyl_ester_resin_glass_fibre_laminate','Vinylesterharz_Glasfaserlaminat','resine_d_ester_vinylique_lamine_en_fibre_de_verre', '', '', '', 'true');
 INSERT INTO qgep.vl_reach_reliner_material (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6469,'vinyl_ester_resin_plastic_felt','Vinylesterharz_Kunststofffilz','resine_d_ester_vinylique_feutre_synthetique', '', '', '', 'true');
 ALTER TABLE qgep.od_reach ADD CONSTRAINT fkey_vl_reach_reliner_material FOREIGN KEY (reliner_material)
 REFERENCES qgep.vl_reach_reliner_material (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_reach_relining_construction () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_reach_relining_construction ADD CONSTRAINT pkey_qgep_vl_reach_relining_construction PRIMARY KEY (code);
 INSERT INTO qgep.vl_reach_relining_construction (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6448,'other','andere','autre', '', '', '', 'true');
 INSERT INTO qgep.vl_reach_relining_construction (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6479,'close_fit_relining','Close_Fit_Relining','close_fit_relining', '', '', '', 'true');
 INSERT INTO qgep.vl_reach_relining_construction (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6449,'relining_short_tube','Kurzrohrrelining','relining_tube_court', '', '', '', 'true');
 INSERT INTO qgep.vl_reach_relining_construction (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6481,'grouted_in_place_lining','Noppenschlauchrelining','Noppenschlauchrelining', '', '', '', 'true');
 INSERT INTO qgep.vl_reach_relining_construction (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6452,'partial_liner','Partieller_Liner','liner_partiel', '', '', '', 'true');
 INSERT INTO qgep.vl_reach_relining_construction (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6450,'pipe_string_relining','Rohrstrangrelining','chemisage_par_ligne_de_tuyau', '', '', '', 'true');
 INSERT INTO qgep.vl_reach_relining_construction (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6451,'hose_relining','Schlauchrelining','chemisage_par_gainage', '', '', '', 'true');
 INSERT INTO qgep.vl_reach_relining_construction (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6453,'unknown','unbekannt','inconnu', '', '', '', 'true');
 INSERT INTO qgep.vl_reach_relining_construction (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6480,'spiral_lining','Wickelrohrrelining','chemisage_par_tube_spirale', '', '', '', 'true');
 ALTER TABLE qgep.od_reach ADD CONSTRAINT fkey_vl_reach_relining_construction FOREIGN KEY (relining_construction)
 REFERENCES qgep.vl_reach_relining_construction (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_reach_relining_kind () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_reach_relining_kind ADD CONSTRAINT pkey_qgep_vl_reach_relining_kind PRIMARY KEY (code);
 INSERT INTO qgep.vl_reach_relining_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6455,'full_reach','ganze_Haltung','troncon_entier', '', '', '', 'true');
 INSERT INTO qgep.vl_reach_relining_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6456,'partial','partiell','partiellement', '', '', '', 'true');
 INSERT INTO qgep.vl_reach_relining_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6457,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_reach ADD CONSTRAINT fkey_vl_reach_relining_kind FOREIGN KEY (relining_kind)
 REFERENCES qgep.vl_reach_relining_kind (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_reach ADD COLUMN fk_reach_point_from varchar (16);
ALTER TABLE qgep.od_reach ADD CONSTRAINT rel_reach_reach_point_from FOREIGN KEY (fk_reach_point_from) REFERENCES qgep.od_reach_point(obj_id);
ALTER TABLE qgep.od_reach ADD COLUMN fk_reach_point_to varchar (16);
ALTER TABLE qgep.od_reach ADD CONSTRAINT rel_reach_reach_point_to FOREIGN KEY (fk_reach_point_to) REFERENCES qgep.od_reach_point(obj_id);
ALTER TABLE qgep.od_reach ADD COLUMN fk_pipe_profile varchar (16);
ALTER TABLE qgep.od_reach ADD CONSTRAINT rel_reach_pipe_profile FOREIGN KEY (fk_pipe_profile) REFERENCES qgep.od_pipe_profile(obj_id);
ALTER TABLE qgep.od_pump ADD CONSTRAINT oorel_od_pump_overflow FOREIGN KEY (obj_id) REFERENCES qgep.od_overflow(obj_id);
CREATE TABLE qgep.vl_pump_contruction_type () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_pump_contruction_type ADD CONSTRAINT pkey_qgep_vl_pump_contruction_type PRIMARY KEY (code);
 INSERT INTO qgep.vl_pump_contruction_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2983,'other','andere','autres', '', '', '', 'true');
 INSERT INTO qgep.vl_pump_contruction_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2662,'compressed_air_system','Druckluftanlage','systeme_a_air_comprime', '', '', '', 'true');
 INSERT INTO qgep.vl_pump_contruction_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (314,'piston_pump','Kolbenpumpe','pompe_a_piston', '', '', '', 'true');
 INSERT INTO qgep.vl_pump_contruction_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (309,'centrifugal_pump','Kreiselpumpe','pompe_centrifuge', '', '', '', 'true');
 INSERT INTO qgep.vl_pump_contruction_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (310,'screw_pump','Schneckenpumpe','pompe_a_vis', '', '', '', 'true');
 INSERT INTO qgep.vl_pump_contruction_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3082,'unknown','unbekannt','inconnu', '', '', '', 'true');
 INSERT INTO qgep.vl_pump_contruction_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2661,'vacuum_system','Vakuumanlage','systeme_a_vide_d_air', '', '', '', 'true');
 ALTER TABLE qgep.od_pump ADD CONSTRAINT fkey_vl_pump_contruction_type FOREIGN KEY (contruction_type)
 REFERENCES qgep.vl_pump_contruction_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_pump_placement_of_actuation () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_pump_placement_of_actuation ADD CONSTRAINT pkey_qgep_vl_pump_placement_of_actuation PRIMARY KEY (code);
 INSERT INTO qgep.vl_pump_placement_of_actuation (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (318,'wet','nass','immerge', '', '', '', 'true');
 INSERT INTO qgep.vl_pump_placement_of_actuation (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (311,'dry','trocken','non_submersible', '', '', '', 'true');
 INSERT INTO qgep.vl_pump_placement_of_actuation (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3070,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_pump ADD CONSTRAINT fkey_vl_pump_placement_of_actuation FOREIGN KEY (placement_of_actuation)
 REFERENCES qgep.vl_pump_placement_of_actuation (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_pump_placement_of_pump () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_pump_placement_of_pump ADD CONSTRAINT pkey_qgep_vl_pump_placement_of_pump PRIMARY KEY (code);
 INSERT INTO qgep.vl_pump_placement_of_pump (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (362,'horizontal','horizontal','horizontal', '', '', '', 'true');
 INSERT INTO qgep.vl_pump_placement_of_pump (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3071,'unknown','unbekannt','inconnu', '', '', '', 'true');
 INSERT INTO qgep.vl_pump_placement_of_pump (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (363,'vertical','vertikal','vertical', '', '', '', 'true');
 ALTER TABLE qgep.od_pump ADD CONSTRAINT fkey_vl_pump_placement_of_pump FOREIGN KEY (placement_of_pump)
 REFERENCES qgep.vl_pump_placement_of_pump (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_pump_usage_current () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_pump_usage_current ADD CONSTRAINT pkey_qgep_vl_pump_usage_current PRIMARY KEY (code);
 INSERT INTO qgep.vl_pump_usage_current (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6325,'other','andere','autres', '', '', '', 'true');
 INSERT INTO qgep.vl_pump_usage_current (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6202,'creek_water','Bachwasser','eaux_cours_d_eau', '', '', '', 'true');
 INSERT INTO qgep.vl_pump_usage_current (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6203,'discharged_combined_wastewater','entlastetes_Mischabwasser','eaux_mixtes_deversees', 'DCW', 'EW', 'EUD', 'true');
 INSERT INTO qgep.vl_pump_usage_current (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6204,'industrial_wastewater','Industrieabwasser','eaux_industrielles', '', 'CW', 'EUC', 'true');
 INSERT INTO qgep.vl_pump_usage_current (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6201,'combined_wastewater','Mischabwasser','eaux_mixtes', '', 'MW', 'EUM', 'true');
 INSERT INTO qgep.vl_pump_usage_current (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6205,'rain_wastewater','Regenabwasser','eaux_pluviales', '', 'RW', 'EUP', 'true');
 INSERT INTO qgep.vl_pump_usage_current (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6200,'clean_wastewater','Reinabwasser','eaux_claires', '', 'KW', 'EUR', 'true');
 INSERT INTO qgep.vl_pump_usage_current (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6206,'wastewater','Schmutzabwasser','eaux_usees', '', 'SW', 'EU', 'true');
 INSERT INTO qgep.vl_pump_usage_current (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (6326,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_pump ADD CONSTRAINT fkey_vl_pump_usage_current FOREIGN KEY (usage_current)
 REFERENCES qgep.vl_pump_usage_current (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_leapingweir ADD CONSTRAINT oorel_od_leapingweir_overflow FOREIGN KEY (obj_id) REFERENCES qgep.od_overflow(obj_id);
CREATE TABLE qgep.vl_leapingweir_opening_shape () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_leapingweir_opening_shape ADD CONSTRAINT pkey_qgep_vl_leapingweir_opening_shape PRIMARY KEY (code);
 INSERT INTO qgep.vl_leapingweir_opening_shape (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3581,'other','andere','autres', '', '', '', 'true');
 INSERT INTO qgep.vl_leapingweir_opening_shape (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3582,'circle','Kreis','circulaire', '', '', '', 'true');
 INSERT INTO qgep.vl_leapingweir_opening_shape (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3585,'parable','Parabel','parabolique', '', '', '', 'true');
 INSERT INTO qgep.vl_leapingweir_opening_shape (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3583,'rectangular','Rechteck','rectangulaire', '', '', '', 'true');
 INSERT INTO qgep.vl_leapingweir_opening_shape (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3584,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_leapingweir ADD CONSTRAINT fkey_vl_leapingweir_opening_shape FOREIGN KEY (opening_shape)
 REFERENCES qgep.vl_leapingweir_opening_shape (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_prank_weir ADD CONSTRAINT oorel_od_prank_weir_overflow FOREIGN KEY (obj_id) REFERENCES qgep.od_overflow(obj_id);
CREATE TABLE qgep.vl_prank_weir_weir_edge () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_prank_weir_weir_edge ADD CONSTRAINT pkey_qgep_vl_prank_weir_weir_edge PRIMARY KEY (code);
 INSERT INTO qgep.vl_prank_weir_weir_edge (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2995,'other','andere','autres', '', '', '', 'true');
 INSERT INTO qgep.vl_prank_weir_weir_edge (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (351,'rectangular','rechteckig','angulaire', '', '', '', 'true');
 INSERT INTO qgep.vl_prank_weir_weir_edge (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (350,'round','rund','arrondie', '', '', '', 'true');
 INSERT INTO qgep.vl_prank_weir_weir_edge (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (349,'sharp_edged','scharfkantig','arete_vive', '', '', '', 'true');
 INSERT INTO qgep.vl_prank_weir_weir_edge (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3014,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_prank_weir ADD CONSTRAINT fkey_vl_prank_weir_weir_edge FOREIGN KEY (weir_edge)
 REFERENCES qgep.vl_prank_weir_weir_edge (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_prank_weir_weir_kind () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_prank_weir_weir_kind ADD CONSTRAINT pkey_qgep_vl_prank_weir_weir_kind PRIMARY KEY (code);
 INSERT INTO qgep.vl_prank_weir_weir_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5772,'raised','hochgezogen','a_seuil_sureleve', '', '', '', 'true');
 INSERT INTO qgep.vl_prank_weir_weir_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5771,'low','niedrig','a_seuil_abaisse', '', '', '', 'true');
 ALTER TABLE qgep.od_prank_weir ADD CONSTRAINT fkey_vl_prank_weir_weir_kind FOREIGN KEY (weir_kind)
 REFERENCES qgep.vl_prank_weir_weir_kind (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_individual_surface ADD CONSTRAINT oorel_od_individual_surface_connection_object FOREIGN KEY (obj_id) REFERENCES qgep.od_connection_object(obj_id);
CREATE TABLE qgep.vl_individual_surface_function () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_individual_surface_function ADD CONSTRAINT pkey_qgep_vl_individual_surface_function PRIMARY KEY (code);
 INSERT INTO qgep.vl_individual_surface_function (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2979,'other','andere','autres', '', '', '', 'true');
 INSERT INTO qgep.vl_individual_surface_function (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3466,'railway_site','Bahnanlagen','installation_ferroviaire', '', '', '', 'true');
 INSERT INTO qgep.vl_individual_surface_function (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3461,'roof_industrial_or_commercial_building','DachflaecheIndustrieundGewerbebetriebe','surface_toits_bat_industriels_artisanaux', '', '', '', 'true');
 INSERT INTO qgep.vl_individual_surface_function (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3460,'roof_residential_or_office_building','DachflaecheWohnundBuerogebaeude','surface_toits_imm_habitation_administratifs', '', '', '', 'true');
 INSERT INTO qgep.vl_individual_surface_function (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3464,'access_or_collecting_road','Erschliessungs_Sammelstrassen','routes_de_desserte_et_collectives', '', '', '', 'true');
 INSERT INTO qgep.vl_individual_surface_function (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3467,'parking_lot','Parkplaetze','parkings', '', '', '', 'true');
 INSERT INTO qgep.vl_individual_surface_function (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3462,'transfer_site_or_stockyard','UmschlagundLagerplaetze','places_transbordement_entreposage', '', '', '', 'true');
 INSERT INTO qgep.vl_individual_surface_function (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3029,'unknown','unbekannt','inconnu', '', '', '', 'true');
 INSERT INTO qgep.vl_individual_surface_function (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3465,'connecting_or_principal_or_major_road','Verbindungs_Hauptverkehrs_Hochleistungsstrassen','routes_de_raccordement_principales_grand_trafic', '', '', '', 'true');
 INSERT INTO qgep.vl_individual_surface_function (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3463,'forecourt_and_access_road','VorplaetzeZufahrten','places_devant_entree_acces', '', '', '', 'true');
 ALTER TABLE qgep.od_individual_surface ADD CONSTRAINT fkey_vl_individual_surface_function FOREIGN KEY (function)
 REFERENCES qgep.vl_individual_surface_function (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_individual_surface_pavement () INHERITS (qgep.is_value_list_base);
ALTER TABLE qgep.vl_individual_surface_pavement ADD CONSTRAINT pkey_qgep_vl_individual_surface_pavement PRIMARY KEY (code);
 INSERT INTO qgep.vl_individual_surface_pavement (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2978,'other','andere','autres', '', '', '', 'true');
 INSERT INTO qgep.vl_individual_surface_pavement (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2031,'paved','befestigt','impermeabilise', '', '', '', 'true');
 INSERT INTO qgep.vl_individual_surface_pavement (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2032,'forested','bestockt','boise', '', '', '', 'true');
 INSERT INTO qgep.vl_individual_surface_pavement (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2033,'soil_covered','humusiert','couverture_vegetale', '', '', '', 'true');
 INSERT INTO qgep.vl_individual_surface_pavement (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3030,'unknown','unbekannt','inconnu', '', '', '', 'true');
 INSERT INTO qgep.vl_individual_surface_pavement (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (2034,'barren','vegetationslos','sans_vegetation', '', '', '', 'true');
 ALTER TABLE qgep.od_individual_surface ADD CONSTRAINT fkey_vl_individual_surface_pavement FOREIGN KEY (pavement)
 REFERENCES qgep.vl_individual_surface_pavement (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_building ADD CONSTRAINT oorel_od_building_connection_object FOREIGN KEY (obj_id) REFERENCES qgep.od_connection_object(obj_id);
ALTER TABLE qgep.od_reservoir ADD CONSTRAINT oorel_od_reservoir_connection_object FOREIGN KEY (obj_id) REFERENCES qgep.od_connection_object(obj_id);
ALTER TABLE qgep.od_fountain ADD CONSTRAINT oorel_od_fountain_connection_object FOREIGN KEY (obj_id) REFERENCES qgep.od_connection_object(obj_id);
-------
COMMIT;
