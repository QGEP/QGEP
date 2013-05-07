BEGIN;
CREATE SCHEMA qgep;
-------
CREATE TABLE qgep.od_organisation
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_organisation_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_organisation.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_organisation ADD COLUMN address  varchar(50) ;
COMMENT ON COLUMN qgep.od_organisation.address IS 'yyy_Attribut zur Verknüpfung der Adressdaten von Organisationen aus Fremdsystemen. Die VSA-DSS bildet keine Adressinformationen ab. Diese sind genügend oft in anderen Systemen vorhanden – eine Referenzattribut reicht. / Attribut zur Verknüpfung der Adress';
 ALTER TABLE qgep.od_organisation ADD COLUMN identifier  varchar(80) ;
 CREATE UNIQUE INDEX in_od_organisation_identifier ON qgep.od_organisation USING btree (identifier);
COMMENT ON COLUMN qgep.od_organisation.identifier IS 'It is suggested to use real names, e.g. Sample_Community and not only Community. Or "Waste Water Association WWTP Example"and not only Waste Water Association because there will be multiple objects / Es wird empfohlen reale Namen zu nehmen, z.B. Mustergem';
 ALTER TABLE qgep.od_organisation ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_organisation.remark IS 'yyy Fehler bei Zuordnung / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_organisation ADD COLUMN yyy_uid  varchar(12) ;
COMMENT ON COLUMN qgep.od_organisation.yyy_uid IS 'yyyReferenz zur Unternehmensidentifikation des Bundesamts fuer Statistik (www.uid.admin.ch), e.g. z.B. CHE123456789 / Referenz zur Unternehmensidentifikation des Bundesamts fuer Statistik (www.uid.admin.ch), z.B. CHE123456789 / Référence pour l’identifica';
 ALTER TABLE qgep.od_organisation ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_organisation.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_organisation ADD COLUMN datenherr varchar(50) ;
COMMENT ON COLUMN qgep.od_organisation.datenherr IS 'Metaattribute Datenherr - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Gestionnaire données gestionnaire de données, qui estla personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_organisation ADD COLUMN datenlieferant varchar(50) ;
COMMENT ON COLUMN qgep.od_organisation.datenlieferant IS 'Metaattribute Datenlieferant - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / xxx_Datenlieferant ';
-------
CREATE TABLE qgep.od_zone
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_zone_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_zone.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_zone ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_zone_identifier ON qgep.od_zone USING btree (identifier);
COMMENT ON COLUMN qgep.od_zone.identifier IS ' /  / ';
 ALTER TABLE qgep.od_zone ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_zone.remark IS ' / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_zone ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_zone.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_zone ADD COLUMN datenherr varchar(50) ;
COMMENT ON COLUMN qgep.od_zone.datenherr IS 'Metaattribute Datenherr - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Gestionnaire données gestionnaire de données, qui estla personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_zone ADD COLUMN datenlieferant varchar(50) ;
COMMENT ON COLUMN qgep.od_zone.datenlieferant IS 'Metaattribute Datenlieferant - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / xxx_Datenlieferant ';
-------
CREATE TABLE qgep.od_control_center
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_control_center_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_control_center.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_control_center ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_control_center_identifier ON qgep.od_control_center USING btree (identifier);
COMMENT ON COLUMN qgep.od_control_center.identifier IS ' /  / ';
SELECT AddGeometryColumn('qgep', 'od_control_center', 'situation_geometry', 21781, 'POINT', 2);
COMMENT ON COLUMN qgep.od_control_center.situation_geometry IS 'national position coordinates (N,E) / Landeskoordinate Ost/Nord / Coordonnées nationales Est/Nord';
 ALTER TABLE qgep.od_control_center ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_control_center.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_control_center ADD COLUMN datenherr varchar(50) ;
COMMENT ON COLUMN qgep.od_control_center.datenherr IS 'Metaattribute Datenherr - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Gestionnaire données gestionnaire de données, qui estla personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_control_center ADD COLUMN datenlieferant varchar(50) ;
COMMENT ON COLUMN qgep.od_control_center.datenlieferant IS 'Metaattribute Datenlieferant - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / xxx_Datenlieferant ';
-------
CREATE TABLE qgep.od_waste_water_treatment
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_waste_water_treatment_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_waste_water_treatment.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_waste_water_treatment ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_waste_water_treatment_identifier ON qgep.od_waste_water_treatment USING btree (identifier);
COMMENT ON COLUMN qgep.od_waste_water_treatment.identifier IS ' /  / ';
 ALTER TABLE qgep.od_waste_water_treatment ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_waste_water_treatment.remark IS ' / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_waste_water_treatment ADD COLUMN type  integer ;
COMMENT ON COLUMN qgep.od_waste_water_treatment.type IS ' / Verfahren für die Abwasserbehandlung / Genre de traitement des eaux usées';
 ALTER TABLE qgep.od_waste_water_treatment ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_waste_water_treatment.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_waste_water_treatment ADD COLUMN datenherr varchar(50) ;
COMMENT ON COLUMN qgep.od_waste_water_treatment.datenherr IS 'Metaattribute Datenherr - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Gestionnaire données gestionnaire de données, qui estla personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_waste_water_treatment ADD COLUMN datenlieferant varchar(50) ;
COMMENT ON COLUMN qgep.od_waste_water_treatment.datenlieferant IS 'Metaattribute Datenlieferant - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / xxx_Datenlieferant ';
-------
CREATE TABLE qgep.od_wwtp_energy_use
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_wwtp_energy_use_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_wwtp_energy_use.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_wwtp_energy_use ADD COLUMN gas_motor  integer ;
COMMENT ON COLUMN qgep.od_wwtp_energy_use.gas_motor IS ' / elektrische Leistung / Puissance électrique';
 ALTER TABLE qgep.od_wwtp_energy_use ADD COLUMN heat_pump  integer ;
COMMENT ON COLUMN qgep.od_wwtp_energy_use.heat_pump IS ' P';
 ALTER TABLE qgep.od_wwtp_energy_use ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_wwtp_energy_use_identifier ON qgep.od_wwtp_energy_use USING btree (identifier);
COMMENT ON COLUMN qgep.od_wwtp_energy_use.identifier IS ' /  / ';
 ALTER TABLE qgep.od_wwtp_energy_use ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_wwtp_energy_use.remark IS ' / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_wwtp_energy_use ADD COLUMN yyy_turbinierung  integer ;
COMMENT ON COLUMN qgep.od_wwtp_energy_use.yyy_turbinierung IS ' P';
 ALTER TABLE qgep.od_wwtp_energy_use ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_wwtp_energy_use.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_wwtp_energy_use ADD COLUMN datenherr varchar(50) ;
COMMENT ON COLUMN qgep.od_wwtp_energy_use.datenherr IS 'Metaattribute Datenherr - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Gestionnaire données gestionnaire de données, qui estla personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_wwtp_energy_use ADD COLUMN datenlieferant varchar(50) ;
COMMENT ON COLUMN qgep.od_wwtp_energy_use.datenlieferant IS 'Metaattribute Datenlieferant - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / xxx_Datenlieferant ';
-------
CREATE TABLE qgep.od_sludge_treatment
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_sludge_treatment_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_sludge_treatment.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_sludge_treatment ADD COLUMN digested_sludge_combustion  decimal(5,2) ;
COMMENT ON COLUMN qgep.od_sludge_treatment.digested_sludge_combustion IS ' n';
 ALTER TABLE qgep.od_sludge_treatment ADD COLUMN fresh_sludge_combustion  decimal(5,2) ;
COMMENT ON COLUMN qgep.od_sludge_treatment.fresh_sludge_combustion IS ' n';
 ALTER TABLE qgep.od_sludge_treatment ADD COLUMN hygenisation  decimal(5,2) ;
COMMENT ON COLUMN qgep.od_sludge_treatment.hygenisation IS ' / Dimensionierungswert / Valeur de dimensionnement';
 ALTER TABLE qgep.od_sludge_treatment ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_sludge_treatment_identifier ON qgep.od_sludge_treatment USING btree (identifier);
COMMENT ON COLUMN qgep.od_sludge_treatment.identifier IS ' /  / ';
 ALTER TABLE qgep.od_sludge_treatment ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_sludge_treatment.remark IS ' / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_sludge_treatment ADD COLUMN yyy_entwaessertklaerschlammstapelung  decimal(7,2) ;
COMMENT ON COLUMN qgep.od_sludge_treatment.yyy_entwaessertklaerschlammstapelung IS ' / Dimensionierungswert / Valeur de dimensionnement';
 ALTER TABLE qgep.od_sludge_treatment ADD COLUMN yyy_entwaesserung  decimal(5,2) ;
COMMENT ON COLUMN qgep.od_sludge_treatment.yyy_entwaesserung IS ' / Dimensionierungswert / Valeur de dimensionnement';
 ALTER TABLE qgep.od_sludge_treatment ADD COLUMN yyy_fluessigklaerschlammstapelung  decimal(7,2) ;
COMMENT ON COLUMN qgep.od_sludge_treatment.yyy_fluessigklaerschlammstapelung IS ' / Dimensionierungswert / Valeur de dimensionnement';
 ALTER TABLE qgep.od_sludge_treatment ADD COLUMN yyy_kompostierung  decimal(5,2) ;
COMMENT ON COLUMN qgep.od_sludge_treatment.yyy_kompostierung IS ' / Dimensionierungswert / Valeur de dimensionnement';
 ALTER TABLE qgep.od_sludge_treatment ADD COLUMN yyy_mischschlammvoreindickung  decimal(7,2) ;
COMMENT ON COLUMN qgep.od_sludge_treatment.yyy_mischschlammvoreindickung IS ' / Dimensionierungswert / Valeur de dimensionnement';
 ALTER TABLE qgep.od_sludge_treatment ADD COLUMN yyy_primaerschlammvoreindickung  decimal(7,2) ;
COMMENT ON COLUMN qgep.od_sludge_treatment.yyy_primaerschlammvoreindickung IS ' / Dimensionierungswert / Valeur de dimensionnement';
 ALTER TABLE qgep.od_sludge_treatment ADD COLUMN yyy_trocknung  decimal(5,2) ;
COMMENT ON COLUMN qgep.od_sludge_treatment.yyy_trocknung IS ' / Leistung thermische Trocknung / Puissance du séchage thermique';
 ALTER TABLE qgep.od_sludge_treatment ADD COLUMN yyy_ueberschusschalmmvoreindickung  decimal(7,2) ;
COMMENT ON COLUMN qgep.od_sludge_treatment.yyy_ueberschusschalmmvoreindickung IS ' / Dimensionierungswert / Valeur de dimensionnement';
 ALTER TABLE qgep.od_sludge_treatment ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_sludge_treatment.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_sludge_treatment ADD COLUMN datenherr varchar(50) ;
COMMENT ON COLUMN qgep.od_sludge_treatment.datenherr IS 'Metaattribute Datenherr - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Gestionnaire données gestionnaire de données, qui estla personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_sludge_treatment ADD COLUMN datenlieferant varchar(50) ;
COMMENT ON COLUMN qgep.od_sludge_treatment.datenlieferant IS 'Metaattribute Datenlieferant - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / xxx_Datenlieferant ';
-------
CREATE TABLE qgep.od_fish_pass
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_fish_pass_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_fish_pass.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_fish_pass ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_fish_pass_identifier ON qgep.od_fish_pass USING btree (identifier);
COMMENT ON COLUMN qgep.od_fish_pass.identifier IS ' /  / ';
 ALTER TABLE qgep.od_fish_pass ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_fish_pass.remark IS ' / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_fish_pass ADD COLUMN vertical_drop  decimal(5,2) ;
COMMENT ON COLUMN qgep.od_fish_pass.vertical_drop IS ' n';
 ALTER TABLE qgep.od_fish_pass ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_fish_pass.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_fish_pass ADD COLUMN datenherr varchar(50) ;
COMMENT ON COLUMN qgep.od_fish_pass.datenherr IS 'Metaattribute Datenherr - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Gestionnaire données gestionnaire de données, qui estla personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_fish_pass ADD COLUMN datenlieferant varchar(50) ;
COMMENT ON COLUMN qgep.od_fish_pass.datenlieferant IS 'Metaattribute Datenlieferant - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / xxx_Datenlieferant ';
-------
CREATE TABLE qgep.od_water_catchement
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_water_catchement_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_water_catchement.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_water_catchement ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_water_catchement_identifier ON qgep.od_water_catchement USING btree (identifier);
COMMENT ON COLUMN qgep.od_water_catchement.identifier IS ' /  / ';
 ALTER TABLE qgep.od_water_catchement ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_water_catchement.remark IS ' / Allgemeine Bemerkungen / Remarques générales';
SELECT AddGeometryColumn('qgep', 'od_water_catchement', 'situation_geometry', 21781, 'POINT', 2);
COMMENT ON COLUMN qgep.od_water_catchement.situation_geometry IS 'national position coordinates (N,E) / Landeskoordinate Ost/Nord / Coordonnées nationales Est/Nord';
 ALTER TABLE qgep.od_water_catchement ADD COLUMN type  integer ;
COMMENT ON COLUMN qgep.od_water_catchement.type IS ' u';
 ALTER TABLE qgep.od_water_catchement ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_water_catchement.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_water_catchement ADD COLUMN datenherr varchar(50) ;
COMMENT ON COLUMN qgep.od_water_catchement.datenherr IS 'Metaattribute Datenherr - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Gestionnaire données gestionnaire de données, qui estla personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_water_catchement ADD COLUMN datenlieferant varchar(50) ;
COMMENT ON COLUMN qgep.od_water_catchement.datenlieferant IS 'Metaattribute Datenlieferant - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / xxx_Datenlieferant ';
-------
CREATE TABLE qgep.od_aquifier
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_aquifier_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_aquifier.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_aquifier ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_aquifier_identifier ON qgep.od_aquifier USING btree (identifier);
COMMENT ON COLUMN qgep.od_aquifier.identifier IS ' /  / ';
SELECT AddGeometryColumn('qgep', 'od_aquifier', 'perimeter_geometry', 21781, 'POLYGON', 2);
COMMENT ON COLUMN qgep.od_aquifier.perimeter_geometry IS ' / Begrenzungspunkte der Fläche / Points de délimitation de la surface';
 ALTER TABLE qgep.od_aquifier ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_aquifier.remark IS ' / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_aquifier ADD COLUMN yyy_maxgwspiegel  decimal(4,3) ;
COMMENT ON COLUMN qgep.od_aquifier.yyy_maxgwspiegel IS ' / Maximale Lage des Grundwasserspiegels / Niveau maximal de la nappe';
 ALTER TABLE qgep.od_aquifier ADD COLUMN yyy_mingwspiegel  decimal(4,3) ;
COMMENT ON COLUMN qgep.od_aquifier.yyy_mingwspiegel IS ' / Minimale Lage des Grundwasserspiegels / Niveau minimal de la nappe';
 ALTER TABLE qgep.od_aquifier ADD COLUMN yyy_mittlerergwspiegel  decimal(4,3) ;
COMMENT ON COLUMN qgep.od_aquifier.yyy_mittlerergwspiegel IS ' / Höhe des mittleren Grundwasserspiegels / Niveau moyen de la nappe';
 ALTER TABLE qgep.od_aquifier ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_aquifier.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_aquifier ADD COLUMN datenherr varchar(50) ;
COMMENT ON COLUMN qgep.od_aquifier.datenherr IS 'Metaattribute Datenherr - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Gestionnaire données gestionnaire de données, qui estla personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_aquifier ADD COLUMN datenlieferant varchar(50) ;
COMMENT ON COLUMN qgep.od_aquifier.datenlieferant IS 'Metaattribute Datenlieferant - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / xxx_Datenlieferant ';
-------
CREATE TABLE qgep.od_shore
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_shore_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_shore.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_shore ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_shore_identifier ON qgep.od_shore USING btree (identifier);
COMMENT ON COLUMN qgep.od_shore.identifier IS ' /  / ';
 ALTER TABLE qgep.od_shore ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_shore.remark IS ' / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_shore ADD COLUMN side  integer ;
COMMENT ON COLUMN qgep.od_shore.side IS ' t';
 ALTER TABLE qgep.od_shore ADD COLUMN vegetation  integer ;
COMMENT ON COLUMN qgep.od_shore.vegetation IS ' /  / ';
 ALTER TABLE qgep.od_shore ADD COLUMN width  decimal(5,2) ;
COMMENT ON COLUMN qgep.od_shore.width IS ' l';
 ALTER TABLE qgep.od_shore ADD COLUMN yyy_uferbereich  integer ;
COMMENT ON COLUMN qgep.od_shore.yyy_uferbereich IS ' u';
 ALTER TABLE qgep.od_shore ADD COLUMN yyy_umlandnutzung  integer ;
COMMENT ON COLUMN qgep.od_shore.yyy_umlandnutzung IS ' / Nutzung des Gewässerumlandes / Utilisation du sol des environs';
 ALTER TABLE qgep.od_shore ADD COLUMN yyy_verbauungsart  integer ;
COMMENT ON COLUMN qgep.od_shore.yyy_verbauungsart IS ' u';
 ALTER TABLE qgep.od_shore ADD COLUMN yyy_verbauungsgrad  integer ;
COMMENT ON COLUMN qgep.od_shore.yyy_verbauungsgrad IS ' u';
 ALTER TABLE qgep.od_shore ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_shore.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_shore ADD COLUMN datenherr varchar(50) ;
COMMENT ON COLUMN qgep.od_shore.datenherr IS 'Metaattribute Datenherr - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Gestionnaire données gestionnaire de données, qui estla personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_shore ADD COLUMN datenlieferant varchar(50) ;
COMMENT ON COLUMN qgep.od_shore.datenlieferant IS 'Metaattribute Datenlieferant - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / xxx_Datenlieferant ';
-------
CREATE TABLE qgep.od_water_control_structure
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_water_control_structure_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_water_control_structure.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_water_control_structure ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_water_control_structure_identifier ON qgep.od_water_control_structure USING btree (identifier);
COMMENT ON COLUMN qgep.od_water_control_structure.identifier IS ' /  / ';
 ALTER TABLE qgep.od_water_control_structure ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_water_control_structure.remark IS ' / Allgemeine Bemerkungen / Remarques générales';
SELECT AddGeometryColumn('qgep', 'od_water_control_structure', 'situation_geometry', 21781, 'POINT', 2);
COMMENT ON COLUMN qgep.od_water_control_structure.situation_geometry IS 'national position coordinates (N,E) / Landeskoordinate Ost/Nord / Coordonnées nationales Est/Nord';
 ALTER TABLE qgep.od_water_control_structure ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_water_control_structure.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_water_control_structure ADD COLUMN datenherr varchar(50) ;
COMMENT ON COLUMN qgep.od_water_control_structure.datenherr IS 'Metaattribute Datenherr - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Gestionnaire données gestionnaire de données, qui estla personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_water_control_structure ADD COLUMN datenlieferant varchar(50) ;
COMMENT ON COLUMN qgep.od_water_control_structure.datenlieferant IS 'Metaattribute Datenlieferant - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / xxx_Datenlieferant ';
-------
CREATE TABLE qgep.od_river_bed
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_river_bed_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_river_bed.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_river_bed ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_river_bed_identifier ON qgep.od_river_bed USING btree (identifier);
COMMENT ON COLUMN qgep.od_river_bed.identifier IS ' /  / ';
 ALTER TABLE qgep.od_river_bed ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_river_bed.remark IS ' / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_river_bed ADD COLUMN type  integer ;
COMMENT ON COLUMN qgep.od_river_bed.type IS 'type of bed / Sohlentyp / Type de fond';
 ALTER TABLE qgep.od_river_bed ADD COLUMN width  decimal(5,2) ;
COMMENT ON COLUMN qgep.od_river_bed.width IS ' / Bei Hochwasser umgelagerter Bereich (frei von höheren Wasserpflanzen) / Zone de charriage par hautes eaux (absence de plantes aquatiques supérieures)';
 ALTER TABLE qgep.od_river_bed ADD COLUMN yyy_verbauungsart  integer ;
COMMENT ON COLUMN qgep.od_river_bed.yyy_verbauungsart IS ' d';
 ALTER TABLE qgep.od_river_bed ADD COLUMN yyy_verbauungsgrad  integer ;
COMMENT ON COLUMN qgep.od_river_bed.yyy_verbauungsgrad IS ' / Flächenhafter Verbauungsgrad der Gewässersohle in %. Aufteilung in Klassen. / Poucentage de la surface avec aménagement du fond du lit. Classification';
 ALTER TABLE qgep.od_river_bed ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_river_bed.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_river_bed ADD COLUMN datenherr varchar(50) ;
COMMENT ON COLUMN qgep.od_river_bed.datenherr IS 'Metaattribute Datenherr - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Gestionnaire données gestionnaire de données, qui estla personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_river_bed ADD COLUMN datenlieferant varchar(50) ;
COMMENT ON COLUMN qgep.od_river_bed.datenlieferant IS 'Metaattribute Datenlieferant - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / xxx_Datenlieferant ';
-------
CREATE TABLE qgep.od_bathing_area
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_bathing_area_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_bathing_area.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_bathing_area ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_bathing_area_identifier ON qgep.od_bathing_area USING btree (identifier);
COMMENT ON COLUMN qgep.od_bathing_area.identifier IS ' /  / ';
 ALTER TABLE qgep.od_bathing_area ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_bathing_area.remark IS ' / Allgemeine Bemerkungen / Remarques générales';
SELECT AddGeometryColumn('qgep', 'od_bathing_area', 'situation_geometry', 21781, 'POINT', 2);
COMMENT ON COLUMN qgep.od_bathing_area.situation_geometry IS 'national position coordinates (N,E) / Landeskoordinate Ost/Nord / Coordonnées nationales Est/Nord';
 ALTER TABLE qgep.od_bathing_area ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_bathing_area.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_bathing_area ADD COLUMN datenherr varchar(50) ;
COMMENT ON COLUMN qgep.od_bathing_area.datenherr IS 'Metaattribute Datenherr - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Gestionnaire données gestionnaire de données, qui estla personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_bathing_area ADD COLUMN datenlieferant varchar(50) ;
COMMENT ON COLUMN qgep.od_bathing_area.datenlieferant IS 'Metaattribute Datenlieferant - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / xxx_Datenlieferant ';
-------
CREATE TABLE qgep.od_sector_water_body
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_sector_water_body_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_sector_water_body.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_sector_water_body ADD COLUMN code_bwg  varchar(50) ;
COMMENT ON COLUMN qgep.od_sector_water_body.code_bwg IS 'C)';
 ALTER TABLE qgep.od_sector_water_body ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_sector_water_body_identifier ON qgep.od_sector_water_body USING btree (identifier);
COMMENT ON COLUMN qgep.od_sector_water_body.identifier IS 'yyy_Eindeutiger Name des Sektors, ID des Bundesamtes für Wasserwirtschaft  und Geologie (BWG, früher BWW) falls Sektor von diesem bezogen wurde. / Eindeutiger Name des Sektors, ID des Bundesamtes für Wasserwirtschaft  und Geologie (BWG, früher BWW) falls ';
 ALTER TABLE qgep.od_sector_water_body ADD COLUMN km_down  decimal(6,3) ;
COMMENT ON COLUMN qgep.od_sector_water_body.km_down IS ' d';
 ALTER TABLE qgep.od_sector_water_body ADD COLUMN km_up  decimal(6,3) ;
COMMENT ON COLUMN qgep.od_sector_water_body.km_up IS ' / Adresskilometer beim Sektorbeginn / Kilomètre du début du secteur';
SELECT AddGeometryColumn('qgep', 'od_sector_water_body', 'progression_geometry', 21781, 'LINESTRING', 2);
COMMENT ON COLUMN qgep.od_sector_water_body.progression_geometry IS ' u';
 ALTER TABLE qgep.od_sector_water_body ADD COLUMN ref_lenght  decimal(5,2) ;
COMMENT ON COLUMN qgep.od_sector_water_body.ref_lenght IS ' )';
 ALTER TABLE qgep.od_sector_water_body ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_sector_water_body.remark IS ' / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_sector_water_body ADD COLUMN type  integer ;
COMMENT ON COLUMN qgep.od_sector_water_body.type IS ' u';
 ALTER TABLE qgep.od_sector_water_body ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_sector_water_body.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_sector_water_body ADD COLUMN datenherr varchar(50) ;
COMMENT ON COLUMN qgep.od_sector_water_body.datenherr IS 'Metaattribute Datenherr - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Gestionnaire données gestionnaire de données, qui estla personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_sector_water_body ADD COLUMN datenlieferant varchar(50) ;
COMMENT ON COLUMN qgep.od_sector_water_body.datenlieferant IS 'Metaattribute Datenlieferant - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / xxx_Datenlieferant ';
-------
CREATE TABLE qgep.od_water_course_segment
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_water_course_segment_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_water_course_segment.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_water_course_segment ADD COLUMN depth_variability  integer ;
COMMENT ON COLUMN qgep.od_water_course_segment.depth_variability IS ' u';
SELECT AddGeometryColumn('qgep', 'od_water_course_segment', 'to_geometry', 21781, 'POINT', 2);
COMMENT ON COLUMN qgep.od_water_course_segment.to_geometry IS ' / Lage Abschnitt-Ende im Gewässerverlauf / Situation de la fin du tronçon';
SELECT AddGeometryColumn('qgep', 'od_water_course_segment', 'from_geometry', 21781, 'POINT', 2);
COMMENT ON COLUMN qgep.od_water_course_segment.from_geometry IS ' / Lage des Abschnittanfangs  im Gewässerverlauf / Situation du début du tronçon';
 ALTER TABLE qgep.od_water_course_segment ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_water_course_segment_identifier ON qgep.od_water_course_segment USING btree (identifier);
COMMENT ON COLUMN qgep.od_water_course_segment.identifier IS ' /  / ';
 ALTER TABLE qgep.od_water_course_segment ADD COLUMN length_profile  integer ;
COMMENT ON COLUMN qgep.od_water_course_segment.length_profile IS ' / Charakterisierung des Gewässerlängsprofil / Caractérisation du profil en long';
 ALTER TABLE qgep.od_water_course_segment ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_water_course_segment.remark IS ' / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_water_course_segment ADD COLUMN size  smallint ;
COMMENT ON COLUMN qgep.od_water_course_segment.size IS ' / Ordnungszahl nach Strahler / Classification selon Strahler';
 ALTER TABLE qgep.od_water_course_segment ADD COLUMN slope  integer ;
COMMENT ON COLUMN qgep.od_water_course_segment.slope IS ' / Mittleres Gefälle des Gewässerabschnittes / Pente moyenne du fond du tronçon';
 ALTER TABLE qgep.od_water_course_segment ADD COLUMN type  integer ;
COMMENT ON COLUMN qgep.od_water_course_segment.type IS ' /  / ';
 ALTER TABLE qgep.od_water_course_segment ADD COLUMN width_variability  integer ;
COMMENT ON COLUMN qgep.od_water_course_segment.width_variability IS ' / Breitenvariabilität des Wasserspiegels bei niedrigem bis mittlerem Abfluss / Variabilité de la largeur du lit mouillé par basses et moyennes eaux';
 ALTER TABLE qgep.od_water_course_segment ADD COLUMN yy_nutzung  integer ;
COMMENT ON COLUMN qgep.od_water_course_segment.yy_nutzung IS ' u';
 ALTER TABLE qgep.od_water_course_segment ADD COLUMN yyy_abflussregime  integer ;
COMMENT ON COLUMN qgep.od_water_course_segment.yyy_abflussregime IS ' e';
 ALTER TABLE qgep.od_water_course_segment ADD COLUMN yyy_algenbewuchs  integer ;
COMMENT ON COLUMN qgep.od_water_course_segment.yyy_algenbewuchs IS ' / Bewuchs mit Algen / Courverture végétale par des algues';
 ALTER TABLE qgep.od_water_course_segment ADD COLUMN yyy_hoehenstufe  integer ;
COMMENT ON COLUMN qgep.od_water_course_segment.yyy_hoehenstufe IS ' u';
 ALTER TABLE qgep.od_water_course_segment ADD COLUMN yyy_linienfuehrung  integer ;
COMMENT ON COLUMN qgep.od_water_course_segment.yyy_linienfuehrung IS ' u';
 ALTER TABLE qgep.od_water_course_segment ADD COLUMN yyy_makrophytenbewuchs  integer ;
COMMENT ON COLUMN qgep.od_water_course_segment.yyy_makrophytenbewuchs IS ' / Bewuchs mit Makrophyten / Couverture végétale par des macrophytes (végétation aquatique (macroscopique))';
 ALTER TABLE qgep.od_water_course_segment ADD COLUMN yyy_oekom_klassifizierung  integer ;
COMMENT ON COLUMN qgep.od_water_course_segment.yyy_oekom_klassifizierung IS ' / Summenattribut aus der ökomorphologischen Klassifizierung nach Stufe F / Attribut issu de la classification écomorphologique du niveau R';
 ALTER TABLE qgep.od_water_course_segment ADD COLUMN yyy_sohlenbreite  decimal(5,2) ;
COMMENT ON COLUMN qgep.od_water_course_segment.yyy_sohlenbreite IS ' / mittlere Sohlenbreite / Largeur moyenne du lit';
 ALTER TABLE qgep.od_water_course_segment ADD COLUMN yyy_totholz  integer ;
COMMENT ON COLUMN qgep.od_water_course_segment.yyy_totholz IS ' u';
 ALTER TABLE qgep.od_water_course_segment ADD COLUMN yyy_wasserhaerte  integer ;
COMMENT ON COLUMN qgep.od_water_course_segment.yyy_wasserhaerte IS ' u';
 ALTER TABLE qgep.od_water_course_segment ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_water_course_segment.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_water_course_segment ADD COLUMN datenherr varchar(50) ;
COMMENT ON COLUMN qgep.od_water_course_segment.datenherr IS 'Metaattribute Datenherr - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Gestionnaire données gestionnaire de données, qui estla personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_water_course_segment ADD COLUMN datenlieferant varchar(50) ;
COMMENT ON COLUMN qgep.od_water_course_segment.datenlieferant IS 'Metaattribute Datenlieferant - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / xxx_Datenlieferant ';
-------
CREATE TABLE qgep.od_chute
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_chute_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_chute.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_chute ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_chute_identifier ON qgep.od_chute USING btree (identifier);
COMMENT ON COLUMN qgep.od_chute.identifier IS ' /  / ';
 ALTER TABLE qgep.od_chute ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_chute.remark IS ' / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_chute ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_chute.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_chute ADD COLUMN datenherr varchar(50) ;
COMMENT ON COLUMN qgep.od_chute.datenherr IS 'Metaattribute Datenherr - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Gestionnaire données gestionnaire de données, qui estla personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_chute ADD COLUMN datenlieferant varchar(50) ;
COMMENT ON COLUMN qgep.od_chute.datenlieferant IS 'Metaattribute Datenlieferant - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / xxx_Datenlieferant ';
-------
CREATE TABLE qgep.od_structure_part
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_structure_part_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_structure_part.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_structure_part ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_structure_part_identifier ON qgep.od_structure_part USING btree (identifier);
COMMENT ON COLUMN qgep.od_structure_part.identifier IS ' /  / ';
 ALTER TABLE qgep.od_structure_part ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_structure_part.remark IS ' / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_structure_part ADD COLUMN renovation_demand  integer ;
COMMENT ON COLUMN qgep.od_structure_part.renovation_demand IS 'ye';
 ALTER TABLE qgep.od_structure_part ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_structure_part.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_structure_part ADD COLUMN datenherr varchar(50) ;
COMMENT ON COLUMN qgep.od_structure_part.datenherr IS 'Metaattribute Datenherr - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Gestionnaire données gestionnaire de données, qui estla personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_structure_part ADD COLUMN datenlieferant varchar(50) ;
COMMENT ON COLUMN qgep.od_structure_part.datenlieferant IS 'Metaattribute Datenlieferant - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / xxx_Datenlieferant ';
-------
CREATE TABLE qgep.od_hydr_geom_relation
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_hydr_geom_relation_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_hydr_geom_relation.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_hydr_geom_relation ADD COLUMN water_depth  decimal(5,2) ;
COMMENT ON COLUMN qgep.od_hydr_geom_relation.water_depth IS ' e';
 ALTER TABLE qgep.od_hydr_geom_relation ADD COLUMN water_surface  decimal(6,2) ;
COMMENT ON COLUMN qgep.od_hydr_geom_relation.water_surface IS ' n';
 ALTER TABLE qgep.od_hydr_geom_relation ADD COLUMN yyy_benetztequerschnittsflaeche  decimal(6,2) ;
COMMENT ON COLUMN qgep.od_hydr_geom_relation.yyy_benetztequerschnittsflaeche IS ' / Hydraulisch wirksamer Querschnitt für Verlustberechnungen / Section hydrauliquement active pour les calculs des pertes de charge';
 ALTER TABLE qgep.od_hydr_geom_relation ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_hydr_geom_relation.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_hydr_geom_relation ADD COLUMN datenherr varchar(50) ;
COMMENT ON COLUMN qgep.od_hydr_geom_relation.datenherr IS 'Metaattribute Datenherr - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Gestionnaire données gestionnaire de données, qui estla personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_hydr_geom_relation ADD COLUMN datenlieferant varchar(50) ;
COMMENT ON COLUMN qgep.od_hydr_geom_relation.datenlieferant IS 'Metaattribute Datenlieferant - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / xxx_Datenlieferant ';
-------
CREATE TABLE qgep.od_hydr_geometry
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_hydr_geometry_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_hydr_geometry.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_hydr_geometry ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_hydr_geometry_identifier ON qgep.od_hydr_geometry USING btree (identifier);
COMMENT ON COLUMN qgep.od_hydr_geometry.identifier IS ' /  / ';
 ALTER TABLE qgep.od_hydr_geometry ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_hydr_geometry.remark IS ' / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_hydr_geometry ADD COLUMN yy_nutzinhalt  decimal(7,2) ;
COMMENT ON COLUMN qgep.od_hydr_geometry.yy_nutzinhalt IS 'yyyNutzbares Beckenvolumen (ohne Zulauf). Wird nur bei Regenbecken (Fangvolumen, Klärvolumen, Rückhaltevolumen) erfasst. Siehe auch Stauraum. / Nutzbares Beckenvolumen (ohne Zulauf). Wird nur bei Regenbecken (Fangvolumen, Klärvolumen, Rückhaltevolumen) er';
 ALTER TABLE qgep.od_hydr_geometry ADD COLUMN yyy_regenbecken_flaeche_dim  decimal(6,2) ;
COMMENT ON COLUMN qgep.od_hydr_geometry.yyy_regenbecken_flaeche_dim IS ' / Total angehängte Fläche des Einzugsgebietes des Regenbeckens  (Dimensionierung). Redundanter Wert als Kontrolle der angehängten Teileinzugsgebiete. / Surface totale du bassin versant raccordé à un BEP (valeur de dimensionnement). Valeur redondante serv';
 ALTER TABLE qgep.od_hydr_geometry ADD COLUMN yyy_regenbecken_flaeche_red_dim  decimal(6,2) ;
COMMENT ON COLUMN qgep.od_hydr_geometry.yyy_regenbecken_flaeche_red_dim IS ' / Total reduzierte angehängte Fläche des Einzugsgebietes des Regenbeckens  (Dimensionierung). Redundanter Wert als Kontrolle der angehängten Teileinzugsgebiete. / Surface réduite totale du bassin versant raccordé à un BEP (valeur de dimensionnement). Val';
 ALTER TABLE qgep.od_hydr_geometry ADD COLUMN yyy_stauraum_volume  decimal(7,2) ;
COMMENT ON COLUMN qgep.od_hydr_geometry.yyy_stauraum_volume IS ' / Speicherinhalt im Becken und im Zulauf zwischen Wehrkrone und dem Wasserspiegel bei Qan / Volume de stockage disponible dans l’ouvrage et conduite d’amenée entre le niveau d’eau (pour Qdim = volume non déversé) et la crête';
 ALTER TABLE qgep.od_hydr_geometry ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_hydr_geometry.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_hydr_geometry ADD COLUMN datenherr varchar(50) ;
COMMENT ON COLUMN qgep.od_hydr_geometry.datenherr IS 'Metaattribute Datenherr - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Gestionnaire données gestionnaire de données, qui estla personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_hydr_geometry ADD COLUMN datenlieferant varchar(50) ;
COMMENT ON COLUMN qgep.od_hydr_geometry.datenlieferant IS 'Metaattribute Datenlieferant - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / xxx_Datenlieferant ';
-------
CREATE TABLE qgep.od_hq_relation
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_hq_relation_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_hq_relation.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_hq_relation ADD COLUMN altitude  decimal(4,3) ;
COMMENT ON COLUMN qgep.od_hq_relation.altitude IS ' t';
 ALTER TABLE qgep.od_hq_relation ADD COLUMN flow  decimal(5,3) ;
COMMENT ON COLUMN qgep.od_hq_relation.flow IS ' u';
 ALTER TABLE qgep.od_hq_relation ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_hq_relation.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_hq_relation ADD COLUMN datenherr varchar(50) ;
COMMENT ON COLUMN qgep.od_hq_relation.datenherr IS 'Metaattribute Datenherr - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Gestionnaire données gestionnaire de données, qui estla personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_hq_relation ADD COLUMN datenlieferant varchar(50) ;
COMMENT ON COLUMN qgep.od_hq_relation.datenlieferant IS 'Metaattribute Datenlieferant - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / xxx_Datenlieferant ';
-------
CREATE TABLE qgep.od_wastewater_networkelement
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_wastewater_networkelement_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_wastewater_networkelement.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_wastewater_networkelement ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_wastewater_networkelement_identifier ON qgep.od_wastewater_networkelement USING btree (identifier);
COMMENT ON COLUMN qgep.od_wastewater_networkelement.identifier IS ' /  / ';
 ALTER TABLE qgep.od_wastewater_networkelement ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_wastewater_networkelement.remark IS ' / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_wastewater_networkelement ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_wastewater_networkelement.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_wastewater_networkelement ADD COLUMN datenherr varchar(50) ;
COMMENT ON COLUMN qgep.od_wastewater_networkelement.datenherr IS 'Metaattribute Datenherr - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Gestionnaire données gestionnaire de données, qui estla personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_wastewater_networkelement ADD COLUMN datenlieferant varchar(50) ;
COMMENT ON COLUMN qgep.od_wastewater_networkelement.datenlieferant IS 'Metaattribute Datenlieferant - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / xxx_Datenlieferant ';
-------
CREATE TABLE qgep.od_maintenance_event
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_maintenance_event_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_maintenance_event.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_maintenance_event ADD COLUMN cost  decimal(8,2) ;
COMMENT ON COLUMN qgep.od_maintenance_event.cost IS ' /  / ';
 ALTER TABLE qgep.od_maintenance_event ADD COLUMN data_details  varchar(50) ;
COMMENT ON COLUMN qgep.od_maintenance_event.data_details IS ' )';
 ALTER TABLE qgep.od_maintenance_event ADD COLUMN disposition_state  integer ;
COMMENT ON COLUMN qgep.od_maintenance_event.disposition_state IS ' e';
 ALTER TABLE qgep.od_maintenance_event ADD COLUMN duration  smallint ;
COMMENT ON COLUMN qgep.od_maintenance_event.duration IS ' s';
 ALTER TABLE qgep.od_maintenance_event ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_maintenance_event_identifier ON qgep.od_maintenance_event USING btree (identifier);
COMMENT ON COLUMN qgep.od_maintenance_event.identifier IS ' /  / ';
 ALTER TABLE qgep.od_maintenance_event ADD COLUMN reason  varchar(50) ;
COMMENT ON COLUMN qgep.od_maintenance_event.reason IS ' t';
 ALTER TABLE qgep.od_maintenance_event ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_maintenance_event.remark IS ' / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_maintenance_event ADD COLUMN result  varchar(50) ;
COMMENT ON COLUMN qgep.od_maintenance_event.result IS ' t';
 ALTER TABLE qgep.od_maintenance_event ADD COLUMN type  integer ;
COMMENT ON COLUMN qgep.od_maintenance_event.type IS 'Yt';
 ALTER TABLE qgep.od_maintenance_event ADD COLUMN yyy_ausfuehrender  varchar(50) ;
COMMENT ON COLUMN qgep.od_maintenance_event.yyy_ausfuehrender IS ' / Ausführende Firma oder Verwaltung / Entreprise ou administration exécutante';
 ALTER TABLE qgep.od_maintenance_event ADD COLUMN yyy_datengrundlage  varchar(50) ;
COMMENT ON COLUMN qgep.od_maintenance_event.yyy_datengrundlage IS ' / Z.B. Schadensprotokoll / par ex. protocole de dommages';
 ALTER TABLE qgep.od_maintenance_event ADD COLUMN yyy_time_point  timestamp without time zone ;
COMMENT ON COLUMN qgep.od_maintenance_event.yyy_time_point IS ' t';
 ALTER TABLE qgep.od_maintenance_event ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_maintenance_event.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_maintenance_event ADD COLUMN datenherr varchar(50) ;
COMMENT ON COLUMN qgep.od_maintenance_event.datenherr IS 'Metaattribute Datenherr - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Gestionnaire données gestionnaire de données, qui estla personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_maintenance_event ADD COLUMN datenlieferant varchar(50) ;
COMMENT ON COLUMN qgep.od_maintenance_event.datenlieferant IS 'Metaattribute Datenlieferant - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / xxx_Datenlieferant ';
-------
CREATE TABLE qgep.od_retention_body
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_retention_body_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_retention_body.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_retention_body ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_retention_body_identifier ON qgep.od_retention_body USING btree (identifier);
COMMENT ON COLUMN qgep.od_retention_body.identifier IS ' /  / ';
 ALTER TABLE qgep.od_retention_body ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_retention_body.remark IS ' / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_retention_body ADD COLUMN type  integer ;
COMMENT ON COLUMN qgep.od_retention_body.type IS ' / Arten der Retention / Genre de rétention';
 ALTER TABLE qgep.od_retention_body ADD COLUMN volume  decimal(7,2) ;
COMMENT ON COLUMN qgep.od_retention_body.volume IS ' / Nutzbares Volumen des Retentionskörpers / Volume effectif du volume de rétention';
 ALTER TABLE qgep.od_retention_body ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_retention_body.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_retention_body ADD COLUMN datenherr varchar(50) ;
COMMENT ON COLUMN qgep.od_retention_body.datenherr IS 'Metaattribute Datenherr - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Gestionnaire données gestionnaire de données, qui estla personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_retention_body ADD COLUMN datenlieferant varchar(50) ;
COMMENT ON COLUMN qgep.od_retention_body.datenlieferant IS 'Metaattribute Datenlieferant - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / xxx_Datenlieferant ';
-------
CREATE TABLE qgep.od_pipe_profile
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_pipe_profile_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_pipe_profile.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_pipe_profile ADD COLUMN height_width_ratio  decimal(3,2) ;
COMMENT ON COLUMN qgep.od_pipe_profile.height_width_ratio IS 'height-width ratio / Verhältnis der Höhe zur Breite / Rapport entre la hauteur et la largeur';
 ALTER TABLE qgep.od_pipe_profile ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_pipe_profile_identifier ON qgep.od_pipe_profile USING btree (identifier);
COMMENT ON COLUMN qgep.od_pipe_profile.identifier IS ' /  / ';
 ALTER TABLE qgep.od_pipe_profile ADD COLUMN profile_type  integer ;
COMMENT ON COLUMN qgep.od_pipe_profile.profile_type IS 'Type of profile / Typ des Profils / Type du profil';
 ALTER TABLE qgep.od_pipe_profile ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_pipe_profile.remark IS 'General remarks / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_pipe_profile ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_pipe_profile.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_pipe_profile ADD COLUMN datenherr varchar(50) ;
COMMENT ON COLUMN qgep.od_pipe_profile.datenherr IS 'Metaattribute Datenherr - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Gestionnaire données gestionnaire de données, qui estla personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_pipe_profile ADD COLUMN datenlieferant varchar(50) ;
COMMENT ON COLUMN qgep.od_pipe_profile.datenlieferant IS 'Metaattribute Datenlieferant - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / xxx_Datenlieferant ';
-------
CREATE TABLE qgep.od_reach_point
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_reach_point_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_reach_point.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_reach_point ADD COLUMN elevation_accuracy  integer ;
COMMENT ON COLUMN qgep.od_reach_point.elevation_accuracy IS 'yyy_Quantifizierung der Genauigkeit der Höhenlage der Kote in Relation zum Höhenfixpunktnetz (z.B. Grundbuchvermessung oder Landesnivellement). / Quantifizierung der Genauigkeit der Höhenlage der Kote in Relation zum Höhenfixpunktnetz (z.B. Grundbuchverme';
 ALTER TABLE qgep.od_reach_point ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_reach_point_identifier ON qgep.od_reach_point USING btree (identifier);
COMMENT ON COLUMN qgep.od_reach_point.identifier IS ' /  / ';
 ALTER TABLE qgep.od_reach_point ADD COLUMN level  decimal(4,3) ;
COMMENT ON COLUMN qgep.od_reach_point.level IS 'yyy / Sohlenhöhe des Haltungsendes / Cote du radier de la fin du tronçon';
 ALTER TABLE qgep.od_reach_point ADD COLUMN outlet_shape  integer ;
COMMENT ON COLUMN qgep.od_reach_point.outlet_shape IS 'yyy Art des Auslaufs / Art des Auslaufs / Types de sortie';
 ALTER TABLE qgep.od_reach_point ADD COLUMN position_of_connection  smallint ;
COMMENT ON COLUMN qgep.od_reach_point.position_of_connection IS 'yyy / Anschlussstelle bezogen auf Querschnitt im Kanal; in Fliessrichtung  (für Haus- und Strassenanschlüsse) / Emplacement de raccordement Référence à la section transversale dans le canal dans le sens d’écoulement (pour les raccordements domestiques et ';
 ALTER TABLE qgep.od_reach_point ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_reach_point.remark IS ' / Allgemeine Bemerkungen / Remarques générales';
SELECT AddGeometryColumn('qgep', 'od_reach_point', 'situation_geometry', 21781, 'POINT', 2);
COMMENT ON COLUMN qgep.od_reach_point.situation_geometry IS 'national position coordinates (N,E) / Landeskoordinate Ost/Nord / Coordonnées nationales Est/Nord';
 ALTER TABLE qgep.od_reach_point ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_reach_point.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_reach_point ADD COLUMN datenherr varchar(50) ;
COMMENT ON COLUMN qgep.od_reach_point.datenherr IS 'Metaattribute Datenherr - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Gestionnaire données gestionnaire de données, qui estla personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_reach_point ADD COLUMN datenlieferant varchar(50) ;
COMMENT ON COLUMN qgep.od_reach_point.datenlieferant IS 'Metaattribute Datenlieferant - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / xxx_Datenlieferant ';
-------
CREATE TABLE qgep.od_wastewater_structure
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_wastewater_structure_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_wastewater_structure.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_wastewater_structure ADD COLUMN accessibility  integer ;
COMMENT ON COLUMN qgep.od_wastewater_structure.accessibility IS 'yyy_Möglichkeit der Zugänglichkeit ins Innere eines Abwasserbauwerks für eine Person (nicht für ein Fahrzeug) / Möglichkeit der Zugänglichkeit ins Innere eines Abwasserbauwerks für eine Person (nicht für ein Fahrzeug) / Possibilités d’accès à l’ouvrage d’';
 ALTER TABLE qgep.od_wastewater_structure ADD COLUMN contract_section  varchar(50) ;
COMMENT ON COLUMN qgep.od_wastewater_structure.contract_section IS ' / Nummer des Bauloses / Numéro du lot de construction';
 ALTER TABLE qgep.od_wastewater_structure ADD COLUMN depth  smallint ;
COMMENT ON COLUMN qgep.od_wastewater_structure.depth IS 'yy_Funktion (berechneter Wert) = zugehöriger Abwasserknoten.Sohlenkote minus Deckel.Kote (falls Sohlenkote nicht seperat erfasst, dann ist es die tiefer liegende Haltungspunkt.Kote). Siehe auch SIA 405 2015 4.3.4. / Funktion (berechneter Wert) = zugehörig';
SELECT AddGeometryColumn('qgep', 'od_wastewater_structure', 'detail_geometry_geometry', 21781, 'POLYGON', 2);
COMMENT ON COLUMN qgep.od_wastewater_structure.detail_geometry_geometry IS 'yyy_Detaillierte Geometrie insbesondere bei Spezialbauwerken. Bei Normschächten mit Dimension1 und 2 arbeiten. Dito bei normierten Versickerungsanlagen. In INTERLIS OPTIONAL gesetzt, da nicht bei allen Abwasserbauwerken zwingend. Kanäle haben normalerweis';
 ALTER TABLE qgep.od_wastewater_structure ADD COLUMN detail_geometry3d  geometry ;
COMMENT ON COLUMN qgep.od_wastewater_structure.detail_geometry3d IS 'yyy / Detaillierte Geometrie (3D) insbesondere bei Spezialbauwerken. Bei Normschächten mit Dimension1 und 2 arbeiten. Dito bei normierten Versickerungsanlagen. In INTERLIS / GEOMETRIE_DETAILLEE3D: Géométrie détaillée particulièrement pour un OUVRAGE_SPECI';
 ALTER TABLE qgep.od_wastewater_structure ADD COLUMN disposition_state  integer ;
COMMENT ON COLUMN qgep.od_wastewater_structure.disposition_state IS 'yyy_Betriebs- bzw. Planungszustand des Bauwerks / Betriebs- bwz. Planungszustand des Bauwerks / Etat de fonctionnement et de planification de l’ouvrage';
 ALTER TABLE qgep.od_wastewater_structure ADD COLUMN gross_costs  decimal(8,2) ;
COMMENT ON COLUMN qgep.od_wastewater_structure.gross_costs IS 'Gross costs of construction / Brutto-Erstellungskosten / Coûts bruts des travaux de construction';
 ALTER TABLE qgep.od_wastewater_structure ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_wastewater_structure_identifier ON qgep.od_wastewater_structure USING btree (identifier);
COMMENT ON COLUMN qgep.od_wastewater_structure.identifier IS 'yyy_Pro Datenherr eindeutige Bezeichnung / Pro Datenherr eindeutige Bezeichnung / Désignation unique pour chaque maître des données';
 ALTER TABLE qgep.od_wastewater_structure ADD COLUMN inspection_interval  decimal(2,2) ;
COMMENT ON COLUMN qgep.od_wastewater_structure.inspection_interval IS ' )';
 ALTER TABLE qgep.od_wastewater_structure ADD COLUMN location_name  varchar(50) ;
COMMENT ON COLUMN qgep.od_wastewater_structure.location_name IS ' e';
 ALTER TABLE qgep.od_wastewater_structure ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_wastewater_structure.remark IS 'General remarks / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_wastewater_structure ADD COLUMN renovation_demand  integer ;
COMMENT ON COLUMN qgep.od_wastewater_structure.renovation_demand IS 'yyy_Dringlichkeitsstufen und Zeithorizont für bauliche Massnahmen gemäss VSA-Richtline "Erhaltung von Kanalisationen" / Dringlichkeitsstufen und Zeithorizont für bauliche Massnahmen gemäss VSA-Richtline "Erhaltung von Kanalisationen" / 	Degrés d’urgence e';
 ALTER TABLE qgep.od_wastewater_structure ADD COLUMN replacement_value  decimal(8,2) ;
COMMENT ON COLUMN qgep.od_wastewater_structure.replacement_value IS 'yE';
 ALTER TABLE qgep.od_wastewater_structure ADD COLUMN rv_base_year  smallint ;
COMMENT ON COLUMN qgep.od_wastewater_structure.rv_base_year IS 'yyy_Basisjahr für die Kalkulation des Wiederbeschaffungswertes (siehe auch Wiederbeschaffungswert) / Basisjahr für die Kalkulation des Wiederbeschaffungswertes (siehe auch Attribut Wiederbeschaffungswert) / Année de référence pour le calcul de la valeur d';
 ALTER TABLE qgep.od_wastewater_structure ADD COLUMN rv_construction_type  integer ;
COMMENT ON COLUMN qgep.od_wastewater_structure.rv_construction_type IS 'yyy_Grobe Einteilung der Bauart des Abwasserbauwerkes als Inputwert für die Berechnung des Wiederbeschaffungswertes. / Grobe Einteilung der Bauart des Abwasserbauwerkes als Inputwert für die Berechnung des Wiederbeschaffungswertes. / Valeur de remplacemen';
 ALTER TABLE qgep.od_wastewater_structure ADD COLUMN structure_condition  integer ;
COMMENT ON COLUMN qgep.od_wastewater_structure.structure_condition IS 'yyy_Zustandsklassen. Beschreibung des baulichen Zustand des Kanals. Nicht zu verwechseln mit den Sanierungsstufen, welche die Prioritäten der Massnahmen bezeichnen (Attribut Sanierungsbedarf). / Zustandsklassen 0 bis 4 gemäss VSA-Richtline "Erhaltung von ';
 ALTER TABLE qgep.od_wastewater_structure ADD COLUMN subsidies  decimal(8,2) ;
COMMENT ON COLUMN qgep.od_wastewater_structure.subsidies IS ' / Staats- und Bundesbeiträge / Contributions des cantons et de la confédération';
 ALTER TABLE qgep.od_wastewater_structure ADD COLUMN year_of_construction  smallint ;
COMMENT ON COLUMN qgep.od_wastewater_structure.year_of_construction IS 'yyy_Jahr der Inbetriebsetzung (Schlussabnahme). Falls unbekannt = 1800 setzen (tiefster Wert des Wertebereiches) / Jahr der Inbetriebsetzung (Schlussabnahme). Falls unbekannt = 1800 setzen (tiefster Wert des Wertebereiches) / Année de mise en service (réc';
 ALTER TABLE qgep.od_wastewater_structure ADD COLUMN year_of_replacement  smallint ;
COMMENT ON COLUMN qgep.od_wastewater_structure.year_of_replacement IS 'ye';
 ALTER TABLE qgep.od_wastewater_structure ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_wastewater_structure.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_wastewater_structure ADD COLUMN datenherr varchar(50) ;
COMMENT ON COLUMN qgep.od_wastewater_structure.datenherr IS 'Metaattribute Datenherr - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Gestionnaire données gestionnaire de données, qui estla personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_wastewater_structure ADD COLUMN datenlieferant varchar(50) ;
COMMENT ON COLUMN qgep.od_wastewater_structure.datenlieferant IS 'Metaattribute Datenlieferant - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / xxx_Datenlieferant ';
-------
CREATE TABLE qgep.od_mechanical_pretreatment
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_mechanical_pretreatment_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_mechanical_pretreatment.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_mechanical_pretreatment ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_mechanical_pretreatment_identifier ON qgep.od_mechanical_pretreatment USING btree (identifier);
COMMENT ON COLUMN qgep.od_mechanical_pretreatment.identifier IS ' /  / ';
 ALTER TABLE qgep.od_mechanical_pretreatment ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_mechanical_pretreatment.remark IS ' / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_mechanical_pretreatment ADD COLUMN type  integer ;
COMMENT ON COLUMN qgep.od_mechanical_pretreatment.type IS ' / Arten der mechanischen Vorreinigung / Behandlung (gemäss VSA Richtlinie Regenwasserentsorgung (2002)) / Genre de pré-épuration mécanique (selon directive VSA "Evacuation des eaux pluviales, édition 2002)';
 ALTER TABLE qgep.od_mechanical_pretreatment ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_mechanical_pretreatment.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_mechanical_pretreatment ADD COLUMN datenherr varchar(50) ;
COMMENT ON COLUMN qgep.od_mechanical_pretreatment.datenherr IS 'Metaattribute Datenherr - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Gestionnaire données gestionnaire de données, qui estla personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_mechanical_pretreatment ADD COLUMN datenlieferant varchar(50) ;
COMMENT ON COLUMN qgep.od_mechanical_pretreatment.datenlieferant IS 'Metaattribute Datenlieferant - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / xxx_Datenlieferant ';
-------
CREATE TABLE qgep.od_profile_geometry
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_profile_geometry_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_profile_geometry.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_profile_geometry ADD COLUMN position  smallint ;
COMMENT ON COLUMN qgep.od_profile_geometry.position IS ' e';
 ALTER TABLE qgep.od_profile_geometry ADD COLUMN x  real ;
COMMENT ON COLUMN qgep.od_profile_geometry.x IS ' /  / ';
 ALTER TABLE qgep.od_profile_geometry ADD COLUMN y  real ;
COMMENT ON COLUMN qgep.od_profile_geometry.y IS ' /  / ';
 ALTER TABLE qgep.od_profile_geometry ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_profile_geometry.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_profile_geometry ADD COLUMN datenherr varchar(50) ;
COMMENT ON COLUMN qgep.od_profile_geometry.datenherr IS 'Metaattribute Datenherr - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Gestionnaire données gestionnaire de données, qui estla personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_profile_geometry ADD COLUMN datenlieferant varchar(50) ;
COMMENT ON COLUMN qgep.od_profile_geometry.datenlieferant IS 'Metaattribute Datenlieferant - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / xxx_Datenlieferant ';
-------
CREATE TABLE qgep.od_accident
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_accident_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_accident.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_accident ADD COLUMN date  timestamp without time zone ;
COMMENT ON COLUMN qgep.od_accident.date IS ' t';
 ALTER TABLE qgep.od_accident ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_accident_identifier ON qgep.od_accident USING btree (identifier);
COMMENT ON COLUMN qgep.od_accident.identifier IS ' /  / ';
 ALTER TABLE qgep.od_accident ADD COLUMN place  varchar(50) ;
COMMENT ON COLUMN qgep.od_accident.place IS ' t';
 ALTER TABLE qgep.od_accident ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_accident.remark IS ' / Allgemeine Bemerkungen / Remarques générales';
SELECT AddGeometryColumn('qgep', 'od_accident', 'situation_geometry', 21781, 'POINT', 2);
COMMENT ON COLUMN qgep.od_accident.situation_geometry IS 'nt';
 ALTER TABLE qgep.od_accident ADD COLUMN yyy_verursacher  varchar(50) ;
COMMENT ON COLUMN qgep.od_accident.yyy_verursacher IS ' r';
 ALTER TABLE qgep.od_accident ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_accident.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_accident ADD COLUMN datenherr varchar(50) ;
COMMENT ON COLUMN qgep.od_accident.datenherr IS 'Metaattribute Datenherr - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Gestionnaire données gestionnaire de données, qui estla personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_accident ADD COLUMN datenlieferant varchar(50) ;
COMMENT ON COLUMN qgep.od_accident.datenlieferant IS 'Metaattribute Datenlieferant - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / xxx_Datenlieferant ';
-------
CREATE TABLE qgep.od_overflow_characteristic
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_overflow_characteristic_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_overflow_characteristic.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_overflow_characteristic ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_overflow_characteristic_identifier ON qgep.od_overflow_characteristic USING btree (identifier);
COMMENT ON COLUMN qgep.od_overflow_characteristic.identifier IS ' /  / ';
 ALTER TABLE qgep.od_overflow_characteristic ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_overflow_characteristic.remark IS ' / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_overflow_characteristic ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_overflow_characteristic.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_overflow_characteristic ADD COLUMN datenherr varchar(50) ;
COMMENT ON COLUMN qgep.od_overflow_characteristic.datenherr IS 'Metaattribute Datenherr - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Gestionnaire données gestionnaire de données, qui estla personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_overflow_characteristic ADD COLUMN datenlieferant varchar(50) ;
COMMENT ON COLUMN qgep.od_overflow_characteristic.datenlieferant IS 'Metaattribute Datenlieferant - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / xxx_Datenlieferant ';
-------
CREATE TABLE qgep.od_throttle_shut_off_unit
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_throttle_shut_off_unit_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_throttle_shut_off_unit.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_throttle_shut_off_unit ADD COLUMN brand  varchar(50) ;
COMMENT ON COLUMN qgep.od_throttle_shut_off_unit.brand IS ' s';
 ALTER TABLE qgep.od_throttle_shut_off_unit ADD COLUMN control  integer ;
COMMENT ON COLUMN qgep.od_throttle_shut_off_unit.control IS ' / Steuer- und Regelorgan für die Einbaute / Dispositifs de commande et de régulation des installations';
 ALTER TABLE qgep.od_throttle_shut_off_unit ADD COLUMN gross_costs  decimal(8,2) ;
COMMENT ON COLUMN qgep.od_throttle_shut_off_unit.gross_costs IS ' / Brutto Erstellungskosten / Coûts bruts de réalisation';
 ALTER TABLE qgep.od_throttle_shut_off_unit ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_throttle_shut_off_unit_identifier ON qgep.od_throttle_shut_off_unit USING btree (identifier);
COMMENT ON COLUMN qgep.od_throttle_shut_off_unit.identifier IS ' /  / ';
 ALTER TABLE qgep.od_throttle_shut_off_unit ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_throttle_shut_off_unit.remark IS ' / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_throttle_shut_off_unit ADD COLUMN signal_transmission  integer ;
COMMENT ON COLUMN qgep.od_throttle_shut_off_unit.signal_transmission IS ' / Signalübermittlung von und zu einer Fernwirkanlage / Transmission des signaux de et vers une station de télécommande';
 ALTER TABLE qgep.od_throttle_shut_off_unit ADD COLUMN subsidies  decimal(8,2) ;
COMMENT ON COLUMN qgep.od_throttle_shut_off_unit.subsidies IS ' / Staats- und Bundesbeiträge / Contributions des cantons et de la confédération';
 ALTER TABLE qgep.od_throttle_shut_off_unit ADD COLUMN type  integer ;
COMMENT ON COLUMN qgep.od_throttle_shut_off_unit.type IS ' / Art der Durchflussregulierung / Genre de régulation du débit';
 ALTER TABLE qgep.od_throttle_shut_off_unit ADD COLUMN yyy_antrieb  integer ;
COMMENT ON COLUMN qgep.od_throttle_shut_off_unit.yyy_antrieb IS ' / Antrieb der Einbaute / Entraînement des installations';
 ALTER TABLE qgep.od_throttle_shut_off_unit ADD COLUMN yyy_querschnitt  decimal(6,2) ;
COMMENT ON COLUMN qgep.od_throttle_shut_off_unit.yyy_querschnitt IS ' r';
 ALTER TABLE qgep.od_throttle_shut_off_unit ADD COLUMN yyy_verstellbarkeit  integer ;
COMMENT ON COLUMN qgep.od_throttle_shut_off_unit.yyy_verstellbarkeit IS ' / Möglichkeit zur Verstellung / Possibilité de modifier la position';
 ALTER TABLE qgep.od_throttle_shut_off_unit ADD COLUMN yyy_wirksamer_qs  decimal(6,2) ;
COMMENT ON COLUMN qgep.od_throttle_shut_off_unit.yyy_wirksamer_qs IS ' / Wirksamer Drosselquerschnitt : Fid / Section du limiteur hydrauliquement active';
 ALTER TABLE qgep.od_throttle_shut_off_unit ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_throttle_shut_off_unit.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_throttle_shut_off_unit ADD COLUMN datenherr varchar(50) ;
COMMENT ON COLUMN qgep.od_throttle_shut_off_unit.datenherr IS 'Metaattribute Datenherr - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Gestionnaire données gestionnaire de données, qui estla personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_throttle_shut_off_unit ADD COLUMN datenlieferant varchar(50) ;
COMMENT ON COLUMN qgep.od_throttle_shut_off_unit.datenlieferant IS 'Metaattribute Datenlieferant - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / xxx_Datenlieferant ';
-------
CREATE TABLE qgep.od_overfall
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_overfall_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_overfall.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_overfall ADD COLUMN brand  varchar(50) ;
COMMENT ON COLUMN qgep.od_overfall.brand IS ' s';
 ALTER TABLE qgep.od_overfall ADD COLUMN control  integer ;
COMMENT ON COLUMN qgep.od_overfall.control IS ' / Steuer- und Regelorgan für die Einbaute / Dispositifs de commande et de régulation des installations';
 ALTER TABLE qgep.od_overfall ADD COLUMN function  integer ;
COMMENT ON COLUMN qgep.od_overfall.function IS ' / Teil des Mischwasserabflusses, der aus einem Überlauf in einen Vorfluter oder in ein Abwasserbauwerk abgeleitet wird / Type de déversoir';
 ALTER TABLE qgep.od_overfall ADD COLUMN gross_costs  decimal(8,2) ;
COMMENT ON COLUMN qgep.od_overfall.gross_costs IS ' / Brutto Erstellungskosten / Coûts bruts de réalisation';
 ALTER TABLE qgep.od_overfall ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_overfall_identifier ON qgep.od_overfall USING btree (identifier);
COMMENT ON COLUMN qgep.od_overfall.identifier IS ' /  / ';
 ALTER TABLE qgep.od_overfall ADD COLUMN overflow_duration  decimal(5,1) ;
COMMENT ON COLUMN qgep.od_overfall.overflow_duration IS ' / Mittlere Überlaufdauer pro Jahr / Durée moyenne de déversement par année';
 ALTER TABLE qgep.od_overfall ADD COLUMN overflow_freight  integer ;
COMMENT ON COLUMN qgep.od_overfall.overflow_freight IS ' / Mittlere Überlaufschmutzfracht pro Jahr / Charge polluante moyenne déversée par année';
 ALTER TABLE qgep.od_overfall ADD COLUMN overflow_volume  decimal(7,2) ;
COMMENT ON COLUMN qgep.od_overfall.overflow_volume IS ' t';
 ALTER TABLE qgep.od_overfall ADD COLUMN q_on_current_state  decimal(5,3) ;
COMMENT ON COLUMN qgep.od_overfall.q_on_current_state IS ' / Wassermenge bei welcher der Überlauf tatsächlich anspringt / Débit à partir duquel le déversoir devient effectivement fonctionnel';
 ALTER TABLE qgep.od_overfall ADD COLUMN q_on_dim  decimal(5,3) ;
COMMENT ON COLUMN qgep.od_overfall.q_on_dim IS ' / Wassermenge, bei welcher der Überlauf gemäss Dimensionierung anspringt / Débit à partir duquel le déversoir devrait être fonctionnel (selon dimensionnement)';
 ALTER TABLE qgep.od_overfall ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_overfall.remark IS ' / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_overfall ADD COLUMN signal_transmission  integer ;
COMMENT ON COLUMN qgep.od_overfall.signal_transmission IS ' / Signalübermittlung von und zu einer Fernwirkanlag / Transmission des signaux de et vers une station de télécommande';
 ALTER TABLE qgep.od_overfall ADD COLUMN subsidies  decimal(8,2) ;
COMMENT ON COLUMN qgep.od_overfall.subsidies IS ' / Staats- und Bundesbeiträge / Contributions des cantons et de la confédération';
 ALTER TABLE qgep.od_overfall ADD COLUMN yyy_antrieb  integer ;
COMMENT ON COLUMN qgep.od_overfall.yyy_antrieb IS ' / Antrieb der Einbaute / Entraînement des installations';
 ALTER TABLE qgep.od_overfall ADD COLUMN yyy_overflow_haeufigkeit  decimal(3,1) ;
COMMENT ON COLUMN qgep.od_overfall.yyy_overflow_haeufigkeit IS ' / Mittlere Überlaufhäufigkeit pro Jahr / Fréquence moyenne de déversement par année';
 ALTER TABLE qgep.od_overfall ADD COLUMN yyy_verstellbarkeit  integer ;
COMMENT ON COLUMN qgep.od_overfall.yyy_verstellbarkeit IS ' / Möglichkeit zur Verstellung / Possibilité de modifier la position';
 ALTER TABLE qgep.od_overfall ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_overfall.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_overfall ADD COLUMN datenherr varchar(50) ;
COMMENT ON COLUMN qgep.od_overfall.datenherr IS 'Metaattribute Datenherr - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Gestionnaire données gestionnaire de données, qui estla personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_overfall ADD COLUMN datenlieferant varchar(50) ;
COMMENT ON COLUMN qgep.od_overfall.datenlieferant IS 'Metaattribute Datenlieferant - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / xxx_Datenlieferant ';
-------
CREATE TABLE qgep.od_surface_runoff_parameters
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_surface_runoff_parameters_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_surface_runoff_parameters.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_surface_runoff_parameters ADD COLUMN evaporation_loss  decimal(3,1) ;
COMMENT ON COLUMN qgep.od_surface_runoff_parameters.evaporation_loss IS 'Loss by evaporation / Verlust durch Verdunstung / Pertes par évaporation au sol';
 ALTER TABLE qgep.od_surface_runoff_parameters ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_surface_runoff_parameters_identifier ON qgep.od_surface_runoff_parameters USING btree (identifier);
COMMENT ON COLUMN qgep.od_surface_runoff_parameters.identifier IS ' /  / ';
 ALTER TABLE qgep.od_surface_runoff_parameters ADD COLUMN infiltration_loss  decimal(3,1) ;
COMMENT ON COLUMN qgep.od_surface_runoff_parameters.infiltration_loss IS 'Loss by infiltration / Verlust durch Infiltration / Pertes par infiltration';
 ALTER TABLE qgep.od_surface_runoff_parameters ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_surface_runoff_parameters.remark IS ' / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_surface_runoff_parameters ADD COLUMN surface_storage  decimal(3,1) ;
COMMENT ON COLUMN qgep.od_surface_runoff_parameters.surface_storage IS 'Loss by filing depressions in the surface / Verlust durch Muldenfüllung / Pertes par remplissage de dépressions';
 ALTER TABLE qgep.od_surface_runoff_parameters ADD COLUMN wetting_loss  decimal(3,1) ;
COMMENT ON COLUMN qgep.od_surface_runoff_parameters.wetting_loss IS 'Loss of wetting plantes and surface during rainfall / Verlust durch Haftung des Niederschlages an Pflanzen- und andere Oberfläche / Pertes par rétention des précipitations sur la végétation et autres surfaces';
 ALTER TABLE qgep.od_surface_runoff_parameters ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_surface_runoff_parameters.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_surface_runoff_parameters ADD COLUMN datenherr varchar(50) ;
COMMENT ON COLUMN qgep.od_surface_runoff_parameters.datenherr IS 'Metaattribute Datenherr - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Gestionnaire données gestionnaire de données, qui estla personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_surface_runoff_parameters ADD COLUMN datenlieferant varchar(50) ;
COMMENT ON COLUMN qgep.od_surface_runoff_parameters.datenlieferant IS 'Metaattribute Datenlieferant - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / xxx_Datenlieferant ';
-------
CREATE TABLE qgep.od_connection_object
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_connection_object_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_connection_object.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_connection_object ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_connection_object_identifier ON qgep.od_connection_object USING btree (identifier);
COMMENT ON COLUMN qgep.od_connection_object.identifier IS ' /  / ';
 ALTER TABLE qgep.od_connection_object ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_connection_object.remark IS ' / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_connection_object ADD COLUMN sewer_infiltration_water_production  decimal(6,3) ;
COMMENT ON COLUMN qgep.od_connection_object.sewer_infiltration_water_production IS ' s';
 ALTER TABLE qgep.od_connection_object ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_connection_object.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_connection_object ADD COLUMN datenherr varchar(50) ;
COMMENT ON COLUMN qgep.od_connection_object.datenherr IS 'Metaattribute Datenherr - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Gestionnaire données gestionnaire de données, qui estla personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_connection_object ADD COLUMN datenlieferant varchar(50) ;
COMMENT ON COLUMN qgep.od_connection_object.datenlieferant IS 'Metaattribute Datenlieferant - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / xxx_Datenlieferant ';
-------
CREATE TABLE qgep.od_catchment_area
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_catchment_area_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_catchment_area.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN direct_discharge_water_body_current  integer ;
COMMENT ON COLUMN qgep.od_catchment_area.direct_discharge_water_body_current IS 'yyy_Das Regenabwasser wird ganz oder teilweise über eine SAA-Leitung in ein Gewässer eingeleitet / Das Regenabwasser wird ganz oder teilweise über eine SAA-Leitung in ein Gewässer eingeleitet / Les eaux pluviales sont rejetées complètement ou partiellemen';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN direct_discharge_water_body_planned  integer ;
COMMENT ON COLUMN qgep.od_catchment_area.direct_discharge_water_body_planned IS 'yyy_Das Regenabwasser wird in Zukunft ganz oder teilweise über eine SAA-Leitung in ein Gewässer eingeleitet / Das Regenabwasser wird in Zukunft ganz oder teilweise über eine SAA-Leitung in ein Gewässer eingeleitet / Les eaux pluviales sont rejetées au fut';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN discharge_coefficient  smallint ;
COMMENT ON COLUMN qgep.od_catchment_area.discharge_coefficient IS 'yyy_1. Verhältnis zwischen einer Blockregenintensität bei angenommenem Blockregen mit bestimmter Dauer zu maximalem Abfluss (Qmax). Kann aus dem Befestigungsgrad ermittelt werden mit dem Spitzenabflussfaktor. (dss) 2. Vom Einzugsgebiet abhängiger Faktor, ';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN discharge_coefficient_rw_current  decimal(6,3) ;
COMMENT ON COLUMN qgep.od_catchment_area.discharge_coefficient_rw_current IS 'yyy_Abflussbeiwert für den Regenabwasseranschluss im Ist-Zustand / Abflussbeiwert für den Regenabwasseranschluss im Ist-Zustand / Coefficient de ruissellement pour le raccordement actuel des eaux pluviales';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN discharge_coefficient_rw_planned  decimal(6,3) ;
COMMENT ON COLUMN qgep.od_catchment_area.discharge_coefficient_rw_planned IS 'yyy_Abflussbeiwert für den Regenabwasseranschluss im Planungszustand / Abflussbeiwert für den Regenabwasseranschluss im Planungszustand / Coefficient de ruissellement pour le raccordement prévu des eaux pluviales';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN discharge_coefficient_ww_current  smallint ;
COMMENT ON COLUMN qgep.od_catchment_area.discharge_coefficient_ww_current IS 'yy_Abflussbeiwert für den Schmutz- oder Mischabwasseranschluss im Ist-Zustand / Abflussbeiwert für den Schmutz- oder Mischabwasseranschluss im Ist-Zustand / Coefficient de ruissellement pour les raccordements eaux usées et eaux mixtes actuels';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN discharge_coefficient_ww_planned  smallint ;
COMMENT ON COLUMN qgep.od_catchment_area.discharge_coefficient_ww_planned IS 'yyy_Abflussbeiwert für den Schmutz- oder Mischabwasseranschluss im Planungszustand / Abflussbeiwert für den Schmutz- oder Mischabwasseranschluss im Planungszustand / Coefficient de ruissellement pour le raccordement prévu des eaux usées ou mixtes';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN drainage_system  integer ;
COMMENT ON COLUMN qgep.od_catchment_area.drainage_system IS 'Ye';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN drainage_system_current  integer ;
COMMENT ON COLUMN qgep.od_catchment_area.drainage_system_current IS 'yyy_Effektive Entwässerungsart im Ist-Zustand / Effektive Entwässerungsart im Ist-Zustand / Genre d’évacuation des eaux réel à l’état actuel';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN drainage_system_planned  integer ;
COMMENT ON COLUMN qgep.od_catchment_area.drainage_system_planned IS 'yyy_Entwässerungsart im Planungszustand (nach Umsetzung des Entwässerungskonzeptes). Dieses Attribut hat Auflagecharakter. Es ist verbindlich für die Beurteilung von Baugesuchen / Entwässerungsart im Planungszustand (nach Umsetzung des Entwässerungskonzep';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_catchment_area_identifier ON qgep.od_catchment_area USING btree (identifier);
COMMENT ON COLUMN qgep.od_catchment_area.identifier IS ' /  / ';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN infiltration  integer ;
COMMENT ON COLUMN qgep.od_catchment_area.infiltration IS 'yyy_Anteil des Regenabwassers, der versickert wird / Anteil des Regenabwassers, der versickert wird (abhängig vom Status IST- oder geplant) / Part des eaux usées infiltrée';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN infiltration_current  integer ;
COMMENT ON COLUMN qgep.od_catchment_area.infiltration_current IS 'yyy_Das Regenabwasser wird ganz oder teilweise einer Versickerungsanlage zugeführt / Das Regenabwasser wird ganz oder teilweise einer Versickerungsanlage zugeführt / Les eaux pluviales sont amenées complètement ou partiellement à une installation d’infilt';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN infiltration_planned  integer ;
COMMENT ON COLUMN qgep.od_catchment_area.infiltration_planned IS 'yyy_Das Regenabwasser wird in Zukunft ganz oder teilweise einer Versickerungsanlage zugeführt / Das Regenabwasser wird in Zukunft ganz oder teilweise einer Versickerungsanlage zugeführt / Les eaux pluviales sont amenées au future complètement ou partielle';
SELECT AddGeometryColumn('qgep', 'od_catchment_area', 'perimeter_geometry', 21781, 'POLYGON', 2);
COMMENT ON COLUMN qgep.od_catchment_area.perimeter_geometry IS 'boundary points of the perimeter / Begrenzungspunkte der Fläche / Points de délimitation de la surface';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN population_density  smallint ;
COMMENT ON COLUMN qgep.od_catchment_area.population_density IS 'yyy_Dichte (physische) Einwohner / Dichte (physische) Einwohner / Densité (physique) de la population';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN population_density_current  smallint ;
COMMENT ON COLUMN qgep.od_catchment_area.population_density_current IS 'yyy_Dichte der (physische) Einwohner im Ist-Zustand / Dichte der (physische) Einwohner im Ist-Zustand / Densité (phyisque) de la population actuelle';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN population_density_planned  smallint ;
COMMENT ON COLUMN qgep.od_catchment_area.population_density_planned IS 'yyy_Dichte der (physische) Einwohner im Planungszustand / Dichte der (physische) Einwohner im Planungszustand / Densité (phyisque) de la population prévue';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_catchment_area.remark IS ' / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN retention_current  integer ;
COMMENT ON COLUMN qgep.od_catchment_area.retention_current IS 'yyy_Das Regen- oder Mischabwasser wird über Rückhalteeinrichtungen verzögert ins Kanalnetz eingeleitet / Das Regen- oder Mischabwasser wird über Rückhalteeinrichtungen verzögert ins Kanalnetz eingeleitet / Les eaux pluviales et mixtes sont rejetées de man';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN retention_planned  integer ;
COMMENT ON COLUMN qgep.od_catchment_area.retention_planned IS 'yyy_Das Regen- oder Mischabwasser wird in Zukunft über Rückhalteeinrichtungen verzögert ins Kanalnetz eingeleitet / Das Regen- oder Mischabwasser wird in Zukunft über Rückhalteeinrichtungen verzögert ins Kanalnetz eingeleitet / Les eaux pluviales et mixte';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN runoff_limit_current  decimal(3,1) ;
COMMENT ON COLUMN qgep.od_catchment_area.runoff_limit_current IS 'yyy_Abflussbegrenzung, falls eine entsprechende Auflage bereits umgesetzt ist. / Abflussbegrenzung, falls eine entsprechende Auflage bereits umgesetzt ist. / Restriction de débit, si une exigence est déjà mise en œuvre';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN runoff_limit_planned  decimal(3,1) ;
COMMENT ON COLUMN qgep.od_catchment_area.runoff_limit_planned IS 'yyy_Abflussbegrenzung, falls eine entsprechende Auflage aus dem Entwässerungskonzept vorliegt. Dieses Attribut hat Auflagecharakter. Es ist verbindlich für die Beurteilung von Baugesuchen / Abflussbegrenzung, falls eine entsprechende Auflage aus dem Entwä';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN seal_factor  smallint ;
COMMENT ON COLUMN qgep.od_catchment_area.seal_factor IS 'yyVerhältnis der abflusswirksamen Fläche zur Gesamtfläche / Verhältnis der abflusswirksamen Fläche zur Gesamtfläche / Rapport entre la surface engendrant un ruissellement et la surface totale';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN seal_factor_rw_current  decimal(6,3) ;
COMMENT ON COLUMN qgep.od_catchment_area.seal_factor_rw_current IS 'yl';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN seal_factor_rw_planned  decimal(6,3) ;
COMMENT ON COLUMN qgep.od_catchment_area.seal_factor_rw_planned IS 'yu';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN seal_factor_ww_current  smallint ;
COMMENT ON COLUMN qgep.od_catchment_area.seal_factor_ww_current IS 'ys';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN seal_factor_ww_planned  decimal(6,3) ;
COMMENT ON COLUMN qgep.od_catchment_area.seal_factor_ww_planned IS 'ys';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN sewer_infiltration_water_production_current  decimal(6,3) ;
COMMENT ON COLUMN qgep.od_catchment_area.sewer_infiltration_water_production_current IS 'yyy_Mittlerer Fremdwasseranfall, der im Ist-Zustand in die Schmutz- oder Mischabwasserkanalisation eingeleitet wird / Mittlerer Fremdwasseranfall, der im Ist-Zustand in die Schmutz- oder Mischabwasserkanalisation eingeleitet wird / Débit ECP moyen actuel,';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN sewer_infiltration_water_production_planned  decimal(6,3) ;
COMMENT ON COLUMN qgep.od_catchment_area.sewer_infiltration_water_production_planned IS 'yyy_Mittlerer Fremdwasseranfall, der im Planungszustand in die Schmutz- oder Mischabwasserkanalisation eingeleitet wird. / Mittlerer Fremdwasseranfall, der im Planungszustand in die Schmutz- oder Mischabwasserkanalisation eingeleitet wird. / Débit ECP moy';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN status  integer ;
COMMENT ON COLUMN qgep.od_catchment_area.status IS ' /  / ';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN surface_area  decimal(6,2) ;
COMMENT ON COLUMN qgep.od_catchment_area.surface_area IS 'yyyredundantes Attribut Flaeche, welches die aus dem Perimeter errechnete Flaeche [ha] enthält / redundantes Attribut Flaeche, welches die aus dem Perimeter errechnete Flaeche [ha] enthält / Attribut redondant indiquant la surface calculée à partir du pér';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN type  integer ;
COMMENT ON COLUMN qgep.od_catchment_area.type IS 'yyy_Trockenwetter- und Regenwettereinzugsgebiet / Trockenwetter- und Regenwettereinzugsgebiet / Bassin versant par temps sec et par temps de pluie';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN waste_water_production_current  decimal(6,3) ;
COMMENT ON COLUMN qgep.od_catchment_area.waste_water_production_current IS 'yyy_Mittlerer Schmutzabwasseranfall, der im Ist-Zustand in die Schmutz- oder Mischabwasserkanalisation eingeleitet wird / Mittlerer Schmutzabwasseranfall, der im Ist-Zustand in die Schmutz- oder Mischabwasserkanalisation eingeleitet wird / Débit moyen act';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN waste_water_production_planned  decimal(6,3) ;
COMMENT ON COLUMN qgep.od_catchment_area.waste_water_production_planned IS 'yyy_Mittlerer Schmutzabwasseranfall, der im Planungszustand in die Schmutz- oder Mischabwasserkanalisation eingeleitet wird / Mittlerer Schmutzabwasseranfall, der im Planungszustand in die Schmutz- oder Mischabwasserkanalisation eingeleitet wird / Débit m';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_catchment_area.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN datenherr varchar(50) ;
COMMENT ON COLUMN qgep.od_catchment_area.datenherr IS 'Metaattribute Datenherr - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Gestionnaire données gestionnaire de données, qui estla personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_catchment_area ADD COLUMN datenlieferant varchar(50) ;
COMMENT ON COLUMN qgep.od_catchment_area.datenlieferant IS 'Metaattribute Datenlieferant - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / xxx_Datenlieferant ';
-------
CREATE TABLE qgep.od_substance
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_substance_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_substance.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_substance ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_substance_identifier ON qgep.od_substance USING btree (identifier);
COMMENT ON COLUMN qgep.od_substance.identifier IS ' /  / ';
 ALTER TABLE qgep.od_substance ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_substance.remark IS ' / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_substance ADD COLUMN type  varchar(50) ;
COMMENT ON COLUMN qgep.od_substance.type IS ' / Liste der wassergefährdenden Stoffe / Liste des substances de nature à polluer les eaux';
 ALTER TABLE qgep.od_substance ADD COLUMN yyy_lagerung  varchar(50) ;
COMMENT ON COLUMN qgep.od_substance.yyy_lagerung IS ' / Art der Lagerung der abwassergefährdenden Stoffe / Genre de stockage des substances dangereuses';
 ALTER TABLE qgep.od_substance ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_substance.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_substance ADD COLUMN datenherr varchar(50) ;
COMMENT ON COLUMN qgep.od_substance.datenherr IS 'Metaattribute Datenherr - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Gestionnaire données gestionnaire de données, qui estla personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_substance ADD COLUMN datenlieferant varchar(50) ;
COMMENT ON COLUMN qgep.od_substance.datenlieferant IS 'Metaattribute Datenlieferant - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / xxx_Datenlieferant ';
-------
CREATE TABLE qgep.od_hazard_source
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_hazard_source_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_hazard_source.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_hazard_source ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_hazard_source_identifier ON qgep.od_hazard_source USING btree (identifier);
COMMENT ON COLUMN qgep.od_hazard_source.identifier IS ' /  / ';
 ALTER TABLE qgep.od_hazard_source ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_hazard_source.remark IS ' / Allgemeine Bemerkungen / Remarques générales';
SELECT AddGeometryColumn('qgep', 'od_hazard_source', 'situation_geometry', 21781, 'POINT', 2);
COMMENT ON COLUMN qgep.od_hazard_source.situation_geometry IS 'national position coordinates (N,E) / Landeskoordinate Ost/Nord / Coordonnées nationales Est/Nord';
 ALTER TABLE qgep.od_hazard_source ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_hazard_source.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_hazard_source ADD COLUMN datenherr varchar(50) ;
COMMENT ON COLUMN qgep.od_hazard_source.datenherr IS 'Metaattribute Datenherr - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Gestionnaire données gestionnaire de données, qui estla personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_hazard_source ADD COLUMN datenlieferant varchar(50) ;
COMMENT ON COLUMN qgep.od_hazard_source.datenlieferant IS 'Metaattribute Datenlieferant - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / xxx_Datenlieferant ';
-------
CREATE TABLE qgep.od_measurement_result
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_measurement_result_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_measurement_result.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_measurement_result ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_measurement_result_identifier ON qgep.od_measurement_result USING btree (identifier);
COMMENT ON COLUMN qgep.od_measurement_result.identifier IS ' /  / ';
 ALTER TABLE qgep.od_measurement_result ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_measurement_result.remark IS ' / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_measurement_result ADD COLUMN time  timestamp without time zone ;
COMMENT ON COLUMN qgep.od_measurement_result.time IS ' / Zeitpunkt des Messbeginns / Date et heure du début de la mesure';
 ALTER TABLE qgep.od_measurement_result ADD COLUMN value  real ;
COMMENT ON COLUMN qgep.od_measurement_result.value IS ' / Gemessene Grösse / Valeur mesurée';
 ALTER TABLE qgep.od_measurement_result ADD COLUMN yyy_messart  varchar(50) ;
COMMENT ON COLUMN qgep.od_measurement_result.yyy_messart IS ' / Art der Messung, z.B zeit- oder mengenproportional / Type de mesure, par ex. proportionnel au temps ou au débit';
 ALTER TABLE qgep.od_measurement_result ADD COLUMN yyy_messdauer  decimal(6,0) ;
COMMENT ON COLUMN qgep.od_measurement_result.yyy_messdauer IS ' / Dauer der Messung in Sekunden / Durée de la mesure';
 ALTER TABLE qgep.od_measurement_result ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_measurement_result.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_measurement_result ADD COLUMN datenherr varchar(50) ;
COMMENT ON COLUMN qgep.od_measurement_result.datenherr IS 'Metaattribute Datenherr - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Gestionnaire données gestionnaire de données, qui estla personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_measurement_result ADD COLUMN datenlieferant varchar(50) ;
COMMENT ON COLUMN qgep.od_measurement_result.datenlieferant IS 'Metaattribute Datenlieferant - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / xxx_Datenlieferant ';
-------
CREATE TABLE qgep.od_measurement_series
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_measurement_series_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_measurement_series.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_measurement_series ADD COLUMN dimension1  varchar(50) ;
COMMENT ON COLUMN qgep.od_measurement_series.dimension1 IS ' / Messtypen / Types de mesures';
 ALTER TABLE qgep.od_measurement_series ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_measurement_series_identifier ON qgep.od_measurement_series USING btree (identifier);
COMMENT ON COLUMN qgep.od_measurement_series.identifier IS ' /  / ';
 ALTER TABLE qgep.od_measurement_series ADD COLUMN pupose  integer ;
COMMENT ON COLUMN qgep.od_measurement_series.pupose IS ' / Zweck der Messung / Objet de la mesure';
 ALTER TABLE qgep.od_measurement_series ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_measurement_series.remark IS ' / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_measurement_series ADD COLUMN type  integer ;
COMMENT ON COLUMN qgep.od_measurement_series.type IS ' / Art der Messreihe / Genre de série de mesures';
 ALTER TABLE qgep.od_measurement_series ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_measurement_series.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_measurement_series ADD COLUMN datenherr varchar(50) ;
COMMENT ON COLUMN qgep.od_measurement_series.datenherr IS 'Metaattribute Datenherr - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Gestionnaire données gestionnaire de données, qui estla personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_measurement_series ADD COLUMN datenlieferant varchar(50) ;
COMMENT ON COLUMN qgep.od_measurement_series.datenlieferant IS 'Metaattribute Datenlieferant - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / xxx_Datenlieferant ';
-------
CREATE TABLE qgep.od_measurement_device
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_measurement_device_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_measurement_device.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_measurement_device ADD COLUMN brand  varchar(50) ;
COMMENT ON COLUMN qgep.od_measurement_device.brand IS ' / Name des Herstellers / Nom du fabricant';
 ALTER TABLE qgep.od_measurement_device ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_measurement_device_identifier ON qgep.od_measurement_device USING btree (identifier);
COMMENT ON COLUMN qgep.od_measurement_device.identifier IS ' /  / ';
 ALTER TABLE qgep.od_measurement_device ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_measurement_device.remark IS ' / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_measurement_device ADD COLUMN serial_number  varchar(50) ;
COMMENT ON COLUMN qgep.od_measurement_device.serial_number IS ' /  / ';
 ALTER TABLE qgep.od_measurement_device ADD COLUMN type  varchar(50) ;
COMMENT ON COLUMN qgep.od_measurement_device.type IS ' e';
 ALTER TABLE qgep.od_measurement_device ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_measurement_device.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_measurement_device ADD COLUMN datenherr varchar(50) ;
COMMENT ON COLUMN qgep.od_measurement_device.datenherr IS 'Metaattribute Datenherr - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Gestionnaire données gestionnaire de données, qui estla personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_measurement_device ADD COLUMN datenlieferant varchar(50) ;
COMMENT ON COLUMN qgep.od_measurement_device.datenlieferant IS 'Metaattribute Datenlieferant - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / xxx_Datenlieferant ';
-------
CREATE TABLE qgep.od_measuring_point
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_measuring_point_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_measuring_point.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_measuring_point ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_measuring_point_identifier ON qgep.od_measuring_point USING btree (identifier);
COMMENT ON COLUMN qgep.od_measuring_point.identifier IS ' /  / ';
 ALTER TABLE qgep.od_measuring_point ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_measuring_point.remark IS ' / Allgemeine Bemerkungen / Remarques générales';
SELECT AddGeometryColumn('qgep', 'od_measuring_point', 'situation_geometry', 21781, 'POINT', 2);
COMMENT ON COLUMN qgep.od_measuring_point.situation_geometry IS 'national position coordinates (N,E) / Landeskoordinate Ost/Nord / Coordonnées nationales Est/Nord';
 ALTER TABLE qgep.od_measuring_point ADD COLUMN type  varchar(50) ;
COMMENT ON COLUMN qgep.od_measuring_point.type IS ' / Art der Untersuchungsstelle ( Regenmessungen, Abflussmessungen, etc.) / Genre de mesure (mesures de pluviométrie, mesures de débit, etc.)';
 ALTER TABLE qgep.od_measuring_point ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_measuring_point.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_measuring_point ADD COLUMN datenherr varchar(50) ;
COMMENT ON COLUMN qgep.od_measuring_point.datenherr IS 'Metaattribute Datenherr - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Gestionnaire données gestionnaire de données, qui estla personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_measuring_point ADD COLUMN datenlieferant varchar(50) ;
COMMENT ON COLUMN qgep.od_measuring_point.datenlieferant IS 'Metaattribute Datenlieferant - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / xxx_Datenlieferant ';
-------
CREATE TABLE qgep.od_drainage_system
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_drainage_system_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_drainage_system.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
SELECT AddGeometryColumn('qgep', 'od_drainage_system', 'perimeter_geometry', 21781, 'POLYGON', 2);
COMMENT ON COLUMN qgep.od_drainage_system.perimeter_geometry IS ' / Begrenzungspunkte der Fläche / Points de délimitation de la surface';
 ALTER TABLE qgep.od_drainage_system ADD COLUMN type  integer ;
COMMENT ON COLUMN qgep.od_drainage_system.type IS 'yé';
-------
CREATE TABLE qgep.od_planning_zone
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_planning_zone_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_planning_zone.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
SELECT AddGeometryColumn('qgep', 'od_planning_zone', 'perimeter_geometry', 21781, 'POLYGON', 2);
COMMENT ON COLUMN qgep.od_planning_zone.perimeter_geometry IS ' / Begrenzungspunkte der Fläche / Points de délimitation de la surface';
 ALTER TABLE qgep.od_planning_zone ADD COLUMN type  integer ;
COMMENT ON COLUMN qgep.od_planning_zone.type IS ' / Art der Bauzone / Genre de zones à bâtir';
-------
CREATE TABLE qgep.od_infiltration_zone
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_infiltration_zone_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_infiltration_zone.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
SELECT AddGeometryColumn('qgep', 'od_infiltration_zone', 'perimeter_geometry', 21781, 'POLYGON', 2);
COMMENT ON COLUMN qgep.od_infiltration_zone.perimeter_geometry IS ' / Begrenzungspunkte der Fläche / Points de délimitation de la surface';
 ALTER TABLE qgep.od_infiltration_zone ADD COLUMN yyy_infiltration_capacity  integer ;
COMMENT ON COLUMN qgep.od_infiltration_zone.yyy_infiltration_capacity IS ' e';
-------
CREATE TABLE qgep.od_groundwater_protection_zone
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_groundwater_protection_zone_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_groundwater_protection_zone.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
SELECT AddGeometryColumn('qgep', 'od_groundwater_protection_zone', 'perimeter_geometry', 21781, 'POLYGON', 2);
COMMENT ON COLUMN qgep.od_groundwater_protection_zone.perimeter_geometry IS ' / Begrenzungspunkte der Fläche / Points de délimitation de la surface';
 ALTER TABLE qgep.od_groundwater_protection_zone ADD COLUMN type  integer ;
COMMENT ON COLUMN qgep.od_groundwater_protection_zone.type IS ' / Zonenarten. Grundwasserschutzzonen bestehen aus dem Fassungsbereich (Zone S1), der Engeren Schutzzone (Zone S2) und der Weiteren Schutzzone (Zone S3). / Genre de zones';
-------
CREATE TABLE qgep.od_ground_water_protection_perimeter
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_ground_water_protection_perimeter_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_ground_water_protection_perimeter.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
SELECT AddGeometryColumn('qgep', 'od_ground_water_protection_perimeter', 'perimeter_geometry', 21781, 'POLYGON', 2);
COMMENT ON COLUMN qgep.od_ground_water_protection_perimeter.perimeter_geometry IS ' / Begrenzungspunkte der Fläche / Points de délimitation de la surface';
-------
CREATE TABLE qgep.od_water_body_protection_sector
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_water_body_protection_sector_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_water_body_protection_sector.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
SELECT AddGeometryColumn('qgep', 'od_water_body_protection_sector', 'perimeter_geometry', 21781, 'POLYGON', 2);
COMMENT ON COLUMN qgep.od_water_body_protection_sector.perimeter_geometry IS ' / Begrenzungspunkte der Fläche / Points de délimitation de la surface';
 ALTER TABLE qgep.od_water_body_protection_sector ADD COLUMN type  integer ;
COMMENT ON COLUMN qgep.od_water_body_protection_sector.type IS ' / Art des Schutzbereiches für  oberflächliches Gewässer und Grundwasser bezüglich Gefährdung / Type de zones de protection des eaux superficielles et souterraines';
-------
CREATE TABLE qgep.od_dryweather_downspout
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_dryweather_downspout_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_dryweather_downspout.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_dryweather_downspout ADD COLUMN diameter  smallint ;
COMMENT ON COLUMN qgep.od_dryweather_downspout.diameter IS ' /  / ';
-------
CREATE TABLE qgep.od_benching
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_benching_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_benching.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_benching ADD COLUMN type  integer ;
COMMENT ON COLUMN qgep.od_benching.type IS ' /  / ';
-------
CREATE TABLE qgep.od_cover
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_cover_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_cover.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_cover ADD COLUMN brand  varchar(50) ;
COMMENT ON COLUMN qgep.od_cover.brand IS ' n';
 ALTER TABLE qgep.od_cover ADD COLUMN cover_shape  integer ;
COMMENT ON COLUMN qgep.od_cover.cover_shape IS 'shape of cover / Form des Deckels / Forme du couvercle';
 ALTER TABLE qgep.od_cover ADD COLUMN depth  smallint ;
COMMENT ON COLUMN qgep.od_cover.depth IS 'yyyredundantes Funktionsattribut Maechtigkeit. Numerisch [mm]. Funktion (berechneter Wert) = zugehöriger Deckel.Kote minus Abwasserknoten.Sohlenkote.(falls die Sohlenkote nicht separat erfasst, dann ist es die tiefer liegende Hal-tungspunkt.Kote) / redund';
 ALTER TABLE qgep.od_cover ADD COLUMN diameter  smallint ;
COMMENT ON COLUMN qgep.od_cover.diameter IS ' / Abmessung des Deckels (bei eckigen Deckeln minimale Abmessung) / Dimension du couvercle (dimension minimale pour couvercle anguleux)';
 ALTER TABLE qgep.od_cover ADD COLUMN fastening  integer ;
COMMENT ON COLUMN qgep.od_cover.fastening IS 'yyy_Befestigungsart des Deckels / Befestigungsart des Deckels / Genre de fixation du couvercle';
 ALTER TABLE qgep.od_cover ADD COLUMN level  decimal(4,3) ;
COMMENT ON COLUMN qgep.od_cover.level IS ' / Deckelhöhe / Cote du couvercle';
 ALTER TABLE qgep.od_cover ADD COLUMN location_accuracy  integer ;
COMMENT ON COLUMN qgep.od_cover.location_accuracy IS 'Quantfication of accuarcy of location of cover (center hole) / Quantifizierung der Genauigkeit der Lage des Deckels (Pickelloch) / Plage de précision des coordonnées planimétriques du couvercle.';
 ALTER TABLE qgep.od_cover ADD COLUMN material  integer ;
COMMENT ON COLUMN qgep.od_cover.material IS ' / Deckelmaterial / Matériau du couvercle';
SELECT AddGeometryColumn('qgep', 'od_cover', 'situation_geometry', 21781, 'POINT', 2);
COMMENT ON COLUMN qgep.od_cover.situation_geometry IS 'Situation of cover (cover hole) / Lage des Deckels (Pickelloch) / Positionnement du couvercle (milieu du couvercle)';
 ALTER TABLE qgep.od_cover ADD COLUMN sludge_bucket  integer ;
COMMENT ON COLUMN qgep.od_cover.sludge_bucket IS ' s';
 ALTER TABLE qgep.od_cover ADD COLUMN venting  integer ;
COMMENT ON COLUMN qgep.od_cover.venting IS 'vn';
-------
CREATE TABLE qgep.od_access_aid
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_access_aid_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_access_aid.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_access_aid ADD COLUMN type  integer ;
COMMENT ON COLUMN qgep.od_access_aid.type IS 'ye';
-------
CREATE TABLE qgep.od_dryweather_flume
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_dryweather_flume_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_dryweather_flume.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_dryweather_flume ADD COLUMN material  integer ;
COMMENT ON COLUMN qgep.od_dryweather_flume.material IS 'yyy_Material der Ausbildung oder Auskleidung der Trockenwetterrinne / Material der Ausbildung oder Auskleidung der Trockenwetterrinne / Materiau de fabrication ou de revêtement de la cunette de débit temps sec';
-------
CREATE TABLE qgep.od_electromechanical_equipment
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_electromechanical_equipment_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_electromechanical_equipment.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_electromechanical_equipment ADD COLUMN gross_costs  decimal(8,2) ;
COMMENT ON COLUMN qgep.od_electromechanical_equipment.gross_costs IS ' / Brutto Erstellungskosten der elektromechanischen Ausrüstung / Coûts bruts des équipements électro-mécaniques';
 ALTER TABLE qgep.od_electromechanical_equipment ADD COLUMN type  integer ;
COMMENT ON COLUMN qgep.od_electromechanical_equipment.type IS ' e';
 ALTER TABLE qgep.od_electromechanical_equipment ADD COLUMN year_of_replacement  smallint ;
COMMENT ON COLUMN qgep.od_electromechanical_equipment.year_of_replacement IS 'yé';
-------
CREATE TABLE qgep.od_electric_equipment
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_electric_equipment_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_electric_equipment.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_electric_equipment ADD COLUMN gross_costs  decimal(8,2) ;
COMMENT ON COLUMN qgep.od_electric_equipment.gross_costs IS ' /  / ';
 ALTER TABLE qgep.od_electric_equipment ADD COLUMN type  integer ;
COMMENT ON COLUMN qgep.od_electric_equipment.type IS ' / Elektrische Installationen und Geräte / Installations et appareils électriques';
 ALTER TABLE qgep.od_electric_equipment ADD COLUMN year_of_replacement  smallint ;
COMMENT ON COLUMN qgep.od_electric_equipment.year_of_replacement IS 'ye';
-------
CREATE TABLE qgep.od_wwtp_structure
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_wwtp_structure_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_wwtp_structure.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_wwtp_structure ADD COLUMN type  integer ;
COMMENT ON COLUMN qgep.od_wwtp_structure.type IS ' /  / ';
-------
CREATE TABLE qgep.od_manhole
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_manhole_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_manhole.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_manhole ADD COLUMN depth  smallint ;
COMMENT ON COLUMN qgep.od_manhole.depth IS 'yy_Funktion (berechneter Wert) = zugehöriger Abwasserknoten.Sohlenkote minus Deckel.Kote (falls Sohlenkote nicht seperat erfasst, dann ist es die tiefer liegende Haltungspunkt.Kote). Siehe auch SIA 405 2015 4.3.4. / Funktion (berechneter Wert) = zugehörig';
 ALTER TABLE qgep.od_manhole ADD COLUMN dimension1  smallint ;
COMMENT ON COLUMN qgep.od_manhole.dimension1 IS ' / Dimension1 des Schachtes (grösstes Innenmass). / Dimension1 de la chambre (plus grande mesure intérieure).';
 ALTER TABLE qgep.od_manhole ADD COLUMN dimension2  smallint ;
COMMENT ON COLUMN qgep.od_manhole.dimension2 IS ' / Dimension2 des Schachtes (kleinstes Innenmass). Bei runden Schächten wird Dimension2 leer gelassen, bei ovalen abgefüllt. Für eckige Schächte Detailgeometrie verwenden. / Dimension2 de la chambre (plus petite mesure intérieure)';
 ALTER TABLE qgep.od_manhole ADD COLUMN function  integer ;
COMMENT ON COLUMN qgep.od_manhole.function IS 'yn';
 ALTER TABLE qgep.od_manhole ADD COLUMN material  integer ;
COMMENT ON COLUMN qgep.od_manhole.material IS ' e';
 ALTER TABLE qgep.od_manhole ADD COLUMN surface_inflow  integer ;
COMMENT ON COLUMN qgep.od_manhole.surface_inflow IS 'ye';
-------
CREATE TABLE qgep.od_discharge_point
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_discharge_point_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_discharge_point.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_discharge_point ADD COLUMN depth  smallint ;
COMMENT ON COLUMN qgep.od_discharge_point.depth IS ' /  / ';
 ALTER TABLE qgep.od_discharge_point ADD COLUMN highwater_level  decimal(4,3) ;
COMMENT ON COLUMN qgep.od_discharge_point.highwater_level IS ' / Massgebliche Hochwasserkote des Vorflutereinlaufs / Cote de crue déterminante au point de rejet';
 ALTER TABLE qgep.od_discharge_point ADD COLUMN upper_elevation  decimal(4,3) ;
COMMENT ON COLUMN qgep.od_discharge_point.upper_elevation IS ' e';
 ALTER TABLE qgep.od_discharge_point ADD COLUMN waterlevel_hydraulic  decimal(4,3) ;
COMMENT ON COLUMN qgep.od_discharge_point.waterlevel_hydraulic IS ' l';
-------
CREATE TABLE qgep.od_channel
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_channel_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_channel.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_channel ADD COLUMN bedding_encasement  integer ;
COMMENT ON COLUMN qgep.od_channel.bedding_encasement IS 'yyy_Art und Weise der unmittelbaren Rohrumgebung im Boden: Bettungsschicht (Unterlage der Leitung),  Verdämmung (seitliche Auffüllung), Schutzschicht / Art und Weise der unmittelbaren Rohrumgebung im Boden: Bettungsschicht (Unterlage der Leitung),  Verdäm';
 ALTER TABLE qgep.od_channel ADD COLUMN connection_type  integer ;
COMMENT ON COLUMN qgep.od_channel.connection_type IS 'Types of connection / Verbindungstypen / Types de raccordement';
 ALTER TABLE qgep.od_channel ADD COLUMN function_amelioration  integer ;
COMMENT ON COLUMN qgep.od_channel.function_amelioration IS 'yyy_Zur Unterscheidung der Funktion einer Leitung bei Meliorationen (Entwässerungen) / Zur Unterscheidung der Funktion einer Leitung bei Meliorationen (Entwässerungen) / Afin de distinger la fonction d’une conduite d’améliorations foncières (drainage)';
 ALTER TABLE qgep.od_channel ADD COLUMN function_hierarchic  integer ;
COMMENT ON COLUMN qgep.od_channel.function_hierarchic IS 'yn';
 ALTER TABLE qgep.od_channel ADD COLUMN function_hydraulic  integer ;
COMMENT ON COLUMN qgep.od_channel.function_hydraulic IS 'yyy_Art des Kanals hinsichtlich hydraulischer Ausführung / Art des Kanals hinsichtlich hydraulischer Ausführung / Genre de canalisation par rapport à sa fonction hydraulique';
 ALTER TABLE qgep.od_channel ADD COLUMN jetting_interval  decimal(2,2) ;
COMMENT ON COLUMN qgep.od_channel.jetting_interval IS ' / Abstände in welchen der Kanal gespült werden sollte / Fréquence à laquelle une canalisation devrait subir un curage (années)';
 ALTER TABLE qgep.od_channel ADD COLUMN pipe_length  decimal(5,2) ;
COMMENT ON COLUMN qgep.od_channel.pipe_length IS ' / Baulänge der Einzelrohre oder Fugenabstände bei Ortsbetonkanälen / Longueur de chaque tuyau ou distance des joints pour les canalisations en béton coulé sur place';
 ALTER TABLE qgep.od_channel ADD COLUMN seepage  integer ;
COMMENT ON COLUMN qgep.od_channel.seepage IS 'yyy Beschreibung des oberliegenden Materials bei Saugern / Beschreibung des oberliegenden Materials bei Saugern / Description du matériau de remplissage';
 ALTER TABLE qgep.od_channel ADD COLUMN usage_current  integer ;
COMMENT ON COLUMN qgep.od_channel.usage_current IS 'yyy_Für Primäre Abwasseranlagen gilt: heute zulässige Nutzung. Für Sekundäre Abwasseranlagen gilt: heute tatsächliche Nutzung / Für Primäre Abwasseranlagen gilt: heute zulässige Nutzung. Für Sekundäre Abwasseranlagen gilt: heute tatsächliche Nutzung / Pou';
 ALTER TABLE qgep.od_channel ADD COLUMN usage_planned  integer ;
COMMENT ON COLUMN qgep.od_channel.usage_planned IS 'y)';
-------
CREATE TABLE qgep.od_special_structure
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_special_structure_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_special_structure.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_special_structure ADD COLUMN bypass  integer ;
COMMENT ON COLUMN qgep.od_special_structure.bypass IS ' / Bypass zur Umleitung des Wassers (z.B. während Unterhalt oder  im Havariefall) / Bypass pour détourner les eaux (par exemple durant des opérations de maintenance ou en cas d’avaries)';
 ALTER TABLE qgep.od_special_structure ADD COLUMN depth  smallint ;
COMMENT ON COLUMN qgep.od_special_structure.depth IS ' /  / ';
 ALTER TABLE qgep.od_special_structure ADD COLUMN function  integer ;
COMMENT ON COLUMN qgep.od_special_structure.function IS 'Kn';
 ALTER TABLE qgep.od_special_structure ADD COLUMN stormwatertank_arrangement  integer ;
COMMENT ON COLUMN qgep.od_special_structure.stormwatertank_arrangement IS 'yv';
 ALTER TABLE qgep.od_special_structure ADD COLUMN upper_elevation  decimal(4,3) ;
COMMENT ON COLUMN qgep.od_special_structure.upper_elevation IS ' / Höchster Punkt des Bauwerks (Decke), aussen / Point le plus élevé de la construction';
-------
CREATE TABLE qgep.od_infiltration_installation
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_infiltration_installation_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_infiltration_installation.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_infiltration_installation ADD COLUMN absorption_capacity  decimal(5,3) ;
COMMENT ON COLUMN qgep.od_infiltration_installation.absorption_capacity IS ' l';
 ALTER TABLE qgep.od_infiltration_installation ADD COLUMN defects  integer ;
COMMENT ON COLUMN qgep.od_infiltration_installation.defects IS ' .';
 ALTER TABLE qgep.od_infiltration_installation ADD COLUMN depth  smallint ;
COMMENT ON COLUMN qgep.od_infiltration_installation.depth IS 'yyy_Funktion (berechneter Wert) = repräsentative Abwasserknoten.Sohlenkote minus zugehörige Deckenkote des Bauwerks falls Detailgeometrie vorhanden, sonst Funktion (berechneter Wert) = Abwasserknoten.Sohlenkote minus zugehörige Deckel.Kote des Bauwerks / ';
 ALTER TABLE qgep.od_infiltration_installation ADD COLUMN dimension1  smallint ;
COMMENT ON COLUMN qgep.od_infiltration_installation.dimension1 IS ' / Dimension1 der Versickerungsanlage (grösstes Innenmass) bei der Verwendung von Normbauteilen. Sonst leer lassen und mit Detailgeometrie beschreiben. / Dimension1 de l’installation d’infiltration (plus grande mesure intérieure) lorsqu’elle est utilisée ';
 ALTER TABLE qgep.od_infiltration_installation ADD COLUMN dimension2  smallint ;
COMMENT ON COLUMN qgep.od_infiltration_installation.dimension2 IS ' / Dimension2 der Versickerungsanlage (kleinstes Innenmass) bei der Verwendung von Normbauteilen. Sonst leer lassen und mit Detailgeometrie beschreiben. / Dimension2 de la chambre (plus petite mesure intérieure). La dimension2 est à saisir pour des chambr';
 ALTER TABLE qgep.od_infiltration_installation ADD COLUMN distance_to_aquifer  decimal(5,2) ;
COMMENT ON COLUMN qgep.od_infiltration_installation.distance_to_aquifer IS ' )';
 ALTER TABLE qgep.od_infiltration_installation ADD COLUMN effective_area  decimal(6,2) ;
COMMENT ON COLUMN qgep.od_infiltration_installation.effective_area IS ' t';
 ALTER TABLE qgep.od_infiltration_installation ADD COLUMN emergency_spillway  integer ;
COMMENT ON COLUMN qgep.od_infiltration_installation.emergency_spillway IS 'yn';
 ALTER TABLE qgep.od_infiltration_installation ADD COLUMN filling_material  integer ;
COMMENT ON COLUMN qgep.od_infiltration_installation.filling_material IS 'yyy / Beschreibung des oberliegenden Materials bei Sickerschlitzen. Diese werden nicht als Haltungen sondern als Versickerungsanlagen modelliert. Sickerschlitze mit Kies als Versickerungsanlage.Art = Kieskoerper abbilden, Sickerschlitze mit anderen Fuellm';
 ALTER TABLE qgep.od_infiltration_installation ADD COLUMN labeling  integer ;
COMMENT ON COLUMN qgep.od_infiltration_installation.labeling IS 'ya';
 ALTER TABLE qgep.od_infiltration_installation ADD COLUMN seepage_utilization  integer ;
COMMENT ON COLUMN qgep.od_infiltration_installation.seepage_utilization IS ' r';
 ALTER TABLE qgep.od_infiltration_installation ADD COLUMN type  integer ;
COMMENT ON COLUMN qgep.od_infiltration_installation.type IS ' .';
 ALTER TABLE qgep.od_infiltration_installation ADD COLUMN upper_elevation  decimal(4,3) ;
COMMENT ON COLUMN qgep.od_infiltration_installation.upper_elevation IS ' / Höchster Punkt des Bauwerks (Decke), aussen / Point le plus élevé de la construction';
 ALTER TABLE qgep.od_infiltration_installation ADD COLUMN vehicle_access  integer ;
COMMENT ON COLUMN qgep.od_infiltration_installation.vehicle_access IS 'yyy_Zugänglichkeit für Saugwagen. Sie bezieht sich auf die gesamte Versickerungsanlage / Vorbehandlungsanlagen und kann in den Bemerkungen weiter spezifiziert werden / Zugänglichkeit für Saugwagen. Sie bezieht sich auf die gesamte Versickerungsanlage / Vo';
 ALTER TABLE qgep.od_infiltration_installation ADD COLUMN watertightness  integer ;
COMMENT ON COLUMN qgep.od_infiltration_installation.watertightness IS ' / Wasserdichtheit gegen Oberflächenwasser.  Nur bei Anlagen mit Schächten. / Etanchéité contre des eaux superficielles. Uniquement pour des installations avec chambres';
-------
CREATE TABLE qgep.od_river
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_river_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_river.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_river ADD COLUMN type  integer ;
COMMENT ON COLUMN qgep.od_river.type IS ' S';
-------
CREATE TABLE qgep.od_lake
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_lake_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_lake.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
SELECT AddGeometryColumn('qgep', 'od_lake', 'perimeter_geometry', 21781, 'POLYGON', 2);
COMMENT ON COLUMN qgep.od_lake.perimeter_geometry IS ' / Begrenzungspunkte der Fläche / Points de délimitation de la surface';
-------
CREATE TABLE qgep.od_rock_ramp
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_rock_ramp_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_rock_ramp.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_rock_ramp ADD COLUMN vertical_drop  decimal(5,2) ;
COMMENT ON COLUMN qgep.od_rock_ramp.vertical_drop IS ' e';
 ALTER TABLE qgep.od_rock_ramp ADD COLUMN yyy_befestigung  integer ;
COMMENT ON COLUMN qgep.od_rock_ramp.yyy_befestigung IS ' / Befestigungsart der Sohlrampe / Genre de consolidation de la rampe';
-------
CREATE TABLE qgep.od_passage
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_passage_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
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
COMMENT ON COLUMN qgep.od_lock.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_lock ADD COLUMN vertical_drop  decimal(5,2) ;
COMMENT ON COLUMN qgep.od_lock.vertical_drop IS ' e';
-------
 ALTER TABLE qgep.od_chute ADD COLUMN material  integer ;
COMMENT ON COLUMN qgep.od_chute.material IS ' / Material aus welchem der Absturz besteht / Matériau de construction du seuil';
 ALTER TABLE qgep.od_chute ADD COLUMN type  integer ;
COMMENT ON COLUMN qgep.od_chute.type IS ' / Art des Absturzes / Type de seuil';
 ALTER TABLE qgep.od_chute ADD COLUMN vertical_drop  decimal(5,2) ;
COMMENT ON COLUMN qgep.od_chute.vertical_drop IS ' e';
-------
CREATE TABLE qgep.od_ford
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_ford_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_ford.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
-------
CREATE TABLE qgep.od_dam
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_dam_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_dam.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_dam ADD COLUMN type  integer ;
COMMENT ON COLUMN qgep.od_dam.type IS ' e';
 ALTER TABLE qgep.od_dam ADD COLUMN vertical_drop  decimal(5,2) ;
COMMENT ON COLUMN qgep.od_dam.vertical_drop IS ' e';
-------
CREATE TABLE qgep.od_blocking_debris
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_blocking_debris_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_blocking_debris.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_blocking_debris ADD COLUMN vertical_drop  decimal(5,2) ;
COMMENT ON COLUMN qgep.od_blocking_debris.vertical_drop IS ' e';
-------
CREATE TABLE qgep.od_param_ca_general
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_param_ca_general_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_param_ca_general.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_param_ca_general ADD COLUMN dry_wheather_flow  decimal(6,3) ;
COMMENT ON COLUMN qgep.od_param_ca_general.dry_wheather_flow IS 'Dry wheather flow /  / Débit temps sec';
 ALTER TABLE qgep.od_param_ca_general ADD COLUMN lenght_flow_path  decimal(5,2) ;
COMMENT ON COLUMN qgep.od_param_ca_general.lenght_flow_path IS 'Lt';
 ALTER TABLE qgep.od_param_ca_general ADD COLUMN population_equivalent  smallint ;
COMMENT ON COLUMN qgep.od_param_ca_general.population_equivalent IS ' /  / ';
 ALTER TABLE qgep.od_param_ca_general ADD COLUMN slope_flow_path  smallint ;
COMMENT ON COLUMN qgep.od_param_ca_general.slope_flow_path IS 'St';
 ALTER TABLE qgep.od_param_ca_general ADD COLUMN surfacace_ca  decimal(6,2) ;
COMMENT ON COLUMN qgep.od_param_ca_general.surfacace_ca IS ' /  / ';
-------
CREATE TABLE qgep.od_param_ca_mouse1
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_param_ca_mouse1_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_param_ca_mouse1.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_param_ca_mouse1 ADD COLUMN dry_wheather_flow  decimal(6,3) ;
COMMENT ON COLUMN qgep.od_param_ca_mouse1.dry_wheather_flow IS 'PE';
 ALTER TABLE qgep.od_param_ca_mouse1 ADD COLUMN parameter_set  varchar(50) ;
COMMENT ON COLUMN qgep.od_param_ca_mouse1.parameter_set IS 'Classification based on surface runoff modell MOUSE 2000/2001 / Klassifikation gemäss Oberflächenabflussmodell von MOUSE 2000/2001 / Classification selon le modèle surface de MOUSE 2000/2001';
 ALTER TABLE qgep.od_param_ca_mouse1 ADD COLUMN population_equivalent  smallint ;
COMMENT ON COLUMN qgep.od_param_ca_mouse1.population_equivalent IS ' /  / ';
 ALTER TABLE qgep.od_param_ca_mouse1 ADD COLUMN slope_flow_path  smallint ;
COMMENT ON COLUMN qgep.od_param_ca_mouse1.slope_flow_path IS ' E';
 ALTER TABLE qgep.od_param_ca_mouse1 ADD COLUMN surface_ca_mouse  decimal(6,2) ;
COMMENT ON COLUMN qgep.od_param_ca_mouse1.surface_ca_mouse IS 'SE';
-------
CREATE TABLE qgep.od_waste_water_association
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_waste_water_association_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_waste_water_association.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
-------
CREATE TABLE qgep.od_canton
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_canton_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_canton.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
SELECT AddGeometryColumn('qgep', 'od_canton', 'perimeter_geometry', 21781, 'POLYGON', 2);
COMMENT ON COLUMN qgep.od_canton.perimeter_geometry IS ' / Kantonsgrenze / Limites cantonales';
-------
CREATE TABLE qgep.od_privat
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_privat_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_privat.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_privat ADD COLUMN type  varchar(50) ;
COMMENT ON COLUMN qgep.od_privat.type IS ' /  / ';
-------
CREATE TABLE qgep.od_administrative_office
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_administrative_office_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_administrative_office.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
-------
CREATE TABLE qgep.od_municipality
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_municipality_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_municipality.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_municipality ADD COLUMN altitude  decimal(4,3) ;
COMMENT ON COLUMN qgep.od_municipality.altitude IS 'An';
SELECT AddGeometryColumn('qgep', 'od_municipality', 'area_geometry', 21781, 'POLYGON', 2);
COMMENT ON COLUMN qgep.od_municipality.area_geometry IS 'Border of the municipality / Gemeindegrenze / Limites communales';
 ALTER TABLE qgep.od_municipality ADD COLUMN gwdp_year  smallint ;
COMMENT ON COLUMN qgep.od_municipality.gwdp_year IS 'Year of legally valid General Water Drainage Planning (GWDP) / Rechtsgültiges GEP aus dem Jahr / PGEE en vigueur depuis';
 ALTER TABLE qgep.od_municipality ADD COLUMN municipality_number  smallint ;
COMMENT ON COLUMN qgep.od_municipality.municipality_number IS 'Oe';
 ALTER TABLE qgep.od_municipality ADD COLUMN population  smallint ;
COMMENT ON COLUMN qgep.od_municipality.population IS 'Permanent opulation (based on statistics of the municipality) / Ständige Einwohner (laut Einwohnerkontrolle der Gemeinde) / Habitants permanents (selon le contrôle des habitants de la commune)';
 ALTER TABLE qgep.od_municipality ADD COLUMN total_surface  decimal(6,2) ;
COMMENT ON COLUMN qgep.od_municipality.total_surface IS 'Total surface without lakes / Fläche ohne Seeanteil / Surface sans partie de lac';
-------
CREATE TABLE qgep.od_waste_water_treatment_plant
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_waste_water_treatment_plant_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_waste_water_treatment_plant.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_waste_water_treatment_plant ADD COLUMN bod5  smallint ;
COMMENT ON COLUMN qgep.od_waste_water_treatment_plant.bod5 IS '5 day biochemical oxygen demand measured at a temperatur of 20 degree celsius. YYY / Biochemischer Sauerstoffbedarf nach 5 Tagen Messzeit und bei einer Temperatur vom 20 Grad Celsius. Er stellt den Verbrauch an gelöstem Sauerstoff durch die Lebensvorgänge';
 ALTER TABLE qgep.od_waste_water_treatment_plant ADD COLUMN cod  smallint ;
COMMENT ON COLUMN qgep.od_waste_water_treatment_plant.cod IS 'Abbreviation for chemical oxygen demand (COD). / Abkürzung für den chemischen Sauerstoffbedarf. Die englische Abkürzung lautet COD. Mit einem starken Oxydationsmittel wird mehr oder weniger erfolgreich versucht, die organischen Verbindungen der Abwasserpr';
 ALTER TABLE qgep.od_waste_water_treatment_plant ADD COLUMN elimination_cod  smallint ;
COMMENT ON COLUMN qgep.od_waste_water_treatment_plant.elimination_cod IS ' %';
 ALTER TABLE qgep.od_waste_water_treatment_plant ADD COLUMN elimination_n  smallint ;
COMMENT ON COLUMN qgep.od_waste_water_treatment_plant.elimination_n IS ' / Denitrifikation bei einer Abwassertemperatur von > 10 Grad / Dénitrification à une température des eaux supérieure à 10°C';
 ALTER TABLE qgep.od_waste_water_treatment_plant ADD COLUMN elimination_nh4  smallint ;
COMMENT ON COLUMN qgep.od_waste_water_treatment_plant.elimination_nh4 IS ' %';
 ALTER TABLE qgep.od_waste_water_treatment_plant ADD COLUMN elimination_p  smallint ;
COMMENT ON COLUMN qgep.od_waste_water_treatment_plant.elimination_p IS ' %';
 ALTER TABLE qgep.od_waste_water_treatment_plant ADD COLUMN nh4  smallint ;
COMMENT ON COLUMN qgep.od_waste_water_treatment_plant.nh4 IS ' / Dimensionierungswert Ablauf Vorklärung. NH4 [gNH4/m3] / Valeur de dimensionnement, NH4 à la sortie du décanteur primaire. NH4 [gNH4/m3]';
 ALTER TABLE qgep.od_waste_water_treatment_plant ADD COLUMN type  varchar(50) ;
COMMENT ON COLUMN qgep.od_waste_water_treatment_plant.type IS ' /  / ';
 ALTER TABLE qgep.od_waste_water_treatment_plant ADD COLUMN wwtp_number  smallint ;
COMMENT ON COLUMN qgep.od_waste_water_treatment_plant.wwtp_number IS 'W)';
 ALTER TABLE qgep.od_waste_water_treatment_plant ADD COLUMN yyy_year_inbetriebnahme  smallint ;
COMMENT ON COLUMN qgep.od_waste_water_treatment_plant.yyy_year_inbetriebnahme IS ' / Jahr der Inbetriebnahme / Année de la mise en exploitation';
-------
CREATE TABLE qgep.od_reach
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_reach_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_reach.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_reach ADD COLUMN coefficient_of_friction  smallint ;
COMMENT ON COLUMN qgep.od_reach.coefficient_of_friction IS 'yyy http://www.linguee.com/english-german/search?source=auto&query=reibungsbeiwert / Hydraulische Kenngrösse zur Beschreibung der Beschaffenheit der Kanalwandung. Beiwert für die Formeln nach Manning-Strickler (K oder kstr) / Constante de rugosité selon M';
 ALTER TABLE qgep.od_reach ADD COLUMN depth  smallint ;
COMMENT ON COLUMN qgep.od_reach.depth IS 'yyy_Maximale Innenhöhe des Kanalprofiles / Maximale Innenhöhe des Kanalprofiles / Hauteur intérieure maximale du profil';
 ALTER TABLE qgep.od_reach ADD COLUMN elevation_determination  integer ;
COMMENT ON COLUMN qgep.od_reach.elevation_determination IS 'y.';
 ALTER TABLE qgep.od_reach ADD COLUMN horizontal_positioning  integer ;
COMMENT ON COLUMN qgep.od_reach.horizontal_positioning IS 'yyy_Definiert die Lagegenauigkeit der Verlaufspunkte. Falls ein Verlauf definiert ist, ist dieser immer [genau] / Definiert die Lagegenauigkeit der Verlaufspunkte. Falls ein Verlauf definiert ist, ist dieser immer [genau] / Définit la précision de la déte';
 ALTER TABLE qgep.od_reach ADD COLUMN inside_coating  integer ;
COMMENT ON COLUMN qgep.od_reach.inside_coating IS 'yyy_Schutz der Innenwände des Kanals / Schutz der Innenwände des Kanals / Protection de la paroi intérieur de la canalisation';
 ALTER TABLE qgep.od_reach ADD COLUMN length_effective  decimal(5,2) ;
COMMENT ON COLUMN qgep.od_reach.length_effective IS 'yyy_Tatsächliche Länge inklusive Kanalkrümmungen / Tatsächliche Länge inklusive Kanalkrümmungen / Longueur effective (par ex. pour conduites incurvées)';
 ALTER TABLE qgep.od_reach ADD COLUMN material  integer ;
COMMENT ON COLUMN qgep.od_reach.material IS 'Material of pipe / Rohrmaterial / Matériau du tuyau';
 ALTER TABLE qgep.od_reach ADD COLUMN progression  geometry ;
COMMENT ON COLUMN qgep.od_reach.progression IS 'yyy_Reihenfolge von Punkten die den genauen Verlauf eines Kanals beschreiben, insbesondere dann, wenn keine direkte Verbindung zwischen zwei Schächten. / Reihenfolge von Punkten die den genauen Verlauf eines Kanals beschreiben, insbesondere dann, wenn kei';
SELECT AddGeometryColumn('qgep', 'od_reach', 'progression3d_geometry', 21781, 'LINESTRING', 2);
COMMENT ON COLUMN qgep.od_reach.progression3d_geometry IS 'yy_Reihenfolge von Punkten die den genauen Verlauf eines Kanals beschreiben, insbesondere dann, wenn keine direkte Verbindung zwischen zwei Schächten. / Reihenfolge von Punkten (3D Koordinaten) die den genauen Verlauf eines Kanals beschreiben, insbesonder';
 ALTER TABLE qgep.od_reach ADD COLUMN ring_stiffness  smallint ;
COMMENT ON COLUMN qgep.od_reach.ring_stiffness IS 'yyy Ringsteifigkeitsklasse - Druckfestigkeit gegen Belastungen von aussen (gemäss ISO 13966 ) / Ringsteifigkeitsklasse - Druckfestigkeit gegen Belastungen von aussen (gemäss ISO 13966 ) / Rigidité annulaire pour des pressions extérieures (selon ISO 13966)';
 ALTER TABLE qgep.od_reach ADD COLUMN slope_building_plan  smallint ;
COMMENT ON COLUMN qgep.od_reach.slope_building_plan IS 'yyy / Auf dem alten Plan eingezeichnetes Plangefälle. Nicht kontrolliert im Feld. Kann nicht für die hydraulische Berechnungen übernommen werden. Für Liegenschaftsentwässerung und Meliorationsleitungen. Darstellung als z.B. 3.5%oP auf Plänen. / Pente indi';
 ALTER TABLE qgep.od_reach ADD COLUMN wall_roughness  decimal(3,2) ;
COMMENT ON COLUMN qgep.od_reach.wall_roughness IS 'yyy Hydraulische Kenngrösse zur Beschreibung der Beschaffenheit der Kanalwandung. Beiwert für die Formeln nach Prandtl-Colebrook (ks oder kb) / Hydraulische Kenngrösse zur Beschreibung der Beschaffenheit der Kanalwandung. Beiwert für die Formeln nach Pran';
-------
CREATE TABLE qgep.od_wastewater_node
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_wastewater_node_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_wastewater_node.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_wastewater_node ADD COLUMN backflow_level  decimal(4,3) ;
COMMENT ON COLUMN qgep.od_wastewater_node.backflow_level IS ' / 1. Massgebende Rückstaukote bezogen auf den Berechnungsregen (dss)  2. Höhe, unter der innerhalb der Grundstücksentwässerung besondere Massnahmen gegen Rückstau zu treffen sind. (DIN 4045) / Cote de refoulement déterminante calculée à partir des pluies';
 ALTER TABLE qgep.od_wastewater_node ADD COLUMN bottom_level  decimal(4,3) ;
COMMENT ON COLUMN qgep.od_wastewater_node.bottom_level IS ' / Tiefster Punkt des Abwasserbauwerkes / Point le plus bas du noeud';
SELECT AddGeometryColumn('qgep', 'od_wastewater_node', 'situation_geometry', 21781, 'POINT', 2);
COMMENT ON COLUMN qgep.od_wastewater_node.situation_geometry IS 'yyy Situation of node. Decisive reference point for sewer network simulation  (In der Regel Lage des Pickellochs oder Lage des Trockenwetterauslauf) / Lage des Knotens, massgebender Bezugspunkt für die Kanalnetzberechnung. (In der Regel Lage des Pickelloc';
-------
CREATE TABLE qgep.od_prank_weir
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_prank_weir_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_prank_weir.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_prank_weir ADD COLUMN hydraulic_overflow_lenght  decimal(5,2) ;
COMMENT ON COLUMN qgep.od_prank_weir.hydraulic_overflow_lenght IS ' / Hydraulisch wirksame Wehrlänge / Longueur du déversoir hydrauliquement active';
 ALTER TABLE qgep.od_prank_weir ADD COLUMN max_level  decimal(4,3) ;
COMMENT ON COLUMN qgep.od_prank_weir.max_level IS ' / Höhe des höchsten Punktes der Überfallkante / Niveau max. de la crête déversante';
 ALTER TABLE qgep.od_prank_weir ADD COLUMN min_level  decimal(4,3) ;
COMMENT ON COLUMN qgep.od_prank_weir.min_level IS ' / Höhe des tiefsten Punktes der Überfallkante / Niveau min. de la crête déversante';
 ALTER TABLE qgep.od_prank_weir ADD COLUMN yyy_ueberfallkante  integer ;
COMMENT ON COLUMN qgep.od_prank_weir.yyy_ueberfallkante IS ' / Ausbildung der Überfallkante / Forme de la crête';
 ALTER TABLE qgep.od_prank_weir ADD COLUMN yyy_wehrschwellenzahl  integer ;
COMMENT ON COLUMN qgep.od_prank_weir.yyy_wehrschwellenzahl IS ' / Anordnung der Überfallkante / Disposition des parois déversantes';
-------
CREATE TABLE qgep.od_pump
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_pump_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_pump.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_pump ADD COLUMN aggregate_number  smallint ;
COMMENT ON COLUMN qgep.od_pump.aggregate_number IS ' t';
 ALTER TABLE qgep.od_pump ADD COLUMN contruction_type  integer ;
COMMENT ON COLUMN qgep.od_pump.contruction_type IS ' / Pumpenarten / Types de pompe';
 ALTER TABLE qgep.od_pump ADD COLUMN start_level  decimal(4,3) ;
COMMENT ON COLUMN qgep.od_pump.start_level IS ' e';
 ALTER TABLE qgep.od_pump ADD COLUMN stop_level  decimal(4,3) ;
COMMENT ON COLUMN qgep.od_pump.stop_level IS ' e';
 ALTER TABLE qgep.od_pump ADD COLUMN yyy_aufstellungantrieb  integer ;
COMMENT ON COLUMN qgep.od_pump.yyy_aufstellungantrieb IS ' / Art der Aufstellung des Motors / Genre de montage';
 ALTER TABLE qgep.od_pump ADD COLUMN yyy_aufstellungfoerderaggregat  integer ;
COMMENT ON COLUMN qgep.od_pump.yyy_aufstellungfoerderaggregat IS ' / Art der Aufstellung der Pumpe / Genre de montage de la pompe';
 ALTER TABLE qgep.od_pump ADD COLUMN yyy_pumepenregime  TEXT ;
COMMENT ON COLUMN qgep.od_pump.yyy_pumepenregime IS 'yyyVorgabe, was hier erfasst werden soll / Vorgabe, was hier erfasst werden soll / Indication du contenu à saisir';
 ALTER TABLE qgep.od_pump ADD COLUMN yyy_work_point  decimal(7,2) ;
COMMENT ON COLUMN qgep.od_pump.yyy_work_point IS ' / Fördermenge für Pumpen mit fixem Arbeitspunkt / Débit refoulé par la pompe avec point de travail fixe';
-------
CREATE TABLE qgep.od_leapingweir
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_leapingweir_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_leapingweir.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_leapingweir ADD COLUMN lenght  decimal(5,2) ;
COMMENT ON COLUMN qgep.od_leapingweir.lenght IS ' t';
 ALTER TABLE qgep.od_leapingweir ADD COLUMN shape_opening  integer ;
COMMENT ON COLUMN qgep.od_leapingweir.shape_opening IS ' d';
 ALTER TABLE qgep.od_leapingweir ADD COLUMN width  decimal(5,2) ;
COMMENT ON COLUMN qgep.od_leapingweir.width IS ' t';
-------
CREATE TABLE qgep.od_fountain
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_fountain_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_fountain.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_fountain ADD COLUMN location_name  varchar(50) ;
COMMENT ON COLUMN qgep.od_fountain.location_name IS ' /  / ';
SELECT AddGeometryColumn('qgep', 'od_fountain', 'situation_geometry', 21781, 'POINT', 2);
COMMENT ON COLUMN qgep.od_fountain.situation_geometry IS 'national position coordinates (N,E) / Landeskoordinate Ost/Nord / Coordonnées nationales Est/Nord';
-------
CREATE TABLE qgep.od_reservoir
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_reservoir_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_reservoir.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_reservoir ADD COLUMN location_name  varchar(50) ;
COMMENT ON COLUMN qgep.od_reservoir.location_name IS ' /  / ';
SELECT AddGeometryColumn('qgep', 'od_reservoir', 'situation_geometry', 21781, 'POINT', 2);
COMMENT ON COLUMN qgep.od_reservoir.situation_geometry IS 'national position coordinates (N,E) / Landeskoordinate Ost/Nord / Coordonnées nationales Est/Nord';
-------
CREATE TABLE qgep.od_building
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_building_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_building.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_building ADD COLUMN house_number  varchar(50) ;
COMMENT ON COLUMN qgep.od_building.house_number IS ' / Hausnummer gemäss Grundbuch / Numéro de bâtiment selon le registre foncier';
 ALTER TABLE qgep.od_building ADD COLUMN location_name  varchar(50) ;
COMMENT ON COLUMN qgep.od_building.location_name IS ' /  / ';
SELECT AddGeometryColumn('qgep', 'od_building', 'perimeter_geometry', 21781, 'POLYGON', 2);
COMMENT ON COLUMN qgep.od_building.perimeter_geometry IS ' / Begrenzungspunkte der Fläche / Points de délimitation de la surface';
SELECT AddGeometryColumn('qgep', 'od_building', 'reference_point_geometry', 21781, 'POINT', 2);
COMMENT ON COLUMN qgep.od_building.reference_point_geometry IS ' )';
-------
CREATE TABLE qgep.od_individual_surface
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_od_individual_surface_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_individual_surface.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_individual_surface ADD COLUMN function  integer ;
COMMENT ON COLUMN qgep.od_individual_surface.function IS ' e';
SELECT AddGeometryColumn('qgep', 'od_individual_surface', 'perimeter_geometry', 21781, 'POLYGON', 2);
COMMENT ON COLUMN qgep.od_individual_surface.perimeter_geometry IS ' / Begrenzungspunkte der Fläche / Points de délimitation de la surface';
 ALTER TABLE qgep.od_individual_surface ADD COLUMN slope  smallint ;
COMMENT ON COLUMN qgep.od_individual_surface.slope IS ' / Mittlere Neigung der Oberfläche / Pente moyenne de la surface';
 ALTER TABLE qgep.od_individual_surface ADD COLUMN yyy_befestigung  integer ;
COMMENT ON COLUMN qgep.od_individual_surface.yyy_befestigung IS ' / Art der Befestigung / Genre de couverture du sol';
------------ Relationships and Value Tables ----------- 
CREATE TABLE qgep.vl_waste_water_treatment_type
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_waste_water_treatment_type_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_waste_water_treatment_type (code, value_en, value_de, value_fr) VALUES (3210,'other','andere','autres');
 INSERT INTO qgep.vl_waste_water_treatment_type (code, value_en, value_de, value_fr) VALUES (387,'','biologisch','biologique');
 INSERT INTO qgep.vl_waste_water_treatment_type (code, value_en, value_de, value_fr) VALUES (388,'','chemisch','chimique');
 INSERT INTO qgep.vl_waste_water_treatment_type (code, value_en, value_de, value_fr) VALUES (389,'','Filtration','filtration');
 INSERT INTO qgep.vl_waste_water_treatment_type (code, value_en, value_de, value_fr) VALUES (366,'','mechanisch','mecanique');
 INSERT INTO qgep.vl_waste_water_treatment_type (code, value_en, value_de, value_fr) VALUES (3076,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_waste_water_treatment ADD CONSTRAINT fkey_vl_waste_water_treatment_type FOREIGN KEY (type)
 REFERENCES qgep.vl_waste_water_treatment_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_waste_water_treatment ADD COLUMN fs_waste_water_treatment_plant varchar (16);
ALTER TABLE qgep.od_waste_water_treatment ADD CONSTRAINT rel_waste_water_treatment_waste_water_treatment_plant FOREIGN KEY (fs_waste_water_treatment_plant) REFERENCES qgep.od_waste_water_treatment_plant(obj_id);
ALTER TABLE qgep.od_wwtp_energy_use ADD COLUMN fs_waste_water_treatment_plant varchar (16);
ALTER TABLE qgep.od_wwtp_energy_use ADD CONSTRAINT rel_wwtp_energy_use_waste_water_treatment_plant FOREIGN KEY (fs_waste_water_treatment_plant) REFERENCES qgep.od_waste_water_treatment_plant(obj_id);
ALTER TABLE qgep.od_sludge_treatment ADD COLUMN fs_waste_water_treatment_plant varchar (16);
ALTER TABLE qgep.od_sludge_treatment ADD CONSTRAINT rel_sludge_treatment_waste_water_treatment_plant FOREIGN KEY (fs_waste_water_treatment_plant) REFERENCES qgep.od_waste_water_treatment_plant(obj_id);
ALTER TABLE qgep.od_fish_pass ADD COLUMN fs_yy_gewaesserverbauung varchar (16);
ALTER TABLE qgep.od_fish_pass ADD CONSTRAINT rel_fish_pass_yy_gewaesserverbauung FOREIGN KEY (fs_yy_gewaesserverbauung) REFERENCES qgep.od_water_control_structure(obj_id);
CREATE TABLE qgep.vl_water_catchement_type
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_water_catchement_type_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_water_catchement_type (code, value_en, value_de, value_fr) VALUES (24,'','Brauchwasser','eau_industrielle');
 INSERT INTO qgep.vl_water_catchement_type (code, value_en, value_de, value_fr) VALUES (25,'','Trinkwasser','eau_potable');
 INSERT INTO qgep.vl_water_catchement_type (code, value_en, value_de, value_fr) VALUES (3075,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_water_catchement ADD CONSTRAINT fkey_vl_water_catchement_type FOREIGN KEY (type)
 REFERENCES qgep.vl_water_catchement_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_water_catchement ADD COLUMN fs_yyy_grundwasserleiter varchar (16);
ALTER TABLE qgep.od_water_catchement ADD CONSTRAINT rel_water_catchement_yyy_grundwasserleiter FOREIGN KEY (fs_yyy_grundwasserleiter) REFERENCES qgep.od_aquifier(obj_id);
ALTER TABLE qgep.od_water_catchement ADD COLUMN fs_yyy_oberflaechengewaesser varchar (16);
ALTER TABLE qgep.od_water_catchement ADD CONSTRAINT rel_water_catchement_yyy_oberflaechengewaesser FOREIGN KEY (fs_yyy_oberflaechengewaesser) REFERENCES qgep.od_chute(obj_id);
CREATE TABLE qgep.vl_shore_side
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_shore_side_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_shore_side (code, value_en, value_de, value_fr) VALUES (420,'','links','gauche');
 INSERT INTO qgep.vl_shore_side (code, value_en, value_de, value_fr) VALUES (421,'','rechts','droite');
 INSERT INTO qgep.vl_shore_side (code, value_en, value_de, value_fr) VALUES (3065,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_shore ADD CONSTRAINT fkey_vl_shore_side FOREIGN KEY (side)
 REFERENCES qgep.vl_shore_side (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_shore_vegetation
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_shore_vegetation_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_shore_vegetation (code, value_en, value_de, value_fr) VALUES (325,'','fehlend','absente');
 INSERT INTO qgep.vl_shore_vegetation (code, value_en, value_de, value_fr) VALUES (323,'','standorttypisch','typique_du_lieu');
 INSERT INTO qgep.vl_shore_vegetation (code, value_en, value_de, value_fr) VALUES (324,'','standortuntypisch','non_typique_du_lieu');
 INSERT INTO qgep.vl_shore_vegetation (code, value_en, value_de, value_fr) VALUES (3025,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_shore ADD CONSTRAINT fkey_vl_shore_vegetation FOREIGN KEY (vegetation)
 REFERENCES qgep.vl_shore_vegetation (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_shore_yyy_uferbereich
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_shore_yyy_Uferbereich_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_shore_yyy_uferbereich (code, value_en, value_de, value_fr) VALUES (404,'','gewaesserfremd','atypique_d_un_cours_d_eau');
 INSERT INTO qgep.vl_shore_yyy_uferbereich (code, value_en, value_de, value_fr) VALUES (403,'','gewaessergerecht','typique_d_un_cours_d_eau');
 INSERT INTO qgep.vl_shore_yyy_uferbereich (code, value_en, value_de, value_fr) VALUES (405,'','kuenstlich','artificielle');
 INSERT INTO qgep.vl_shore_yyy_uferbereich (code, value_en, value_de, value_fr) VALUES (3081,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_shore ADD CONSTRAINT fkey_vl_shore_yyy_Uferbereich FOREIGN KEY (yyy_Uferbereich)
 REFERENCES qgep.vl_shore_yyy_uferbereich (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_shore_yyy_umlandnutzung
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_shore_yyy_Umlandnutzung_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_shore_yyy_umlandnutzung (code, value_en, value_de, value_fr) VALUES (424,'','Bebauungen','constructions');
 INSERT INTO qgep.vl_shore_yyy_umlandnutzung (code, value_en, value_de, value_fr) VALUES (425,'','Gruenland','espaces_verts');
 INSERT INTO qgep.vl_shore_yyy_umlandnutzung (code, value_en, value_de, value_fr) VALUES (3068,'unknown','unbekannt','inconnu');
 INSERT INTO qgep.vl_shore_yyy_umlandnutzung (code, value_en, value_de, value_fr) VALUES (426,'','Wald','foret');
 ALTER TABLE qgep.od_shore ADD CONSTRAINT fkey_vl_shore_yyy_Umlandnutzung FOREIGN KEY (yyy_Umlandnutzung)
 REFERENCES qgep.vl_shore_yyy_umlandnutzung (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_shore_yyy_verbauungsart
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_shore_yyy_Verbauungsart_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_shore_yyy_verbauungsart (code, value_en, value_de, value_fr) VALUES (3489,'','andere_dicht','autres_impermeables');
 INSERT INTO qgep.vl_shore_yyy_verbauungsart (code, value_en, value_de, value_fr) VALUES (3486,'','Betongitterstein_dicht','brique_perforee_en_beton_impermeable');
 INSERT INTO qgep.vl_shore_yyy_verbauungsart (code, value_en, value_de, value_fr) VALUES (3485,'','Holz_durchlaessig','bois_permeable');
 INSERT INTO qgep.vl_shore_yyy_verbauungsart (code, value_en, value_de, value_fr) VALUES (3482,'','keine_Verbauung','aucun_amenagement');
 INSERT INTO qgep.vl_shore_yyy_verbauungsart (code, value_en, value_de, value_fr) VALUES (3483,'','Lebendverbau_durchlaessig','materiau_vegetal_permeable');
 INSERT INTO qgep.vl_shore_yyy_verbauungsart (code, value_en, value_de, value_fr) VALUES (3488,'','Mauer_dicht','mur_impermeable');
 INSERT INTO qgep.vl_shore_yyy_verbauungsart (code, value_en, value_de, value_fr) VALUES (3487,'','Naturstein_dicht','pierre_naturelle_impermeable');
 INSERT INTO qgep.vl_shore_yyy_verbauungsart (code, value_en, value_de, value_fr) VALUES (3484,'','Naturstein_locker_durchlaessig','pierre_naturelle_lache');
 INSERT INTO qgep.vl_shore_yyy_verbauungsart (code, value_en, value_de, value_fr) VALUES (3080,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_shore ADD CONSTRAINT fkey_vl_shore_yyy_Verbauungsart FOREIGN KEY (yyy_Verbauungsart)
 REFERENCES qgep.vl_shore_yyy_verbauungsart (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_shore_yyy_verbauungsgrad
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_shore_yyy_Verbauungsgrad_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_shore_yyy_verbauungsgrad (code, value_en, value_de, value_fr) VALUES (341,'','keine','nul');
 INSERT INTO qgep.vl_shore_yyy_verbauungsgrad (code, value_en, value_de, value_fr) VALUES (2612,'','maessig','moyen');
 INSERT INTO qgep.vl_shore_yyy_verbauungsgrad (code, value_en, value_de, value_fr) VALUES (2613,'','stark','fort');
 INSERT INTO qgep.vl_shore_yyy_verbauungsgrad (code, value_en, value_de, value_fr) VALUES (2614,'','ueberwiegend','preponderant');
 INSERT INTO qgep.vl_shore_yyy_verbauungsgrad (code, value_en, value_de, value_fr) VALUES (3026,'unknown','unbekannt','inconnu');
 INSERT INTO qgep.vl_shore_yyy_verbauungsgrad (code, value_en, value_de, value_fr) VALUES (2611,'','vereinzelt','localise');
 INSERT INTO qgep.vl_shore_yyy_verbauungsgrad (code, value_en, value_de, value_fr) VALUES (2615,'','vollstaendig','total');
 ALTER TABLE qgep.od_shore ADD CONSTRAINT fkey_vl_shore_yyy_Verbauungsgrad FOREIGN KEY (yyy_Verbauungsgrad)
 REFERENCES qgep.vl_shore_yyy_verbauungsgrad (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_shore ADD COLUMN fs_yy_gewaesserabschnitt varchar (16);
ALTER TABLE qgep.od_shore ADD CONSTRAINT rel_shore_yy_gewaesserabschnitt FOREIGN KEY (fs_yy_gewaesserabschnitt) REFERENCES qgep.od_water_course_segment(obj_id);
ALTER TABLE qgep.od_water_control_structure ADD COLUMN fs_yy_gewaesserabschnitt varchar (16);
ALTER TABLE qgep.od_water_control_structure ADD CONSTRAINT rel_water_control_structure_yy_gewaesserabschnitt FOREIGN KEY (fs_yy_gewaesserabschnitt) REFERENCES qgep.od_water_course_segment(obj_id);
CREATE TABLE qgep.vl_river_bed_type
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_river_bed_type_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_river_bed_type (code, value_en, value_de, value_fr) VALUES (290,'hard','hart','dur');
 INSERT INTO qgep.vl_river_bed_type (code, value_en, value_de, value_fr) VALUES (3089,'unknown','unbekannt','inconnu');
 INSERT INTO qgep.vl_river_bed_type (code, value_en, value_de, value_fr) VALUES (289,'soft','weich','tendre');
 ALTER TABLE qgep.od_river_bed ADD CONSTRAINT fkey_vl_river_bed_type FOREIGN KEY (type)
 REFERENCES qgep.vl_river_bed_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_river_bed_yyy_verbauungsart
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_river_bed_yyy_Verbauungsart_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_river_bed_yyy_verbauungsart (code, value_en, value_de, value_fr) VALUES (3481,'','andere_dicht','autres_impermeables');
 INSERT INTO qgep.vl_river_bed_yyy_verbauungsart (code, value_en, value_de, value_fr) VALUES (338,'','Betongittersteine','briques_perforees_en_beton');
 INSERT INTO qgep.vl_river_bed_yyy_verbauungsart (code, value_en, value_de, value_fr) VALUES (3479,'wood','Holz','bois');
 INSERT INTO qgep.vl_river_bed_yyy_verbauungsart (code, value_en, value_de, value_fr) VALUES (3477,'','keine_Verbauung','aucun_amenagement');
 INSERT INTO qgep.vl_river_bed_yyy_verbauungsart (code, value_en, value_de, value_fr) VALUES (3478,'','Steinschuettung_Blockwurf','pierres_naturelles');
 INSERT INTO qgep.vl_river_bed_yyy_verbauungsart (code, value_en, value_de, value_fr) VALUES (3079,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_river_bed ADD CONSTRAINT fkey_vl_river_bed_yyy_Verbauungsart FOREIGN KEY (yyy_Verbauungsart)
 REFERENCES qgep.vl_river_bed_yyy_verbauungsart (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_river_bed_yyy_verbauungsgrad
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_river_bed_yyy_Verbauungsgrad_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_river_bed_yyy_verbauungsgrad (code, value_en, value_de, value_fr) VALUES (142,'','keine','nul');
 INSERT INTO qgep.vl_river_bed_yyy_verbauungsgrad (code, value_en, value_de, value_fr) VALUES (2607,'','maessig','moyen');
 INSERT INTO qgep.vl_river_bed_yyy_verbauungsgrad (code, value_en, value_de, value_fr) VALUES (2608,'','stark','fort');
 INSERT INTO qgep.vl_river_bed_yyy_verbauungsgrad (code, value_en, value_de, value_fr) VALUES (2609,'','ueberwiegend','preponderant');
 INSERT INTO qgep.vl_river_bed_yyy_verbauungsgrad (code, value_en, value_de, value_fr) VALUES (3085,'unknown','unbekannt','inconnu');
 INSERT INTO qgep.vl_river_bed_yyy_verbauungsgrad (code, value_en, value_de, value_fr) VALUES (2606,'','vereinzelt','localise');
 INSERT INTO qgep.vl_river_bed_yyy_verbauungsgrad (code, value_en, value_de, value_fr) VALUES (2610,'','vollstaendig','total');
 ALTER TABLE qgep.od_river_bed ADD CONSTRAINT fkey_vl_river_bed_yyy_Verbauungsgrad FOREIGN KEY (yyy_Verbauungsgrad)
 REFERENCES qgep.vl_river_bed_yyy_verbauungsgrad (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_river_bed ADD COLUMN fs_yy_gewaesserabschnitt varchar (16);
ALTER TABLE qgep.od_river_bed ADD CONSTRAINT rel_river_bed_yy_gewaesserabschnitt FOREIGN KEY (fs_yy_gewaesserabschnitt) REFERENCES qgep.od_water_course_segment(obj_id);
ALTER TABLE qgep.od_bathing_area ADD COLUMN fs_yyy_oberflaechengewaesser varchar (16);
ALTER TABLE qgep.od_bathing_area ADD CONSTRAINT rel_bathing_area_yyy_oberflaechengewaesser FOREIGN KEY (fs_yyy_oberflaechengewaesser) REFERENCES qgep.od_chute(obj_id);
CREATE TABLE qgep.vl_sector_water_body_type
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_sector_water_body_type_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_sector_water_body_type (code, value_en, value_de, value_fr) VALUES (2657,'','Gewaesser','lac_ou_cours_d_eau');
 INSERT INTO qgep.vl_sector_water_body_type (code, value_en, value_de, value_fr) VALUES (2729,'','ParallelerAbschnitt','troncon_parallele');
 INSERT INTO qgep.vl_sector_water_body_type (code, value_en, value_de, value_fr) VALUES (2728,'','Seetraverse','element_traversant_un_lac');
 INSERT INTO qgep.vl_sector_water_body_type (code, value_en, value_de, value_fr) VALUES (2656,'','Ufer','rives');
 INSERT INTO qgep.vl_sector_water_body_type (code, value_en, value_de, value_fr) VALUES (3054,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_sector_water_body ADD CONSTRAINT fkey_vl_sector_water_body_type FOREIGN KEY (type)
 REFERENCES qgep.vl_sector_water_body_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_sector_water_body ADD COLUMN fs_yyy_oberflaechengewaesser varchar (16);
ALTER TABLE qgep.od_sector_water_body ADD CONSTRAINT rel_sector_water_body_yyy_oberflaechengewaesser FOREIGN KEY (fs_yyy_oberflaechengewaesser) REFERENCES qgep.od_chute(obj_id);
CREATE TABLE qgep.vl_water_course_segment_depth_variability
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_water_course_segment_depth_variability_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_water_course_segment_depth_variability (code, value_en, value_de, value_fr) VALUES (2617,'','ausgepraegt','prononcee');
 INSERT INTO qgep.vl_water_course_segment_depth_variability (code, value_en, value_de, value_fr) VALUES (2619,'','keine','aucune');
 INSERT INTO qgep.vl_water_course_segment_depth_variability (code, value_en, value_de, value_fr) VALUES (2618,'','maessig','moyenne');
 INSERT INTO qgep.vl_water_course_segment_depth_variability (code, value_en, value_de, value_fr) VALUES (3049,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_water_course_segment ADD CONSTRAINT fkey_vl_water_course_segment_depth_variability FOREIGN KEY (depth_variability)
 REFERENCES qgep.vl_water_course_segment_depth_variability (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_water_course_segment_length_profile
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_water_course_segment_length_profile_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_water_course_segment_length_profile (code, value_en, value_de, value_fr) VALUES (97,'','kaskadenartig','avec_des_cascades');
 INSERT INTO qgep.vl_water_course_segment_length_profile (code, value_en, value_de, value_fr) VALUES (3602,'','Schnellen_Kolke','avec_rapides_marmites');
 INSERT INTO qgep.vl_water_course_segment_length_profile (code, value_en, value_de, value_fr) VALUES (99,'','stetig','continu');
 INSERT INTO qgep.vl_water_course_segment_length_profile (code, value_en, value_de, value_fr) VALUES (3035,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_water_course_segment ADD CONSTRAINT fkey_vl_water_course_segment_length_profile FOREIGN KEY (length_profile)
 REFERENCES qgep.vl_water_course_segment_length_profile (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_water_course_segment_slope
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_water_course_segment_slope_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_water_course_segment_slope (code, value_en, value_de, value_fr) VALUES (291,'','flach','plat');
 INSERT INTO qgep.vl_water_course_segment_slope (code, value_en, value_de, value_fr) VALUES (292,'','mittel','moyen');
 INSERT INTO qgep.vl_water_course_segment_slope (code, value_en, value_de, value_fr) VALUES (293,'','steil','raide');
 INSERT INTO qgep.vl_water_course_segment_slope (code, value_en, value_de, value_fr) VALUES (3019,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_water_course_segment ADD CONSTRAINT fkey_vl_water_course_segment_slope FOREIGN KEY (slope)
 REFERENCES qgep.vl_water_course_segment_slope (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_water_course_segment_type
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_water_course_segment_type_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_water_course_segment_type (code, value_en, value_de, value_fr) VALUES (2710,'','eingedolt','mis_sous_terre');
 INSERT INTO qgep.vl_water_course_segment_type (code, value_en, value_de, value_fr) VALUES (2709,'','offen','ouvert');
 INSERT INTO qgep.vl_water_course_segment_type (code, value_en, value_de, value_fr) VALUES (3058,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_water_course_segment ADD CONSTRAINT fkey_vl_water_course_segment_type FOREIGN KEY (type)
 REFERENCES qgep.vl_water_course_segment_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_water_course_segment_width_variability
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_water_course_segment_width_variability_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_water_course_segment_width_variability (code, value_en, value_de, value_fr) VALUES (176,'','ausgepraegt','prononcee');
 INSERT INTO qgep.vl_water_course_segment_width_variability (code, value_en, value_de, value_fr) VALUES (177,'','eingeschraenkt','limitee');
 INSERT INTO qgep.vl_water_course_segment_width_variability (code, value_en, value_de, value_fr) VALUES (178,'','keine','nulle');
 INSERT INTO qgep.vl_water_course_segment_width_variability (code, value_en, value_de, value_fr) VALUES (3078,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_water_course_segment ADD CONSTRAINT fkey_vl_water_course_segment_width_variability FOREIGN KEY (width_variability)
 REFERENCES qgep.vl_water_course_segment_width_variability (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_water_course_segment_yy_nutzung
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_water_course_segment_yy_Nutzung_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_water_course_segment_yy_nutzung (code, value_en, value_de, value_fr) VALUES (384,'','Erholung','detente');
 INSERT INTO qgep.vl_water_course_segment_yy_nutzung (code, value_en, value_de, value_fr) VALUES (429,'','Fischerei','peche');
 INSERT INTO qgep.vl_water_course_segment_yy_nutzung (code, value_en, value_de, value_fr) VALUES (385,'','Stauanlage','installation_de_retenue');
 INSERT INTO qgep.vl_water_course_segment_yy_nutzung (code, value_en, value_de, value_fr) VALUES (3039,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_water_course_segment ADD CONSTRAINT fkey_vl_water_course_segment_yy_Nutzung FOREIGN KEY (yy_Nutzung)
 REFERENCES qgep.vl_water_course_segment_yy_nutzung (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_water_course_segment_yyy_abflussregime
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_water_course_segment_yyy_Abflussregime_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_water_course_segment_yyy_abflussregime (code, value_en, value_de, value_fr) VALUES (297,'','beeintraechtigt','modifie');
 INSERT INTO qgep.vl_water_course_segment_yyy_abflussregime (code, value_en, value_de, value_fr) VALUES (428,'','kuenstlich','artificiel');
 INSERT INTO qgep.vl_water_course_segment_yyy_abflussregime (code, value_en, value_de, value_fr) VALUES (427,'','naturfern','peu_naturel');
 INSERT INTO qgep.vl_water_course_segment_yyy_abflussregime (code, value_en, value_de, value_fr) VALUES (296,'','naturnah','presque_naturel');
 INSERT INTO qgep.vl_water_course_segment_yyy_abflussregime (code, value_en, value_de, value_fr) VALUES (3091,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_water_course_segment ADD CONSTRAINT fkey_vl_water_course_segment_yyy_Abflussregime FOREIGN KEY (yyy_Abflussregime)
 REFERENCES qgep.vl_water_course_segment_yyy_abflussregime (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_water_course_segment_yyy_algenbewuchs
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_water_course_segment_yyy_Algenbewuchs_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_water_course_segment_yyy_algenbewuchs (code, value_en, value_de, value_fr) VALUES (2623,'','kein_gering','absent_faible');
 INSERT INTO qgep.vl_water_course_segment_yyy_algenbewuchs (code, value_en, value_de, value_fr) VALUES (2624,'','maessig_stark','moyen_fort');
 INSERT INTO qgep.vl_water_course_segment_yyy_algenbewuchs (code, value_en, value_de, value_fr) VALUES (2625,'','uebermaessig_wuchernd','tres_fort_proliferation');
 INSERT INTO qgep.vl_water_course_segment_yyy_algenbewuchs (code, value_en, value_de, value_fr) VALUES (3050,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_water_course_segment ADD CONSTRAINT fkey_vl_water_course_segment_yyy_Algenbewuchs FOREIGN KEY (yyy_Algenbewuchs)
 REFERENCES qgep.vl_water_course_segment_yyy_algenbewuchs (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_water_course_segment_yyy_hoehenstufe
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_water_course_segment_yyy_Hoehenstufe_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_water_course_segment_yyy_hoehenstufe (code, value_en, value_de, value_fr) VALUES (320,'','alpin','alpin');
 INSERT INTO qgep.vl_water_course_segment_yyy_hoehenstufe (code, value_en, value_de, value_fr) VALUES (294,'','kollin','des_collines');
 INSERT INTO qgep.vl_water_course_segment_yyy_hoehenstufe (code, value_en, value_de, value_fr) VALUES (295,'','montan','montagnard');
 INSERT INTO qgep.vl_water_course_segment_yyy_hoehenstufe (code, value_en, value_de, value_fr) VALUES (319,'','subalpin','subalpin');
 INSERT INTO qgep.vl_water_course_segment_yyy_hoehenstufe (code, value_en, value_de, value_fr) VALUES (3020,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_water_course_segment ADD CONSTRAINT fkey_vl_water_course_segment_yyy_Hoehenstufe FOREIGN KEY (yyy_Hoehenstufe)
 REFERENCES qgep.vl_water_course_segment_yyy_hoehenstufe (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_water_course_segment_yyy_linienfuehrung
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_water_course_segment_yyy_Linienfuehrung_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_water_course_segment_yyy_linienfuehrung (code, value_en, value_de, value_fr) VALUES (4575,'','gerade','rectiligne');
 INSERT INTO qgep.vl_water_course_segment_yyy_linienfuehrung (code, value_en, value_de, value_fr) VALUES (4580,'','leichtbogig','legerement_incurve');
 INSERT INTO qgep.vl_water_course_segment_yyy_linienfuehrung (code, value_en, value_de, value_fr) VALUES (4579,'','maeandrierend','en_meandres');
 INSERT INTO qgep.vl_water_course_segment_yyy_linienfuehrung (code, value_en, value_de, value_fr) VALUES (4578,'','starkbogig','fortement_incurve');
 INSERT INTO qgep.vl_water_course_segment_yyy_linienfuehrung (code, value_en, value_de, value_fr) VALUES (4576,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_water_course_segment ADD CONSTRAINT fkey_vl_water_course_segment_yyy_Linienfuehrung FOREIGN KEY (yyy_Linienfuehrung)
 REFERENCES qgep.vl_water_course_segment_yyy_linienfuehrung (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_water_course_segment_yyy_makrophytenbewuchs
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_water_course_segment_yyy_Makrophytenbewuchs_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_water_course_segment_yyy_makrophytenbewuchs (code, value_en, value_de, value_fr) VALUES (2626,'','kein_gering','absent_faible');
 INSERT INTO qgep.vl_water_course_segment_yyy_makrophytenbewuchs (code, value_en, value_de, value_fr) VALUES (2627,'','maessig_stark','moyen_fort');
 INSERT INTO qgep.vl_water_course_segment_yyy_makrophytenbewuchs (code, value_en, value_de, value_fr) VALUES (2628,'','uebermaessig_wuchernd','tres_fort_proliferation');
 INSERT INTO qgep.vl_water_course_segment_yyy_makrophytenbewuchs (code, value_en, value_de, value_fr) VALUES (3051,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_water_course_segment ADD CONSTRAINT fkey_vl_water_course_segment_yyy_Makrophytenbewuchs FOREIGN KEY (yyy_Makrophytenbewuchs)
 REFERENCES qgep.vl_water_course_segment_yyy_makrophytenbewuchs (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_water_course_segment_yyy_oekom_klassifizierung
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_water_course_segment_yyy_Oekom_Klassifizierung_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_water_course_segment_yyy_oekom_klassifizierung (code, value_en, value_de, value_fr) VALUES (3496,'','eingedolt','mis_sous_terre');
 INSERT INTO qgep.vl_water_course_segment_yyy_oekom_klassifizierung (code, value_en, value_de, value_fr) VALUES (3495,'','kuenstlich_naturfremd','artificiel_peu_naturel');
 INSERT INTO qgep.vl_water_course_segment_yyy_oekom_klassifizierung (code, value_en, value_de, value_fr) VALUES (3492,'','natuerlich_naturnah','naturel_presque_naturel');
 INSERT INTO qgep.vl_water_course_segment_yyy_oekom_klassifizierung (code, value_en, value_de, value_fr) VALUES (3491,'','nicht_klassiert','pas_classifie');
 INSERT INTO qgep.vl_water_course_segment_yyy_oekom_klassifizierung (code, value_en, value_de, value_fr) VALUES (3494,'','stark_beeintraechtigt','fortement_modifie');
 INSERT INTO qgep.vl_water_course_segment_yyy_oekom_klassifizierung (code, value_en, value_de, value_fr) VALUES (3493,'','wenig_beeintraechtigt','peu_modifie');
 ALTER TABLE qgep.od_water_course_segment ADD CONSTRAINT fkey_vl_water_course_segment_yyy_Oekom_Klassifizierung FOREIGN KEY (yyy_Oekom_Klassifizierung)
 REFERENCES qgep.vl_water_course_segment_yyy_oekom_klassifizierung (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_water_course_segment_yyy_totholz
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_water_course_segment_yyy_Totholz_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_water_course_segment_yyy_totholz (code, value_en, value_de, value_fr) VALUES (2629,'','Ansammlungen','amas');
 INSERT INTO qgep.vl_water_course_segment_yyy_totholz (code, value_en, value_de, value_fr) VALUES (2631,'','kein_vereinzelt','absent_localise');
 INSERT INTO qgep.vl_water_course_segment_yyy_totholz (code, value_en, value_de, value_fr) VALUES (3052,'unknown','unbekannt','inconnu');
 INSERT INTO qgep.vl_water_course_segment_yyy_totholz (code, value_en, value_de, value_fr) VALUES (2630,'','zerstreut','dissemine');
 ALTER TABLE qgep.od_water_course_segment ADD CONSTRAINT fkey_vl_water_course_segment_yyy_Totholz FOREIGN KEY (yyy_Totholz)
 REFERENCES qgep.vl_water_course_segment_yyy_totholz (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_water_course_segment_yyy_wasserhaerte
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_water_course_segment_yyy_Wasserhaerte_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_water_course_segment_yyy_wasserhaerte (code, value_en, value_de, value_fr) VALUES (321,'','Kalk','calcaire');
 INSERT INTO qgep.vl_water_course_segment_yyy_wasserhaerte (code, value_en, value_de, value_fr) VALUES (322,'','Silikat','silicieuse');
 INSERT INTO qgep.vl_water_course_segment_yyy_wasserhaerte (code, value_en, value_de, value_fr) VALUES (3024,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_water_course_segment ADD CONSTRAINT fkey_vl_water_course_segment_yyy_Wasserhaerte FOREIGN KEY (yyy_Wasserhaerte)
 REFERENCES qgep.vl_water_course_segment_yyy_wasserhaerte (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_water_course_segment ADD COLUMN fs_watercourse varchar (16);
ALTER TABLE qgep.od_water_course_segment ADD CONSTRAINT rel_water_course_segment_watercourse FOREIGN KEY (fs_watercourse) REFERENCES qgep.od_river(obj_id);
CREATE TABLE qgep.vl_structure_part_renovation_demand
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_structure_part_renovation_demand_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_structure_part_renovation_demand (code, value_en, value_de, value_fr) VALUES (138,'not_necessary','nicht_notwendig','pas_necessaire');
 INSERT INTO qgep.vl_structure_part_renovation_demand (code, value_en, value_de, value_fr) VALUES (137,'necessary','notwendig','necessaire');
 INSERT INTO qgep.vl_structure_part_renovation_demand (code, value_en, value_de, value_fr) VALUES (3042,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_structure_part ADD CONSTRAINT fkey_vl_structure_part_renovation_demand FOREIGN KEY (renovation_demand)
 REFERENCES qgep.vl_structure_part_renovation_demand (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_structure_part ADD COLUMN fs_wastewater_structure varchar (16);
ALTER TABLE qgep.od_structure_part ADD CONSTRAINT rel_structure_part_wastewater_structure FOREIGN KEY (fs_wastewater_structure) REFERENCES qgep.od_wastewater_structure(obj_id);
ALTER TABLE qgep.od_hydr_geom_relation ADD COLUMN fs_hydr_geometry varchar (16);
ALTER TABLE qgep.od_hydr_geom_relation ADD CONSTRAINT rel_hydr_geom_relation_hydr_geometry FOREIGN KEY (fs_hydr_geometry) REFERENCES qgep.od_hydr_geometry(obj_id);
ALTER TABLE qgep.od_hq_relation ADD COLUMN fs_yy_ueberlaufcharakteristik varchar (16);
ALTER TABLE qgep.od_hq_relation ADD CONSTRAINT rel_hq_relation_yy_ueberlaufcharakteristik FOREIGN KEY (fs_yy_ueberlaufcharakteristik) REFERENCES qgep.od_overflow_characteristic(obj_id);
ALTER TABLE qgep.od_wastewater_networkelement ADD COLUMN fs_wastewater_structure varchar (16);
ALTER TABLE qgep.od_wastewater_networkelement ADD CONSTRAINT rel_wastewater_networkelement_wastewater_structure FOREIGN KEY (fs_wastewater_structure) REFERENCES qgep.od_wastewater_structure(obj_id);
CREATE TABLE qgep.vl_maintenance_event_disposition_state
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_maintenance_event_disposition_state_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_maintenance_event_disposition_state (code, value_en, value_de, value_fr) VALUES (2550,'','ausgefuehrt','execute');
 INSERT INTO qgep.vl_maintenance_event_disposition_state (code, value_en, value_de, value_fr) VALUES (2549,'','geplant','planifie');
 INSERT INTO qgep.vl_maintenance_event_disposition_state (code, value_en, value_de, value_fr) VALUES (3678,'','nicht_moeglich','impossible');
 INSERT INTO qgep.vl_maintenance_event_disposition_state (code, value_en, value_de, value_fr) VALUES (3047,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_maintenance_event ADD CONSTRAINT fkey_vl_maintenance_event_disposition_state FOREIGN KEY (disposition_state)
 REFERENCES qgep.vl_maintenance_event_disposition_state (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_maintenance_event_type
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_maintenance_event_type_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_maintenance_event_type (code, value_en, value_de, value_fr) VALUES (2982,'other','andere','autres');
 INSERT INTO qgep.vl_maintenance_event_type (code, value_en, value_de, value_fr) VALUES (120,'','Erneuerung','renouvellement');
 INSERT INTO qgep.vl_maintenance_event_type (code, value_en, value_de, value_fr) VALUES (28,'cleaning','Reinigung','nettoyage');
 INSERT INTO qgep.vl_maintenance_event_type (code, value_en, value_de, value_fr) VALUES (4529,'renovation','Renovierung','renovation');
 INSERT INTO qgep.vl_maintenance_event_type (code, value_en, value_de, value_fr) VALUES (4528,'repair','Reparatur','reparation');
 INSERT INTO qgep.vl_maintenance_event_type (code, value_en, value_de, value_fr) VALUES (4530,'','Sanierung','rehabilitation');
 INSERT INTO qgep.vl_maintenance_event_type (code, value_en, value_de, value_fr) VALUES (3045,'unknown','unbekannt','inconnu');
 INSERT INTO qgep.vl_maintenance_event_type (code, value_en, value_de, value_fr) VALUES (4564,'','Untersuchung','examen');
 ALTER TABLE qgep.od_maintenance_event ADD CONSTRAINT fkey_vl_maintenance_event_type FOREIGN KEY (type)
 REFERENCES qgep.vl_maintenance_event_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_maintenance_event ADD COLUMN fs_wastewater_structure varchar (16);
ALTER TABLE qgep.od_maintenance_event ADD CONSTRAINT rel_maintenance_event_wastewater_structure FOREIGN KEY (fs_wastewater_structure) REFERENCES qgep.od_wastewater_structure(obj_id);
CREATE TABLE qgep.vl_retention_body_type
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_retention_body_type_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_retention_body_type (code, value_en, value_de, value_fr) VALUES (2992,'other','andere','autres');
 INSERT INTO qgep.vl_retention_body_type (code, value_en, value_de, value_fr) VALUES (346,'','Biotop','retention_dans_bassins_et_depressions');
 INSERT INTO qgep.vl_retention_body_type (code, value_en, value_de, value_fr) VALUES (345,'','Dachretention','retention_sur_toits');
 INSERT INTO qgep.vl_retention_body_type (code, value_en, value_de, value_fr) VALUES (348,'','Parkplatz','retention_sur_routes_et_places');
 INSERT INTO qgep.vl_retention_body_type (code, value_en, value_de, value_fr) VALUES (347,'','Staukanal','retention_dans_canalisations_stockage');
 INSERT INTO qgep.vl_retention_body_type (code, value_en, value_de, value_fr) VALUES (3031,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_retention_body ADD CONSTRAINT fkey_vl_retention_body_type FOREIGN KEY (type)
 REFERENCES qgep.vl_retention_body_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_retention_body ADD COLUMN fs_infiltration_installation varchar (16);
ALTER TABLE qgep.od_retention_body ADD CONSTRAINT rel_retention_body_infiltration_installation FOREIGN KEY (fs_infiltration_installation) REFERENCES qgep.od_infiltration_installation(obj_id);
CREATE TABLE qgep.vl_pipe_profile_profile_type
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_pipe_profile_profile_type_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_pipe_profile_profile_type (code, value_en, value_de, value_fr) VALUES (3356,'other','andere','autres');
 INSERT INTO qgep.vl_pipe_profile_profile_type (code, value_en, value_de, value_fr) VALUES (3351,'egg_profile','Eiprofil','ovoide');
 INSERT INTO qgep.vl_pipe_profile_profile_type (code, value_en, value_de, value_fr) VALUES (3350,'circular_profile','Kreisprofil','circulaire');
 INSERT INTO qgep.vl_pipe_profile_profile_type (code, value_en, value_de, value_fr) VALUES (3352,'mouth_profile','Maulprofil','profil_en_voute');
 INSERT INTO qgep.vl_pipe_profile_profile_type (code, value_en, value_de, value_fr) VALUES (3354,'open_profile','offenes_Profil','profil_ouvert');
 INSERT INTO qgep.vl_pipe_profile_profile_type (code, value_en, value_de, value_fr) VALUES (3353,'rectangular_profile','Rechteckprofil','rectangulaire');
 INSERT INTO qgep.vl_pipe_profile_profile_type (code, value_en, value_de, value_fr) VALUES (3355,'special_profile','Spezialprofil','profil_special');
 INSERT INTO qgep.vl_pipe_profile_profile_type (code, value_en, value_de, value_fr) VALUES (3357,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_pipe_profile ADD CONSTRAINT fkey_vl_pipe_profile_profile_type FOREIGN KEY (profile_type)
 REFERENCES qgep.vl_pipe_profile_profile_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_reach_point_elevation_accuracy
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_reach_point_elevation_accuracy_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_reach_point_elevation_accuracy (code, value_en, value_de, value_fr) VALUES (3248,'more_than_6cm','groesser_6cm','plusque_6cm');
 INSERT INTO qgep.vl_reach_point_elevation_accuracy (code, value_en, value_de, value_fr) VALUES (3245,'plusminus_1cm','plusminus_1cm','plus_moins_1cm');
 INSERT INTO qgep.vl_reach_point_elevation_accuracy (code, value_en, value_de, value_fr) VALUES (3246,'plusminus_3cm','plusminus_3cm','plus_moins_3cm');
 INSERT INTO qgep.vl_reach_point_elevation_accuracy (code, value_en, value_de, value_fr) VALUES (3247,'plusminus_6cm','plusminus_6cm','plus_moins_6cm');
 INSERT INTO qgep.vl_reach_point_elevation_accuracy (code, value_en, value_de, value_fr) VALUES (3327,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_reach_point ADD CONSTRAINT fkey_vl_reach_point_elevation_accuracy FOREIGN KEY (elevation_accuracy)
 REFERENCES qgep.vl_reach_point_elevation_accuracy (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_reach_point_outlet_shape
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_reach_point_outlet_shape_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_reach_point_outlet_shape (code, value_en, value_de, value_fr) VALUES (285,'round_edged','abgerundet','arrondi');
 INSERT INTO qgep.vl_reach_point_outlet_shape (code, value_en, value_de, value_fr) VALUES (298,'orifice','blendenfoermig','en_forme_de_seuil_ou_diaphragme');
 INSERT INTO qgep.vl_reach_point_outlet_shape (code, value_en, value_de, value_fr) VALUES (3358,'no_cross_section_change','keine_Querschnittsaenderung','pas_de_changement_de_section');
 INSERT INTO qgep.vl_reach_point_outlet_shape (code, value_en, value_de, value_fr) VALUES (286,'sharp_edged','scharfkantig','aretes_vives');
 INSERT INTO qgep.vl_reach_point_outlet_shape (code, value_en, value_de, value_fr) VALUES (3074,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_reach_point ADD CONSTRAINT fkey_vl_reach_point_outlet_shape FOREIGN KEY (outlet_shape)
 REFERENCES qgep.vl_reach_point_outlet_shape (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_reach_point ADD COLUMN fs_wastewater_networkelement varchar (16);
ALTER TABLE qgep.od_reach_point ADD CONSTRAINT rel_reach_point_wastewater_networkelement FOREIGN KEY (fs_wastewater_networkelement) REFERENCES qgep.od_wastewater_networkelement(obj_id);
CREATE TABLE qgep.vl_wastewater_structure_accessibility
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_wastewater_structure_accessibility_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_wastewater_structure_accessibility (code, value_en, value_de, value_fr) VALUES (3444,'covered','ueberdeckt','couvert');
 INSERT INTO qgep.vl_wastewater_structure_accessibility (code, value_en, value_de, value_fr) VALUES (3447,'unknown','unbekannt','inconnu');
 INSERT INTO qgep.vl_wastewater_structure_accessibility (code, value_en, value_de, value_fr) VALUES (3446,'inaccessible','unzugaenglich','inaccessible');
 INSERT INTO qgep.vl_wastewater_structure_accessibility (code, value_en, value_de, value_fr) VALUES (3445,'accessible','zugaenglich','accessible');
 ALTER TABLE qgep.od_wastewater_structure ADD CONSTRAINT fkey_vl_wastewater_structure_accessibility FOREIGN KEY (accessibility)
 REFERENCES qgep.vl_wastewater_structure_accessibility (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_wastewater_structure_disposition_state
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_wastewater_structure_disposition_state_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_wastewater_structure_disposition_state (code, value_en, value_de, value_fr) VALUES (7,'suspended_not_filled','aufgehoben_nicht_verfuellt','supprime_non_demoli');
 INSERT INTO qgep.vl_wastewater_structure_disposition_state (code, value_en, value_de, value_fr) VALUES (3325,'suspended_unknown','aufgehoben_unbekannt','supprime_inconnu');
 INSERT INTO qgep.vl_wastewater_structure_disposition_state (code, value_en, value_de, value_fr) VALUES (3633,'nonoperational','ausser_Betrieb','hors_service');
 INSERT INTO qgep.vl_wastewater_structure_disposition_state (code, value_en, value_de, value_fr) VALUES (2763,'calculation_alternative','Berechnungsvariante','variante_de_calcul');
 INSERT INTO qgep.vl_wastewater_structure_disposition_state (code, value_en, value_de, value_fr) VALUES (2764,'planned','geplant','planifie');
 INSERT INTO qgep.vl_wastewater_structure_disposition_state (code, value_en, value_de, value_fr) VALUES (3634,'operational','in_Betrieb','en_service');
 INSERT INTO qgep.vl_wastewater_structure_disposition_state (code, value_en, value_de, value_fr) VALUES (3653,'project','Projekt','projet');
 INSERT INTO qgep.vl_wastewater_structure_disposition_state (code, value_en, value_de, value_fr) VALUES (10,'tentative','provisorisch','provisoire');
 INSERT INTO qgep.vl_wastewater_structure_disposition_state (code, value_en, value_de, value_fr) VALUES (3027,'unknown','unbekannt','inconnu');
 INSERT INTO qgep.vl_wastewater_structure_disposition_state (code, value_en, value_de, value_fr) VALUES (8,'filled','verfuellt','demoli');
 INSERT INTO qgep.vl_wastewater_structure_disposition_state (code, value_en, value_de, value_fr) VALUES (2683,'will_be_suspended','wird_aufgehoben','sera_supprime');
 ALTER TABLE qgep.od_wastewater_structure ADD CONSTRAINT fkey_vl_wastewater_structure_disposition_state FOREIGN KEY (disposition_state)
 REFERENCES qgep.vl_wastewater_structure_disposition_state (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_wastewater_structure_renovation_demand
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_wastewater_structure_renovation_demand_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_wastewater_structure_renovation_demand (code, value_en, value_de, value_fr) VALUES (1,'urgent','dringend','urgent');
 INSERT INTO qgep.vl_wastewater_structure_renovation_demand (code, value_en, value_de, value_fr) VALUES (5,'no','keiner','aucun');
 INSERT INTO qgep.vl_wastewater_structure_renovation_demand (code, value_en, value_de, value_fr) VALUES (2,'short_term','kurzfristig','a_court_terme');
 INSERT INTO qgep.vl_wastewater_structure_renovation_demand (code, value_en, value_de, value_fr) VALUES (4,'long_term','langfristig','a_long_terme');
 INSERT INTO qgep.vl_wastewater_structure_renovation_demand (code, value_en, value_de, value_fr) VALUES (3,'medium_term','mittelfristig','a_moyen_terme');
 INSERT INTO qgep.vl_wastewater_structure_renovation_demand (code, value_en, value_de, value_fr) VALUES (3023,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_wastewater_structure ADD CONSTRAINT fkey_vl_wastewater_structure_renovation_demand FOREIGN KEY (renovation_demand)
 REFERENCES qgep.vl_wastewater_structure_renovation_demand (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_wastewater_structure_structure_condition
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_wastewater_structure_structure_condition_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_wastewater_structure_structure_condition (code, value_en, value_de, value_fr) VALUES (3037,'unknown','unbekannt','inconnu');
 INSERT INTO qgep.vl_wastewater_structure_structure_condition (code, value_en, value_de, value_fr) VALUES (3363,'Z0','Z0','Z0');
 INSERT INTO qgep.vl_wastewater_structure_structure_condition (code, value_en, value_de, value_fr) VALUES (3359,'Z1','Z1','Z1');
 INSERT INTO qgep.vl_wastewater_structure_structure_condition (code, value_en, value_de, value_fr) VALUES (3360,'Z2','Z2','Z2');
 INSERT INTO qgep.vl_wastewater_structure_structure_condition (code, value_en, value_de, value_fr) VALUES (3361,'Z3','Z3','Z3');
 INSERT INTO qgep.vl_wastewater_structure_structure_condition (code, value_en, value_de, value_fr) VALUES (3362,'Z4','Z4','Z4');
 ALTER TABLE qgep.od_wastewater_structure ADD CONSTRAINT fkey_vl_wastewater_structure_structure_condition FOREIGN KEY (structure_condition)
 REFERENCES qgep.vl_wastewater_structure_structure_condition (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_wastewater_structure ADD COLUMN fs_owner varchar (16);
ALTER TABLE qgep.od_wastewater_structure ADD CONSTRAINT rel_wastewater_structure_owner FOREIGN KEY (fs_owner) REFERENCES qgep.od_organisation(obj_id);
ALTER TABLE qgep.od_wastewater_structure ADD COLUMN fs_operator varchar (16);
ALTER TABLE qgep.od_wastewater_structure ADD CONSTRAINT rel_wastewater_structure_operator FOREIGN KEY (fs_operator) REFERENCES qgep.od_organisation(obj_id);
CREATE TABLE qgep.vl_mechanical_pretreatment_type
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_mechanical_pretreatment_type_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_mechanical_pretreatment_type (code, value_en, value_de, value_fr) VALUES (3317,'','Filtersack','percolateur');
 INSERT INTO qgep.vl_mechanical_pretreatment_type (code, value_en, value_de, value_fr) VALUES (3319,'','KuenstlicherAdsorber','adsorbeur_artificiel');
 INSERT INTO qgep.vl_mechanical_pretreatment_type (code, value_en, value_de, value_fr) VALUES (3318,'','MuldenRigolenSystem','systeme_cuvettes_rigoles');
 INSERT INTO qgep.vl_mechanical_pretreatment_type (code, value_en, value_de, value_fr) VALUES (3320,'slurry_collector','Schlammsammler','collecteur_de_boue');
 INSERT INTO qgep.vl_mechanical_pretreatment_type (code, value_en, value_de, value_fr) VALUES (3321,'','Schwimmstoffabscheider','separateur_materiaux_flottants');
 INSERT INTO qgep.vl_mechanical_pretreatment_type (code, value_en, value_de, value_fr) VALUES (3322,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_mechanical_pretreatment ADD CONSTRAINT fkey_vl_mechanical_pretreatment_type FOREIGN KEY (type)
 REFERENCES qgep.vl_mechanical_pretreatment_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_mechanical_pretreatment ADD COLUMN fs_infiltration_installation varchar (16);
ALTER TABLE qgep.od_mechanical_pretreatment ADD CONSTRAINT rel_mechanical_pretreatment_infiltration_installation FOREIGN KEY (fs_infiltration_installation) REFERENCES qgep.od_infiltration_installation(obj_id);
ALTER TABLE qgep.od_mechanical_pretreatment ADD COLUMN fs_wastewater_structure varchar (16);
ALTER TABLE qgep.od_mechanical_pretreatment ADD CONSTRAINT rel_mechanical_pretreatment_wastewater_structure FOREIGN KEY (fs_wastewater_structure) REFERENCES qgep.od_wastewater_structure(obj_id);
ALTER TABLE qgep.od_profile_geometry ADD COLUMN fs_pipe_profile varchar (16);
ALTER TABLE qgep.od_profile_geometry ADD CONSTRAINT rel_profile_geometry_pipe_profile FOREIGN KEY (fs_pipe_profile) REFERENCES qgep.od_pipe_profile(obj_id);
ALTER TABLE qgep.od_accident ADD COLUMN fs_danger_source varchar (16);
ALTER TABLE qgep.od_accident ADD CONSTRAINT rel_accident_danger_source FOREIGN KEY (fs_danger_source) REFERENCES qgep.od_hazard_source(obj_id);
CREATE TABLE qgep.vl_throttle_shut_off_unit_control
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_throttle_shut_off_unit_control_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_throttle_shut_off_unit_control (code, value_en, value_de, value_fr) VALUES (3162,'','geregelt','avec_regulation');
 INSERT INTO qgep.vl_throttle_shut_off_unit_control (code, value_en, value_de, value_fr) VALUES (3163,'','gesteuert','avec_commande');
 INSERT INTO qgep.vl_throttle_shut_off_unit_control (code, value_en, value_de, value_fr) VALUES (3165,'','keine','aucun');
 INSERT INTO qgep.vl_throttle_shut_off_unit_control (code, value_en, value_de, value_fr) VALUES (3164,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_throttle_shut_off_unit ADD CONSTRAINT fkey_vl_throttle_shut_off_unit_control FOREIGN KEY (control)
 REFERENCES qgep.vl_throttle_shut_off_unit_control (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_throttle_shut_off_unit_signal_transmission
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_throttle_shut_off_unit_signal_transmission_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_throttle_shut_off_unit_signal_transmission (code, value_en, value_de, value_fr) VALUES (3171,'','empfangen','recevoir');
 INSERT INTO qgep.vl_throttle_shut_off_unit_signal_transmission (code, value_en, value_de, value_fr) VALUES (3172,'','senden','emettre');
 INSERT INTO qgep.vl_throttle_shut_off_unit_signal_transmission (code, value_en, value_de, value_fr) VALUES (3169,'','senden_empfangen','emettre_recevoir');
 INSERT INTO qgep.vl_throttle_shut_off_unit_signal_transmission (code, value_en, value_de, value_fr) VALUES (3170,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_throttle_shut_off_unit ADD CONSTRAINT fkey_vl_throttle_shut_off_unit_signal_transmission FOREIGN KEY (signal_transmission)
 REFERENCES qgep.vl_throttle_shut_off_unit_signal_transmission (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_throttle_shut_off_unit_type
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_throttle_shut_off_unit_type_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_throttle_shut_off_unit_type (code, value_en, value_de, value_fr) VALUES (2973,'other','andere','autres');
 INSERT INTO qgep.vl_throttle_shut_off_unit_type (code, value_en, value_de, value_fr) VALUES (2746,'','Blende','diaphragme_ou_seuil');
 INSERT INTO qgep.vl_throttle_shut_off_unit_type (code, value_en, value_de, value_fr) VALUES (2691,'','Dammbalken','batardeau');
 INSERT INTO qgep.vl_throttle_shut_off_unit_type (code, value_en, value_de, value_fr) VALUES (252,'','Drosselklappe','clapet_de_limitation');
 INSERT INTO qgep.vl_throttle_shut_off_unit_type (code, value_en, value_de, value_fr) VALUES (135,'','Drosselschieber','vanne_de_limitation');
 INSERT INTO qgep.vl_throttle_shut_off_unit_type (code, value_en, value_de, value_fr) VALUES (2690,'','Rueckstauklappe','clapet_de_non_retour_a_battant');
 INSERT INTO qgep.vl_throttle_shut_off_unit_type (code, value_en, value_de, value_fr) VALUES (2688,'','Schieber','vanne');
 INSERT INTO qgep.vl_throttle_shut_off_unit_type (code, value_en, value_de, value_fr) VALUES (134,'','Schlauchdrossel','limiteur_a_membrane');
 INSERT INTO qgep.vl_throttle_shut_off_unit_type (code, value_en, value_de, value_fr) VALUES (2689,'','Schuetze','vanne_ecluse');
 INSERT INTO qgep.vl_throttle_shut_off_unit_type (code, value_en, value_de, value_fr) VALUES (3046,'unknown','unbekannt','inconnu');
 INSERT INTO qgep.vl_throttle_shut_off_unit_type (code, value_en, value_de, value_fr) VALUES (133,'','Wirbeldrossel','limiteur_a_vortex');
 ALTER TABLE qgep.od_throttle_shut_off_unit ADD CONSTRAINT fkey_vl_throttle_shut_off_unit_type FOREIGN KEY (type)
 REFERENCES qgep.vl_throttle_shut_off_unit_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_throttle_shut_off_unit_yyy_antrieb
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_throttle_shut_off_unit_yyy_Antrieb_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_throttle_shut_off_unit_yyy_antrieb (code, value_en, value_de, value_fr) VALUES (3213,'other','andere','autres');
 INSERT INTO qgep.vl_throttle_shut_off_unit_yyy_antrieb (code, value_en, value_de, value_fr) VALUES (3154,'','Benzinmotor','moteur_a_essence');
 INSERT INTO qgep.vl_throttle_shut_off_unit_yyy_antrieb (code, value_en, value_de, value_fr) VALUES (3155,'','Dieselmotor','moteur_diesel');
 INSERT INTO qgep.vl_throttle_shut_off_unit_yyy_antrieb (code, value_en, value_de, value_fr) VALUES (3156,'','Elektromotor','moteur_electrique');
 INSERT INTO qgep.vl_throttle_shut_off_unit_yyy_antrieb (code, value_en, value_de, value_fr) VALUES (3152,'','hydraulisch','hydraulique');
 INSERT INTO qgep.vl_throttle_shut_off_unit_yyy_antrieb (code, value_en, value_de, value_fr) VALUES (3153,'','keiner','aucun');
 INSERT INTO qgep.vl_throttle_shut_off_unit_yyy_antrieb (code, value_en, value_de, value_fr) VALUES (3157,'','manuell','manuel');
 INSERT INTO qgep.vl_throttle_shut_off_unit_yyy_antrieb (code, value_en, value_de, value_fr) VALUES (3158,'','pneumatisch','pneumatique');
 INSERT INTO qgep.vl_throttle_shut_off_unit_yyy_antrieb (code, value_en, value_de, value_fr) VALUES (3151,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_throttle_shut_off_unit ADD CONSTRAINT fkey_vl_throttle_shut_off_unit_yyy_Antrieb FOREIGN KEY (yyy_Antrieb)
 REFERENCES qgep.vl_throttle_shut_off_unit_yyy_antrieb (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_throttle_shut_off_unit_yyy_verstellbarkeit
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_throttle_shut_off_unit_yyy_Verstellbarkeit_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_throttle_shut_off_unit_yyy_verstellbarkeit (code, value_en, value_de, value_fr) VALUES (3159,'','fest','fixe');
 INSERT INTO qgep.vl_throttle_shut_off_unit_yyy_verstellbarkeit (code, value_en, value_de, value_fr) VALUES (3161,'unknown','unbekannt','inconnu');
 INSERT INTO qgep.vl_throttle_shut_off_unit_yyy_verstellbarkeit (code, value_en, value_de, value_fr) VALUES (3160,'','verstellbar','reglable');
 ALTER TABLE qgep.od_throttle_shut_off_unit ADD CONSTRAINT fkey_vl_throttle_shut_off_unit_yyy_Verstellbarkeit FOREIGN KEY (yyy_Verstellbarkeit)
 REFERENCES qgep.vl_throttle_shut_off_unit_yyy_verstellbarkeit (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_throttle_shut_off_unit ADD COLUMN fs_wastewater_node varchar (16);
ALTER TABLE qgep.od_throttle_shut_off_unit ADD CONSTRAINT rel_throttle_shut_off_unit_wastewater_node FOREIGN KEY (fs_wastewater_node) REFERENCES qgep.od_wastewater_node(obj_id);
ALTER TABLE qgep.od_throttle_shut_off_unit ADD COLUMN fs_control_center varchar (16);
ALTER TABLE qgep.od_throttle_shut_off_unit ADD CONSTRAINT rel_throttle_shut_off_unit_control_center FOREIGN KEY (fs_control_center) REFERENCES qgep.od_control_center(obj_id);
CREATE TABLE qgep.vl_overfall_control
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_overfall_control_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_overfall_control (code, value_en, value_de, value_fr) VALUES (308,'','geregelt','avec_regulation');
 INSERT INTO qgep.vl_overfall_control (code, value_en, value_de, value_fr) VALUES (307,'','gesteuert','avec_commande');
 INSERT INTO qgep.vl_overfall_control (code, value_en, value_de, value_fr) VALUES (306,'','keine','aucun');
 INSERT INTO qgep.vl_overfall_control (code, value_en, value_de, value_fr) VALUES (3028,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_overfall ADD CONSTRAINT fkey_vl_overfall_control FOREIGN KEY (control)
 REFERENCES qgep.vl_overfall_control (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_overfall_function
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_overfall_function_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_overfall_function (code, value_en, value_de, value_fr) VALUES (3228,'other','andere','autres');
 INSERT INTO qgep.vl_overfall_function (code, value_en, value_de, value_fr) VALUES (168,'spill_way','Hochwasserentlastung','deversoir_orage');
 INSERT INTO qgep.vl_overfall_function (code, value_en, value_de, value_fr) VALUES (3384,'','intern','interne');
 INSERT INTO qgep.vl_overfall_function (code, value_en, value_de, value_fr) VALUES (217,'','Notentlastung','deversoir_de_secours');
 INSERT INTO qgep.vl_overfall_function (code, value_en, value_de, value_fr) VALUES (3229,'','Regenueberlauf','deversoir_interne');
 INSERT INTO qgep.vl_overfall_function (code, value_en, value_de, value_fr) VALUES (3010,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_overfall ADD CONSTRAINT fkey_vl_overfall_function FOREIGN KEY (function)
 REFERENCES qgep.vl_overfall_function (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_overfall_signal_transmission
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_overfall_signal_transmission_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_overfall_signal_transmission (code, value_en, value_de, value_fr) VALUES (2694,'','empfangen','recevoir');
 INSERT INTO qgep.vl_overfall_signal_transmission (code, value_en, value_de, value_fr) VALUES (2693,'','senden','emettre');
 INSERT INTO qgep.vl_overfall_signal_transmission (code, value_en, value_de, value_fr) VALUES (2695,'','senden_empfangen','emettre_recevoir');
 INSERT INTO qgep.vl_overfall_signal_transmission (code, value_en, value_de, value_fr) VALUES (3056,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_overfall ADD CONSTRAINT fkey_vl_overfall_signal_transmission FOREIGN KEY (signal_transmission)
 REFERENCES qgep.vl_overfall_signal_transmission (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_overfall_yyy_antrieb
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_overfall_yyy_Antrieb_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_overfall_yyy_antrieb (code, value_en, value_de, value_fr) VALUES (3667,'other','andere','autres');
 INSERT INTO qgep.vl_overfall_yyy_antrieb (code, value_en, value_de, value_fr) VALUES (301,'','Benzinmotor','moteur_a_essence');
 INSERT INTO qgep.vl_overfall_yyy_antrieb (code, value_en, value_de, value_fr) VALUES (302,'','Dieselmotor','moteur_diesel');
 INSERT INTO qgep.vl_overfall_yyy_antrieb (code, value_en, value_de, value_fr) VALUES (303,'','Elektromotor','moteur_electrique');
 INSERT INTO qgep.vl_overfall_yyy_antrieb (code, value_en, value_de, value_fr) VALUES (433,'','hydraulisch','hydraulique');
 INSERT INTO qgep.vl_overfall_yyy_antrieb (code, value_en, value_de, value_fr) VALUES (300,'','keiner','aucun');
 INSERT INTO qgep.vl_overfall_yyy_antrieb (code, value_en, value_de, value_fr) VALUES (305,'','manuell','manuel');
 INSERT INTO qgep.vl_overfall_yyy_antrieb (code, value_en, value_de, value_fr) VALUES (304,'','pneumatisch','pneumatique');
 INSERT INTO qgep.vl_overfall_yyy_antrieb (code, value_en, value_de, value_fr) VALUES (3005,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_overfall ADD CONSTRAINT fkey_vl_overfall_yyy_Antrieb FOREIGN KEY (yyy_Antrieb)
 REFERENCES qgep.vl_overfall_yyy_antrieb (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_overfall_yyy_verstellbarkeit
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_overfall_yyy_Verstellbarkeit_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_overfall_yyy_verstellbarkeit (code, value_en, value_de, value_fr) VALUES (355,'','fest','fixe');
 INSERT INTO qgep.vl_overfall_yyy_verstellbarkeit (code, value_en, value_de, value_fr) VALUES (3021,'unknown','unbekannt','inconnu');
 INSERT INTO qgep.vl_overfall_yyy_verstellbarkeit (code, value_en, value_de, value_fr) VALUES (356,'','verstellbar','reglable');
 ALTER TABLE qgep.od_overfall ADD CONSTRAINT fkey_vl_overfall_yyy_Verstellbarkeit FOREIGN KEY (yyy_Verstellbarkeit)
 REFERENCES qgep.vl_overfall_yyy_verstellbarkeit (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_overfall ADD COLUMN fs_wastewater_node varchar (16);
ALTER TABLE qgep.od_overfall ADD CONSTRAINT rel_overfall_wastewater_node FOREIGN KEY (fs_wastewater_node) REFERENCES qgep.od_wastewater_node(obj_id);
ALTER TABLE qgep.od_overfall ADD COLUMN fs_overflow_to varchar (16);
ALTER TABLE qgep.od_overfall ADD CONSTRAINT rel_overfall_overflow_to FOREIGN KEY (fs_overflow_to) REFERENCES qgep.od_wastewater_node(obj_id);
ALTER TABLE qgep.od_overfall ADD COLUMN fs_yyy_ueberlaufcharakteristik varchar (16);
ALTER TABLE qgep.od_overfall ADD CONSTRAINT rel_overfall_yyy_ueberlaufcharakteristik FOREIGN KEY (fs_yyy_ueberlaufcharakteristik) REFERENCES qgep.od_overflow_characteristic(obj_id);
ALTER TABLE qgep.od_overfall ADD COLUMN fs_control_center varchar (16);
ALTER TABLE qgep.od_overfall ADD CONSTRAINT rel_overfall_control_center FOREIGN KEY (fs_control_center) REFERENCES qgep.od_control_center(obj_id);
ALTER TABLE qgep.od_surface_runoff_parameters ADD COLUMN fs_catchement_area varchar (16);
ALTER TABLE qgep.od_surface_runoff_parameters ADD CONSTRAINT rel_surface_runoff_parameters_catchement_area FOREIGN KEY (fs_catchement_area) REFERENCES qgep.od_catchment_area(obj_id);
ALTER TABLE qgep.od_connection_object ADD COLUMN fs_wastewater_networkelement varchar (16);
ALTER TABLE qgep.od_connection_object ADD CONSTRAINT rel_connection_object_wastewater_networkelement FOREIGN KEY (fs_wastewater_networkelement) REFERENCES qgep.od_wastewater_networkelement(obj_id);
ALTER TABLE qgep.od_connection_object ADD COLUMN fs_owner varchar (16);
ALTER TABLE qgep.od_connection_object ADD CONSTRAINT rel_connection_object_owner FOREIGN KEY (fs_owner) REFERENCES qgep.od_organisation(obj_id);
ALTER TABLE qgep.od_connection_object ADD COLUMN fs_operator varchar (16);
ALTER TABLE qgep.od_connection_object ADD CONSTRAINT rel_connection_object_operator FOREIGN KEY (fs_operator) REFERENCES qgep.od_organisation(obj_id);
CREATE TABLE qgep.vl_catchment_area_drainage_system
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_catchment_area_drainage_system_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_catchment_area_drainage_system (code, value_en, value_de, value_fr) VALUES (3376,'mixed_system','Mischsystem','systeme_unitaire');
 INSERT INTO qgep.vl_catchment_area_drainage_system (code, value_en, value_de, value_fr) VALUES (3377,'modified_system','ModifiziertesSystem','systeme_modifie');
 INSERT INTO qgep.vl_catchment_area_drainage_system (code, value_en, value_de, value_fr) VALUES (4545,'not_connected','nicht_angeschlossen','non_raccorde');
 INSERT INTO qgep.vl_catchment_area_drainage_system (code, value_en, value_de, value_fr) VALUES (3378,'seperated_system','Trennsystem','systeme_separatif');
 INSERT INTO qgep.vl_catchment_area_drainage_system (code, value_en, value_de, value_fr) VALUES (3379,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_catchment_area ADD CONSTRAINT fkey_vl_catchment_area_drainage_system FOREIGN KEY (drainage_system)
 REFERENCES qgep.vl_catchment_area_drainage_system (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_catchment_area_status
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_catchment_area_status_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_catchment_area_status (code, value_en, value_de, value_fr) VALUES (3374,'current_and_planning_state','Ist_und_Planungszustand','etat_actuel_et_planification');
 INSERT INTO qgep.vl_catchment_area_status (code, value_en, value_de, value_fr) VALUES (2705,'current_state','Ist_Zustand','etat_actuel');
 INSERT INTO qgep.vl_catchment_area_status (code, value_en, value_de, value_fr) VALUES (2706,'planning_state','Planungszustand','etat_de_planification');
 INSERT INTO qgep.vl_catchment_area_status (code, value_en, value_de, value_fr) VALUES (3057,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_catchment_area ADD CONSTRAINT fkey_vl_catchment_area_status FOREIGN KEY (status)
 REFERENCES qgep.vl_catchment_area_status (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_catchment_area_type
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_catchment_area_type_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_catchment_area_type (code, value_en, value_de, value_fr) VALUES (2699,'rain_and_dry_weather','Regen_und_Trockenwetter','temps_sec_et_temps_de_pluie');
 INSERT INTO qgep.vl_catchment_area_type (code, value_en, value_de, value_fr) VALUES (139,'rain_weather','Regenwetter','temps_de_pluie');
 INSERT INTO qgep.vl_catchment_area_type (code, value_en, value_de, value_fr) VALUES (140,'dry_weather','Trockenwetter','temps_sec');
 INSERT INTO qgep.vl_catchment_area_type (code, value_en, value_de, value_fr) VALUES (3034,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_catchment_area ADD CONSTRAINT fkey_vl_catchment_area_type FOREIGN KEY (type)
 REFERENCES qgep.vl_catchment_area_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_catchment_area ADD COLUMN fs_wastewater_networkelement varchar (16);
ALTER TABLE qgep.od_catchment_area ADD CONSTRAINT rel_catchment_area_wastewater_networkelement FOREIGN KEY (fs_wastewater_networkelement) REFERENCES qgep.od_wastewater_networkelement(obj_id);
ALTER TABLE qgep.od_substance ADD COLUMN fs_danger_source varchar (16);
ALTER TABLE qgep.od_substance ADD CONSTRAINT rel_substance_danger_source FOREIGN KEY (fs_danger_source) REFERENCES qgep.od_hazard_source(obj_id);
ALTER TABLE qgep.od_hazard_source ADD COLUMN fs_yyy_anschlussobjekt varchar (16);
ALTER TABLE qgep.od_hazard_source ADD CONSTRAINT rel_hazard_source_yyy_anschlussobjekt FOREIGN KEY (fs_yyy_anschlussobjekt) REFERENCES qgep.od_connection_object(obj_id);
ALTER TABLE qgep.od_hazard_source ADD COLUMN fs_owner varchar (16);
ALTER TABLE qgep.od_hazard_source ADD CONSTRAINT rel_hazard_source_owner FOREIGN KEY (fs_owner) REFERENCES qgep.od_organisation(obj_id);
ALTER TABLE qgep.od_measurement_result ADD COLUMN fs_yy_messgeraet varchar (16);
ALTER TABLE qgep.od_measurement_result ADD CONSTRAINT rel_measurement_result_yy_messgeraet FOREIGN KEY (fs_yy_messgeraet) REFERENCES qgep.od_measurement_device(obj_id);
ALTER TABLE qgep.od_measurement_result ADD COLUMN fs_yy_messreihe varchar (16);
ALTER TABLE qgep.od_measurement_result ADD CONSTRAINT rel_measurement_result_yy_messreihe FOREIGN KEY (fs_yy_messreihe) REFERENCES qgep.od_measurement_series(obj_id);
CREATE TABLE qgep.vl_measurement_series_type
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_measurement_series_type_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_measurement_series_type (code, value_en, value_de, value_fr) VALUES (3217,'other','andere','autres');
 INSERT INTO qgep.vl_measurement_series_type (code, value_en, value_de, value_fr) VALUES (2646,'','kontinuierlich','continu');
 INSERT INTO qgep.vl_measurement_series_type (code, value_en, value_de, value_fr) VALUES (2647,'rain_weather','Regenwetter','temps_de_pluie');
 INSERT INTO qgep.vl_measurement_series_type (code, value_en, value_de, value_fr) VALUES (3053,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_measurement_series ADD CONSTRAINT fkey_vl_measurement_series_type FOREIGN KEY (type)
 REFERENCES qgep.vl_measurement_series_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_measurement_series ADD COLUMN fs_yy_messstelle varchar (16);
ALTER TABLE qgep.od_measurement_series ADD CONSTRAINT rel_measurement_series_yy_messstelle FOREIGN KEY (fs_yy_messstelle) REFERENCES qgep.od_measuring_point(obj_id);
ALTER TABLE qgep.od_measuring_point ADD COLUMN fs_operator varchar (16);
ALTER TABLE qgep.od_measuring_point ADD CONSTRAINT rel_measuring_point_operator FOREIGN KEY (fs_operator) REFERENCES qgep.od_organisation(obj_id);
ALTER TABLE qgep.od_measuring_point ADD COLUMN fs_waste_water_treatment_plant varchar (16);
ALTER TABLE qgep.od_measuring_point ADD CONSTRAINT rel_measuring_point_waste_water_treatment_plant FOREIGN KEY (fs_waste_water_treatment_plant) REFERENCES qgep.od_waste_water_treatment_plant(obj_id);
ALTER TABLE qgep.od_measuring_point ADD COLUMN fs_wastewater_structure varchar (16);
ALTER TABLE qgep.od_measuring_point ADD CONSTRAINT rel_measuring_point_wastewater_structure FOREIGN KEY (fs_wastewater_structure) REFERENCES qgep.od_wastewater_structure(obj_id);
ALTER TABLE qgep.od_measuring_point ADD COLUMN fs_yyy_gewaesserabschnitt varchar (16);
ALTER TABLE qgep.od_measuring_point ADD CONSTRAINT rel_measuring_point_yyy_gewaesserabschnitt FOREIGN KEY (fs_yyy_gewaesserabschnitt) REFERENCES qgep.od_water_course_segment(obj_id);
ALTER TABLE qgep.od_drainage_system ADD CONSTRAINT oorel_od_drainage_system_zone FOREIGN KEY (obj_id) REFERENCES qgep.od_zone(obj_id);
CREATE TABLE qgep.vl_drainage_system_type
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_drainage_system_type_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_drainage_system_type (code, value_en, value_de, value_fr) VALUES (2722,'mixed_system','Mischsystem','systeme_unitaire');
 INSERT INTO qgep.vl_drainage_system_type (code, value_en, value_de, value_fr) VALUES (2724,'','ModifiziertesSystem','systeme_modifie');
 INSERT INTO qgep.vl_drainage_system_type (code, value_en, value_de, value_fr) VALUES (4544,'','nicht_angeschlossen','non_raccorde');
 INSERT INTO qgep.vl_drainage_system_type (code, value_en, value_de, value_fr) VALUES (2723,'','Trennsystem','systeme_separatif');
 INSERT INTO qgep.vl_drainage_system_type (code, value_en, value_de, value_fr) VALUES (3060,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_drainage_system ADD CONSTRAINT fkey_vl_drainage_system_type FOREIGN KEY (type)
 REFERENCES qgep.vl_drainage_system_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_planning_zone ADD CONSTRAINT oorel_od_planning_zone_zone FOREIGN KEY (obj_id) REFERENCES qgep.od_zone(obj_id);
CREATE TABLE qgep.vl_planning_zone_type
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_planning_zone_type_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_planning_zone_type (code, value_en, value_de, value_fr) VALUES (2990,'other','andere','autres');
 INSERT INTO qgep.vl_planning_zone_type (code, value_en, value_de, value_fr) VALUES (31,'','Gewerbezone','zone_artisanale');
 INSERT INTO qgep.vl_planning_zone_type (code, value_en, value_de, value_fr) VALUES (32,'','Industriezone','zone_industrielle');
 INSERT INTO qgep.vl_planning_zone_type (code, value_en, value_de, value_fr) VALUES (30,'','Landwirtschaftszone','zone_agricole');
 INSERT INTO qgep.vl_planning_zone_type (code, value_en, value_de, value_fr) VALUES (3077,'unknown','unbekannt','inconnu');
 INSERT INTO qgep.vl_planning_zone_type (code, value_en, value_de, value_fr) VALUES (29,'','Wohnzone','zone_d_habitations');
 ALTER TABLE qgep.od_planning_zone ADD CONSTRAINT fkey_vl_planning_zone_type FOREIGN KEY (type)
 REFERENCES qgep.vl_planning_zone_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_infiltration_zone ADD CONSTRAINT oorel_od_infiltration_zone_zone FOREIGN KEY (obj_id) REFERENCES qgep.od_zone(obj_id);
CREATE TABLE qgep.vl_infiltration_zone_yyy_infiltration_capacity
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_infiltration_zone_yyy_infiltration_capacity_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_infiltration_zone_yyy_infiltration_capacity (code, value_en, value_de, value_fr) VALUES (371,'','gut','bonnes');
 INSERT INTO qgep.vl_infiltration_zone_yyy_infiltration_capacity (code, value_en, value_de, value_fr) VALUES (374,'','keine','aucune');
 INSERT INTO qgep.vl_infiltration_zone_yyy_infiltration_capacity (code, value_en, value_de, value_fr) VALUES (372,'','maessig','moyennes');
 INSERT INTO qgep.vl_infiltration_zone_yyy_infiltration_capacity (code, value_en, value_de, value_fr) VALUES (373,'','schlecht','mauvaises');
 INSERT INTO qgep.vl_infiltration_zone_yyy_infiltration_capacity (code, value_en, value_de, value_fr) VALUES (3073,'unknown','unbekannt','inconnu');
 INSERT INTO qgep.vl_infiltration_zone_yyy_infiltration_capacity (code, value_en, value_de, value_fr) VALUES (2996,'','unzulaessig','non_admis');
 ALTER TABLE qgep.od_infiltration_zone ADD CONSTRAINT fkey_vl_infiltration_zone_yyy_infiltration_capacity FOREIGN KEY (yyy_infiltration_capacity)
 REFERENCES qgep.vl_infiltration_zone_yyy_infiltration_capacity (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_groundwater_protection_zone ADD CONSTRAINT oorel_od_groundwater_protection_zone_zone FOREIGN KEY (obj_id) REFERENCES qgep.od_zone(obj_id);
CREATE TABLE qgep.vl_groundwater_protection_zone_type
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_groundwater_protection_zone_type_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_groundwater_protection_zone_type (code, value_en, value_de, value_fr) VALUES (440,'S1','S1','S1');
 INSERT INTO qgep.vl_groundwater_protection_zone_type (code, value_en, value_de, value_fr) VALUES (441,'S2','S2','S2');
 INSERT INTO qgep.vl_groundwater_protection_zone_type (code, value_en, value_de, value_fr) VALUES (442,'S3','S3','S3');
 INSERT INTO qgep.vl_groundwater_protection_zone_type (code, value_en, value_de, value_fr) VALUES (3040,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_groundwater_protection_zone ADD CONSTRAINT fkey_vl_groundwater_protection_zone_type FOREIGN KEY (type)
 REFERENCES qgep.vl_groundwater_protection_zone_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_ground_water_protection_perimeter ADD CONSTRAINT oorel_od_ground_water_protection_perimeter_zone FOREIGN KEY (obj_id) REFERENCES qgep.od_zone(obj_id);
ALTER TABLE qgep.od_water_body_protection_sector ADD CONSTRAINT oorel_od_water_body_protection_sector_zone FOREIGN KEY (obj_id) REFERENCES qgep.od_zone(obj_id);
CREATE TABLE qgep.vl_water_body_protection_sector_type
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_water_body_protection_sector_type_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_water_body_protection_sector_type (code, value_en, value_de, value_fr) VALUES (430,'A','A','A');
 INSERT INTO qgep.vl_water_body_protection_sector_type (code, value_en, value_de, value_fr) VALUES (3652,'','Ao','Ao');
 INSERT INTO qgep.vl_water_body_protection_sector_type (code, value_en, value_de, value_fr) VALUES (3649,'','Au','Au');
 INSERT INTO qgep.vl_water_body_protection_sector_type (code, value_en, value_de, value_fr) VALUES (431,'B','B','B');
 INSERT INTO qgep.vl_water_body_protection_sector_type (code, value_en, value_de, value_fr) VALUES (432,'C','C','C');
 INSERT INTO qgep.vl_water_body_protection_sector_type (code, value_en, value_de, value_fr) VALUES (3069,'unknown','unbekannt','inconnu');
 INSERT INTO qgep.vl_water_body_protection_sector_type (code, value_en, value_de, value_fr) VALUES (3651,'Zo','Zo','Zo');
 INSERT INTO qgep.vl_water_body_protection_sector_type (code, value_en, value_de, value_fr) VALUES (3650,'Zu','Zu','Zu');
 ALTER TABLE qgep.od_water_body_protection_sector ADD CONSTRAINT fkey_vl_water_body_protection_sector_type FOREIGN KEY (type)
 REFERENCES qgep.vl_water_body_protection_sector_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_dryweather_downspout ADD CONSTRAINT oorel_od_dryweather_downspout_structure_part FOREIGN KEY (obj_id) REFERENCES qgep.od_structure_part(obj_id);
ALTER TABLE qgep.od_benching ADD CONSTRAINT oorel_od_benching_structure_part FOREIGN KEY (obj_id) REFERENCES qgep.od_structure_part(obj_id);
CREATE TABLE qgep.vl_benching_type
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_benching_type_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_benching_type (code, value_en, value_de, value_fr) VALUES (3211,'other','andere','autres');
 INSERT INTO qgep.vl_benching_type (code, value_en, value_de, value_fr) VALUES (94,'double_sided','beidseitig','double');
 INSERT INTO qgep.vl_benching_type (code, value_en, value_de, value_fr) VALUES (93,'onesided','einseitig','simple');
 INSERT INTO qgep.vl_benching_type (code, value_en, value_de, value_fr) VALUES (3231,'no','kein','aucun');
 INSERT INTO qgep.vl_benching_type (code, value_en, value_de, value_fr) VALUES (3033,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_benching ADD CONSTRAINT fkey_vl_benching_type FOREIGN KEY (type)
 REFERENCES qgep.vl_benching_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_cover ADD CONSTRAINT oorel_od_cover_structure_part FOREIGN KEY (obj_id) REFERENCES qgep.od_structure_part(obj_id);
CREATE TABLE qgep.vl_cover_cover_shape
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_cover_cover_shape_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_cover_cover_shape (code, value_en, value_de, value_fr) VALUES (3500,'other','andere','autres');
 INSERT INTO qgep.vl_cover_cover_shape (code, value_en, value_de, value_fr) VALUES (3499,'rectangular','eckig','anguleux');
 INSERT INTO qgep.vl_cover_cover_shape (code, value_en, value_de, value_fr) VALUES (3498,'round','rund','rond');
 INSERT INTO qgep.vl_cover_cover_shape (code, value_en, value_de, value_fr) VALUES (3501,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_cover ADD CONSTRAINT fkey_vl_cover_cover_shape FOREIGN KEY (cover_shape)
 REFERENCES qgep.vl_cover_cover_shape (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_cover_fastening
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_cover_fastening_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_cover_fastening (code, value_en, value_de, value_fr) VALUES (175,'not_bolted','nicht_verschraubt','non_visse');
 INSERT INTO qgep.vl_cover_fastening (code, value_en, value_de, value_fr) VALUES (3090,'unknown','unbekannt','inconnu');
 INSERT INTO qgep.vl_cover_fastening (code, value_en, value_de, value_fr) VALUES (174,'bolted','verschraubt','visse');
 ALTER TABLE qgep.od_cover ADD CONSTRAINT fkey_vl_cover_fastening FOREIGN KEY (fastening)
 REFERENCES qgep.vl_cover_fastening (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_cover_location_accuracy
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_cover_location_accuracy_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_cover_location_accuracy (code, value_en, value_de, value_fr) VALUES (3243,'more_than_50cm','groesser_50cm','plusque_50cm');
 INSERT INTO qgep.vl_cover_location_accuracy (code, value_en, value_de, value_fr) VALUES (3241,'plusminus_10cm','plusminus_10cm','plus_moins_10cm');
 INSERT INTO qgep.vl_cover_location_accuracy (code, value_en, value_de, value_fr) VALUES (3236,'plusminus_3cm','plusminus_3cm','plus_moins_3cm');
 INSERT INTO qgep.vl_cover_location_accuracy (code, value_en, value_de, value_fr) VALUES (3242,'plusminus_50cm','plusminus_50cm','plus_moins_50cm');
 INSERT INTO qgep.vl_cover_location_accuracy (code, value_en, value_de, value_fr) VALUES (3326,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_cover ADD CONSTRAINT fkey_vl_cover_location_accuracy FOREIGN KEY (location_accuracy)
 REFERENCES qgep.vl_cover_location_accuracy (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_cover_material
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_cover_material_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_cover_material (code, value_en, value_de, value_fr) VALUES (2976,'other','andere','autres');
 INSERT INTO qgep.vl_cover_material (code, value_en, value_de, value_fr) VALUES (234,'concrete','Beton','beton');
 INSERT INTO qgep.vl_cover_material (code, value_en, value_de, value_fr) VALUES (233,'cast_iron','Guss','fonte');
 INSERT INTO qgep.vl_cover_material (code, value_en, value_de, value_fr) VALUES (236,'cast_iron_with_pavement_filling','Guss_mit_Belagsfuellung','fonte_avec_remplissage_enrobe');
 INSERT INTO qgep.vl_cover_material (code, value_en, value_de, value_fr) VALUES (235,'cast_iron_with_conrete_filling','Guss_mit_Betonfuellung','fonte_avec_remplissage_en_beton');
 INSERT INTO qgep.vl_cover_material (code, value_en, value_de, value_fr) VALUES (3015,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_cover ADD CONSTRAINT fkey_vl_cover_material FOREIGN KEY (material)
 REFERENCES qgep.vl_cover_material (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_cover_sludge_bucket
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_cover_sludge_bucket_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_cover_sludge_bucket (code, value_en, value_de, value_fr) VALUES (423,'inexistent','nicht_vorhanden','inexistant');
 INSERT INTO qgep.vl_cover_sludge_bucket (code, value_en, value_de, value_fr) VALUES (3066,'unknown','unbekannt','inconnu');
 INSERT INTO qgep.vl_cover_sludge_bucket (code, value_en, value_de, value_fr) VALUES (422,'existent','vorhanden','existant');
 ALTER TABLE qgep.od_cover ADD CONSTRAINT fkey_vl_cover_sludge_bucket FOREIGN KEY (sludge_bucket)
 REFERENCES qgep.vl_cover_sludge_bucket (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_cover_venting
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_cover_venting_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_cover_venting (code, value_en, value_de, value_fr) VALUES (229,'vented','entlueftet','aere');
 INSERT INTO qgep.vl_cover_venting (code, value_en, value_de, value_fr) VALUES (230,'not_vented','nicht_entlueftet','non_aere');
 INSERT INTO qgep.vl_cover_venting (code, value_en, value_de, value_fr) VALUES (3092,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_cover ADD CONSTRAINT fkey_vl_cover_venting FOREIGN KEY (venting)
 REFERENCES qgep.vl_cover_venting (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_access_aid ADD CONSTRAINT oorel_od_access_aid_structure_part FOREIGN KEY (obj_id) REFERENCES qgep.od_structure_part(obj_id);
CREATE TABLE qgep.vl_access_aid_type
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_access_aid_type_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_access_aid_type (code, value_en, value_de, value_fr) VALUES (2977,'other','andere','autres');
 INSERT INTO qgep.vl_access_aid_type (code, value_en, value_de, value_fr) VALUES (243,'pressurized_door','Drucktuere','porte_etanche');
 INSERT INTO qgep.vl_access_aid_type (code, value_en, value_de, value_fr) VALUES (92,'none','keine','aucun_equipement_d_acces');
 INSERT INTO qgep.vl_access_aid_type (code, value_en, value_de, value_fr) VALUES (240,'ladder','Leiter','echelle');
 INSERT INTO qgep.vl_access_aid_type (code, value_en, value_de, value_fr) VALUES (241,'step_iron','Steigeisen','echelons');
 INSERT INTO qgep.vl_access_aid_type (code, value_en, value_de, value_fr) VALUES (3473,'staircase','Treppe','escalier');
 INSERT INTO qgep.vl_access_aid_type (code, value_en, value_de, value_fr) VALUES (91,'footstep_niches','Trittnischen','marchepieds');
 INSERT INTO qgep.vl_access_aid_type (code, value_en, value_de, value_fr) VALUES (3230,'door','Tuere','porte');
 INSERT INTO qgep.vl_access_aid_type (code, value_en, value_de, value_fr) VALUES (3048,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_access_aid ADD CONSTRAINT fkey_vl_access_aid_type FOREIGN KEY (type)
 REFERENCES qgep.vl_access_aid_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_dryweather_flume ADD CONSTRAINT oorel_od_dryweather_flume_structure_part FOREIGN KEY (obj_id) REFERENCES qgep.od_structure_part(obj_id);
CREATE TABLE qgep.vl_dryweather_flume_material
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_dryweather_flume_material_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_dryweather_flume_material (code, value_en, value_de, value_fr) VALUES (3221,'other','andere','autres');
 INSERT INTO qgep.vl_dryweather_flume_material (code, value_en, value_de, value_fr) VALUES (354,'combined','kombiniert','combine');
 INSERT INTO qgep.vl_dryweather_flume_material (code, value_en, value_de, value_fr) VALUES (239,'plastic','Kunststoff','plastique');
 INSERT INTO qgep.vl_dryweather_flume_material (code, value_en, value_de, value_fr) VALUES (238,'stoneware','Steinzeug','gres');
 INSERT INTO qgep.vl_dryweather_flume_material (code, value_en, value_de, value_fr) VALUES (3017,'unknown','unbekannt','inconnu');
 INSERT INTO qgep.vl_dryweather_flume_material (code, value_en, value_de, value_fr) VALUES (237,'cement_mortar','Zementmoertel','mortier_de_ciment');
 ALTER TABLE qgep.od_dryweather_flume ADD CONSTRAINT fkey_vl_dryweather_flume_material FOREIGN KEY (material)
 REFERENCES qgep.vl_dryweather_flume_material (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_electromechanical_equipment ADD CONSTRAINT oorel_od_electromechanical_equipment_structure_part FOREIGN KEY (obj_id) REFERENCES qgep.od_structure_part(obj_id);
CREATE TABLE qgep.vl_electromechanical_equipment_type
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_electromechanical_equipment_type_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_electromechanical_equipment_type (code, value_en, value_de, value_fr) VALUES (2981,'other','andere','autres');
 INSERT INTO qgep.vl_electromechanical_equipment_type (code, value_en, value_de, value_fr) VALUES (2663,'','Feinrechen','grille_fine');
 INSERT INTO qgep.vl_electromechanical_equipment_type (code, value_en, value_de, value_fr) VALUES (2664,'','Grobrechen','grille_grossiere');
 INSERT INTO qgep.vl_electromechanical_equipment_type (code, value_en, value_de, value_fr) VALUES (379,'','Injektorpumpe','pompe_a_jet_d_eau');
 INSERT INTO qgep.vl_electromechanical_equipment_type (code, value_en, value_de, value_fr) VALUES (380,'','Leckwasserpumpe','pompe_d_epuisement');
 INSERT INTO qgep.vl_electromechanical_equipment_type (code, value_en, value_de, value_fr) VALUES (337,'','Luftentfeuchter','deshumidificateur');
 INSERT INTO qgep.vl_electromechanical_equipment_type (code, value_en, value_de, value_fr) VALUES (381,'','Raeumeinrichtung','dispositif_de_curage');
 INSERT INTO qgep.vl_electromechanical_equipment_type (code, value_en, value_de, value_fr) VALUES (2665,'','Sieb','tamis');
 INSERT INTO qgep.vl_electromechanical_equipment_type (code, value_en, value_de, value_fr) VALUES (382,'','Spuelkippe','rigole_basculante');
 INSERT INTO qgep.vl_electromechanical_equipment_type (code, value_en, value_de, value_fr) VALUES (2666,'','Tauchwand','paroi_plongeante');
 INSERT INTO qgep.vl_electromechanical_equipment_type (code, value_en, value_de, value_fr) VALUES (3072,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_electromechanical_equipment ADD CONSTRAINT fkey_vl_electromechanical_equipment_type FOREIGN KEY (type)
 REFERENCES qgep.vl_electromechanical_equipment_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_electric_equipment ADD CONSTRAINT oorel_od_electric_equipment_structure_part FOREIGN KEY (obj_id) REFERENCES qgep.od_structure_part(obj_id);
CREATE TABLE qgep.vl_electric_equipment_type
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_electric_equipment_type_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_electric_equipment_type (code, value_en, value_de, value_fr) VALUES (2980,'other','andere','autres');
 INSERT INTO qgep.vl_electric_equipment_type (code, value_en, value_de, value_fr) VALUES (376,'','Beleuchtung','eclairage');
 INSERT INTO qgep.vl_electric_equipment_type (code, value_en, value_de, value_fr) VALUES (3255,'','Fernwirkanlage','installation_de_telecommande');
 INSERT INTO qgep.vl_electric_equipment_type (code, value_en, value_de, value_fr) VALUES (378,'','Funk','radio');
 INSERT INTO qgep.vl_electric_equipment_type (code, value_en, value_de, value_fr) VALUES (377,'','Telephon','telephone');
 INSERT INTO qgep.vl_electric_equipment_type (code, value_en, value_de, value_fr) VALUES (3038,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_electric_equipment ADD CONSTRAINT fkey_vl_electric_equipment_type FOREIGN KEY (type)
 REFERENCES qgep.vl_electric_equipment_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_wwtp_structure ADD CONSTRAINT oorel_od_wwtp_structure_wastewater_structure FOREIGN KEY (obj_id) REFERENCES qgep.od_wastewater_structure(obj_id);
CREATE TABLE qgep.vl_wwtp_structure_type
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_wwtp_structure_type_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_wwtp_structure_type (code, value_en, value_de, value_fr) VALUES (331,'','Absetzbecken','bassin_de_decantation');
 INSERT INTO qgep.vl_wwtp_structure_type (code, value_en, value_de, value_fr) VALUES (2974,'other','andere','autres');
 INSERT INTO qgep.vl_wwtp_structure_type (code, value_en, value_de, value_fr) VALUES (327,'','Belebtschlammbecken','bassin_a_boues_activees');
 INSERT INTO qgep.vl_wwtp_structure_type (code, value_en, value_de, value_fr) VALUES (329,'','Festbettreaktor','reacteur_a_biomasse_fixee');
 INSERT INTO qgep.vl_wwtp_structure_type (code, value_en, value_de, value_fr) VALUES (330,'','Tauchtropfkoerper','disque_bacterien_immerge');
 INSERT INTO qgep.vl_wwtp_structure_type (code, value_en, value_de, value_fr) VALUES (328,'','Tropfkoerper','lit_bacterien');
 INSERT INTO qgep.vl_wwtp_structure_type (code, value_en, value_de, value_fr) VALUES (3032,'unknown','unbekannt','inconnu');
 INSERT INTO qgep.vl_wwtp_structure_type (code, value_en, value_de, value_fr) VALUES (326,'','Vorklaerbecken','decanteurs_primaires');
 ALTER TABLE qgep.od_wwtp_structure ADD CONSTRAINT fkey_vl_wwtp_structure_type FOREIGN KEY (type)
 REFERENCES qgep.vl_wwtp_structure_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_manhole ADD CONSTRAINT oorel_od_manhole_wastewater_structure FOREIGN KEY (obj_id) REFERENCES qgep.od_wastewater_structure(obj_id);
CREATE TABLE qgep.vl_manhole_function
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_manhole_function_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_manhole_function (code, value_en, value_de, value_fr) VALUES (4532,'drop_structure','Absturzbauwerk','ouvrage_de_chute');
 INSERT INTO qgep.vl_manhole_function (code, value_en, value_de, value_fr) VALUES (2989,'other','andere','autres');
 INSERT INTO qgep.vl_manhole_function (code, value_en, value_de, value_fr) VALUES (4533,'venting','Be_Entlueftung','aeration');
 INSERT INTO qgep.vl_manhole_function (code, value_en, value_de, value_fr) VALUES (3267,'rain_water_manhole','Dachwasserschacht','chambre_recolte_eaux_toitures');
 INSERT INTO qgep.vl_manhole_function (code, value_en, value_de, value_fr) VALUES (3266,'gully','Einlaufschacht','chambre_avec_grille_d_entree');
 INSERT INTO qgep.vl_manhole_function (code, value_en, value_de, value_fr) VALUES (3472,'drainage_channel','Entwaesserungsrinne','rigole_de_drainage');
 INSERT INTO qgep.vl_manhole_function (code, value_en, value_de, value_fr) VALUES (228,'rail_track_gully','Geleiseschacht','evacuation_des_eaux_des_voies_ferrees');
 INSERT INTO qgep.vl_manhole_function (code, value_en, value_de, value_fr) VALUES (4534,'spill_way','Hochwasserentlastung','deversoir_orage');
 INSERT INTO qgep.vl_manhole_function (code, value_en, value_de, value_fr) VALUES (4535,'septic_tank','Klaergrube','fosse_septique');
 INSERT INTO qgep.vl_manhole_function (code, value_en, value_de, value_fr) VALUES (204,'manhole','Kontrollschacht','regard_de_visite');
 INSERT INTO qgep.vl_manhole_function (code, value_en, value_de, value_fr) VALUES (1008,'oil_separator','Oelabscheider','separateur_d_hydrocarbures');
 INSERT INTO qgep.vl_manhole_function (code, value_en, value_de, value_fr) VALUES (4536,'pump_station','Pumpwerk','station_de_pompage');
 INSERT INTO qgep.vl_manhole_function (code, value_en, value_de, value_fr) VALUES (2742,'slurry_collector','Schlammsammler','depotoir');
 INSERT INTO qgep.vl_manhole_function (code, value_en, value_de, value_fr) VALUES (3332,'floating_material_separator','Schwimmstoffabscheider','separateur_materiaux_flottants');
 INSERT INTO qgep.vl_manhole_function (code, value_en, value_de, value_fr) VALUES (4537,'jetting_manhole','Spuelschacht','chambre_de_chasse');
 INSERT INTO qgep.vl_manhole_function (code, value_en, value_de, value_fr) VALUES (4538,'','Trennschacht','chambre_de_repartition');
 INSERT INTO qgep.vl_manhole_function (code, value_en, value_de, value_fr) VALUES (3006,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_manhole ADD CONSTRAINT fkey_vl_manhole_function FOREIGN KEY (function)
 REFERENCES qgep.vl_manhole_function (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_manhole_material
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_manhole_material_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_manhole_material (code, value_en, value_de, value_fr) VALUES (4540,'other','andere','autre');
 INSERT INTO qgep.vl_manhole_material (code, value_en, value_de, value_fr) VALUES (4541,'concrete','Beton','beton');
 INSERT INTO qgep.vl_manhole_material (code, value_en, value_de, value_fr) VALUES (4542,'plastic','Kunststoff','matiere_plastique');
 INSERT INTO qgep.vl_manhole_material (code, value_en, value_de, value_fr) VALUES (4543,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_manhole ADD CONSTRAINT fkey_vl_manhole_material FOREIGN KEY (material)
 REFERENCES qgep.vl_manhole_material (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_manhole_surface_inflow
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_manhole_surface_inflow_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_manhole_surface_inflow (code, value_en, value_de, value_fr) VALUES (3218,'other','andere','autres');
 INSERT INTO qgep.vl_manhole_surface_inflow (code, value_en, value_de, value_fr) VALUES (2741,'no','keiner','aucune');
 INSERT INTO qgep.vl_manhole_surface_inflow (code, value_en, value_de, value_fr) VALUES (2739,'grid','Rost','grille_d_ecoulement');
 INSERT INTO qgep.vl_manhole_surface_inflow (code, value_en, value_de, value_fr) VALUES (3062,'unknown','unbekannt','inconnu');
 INSERT INTO qgep.vl_manhole_surface_inflow (code, value_en, value_de, value_fr) VALUES (2740,'intake_from_side','Zulauf_seitlich','arrivee_laterale');
 ALTER TABLE qgep.od_manhole ADD CONSTRAINT fkey_vl_manhole_surface_inflow FOREIGN KEY (surface_inflow)
 REFERENCES qgep.vl_manhole_surface_inflow (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_discharge_point ADD CONSTRAINT oorel_od_discharge_point_wastewater_structure FOREIGN KEY (obj_id) REFERENCES qgep.od_wastewater_structure(obj_id);
ALTER TABLE qgep.od_discharge_point ADD COLUMN fs_yy_gewaessersektor varchar (16);
ALTER TABLE qgep.od_discharge_point ADD CONSTRAINT rel_discharge_point_yy_gewaessersektor FOREIGN KEY (fs_yy_gewaessersektor) REFERENCES qgep.od_sector_water_body(obj_id);
ALTER TABLE qgep.od_channel ADD CONSTRAINT oorel_od_channel_wastewater_structure FOREIGN KEY (obj_id) REFERENCES qgep.od_wastewater_structure(obj_id);
CREATE TABLE qgep.vl_channel_bedding_encasement
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_channel_bedding_encasement_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_channel_bedding_encasement (code, value_en, value_de, value_fr) VALUES (5332,'in_soil','erdverlegt','enterre');
 INSERT INTO qgep.vl_channel_bedding_encasement (code, value_en, value_de, value_fr) VALUES (5328,'in_channel_suspended','in_Kanal_aufgehaengt','suspendu_dans_le_canal');
 INSERT INTO qgep.vl_channel_bedding_encasement (code, value_en, value_de, value_fr) VALUES (5339,'in_channel_concrete_casted','in_Kanal_einbetoniert','betonne_dans_le_canal');
 INSERT INTO qgep.vl_channel_bedding_encasement (code, value_en, value_de, value_fr) VALUES (5331,'in_walk_in_passage','in_Leitungsgang','en_galerie');
 INSERT INTO qgep.vl_channel_bedding_encasement (code, value_en, value_de, value_fr) VALUES (5337,'in_jacking_pipe_concrete','in_Vortriebsrohr_Beton','en_pousse_tube_en_beton');
 INSERT INTO qgep.vl_channel_bedding_encasement (code, value_en, value_de, value_fr) VALUES (5336,'in_jacking_pipe_steel','in_Vortriebsrohr_Stahl','en_pousse_tube_en_acier');
 INSERT INTO qgep.vl_channel_bedding_encasement (code, value_en, value_de, value_fr) VALUES (5335,'sand','Sand','sable');
 INSERT INTO qgep.vl_channel_bedding_encasement (code, value_en, value_de, value_fr) VALUES (5333,'SIA_type_1','SIA_Typ1','SIA_type_1');
 INSERT INTO qgep.vl_channel_bedding_encasement (code, value_en, value_de, value_fr) VALUES (5330,'SIA_type_2','SIA_Typ2','SIA_type_2');
 INSERT INTO qgep.vl_channel_bedding_encasement (code, value_en, value_de, value_fr) VALUES (5334,'SIA_type_3','SIA_Typ3','SIA_type_3');
 INSERT INTO qgep.vl_channel_bedding_encasement (code, value_en, value_de, value_fr) VALUES (5340,'SIA_type_4','SIA_Typ4','SIA_type_4');
 INSERT INTO qgep.vl_channel_bedding_encasement (code, value_en, value_de, value_fr) VALUES (5329,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_bedding_encasement FOREIGN KEY (bedding_encasement)
 REFERENCES qgep.vl_channel_bedding_encasement (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_channel_connection_type
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_channel_connection_type_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_channel_connection_type (code, value_en, value_de, value_fr) VALUES (2988,'other','andere','autres');
 INSERT INTO qgep.vl_channel_connection_type (code, value_en, value_de, value_fr) VALUES (190,'electric_welded_sleeves','Elektroschweissmuffen','manchon_electrosoudable');
 INSERT INTO qgep.vl_channel_connection_type (code, value_en, value_de, value_fr) VALUES (187,'flat_sleeves','Flachmuffen','manchon_plat');
 INSERT INTO qgep.vl_channel_connection_type (code, value_en, value_de, value_fr) VALUES (193,'flange','Flansch','bride');
 INSERT INTO qgep.vl_channel_connection_type (code, value_en, value_de, value_fr) VALUES (185,'bell_shaped_sleeves','Glockenmuffen','emboitement_a_cloche');
 INSERT INTO qgep.vl_channel_connection_type (code, value_en, value_de, value_fr) VALUES (192,'coupling','Kupplung','raccord');
 INSERT INTO qgep.vl_channel_connection_type (code, value_en, value_de, value_fr) VALUES (194,'screwed_sleeves','Schraubmuffen','manchon_visse');
 INSERT INTO qgep.vl_channel_connection_type (code, value_en, value_de, value_fr) VALUES (189,'butt_welded','spiegelgeschweisst','manchon_soude_au_miroir');
 INSERT INTO qgep.vl_channel_connection_type (code, value_en, value_de, value_fr) VALUES (186,'beaked_sleeves','Spitzmuffen','emboitement_simple');
 INSERT INTO qgep.vl_channel_connection_type (code, value_en, value_de, value_fr) VALUES (191,'push_fit_sleeves','Steckmuffen','raccord_a_serrage');
 INSERT INTO qgep.vl_channel_connection_type (code, value_en, value_de, value_fr) VALUES (188,'slip_on_sleeves','Ueberschiebmuffen','manchon_coulissant');
 INSERT INTO qgep.vl_channel_connection_type (code, value_en, value_de, value_fr) VALUES (3036,'unknown','unbekannt','inconnu');
 INSERT INTO qgep.vl_channel_connection_type (code, value_en, value_de, value_fr) VALUES (3666,'jacking_pipe_coupling','Vortriebsrohrkupplung','raccord_pour_tube_de_pousse_tube');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_connection_type FOREIGN KEY (connection_type)
 REFERENCES qgep.vl_channel_connection_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_channel_function_hierarchic
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_channel_function_hierarchic_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_channel_function_hierarchic (code, value_en, value_de, value_fr) VALUES (2987,'other','andere','autres');
 INSERT INTO qgep.vl_channel_function_hierarchic (code, value_en, value_de, value_fr) VALUES (3249,'surface_drainage','Arealentwaesserung','evacuation_de_surface');
 INSERT INTO qgep.vl_channel_function_hierarchic (code, value_en, value_de, value_fr) VALUES (3251,'water_bodies','Gewaesser','cours_eau');
 INSERT INTO qgep.vl_channel_function_hierarchic (code, value_en, value_de, value_fr) VALUES (19,'main_drain','Hauptsammelkanal','collecteur_principal');
 INSERT INTO qgep.vl_channel_function_hierarchic (code, value_en, value_de, value_fr) VALUES (3672,'main_drain_regional','Hauptsammelkanal_regional','collecteur_principal_regional');
 INSERT INTO qgep.vl_channel_function_hierarchic (code, value_en, value_de, value_fr) VALUES (3252,'residential_drainage','Liegenschaftsentwaesserung','evacuation_bien_fonds');
 INSERT INTO qgep.vl_channel_function_hierarchic (code, value_en, value_de, value_fr) VALUES (20,'collector_sewer','Sammelkanal','collecteur');
 INSERT INTO qgep.vl_channel_function_hierarchic (code, value_en, value_de, value_fr) VALUES (2743,'renovation_conduction','Sanierungsleitung','conduite_d_assainissement');
 INSERT INTO qgep.vl_channel_function_hierarchic (code, value_en, value_de, value_fr) VALUES (3250,'road_drainage','Strassenentwaesserung','evacuation_des_eaux_de_routes');
 INSERT INTO qgep.vl_channel_function_hierarchic (code, value_en, value_de, value_fr) VALUES (3011,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_function_hierarchic FOREIGN KEY (function_hierarchic)
 REFERENCES qgep.vl_channel_function_hierarchic (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_channel_function_hydraulic
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_channel_function_hydraulic_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_channel_function_hydraulic (code, value_en, value_de, value_fr) VALUES (3214,'other','andere','autres');
 INSERT INTO qgep.vl_channel_function_hydraulic (code, value_en, value_de, value_fr) VALUES (2546,'drainage_transportation_pipe','Drainagetransportleitung','conduite_de_transport_pour_le_drainage');
 INSERT INTO qgep.vl_channel_function_hydraulic (code, value_en, value_de, value_fr) VALUES (22,'restriction_pipe','Drosselleitung','conduite_d_etranglement');
 INSERT INTO qgep.vl_channel_function_hydraulic (code, value_en, value_de, value_fr) VALUES (3610,'inverted_syphon','Duekerleitung','siphon_inverse');
 INSERT INTO qgep.vl_channel_function_hydraulic (code, value_en, value_de, value_fr) VALUES (367,'gravity_pipe','Freispiegelleitung','conduite_a_ecoulement_gravitaire');
 INSERT INTO qgep.vl_channel_function_hydraulic (code, value_en, value_de, value_fr) VALUES (23,'pump_pressure_pipe','Pumpendruckleitung','conduite_de_refoulement');
 INSERT INTO qgep.vl_channel_function_hydraulic (code, value_en, value_de, value_fr) VALUES (145,'seepage_water_drain','Sickerleitung','conduite_de_drainage');
 INSERT INTO qgep.vl_channel_function_hydraulic (code, value_en, value_de, value_fr) VALUES (21,'retention_pipe','Speicherleitung','conduite_de_retention');
 INSERT INTO qgep.vl_channel_function_hydraulic (code, value_en, value_de, value_fr) VALUES (144,'jetting_pipe','Spuelleitung','conduite_de_rincage');
 INSERT INTO qgep.vl_channel_function_hydraulic (code, value_en, value_de, value_fr) VALUES (3012,'unknown','unbekannt','inconnu');
 INSERT INTO qgep.vl_channel_function_hydraulic (code, value_en, value_de, value_fr) VALUES (3655,'vacuum_pipe','Vakuumleitung','conduite_sous_vide');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_function_hydraulic FOREIGN KEY (function_hydraulic)
 REFERENCES qgep.vl_channel_function_hydraulic (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_channel_usage_current
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_channel_usage_current_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_channel_usage_current (code, value_en, value_de, value_fr) VALUES (4570,'other','andere','autres');
 INSERT INTO qgep.vl_channel_usage_current (code, value_en, value_de, value_fr) VALUES (4518,'creek_water','Bachwasser','eaux_cours_d_eau');
 INSERT INTO qgep.vl_channel_usage_current (code, value_en, value_de, value_fr) VALUES (4516,'discharged_wastewater','entlastetes_Mischabwasser','eaux_mixtes_deversees');
 INSERT INTO qgep.vl_channel_usage_current (code, value_en, value_de, value_fr) VALUES (4524,'industrial_wastewater','Industrieabwasser','eaux_industrielles');
 INSERT INTO qgep.vl_channel_usage_current (code, value_en, value_de, value_fr) VALUES (4522,'combined_wastewater','Mischabwasser','eaux_mixtes');
 INSERT INTO qgep.vl_channel_usage_current (code, value_en, value_de, value_fr) VALUES (4520,'rain_wastewater','Regenabwasser','eaux_pluviales');
 INSERT INTO qgep.vl_channel_usage_current (code, value_en, value_de, value_fr) VALUES (4514,'clean_wastewater','Reinabwasser','eaux_claires');
 INSERT INTO qgep.vl_channel_usage_current (code, value_en, value_de, value_fr) VALUES (4526,'wastewater','Schmutzabwasser','eaux_usees');
 INSERT INTO qgep.vl_channel_usage_current (code, value_en, value_de, value_fr) VALUES (4571,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_usage_current FOREIGN KEY (usage_current)
 REFERENCES qgep.vl_channel_usage_current (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_channel_usage_planned
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_channel_usage_planned_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_channel_usage_planned (code, value_en, value_de, value_fr) VALUES (4568,'other','andere','autres');
 INSERT INTO qgep.vl_channel_usage_planned (code, value_en, value_de, value_fr) VALUES (4519,'creek_water','Bachwasser','eaux_cours_d_eau');
 INSERT INTO qgep.vl_channel_usage_planned (code, value_en, value_de, value_fr) VALUES (4517,'discharged_combined_wastewater','entlastetes_Mischabwasser','eaux_mixtes_deversees');
 INSERT INTO qgep.vl_channel_usage_planned (code, value_en, value_de, value_fr) VALUES (4525,'industrial_wastewater','Industrieabwasser','eaux_industrielles');
 INSERT INTO qgep.vl_channel_usage_planned (code, value_en, value_de, value_fr) VALUES (4523,'combined_wastewater','Mischabwasser','eaux_mixtes');
 INSERT INTO qgep.vl_channel_usage_planned (code, value_en, value_de, value_fr) VALUES (4521,'rain_wastewater','Regenabwasser','eaux_pluviales');
 INSERT INTO qgep.vl_channel_usage_planned (code, value_en, value_de, value_fr) VALUES (4515,'clean_wastewater','Reinabwasser','eaux_claires');
 INSERT INTO qgep.vl_channel_usage_planned (code, value_en, value_de, value_fr) VALUES (4527,'wastewater','Schmutzabwasser','eaux_usees');
 INSERT INTO qgep.vl_channel_usage_planned (code, value_en, value_de, value_fr) VALUES (4569,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_usage_planned FOREIGN KEY (usage_planned)
 REFERENCES qgep.vl_channel_usage_planned (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_special_structure ADD CONSTRAINT oorel_od_special_structure_wastewater_structure FOREIGN KEY (obj_id) REFERENCES qgep.od_wastewater_structure(obj_id);
CREATE TABLE qgep.vl_special_structure_bypass
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_special_structure_bypass_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_special_structure_bypass (code, value_en, value_de, value_fr) VALUES (2682,'inexistent','nicht_vorhanden','inexistant');
 INSERT INTO qgep.vl_special_structure_bypass (code, value_en, value_de, value_fr) VALUES (3055,'unknown','unbekannt','inconnu');
 INSERT INTO qgep.vl_special_structure_bypass (code, value_en, value_de, value_fr) VALUES (2681,'existent','vorhanden','existant');
 ALTER TABLE qgep.od_special_structure ADD CONSTRAINT fkey_vl_special_structure_bypass FOREIGN KEY (bypass)
 REFERENCES qgep.vl_special_structure_bypass (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_special_structure_function
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_special_structure_function_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr) VALUES (245,'drop_structure','Absturzbauwerk','ouvrage_de_chute');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr) VALUES (3202,'other','andere','autres');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr) VALUES (386,'venting','Be_Entlueftung','aeration');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr) VALUES (3234,'inverse_syphon_chamber','Duekerkammer','chambre_avec_siphon_inverse');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr) VALUES (3348,'terrain_depression','Gelaendemulde','depression_de_terrain');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr) VALUES (336,'bolders_bedload_catchement_dam','Geschiebefang','depotoir_pour_alluvions');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr) VALUES (3233,'spill_way','Hochwasserentlastung','deversoir_orage');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr) VALUES (2744,'cesspit','Jauchegrube','fosse_a_purin');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr) VALUES (247,'septic_tank','Klaergrube','fosse_septique');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr) VALUES (2998,'manhole','Kontrollschacht','regard_de_visite');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr) VALUES (2768,'oil_separator','Oelabscheider','separateur_d_hydrocarbures');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr) VALUES (246,'pump_station','Pumpwerk','station_de_pompage');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr) VALUES (3673,'stormwater_tank_with_overflow','Regenbecken_Durchlaufbecken','BEP_decantation');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr) VALUES (3674,'stormwater_tank_retaining_first_flush','Regenbecken_Fangbecken','BEP_retention');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr) VALUES (3675,'stormwater_sedimentation_tank','Regenbecken_Regenklaerbecken','BEP_clarification');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr) VALUES (3676,'stormwater_retention_tank','Regenbecken_Regenrueckhaltebecken','BEP_accumulation');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr) VALUES (3677,'stormwater_composite_tank','Regenbecken_Verbundbecken','BEP_combine');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr) VALUES (3331,'floating_material_separator','Schwimmstoffabscheider','separateur_materiaux_flottants');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr) VALUES (383,'side_access','seitlicherZugang','acces_lateral');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr) VALUES (227,'jetting_manhole','Spuelschacht','chambre_de_chasse');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr) VALUES (96,'seperating_manhole','Trennschacht','chambre_de_repartition');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr) VALUES (3008,'unknown','unbekannt','inconnu');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr) VALUES (2745,'vortex_manhole','Wirbelfallschacht','chambre_de_chute_a_vortex');
 ALTER TABLE qgep.od_special_structure ADD CONSTRAINT fkey_vl_special_structure_function FOREIGN KEY (function)
 REFERENCES qgep.vl_special_structure_function (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_infiltration_installation ADD CONSTRAINT oorel_od_infiltration_installation_wastewater_structure FOREIGN KEY (obj_id) REFERENCES qgep.od_wastewater_structure(obj_id);
CREATE TABLE qgep.vl_infiltration_installation_defects
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_infiltration_installation_defects_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_infiltration_installation_defects (code, value_en, value_de, value_fr) VALUES (3274,'none','keine','aucune');
 INSERT INTO qgep.vl_infiltration_installation_defects (code, value_en, value_de, value_fr) VALUES (3276,'marginal','unwesentliche','modestes');
 INSERT INTO qgep.vl_infiltration_installation_defects (code, value_en, value_de, value_fr) VALUES (3275,'substantial','wesentliche','importantes');
 ALTER TABLE qgep.od_infiltration_installation ADD CONSTRAINT fkey_vl_infiltration_installation_defects FOREIGN KEY (defects)
 REFERENCES qgep.vl_infiltration_installation_defects (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_infiltration_installation_emergency_spillway
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_infiltration_installation_emergency_spillway_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_infiltration_installation_emergency_spillway (code, value_en, value_de, value_fr) VALUES (3306,'in_combined_waste_water_drain','inMischwasserkanalisation','dans_egouts_eaux_mixtes');
 INSERT INTO qgep.vl_infiltration_installation_emergency_spillway (code, value_en, value_de, value_fr) VALUES (3307,'in_rain_waste_water_drain','inRegenwasserkanalisation','dans_canalisation_eaux_pluviales');
 INSERT INTO qgep.vl_infiltration_installation_emergency_spillway (code, value_en, value_de, value_fr) VALUES (3304,'in_water_body','inVorfluter','au_cours_d_eau_recepteur');
 INSERT INTO qgep.vl_infiltration_installation_emergency_spillway (code, value_en, value_de, value_fr) VALUES (3303,'none','keiner','aucun');
 INSERT INTO qgep.vl_infiltration_installation_emergency_spillway (code, value_en, value_de, value_fr) VALUES (3305,'surface_discharge','oberflaechlichausmuendend','deversement_en_surface');
 INSERT INTO qgep.vl_infiltration_installation_emergency_spillway (code, value_en, value_de, value_fr) VALUES (3308,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_infiltration_installation ADD CONSTRAINT fkey_vl_infiltration_installation_emergency_spillway FOREIGN KEY (emergency_spillway)
 REFERENCES qgep.vl_infiltration_installation_emergency_spillway (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_infiltration_installation_labeling
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_infiltration_installation_labeling_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_infiltration_installation_labeling (code, value_en, value_de, value_fr) VALUES (3328,'labeled','beschriftet','signale');
 INSERT INTO qgep.vl_infiltration_installation_labeling (code, value_en, value_de, value_fr) VALUES (3329,'not_labeled','nichtbeschriftet','non_signale');
 INSERT INTO qgep.vl_infiltration_installation_labeling (code, value_en, value_de, value_fr) VALUES (3330,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_infiltration_installation ADD CONSTRAINT fkey_vl_infiltration_installation_labeling FOREIGN KEY (labeling)
 REFERENCES qgep.vl_infiltration_installation_labeling (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_infiltration_installation_seepage_utilization
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_infiltration_installation_seepage_utilization_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_infiltration_installation_seepage_utilization (code, value_en, value_de, value_fr) VALUES (274,'rain_water','Regenabwasser','eaux_pluviales');
 INSERT INTO qgep.vl_infiltration_installation_seepage_utilization (code, value_en, value_de, value_fr) VALUES (273,'clean_water','Reinabwasser','eaux_claires');
 INSERT INTO qgep.vl_infiltration_installation_seepage_utilization (code, value_en, value_de, value_fr) VALUES (3086,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_infiltration_installation ADD CONSTRAINT fkey_vl_infiltration_installation_seepage_utilization FOREIGN KEY (seepage_utilization)
 REFERENCES qgep.vl_infiltration_installation_seepage_utilization (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_infiltration_installation_type
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_infiltration_installation_type_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_infiltration_installation_type (code, value_en, value_de, value_fr) VALUES (3282,'with_soil_passage','andere_mit_Bodenpassage','autre_avec_passage_a_travers_sol');
 INSERT INTO qgep.vl_infiltration_installation_type (code, value_en, value_de, value_fr) VALUES (3285,'without_soil_passage','andere_ohne_Bodenpassage','autre_sans_passage_a_travers_sol');
 INSERT INTO qgep.vl_infiltration_installation_type (code, value_en, value_de, value_fr) VALUES (3279,'surface_percolation','Flaechenfoermige_Versickerung','infiltration_superficielle_sur_place');
 INSERT INTO qgep.vl_infiltration_installation_type (code, value_en, value_de, value_fr) VALUES (277,'gravel_formation','Kieskoerper','corps_de_gravier');
 INSERT INTO qgep.vl_infiltration_installation_type (code, value_en, value_de, value_fr) VALUES (3284,'combination_manhole_pipe','Kombination_Schacht_Strang','combinaison_puits_bande');
 INSERT INTO qgep.vl_infiltration_installation_type (code, value_en, value_de, value_fr) VALUES (3281,'depression_percolation','MuldenRigolenversickerung','cuvettes_rigoles_filtrantes');
 INSERT INTO qgep.vl_infiltration_installation_type (code, value_en, value_de, value_fr) VALUES (3087,'unknown','unbekannt','inconnu');
 INSERT INTO qgep.vl_infiltration_installation_type (code, value_en, value_de, value_fr) VALUES (3280,'percolation_over_the_shoulder','Versickerung_ueber_die_Schulter','infiltration_par_les_bas_cotes');
 INSERT INTO qgep.vl_infiltration_installation_type (code, value_en, value_de, value_fr) VALUES (276,'percolation_basin','Versickerungsbecken','bassin_d_infiltration');
 INSERT INTO qgep.vl_infiltration_installation_type (code, value_en, value_de, value_fr) VALUES (278,'percolation_manhole','Versickerungsschacht','puits_d_infiltration');
 INSERT INTO qgep.vl_infiltration_installation_type (code, value_en, value_de, value_fr) VALUES (3283,'percolation_gallery','Versickerungsstrang_Galerie','bande_infiltration_galerie');
 ALTER TABLE qgep.od_infiltration_installation ADD CONSTRAINT fkey_vl_infiltration_installation_type FOREIGN KEY (type)
 REFERENCES qgep.vl_infiltration_installation_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_infiltration_installation_vehicle_access
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_infiltration_installation_vehicle_access_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_infiltration_installation_vehicle_access (code, value_en, value_de, value_fr) VALUES (3289,'unknown','unbekannt','inconnu');
 INSERT INTO qgep.vl_infiltration_installation_vehicle_access (code, value_en, value_de, value_fr) VALUES (3288,'inaccessible','unzugaenglich','inaccessible');
 INSERT INTO qgep.vl_infiltration_installation_vehicle_access (code, value_en, value_de, value_fr) VALUES (3287,'accessible','zugaenglich','accessible');
 ALTER TABLE qgep.od_infiltration_installation ADD CONSTRAINT fkey_vl_infiltration_installation_vehicle_access FOREIGN KEY (vehicle_access)
 REFERENCES qgep.vl_infiltration_installation_vehicle_access (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_infiltration_installation_watertightness
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_infiltration_installation_watertightness_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_infiltration_installation_watertightness (code, value_en, value_de, value_fr) VALUES (3295,'not_watertight','nichtwasserdicht','non_etanche');
 INSERT INTO qgep.vl_infiltration_installation_watertightness (code, value_en, value_de, value_fr) VALUES (3296,'unknown','unbekannt','inconnu');
 INSERT INTO qgep.vl_infiltration_installation_watertightness (code, value_en, value_de, value_fr) VALUES (3294,'watertight','wasserdicht','etanche');
 ALTER TABLE qgep.od_infiltration_installation ADD CONSTRAINT fkey_vl_infiltration_installation_watertightness FOREIGN KEY (watertightness)
 REFERENCES qgep.vl_infiltration_installation_watertightness (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_infiltration_installation ADD COLUMN fs_yyy_grundwasserleiter varchar (16);
ALTER TABLE qgep.od_infiltration_installation ADD CONSTRAINT rel_infiltration_installation_yyy_grundwasserleiter FOREIGN KEY (fs_yyy_grundwasserleiter) REFERENCES qgep.od_aquifier(obj_id);
ALTER TABLE qgep.od_river ADD CONSTRAINT oorel_od_river_chute FOREIGN KEY (obj_id) REFERENCES qgep.od_chute(obj_id);
CREATE TABLE qgep.vl_river_type
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_river_type_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_river_type (code, value_en, value_de, value_fr) VALUES (3397,'','Gletscherbach','ruisseau_de_glacier');
 INSERT INTO qgep.vl_river_type (code, value_en, value_de, value_fr) VALUES (3399,'','Moorbach','ruisseau_de_tourbiere');
 INSERT INTO qgep.vl_river_type (code, value_en, value_de, value_fr) VALUES (3398,'','Seeausfluss','effluent_d_un_lac');
 INSERT INTO qgep.vl_river_type (code, value_en, value_de, value_fr) VALUES (3396,'','Travertinbach','ruisseau_sur_fond_tufcalcaire');
 INSERT INTO qgep.vl_river_type (code, value_en, value_de, value_fr) VALUES (3400,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_river ADD CONSTRAINT fkey_vl_river_type FOREIGN KEY (type)
 REFERENCES qgep.vl_river_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_lake ADD CONSTRAINT oorel_od_lake_chute FOREIGN KEY (obj_id) REFERENCES qgep.od_chute(obj_id);
ALTER TABLE qgep.od_rock_ramp ADD CONSTRAINT oorel_od_rock_ramp_water_control_structure FOREIGN KEY (obj_id) REFERENCES qgep.od_water_control_structure(obj_id);
CREATE TABLE qgep.vl_rock_ramp_yyy_befestigung
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_rock_ramp_yyy_Befestigung_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_rock_ramp_yyy_befestigung (code, value_en, value_de, value_fr) VALUES (2635,'','andere_glatt','autres_lisse');
 INSERT INTO qgep.vl_rock_ramp_yyy_befestigung (code, value_en, value_de, value_fr) VALUES (2634,'','andere_rauh','autres_rugueux');
 INSERT INTO qgep.vl_rock_ramp_yyy_befestigung (code, value_en, value_de, value_fr) VALUES (415,'','Betonrinne','lit_en_beton');
 INSERT INTO qgep.vl_rock_ramp_yyy_befestigung (code, value_en, value_de, value_fr) VALUES (412,'','Blockwurf','enrochement');
 INSERT INTO qgep.vl_rock_ramp_yyy_befestigung (code, value_en, value_de, value_fr) VALUES (413,'','gepflaestert','pavement');
 INSERT INTO qgep.vl_rock_ramp_yyy_befestigung (code, value_en, value_de, value_fr) VALUES (414,'','Holzbalken','poutres_en_bois');
 INSERT INTO qgep.vl_rock_ramp_yyy_befestigung (code, value_en, value_de, value_fr) VALUES (3063,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_rock_ramp ADD CONSTRAINT fkey_vl_rock_ramp_yyy_Befestigung FOREIGN KEY (yyy_Befestigung)
 REFERENCES qgep.vl_rock_ramp_yyy_befestigung (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_passage ADD CONSTRAINT oorel_od_passage_water_control_structure FOREIGN KEY (obj_id) REFERENCES qgep.od_water_control_structure(obj_id);
ALTER TABLE qgep.od_lock ADD CONSTRAINT oorel_od_lock_water_control_structure FOREIGN KEY (obj_id) REFERENCES qgep.od_water_control_structure(obj_id);
ALTER TABLE qgep.od_chute ADD CONSTRAINT oorel_od_chute_water_control_structure FOREIGN KEY (obj_id) REFERENCES qgep.od_water_control_structure(obj_id);
CREATE TABLE qgep.vl_chute_material
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_chute_material_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_chute_material (code, value_en, value_de, value_fr) VALUES (2633,'other','andere','autres');
 INSERT INTO qgep.vl_chute_material (code, value_en, value_de, value_fr) VALUES (409,'','Beton_Steinpflaesterung','beton_pavage_de_pierres');
 INSERT INTO qgep.vl_chute_material (code, value_en, value_de, value_fr) VALUES (411,'','Fels_Steinbloecke','rocher_blocs_de_rocher');
 INSERT INTO qgep.vl_chute_material (code, value_en, value_de, value_fr) VALUES (408,'wood','Holz','bois');
 INSERT INTO qgep.vl_chute_material (code, value_en, value_de, value_fr) VALUES (410,'','natuerlich_kein','naturel_aucun');
 INSERT INTO qgep.vl_chute_material (code, value_en, value_de, value_fr) VALUES (3061,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_chute ADD CONSTRAINT fkey_vl_chute_material FOREIGN KEY (material)
 REFERENCES qgep.vl_chute_material (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_chute_type
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_chute_type_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_chute_type (code, value_en, value_de, value_fr) VALUES (3591,'','kuenstlich','artificiel');
 INSERT INTO qgep.vl_chute_type (code, value_en, value_de, value_fr) VALUES (3592,'','natuerlich','naturel');
 INSERT INTO qgep.vl_chute_type (code, value_en, value_de, value_fr) VALUES (3593,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_chute ADD CONSTRAINT fkey_vl_chute_type FOREIGN KEY (type)
 REFERENCES qgep.vl_chute_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_ford ADD CONSTRAINT oorel_od_ford_water_control_structure FOREIGN KEY (obj_id) REFERENCES qgep.od_water_control_structure(obj_id);
ALTER TABLE qgep.od_dam ADD CONSTRAINT oorel_od_dam_water_control_structure FOREIGN KEY (obj_id) REFERENCES qgep.od_water_control_structure(obj_id);
CREATE TABLE qgep.vl_dam_type
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_dam_type_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_dam_type (code, value_en, value_de, value_fr) VALUES (416,'','Stauwehr','digue_reservoir');
 INSERT INTO qgep.vl_dam_type (code, value_en, value_de, value_fr) VALUES (417,'','Streichwehr','deversoir_lateral');
 INSERT INTO qgep.vl_dam_type (code, value_en, value_de, value_fr) VALUES (419,'','Talsperre','barrage');
 INSERT INTO qgep.vl_dam_type (code, value_en, value_de, value_fr) VALUES (418,'','Tirolerwehr','prise_tyrolienne');
 INSERT INTO qgep.vl_dam_type (code, value_en, value_de, value_fr) VALUES (3064,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_dam ADD CONSTRAINT fkey_vl_dam_type FOREIGN KEY (type)
 REFERENCES qgep.vl_dam_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_blocking_debris ADD CONSTRAINT oorel_od_blocking_debris_water_control_structure FOREIGN KEY (obj_id) REFERENCES qgep.od_water_control_structure(obj_id);
ALTER TABLE qgep.od_param_ca_general ADD CONSTRAINT oorel_od_param_ca_general_surface_runoff_parameters FOREIGN KEY (obj_id) REFERENCES qgep.od_surface_runoff_parameters(obj_id);
ALTER TABLE qgep.od_param_ca_mouse1 ADD CONSTRAINT oorel_od_param_ca_mouse1_surface_runoff_parameters FOREIGN KEY (obj_id) REFERENCES qgep.od_surface_runoff_parameters(obj_id);
ALTER TABLE qgep.od_waste_water_association ADD CONSTRAINT oorel_od_waste_water_association_organisation FOREIGN KEY (obj_id) REFERENCES qgep.od_organisation(obj_id);
ALTER TABLE qgep.od_canton ADD CONSTRAINT oorel_od_canton_organisation FOREIGN KEY (obj_id) REFERENCES qgep.od_organisation(obj_id);
ALTER TABLE qgep.od_privat ADD CONSTRAINT oorel_od_privat_organisation FOREIGN KEY (obj_id) REFERENCES qgep.od_organisation(obj_id);
ALTER TABLE qgep.od_administrative_office ADD CONSTRAINT oorel_od_administrative_office_organisation FOREIGN KEY (obj_id) REFERENCES qgep.od_organisation(obj_id);
ALTER TABLE qgep.od_municipality ADD CONSTRAINT oorel_od_municipality_organisation FOREIGN KEY (obj_id) REFERENCES qgep.od_organisation(obj_id);
ALTER TABLE qgep.od_waste_water_treatment_plant ADD CONSTRAINT oorel_od_waste_water_treatment_plant_organisation FOREIGN KEY (obj_id) REFERENCES qgep.od_organisation(obj_id);
ALTER TABLE qgep.od_reach ADD CONSTRAINT oorel_od_reach_wastewater_networkelement FOREIGN KEY (obj_id) REFERENCES qgep.od_wastewater_networkelement(obj_id);
CREATE TABLE qgep.vl_reach_horizontal_positioning
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_reach_horizontal_positioning_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_reach_horizontal_positioning (code, value_en, value_de, value_fr) VALUES (3630,'accurate','genau','precis');
 INSERT INTO qgep.vl_reach_horizontal_positioning (code, value_en, value_de, value_fr) VALUES (3632,'unknown','unbekannt','inconnu');
 INSERT INTO qgep.vl_reach_horizontal_positioning (code, value_en, value_de, value_fr) VALUES (3631,'inaccurate','ungenau','imprecis');
 ALTER TABLE qgep.od_reach ADD CONSTRAINT fkey_vl_reach_horizontal_positioning FOREIGN KEY (horizontal_positioning)
 REFERENCES qgep.vl_reach_horizontal_positioning (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_reach_inside_coating
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_reach_inside_coating_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_reach_inside_coating (code, value_en, value_de, value_fr) VALUES (2984,'other','andere','autres');
 INSERT INTO qgep.vl_reach_inside_coating (code, value_en, value_de, value_fr) VALUES (248,'coating','Anstrich_Beschichtung','peinture_revetement');
 INSERT INTO qgep.vl_reach_inside_coating (code, value_en, value_de, value_fr) VALUES (250,'brick_lining','Kanalklinkerauskleidung','revetement_en_brique');
 INSERT INTO qgep.vl_reach_inside_coating (code, value_en, value_de, value_fr) VALUES (251,'stoneware_lining','Steinzeugauskleidung','revetement_en_gres');
 INSERT INTO qgep.vl_reach_inside_coating (code, value_en, value_de, value_fr) VALUES (3044,'unknown','unbekannt','inconnu');
 INSERT INTO qgep.vl_reach_inside_coating (code, value_en, value_de, value_fr) VALUES (249,'cement_mortar_lining','Zementmoertelauskleidung','revetement_en_mortier_de_ciment');
 ALTER TABLE qgep.od_reach ADD CONSTRAINT fkey_vl_reach_inside_coating FOREIGN KEY (inside_coating)
 REFERENCES qgep.vl_reach_inside_coating (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_reach_material
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_reach_material_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr) VALUES (2985,'other','andere','autres');
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr) VALUES (2754,'asbestos_cement','Asbestzement','amiante_ciment');
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr) VALUES (3638,'concrete_normal','Beton_Normalbeton','beton_normal');
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr) VALUES (3639,'concrete_insitu','Beton_Ortsbeton','beton_coule_sur_place');
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr) VALUES (3640,'concrete_presspipe','Beton_Pressrohrbeton','beton_pousse_tube');
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr) VALUES (3641,'concrete_special','Beton_Spezialbeton','beton_special');
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr) VALUES (3256,'concrete_unknown','Beton_unbekannt','beton_inconnu');
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr) VALUES (147,'fiber_cement','Faserzement','fibrociment');
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr) VALUES (2755,'bricks','Gebrannte_Steine','terre_cuite');
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr) VALUES (148,'cast_ductile_iron','Guss_duktil','fonte_ductile');
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr) VALUES (3648,'cast_gray_iron','Guss_Grauguss','fonte_grise');
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr) VALUES (3642,'plastic_epoxy_resin','Kunststoff_Epoxydharz','resine_d_epoxy');
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr) VALUES (3643,'plastic_highdensity_polyethylene','Kunststoff_Hartpolyethylen','polyethylene_dur');
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr) VALUES (3644,'plastic_polyester_GUP','Kunststoff_Polyester_GUP','polyester_GUP');
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr) VALUES (3645,'plastic_polyethylene','Kunststoff_Polyethylen','polyethylene');
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr) VALUES (3646,'plastic_polypropylene','Kunststoff_Polypropylen','polypropylene');
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr) VALUES (3647,'plastic_PVC','Kunststoff_Polyvinilchlorid','PVC');
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr) VALUES (3258,'plastic_unknown','Kunststoff_unbekannt','plastique_inconnu');
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr) VALUES (153,'steel','Stahl','acier');
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr) VALUES (3654,'steel_stainless','Stahl_rostfrei','acier_inoxydable');
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr) VALUES (154,'stoneware','Steinzeug','gres');
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr) VALUES (2761,'clay','Ton','argile');
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr) VALUES (3016,'unknown','unbekannt','inconnu');
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr) VALUES (2762,'cement','Zement','ciment');
 ALTER TABLE qgep.od_reach ADD CONSTRAINT fkey_vl_reach_material FOREIGN KEY (material)
 REFERENCES qgep.vl_reach_material (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_reach ADD COLUMN fs_reach_point_from varchar (16);
ALTER TABLE qgep.od_reach ADD CONSTRAINT rel_reach_reach_point_from FOREIGN KEY (fs_reach_point_from) REFERENCES qgep.od_reach_point(obj_id);
ALTER TABLE qgep.od_reach ADD COLUMN fs_reach_point_to varchar (16);
ALTER TABLE qgep.od_reach ADD CONSTRAINT rel_reach_reach_point_to FOREIGN KEY (fs_reach_point_to) REFERENCES qgep.od_reach_point(obj_id);
ALTER TABLE qgep.od_reach ADD COLUMN fs_pipe_profile varchar (16);
ALTER TABLE qgep.od_reach ADD CONSTRAINT rel_reach_pipe_profile FOREIGN KEY (fs_pipe_profile) REFERENCES qgep.od_pipe_profile(obj_id);
ALTER TABLE qgep.od_wastewater_node ADD CONSTRAINT oorel_od_wastewater_node_wastewater_networkelement FOREIGN KEY (obj_id) REFERENCES qgep.od_wastewater_networkelement(obj_id);
ALTER TABLE qgep.od_wastewater_node ADD COLUMN fs_hydr_geometry varchar (16);
ALTER TABLE qgep.od_wastewater_node ADD CONSTRAINT rel_wastewater_node_hydr_geometry FOREIGN KEY (fs_hydr_geometry) REFERENCES qgep.od_hydr_geometry(obj_id);
ALTER TABLE qgep.od_prank_weir ADD CONSTRAINT oorel_od_prank_weir_overfall FOREIGN KEY (obj_id) REFERENCES qgep.od_overfall(obj_id);
CREATE TABLE qgep.vl_prank_weir_yyy_ueberfallkante
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_prank_weir_yyy_Ueberfallkante_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_prank_weir_yyy_ueberfallkante (code, value_en, value_de, value_fr) VALUES (2995,'other','andere','autres');
 INSERT INTO qgep.vl_prank_weir_yyy_ueberfallkante (code, value_en, value_de, value_fr) VALUES (351,'','rechteckig','angulaire');
 INSERT INTO qgep.vl_prank_weir_yyy_ueberfallkante (code, value_en, value_de, value_fr) VALUES (350,'round','rund','arrondie');
 INSERT INTO qgep.vl_prank_weir_yyy_ueberfallkante (code, value_en, value_de, value_fr) VALUES (349,'','scharfkantig','arete_vive');
 INSERT INTO qgep.vl_prank_weir_yyy_ueberfallkante (code, value_en, value_de, value_fr) VALUES (3014,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_prank_weir ADD CONSTRAINT fkey_vl_prank_weir_yyy_Ueberfallkante FOREIGN KEY (yyy_Ueberfallkante)
 REFERENCES qgep.vl_prank_weir_yyy_ueberfallkante (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_prank_weir_yyy_wehrschwellenzahl
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_prank_weir_yyy_WehrschwellenZahl_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_prank_weir_yyy_wehrschwellenzahl (code, value_en, value_de, value_fr) VALUES (353,'double_sided','beidseitig','double');
 INSERT INTO qgep.vl_prank_weir_yyy_wehrschwellenzahl (code, value_en, value_de, value_fr) VALUES (352,'','einseitig','simple');
 INSERT INTO qgep.vl_prank_weir_yyy_wehrschwellenzahl (code, value_en, value_de, value_fr) VALUES (3041,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_prank_weir ADD CONSTRAINT fkey_vl_prank_weir_yyy_WehrschwellenZahl FOREIGN KEY (yyy_WehrschwellenZahl)
 REFERENCES qgep.vl_prank_weir_yyy_wehrschwellenzahl (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_pump ADD CONSTRAINT oorel_od_pump_overfall FOREIGN KEY (obj_id) REFERENCES qgep.od_overfall(obj_id);
CREATE TABLE qgep.vl_pump_contruction_type
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_pump_contruction_type_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_pump_contruction_type (code, value_en, value_de, value_fr) VALUES (2983,'other','andere','autres');
 INSERT INTO qgep.vl_pump_contruction_type (code, value_en, value_de, value_fr) VALUES (2662,'','Druckluftanlage','systeme_a_air_comprime');
 INSERT INTO qgep.vl_pump_contruction_type (code, value_en, value_de, value_fr) VALUES (314,'','Kolbenpumpe','pompe_a_piston');
 INSERT INTO qgep.vl_pump_contruction_type (code, value_en, value_de, value_fr) VALUES (309,'','Kreiselpumpe','pompe_centrifuge');
 INSERT INTO qgep.vl_pump_contruction_type (code, value_en, value_de, value_fr) VALUES (310,'','Schneckenpumpe','pompe_a_vis');
 INSERT INTO qgep.vl_pump_contruction_type (code, value_en, value_de, value_fr) VALUES (3082,'unknown','unbekannt','inconnu');
 INSERT INTO qgep.vl_pump_contruction_type (code, value_en, value_de, value_fr) VALUES (2661,'','Vakuumanlage','systeme_a_vide_d_air');
 ALTER TABLE qgep.od_pump ADD CONSTRAINT fkey_vl_pump_contruction_type FOREIGN KEY (contruction_type)
 REFERENCES qgep.vl_pump_contruction_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_pump_yyy_aufstellungantrieb
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_pump_yyy_AufstellungAntrieb_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_pump_yyy_aufstellungantrieb (code, value_en, value_de, value_fr) VALUES (318,'','nass','immerge');
 INSERT INTO qgep.vl_pump_yyy_aufstellungantrieb (code, value_en, value_de, value_fr) VALUES (311,'','trocken','non_submersible');
 INSERT INTO qgep.vl_pump_yyy_aufstellungantrieb (code, value_en, value_de, value_fr) VALUES (3070,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_pump ADD CONSTRAINT fkey_vl_pump_yyy_AufstellungAntrieb FOREIGN KEY (yyy_AufstellungAntrieb)
 REFERENCES qgep.vl_pump_yyy_aufstellungantrieb (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_pump_yyy_aufstellungfoerderaggregat
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_pump_yyy_AufstellungFoerderaggregat_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_pump_yyy_aufstellungfoerderaggregat (code, value_en, value_de, value_fr) VALUES (362,'','horizontal','horizontal');
 INSERT INTO qgep.vl_pump_yyy_aufstellungfoerderaggregat (code, value_en, value_de, value_fr) VALUES (3071,'unknown','unbekannt','inconnu');
 INSERT INTO qgep.vl_pump_yyy_aufstellungfoerderaggregat (code, value_en, value_de, value_fr) VALUES (363,'vertical','vertikal','vertical');
 ALTER TABLE qgep.od_pump ADD CONSTRAINT fkey_vl_pump_yyy_AufstellungFoerderaggregat FOREIGN KEY (yyy_AufstellungFoerderaggregat)
 REFERENCES qgep.vl_pump_yyy_aufstellungfoerderaggregat (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_leapingweir ADD CONSTRAINT oorel_od_leapingweir_overfall FOREIGN KEY (obj_id) REFERENCES qgep.od_overfall(obj_id);
CREATE TABLE qgep.vl_leapingweir_shape_opening
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_leapingweir_shape_opening_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_leapingweir_shape_opening (code, value_en, value_de, value_fr) VALUES (3581,'other','andere','autres');
 INSERT INTO qgep.vl_leapingweir_shape_opening (code, value_en, value_de, value_fr) VALUES (3582,'','Kreis','circulaire');
 INSERT INTO qgep.vl_leapingweir_shape_opening (code, value_en, value_de, value_fr) VALUES (3585,'','Parabel','parabolique');
 INSERT INTO qgep.vl_leapingweir_shape_opening (code, value_en, value_de, value_fr) VALUES (3583,'','Rechteck','rectangulaire');
 INSERT INTO qgep.vl_leapingweir_shape_opening (code, value_en, value_de, value_fr) VALUES (3584,'unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_leapingweir ADD CONSTRAINT fkey_vl_leapingweir_shape_opening FOREIGN KEY (shape_opening)
 REFERENCES qgep.vl_leapingweir_shape_opening (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_fountain ADD CONSTRAINT oorel_od_fountain_connection_object FOREIGN KEY (obj_id) REFERENCES qgep.od_connection_object(obj_id);
ALTER TABLE qgep.od_reservoir ADD CONSTRAINT oorel_od_reservoir_connection_object FOREIGN KEY (obj_id) REFERENCES qgep.od_connection_object(obj_id);
ALTER TABLE qgep.od_building ADD CONSTRAINT oorel_od_building_connection_object FOREIGN KEY (obj_id) REFERENCES qgep.od_connection_object(obj_id);
ALTER TABLE qgep.od_individual_surface ADD CONSTRAINT oorel_od_individual_surface_connection_object FOREIGN KEY (obj_id) REFERENCES qgep.od_connection_object(obj_id);
CREATE TABLE qgep.vl_individual_surface_function
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_individual_surface_function_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_individual_surface_function (code, value_en, value_de, value_fr) VALUES (2979,'other','andere','autres');
 INSERT INTO qgep.vl_individual_surface_function (code, value_en, value_de, value_fr) VALUES (3466,'','Bahnanlagen','installation_ferroviaire');
 INSERT INTO qgep.vl_individual_surface_function (code, value_en, value_de, value_fr) VALUES (3461,'','DachflaecheIndustrieundGewerbebetriebe','surface_toits_bat_industriels_artisanaux');
 INSERT INTO qgep.vl_individual_surface_function (code, value_en, value_de, value_fr) VALUES (3460,'','DachflaecheWohnundBuerogebaeude','surface_toits_imm_habitation_administratifs');
 INSERT INTO qgep.vl_individual_surface_function (code, value_en, value_de, value_fr) VALUES (3464,'','Erschliessungs_Sammelstrassen','routes_de_desserte_et_collectives');
 INSERT INTO qgep.vl_individual_surface_function (code, value_en, value_de, value_fr) VALUES (3467,'','Parkplaetze','parkings');
 INSERT INTO qgep.vl_individual_surface_function (code, value_en, value_de, value_fr) VALUES (3462,'','UmschlagundLagerplaetze','places_transbordement_entreposage');
 INSERT INTO qgep.vl_individual_surface_function (code, value_en, value_de, value_fr) VALUES (3029,'unknown','unbekannt','inconnu');
 INSERT INTO qgep.vl_individual_surface_function (code, value_en, value_de, value_fr) VALUES (3465,'','Verbindungs_Hauptverkehrs_Hochleistungsstrassen','routes_de_raccordement_principales_grand_trafic');
 INSERT INTO qgep.vl_individual_surface_function (code, value_en, value_de, value_fr) VALUES (3463,'','VorplaetzeZufahrten','places_devant_entree_acces');
 ALTER TABLE qgep.od_individual_surface ADD CONSTRAINT fkey_vl_individual_surface_function FOREIGN KEY (function)
 REFERENCES qgep.vl_individual_surface_function (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_individual_surface_yyy_befestigung
(
code integer NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_individual_surface_yyy_Befestigung_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_individual_surface_yyy_befestigung (code, value_en, value_de, value_fr) VALUES (2978,'other','andere','autres');
 INSERT INTO qgep.vl_individual_surface_yyy_befestigung (code, value_en, value_de, value_fr) VALUES (2031,'','befestigt','impermeabilise');
 INSERT INTO qgep.vl_individual_surface_yyy_befestigung (code, value_en, value_de, value_fr) VALUES (2032,'','bestockt','boise');
 INSERT INTO qgep.vl_individual_surface_yyy_befestigung (code, value_en, value_de, value_fr) VALUES (2033,'','humusiert','couverture_vegetale');
 INSERT INTO qgep.vl_individual_surface_yyy_befestigung (code, value_en, value_de, value_fr) VALUES (3030,'unknown','unbekannt','inconnu');
 INSERT INTO qgep.vl_individual_surface_yyy_befestigung (code, value_en, value_de, value_fr) VALUES (2034,'','vegetationslos','sans_vegetation');
 ALTER TABLE qgep.od_individual_surface ADD CONSTRAINT fkey_vl_individual_surface_yyy_Befestigung FOREIGN KEY (yyy_Befestigung)
 REFERENCES qgep.vl_individual_surface_yyy_befestigung (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
COMMIT;
