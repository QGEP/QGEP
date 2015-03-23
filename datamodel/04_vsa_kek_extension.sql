------ This file generates the VSA-DSS database (Modul VSA-KEK) in en on QQIS
------ For questions etc. please contact Stefan Burckhardt stefan.burckhardt@sjib.ch
------ version 19.07.2013 21:17:12
BEGIN;
-------
CREATE TABLE qgep.od_data_media
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_data_media_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_data_media_obj_id ON qgep.od_data_media USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_data_media_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_data_media ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_data_media');
COMMENT ON COLUMN qgep.od_data_media.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_data_media ADD COLUMN identifier  varchar(40) ;
 CREATE UNIQUE INDEX in_od_data_media_identifier ON qgep.od_data_media USING btree (identifier);
COMMENT ON COLUMN qgep.od_data_media.identifier IS 'yyy_Name des Datenträgers. Bei elektronischen Datenträgern normalerweise das Volume-Label. Bei einem Server der Servername. Bei analogen Videobändern die Bandnummer. / Name des Datenträgers. Bei elektronischen Datenträgern normalerweise das Volume-Label. ';
 ALTER TABLE qgep.od_data_media ADD COLUMN kind  integer ;
COMMENT ON COLUMN qgep.od_data_media.kind IS 'yyy_Beschreibt die Art des Datenträgers / Beschreibt die Art des Datenträgers / Décrit le genre de support de données';
 ALTER TABLE qgep.od_data_media ADD COLUMN location  varchar(50) ;
COMMENT ON COLUMN qgep.od_data_media.location IS 'Where is the / Wo befindet sich der Datenträger / Où se trouve le support de données';
 ALTER TABLE qgep.od_data_media ADD COLUMN path  varchar(100) ;
COMMENT ON COLUMN qgep.od_data_media.path IS 'yyy_Zugriffspfad zum Datenträger. z.B. DVD-Laufwerk -> D: , Server -> \\server\videos, Harddisk -> c:\videos . Kann auch eine URL sein. Bei einem analogen Videoband leer / Zugriffspfad zum Datenträger. z.B. DVD-Laufwerk -> D: , Server -> \\server\videos, ';
 ALTER TABLE qgep.od_data_media ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_data_media.remark IS 'General remarks / Bemerkungen zum Datenträger / Remarques concernant le support de données';
 ALTER TABLE qgep.od_data_media ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_data_media.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_data_media ADD COLUMN dataowner varchar(80) ;
COMMENT ON COLUMN qgep.od_data_media.dataowner IS 'Metaattribute dataowner - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Maître des données gestionnaire de données, qui est la personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_data_media ADD COLUMN provider varchar(80) ;
COMMENT ON COLUMN qgep.od_data_media.provider IS 'Metaattribute provider - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / FOURNISSEUR DES DONNEES xxx ';
-------
CREATE TABLE qgep.od_file
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_file_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_file_obj_id ON qgep.od_file USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_file_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_file ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_file');
COMMENT ON COLUMN qgep.od_file.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_file ADD COLUMN class  integer ;
COMMENT ON COLUMN qgep.od_file.class IS 'yyy_Gibt an, zu welcher Klasse des VSA-DSS-Datenmodells die Datei gehört. Grundsätzlich alle Klassen möglich. Im Rahmen der Kanalfernsehaufnahmen hauptsächlich Kanal, Normschachtschaden, Kanalschaden und Untersuchung. / Gibt an, zu welcher Klasse des VSA-';
 ALTER TABLE qgep.od_file ADD COLUMN identifier  varchar(40) ;
 CREATE UNIQUE INDEX in_od_file_identifier ON qgep.od_file USING btree (identifier);
COMMENT ON COLUMN qgep.od_file.identifier IS 'yyy_Name der Datei mit Dateiendung. Z.B video_01.mpg oder haltung_01.ipf / Name der Datei mit Dateiendung. Z.B video_01.mpg oder haltung_01.ipf / Nom du fichier avec terminaison du fichier. P. ex. video_01.mpg ou canalisation_01.ipf';
 ALTER TABLE qgep.od_file ADD COLUMN kind  integer ;
COMMENT ON COLUMN qgep.od_file.kind IS 'yyy_Beschreibt die Art der Datei. Für analoge Videos auf Bändern ist der Typ "Video" einzusetzen. Die Bezeichnung wird dann gleich gesetzt wie die Bezeichnung des Videobandes. / Beschreibt die Art der Datei. Für analoge Videos auf Bändern ist der Typ "Vid';
 ALTER TABLE qgep.od_file ADD COLUMN object  varchar(20) ;
COMMENT ON COLUMN qgep.od_file.object IS 'yyy_Objekt-ID (OBJ_ID) des Datensatzes zu dem die Datei gehört / Objekt-ID (OBJ_ID) des Datensatzes zu dem die Datei gehört / Identification de l’ensemble de données auquel le fichier appartient (OBJ_ID)';
 ALTER TABLE qgep.od_file ADD COLUMN relativ_path  varchar(200) ;
COMMENT ON COLUMN qgep.od_file.relativ_path IS 'yyy_Zusätzlicher Relativer Pfad, wo die Datei auf dem Datenträger zu finden ist. Z.B. DVD_01. / Zusätzlicher Relativer Pfad, wo die Datei auf dem Datenträger zu finden ist. Z.B. DVD_01. / Accès relatif supplémentaire à l’emplacement du fichier sur le supp';
 ALTER TABLE qgep.od_file ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_file.remark IS 'General remarks / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_file ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_file.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_file ADD COLUMN dataowner varchar(80) ;
COMMENT ON COLUMN qgep.od_file.dataowner IS 'Metaattribute dataowner - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Maître des données gestionnaire de données, qui est la personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_file ADD COLUMN provider varchar(80) ;
COMMENT ON COLUMN qgep.od_file.provider IS 'Metaattribute provider - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / FOURNISSEUR DES DONNEES xxx ';
-------
CREATE TABLE qgep.od_damage
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_damage_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_damage_obj_id ON qgep.od_damage USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_damage_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_damage ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_damage');
COMMENT ON COLUMN qgep.od_damage.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_damage ADD COLUMN comments  varchar(100) ;
COMMENT ON COLUMN qgep.od_damage.comments IS 'yyy_Freie Bemerkungen zu einer Feststellung / Freie Bemerkungen zu einer Feststellung / Remarques libres concernant une observation';
 ALTER TABLE qgep.od_damage ADD COLUMN single_damage_class  integer ;
COMMENT ON COLUMN qgep.od_damage.single_damage_class IS 'yyy_Definiert die Schadensklasse eines Einzelschadens. Die Einteilung in die Zustandsklassen erfolgt aufgrund des Schadenbilds und des Schadensausmasses. Dabei kann ein Abwasserbauwerk direkt einer Klasse zugeteilt werden oder zuerst jeder Schaden einzeln';
 ALTER TABLE qgep.od_damage ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_damage.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_damage ADD COLUMN dataowner varchar(80) ;
COMMENT ON COLUMN qgep.od_damage.dataowner IS 'Metaattribute dataowner - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Maître des données gestionnaire de données, qui est la personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_damage ADD COLUMN provider varchar(80) ;
COMMENT ON COLUMN qgep.od_damage.provider IS 'Metaattribute provider - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / FOURNISSEUR DES DONNEES xxx ';
-------
CREATE TABLE qgep.od_examination
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_examination_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_examination_obj_id ON qgep.od_examination USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_examination_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_examination ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_examination');
COMMENT ON COLUMN qgep.od_examination.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_examination ADD COLUMN equipment  varchar(50) ;
COMMENT ON COLUMN qgep.od_examination.equipment IS 'Name of used camera / Eingesetztes Aufnahmegeräte (Kamera) / Appareil de prise de vues (caméra) employé';
 ALTER TABLE qgep.od_examination ADD COLUMN topointidentifier  varchar(20) ;
COMMENT ON COLUMN qgep.od_examination.topointidentifier IS 'yyy_Bezeichnung des "bis Punktes" einer Untersuchung, so wie sie auf dem Plan erscheint. Alternative zum Foreign key Abwasserbauwerk, wenn Topologie noch nicht definiert ist (Ersterfassung). Die vonPunktBezeichnung wird später vom Hydrauliker für den Aufb';
 ALTER TABLE qgep.od_examination ADD COLUMN frompointidentifier  varchar(20) ;
COMMENT ON COLUMN qgep.od_examination.frompointidentifier IS 'yyy_Bezeichnung des "von Punktes" einer Untersuchung, so wie sie auf dem Plan erscheint. Alternative zum Foreign key Haltungspunkt, wenn Topologie noch nicht definiert ist (Ersterfassung). Die vonPunktBezeichnung wird später vom Hydrauliker für den Aufbau';
 ALTER TABLE qgep.od_examination ADD COLUMN inspected_lenght  decimal(5,2) ;
COMMENT ON COLUMN qgep.od_examination.inspected_lenght IS 'yyy_Total untersuchte Länge in Metern mit zwei Nachkommastellen / Total untersuchte Länge in Metern mit zwei Nachkommastellen / Longueur totale examinée en mètres avec deux chiffres après la virgule';
 ALTER TABLE qgep.od_examination ADD COLUMN operator  varchar(50) ;
COMMENT ON COLUMN qgep.od_examination.operator IS 'name of / Name des Operateurs / Nom de l’opérateur';
 ALTER TABLE qgep.od_examination ADD COLUMN recording_type  integer ;
COMMENT ON COLUMN qgep.od_examination.recording_type IS 'yyy_Aufnahmetechnik, beschreibt die Art der Aufnahme / Aufnahmetechnik, beschreibt die Art der Aufnahme / Technique de prise de vues, décrit le type de prise de vues';
 ALTER TABLE qgep.od_examination ADD COLUMN vehicle  varchar(50) ;
COMMENT ON COLUMN qgep.od_examination.vehicle IS 'yyy_Eingesetztes Inspektionsfahrzeug / Eingesetztes Inspektionsfahrzeug / Véhicule d’inspection employé';
 ALTER TABLE qgep.od_examination ADD COLUMN videonumber  varchar(20) ;
COMMENT ON COLUMN qgep.od_examination.videonumber IS 'yyy_Bei Videobändern steht hier die Bandnummer (z.B. 1/99). Bei elektronischen Datenträgern ist dies die Datenträgerbezeichnung (z.B. SG001). Falls pro Untersuchung eine einzelne Datei zur Verfügung steht, dann wird diese aus der Klasse Datei referenziert';
 ALTER TABLE qgep.od_examination ADD COLUMN weather  integer ;
COMMENT ON COLUMN qgep.od_examination.weather IS 'Wheather conditions during inspection / Wetterverhältnisse während der Inspektion / Conditions météorologiques pendant l’inspection';
-------
CREATE TABLE qgep.od_damage_manhole
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_damage_manhole_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_damage_manhole_obj_id ON qgep.od_damage_manhole USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_damage_manhole_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_damage_manhole ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_damage_manhole');
COMMENT ON COLUMN qgep.od_damage_manhole.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_damage_manhole ADD COLUMN connection  integer ;
COMMENT ON COLUMN qgep.od_damage_manhole.connection IS 'yyy_Feststellung bei zwei aneinandergrenzenden Schachtelementen gemäss 3.1.7). Entspricht in SN EN 13508 ja = "A", nein = leer / Feststellung bei zwei aneinandergrenzenden Schachtelementen gemäss 3.1.7). Entspricht in SN EN 13508 ja = "A", nein = leer / O';
 ALTER TABLE qgep.od_damage_manhole ADD COLUMN damage_code_manhole  integer ;
COMMENT ON COLUMN qgep.od_damage_manhole.damage_code_manhole IS 'yyy_Vorgegebener Wertebereich: Gültiger Code auf der Grundlage von SN EN 13508-2. Alle gültigen Codes sind in Kapitel 3 der Richtlinie "Schadencodierung" abschliessend aufgeführt. / Vorgegebener Wertebereich: Gültiger Code auf der Grundlage von SN EN 1350';
 ALTER TABLE qgep.od_damage_manhole ADD COLUMN damage_reach  varchar(3) ;
COMMENT ON COLUMN qgep.od_damage_manhole.damage_reach IS 'yyy_Codes für den Anfang und das Ende eines Streckenschadens. Genaue Angaben unter 3.1.2 / Codes für den Anfang und das Ende eines Streckenschadens. Genaue Angaben unter 3.1.2 / Codes pour le début et la fin d’un dommage à un tronçon. Indica-tions exactes';
 ALTER TABLE qgep.od_damage_manhole ADD COLUMN dammage_begin  smallint ;
COMMENT ON COLUMN qgep.od_damage_manhole.dammage_begin IS 'yyy_Lage am Umfang: Beginn des Schadens. Werte und Vorgehen sind unter Absatz 3.1.6 genau beschrieben. / Lage am Umfang: Beginn des Schadens. Werte und Vorgehen sind unter Absatz 3.1.6 genau beschrieben. / Emplacement circonférentiel: Début du dommage. Va';
 ALTER TABLE qgep.od_damage_manhole ADD COLUMN dammage_end  smallint ;
COMMENT ON COLUMN qgep.od_damage_manhole.dammage_end IS 'yyy_Lage am Umfang: Ende des Schadens. Werte und Vorgehen sind unter Absatz 3.1.6 genau beschrieben. / Lage am Umfang: Ende des Schadens. Werte und Vorgehen sind unter Absatz 3.1.6 genau beschrieben. / Emplacement circonférentiel: Fin du dommage. Valeurs ';
 ALTER TABLE qgep.od_damage_manhole ADD COLUMN distance  decimal(5,2) ;
COMMENT ON COLUMN qgep.od_damage_manhole.distance IS 'yyy_Länge ab Oberkante Deckel bis zur Feststellung (siehe Absatz 3.1.1) in m mit zwei Nachkommastellen. / Länge ab Oberkante Deckel bis zur Feststellung (siehe Absatz 3.1.1) in m mit zwei Nachkommastellen. / Longueur entre le bord supérieur du couvercle e';
 ALTER TABLE qgep.od_damage_manhole ADD COLUMN quantification1  varchar(20) ;
COMMENT ON COLUMN qgep.od_damage_manhole.quantification1 IS 'yyy_Quantifizierung 1 gemäss SN EN 13508. Zulässige Eingaben sind in Kapitel 3.1.5 beschrieben. Als Textattribut umgesetzt. / Quantifizierung 1 gemäss SN EN 13508. Zulässige Eingaben sind in Kapitel 3.1.5 beschrieben. Als Textattribut umgesetzt. / Quantif';
 ALTER TABLE qgep.od_damage_manhole ADD COLUMN quantification2  varchar(20) ;
COMMENT ON COLUMN qgep.od_damage_manhole.quantification2 IS 'yyy_Quantifizierung 2 gemäss SN EN 13508. Zulässige Eingaben sind in Kapitel 3.1.5 beschrieben. Als Textattribut umgesetzt. / Quantifizierung 2 gemäss SN EN 13508. Zulässige Eingaben sind in Kapitel 3.1.5 beschrieben. Als Textattribut umgesetzt. / Quantif';
 ALTER TABLE qgep.od_damage_manhole ADD COLUMN video_counter  varchar(11) ;
COMMENT ON COLUMN qgep.od_damage_manhole.video_counter IS 'yyy_Zählerstand auf einem analogen Videoband oder in einer digitalen Videodatei, in Echtzeit / Zählerstand auf einem analogen Videoband oder in einer digitalen Videodatei, in Echtzeit / Relevé du compteur sur une bande vidéo analogique ou dans un fichier ';
 ALTER TABLE qgep.od_damage_manhole ADD COLUMN view_parameters  varchar(200) ;
COMMENT ON COLUMN qgep.od_damage_manhole.view_parameters IS 'yyy_Spezielle Ansichtsparameter für die Positionierung innerhalb einer Filmdatei für Scanner- oder digitale Videotechnik / Spezielle Ansichtsparameter für die Positionierung innerhalb einer Filmdatei für Scanner- oder digitale Videotechnik / Paramètres de';
 ALTER TABLE qgep.od_damage_manhole ADD COLUMN yyy_manhole_schachtbereich  integer ;
COMMENT ON COLUMN qgep.od_damage_manhole.yyy_manhole_schachtbereich IS 'yyy_Bereich in dem eine Feststellung auftritt. Die Werte sind unter 3.1.9 abschliessend beschrieben. / Bereich in dem eine Feststellung auftritt. Die Werte sind unter 3.1.9 abschliessend beschrieben. / Domaine où une observation est faite. Les valeurs son';
-------
CREATE TABLE qgep.od_damage_channel
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_damage_channel_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE INDEX in_od_damage_channel_obj_id ON qgep.od_damage_channel USING btree (obj_id);
CREATE SEQUENCE qgep.seq_od_damage_channel_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.od_damage_channel ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('od_damage_channel');
COMMENT ON COLUMN qgep.od_damage_channel.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_damage_channel ADD COLUMN channel_damage_code  integer ;
COMMENT ON COLUMN qgep.od_damage_channel.channel_damage_code IS 'yyy_Vorgegebener Wertebereich: Gültiger Code auf der Grundlage von SN EN 13508-2. Alle gültigen Codes sind in Kapitel 2 der Richtlinie "Schadencodierung" abschliessend aufgeführt. / Vorgegebener Wertebereich: Gültiger Code auf der Grundlage von SN EN 1350';
 ALTER TABLE qgep.od_damage_channel ADD COLUMN connection  integer ;
COMMENT ON COLUMN qgep.od_damage_channel.connection IS 'yyy_Kennzeichen für eine Feststellung an einer Rohrverbindung (2.1.7). Entspricht in SN EN 13508 ja = "A", nein = leer. / Kennzeichen für eine Feststellung an einer Rohrverbindung (2.1.7). Entspricht in SN EN 13508 ja = "A", nein = leer. / Indication d’un';
 ALTER TABLE qgep.od_damage_channel ADD COLUMN damage_begin  smallint ;
COMMENT ON COLUMN qgep.od_damage_channel.damage_begin IS 'yyy_Lage am Umfang: Ende des Schadens. Werte und Vorgehen sind in Absatz 2.1.6 genau beschrieben / Lage am Umfang: Beginn des Schadens. Werte und Vorgehen sind in Absatz 2.1.6 genau beschrieben. / Emplacement circonférentiel: Début du dommage. Valeurs et ';
 ALTER TABLE qgep.od_damage_channel ADD COLUMN damage_reach  varchar(3) ;
COMMENT ON COLUMN qgep.od_damage_channel.damage_reach IS 'yyy_Codes für den Anfang und das Ende eines Streckenschadens. Genaue Angaben unter 2.1.2 / Codes für den Anfang und das Ende eines Streckenschadens. Genaue Angaben unter 2.1.2 / Codes pour le début et la fin d’un dommage à un tronçon. Indications exactes ';
 ALTER TABLE qgep.od_damage_channel ADD COLUMN dammage_end  smallint ;
COMMENT ON COLUMN qgep.od_damage_channel.dammage_end IS 'yyy_Lage am Umfang: Ende des Schadens. Werte und Vorgehen sind in Absatz 2.1.6 genau beschrieben / Lage am Umfang: Ende des Schadens. Werte und Vorgehen sind in Absatz 2.1.6 genau beschrieben / Emplacement circonférentiel: Fin du dommage. Valeurs et procé';
 ALTER TABLE qgep.od_damage_channel ADD COLUMN distance  decimal(5,2) ;
COMMENT ON COLUMN qgep.od_damage_channel.distance IS 'yyy_Länge von Rohranfang bis zur Feststellung (siehe Richtlinie Optische Inspektion von Entwässerungsanlagen: Schadencodierung und Datentransfer, Absatz 2.1.1) in m mit zwei Nachkommastellen / Länge von Rohranfang bis zur Feststellung (siehe Richtlinie Op';
 ALTER TABLE qgep.od_damage_channel ADD COLUMN quantification1  integer ;
COMMENT ON COLUMN qgep.od_damage_channel.quantification1 IS 'yyy_Quantifizierung 1 gemäss SN EN 13508-2. Zulässige Eingaben sind in Kapitel 2.3 - 0 beschrieben / Quantifizierung 1 gemäss SN EN 13508-2. Zulässige Eingaben sind in Kapitel 2.3 - 0 beschrieben / Quantification 1 selon la SN EN 13508-2. Les entrées auto';
 ALTER TABLE qgep.od_damage_channel ADD COLUMN quantification2  integer ;
COMMENT ON COLUMN qgep.od_damage_channel.quantification2 IS 'yyy_Quantifizierung 2 gemäss SN EN 13508. Zulässige Eingaben sind in Kapitel 2.3 - 2.6  beschrieben / Quantifizierung 2 gemäss SN EN 13508. Zulässige Eingaben sind in Kapitel 2.3 - 2.6  beschrieben / Quantification 2 selon la SN EN 13508. Les entrées auto';
 ALTER TABLE qgep.od_damage_channel ADD COLUMN video_counter  varchar(11) ;
COMMENT ON COLUMN qgep.od_damage_channel.video_counter IS 'yyy_Zählerstand auf einem analogen Videoband oder in einer digitalen Videodatei, in Echtzeit (siehe auch 2.1.9). / Zählerstand auf einem analogen Videoband oder in einer digitalen Videodatei, in Echtzeit (siehe auch 2.1.9). / Relevé du compteur sur une ba';
 ALTER TABLE qgep.od_damage_channel ADD COLUMN view_parameters  varchar(200) ;
COMMENT ON COLUMN qgep.od_damage_channel.view_parameters IS 'yyy_Spezielle Ansichtsparameter für die Positionierung innerhalb einer Filmdatei für Scanner- oder digitale Videotechnik / Spezielle Ansichtsparameter für die Positionierung innerhalb einer Filmdatei für Scanner- oder digitale Videotechnik / Paramètres de';
------------ Relationships and Value Tables ----------- 
CREATE TABLE qgep.vl_data_media_kind
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
abbr_en character varying(3),
abbr_de character varying(3),
abbr_fr character varying(3),
active boolean,
CONSTRAINT pkey_qgep_vl_data_media_kind_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_data_media_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3784,'other','andere','autre', '', '', '', 'true');
 INSERT INTO qgep.vl_data_media_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3785,'CD','CD','CD', '', '', '', 'true');
 INSERT INTO qgep.vl_data_media_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3786,'floppy_disc','Diskette','disquette', '', '', '', 'true');
 INSERT INTO qgep.vl_data_media_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3787,'dvd','DVD','DVD', '', '', '', 'true');
 INSERT INTO qgep.vl_data_media_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3788,'harddisc','Festplatte','disque_dur', '', '', '', 'true');
 INSERT INTO qgep.vl_data_media_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3789,'server','Server','serveur', '', '', '', 'true');
 INSERT INTO qgep.vl_data_media_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3790,'videotape','Videoband','bande_video', '', '', '', 'true');
 ALTER TABLE qgep.od_data_media ADD CONSTRAINT fkey_vl_data_media_kind FOREIGN KEY (kind)
 REFERENCES qgep.vl_data_media_kind (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_file_class
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
abbr_en character varying(3),
abbr_de character varying(3),
abbr_fr character varying(3),
active boolean,
CONSTRAINT pkey_qgep_vl_file_class_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3800,'throttle_shut_off_unit','Absperr_Drosselorgan','LIMITEUR_DEBIT', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3801,'wastewater_structure','Abwasserbauwerk','OUVRAGE_RESEAU_AS', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3802,'waster_water_treatment','Abwasserbehandlung','TRAITEMENT_EAUX_USEES', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3803,'wastewater_node','Abwasserknoten','NOEUD_RESEAU', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3804,'wastewater_networkelement','Abwassernetzelement','ELEMENT_RESEAU_EVACUATION', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3805,'waste_water_treatment_plant','Abwasserreinigungsanlage','STATION_EPURATION', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3806,'waste_water_association','Abwasserverband','ASSOCIATION_EPURATION_EAU', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3807,'administrative_office','Amt','OFFICE', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3808,'connection_object','Anschlussobjekt','OBJET_RACCORDE', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3809,'WWTP_structure','ARABauwerk','OUVRAGES_STEP', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3810,'WWTP_energy_use','ARAEnergienutzung','CONSOMMATION_ENERGIE_STEP', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3811,'bathing_area','Badestelle','LIEU_BAIGNADE', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3812,'benching','Bankett','BANQUETTE', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3813,'structure_part','BauwerksTeil','ELEMENT_OUVRAGE', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3814,'well','Brunnen','FONTAINE', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3815,'file','Datei','FICHIER', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3816,'data_media','Datentraeger','SUPPORT_DONNEES', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3817,'cover','Deckel','COUVERCLE', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3818,'passage','Durchlass','PASSAGE_SOUS_TUYAU', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (5083,'discharge_point','Einleitstelle','exutoire', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3819,'access_aid','Einstiegshilfe','DISPOSITIF_ACCES', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3820,'individual_surface','Einzelflaeche','SURFACE_INDIVIDUELLE', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3821,'catchment_area','Einzugsgebiet','BASSIN_VERSANT', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3822,'electric_equipment','ElektrischeEinrichtung','EQUIPEMENT_ELECTRIQUE', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3823,'electromechanical_equipment','ElektromechanischeAusruestung','EQUIPEMENT_ELECTROMECA', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3824,'drainage_system','Entwaesserungssystem','systeme_evacuation_eaux', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3825,'maintenance_event','Erhaltungsereignis','EVENEMENT_MAINTENANCE', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3826,'fish_pass','Fischpass','ECHELLE_POISSONS', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3827,'river','Fliessgewaesser','COURS_EAU', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3828,'pump','FoerderAggregat','INSTALLATION_REFOULEMENT', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3829,'ford','Furt','PASSAGE_A_GUE', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3830,'building','Gebaeude','BATIMENT', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3831,'hazard_source','Gefahrenquelle','SOURCE_DANGER', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3832,'municipality','Gemeinde','COMMUNE', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3833,'blocking_debris','Geschiebesperre','BARRAGE_ALLUVIONS', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3834,'water_course_segment','Gewaesserabschnitt','TRONCON_COURS_EAU', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3835,'chute','GewaesserAbsturz','SEUIL', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3836,'water_body_protection_sector','Gewaesserschutzbereich','SECTEUR_PROTECTION_EAUX', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3837,'sector_water_body','Gewaessersektor','SECTEUR_EAUX_SUP', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3838,'river_bed','Gewaessersohle','FOND_COURS_EAU', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3839,'water_control_structure','Gewaesserverbauung','AMENAGEMENT_COURS_EAU', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3840,'dam','GewaesserWehr','OUVRAGE_RETENUE', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3841,'aquifier','Grundwasserleiter','AQUIFERE', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3842,'ground_water_protection_perimeter','Grundwasserschutzareal','PERIMETRE_PROT_EAUX_SOUT', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3843,'groundwater_protection_zone','Grundwasserschutzzone','zone_prot_eaux_sout', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3844,'reach','Haltung','TRONCON', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3845,'reach_point','Haltungspunkt','POINT_TRONCON', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3846,'hq_relation','HQ_Relation','RELATION_HQ', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3847,'hydr_geometry','Hydr_Geometrie','GEOMETRIE_HYDR', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3848,'hydr_geom_relation','Hydr_GeomRelation','RELATION_GEOM_HYDR', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3849,'channel','Kanal','CANALISATION', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3850,'damage_channel','Kanalschaden','DOMMAGE_AUX_CANALISATIONS', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3851,'canton','Kanton','CANTON', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3852,'leapingweir','Leapingwehr','LEAPING_WEIR', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3853,'mechanical_pretreatment','MechanischeVorreinigung','PRETRAITEMENT_MECANIQUE', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3854,'measurement_device','Messgeraet','APPAREIL_MESURE', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3855,'measurement_series','Messreihe','SERIE_MESURES', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3856,'measurement_result','Messresultat','RESULTAT_MESURE', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3857,'measuring_point','Messstelle','STATION_MESURE', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3858,'manhole','Normschacht','CHAMBRE_STANDARD', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3859,'damage_manhole','Normschachtschaden','DOMMAGE_CHAMBRE_STANDARD', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3861,'surface_runoff_parameters','Oberflaechenabflussparameter','PARAM_ECOULEMENT_SUP', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3862,'surface_water_bodies','Oberflaechengewaesser','EAUX_SUPERFICIELLES', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3863,'organisation','Organisation','ORGANISATION', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3864,'planning_zone','Planungszone','zone_reservee', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3865,'privat','Privat','PRIVE', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3866,'cleaning_device','Reinigungseinrichtung','DISPOSITIF_NETTOYAGE', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3867,'reservoir','Reservoir','RESERVOIR', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3868,'retention_body','Retentionskoerper','volume_retention', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3869,'pipe_profile','Rohrprofil','PROFIL_TUYAU', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3870,'profile_geometry','Rohrprofil_Geometrie','PROFIL_TUYAU_GEOM', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3871,'damage','Schaden','DOMMAGE', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3872,'sludge_treatment','Schlammbehandlung','TRAITEMENT_BOUES', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3873,'lock','Schleuse','ECLUSE', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3874,'lake','See','LAC', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3875,'rock_ramp','Sohlrampe','RAMPE', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3876,'special_structure','Spezialbauwerk','OUVRAGE_SPECIAL', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3877,'control_center','Steuerungszentrale','CENTRALE_COMMANDE', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3878,'substance','Stoff','SUBSTANCE', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3879,'prank_weir','Streichwehr','DEVERSOIR_LATERAL', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3880,'dryweather_downspout','Trockenwetterfallrohr','TUYAU_CHUTE', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3881,'dryweather_flume','Trockenwetterrinne','CUNETTE_DEBIT_TEMPS_SEC', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3882,'overflow','Ueberlauf','DEVERSOIR', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3883,'overflow_characteristic','Ueberlaufcharakteristik','CARACTERISTIQUES_DEVERSOIR', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3884,'shore','Ufer','RIVE', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3885,'accident','Unfall','ACCIDENT', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3886,'examination','Untersuchung','EXAMEN', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3887,'infiltration_installation','Versickerungsanlage','INSTALLATION_INFILTRATION', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3888,'infiltration_zone','Versickerungsbereich','zone_infiltration', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3890,'water_catchment','Wasserfassung','CAPTAGE', '', '', '', 'true');
 INSERT INTO qgep.vl_file_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3891,'zone','Zone','zone', '', '', '', 'true');
 ALTER TABLE qgep.od_file ADD CONSTRAINT fkey_vl_file_class FOREIGN KEY (class)
 REFERENCES qgep.vl_file_class (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_file_kind
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
abbr_en character varying(3),
abbr_de character varying(3),
abbr_fr character varying(3),
active boolean,
CONSTRAINT pkey_qgep_vl_file_kind_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_file_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3770,'other','andere','autre', '', '', '', 'true');
 INSERT INTO qgep.vl_file_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3771,'digital_vidoe','digitalesVideo','video_numerique', '', '', '', 'true');
 INSERT INTO qgep.vl_file_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3772,'photo','Foto','photo', '', '', '', 'true');
 INSERT INTO qgep.vl_file_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3773,'panoramo_film','Panoramofilm','film_panoramique', '', '', '', 'true');
 INSERT INTO qgep.vl_file_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3774,'textfile','Textdatei','fichier_texte', '', '', '', 'true');
 INSERT INTO qgep.vl_file_kind (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3775,'video','Video','video', '', '', '', 'true');
 ALTER TABLE qgep.od_file ADD CONSTRAINT fkey_vl_file_kind FOREIGN KEY (kind)
 REFERENCES qgep.vl_file_kind (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_file ADD COLUMN fs_yyy_datentraeger varchar (16);
ALTER TABLE qgep.od_file ADD CONSTRAINT rel_file_yyy_datentraeger FOREIGN KEY (fs_yyy_datentraeger) REFERENCES qgep.od_data_media(obj_id);
CREATE TABLE qgep.vl_damage_single_damage_class
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
abbr_en character varying(3),
abbr_de character varying(3),
abbr_fr character varying(3),
active boolean,
CONSTRAINT pkey_qgep_vl_damage_single_damage_class_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_damage_single_damage_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3707,'EZ0','EZ0','EZ0', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_single_damage_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3708,'EZ1','EZ1','EZ1', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_single_damage_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3709,'EZ2','EZ2','EZ2', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_single_damage_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3710,'EZ3','EZ3','EZ3', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_single_damage_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3711,'EZ4','EZ4','EZ4', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_single_damage_class (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4561,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_damage ADD CONSTRAINT fkey_vl_damage_single_damage_class FOREIGN KEY (single_damage_class)
 REFERENCES qgep.vl_damage_single_damage_class (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_damage ADD COLUMN fs_examination varchar (16);
ALTER TABLE qgep.od_damage ADD CONSTRAINT rel_damage_examination FOREIGN KEY (fs_examination) REFERENCES qgep.od_examination(obj_id);
ALTER TABLE qgep.od_examination ADD CONSTRAINT oorel_od_examination_maintenance_event FOREIGN KEY (obj_id) REFERENCES qgep.od_maintenance_event(obj_id);
CREATE TABLE qgep.vl_examination_recording_type
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
abbr_en character varying(3),
abbr_de character varying(3),
abbr_fr character varying(3),
active boolean,
CONSTRAINT pkey_qgep_vl_examination_recording_type_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_examination_recording_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3681,'other','andere','autre', '', '', '', 'true');
 INSERT INTO qgep.vl_examination_recording_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3682,'field_visit','Begehung','parcours', '', '', '', 'true');
 INSERT INTO qgep.vl_examination_recording_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3683,'yyy_Deformationsmessung','Deformationsmessung','mesure_deformation', '', '', '', 'true');
 INSERT INTO qgep.vl_examination_recording_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3684,'yyy_Dichtheitspruefung','Dichtheitspruefung','examen_etancheite', '', '', '', 'true');
 INSERT INTO qgep.vl_examination_recording_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3685,'georadar','Georadar','georadar', '', '', '', 'true');
 INSERT INTO qgep.vl_examination_recording_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3686,'channel_TV','Kanalfernsehen','camera_canalisations', '', '', '', 'true');
 INSERT INTO qgep.vl_examination_recording_type (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3687,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_examination ADD CONSTRAINT fkey_vl_examination_recording_type FOREIGN KEY (recording_type)
 REFERENCES qgep.vl_examination_recording_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_examination_weather
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
abbr_en character varying(3),
abbr_de character varying(3),
abbr_fr character varying(3),
active boolean,
CONSTRAINT pkey_qgep_vl_examination_weather_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_examination_weather (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3699,'covered_rainy','bedeckt_regnerisch','couvert_pluvieux', '', '', '', 'true');
 INSERT INTO qgep.vl_examination_weather (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3700,'yyy_Nieselregen','Nieselregen','bruine', '', '', '', 'true');
 INSERT INTO qgep.vl_examination_weather (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3701,'rain','Regen','pluie', '', '', '', 'true');
 INSERT INTO qgep.vl_examination_weather (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3702,'snowfall','Schneefall','chute_neige', '', '', '', 'true');
 INSERT INTO qgep.vl_examination_weather (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3703,'nice_dry','schoen_trocken','beau_sec', '', '', '', 'true');
 INSERT INTO qgep.vl_examination_weather (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3704,'unknown','unbekannt','inconnu', '', '', '', 'true');
 ALTER TABLE qgep.od_examination ADD CONSTRAINT fkey_vl_examination_weather FOREIGN KEY (weather)
 REFERENCES qgep.vl_examination_weather (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_examination ADD COLUMN fs_reach_point varchar (16);
ALTER TABLE qgep.od_examination ADD CONSTRAINT rel_examination_reach_point FOREIGN KEY (fs_reach_point) REFERENCES qgep.od_reach_point(obj_id);
ALTER TABLE qgep.od_damage_manhole ADD CONSTRAINT oorel_od_damage_manhole_damage FOREIGN KEY (obj_id) REFERENCES qgep.od_damage(obj_id);
CREATE TABLE qgep.vl_damage_manhole_connection
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
abbr_en character varying(3),
abbr_de character varying(3),
abbr_fr character varying(3),
active boolean,
CONSTRAINT pkey_qgep_vl_damage_manhole_connection_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_damage_manhole_connection (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3740,'yes','ja','oui', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_connection (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3741,'no','nein','non', '', '', '', 'true');
 ALTER TABLE qgep.od_damage_manhole ADD CONSTRAINT fkey_vl_damage_manhole_connection FOREIGN KEY (connection)
 REFERENCES qgep.vl_damage_manhole_connection (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_damage_manhole_damage_code_manhole
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
abbr_en character varying(3),
abbr_de character varying(3),
abbr_fr character varying(3),
active boolean,
CONSTRAINT pkey_qgep_vl_damage_manhole_damage_code_manhole_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4148,'DAAA','DAAA','DAAA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4149,'DAAB','DAAB','DAAB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4150,'DABAA','DABAA','DABAA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4151,'DABAB','DABAB','DABAB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4152,'DABAC','DABAC','DABAC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4153,'DABAD','DABAD','DABAD', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4154,'DABBA','DABBA','DABBA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4155,'DABBB','DABBB','DABBB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4156,'DABBC','DABBC','DABBC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4157,'DABBD','DABBD','DABBD', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4158,'DABCA','DABCA','DABCA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4159,'DABCB','DABCB','DABCB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4160,'DABCC','DABCC','DABCC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4161,'DABCD','DABCD','DABCD', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4162,'DACA','DACA','DACA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4163,'DACB','DACB','DACB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4164,'DACC','DACC','DACC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4165,'DADA','DADA','DADA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4166,'DADB','DADB','DADB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4167,'DADC','DADC','DADC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4168,'DAE','DAE','DAE', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4169,'DAFAA','DAFAA','DAFAA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4170,'DAFAB','DAFAB','DAFAB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4171,'DAFAC','DAFAC','DAFAC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4172,'DAFAD','DAFAD','DAFAD', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4173,'DAFAE','DAFAE','DAFAE', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4174,'DAFBA','DAFBA','DAFBA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4175,'DAFBE','DAFBE','DAFBE', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4176,'DAFCA','DAFCA','DAFCA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4177,'DAFCB','DAFCB','DAFCB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4178,'DAFCC','DAFCC','DAFCC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4179,'DAFCD','DAFCD','DAFCD', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4180,'DAFCE','DAFCE','DAFCE', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4181,'DAFDA','DAFDA','DAFDA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4182,'DAFDB','DAFDB','DAFDB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4183,'DAFDC','DAFDC','DAFDC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4184,'DAFDD','DAFDD','DAFDD', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4185,'DAFDE','DAFDE','DAFDE', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4186,'DAFEA','DAFEA','DAFEA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4187,'DAFEB','DAFEB','DAFEB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4188,'DAFEC','DAFEC','DAFEC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4189,'DAFED','DAFED','DAFED', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4190,'DAFEE','DAFEE','DAFEE', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4191,'DAFFA','DAFFA','DAFFA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4192,'DAFFB','DAFFB','DAFFB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4193,'DAFFC','DAFFC','DAFFC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4194,'DAFFD','DAFFD','DAFFD', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4195,'DAFFE','DAFFE','DAFFE', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4196,'DAFGA','DAFGA','DAFGA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4197,'DAFGB','DAFGB','DAFGB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4198,'DAFGC','DAFGC','DAFGC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4199,'DAFGD','DAFGD','DAFGD', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4200,'DAFGE','DAFGE','DAFGE', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4201,'DAFHB','DAFHB','DAFHB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4202,'DAFHC','DAFHC','DAFHC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4203,'DAFHD','DAFHD','DAFHD', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4204,'DAFHE','DAFHE','DAFHE', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4205,'DAFIA','DAFIA','DAFIA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4206,'DAFIB','DAFIB','DAFIB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4207,'DAFIC','DAFIC','DAFIC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4208,'DAFID','DAFID','DAFID', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4209,'DAFIE','DAFIE','DAFIE', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4210,'DAFJB','DAFJB','DAFJB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4211,'DAFJC','DAFJC','DAFJC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4212,'DAFJD','DAFJD','DAFJD', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4213,'DAFJE','DAFJE','DAFJE', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4214,'DAFZA','DAFZA','DAFZA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4215,'DAFZB','DAFZB','DAFZB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4216,'DAFZC','DAFZC','DAFZC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4217,'DAFZD','DAFZD','DAFZD', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4218,'DAFZE','DAFZE','DAFZE', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4219,'DAG','DAG','DAG', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4220,'DAHA','DAHA','DAHA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4221,'DAHB','DAHB','DAHB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4222,'DAHC','DAHC','DAHC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4223,'DAHD','DAHD','DAHD', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4224,'DAHE','DAHE','DAHE', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4225,'DAHZ','DAHZ','DAHZ', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4226,'DAIAA','DAIAA','DAIAA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4227,'DAIAB','DAIAB','DAIAB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4228,'DAIAC','DAIAC','DAIAC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4229,'DAIZ','DAIZ','DAIZ', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4230,'DAJA','DAJA','DAJA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4231,'DAJB','DAJB','DAJB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4232,'DAJC','DAJC','DAJC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4233,'DAKA','DAKA','DAKA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4234,'DAKB','DAKB','DAKB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4235,'DAKC','DAKC','DAKC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4236,'DAKDA','DAKDA','DAKDA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4237,'DAKDB','DAKDB','DAKDB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4238,'DAKDC','DAKDC','DAKDC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4239,'DAKE','DAKE','DAKE', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4240,'DAKZ','DAKZ','DAKZ', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4241,'DALA','DALA','DALA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4242,'DALB','DALB','DALB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4243,'DALZ','DALZ','DALZ', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4244,'DAMA','DAMA','DAMA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4245,'DAMB','DAMB','DAMB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4246,'DAMC','DAMC','DAMC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4247,'DAN','DAN','DAN', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4248,'DAO','DAO','DAO', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4249,'DAP','DAP','DAP', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4250,'DAQA','DAQA','DAQA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4251,'DAQB','DAQB','DAQB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4252,'DAQC','DAQC','DAQC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4253,'DAQD','DAQD','DAQD', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4254,'DAQE','DAQE','DAQE', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4255,'DAQF','DAQF','DAQF', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4256,'DAQG','DAQG','DAQG', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4257,'DAQH','DAQH','DAQH', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4258,'DAQI','DAQI','DAQI', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4259,'DAQJ','DAQJ','DAQJ', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4260,'DAQK','DAQK','DAQK', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4261,'DAQZ','DAQZ','DAQZ', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4262,'DARA','DARA','DARA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4263,'DARB','DARB','DARB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4264,'DARC','DARC','DARC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4265,'DARD','DARD','DARD', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4266,'DARE','DARE','DARE', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4267,'DARF','DARF','DARF', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4268,'DARG','DARG','DARG', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4269,'DARH','DARH','DARH', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4270,'DARZ','DARZ','DARZ', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4271,'DBAA','DBAA','DBAA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4272,'DBAB','DBAB','DBAB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4273,'DBAC','DBAC','DBAC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4274,'DBBA','DBBA','DBBA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4275,'DBBB','DBBB','DBBB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4276,'DBBC','DBBC','DBBC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4277,'DBBZ','DBBZ','DBBZ', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4278,'DBCA','DBCA','DBCA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4279,'DBCB','DBCB','DBCB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4280,'DBCC','DBCC','DBCC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4281,'DBCZ','DBCZ','DBCZ', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4282,'DBD','DBD','DBD', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4283,'DBEA','DBEA','DBEA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4284,'DBEB','DBEB','DBEB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4285,'DBEC','DBEC','DBEC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4286,'DBED','DBED','DBED', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4287,'DBEE','DBEE','DBEE', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4288,'DBEF','DBEF','DBEF', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4289,'DBEG','DBEG','DBEG', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4290,'DBEH','DBEH','DBEH', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4291,'DBEZ','DBEZ','DBEZ', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4292,'DBFAA','DBFAA','DBFAA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4293,'DBFAB','DBFAB','DBFAB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4294,'DBFAC','DBFAC','DBFAC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4295,'DBFBA','DBFBA','DBFBA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4296,'DBFBB','DBFBB','DBFBB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4297,'DBFBC','DBFBC','DBFBC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4298,'DBFCA','DBFCA','DBFCA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4299,'DBFCB','DBFCB','DBFCB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4300,'DBFCC','DBFCC','DBFCC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4301,'DBFDA','DBFDA','DBFDA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4302,'DBFDB','DBFDB','DBFDB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4303,'DBFDC','DBFDC','DBFDC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4304,'DBG','DBG','DBG', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4305,'DBHAA','DBHAA','DBHAA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4306,'DBHAB','DBHAB','DBHAB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4307,'DBHAC','DBHAC','DBHAC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4308,'DBHAZ','DBHAZ','DBHAZ', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4309,'DBHBA','DBHBA','DBHBA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4310,'DBHBB','DBHBB','DBHBB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4311,'DBHBC','DBHBC','DBHBC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4312,'DBHBZ','DBHBZ','DBHBZ', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4313,'DBHZA','DBHZA','DBHZA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4314,'DBHZB','DBHZB','DBHZB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4315,'DBHZC','DBHZC','DBHZC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4316,'DBHZZ','DBHZZ','DBHZZ', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4317,'DCAA','DCAA','DCAA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4318,'DCAB','DCAB','DCAB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4319,'DCAC','DCAC','DCAC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4320,'DCAD','DCAD','DCAD', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4321,'DCAE','DCAE','DCAE', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4322,'DCAF','DCAF','DCAF', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4323,'DCAZ','DCAZ','DCAZ', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4324,'DCBA','DCBA','DCBA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4325,'DCBB','DCBB','DCBB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4326,'DCBC','DCBC','DCBC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4327,'DCBZ','DCBZ','DCBZ', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4328,'DCFA','DCFA','DCFA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4329,'DCFB','DCFB','DCFB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4330,'DCFC','DCFC','DCFC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4331,'DCFD','DCFD','DCFD', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4332,'DCFE','DCFE','DCFE', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4333,'DCFF','DCFF','DCFF', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4334,'DCFG','DCFG','DCFG', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4335,'DCFH','DCFH','DCFH', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4336,'DCFI','DCFI','DCFI', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4337,'DCFJ','DCFJ','DCFJ', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4338,'DCFK','DCFK','DCFK', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4339,'DCFL','DCFL','DCFL', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4340,'DCFM','DCFM','DCFM', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4341,'DCFN','DCFN','DCFN', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4342,'DCFO','DCFO','DCFO', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4343,'DCFP','DCFP','DCFP', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4344,'DCFQ','DCFQ','DCFQ', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4345,'DCFR','DCFR','DCFR', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4346,'DCFS','DCFS','DCFS', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4347,'DCFT','DCFT','DCFT', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4348,'DCFU','DCFU','DCFU', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4349,'DCFV','DCFV','DCFV', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4350,'DCFW','DCFW','DCFW', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4351,'DCFX','DCFX','DCFX', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4352,'DCGAA','DCGAA','DCGAA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4353,'DCGAB','DCGAB','DCGAB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4354,'DCGAC','DCGAC','DCGAC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4355,'DCGBA','DCGBA','DCGBA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4356,'DCGBB','DCGBB','DCGBB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4357,'DCGBC','DCGBC','DCGBC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4358,'DCGCA','DCGCA','DCGCA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4359,'DCGCB','DCGCB','DCGCB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4360,'DCGCC','DCGCC','DCGCC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4361,'DCGXA','DCGXA','DCGXA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4364,'DCGXAA','DCGXAA','DCGXAA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4365,'DCGXAB','DCGXAB','DCGXAB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4366,'DCGXAC','DCGXAC','DCGXAC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4362,'DCGXB','DCGXB','DCGXB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4367,'DCGXBA','DCGXBA','DCGXBA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4368,'DCGXBB','DCGXBB','DCGXBB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4369,'DCGXBC','DCGXBC','DCGXBC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4363,'DCGXC','DCGXC','DCGXC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4370,'DCGXCA','DCGXCA','DCGXCA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4371,'DCGXCB','DCGXCB','DCGXCB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4372,'DCGXCC','DCGXCC','DCGXCC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4373,'DCGYA','DCGYA','DCGYA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4374,'DCGYB','DCGYB','DCGYB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4375,'DCGYC','DCGYC','DCGYC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4376,'DCGZA','DCGZA','DCGZA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4377,'DCGZB','DCGZB','DCGZB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4378,'DCGZC','DCGZC','DCGZC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4379,'DCHA','DCHA','DCHA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4380,'DCHAA','DCHAA','DCHAA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4381,'DCHAB','DCHAB','DCHAB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4382,'DCHB','DCHB','DCHB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4383,'DCIA','DCIA','DCIA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4384,'DCIB','DCIB','DCIB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4385,'DCLAA','DCLAA','DCLAA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4386,'DCLAB','DCLAB','DCLAB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4387,'DCLBA','DCLBA','DCLBA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4388,'DCLBB','DCLBB','DCLBB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4389,'DCLCA','DCLCA','DCLCA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4390,'DCLCB','DCLCB','DCLCB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4391,'DCMA','DCMA','DCMA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4392,'DCMB','DCMB','DCMB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4393,'DCMC','DCMC','DCMC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4394,'DDA','DDA','DDA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4395,'DDB','DDB','DDB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4396,'DDCA','DDCA','DDCA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4397,'DDCB','DDCB','DDCB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4398,'DDCC','DDCC','DDCC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4399,'DDCD','DDCD','DDCD', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4400,'DDCZ','DDCZ','DDCZ', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4401,'DDD','DDD','DDD', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4402,'DDEAA','DDEAA','DDEAA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4403,'DDEAB','DDEAB','DDEAB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4404,'DDEAC','DDEAC','DDEAC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4405,'DDEBA','DDEBA','DDEBA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4406,'DDEBB','DDEBB','DDEBB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4407,'DDEBC','DDEBC','DDEBC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4408,'DDEYA','DDEYA','DDEYA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4409,'DDEYB','DDEYB','DDEYB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4410,'DDEYY','DDEYY','DDEYY', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4411,'DDFA','DDFA','DDFA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4412,'DDFB','DDFB','DDFB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4413,'DDFC','DDFC','DDFC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4414,'DDFZ','DDFZ','DDFZ', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4416,'DDGA','DDGA','DDGA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4417,'DDGB','DDGB','DDGB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4418,'DDGC','DDGC','DDGC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_damage_code_manhole (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4419,'DDGZ','DDGZ','DDGZ', '', '', '', 'true');
 ALTER TABLE qgep.od_damage_manhole ADD CONSTRAINT fkey_vl_damage_manhole_damage_code_manhole FOREIGN KEY (damage_code_manhole)
 REFERENCES qgep.vl_damage_manhole_damage_code_manhole (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_damage_manhole_yyy_manhole_schachtbereich
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
abbr_en character varying(3),
abbr_de character varying(3),
abbr_fr character varying(3),
active boolean,
CONSTRAINT pkey_qgep_vl_damage_manhole_yyy_manhole_schachtbereich_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_damage_manhole_yyy_manhole_schachtbereich (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3743,'A','A','A', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_yyy_manhole_schachtbereich (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3744,'B','B','B', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_yyy_manhole_schachtbereich (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3745,'D','D','D', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_yyy_manhole_schachtbereich (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3746,'F','F','F', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_yyy_manhole_schachtbereich (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3747,'H','H','H', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_yyy_manhole_schachtbereich (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3748,'I','I','I', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_manhole_yyy_manhole_schachtbereich (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3749,'J','J','J', '', '', '', 'true');
 ALTER TABLE qgep.od_damage_manhole ADD CONSTRAINT fkey_vl_damage_manhole_yyy_manhole_schachtbereich FOREIGN KEY (yyy_manhole_schachtbereich)
 REFERENCES qgep.vl_damage_manhole_yyy_manhole_schachtbereich (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_damage_channel ADD CONSTRAINT oorel_od_damage_channel_damage FOREIGN KEY (obj_id) REFERENCES qgep.od_damage(obj_id);
CREATE TABLE qgep.vl_damage_channel_channel_damage_code
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
abbr_en character varying(3),
abbr_de character varying(3),
abbr_fr character varying(3),
active boolean,
CONSTRAINT pkey_qgep_vl_damage_channel_channel_damage_code_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4103,'AECXA','AECXA','AECXA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4104,'AECXB','AECXB','AECXB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4105,'AECXC','AECXC','AECXC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4106,'AECXD','AECXD','AECXD', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4107,'AECXE','AECXE','AECXE', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4108,'AECXF','AECXF','AECXF', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4109,'AECXG','AECXG','AECXG', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4110,'AECXH','AECXH','AECXH', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4111,'AEDXA','AEDXA','AEDXA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4112,'AEDXB','AEDXB','AEDXB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4113,'AEDXC','AEDXC','AEDXC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4114,'AEDXD','AEDXD','AEDXD', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4115,'AEDXE','AEDXE','AEDXE', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4116,'AEDXF','AEDXF','AEDXF', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4117,'AEDXG','AEDXG','AEDXG', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4118,'AEDXH','AEDXH','AEDXH', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4119,'AEDXI','AEDXI','AEDXI', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4120,'AEDXJ','AEDXJ','AEDXJ', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4121,'AEDXK','AEDXK','AEDXK', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4122,'AEDXL','AEDXL','AEDXL', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4123,'AEDXM','AEDXM','AEDXM', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4124,'AEDXN','AEDXN','AEDXN', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4125,'AEDXO','AEDXO','AEDXO', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4126,'AEDXP','AEDXP','AEDXP', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4127,'AEDXQ','AEDXQ','AEDXQ', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4128,'AEDXR','AEDXR','AEDXR', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4129,'AEDXS','AEDXS','AEDXS', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4130,'AEDXT','AEDXT','AEDXT', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4131,'AEDXU','AEDXU','AEDXU', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4132,'AEDXV','AEDXV','AEDXV', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4133,'AEDXW','AEDXW','AEDXW', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4134,'AEDXX','AEDXX','AEDXX', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4135,'AEF','AEF','AEF', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3900,'BAAA','BAAA','BAAA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3901,'BAAB','BAAB','BAAB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3902,'BABAA','BABAA','BABAA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3903,'BABAB','BABAB','BABAB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3904,'BABAC','BABAC','BABAC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3905,'BABAD','BABAD','BABAD', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3906,'BABBA','BABBA','BABBA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3907,'BABBB','BABBB','BABBB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3908,'BABBC','BABBC','BABBC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3909,'BABBD','BABBD','BABBD', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3910,'BABCA','BABCA','BABCA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3911,'BABCB','BABCB','BABCB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3912,'BABCC','BABCC','BABCC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3913,'BABCD','BABCD','BABCD', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3914,'BACA','BACA','BACA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3915,'BACB','BACB','BACB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3916,'BACC','BACC','BACC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3917,'BADA','BADA','BADA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3918,'BADB','BADB','BADB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3919,'BADC','BADC','BADC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3920,'BADD','BADD','BADD', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3921,'BAE','BAE','BAE', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3922,'BAFAA','BAFAA','BAFAA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3923,'BAFAB','BAFAB','BAFAB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3924,'BAFAC','BAFAC','BAFAC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3925,'BAFAD','BAFAD','BAFAD', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3926,'BAFAE','BAFAE','BAFAE', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3927,'BAFBA','BAFBA','BAFBA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3928,'BAFBE','BAFBE','BAFBE', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3929,'BAFCA','BAFCA','BAFCA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3930,'BAFCB','BAFCB','BAFCB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3931,'BAFCC','BAFCC','BAFCC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3932,'BAFCD','BAFCD','BAFCD', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3933,'BAFCE','BAFCE','BAFCE', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3934,'BAFDA','BAFDA','BAFDA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3935,'BAFDB','BAFDB','BAFDB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3936,'BAFDC','BAFDC','BAFDC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3937,'BAFDD','BAFDD','BAFDD', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3938,'BAFDE','BAFDE','BAFDE', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3939,'BAFEA','BAFEA','BAFEA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3940,'BAFEB','BAFEB','BAFEB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3941,'BAFEC','BAFEC','BAFEC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3942,'BAFED','BAFED','BAFED', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3943,'BAFEE','BAFEE','BAFEE', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3944,'BAFFA','BAFFA','BAFFA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3945,'BAFFB','BAFFB','BAFFB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3946,'BAFFC','BAFFC','BAFFC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3947,'BAFFD','BAFFD','BAFFD', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3948,'BAFFE','BAFFE','BAFFE', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3949,'BAFGA','BAFGA','BAFGA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3950,'BAFGB','BAFGB','BAFGB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3951,'BAFGC','BAFGC','BAFGC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3952,'BAFGD','BAFGD','BAFGD', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3953,'BAFGE','BAFGE','BAFGE', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3954,'BAFHB','BAFHB','BAFHB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3955,'BAFHC','BAFHC','BAFHC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3956,'BAFHD','BAFHD','BAFHD', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3957,'BAFHE','BAFHE','BAFHE', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3958,'BAFIA','BAFIA','BAFIA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3959,'BAFIB','BAFIB','BAFIB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3960,'BAFIC','BAFIC','BAFIC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3961,'BAFID','BAFID','BAFID', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3962,'BAFIE','BAFIE','BAFIE', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3963,'BAFJB','BAFJB','BAFJB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3964,'BAFJC','BAFJC','BAFJC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3965,'BAFJD','BAFJD','BAFJD', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3966,'BAFJE','BAFJE','BAFJE', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3967,'BAFZA','BAFZA','BAFZA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3968,'BAFZB','BAFZB','BAFZB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3969,'BAFZC','BAFZC','BAFZC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3970,'BAFZD','BAFZD','BAFZD', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3971,'BAFZE','BAFZE','BAFZE', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3972,'BAGA','BAGA','BAGA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3973,'BAHA','BAHA','BAHA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3974,'BAHB','BAHB','BAHB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3975,'BAHC','BAHC','BAHC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3976,'BAHD','BAHD','BAHD', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3977,'BAHE','BAHE','BAHE', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3978,'BAHZ','BAHZ','BAHZ', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3979,'BAIAA','BAIAA','BAIAA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3980,'BAIAB','BAIAB','BAIAB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3981,'BAIAC','BAIAC','BAIAC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3982,'BAIAD','BAIAD','BAIAD', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3983,'BAIZ','BAIZ','BAIZ', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3984,'BAJA','BAJA','BAJA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3985,'BAJB','BAJB','BAJB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3986,'BAJC','BAJC','BAJC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3987,'BAKA','BAKA','BAKA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3988,'BAKB','BAKB','BAKB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3989,'BAKC','BAKC','BAKC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3990,'BAKDA','BAKDA','BAKDA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3991,'BAKDB','BAKDB','BAKDB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3992,'BAKDC','BAKDC','BAKDC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3993,'BAKE','BAKE','BAKE', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3994,'BAKZ','BAKZ','BAKZ', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3995,'BALA','BALA','BALA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3996,'BALB','BALB','BALB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3997,'BALZ','BALZ','BALZ', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3998,'BAMA','BAMA','BAMA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3999,'BAMB','BAMB','BAMB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4000,'BAMC','BAMC','BAMC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4001,'BAN','BAN','BAN', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4002,'BAO','BAO','BAO', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4003,'BAP','BAP','BAP', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4004,'BBAA','BBAA','BBAA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4005,'BBAB','BBAB','BBAB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4006,'BBAC','BBAC','BBAC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4007,'BBBA','BBBA','BBBA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4008,'BBBB','BBBB','BBBB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4009,'BBBC','BBBC','BBBC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4010,'BBBZ','BBBZ','BBBZ', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4011,'BBCA','BBCA','BBCA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4012,'BBCB','BBCB','BBCB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4013,'BBCC','BBCC','BBCC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4014,'BBCZ','BBCZ','BBCZ', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4015,'BBDA','BBDA','BBDA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4016,'BBDB','BBDB','BBDB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4017,'BBDC','BBDC','BBDC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4018,'BBDD','BBDD','BBDD', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4019,'BBDZ','BBDZ','BBDZ', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4020,'BBEA','BBEA','BBEA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4021,'BBEB','BBEB','BBEB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4022,'BBEC','BBEC','BBEC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4023,'BBED','BBED','BBED', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4024,'BBEE','BBEE','BBEE', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4025,'BBEF','BBEF','BBEF', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4026,'BBEG','BBEG','BBEG', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4027,'BBEH','BBEH','BBEH', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4028,'BBEZ','BBEZ','BBEZ', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4029,'BBFA','BBFA','BBFA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4030,'BBFB','BBFB','BBFB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4031,'BBFC','BBFC','BBFC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4032,'BBFD','BBFD','BBFD', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4033,'BBG','BBG','BBG', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4034,'BBHAA','BBHAA','BBHAA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4035,'BBHAB','BBHAB','BBHAB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4036,'BBHAC','BBHAC','BBHAC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4037,'BBHAZ','BBHAZ','BBHAZ', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4038,'BBHBA','BBHBA','BBHBA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4039,'BBHBB','BBHBB','BBHBB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4040,'BBHBC','BBHBC','BBHBC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4041,'BBHBZ','BBHBZ','BBHBZ', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4042,'BBHZA','BBHZA','BBHZA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4043,'BBHZB','BBHZB','BBHZB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4044,'BBHZC','BBHZC','BBHZC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4045,'BBHZZ','BBHZZ','BBHZZ', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4046,'BCAAA','BCAAA','BCAAA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4047,'BCAAB','BCAAB','BCAAB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4048,'BCABA','BCABA','BCABA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4049,'BCABB','BCABB','BCABB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4050,'BCACA','BCACA','BCACA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4051,'BCACB','BCACB','BCACB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4052,'BCADA','BCADA','BCADA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4053,'BCADB','BCADB','BCADB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4054,'BCAEA','BCAEA','BCAEA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4055,'BCAEB','BCAEB','BCAEB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4056,'BCAFA','BCAFA','BCAFA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4057,'BCAFB','BCAFB','BCAFB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4058,'BCAGA','BCAGA','BCAGA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4059,'BCAGB','BCAGB','BCAGB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4060,'BCAZA','BCAZA','BCAZA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4061,'BCAZB','BCAZB','BCAZB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4062,'BCBA','BCBA','BCBA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4063,'BCBB','BCBB','BCBB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4064,'BCBC','BCBC','BCBC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4065,'BCBD','BCBD','BCBD', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4066,'BCBE','BCBE','BCBE', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4067,'BCBZ','BCBZ','BCBZ', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4068,'BCCAA','BCCAA','BCCAA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4069,'BCCAB','BCCAB','BCCAB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4070,'BCCAY','BCCAY','BCCAY', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4071,'BCCBA','BCCBA','BCCBA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4072,'BCCBB','BCCBB','BCCBB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4073,'BCCBY','BCCBY','BCCBY', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4074,'BCCYA','BCCYA','BCCYA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4075,'BCCYB','BCCYB','BCCYB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4076,'BCD','BCD','BCD', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4077,'BCE','BCE','BCE', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4078,'BDA','BDA','BDA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4079,'BDB','BDB','BDB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4136,'BDBA','BDBA','BDBA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4137,'BDBB','BDBB','BDBB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4138,'BDBC','BDBC','BDBC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4139,'BDBD','BDBD','BDBD', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4140,'BDBE','BDBE','BDBE', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4141,'BDBF','BDBF','BDBF', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4142,'BDBG','BDBG','BDBG', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4143,'BDBH','BDBH','BDBH', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4144,'BDBI','BDBI','BDBI', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4145,'BDBJ','BDBJ','BDBJ', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4146,'BDBK','BDBK','BDBK', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4147,'BDBL','BDBL','BDBL', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4080,'BDCA','BDCA','BDCA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4081,'BDCB','BDCB','BDCB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4082,'BDCC','BDCC','BDCC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4083,'BDCZ','BDCZ','BDCZ', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4084,'BDDA','BDDA','BDDA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4085,'BDDB','BDDB','BDDB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4086,'BDEAA','BDEAA','BDEAA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4087,'BDEAB','BDEAB','BDEAB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4088,'BDEAC','BDEAC','BDEAC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4089,'BDEBA','BDEBA','BDEBA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4090,'BDEBB','BDEBB','BDEBB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4091,'BDEBC','BDEBC','BDEBC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4092,'BDEYA','BDEYA','BDEYA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4093,'BDEYB','BDEYB','BDEYB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4094,'BDEYY','BDEYY','BDEYY', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4095,'BDFA','BDFA','BDFA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4096,'BDFB','BDFB','BDFB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4097,'BDFC','BDFC','BDFC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4098,'BDFZ','BDFZ','BDFZ', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4099,'BDGA','BDGA','BDGA', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4100,'BDGB','BDGB','BDGB', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4101,'BDGC','BDGC','BDGC', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_channel_damage_code (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (4102,'BDGZ','BDGZ','BDGZ', '', '', '', 'true');
 ALTER TABLE qgep.od_damage_channel ADD CONSTRAINT fkey_vl_damage_channel_channel_damage_code FOREIGN KEY (channel_damage_code)
 REFERENCES qgep.vl_damage_channel_channel_damage_code (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_damage_channel_connection
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
abbr_en character varying(3),
abbr_de character varying(3),
abbr_fr character varying(3),
active boolean,
CONSTRAINT pkey_qgep_vl_damage_channel_connection_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_damage_channel_connection (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3724,'yes','ja','oui', '', '', '', 'true');
 INSERT INTO qgep.vl_damage_channel_connection (code, value_en, value_de, value_fr, abbr_en, abbr_de, abbr_fr, active) VALUES (3725,'no','nein','non', '', '', '', 'true');
 ALTER TABLE qgep.od_damage_channel ADD CONSTRAINT fkey_vl_damage_channel_connection FOREIGN KEY (connection)
 REFERENCES qgep.vl_damage_channel_connection (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
COMMIT;
