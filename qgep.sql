BEGIN;
CREATE SCHEMA qgep;
-------
CREATE TABLE qgep.od_organisation
(
   obj_id  varchar(36) NOT NULL,
   CONSTRAINT pkey_qgep_od_organisation_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_organisation.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_organisation ADD COLUMN address  varchar(50) ;
COMMENT ON COLUMN qgep.od_organisation.address IS 'yyy / Attribut zur Verknüpfung der Adressdaten von Organisationen aus Fremdsystemen. Die VSA-DSS bildet keine Adressinformationen ab. Diese sind genügend oft in anderen Systemen vorhanden  eine Referenzattribut reicht. / Attribut pour le lien des données';
 ALTER TABLE qgep.od_organisation ADD COLUMN identifier  varchar(80) ;
 CREATE UNIQUE INDEX in_od_organisation_identifier ON qgep.od_organisation USING btree (identifier);
COMMENT ON COLUMN qgep.od_organisation.identifier IS 'It is suggested to use real names, e.g. Sample_Community and not only Community. Or "Waste Water Association WWTP Example"and not only Waste Water Association because there will be multiple objects / Es wird empfohlen reale Namen zu nehmen, z.B. Mustergem';
 ALTER TABLE qgep.od_organisation ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_organisation.remark IS 'yyy Fehler bei Zuordnung / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_organisation ADD COLUMN uid  varchar(12) ;
COMMENT ON COLUMN qgep.od_organisation.uid IS 'yyyReferenz zur Unternehmensidentifikation des Bundesamts fuer Statistik (www.uid.admin.ch), e.g. z.B. CHE123456789 / Referenz zur Unternehmensidentifikation des Bundesamts fuer Statistik (www.uid.admin.ch), z.B. CHE123456789 / Référence pour lidentifica';
 ALTER TABLE qgep.od_organisation ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_organisation.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_organisation ADD COLUMN datenherr varchar(50) ;
COMMENT ON COLUMN qgep.od_organisation.datenherr IS 'Metaattribute Datenherr - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Gestionnaire données gestionnaire de données, qui estla personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_organisation ADD COLUMN datenlieferant varchar(50) ;
COMMENT ON COLUMN qgep.od_organisation.datenlieferant IS 'Metaattribute Datenlieferant - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / xxx_Datenlieferant ';
-------
CREATE TABLE qgep.od_reach_point
(
   obj_id  varchar(36) NOT NULL,
   CONSTRAINT pkey_qgep_od_reach_point_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_reach_point.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_reach_point ADD COLUMN elevation_accuracy integer ;
COMMENT ON COLUMN qgep.od_reach_point.elevation_accuracy IS 'yyy_Quantifizierung der Genauigkeit der Höhenlage der Kote in Relation zum Höhenfixpunktnetz (z.B. Grundbuchvermessung oder Landesnivellement). / Quantifizierung der Genauigkeit der Höhenlage der Kote in Relation zum Höhenfixpunktnetz (z.B. Grundbuchverme';
 ALTER TABLE qgep.od_reach_point ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_reach_point_identifier ON qgep.od_reach_point USING btree (identifier);
COMMENT ON COLUMN qgep.od_reach_point.identifier IS ' /  / ';
 ALTER TABLE qgep.od_reach_point ADD COLUMN level  decimal(4,3) ;
COMMENT ON COLUMN qgep.od_reach_point.level IS 'yyy / Sohlenhöhe des Haltungsendes / Cote du radier de la fin du tronçon';
 ALTER TABLE qgep.od_reach_point ADD COLUMN outlet_shape  integer ;
COMMENT ON COLUMN qgep.od_reach_point.outlet_shape IS 'yyy Art des Auslaufs / Art des Auslaufs / Types de sortie';
 ALTER TABLE qgep.od_reach_point ADD COLUMN position_of_connection  smallint ;
COMMENT ON COLUMN qgep.od_reach_point.position_of_connection IS 'yyy / Anschlussstelle bezogen auf Querschnitt im Kanal; in Fliessrichtung  (für Haus- und Strassenanschlüsse) / Emplacement de raccordement Référence à la section transversale dans le canal dans le sens découlement (pour les raccordements domestiques et ';
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
CREATE TABLE qgep.od_structure_part
(
   obj_id  varchar(36) NOT NULL,
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
 ALTER TABLE qgep.od_structure_part ADD COLUMN renovation_demand  varchar(50) ;
COMMENT ON COLUMN qgep.od_structure_part.renovation_demand IS ' e';
 ALTER TABLE qgep.od_structure_part ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_structure_part.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_structure_part ADD COLUMN datenherr varchar(50) ;
COMMENT ON COLUMN qgep.od_structure_part.datenherr IS 'Metaattribute Datenherr - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Gestionnaire données gestionnaire de données, qui estla personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_structure_part ADD COLUMN datenlieferant varchar(50) ;
COMMENT ON COLUMN qgep.od_structure_part.datenlieferant IS 'Metaattribute Datenlieferant - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / xxx_Datenlieferant ';
-------
CREATE TABLE qgep.od_wastewater_networkelement
(
   obj_id  varchar(36) NOT NULL,
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
CREATE TABLE qgep.od_pipe_profile
(
   obj_id  varchar(36) NOT NULL,
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
 ALTER TABLE qgep.od_pipe_profile ADD COLUMN profile_type  varchar(50) ;
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
CREATE TABLE qgep.od_wastewater_structure
(
   obj_id  varchar(36) NOT NULL,
   CONSTRAINT pkey_qgep_od_wastewater_structure_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_wastewater_structure.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_wastewater_structure ADD COLUMN accessibility  varchar(50) ;
COMMENT ON COLUMN qgep.od_wastewater_structure.accessibility IS ' t';
 ALTER TABLE qgep.od_wastewater_structure ADD COLUMN contract_section  varchar(50) ;
COMMENT ON COLUMN qgep.od_wastewater_structure.contract_section IS ' / Nummer des Bauloses / Numéro du lot de construction';
SELECT AddGeometryColumn('qgep', 'od_wastewater_structure', 'detail_geometry_geometry', 21781, 'POLYGON', 2);
COMMENT ON COLUMN qgep.od_wastewater_structure.detail_geometry_geometry IS ' / Detaillierte Geometrie insbesondere bei Spezialbauwerken. Bei Normschächten mit Dimension1 und 2 arbeiten. Dito bei normierten Versickerungsanlagen. In INTERLIS OPTIONAL gesetzt, da nicht bei allen Abwasserbauwerken zwingend. Kanäle haben normalerweise';
SELECT AddGeometryColumn('qgep', 'od_wastewater_structure', 'detail_geometry3d_geometry', 21781, 'POLYGON', 2);
COMMENT ON COLUMN qgep.od_wastewater_structure.detail_geometry3d_geometry IS 'yyy / Detaillierte Geometrie (3D) insbesondere bei Spezialbauwerken. Bei Normschächten mit Dimension1 und 2 arbeiten. Dito bei normierten Versickerungsanlagen. In INTERLIS / GEOMETRIE_DETAILLEE3D: Géométrie détaillée particulièrement pour un OUVRAGE_SPECI';
 ALTER TABLE qgep.od_wastewater_structure ADD COLUMN disposition_state  varchar(50) ;
COMMENT ON COLUMN qgep.od_wastewater_structure.disposition_state IS 'yyy / Betriebs- und Planungszustand in dem sich das Abwasserbauwerk befindet / Etat de fonctionnement et de planification';
 ALTER TABLE qgep.od_wastewater_structure ADD COLUMN gross_costs  decimal(8,2) ;
COMMENT ON COLUMN qgep.od_wastewater_structure.gross_costs IS ' / Brutto Erstellungskosten / Coûts bruts des travaux de construction.';
 ALTER TABLE qgep.od_wastewater_structure ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_wastewater_structure_identifier ON qgep.od_wastewater_structure USING btree (identifier);
COMMENT ON COLUMN qgep.od_wastewater_structure.identifier IS ' /  / ';
 ALTER TABLE qgep.od_wastewater_structure ADD COLUMN inspection_interval  decimal(2,2) ;
COMMENT ON COLUMN qgep.od_wastewater_structure.inspection_interval IS ' )';
 ALTER TABLE qgep.od_wastewater_structure ADD COLUMN location_name  varchar(50) ;
COMMENT ON COLUMN qgep.od_wastewater_structure.location_name IS ' e';
 ALTER TABLE qgep.od_wastewater_structure ADD COLUMN remark  varchar(80) ;
COMMENT ON COLUMN qgep.od_wastewater_structure.remark IS ' / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qgep.od_wastewater_structure ADD COLUMN renovation_demand  varchar(50) ;
COMMENT ON COLUMN qgep.od_wastewater_structure.renovation_demand IS ' / Dringlichkeitsstufen und Zeithorizont für bauliche Massnahmen / 	Degrés durgence et délai de réalisation des mesures constructives';
 ALTER TABLE qgep.od_wastewater_structure ADD COLUMN replacement_value  decimal(8,2) ;
COMMENT ON COLUMN qgep.od_wastewater_structure.replacement_value IS 'y.';
 ALTER TABLE qgep.od_wastewater_structure ADD COLUMN rv_base_year  smallint ;
COMMENT ON COLUMN qgep.od_wastewater_structure.rv_base_year IS ' / Basisjahr für die Kalkulation des Wiederbeschaffungswertes (siehe auch Wiederbeschaffungswert) / TO DO';
 ALTER TABLE qgep.od_wastewater_structure ADD COLUMN rv_construction_type  varchar(50) ;
COMMENT ON COLUMN qgep.od_wastewater_structure.rv_construction_type IS 'yyy / Grobe Einteilung der Bauart des Abwasserbauwerkes als Inputwert für die Berechnung des Wiederbeschaffungswertes. / Valeur de remplacement du type de construction';
 ALTER TABLE qgep.od_wastewater_structure ADD COLUMN structure_condition  varchar(50) ;
COMMENT ON COLUMN qgep.od_wastewater_structure.structure_condition IS ' a';
 ALTER TABLE qgep.od_wastewater_structure ADD COLUMN subsidies  decimal(8,2) ;
COMMENT ON COLUMN qgep.od_wastewater_structure.subsidies IS ' / Staats- und Bundesbeiträge / Contributions des cantons et de la confédération';
 ALTER TABLE qgep.od_wastewater_structure ADD COLUMN year_of_construction  smallint ;
COMMENT ON COLUMN qgep.od_wastewater_structure.year_of_construction IS ' / Jahr der Inbetriebsetzung (Schlussabnahme). Falls unbekannt = 1800 setzen (tiefster Wert des Wertebereiches) / Année de mise en service (réception finale).';
 ALTER TABLE qgep.od_wastewater_structure ADD COLUMN year_of_replacement  smallint ;
COMMENT ON COLUMN qgep.od_wastewater_structure.year_of_replacement IS ' e';
 ALTER TABLE qgep.od_wastewater_structure ADD COLUMN last_modification timestamp without time zone ;
COMMENT ON COLUMN qgep.od_wastewater_structure.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qgep.od_wastewater_structure ADD COLUMN datenherr varchar(50) ;
COMMENT ON COLUMN qgep.od_wastewater_structure.datenherr IS 'Metaattribute Datenherr - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Gestionnaire données gestionnaire de données, qui estla personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qgep.od_wastewater_structure ADD COLUMN datenlieferant varchar(50) ;
COMMENT ON COLUMN qgep.od_wastewater_structure.datenlieferant IS 'Metaattribute Datenlieferant - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / xxx_Datenlieferant ';
-------
CREATE TABLE qgep.od_benching
(
   obj_id  varchar(36) NOT NULL,
   CONSTRAINT pkey_qgep_od_benching_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_benching.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_benching ADD COLUMN type  varchar(50) ;
COMMENT ON COLUMN qgep.od_benching.type IS ' /  / ';
-------
CREATE TABLE qgep.od_dryweather_flume
(
   obj_id  varchar(36) NOT NULL,
   CONSTRAINT pkey_qgep_od_dryweather_flume_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_dryweather_flume.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_dryweather_flume ADD COLUMN material  varchar(50) ;
COMMENT ON COLUMN qgep.od_dryweather_flume.material IS ' / Material der Ausbildung oder Auskleidung der Trockenwetterrinne / Materiau de fabrication ou de revêtement de la cunette de débit temps sec';
-------
CREATE TABLE qgep.od_cover
(
   obj_id  varchar(36) NOT NULL,
   CONSTRAINT pkey_qgep_od_cover_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_cover.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_cover ADD COLUMN brand  varchar(50) ;
COMMENT ON COLUMN qgep.od_cover.brand IS ' n';
 ALTER TABLE qgep.od_cover ADD COLUMN cover_shape  varchar(50) ;
COMMENT ON COLUMN qgep.od_cover.cover_shape IS ' / Form des Deckels / Forme du couvercle';
 ALTER TABLE qgep.od_cover ADD COLUMN depth  smallint ;
COMMENT ON COLUMN qgep.od_cover.depth IS 'yyyredundantes Funktionsattribut Maechtigkeit. Numerisch [mm]. Funktion (berechneter Wert) = zugehöriger Deckel.Kote minus Abwasserknoten.Sohlenkote.(falls die Sohlenkote nicht separat erfasst, dann ist es die tiefer liegende Hal-tungspunkt.Kote) / redund';
 ALTER TABLE qgep.od_cover ADD COLUMN diameter  smallint ;
COMMENT ON COLUMN qgep.od_cover.diameter IS ' / Abmessung des Deckels (bei eckigen Deckeln minimale Abmessung) / Dimension du couvercle (dimension minimale pour couvercle anguleux)';
 ALTER TABLE qgep.od_cover ADD COLUMN fastening  varchar(50) ;
COMMENT ON COLUMN qgep.od_cover.fastening IS ' / Befestigungsart des Deckels / Genre de fixation du couvercle';
 ALTER TABLE qgep.od_cover ADD COLUMN level  decimal(4,3) ;
COMMENT ON COLUMN qgep.od_cover.level IS ' / Deckelhöhe / Cote du couvercle';
 ALTER TABLE qgep.od_cover ADD COLUMN location_accuracy  varchar(50) ;
COMMENT ON COLUMN qgep.od_cover.location_accuracy IS ' / Quantifizierung der Genauigkeit der Lage einer Koordinate. / Plage de précision des coordonnées planimétriques du couvercle.';
 ALTER TABLE qgep.od_cover ADD COLUMN material  varchar(50) ;
COMMENT ON COLUMN qgep.od_cover.material IS ' / Deckelmaterial / Matériau du couvercle';
SELECT AddGeometryColumn('qgep', 'od_cover', 'situation_geometry', 21781, 'POINT', 2);
COMMENT ON COLUMN qgep.od_cover.situation_geometry IS 'Situation of cover (cover hole) / Lage des Deckels (Pickelloch) / xxx_Situation du couvercle (Pickelloch)';
 ALTER TABLE qgep.od_cover ADD COLUMN sludge_bucket  varchar(50) ;
COMMENT ON COLUMN qgep.od_cover.sludge_bucket IS ' s';
 ALTER TABLE qgep.od_cover ADD COLUMN venting  varchar(50) ;
COMMENT ON COLUMN qgep.od_cover.venting IS ' n';
-------
CREATE TABLE qgep.od_access_aid
(
   obj_id  varchar(36) NOT NULL,
   CONSTRAINT pkey_qgep_od_access_aid_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_access_aid.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_access_aid ADD COLUMN type  varchar(50) ;
COMMENT ON COLUMN qgep.od_access_aid.type IS ' e';
-------
CREATE TABLE qgep.od_dryweather_downspout
(
   obj_id  varchar(36) NOT NULL,
   CONSTRAINT pkey_qgep_od_dryweather_downspout_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_dryweather_downspout.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_dryweather_downspout ADD COLUMN diameter  smallint ;
COMMENT ON COLUMN qgep.od_dryweather_downspout.diameter IS ' /  / ';
-------
CREATE TABLE qgep.od_channel
(
   obj_id  varchar(36) NOT NULL,
   CONSTRAINT pkey_qgep_od_channel_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_channel.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_channel ADD COLUMN bedding_encasement  varchar(50) ;
COMMENT ON COLUMN qgep.od_channel.bedding_encasement IS 'yyy / Art und Weise der unmittelbaren Rohrumgebung im Boden: Bettungsschicht (Unterlage der Leitung),  Verdämmung (seitliche Auffüllung), Schutzschicht / Lit de pose (assise de la conduite), bourrage latéral (remblai latéral), couche de protection';
 ALTER TABLE qgep.od_channel ADD COLUMN connection_type  varchar(50) ;
COMMENT ON COLUMN qgep.od_channel.connection_type IS 'Types of connection / Verbindungstypen / Types de raccordement';
 ALTER TABLE qgep.od_channel ADD COLUMN function_amelioration  varchar(50) ;
COMMENT ON COLUMN qgep.od_channel.function_amelioration IS ' / Zur Unterscheidung der Funktion einer Leitung bei Meliorationen (Entwässerungen), Modellerweiterung TG / ';
 ALTER TABLE qgep.od_channel ADD COLUMN function_hierarchic  varchar(50) ;
COMMENT ON COLUMN qgep.od_channel.function_hierarchic IS 'yn';
 ALTER TABLE qgep.od_channel ADD COLUMN function_hydraulic  varchar(50) ;
COMMENT ON COLUMN qgep.od_channel.function_hydraulic IS 'yyy / Art des Kanals hinsichtlich hydraulischer Ausführung (baulich) / Genre de canalisation par rapport à sa fonction hydraulique';
 ALTER TABLE qgep.od_channel ADD COLUMN jetting_interval  decimal(2,2) ;
COMMENT ON COLUMN qgep.od_channel.jetting_interval IS ' / Abstände in welchen der Kanal gespült werden sollte / Fréquence à laquelle une canalisation devrait subir un curage (années)';
 ALTER TABLE qgep.od_channel ADD COLUMN pipe_length  decimal(5,2) ;
COMMENT ON COLUMN qgep.od_channel.pipe_length IS ' / Baulänge der Einzelrohre oder Fugenabstände bei Ortsbetonkanälen / Longueur de chaque tuyau ou distance des joints pour les canalisations en béton coulé sur place';
 ALTER TABLE qgep.od_channel ADD COLUMN seepage  varchar(50) ;
COMMENT ON COLUMN qgep.od_channel.seepage IS 'yyy Beschreibung des oberliegenden Materials bei Saugern / Beschreibung des oberliegenden Materials bei Saugern / Description du matériau de remplissage';
 ALTER TABLE qgep.od_channel ADD COLUMN usage_current  varchar(50) ;
COMMENT ON COLUMN qgep.od_channel.usage_current IS ' / Für Primäre Abwasseranlagen gilt: heute zulässige Nutzung. Für Sekundäre Abwasseranlagen gilt: heute tatsächliche Nutzung. / Pour les ouvrages du réseau primaire: utilisation actuelle autorisée pour les ouvrages du réseau secondaire: utilisation actuel';
 ALTER TABLE qgep.od_channel ADD COLUMN usage_planned  varchar(50) ;
COMMENT ON COLUMN qgep.od_channel.usage_planned IS ' .';
-------
CREATE TABLE qgep.od_discharge_point
(
   obj_id  varchar(36) NOT NULL,
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
CREATE TABLE qgep.od_manhole
(
   obj_id  varchar(36) NOT NULL,
   CONSTRAINT pkey_qgep_od_manhole_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_manhole.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_manhole ADD COLUMN dimension1  smallint ;
COMMENT ON COLUMN qgep.od_manhole.dimension1 IS ' / Dimension1 des Schachtes (grösstes Innenmass). / Dimension1 de la chambre (plus grande mesure intérieure).';
 ALTER TABLE qgep.od_manhole ADD COLUMN dimension2  smallint ;
COMMENT ON COLUMN qgep.od_manhole.dimension2 IS ' / Dimension2 des Schachtes (kleinstes Innenmass). Bei runden Schächten wird Dimension2 leer gelassen, bei ovalen abgefüllt. Für eckige Schächte Detailgeometrie verwenden. / Dimension2 de la chambre (plus petite mesure intérieure).';
 ALTER TABLE qgep.od_manhole ADD COLUMN function  varchar(50) ;
COMMENT ON COLUMN qgep.od_manhole.function IS ' n';
 ALTER TABLE qgep.od_manhole ADD COLUMN material  varchar(50) ;
COMMENT ON COLUMN qgep.od_manhole.material IS ' .';
 ALTER TABLE qgep.od_manhole ADD COLUMN surface_inflow  varchar(50) ;
COMMENT ON COLUMN qgep.od_manhole.surface_inflow IS ' e';
-------
CREATE TABLE qgep.od_special_structure
(
   obj_id  varchar(36) NOT NULL,
   CONSTRAINT pkey_qgep_od_special_structure_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_special_structure.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_special_structure ADD COLUMN bypass  varchar(50) ;
COMMENT ON COLUMN qgep.od_special_structure.bypass IS ' / Bypass zur Umleitung des Wassers (z.B. während Unterhalt oder  im Havariefall) / Bypass pour détourner les eaux (par exemple durant des opérations de maintenance ou en cas davaries)';
 ALTER TABLE qgep.od_special_structure ADD COLUMN depth  smallint ;
COMMENT ON COLUMN qgep.od_special_structure.depth IS ' /  / ';
 ALTER TABLE qgep.od_special_structure ADD COLUMN function  varchar(50) ;
COMMENT ON COLUMN qgep.od_special_structure.function IS ' n';
 ALTER TABLE qgep.od_special_structure ADD COLUMN stormwatertank_arrangement  varchar(50) ;
COMMENT ON COLUMN qgep.od_special_structure.stormwatertank_arrangement IS ' N';
 ALTER TABLE qgep.od_special_structure ADD COLUMN upper_elevation  decimal(4,3) ;
COMMENT ON COLUMN qgep.od_special_structure.upper_elevation IS ' / Höchster Punkt des Bauwerks (Decke), aussen / Point le plus élevé de la construction';
-------
CREATE TABLE qgep.od_infiltration_installation
(
   obj_id  varchar(36) NOT NULL,
   CONSTRAINT pkey_qgep_od_infiltration_installation_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_infiltration_installation.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_infiltration_installation ADD COLUMN absorption_capacity  decimal(5,3) ;
COMMENT ON COLUMN qgep.od_infiltration_installation.absorption_capacity IS ' l';
 ALTER TABLE qgep.od_infiltration_installation ADD COLUMN defects  varchar(50) ;
COMMENT ON COLUMN qgep.od_infiltration_installation.defects IS ' .';
 ALTER TABLE qgep.od_infiltration_installation ADD COLUMN depth  smallint ;
COMMENT ON COLUMN qgep.od_infiltration_installation.depth IS 'yyy_Funktion (berechneter Wert) = repräsentative Abwasserknoten.Sohlenkote minus zugehörige Deckenkote des Bauwerks falls Detailgeometrie vorhanden, sonst Funktion (berechneter Wert) = Abwasserknoten.Sohlenkote minus zugehörige Deckel.Kote des Bauwerks / ';
 ALTER TABLE qgep.od_infiltration_installation ADD COLUMN dimension1  smallint ;
COMMENT ON COLUMN qgep.od_infiltration_installation.dimension1 IS ' / Dimension1 der Versickerungsanlage (grösstes Innenmass) bei der Verwendung von Normbauteilen. Sonst leer lassen und mit Detailgeometrie beschreiben. / Dimension1 de linstallation dinfiltration (plus grande mesure intérieure) lorsquelle est utilisée ';
 ALTER TABLE qgep.od_infiltration_installation ADD COLUMN dimension2  smallint ;
COMMENT ON COLUMN qgep.od_infiltration_installation.dimension2 IS ' / Dimension2 der Versickerungsanlage (kleinstes Innenmass) bei der Verwendung von Normbauteilen. Sonst leer lassen und mit Detailgeometrie beschreiben. / Dimension2 de la chambre (plus petite mesure intérieure). La dimension2 est à saisir pour des chambr';
 ALTER TABLE qgep.od_infiltration_installation ADD COLUMN distance_to_aquifer  decimal(5,2) ;
COMMENT ON COLUMN qgep.od_infiltration_installation.distance_to_aquifer IS ' .';
 ALTER TABLE qgep.od_infiltration_installation ADD COLUMN effective_area  decimal(6,2) ;
COMMENT ON COLUMN qgep.od_infiltration_installation.effective_area IS ' t';
 ALTER TABLE qgep.od_infiltration_installation ADD COLUMN emergency_spillway  varchar(50) ;
COMMENT ON COLUMN qgep.od_infiltration_installation.emergency_spillway IS ' .';
 ALTER TABLE qgep.od_infiltration_installation ADD COLUMN filling_material  varchar(50) ;
COMMENT ON COLUMN qgep.od_infiltration_installation.filling_material IS 'yyy / Beschreibung des oberliegenden Materials bei Sickerschlitzen. Diese werden nicht als Haltungen sondern als Versickerungsanlagen modelliert. Sickerschlitze mit Kies als Versickerungsanlage.Art = Kieskoerper abbilden, Sickerschlitze mit anderen Fuellm';
 ALTER TABLE qgep.od_infiltration_installation ADD COLUMN labeling  varchar(50) ;
COMMENT ON COLUMN qgep.od_infiltration_installation.labeling IS ' .';
 ALTER TABLE qgep.od_infiltration_installation ADD COLUMN seepage_utilization  varchar(50) ;
COMMENT ON COLUMN qgep.od_infiltration_installation.seepage_utilization IS ' .';
 ALTER TABLE qgep.od_infiltration_installation ADD COLUMN type  varchar(50) ;
COMMENT ON COLUMN qgep.od_infiltration_installation.type IS ' .';
 ALTER TABLE qgep.od_infiltration_installation ADD COLUMN upper_elevation  decimal(4,3) ;
COMMENT ON COLUMN qgep.od_infiltration_installation.upper_elevation IS ' / Höchster Punkt des Bauwerks (Decke), aussen / Point le plus élevé de la construction';
 ALTER TABLE qgep.od_infiltration_installation ADD COLUMN vehicle_access  varchar(50) ;
COMMENT ON COLUMN qgep.od_infiltration_installation.vehicle_access IS ' t';
 ALTER TABLE qgep.od_infiltration_installation ADD COLUMN watertightness  varchar(50) ;
COMMENT ON COLUMN qgep.od_infiltration_installation.watertightness IS ' / Wasserdichtheit gegen Oberflächenwasser.  Nur bei Anlagen mit Schächten. / Etanchéité contre des eaux superficielles. Uniquement pour des installations avec chambres.';
-------
CREATE TABLE qgep.od_reach
(
   obj_id  varchar(36) NOT NULL,
   CONSTRAINT pkey_qgep_od_reach_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_reach.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_reach ADD COLUMN clear_height  smallint ;
COMMENT ON COLUMN qgep.od_reach.clear_height IS 'yyy_Maximale Innenhöhe des Kanalprofiles / Maximale Innenhöhe des Kanalprofiles / Hauteur intérieure maximale du profil';
 ALTER TABLE qgep.od_reach ADD COLUMN coefficient_of_friction  smallint ;
COMMENT ON COLUMN qgep.od_reach.coefficient_of_friction IS 'yyy http://www.linguee.com/english-german/search?source=auto&query=reibungsbeiwert / Hydraulische Kenngrösse zur Beschreibung der Beschaffenheit der Kanalwandung. Beiwert für die Formeln nach Manning-Strickler (K oder kstr) / Constante de rugosité selon M';
 ALTER TABLE qgep.od_reach ADD COLUMN elevation_determination  varchar(50) ;
COMMENT ON COLUMN qgep.od_reach.elevation_determination IS ' .';
 ALTER TABLE qgep.od_reach ADD COLUMN horizontal_positioning  varchar(50) ;
COMMENT ON COLUMN qgep.od_reach.horizontal_positioning IS 'y.';
 ALTER TABLE qgep.od_reach ADD COLUMN inside_coating  varchar(50) ;
COMMENT ON COLUMN qgep.od_reach.inside_coating IS ' / Schutz der Innenwände des Kanals / Protection de la paroi intérieur de la canalisation';
 ALTER TABLE qgep.od_reach ADD COLUMN length_effective  decimal(5,2) ;
COMMENT ON COLUMN qgep.od_reach.length_effective IS ' / Tatsächliche Länge einer Haltung inklusive Kanalkrümmungen / Longueur effective (par ex. pour conduites incurvées)';
 ALTER TABLE qgep.od_reach ADD COLUMN material  varchar(50) ;
COMMENT ON COLUMN qgep.od_reach.material IS ' / Rohrmaterial / Matériau du tuyau.';
SELECT AddGeometryColumn('qgep', 'od_reach', 'progression_geometry', 21781, 'LINESTRING', 2);
COMMENT ON COLUMN qgep.od_reach.progression_geometry IS 'yyy_Reihenfolge von Punkten die den genauen Verlauf eines Kanals beschreiben, insbesondere dann, wenn keine direkte Verbindung zwischen zwei Schächten. / Reihenfolge von Punkten die den genauen Verlauf eines Kanals beschreiben, insbesondere dann, wenn kei';
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
   obj_id  varchar(36) NOT NULL,
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
COMMENT ON COLUMN qgep.od_wastewater_node.situation_geometry IS 'Situation of node. Decisive reference point for sewer network simulation /  Lage des Knotens, massgebender Bezugspunkt für die Kanalnetzberechnung / Situation du noeud. Point de référence déterminant pour le calcul de réseau de canalisations';
------------ Relationships and Value Tables ----------- 
CREATE TABLE qgep.vl_reach_point_elevation_accuracy
(
code serial NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_reach_point_elevation_accuracy_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_reach_point_elevation_accuracy (value_en) VALUES ('plusminus_1cm');
 INSERT INTO qgep.vl_reach_point_elevation_accuracy (value_de) VALUES ('plusminus_1cm');
 INSERT INTO qgep.vl_reach_point_elevation_accuracy (value_fr) VALUES ('plus_moins_1cm');
 INSERT INTO qgep.vl_reach_point_elevation_accuracy (value_en) VALUES ('plusminus_3cm');
 INSERT INTO qgep.vl_reach_point_elevation_accuracy (value_de) VALUES ('plusminus_3cm');
 INSERT INTO qgep.vl_reach_point_elevation_accuracy (value_fr) VALUES ('plus_moins_3cm');
 INSERT INTO qgep.vl_reach_point_elevation_accuracy (value_en) VALUES ('plusminus_6cm');
 INSERT INTO qgep.vl_reach_point_elevation_accuracy (value_de) VALUES ('plusminus_6cm');
 INSERT INTO qgep.vl_reach_point_elevation_accuracy (value_fr) VALUES ('plus_moins_6cm');
 INSERT INTO qgep.vl_reach_point_elevation_accuracy (value_en) VALUES ('more_than_6cm');
 INSERT INTO qgep.vl_reach_point_elevation_accuracy (value_de) VALUES ('groesser_6cm');
 INSERT INTO qgep.vl_reach_point_elevation_accuracy (value_fr) VALUES ('plusque_6cm');
 INSERT INTO qgep.vl_reach_point_elevation_accuracy (value_en) VALUES ('unknown');
 INSERT INTO qgep.vl_reach_point_elevation_accuracy (value_de) VALUES ('unbekannt');
 INSERT INTO qgep.vl_reach_point_elevation_accuracy (value_fr) VALUES ('inconnu');
 ALTER TABLE qgep.od_reach_point ADD CONSTRAINT fkey_vl_reach_point_elevation_accuracy FOREIGN KEY (elevation_accuracy)
 REFERENCES qgep.vl_reach_point_elevation_accuracy (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_reach_point_outlet_shape
(
code serial NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_reach_point_outlet_shape_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_reach_point_outlet_shape (value_en) VALUES ('round_edged');
 INSERT INTO qgep.vl_reach_point_outlet_shape (value_de) VALUES ('abgerundet');
 INSERT INTO qgep.vl_reach_point_outlet_shape (value_fr) VALUES ('arrondi');
 ALTER TABLE qgep.od_reach_point ADD CONSTRAINT fkey_vl_reach_point_outlet_shape FOREIGN KEY (outlet_shape)
 REFERENCES qgep.vl_reach_point_outlet_shape (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_reach_point_outlet_shape (value_en) VALUES ('sharp_edged');
 INSERT INTO qgep.vl_reach_point_outlet_shape (value_de) VALUES ('scharfkantig');
 INSERT INTO qgep.vl_reach_point_outlet_shape (value_fr) VALUES ('aretes_vives');
 ALTER TABLE qgep.od_reach_point ADD CONSTRAINT fkey_vl_reach_point_outlet_shape FOREIGN KEY (outlet_shape)
 REFERENCES qgep.vl_reach_point_outlet_shape (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_reach_point_outlet_shape (value_en) VALUES ('orifice');
 INSERT INTO qgep.vl_reach_point_outlet_shape (value_de) VALUES ('blendenfoermig');
 INSERT INTO qgep.vl_reach_point_outlet_shape (value_fr) VALUES ('en_forme_de_seuil_ou_diaphragme');
 ALTER TABLE qgep.od_reach_point ADD CONSTRAINT fkey_vl_reach_point_outlet_shape FOREIGN KEY (outlet_shape)
 REFERENCES qgep.vl_reach_point_outlet_shape (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_reach_point_outlet_shape (value_en) VALUES ('unknown');
 INSERT INTO qgep.vl_reach_point_outlet_shape (value_de) VALUES ('unbekannt');
 INSERT INTO qgep.vl_reach_point_outlet_shape (value_fr) VALUES ('inconnu');
 ALTER TABLE qgep.od_reach_point ADD CONSTRAINT fkey_vl_reach_point_outlet_shape FOREIGN KEY (outlet_shape)
 REFERENCES qgep.vl_reach_point_outlet_shape (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_reach_point_outlet_shape (value_en) VALUES ('no_cross_section_change');
 INSERT INTO qgep.vl_reach_point_outlet_shape (value_de) VALUES ('keine_Querschnittsaenderung');
 INSERT INTO qgep.vl_reach_point_outlet_shape (value_fr) VALUES ('pas_de_changement_de_section');
 ALTER TABLE qgep.od_reach_point ADD CONSTRAINT fkey_vl_reach_point_outlet_shape FOREIGN KEY (outlet_shape)
 REFERENCES qgep.vl_reach_point_outlet_shape (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_reach_point ADD CONSTRAINT rel22 FOREIGN KEY (qgep.fs_wastewater_networkelement) REFERENCES qgep.od_wastewater_networkelement(obj_id);
CREATE TABLE qgep.vl_structure_part_renovation_demand
(
code serial NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_structure_part_renovation_demand_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_structure_part_renovation_demand (value_en) VALUES ('necessary');
 INSERT INTO qgep.vl_structure_part_renovation_demand (value_de) VALUES ('notwendig');
 INSERT INTO qgep.vl_structure_part_renovation_demand (value_fr) VALUES ('necessaire');
 ALTER TABLE qgep.od_structure_part ADD CONSTRAINT fkey_vl_structure_part_renovation_demand FOREIGN KEY (renovation_demand)
 REFERENCES qgep.vl_structure_part_renovation_demand (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_structure_part_renovation_demand (value_en) VALUES ('not_necessary');
 INSERT INTO qgep.vl_structure_part_renovation_demand (value_de) VALUES ('nicht_notwendig');
 INSERT INTO qgep.vl_structure_part_renovation_demand (value_fr) VALUES ('pas_necessaire');
 ALTER TABLE qgep.od_structure_part ADD CONSTRAINT fkey_vl_structure_part_renovation_demand FOREIGN KEY (renovation_demand)
 REFERENCES qgep.vl_structure_part_renovation_demand (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_structure_part_renovation_demand (value_en) VALUES ('unknown');
 INSERT INTO qgep.vl_structure_part_renovation_demand (value_de) VALUES ('unbekannt');
 INSERT INTO qgep.vl_structure_part_renovation_demand (value_fr) VALUES ('inconnu');
 ALTER TABLE qgep.od_structure_part ADD CONSTRAINT fkey_vl_structure_part_renovation_demand FOREIGN KEY (renovation_demand)
 REFERENCES qgep.vl_structure_part_renovation_demand (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_structure_part ADD CONSTRAINT rel28 FOREIGN KEY (qgep.fs_wastewater_structure) REFERENCES qgep.od_wastewater_structure(obj_id);
ALTER TABLE qgep.od_wastewater_networkelement ADD CONSTRAINT rel31 FOREIGN KEY (qgep.fs_wastewater_structure) REFERENCES qgep.od_wastewater_structure(obj_id);
CREATE TABLE qgep.vl_pipe_profile_profile_type
(
code serial NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_pipe_profile_profile_type_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_pipe_profile_profile_type (value_en) VALUES ('circular_profile');
 INSERT INTO qgep.vl_pipe_profile_profile_type (value_de) VALUES ('Kreisprofil');
 INSERT INTO qgep.vl_pipe_profile_profile_type (value_fr) VALUES ('circulaire');
 ALTER TABLE qgep.od_pipe_profile ADD CONSTRAINT fkey_vl_pipe_profile_profile_type FOREIGN KEY (profile_type)
 REFERENCES qgep.vl_pipe_profile_profile_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_pipe_profile_profile_type (value_en) VALUES ('egg_profile');
 INSERT INTO qgep.vl_pipe_profile_profile_type (value_de) VALUES ('Eiprofil');
 INSERT INTO qgep.vl_pipe_profile_profile_type (value_fr) VALUES ('ovoide');
 ALTER TABLE qgep.od_pipe_profile ADD CONSTRAINT fkey_vl_pipe_profile_profile_type FOREIGN KEY (profile_type)
 REFERENCES qgep.vl_pipe_profile_profile_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_pipe_profile_profile_type (value_en) VALUES ('mouth_profile');
 INSERT INTO qgep.vl_pipe_profile_profile_type (value_de) VALUES ('Maulprofil');
 INSERT INTO qgep.vl_pipe_profile_profile_type (value_fr) VALUES ('profil_en_voute');
 ALTER TABLE qgep.od_pipe_profile ADD CONSTRAINT fkey_vl_pipe_profile_profile_type FOREIGN KEY (profile_type)
 REFERENCES qgep.vl_pipe_profile_profile_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_pipe_profile_profile_type (value_en) VALUES ('rectangular_profile');
 INSERT INTO qgep.vl_pipe_profile_profile_type (value_de) VALUES ('Rechteckprofil');
 INSERT INTO qgep.vl_pipe_profile_profile_type (value_fr) VALUES ('rectangulaire');
 ALTER TABLE qgep.od_pipe_profile ADD CONSTRAINT fkey_vl_pipe_profile_profile_type FOREIGN KEY (profile_type)
 REFERENCES qgep.vl_pipe_profile_profile_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_pipe_profile_profile_type (value_en) VALUES ('open_profile');
 INSERT INTO qgep.vl_pipe_profile_profile_type (value_de) VALUES ('offenes_Profil');
 INSERT INTO qgep.vl_pipe_profile_profile_type (value_fr) VALUES ('profil_ouvert');
 ALTER TABLE qgep.od_pipe_profile ADD CONSTRAINT fkey_vl_pipe_profile_profile_type FOREIGN KEY (profile_type)
 REFERENCES qgep.vl_pipe_profile_profile_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_pipe_profile_profile_type (value_en) VALUES ('special_profile');
 INSERT INTO qgep.vl_pipe_profile_profile_type (value_de) VALUES ('Spezialprofil');
 INSERT INTO qgep.vl_pipe_profile_profile_type (value_fr) VALUES ('profil_special');
 ALTER TABLE qgep.od_pipe_profile ADD CONSTRAINT fkey_vl_pipe_profile_profile_type FOREIGN KEY (profile_type)
 REFERENCES qgep.vl_pipe_profile_profile_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_pipe_profile_profile_type (value_en) VALUES ('other');
 INSERT INTO qgep.vl_pipe_profile_profile_type (value_de) VALUES ('andere');
 INSERT INTO qgep.vl_pipe_profile_profile_type (value_fr) VALUES ('autres');
 ALTER TABLE qgep.od_pipe_profile ADD CONSTRAINT fkey_vl_pipe_profile_profile_type FOREIGN KEY (profile_type)
 REFERENCES qgep.vl_pipe_profile_profile_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_pipe_profile_profile_type (value_en) VALUES ('unknown');
 INSERT INTO qgep.vl_pipe_profile_profile_type (value_de) VALUES ('unbekannt');
 INSERT INTO qgep.vl_pipe_profile_profile_type (value_fr) VALUES ('inconnu');
 ALTER TABLE qgep.od_pipe_profile ADD CONSTRAINT fkey_vl_pipe_profile_profile_type FOREIGN KEY (profile_type)
 REFERENCES qgep.vl_pipe_profile_profile_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_wastewater_structure_accessibility
(
code serial NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_wastewater_structure_accessibility_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_wastewater_structure_accessibility (value_en) VALUES ('covered');
 INSERT INTO qgep.vl_wastewater_structure_accessibility (value_de) VALUES ('ueberdeckt');
 INSERT INTO qgep.vl_wastewater_structure_accessibility (value_fr) VALUES ('couvert');
 ALTER TABLE qgep.od_wastewater_structure ADD CONSTRAINT fkey_vl_wastewater_structure_accessibility FOREIGN KEY (accessibility)
 REFERENCES qgep.vl_wastewater_structure_accessibility (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_wastewater_structure_accessibility (value_en) VALUES ('accessible');
 INSERT INTO qgep.vl_wastewater_structure_accessibility (value_de) VALUES ('zugaenglich');
 INSERT INTO qgep.vl_wastewater_structure_accessibility (value_fr) VALUES ('accessible');
 ALTER TABLE qgep.od_wastewater_structure ADD CONSTRAINT fkey_vl_wastewater_structure_accessibility FOREIGN KEY (accessibility)
 REFERENCES qgep.vl_wastewater_structure_accessibility (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_wastewater_structure_accessibility (value_en) VALUES ('inaccessible');
 INSERT INTO qgep.vl_wastewater_structure_accessibility (value_de) VALUES ('unzugaenglich');
 INSERT INTO qgep.vl_wastewater_structure_accessibility (value_fr) VALUES ('inaccessible');
 ALTER TABLE qgep.od_wastewater_structure ADD CONSTRAINT fkey_vl_wastewater_structure_accessibility FOREIGN KEY (accessibility)
 REFERENCES qgep.vl_wastewater_structure_accessibility (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_wastewater_structure_accessibility (value_en) VALUES ('unknown');
 INSERT INTO qgep.vl_wastewater_structure_accessibility (value_de) VALUES ('unbekannt');
 INSERT INTO qgep.vl_wastewater_structure_accessibility (value_fr) VALUES ('inconnu');
 ALTER TABLE qgep.od_wastewater_structure ADD CONSTRAINT fkey_vl_wastewater_structure_accessibility FOREIGN KEY (accessibility)
 REFERENCES qgep.vl_wastewater_structure_accessibility (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_wastewater_structure_disposition_state
(
code serial NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_wastewater_structure_disposition_state_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_wastewater_structure_disposition_state (value_en) VALUES ('tentative');
 INSERT INTO qgep.vl_wastewater_structure_disposition_state (value_de) VALUES ('provisorisch');
 INSERT INTO qgep.vl_wastewater_structure_disposition_state (value_fr) VALUES ('provisoire');
 ALTER TABLE qgep.od_wastewater_structure ADD CONSTRAINT fkey_vl_wastewater_structure_disposition_state FOREIGN KEY (disposition_state)
 REFERENCES qgep.vl_wastewater_structure_disposition_state (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_wastewater_structure_disposition_state (value_en) VALUES ('will_be_suspended');
 INSERT INTO qgep.vl_wastewater_structure_disposition_state (value_de) VALUES ('wird_aufgehoben');
 INSERT INTO qgep.vl_wastewater_structure_disposition_state (value_fr) VALUES ('sera_supprime');
 ALTER TABLE qgep.od_wastewater_structure ADD CONSTRAINT fkey_vl_wastewater_structure_disposition_state FOREIGN KEY (disposition_state)
 REFERENCES qgep.vl_wastewater_structure_disposition_state (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_wastewater_structure_disposition_state (value_en) VALUES ('calculation_alternative');
 INSERT INTO qgep.vl_wastewater_structure_disposition_state (value_de) VALUES ('Berechnungsvariante');
 INSERT INTO qgep.vl_wastewater_structure_disposition_state (value_fr) VALUES ('variante_de_calcul');
 ALTER TABLE qgep.od_wastewater_structure ADD CONSTRAINT fkey_vl_wastewater_structure_disposition_state FOREIGN KEY (disposition_state)
 REFERENCES qgep.vl_wastewater_structure_disposition_state (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_wastewater_structure_disposition_state (value_en) VALUES ('planned');
 INSERT INTO qgep.vl_wastewater_structure_disposition_state (value_de) VALUES ('geplant');
 INSERT INTO qgep.vl_wastewater_structure_disposition_state (value_fr) VALUES ('planifie');
 ALTER TABLE qgep.od_wastewater_structure ADD CONSTRAINT fkey_vl_wastewater_structure_disposition_state FOREIGN KEY (disposition_state)
 REFERENCES qgep.vl_wastewater_structure_disposition_state (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_wastewater_structure_disposition_state (value_en) VALUES ('unknown');
 INSERT INTO qgep.vl_wastewater_structure_disposition_state (value_de) VALUES ('unbekannt');
 INSERT INTO qgep.vl_wastewater_structure_disposition_state (value_fr) VALUES ('inconnu');
 ALTER TABLE qgep.od_wastewater_structure ADD CONSTRAINT fkey_vl_wastewater_structure_disposition_state FOREIGN KEY (disposition_state)
 REFERENCES qgep.vl_wastewater_structure_disposition_state (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_wastewater_structure_disposition_state (value_en) VALUES ('suspended_unknown');
 INSERT INTO qgep.vl_wastewater_structure_disposition_state (value_de) VALUES ('aufgehoben_unbekannt');
 INSERT INTO qgep.vl_wastewater_structure_disposition_state (value_fr) VALUES ('supprime_inconnu');
 ALTER TABLE qgep.od_wastewater_structure ADD CONSTRAINT fkey_vl_wastewater_structure_disposition_state FOREIGN KEY (disposition_state)
 REFERENCES qgep.vl_wastewater_structure_disposition_state (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_wastewater_structure_disposition_state (value_en) VALUES ('nonoperational');
 INSERT INTO qgep.vl_wastewater_structure_disposition_state (value_de) VALUES ('ausser_Betrieb');
 INSERT INTO qgep.vl_wastewater_structure_disposition_state (value_fr) VALUES ('hors_service');
 ALTER TABLE qgep.od_wastewater_structure ADD CONSTRAINT fkey_vl_wastewater_structure_disposition_state FOREIGN KEY (disposition_state)
 REFERENCES qgep.vl_wastewater_structure_disposition_state (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_wastewater_structure_disposition_state (value_en) VALUES ('operational');
 INSERT INTO qgep.vl_wastewater_structure_disposition_state (value_de) VALUES ('in_Betrieb');
 INSERT INTO qgep.vl_wastewater_structure_disposition_state (value_fr) VALUES ('en_service');
 ALTER TABLE qgep.od_wastewater_structure ADD CONSTRAINT fkey_vl_wastewater_structure_disposition_state FOREIGN KEY (disposition_state)
 REFERENCES qgep.vl_wastewater_structure_disposition_state (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_wastewater_structure_disposition_state (value_en) VALUES ('project');
 INSERT INTO qgep.vl_wastewater_structure_disposition_state (value_de) VALUES ('Projekt');
 INSERT INTO qgep.vl_wastewater_structure_disposition_state (value_fr) VALUES ('projet');
 ALTER TABLE qgep.od_wastewater_structure ADD CONSTRAINT fkey_vl_wastewater_structure_disposition_state FOREIGN KEY (disposition_state)
 REFERENCES qgep.vl_wastewater_structure_disposition_state (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_wastewater_structure_disposition_state (value_en) VALUES ('suspended_not_filled');
 INSERT INTO qgep.vl_wastewater_structure_disposition_state (value_de) VALUES ('aufgehoben_nicht_verfuellt');
 INSERT INTO qgep.vl_wastewater_structure_disposition_state (value_fr) VALUES ('supprime_non_demoli');
 ALTER TABLE qgep.od_wastewater_structure ADD CONSTRAINT fkey_vl_wastewater_structure_disposition_state FOREIGN KEY (disposition_state)
 REFERENCES qgep.vl_wastewater_structure_disposition_state (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_wastewater_structure_disposition_state (value_en) VALUES ('filled');
 INSERT INTO qgep.vl_wastewater_structure_disposition_state (value_de) VALUES ('verfuellt');
 INSERT INTO qgep.vl_wastewater_structure_disposition_state (value_fr) VALUES ('demoli');
 ALTER TABLE qgep.od_wastewater_structure ADD CONSTRAINT fkey_vl_wastewater_structure_disposition_state FOREIGN KEY (disposition_state)
 REFERENCES qgep.vl_wastewater_structure_disposition_state (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_wastewater_structure_renovation_demand
(
code serial NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_wastewater_structure_renovation_demand_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_wastewater_structure_renovation_demand (value_en) VALUES ('urgent');
 INSERT INTO qgep.vl_wastewater_structure_renovation_demand (value_de) VALUES ('dringend');
 INSERT INTO qgep.vl_wastewater_structure_renovation_demand (value_fr) VALUES ('urgent');
 ALTER TABLE qgep.od_wastewater_structure ADD CONSTRAINT fkey_vl_wastewater_structure_renovation_demand FOREIGN KEY (renovation_demand)
 REFERENCES qgep.vl_wastewater_structure_renovation_demand (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_wastewater_structure_renovation_demand (value_en) VALUES ('short_term');
 INSERT INTO qgep.vl_wastewater_structure_renovation_demand (value_de) VALUES ('kurzfristig');
 INSERT INTO qgep.vl_wastewater_structure_renovation_demand (value_fr) VALUES ('a_court_terme');
 ALTER TABLE qgep.od_wastewater_structure ADD CONSTRAINT fkey_vl_wastewater_structure_renovation_demand FOREIGN KEY (renovation_demand)
 REFERENCES qgep.vl_wastewater_structure_renovation_demand (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_wastewater_structure_renovation_demand (value_en) VALUES ('medium_term');
 INSERT INTO qgep.vl_wastewater_structure_renovation_demand (value_de) VALUES ('mittelfristig');
 INSERT INTO qgep.vl_wastewater_structure_renovation_demand (value_fr) VALUES ('a_moyen_terme');
 ALTER TABLE qgep.od_wastewater_structure ADD CONSTRAINT fkey_vl_wastewater_structure_renovation_demand FOREIGN KEY (renovation_demand)
 REFERENCES qgep.vl_wastewater_structure_renovation_demand (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_wastewater_structure_renovation_demand (value_en) VALUES ('unknown');
 INSERT INTO qgep.vl_wastewater_structure_renovation_demand (value_de) VALUES ('unbekannt');
 INSERT INTO qgep.vl_wastewater_structure_renovation_demand (value_fr) VALUES ('inconnu');
 ALTER TABLE qgep.od_wastewater_structure ADD CONSTRAINT fkey_vl_wastewater_structure_renovation_demand FOREIGN KEY (renovation_demand)
 REFERENCES qgep.vl_wastewater_structure_renovation_demand (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_wastewater_structure_renovation_demand (value_en) VALUES ('long_term');
 INSERT INTO qgep.vl_wastewater_structure_renovation_demand (value_de) VALUES ('langfristig');
 INSERT INTO qgep.vl_wastewater_structure_renovation_demand (value_fr) VALUES ('a_long_terme');
 ALTER TABLE qgep.od_wastewater_structure ADD CONSTRAINT fkey_vl_wastewater_structure_renovation_demand FOREIGN KEY (renovation_demand)
 REFERENCES qgep.vl_wastewater_structure_renovation_demand (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_wastewater_structure_renovation_demand (value_en) VALUES ('no');
 INSERT INTO qgep.vl_wastewater_structure_renovation_demand (value_de) VALUES ('keiner');
 INSERT INTO qgep.vl_wastewater_structure_renovation_demand (value_fr) VALUES ('aucun');
 ALTER TABLE qgep.od_wastewater_structure ADD CONSTRAINT fkey_vl_wastewater_structure_renovation_demand FOREIGN KEY (renovation_demand)
 REFERENCES qgep.vl_wastewater_structure_renovation_demand (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_wastewater_structure_structure_condition
(
code serial NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_wastewater_structure_structure_condition_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_wastewater_structure_structure_condition (value_en) VALUES ('unknown');
 INSERT INTO qgep.vl_wastewater_structure_structure_condition (value_de) VALUES ('unbekannt');
 INSERT INTO qgep.vl_wastewater_structure_structure_condition (value_fr) VALUES ('inconnu');
 ALTER TABLE qgep.od_wastewater_structure ADD CONSTRAINT fkey_vl_wastewater_structure_structure_condition FOREIGN KEY (structure_condition)
 REFERENCES qgep.vl_wastewater_structure_structure_condition (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_wastewater_structure_structure_condition (value_en) VALUES ('Z1');
 INSERT INTO qgep.vl_wastewater_structure_structure_condition (value_de) VALUES ('Z1');
 INSERT INTO qgep.vl_wastewater_structure_structure_condition (value_fr) VALUES ('Z1');
 ALTER TABLE qgep.od_wastewater_structure ADD CONSTRAINT fkey_vl_wastewater_structure_structure_condition FOREIGN KEY (structure_condition)
 REFERENCES qgep.vl_wastewater_structure_structure_condition (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_wastewater_structure_structure_condition (value_en) VALUES ('Z2');
 INSERT INTO qgep.vl_wastewater_structure_structure_condition (value_de) VALUES ('Z2');
 INSERT INTO qgep.vl_wastewater_structure_structure_condition (value_fr) VALUES ('Z2');
 ALTER TABLE qgep.od_wastewater_structure ADD CONSTRAINT fkey_vl_wastewater_structure_structure_condition FOREIGN KEY (structure_condition)
 REFERENCES qgep.vl_wastewater_structure_structure_condition (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_wastewater_structure_structure_condition (value_en) VALUES ('Z3');
 INSERT INTO qgep.vl_wastewater_structure_structure_condition (value_de) VALUES ('Z3');
 INSERT INTO qgep.vl_wastewater_structure_structure_condition (value_fr) VALUES ('Z3');
 ALTER TABLE qgep.od_wastewater_structure ADD CONSTRAINT fkey_vl_wastewater_structure_structure_condition FOREIGN KEY (structure_condition)
 REFERENCES qgep.vl_wastewater_structure_structure_condition (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_wastewater_structure_structure_condition (value_en) VALUES ('Z4');
 INSERT INTO qgep.vl_wastewater_structure_structure_condition (value_de) VALUES ('Z4');
 INSERT INTO qgep.vl_wastewater_structure_structure_condition (value_fr) VALUES ('Z4');
 ALTER TABLE qgep.od_wastewater_structure ADD CONSTRAINT fkey_vl_wastewater_structure_structure_condition FOREIGN KEY (structure_condition)
 REFERENCES qgep.vl_wastewater_structure_structure_condition (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_wastewater_structure_structure_condition (value_en) VALUES ('Z0');
 INSERT INTO qgep.vl_wastewater_structure_structure_condition (value_de) VALUES ('Z0');
 INSERT INTO qgep.vl_wastewater_structure_structure_condition (value_fr) VALUES ('Z0');
 ALTER TABLE qgep.od_wastewater_structure ADD CONSTRAINT fkey_vl_wastewater_structure_structure_condition FOREIGN KEY (structure_condition)
 REFERENCES qgep.vl_wastewater_structure_structure_condition (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_wastewater_structure ADD CONSTRAINT rel55 FOREIGN KEY (qgep.fs_owner) REFERENCES qgep.od_organisation(obj_id);
ALTER TABLE qgep.od_wastewater_structure ADD CONSTRAINT rel56 FOREIGN KEY (qgep.fs_operator) REFERENCES qgep.od_organisation(obj_id);
ALTER TABLE qgep.od_benching ADD CONSTRAINT oorel57 FOREIGN KEY (obj_id) REFERENCES qgep.od_structure_part(obj_id);
CREATE TABLE qgep.vl_benching_type
(
code serial NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_benching_type_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_benching_type (value_en) VALUES ('unknown');
 INSERT INTO qgep.vl_benching_type (value_de) VALUES ('unbekannt');
 INSERT INTO qgep.vl_benching_type (value_fr) VALUES ('inconnu');
 ALTER TABLE qgep.od_benching ADD CONSTRAINT fkey_vl_benching_type FOREIGN KEY (type)
 REFERENCES qgep.vl_benching_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_benching_type (value_en) VALUES ('other');
 INSERT INTO qgep.vl_benching_type (value_de) VALUES ('andere');
 INSERT INTO qgep.vl_benching_type (value_fr) VALUES ('autres');
 ALTER TABLE qgep.od_benching ADD CONSTRAINT fkey_vl_benching_type FOREIGN KEY (type)
 REFERENCES qgep.vl_benching_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_benching_type (value_en) VALUES ('no');
 INSERT INTO qgep.vl_benching_type (value_de) VALUES ('kein');
 INSERT INTO qgep.vl_benching_type (value_fr) VALUES ('aucun');
 ALTER TABLE qgep.od_benching ADD CONSTRAINT fkey_vl_benching_type FOREIGN KEY (type)
 REFERENCES qgep.vl_benching_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_benching_type (value_en) VALUES ('onesided');
 INSERT INTO qgep.vl_benching_type (value_de) VALUES ('einseitig');
 INSERT INTO qgep.vl_benching_type (value_fr) VALUES ('simple');
 ALTER TABLE qgep.od_benching ADD CONSTRAINT fkey_vl_benching_type FOREIGN KEY (type)
 REFERENCES qgep.vl_benching_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_benching_type (value_en) VALUES ('double_sided');
 INSERT INTO qgep.vl_benching_type (value_de) VALUES ('beidseitig');
 INSERT INTO qgep.vl_benching_type (value_fr) VALUES ('double');
 ALTER TABLE qgep.od_benching ADD CONSTRAINT fkey_vl_benching_type FOREIGN KEY (type)
 REFERENCES qgep.vl_benching_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_dryweather_flume ADD CONSTRAINT oorel60 FOREIGN KEY (obj_id) REFERENCES qgep.od_structure_part(obj_id);
CREATE TABLE qgep.vl_dryweather_flume_material
(
code serial NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_dryweather_flume_material_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_dryweather_flume_material (value_en) VALUES ('cement_mortar');
 INSERT INTO qgep.vl_dryweather_flume_material (value_de) VALUES ('Zementmoertel');
 INSERT INTO qgep.vl_dryweather_flume_material (value_fr) VALUES ('mortier_de_ciment');
 ALTER TABLE qgep.od_dryweather_flume ADD CONSTRAINT fkey_vl_dryweather_flume_material FOREIGN KEY (material)
 REFERENCES qgep.vl_dryweather_flume_material (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_dryweather_flume_material (value_en) VALUES ('stoneware');
 INSERT INTO qgep.vl_dryweather_flume_material (value_de) VALUES ('Steinzeug');
 INSERT INTO qgep.vl_dryweather_flume_material (value_fr) VALUES ('gres');
 ALTER TABLE qgep.od_dryweather_flume ADD CONSTRAINT fkey_vl_dryweather_flume_material FOREIGN KEY (material)
 REFERENCES qgep.vl_dryweather_flume_material (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_dryweather_flume_material (value_en) VALUES ('plastic');
 INSERT INTO qgep.vl_dryweather_flume_material (value_de) VALUES ('Kunststoff');
 INSERT INTO qgep.vl_dryweather_flume_material (value_fr) VALUES ('plastique');
 ALTER TABLE qgep.od_dryweather_flume ADD CONSTRAINT fkey_vl_dryweather_flume_material FOREIGN KEY (material)
 REFERENCES qgep.vl_dryweather_flume_material (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_dryweather_flume_material (value_en) VALUES ('unknown');
 INSERT INTO qgep.vl_dryweather_flume_material (value_de) VALUES ('unbekannt');
 INSERT INTO qgep.vl_dryweather_flume_material (value_fr) VALUES ('inconnu');
 ALTER TABLE qgep.od_dryweather_flume ADD CONSTRAINT fkey_vl_dryweather_flume_material FOREIGN KEY (material)
 REFERENCES qgep.vl_dryweather_flume_material (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_dryweather_flume_material (value_en) VALUES ('other');
 INSERT INTO qgep.vl_dryweather_flume_material (value_de) VALUES ('andere');
 INSERT INTO qgep.vl_dryweather_flume_material (value_fr) VALUES ('autres');
 ALTER TABLE qgep.od_dryweather_flume ADD CONSTRAINT fkey_vl_dryweather_flume_material FOREIGN KEY (material)
 REFERENCES qgep.vl_dryweather_flume_material (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_dryweather_flume_material (value_en) VALUES ('combined');
 INSERT INTO qgep.vl_dryweather_flume_material (value_de) VALUES ('kombiniert');
 INSERT INTO qgep.vl_dryweather_flume_material (value_fr) VALUES ('combine');
 ALTER TABLE qgep.od_dryweather_flume ADD CONSTRAINT fkey_vl_dryweather_flume_material FOREIGN KEY (material)
 REFERENCES qgep.vl_dryweather_flume_material (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_cover ADD CONSTRAINT oorel63 FOREIGN KEY (obj_id) REFERENCES qgep.od_structure_part(obj_id);
CREATE TABLE qgep.vl_cover_cover_shape
(
code serial NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_cover_cover_shape_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_cover_cover_shape (value_en) VALUES ('round');
 INSERT INTO qgep.vl_cover_cover_shape (value_de) VALUES ('rund');
 INSERT INTO qgep.vl_cover_cover_shape (value_fr) VALUES ('rond');
 ALTER TABLE qgep.od_cover ADD CONSTRAINT fkey_vl_cover_cover_shape FOREIGN KEY (cover_shape)
 REFERENCES qgep.vl_cover_cover_shape (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_cover_cover_shape (value_en) VALUES ('rectangular');
 INSERT INTO qgep.vl_cover_cover_shape (value_de) VALUES ('eckig');
 INSERT INTO qgep.vl_cover_cover_shape (value_fr) VALUES ('anguleux');
 ALTER TABLE qgep.od_cover ADD CONSTRAINT fkey_vl_cover_cover_shape FOREIGN KEY (cover_shape)
 REFERENCES qgep.vl_cover_cover_shape (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_cover_cover_shape (value_en) VALUES ('other');
 INSERT INTO qgep.vl_cover_cover_shape (value_de) VALUES ('andere');
 INSERT INTO qgep.vl_cover_cover_shape (value_fr) VALUES ('autres');
 ALTER TABLE qgep.od_cover ADD CONSTRAINT fkey_vl_cover_cover_shape FOREIGN KEY (cover_shape)
 REFERENCES qgep.vl_cover_cover_shape (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_cover_cover_shape (value_en) VALUES ('unknown');
 INSERT INTO qgep.vl_cover_cover_shape (value_de) VALUES ('unbekannt');
 INSERT INTO qgep.vl_cover_cover_shape (value_fr) VALUES ('inconnu');
 ALTER TABLE qgep.od_cover ADD CONSTRAINT fkey_vl_cover_cover_shape FOREIGN KEY (cover_shape)
 REFERENCES qgep.vl_cover_cover_shape (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_cover_fastening
(
code serial NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_cover_fastening_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_cover_fastening (value_en) VALUES ('bolted');
 INSERT INTO qgep.vl_cover_fastening (value_de) VALUES ('verschraubt');
 INSERT INTO qgep.vl_cover_fastening (value_fr) VALUES ('visse');
 ALTER TABLE qgep.od_cover ADD CONSTRAINT fkey_vl_cover_fastening FOREIGN KEY (fastening)
 REFERENCES qgep.vl_cover_fastening (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_cover_fastening (value_en) VALUES ('not_bolted');
 INSERT INTO qgep.vl_cover_fastening (value_de) VALUES ('nicht_verschraubt');
 INSERT INTO qgep.vl_cover_fastening (value_fr) VALUES ('non_visse');
 ALTER TABLE qgep.od_cover ADD CONSTRAINT fkey_vl_cover_fastening FOREIGN KEY (fastening)
 REFERENCES qgep.vl_cover_fastening (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_cover_fastening (value_en) VALUES ('unknown');
 INSERT INTO qgep.vl_cover_fastening (value_de) VALUES ('unbekannt');
 INSERT INTO qgep.vl_cover_fastening (value_fr) VALUES ('inconnu');
 ALTER TABLE qgep.od_cover ADD CONSTRAINT fkey_vl_cover_fastening FOREIGN KEY (fastening)
 REFERENCES qgep.vl_cover_fastening (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_cover_location_accuracy
(
code serial NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_cover_location_accuracy_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_cover_location_accuracy (value_en) VALUES ('plusminus_3cm');
 INSERT INTO qgep.vl_cover_location_accuracy (value_de) VALUES ('plusminus_3cm');
 INSERT INTO qgep.vl_cover_location_accuracy (value_fr) VALUES ('plus_moins_3cm');
 ALTER TABLE qgep.od_cover ADD CONSTRAINT fkey_vl_cover_location_accuracy FOREIGN KEY (location_accuracy)
 REFERENCES qgep.vl_cover_location_accuracy (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_cover_location_accuracy (value_en) VALUES ('plusminus_10cm');
 INSERT INTO qgep.vl_cover_location_accuracy (value_de) VALUES ('plusminus_10cm');
 INSERT INTO qgep.vl_cover_location_accuracy (value_fr) VALUES ('plus_moins_10cm');
 ALTER TABLE qgep.od_cover ADD CONSTRAINT fkey_vl_cover_location_accuracy FOREIGN KEY (location_accuracy)
 REFERENCES qgep.vl_cover_location_accuracy (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_cover_location_accuracy (value_en) VALUES ('plusminus_50cm');
 INSERT INTO qgep.vl_cover_location_accuracy (value_de) VALUES ('plusminus_50cm');
 INSERT INTO qgep.vl_cover_location_accuracy (value_fr) VALUES ('plus_moins_50cm');
 ALTER TABLE qgep.od_cover ADD CONSTRAINT fkey_vl_cover_location_accuracy FOREIGN KEY (location_accuracy)
 REFERENCES qgep.vl_cover_location_accuracy (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_cover_location_accuracy (value_en) VALUES ('more_than_50cm');
 INSERT INTO qgep.vl_cover_location_accuracy (value_de) VALUES ('groesser_50cm');
 INSERT INTO qgep.vl_cover_location_accuracy (value_fr) VALUES ('plusque_50cm');
 ALTER TABLE qgep.od_cover ADD CONSTRAINT fkey_vl_cover_location_accuracy FOREIGN KEY (location_accuracy)
 REFERENCES qgep.vl_cover_location_accuracy (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_cover_location_accuracy (value_en) VALUES ('unknown');
 INSERT INTO qgep.vl_cover_location_accuracy (value_de) VALUES ('unbekannt');
 INSERT INTO qgep.vl_cover_location_accuracy (value_fr) VALUES ('inconnu');
 ALTER TABLE qgep.od_cover ADD CONSTRAINT fkey_vl_cover_location_accuracy FOREIGN KEY (location_accuracy)
 REFERENCES qgep.vl_cover_location_accuracy (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_cover_material
(
code serial NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_cover_material_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_cover_material (value_en) VALUES ('cast_iron');
 INSERT INTO qgep.vl_cover_material (value_de) VALUES ('Guss');
 INSERT INTO qgep.vl_cover_material (value_fr) VALUES ('fonte');
 ALTER TABLE qgep.od_cover ADD CONSTRAINT fkey_vl_cover_material FOREIGN KEY (material)
 REFERENCES qgep.vl_cover_material (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_cover_material (value_en) VALUES ('concrete');
 INSERT INTO qgep.vl_cover_material (value_de) VALUES ('Beton');
 INSERT INTO qgep.vl_cover_material (value_fr) VALUES ('beton');
 ALTER TABLE qgep.od_cover ADD CONSTRAINT fkey_vl_cover_material FOREIGN KEY (material)
 REFERENCES qgep.vl_cover_material (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_cover_material (value_en) VALUES ('cast_iron_with_conrete_filling');
 INSERT INTO qgep.vl_cover_material (value_de) VALUES ('Guss_mit_Betonfuellung');
 INSERT INTO qgep.vl_cover_material (value_fr) VALUES ('fonte_avec_remplissage_en_beton');
 ALTER TABLE qgep.od_cover ADD CONSTRAINT fkey_vl_cover_material FOREIGN KEY (material)
 REFERENCES qgep.vl_cover_material (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_cover_material (value_en) VALUES ('cast_iron_with_pavement_filling');
 INSERT INTO qgep.vl_cover_material (value_de) VALUES ('Guss_mit_Belagsfuellung');
 INSERT INTO qgep.vl_cover_material (value_fr) VALUES ('fonte_avec_remplissage_enrobe');
 ALTER TABLE qgep.od_cover ADD CONSTRAINT fkey_vl_cover_material FOREIGN KEY (material)
 REFERENCES qgep.vl_cover_material (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_cover_material (value_en) VALUES ('other');
 INSERT INTO qgep.vl_cover_material (value_de) VALUES ('andere');
 INSERT INTO qgep.vl_cover_material (value_fr) VALUES ('autres');
 ALTER TABLE qgep.od_cover ADD CONSTRAINT fkey_vl_cover_material FOREIGN KEY (material)
 REFERENCES qgep.vl_cover_material (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_cover_material (value_en) VALUES ('unknown');
 INSERT INTO qgep.vl_cover_material (value_de) VALUES ('unbekannt');
 INSERT INTO qgep.vl_cover_material (value_fr) VALUES ('inconnu');
 ALTER TABLE qgep.od_cover ADD CONSTRAINT fkey_vl_cover_material FOREIGN KEY (material)
 REFERENCES qgep.vl_cover_material (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_cover_sludge_bucket
(
code serial NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_cover_sludge_bucket_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_cover_sludge_bucket (value_en) VALUES ('unknown');
 INSERT INTO qgep.vl_cover_sludge_bucket (value_de) VALUES ('unbekannt');
 INSERT INTO qgep.vl_cover_sludge_bucket (value_fr) VALUES ('inconnu');
 ALTER TABLE qgep.od_cover ADD CONSTRAINT fkey_vl_cover_sludge_bucket FOREIGN KEY (sludge_bucket)
 REFERENCES qgep.vl_cover_sludge_bucket (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_cover_sludge_bucket (value_en) VALUES ('existent');
 INSERT INTO qgep.vl_cover_sludge_bucket (value_de) VALUES ('vorhanden');
 INSERT INTO qgep.vl_cover_sludge_bucket (value_fr) VALUES ('existant');
 ALTER TABLE qgep.od_cover ADD CONSTRAINT fkey_vl_cover_sludge_bucket FOREIGN KEY (sludge_bucket)
 REFERENCES qgep.vl_cover_sludge_bucket (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_cover_sludge_bucket (value_en) VALUES ('inexistent');
 INSERT INTO qgep.vl_cover_sludge_bucket (value_de) VALUES ('nicht_vorhanden');
 INSERT INTO qgep.vl_cover_sludge_bucket (value_fr) VALUES ('inexistant');
 ALTER TABLE qgep.od_cover ADD CONSTRAINT fkey_vl_cover_sludge_bucket FOREIGN KEY (sludge_bucket)
 REFERENCES qgep.vl_cover_sludge_bucket (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_cover_venting
(
code serial NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_cover_venting_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_cover_venting (value_en) VALUES ('vented');
 INSERT INTO qgep.vl_cover_venting (value_de) VALUES ('entlueftet');
 INSERT INTO qgep.vl_cover_venting (value_fr) VALUES ('aere');
 ALTER TABLE qgep.od_cover ADD CONSTRAINT fkey_vl_cover_venting FOREIGN KEY (venting)
 REFERENCES qgep.vl_cover_venting (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_cover_venting (value_en) VALUES ('not_vented');
 INSERT INTO qgep.vl_cover_venting (value_de) VALUES ('nicht_entlueftet');
 INSERT INTO qgep.vl_cover_venting (value_fr) VALUES ('non_aere');
 ALTER TABLE qgep.od_cover ADD CONSTRAINT fkey_vl_cover_venting FOREIGN KEY (venting)
 REFERENCES qgep.vl_cover_venting (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_cover_venting (value_en) VALUES ('unknown');
 INSERT INTO qgep.vl_cover_venting (value_de) VALUES ('unbekannt');
 INSERT INTO qgep.vl_cover_venting (value_fr) VALUES ('inconnu');
 ALTER TABLE qgep.od_cover ADD CONSTRAINT fkey_vl_cover_venting FOREIGN KEY (venting)
 REFERENCES qgep.vl_cover_venting (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_access_aid ADD CONSTRAINT oorel76 FOREIGN KEY (obj_id) REFERENCES qgep.od_structure_part(obj_id);
CREATE TABLE qgep.vl_access_aid_type
(
code serial NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_access_aid_type_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_access_aid_type (value_en) VALUES ('ladder');
 INSERT INTO qgep.vl_access_aid_type (value_de) VALUES ('Leiter');
 INSERT INTO qgep.vl_access_aid_type (value_fr) VALUES ('echelle');
 ALTER TABLE qgep.od_access_aid ADD CONSTRAINT fkey_vl_access_aid_type FOREIGN KEY (type)
 REFERENCES qgep.vl_access_aid_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_access_aid_type (value_en) VALUES ('step_iron');
 INSERT INTO qgep.vl_access_aid_type (value_de) VALUES ('Steigeisen');
 INSERT INTO qgep.vl_access_aid_type (value_fr) VALUES ('echelons');
 ALTER TABLE qgep.od_access_aid ADD CONSTRAINT fkey_vl_access_aid_type FOREIGN KEY (type)
 REFERENCES qgep.vl_access_aid_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_access_aid_type (value_en) VALUES ('pressurized_door');
 INSERT INTO qgep.vl_access_aid_type (value_de) VALUES ('Drucktuere');
 INSERT INTO qgep.vl_access_aid_type (value_fr) VALUES ('porte_etanche');
 ALTER TABLE qgep.od_access_aid ADD CONSTRAINT fkey_vl_access_aid_type FOREIGN KEY (type)
 REFERENCES qgep.vl_access_aid_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_access_aid_type (value_en) VALUES ('other');
 INSERT INTO qgep.vl_access_aid_type (value_de) VALUES ('andere');
 INSERT INTO qgep.vl_access_aid_type (value_fr) VALUES ('autres');
 ALTER TABLE qgep.od_access_aid ADD CONSTRAINT fkey_vl_access_aid_type FOREIGN KEY (type)
 REFERENCES qgep.vl_access_aid_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_access_aid_type (value_en) VALUES ('unknown');
 INSERT INTO qgep.vl_access_aid_type (value_de) VALUES ('unbekannt');
 INSERT INTO qgep.vl_access_aid_type (value_fr) VALUES ('inconnu');
 ALTER TABLE qgep.od_access_aid ADD CONSTRAINT fkey_vl_access_aid_type FOREIGN KEY (type)
 REFERENCES qgep.vl_access_aid_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_access_aid_type (value_en) VALUES ('door');
 INSERT INTO qgep.vl_access_aid_type (value_de) VALUES ('Tuere');
 INSERT INTO qgep.vl_access_aid_type (value_fr) VALUES ('porte');
 ALTER TABLE qgep.od_access_aid ADD CONSTRAINT fkey_vl_access_aid_type FOREIGN KEY (type)
 REFERENCES qgep.vl_access_aid_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_access_aid_type (value_en) VALUES ('staircase');
 INSERT INTO qgep.vl_access_aid_type (value_de) VALUES ('Treppe');
 INSERT INTO qgep.vl_access_aid_type (value_fr) VALUES ('escalier');
 ALTER TABLE qgep.od_access_aid ADD CONSTRAINT fkey_vl_access_aid_type FOREIGN KEY (type)
 REFERENCES qgep.vl_access_aid_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_access_aid_type (value_en) VALUES ('footstep_niches');
 INSERT INTO qgep.vl_access_aid_type (value_de) VALUES ('Trittnischen');
 INSERT INTO qgep.vl_access_aid_type (value_fr) VALUES ('marchepieds');
 ALTER TABLE qgep.od_access_aid ADD CONSTRAINT fkey_vl_access_aid_type FOREIGN KEY (type)
 REFERENCES qgep.vl_access_aid_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_access_aid_type (value_en) VALUES ('no');
 INSERT INTO qgep.vl_access_aid_type (value_de) VALUES ('keine');
 INSERT INTO qgep.vl_access_aid_type (value_fr) VALUES ('aucun_equipement_d_acces');
 ALTER TABLE qgep.od_access_aid ADD CONSTRAINT fkey_vl_access_aid_type FOREIGN KEY (type)
 REFERENCES qgep.vl_access_aid_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_dryweather_downspout ADD CONSTRAINT oorel79 FOREIGN KEY (obj_id) REFERENCES qgep.od_structure_part(obj_id);
ALTER TABLE qgep.od_channel ADD CONSTRAINT oorel82 FOREIGN KEY (obj_id) REFERENCES qgep.od_wastewater_structure(obj_id);
CREATE TABLE qgep.vl_channel_bedding_encasement
(
code serial NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_channel_bedding_encasement_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_channel_bedding_encasement (value_en) VALUES ('sand');
 INSERT INTO qgep.vl_channel_bedding_encasement (value_de) VALUES ('Sand');
 INSERT INTO qgep.vl_channel_bedding_encasement (value_fr) VALUES ('sable');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_bedding_encasement FOREIGN KEY (bedding_encasement)
 REFERENCES qgep.vl_channel_bedding_encasement (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_channel_bedding_encasement (value_en) VALUES ('in_soil');
 INSERT INTO qgep.vl_channel_bedding_encasement (value_de) VALUES ('erdverlegt');
 INSERT INTO qgep.vl_channel_bedding_encasement (value_fr) VALUES ('enterre');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_bedding_encasement FOREIGN KEY (bedding_encasement)
 REFERENCES qgep.vl_channel_bedding_encasement (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_channel_bedding_encasement (value_en) VALUES ('in_channel_suspended');
 INSERT INTO qgep.vl_channel_bedding_encasement (value_de) VALUES ('in_Kanal_aufgehaengt');
 INSERT INTO qgep.vl_channel_bedding_encasement (value_fr) VALUES ('suspendu_dans_le_canal');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_bedding_encasement FOREIGN KEY (bedding_encasement)
 REFERENCES qgep.vl_channel_bedding_encasement (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_channel_bedding_encasement (value_en) VALUES ('in_channel_concrete_casted');
 INSERT INTO qgep.vl_channel_bedding_encasement (value_de) VALUES ('in_Kanal_einbetoniert');
 INSERT INTO qgep.vl_channel_bedding_encasement (value_fr) VALUES ('betonne_dans_le_canal');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_bedding_encasement FOREIGN KEY (bedding_encasement)
 REFERENCES qgep.vl_channel_bedding_encasement (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_channel_bedding_encasement (value_en) VALUES ('in_jacking_pipe_concrete');
 INSERT INTO qgep.vl_channel_bedding_encasement (value_de) VALUES ('in_Vortriebsrohr_Beton');
 INSERT INTO qgep.vl_channel_bedding_encasement (value_fr) VALUES ('en_pousse_tube_en_beton');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_bedding_encasement FOREIGN KEY (bedding_encasement)
 REFERENCES qgep.vl_channel_bedding_encasement (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_channel_bedding_encasement (value_en) VALUES ('in_jacking_pipe_steel');
 INSERT INTO qgep.vl_channel_bedding_encasement (value_de) VALUES ('in_Vortriebsrohr_Stahl');
 INSERT INTO qgep.vl_channel_bedding_encasement (value_fr) VALUES ('en_pousse_tube_en_acier');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_bedding_encasement FOREIGN KEY (bedding_encasement)
 REFERENCES qgep.vl_channel_bedding_encasement (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_channel_bedding_encasement (value_en) VALUES ('other');
 INSERT INTO qgep.vl_channel_bedding_encasement (value_de) VALUES ('andere');
 INSERT INTO qgep.vl_channel_bedding_encasement (value_fr) VALUES ('autres');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_bedding_encasement FOREIGN KEY (bedding_encasement)
 REFERENCES qgep.vl_channel_bedding_encasement (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_channel_bedding_encasement (value_en) VALUES ('unknown');
 INSERT INTO qgep.vl_channel_bedding_encasement (value_de) VALUES ('unbekannt');
 INSERT INTO qgep.vl_channel_bedding_encasement (value_fr) VALUES ('inconnu');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_bedding_encasement FOREIGN KEY (bedding_encasement)
 REFERENCES qgep.vl_channel_bedding_encasement (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_channel_bedding_encasement (value_en) VALUES ('SIA_type_1');
 INSERT INTO qgep.vl_channel_bedding_encasement (value_de) VALUES ('SIA_Typ1');
 INSERT INTO qgep.vl_channel_bedding_encasement (value_fr) VALUES ('SIA_type_1');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_bedding_encasement FOREIGN KEY (bedding_encasement)
 REFERENCES qgep.vl_channel_bedding_encasement (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_channel_bedding_encasement (value_en) VALUES ('SIA_type_2');
 INSERT INTO qgep.vl_channel_bedding_encasement (value_de) VALUES ('SIA_Typ2');
 INSERT INTO qgep.vl_channel_bedding_encasement (value_fr) VALUES ('SIA_type_2');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_bedding_encasement FOREIGN KEY (bedding_encasement)
 REFERENCES qgep.vl_channel_bedding_encasement (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_channel_bedding_encasement (value_en) VALUES ('SIA_type_3');
 INSERT INTO qgep.vl_channel_bedding_encasement (value_de) VALUES ('SIA_Typ3');
 INSERT INTO qgep.vl_channel_bedding_encasement (value_fr) VALUES ('SIA_type_3');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_bedding_encasement FOREIGN KEY (bedding_encasement)
 REFERENCES qgep.vl_channel_bedding_encasement (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_channel_bedding_encasement (value_en) VALUES ('SIA_type_4');
 INSERT INTO qgep.vl_channel_bedding_encasement (value_de) VALUES ('SIA_Typ4');
 INSERT INTO qgep.vl_channel_bedding_encasement (value_fr) VALUES ('SIA_type_4');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_bedding_encasement FOREIGN KEY (bedding_encasement)
 REFERENCES qgep.vl_channel_bedding_encasement (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_channel_bedding_encasement (value_en) VALUES ('in_walk_in_passage');
 INSERT INTO qgep.vl_channel_bedding_encasement (value_de) VALUES ('in_Leitungsgang');
 INSERT INTO qgep.vl_channel_bedding_encasement (value_fr) VALUES ('en_galerie');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_bedding_encasement FOREIGN KEY (bedding_encasement)
 REFERENCES qgep.vl_channel_bedding_encasement (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_channel_connection_type
(
code serial NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_channel_connection_type_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_channel_connection_type (value_en) VALUES ('bell_shaped_sleeves');
 INSERT INTO qgep.vl_channel_connection_type (value_de) VALUES ('Glockenmuffen');
 INSERT INTO qgep.vl_channel_connection_type (value_fr) VALUES ('emboitement_a_cloche');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_connection_type FOREIGN KEY (connection_type)
 REFERENCES qgep.vl_channel_connection_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_channel_connection_type (value_en) VALUES ('beaked_sleeves');
 INSERT INTO qgep.vl_channel_connection_type (value_de) VALUES ('Spitzmuffen');
 INSERT INTO qgep.vl_channel_connection_type (value_fr) VALUES ('emboitement_simple');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_connection_type FOREIGN KEY (connection_type)
 REFERENCES qgep.vl_channel_connection_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_channel_connection_type (value_en) VALUES ('flat_sleeves');
 INSERT INTO qgep.vl_channel_connection_type (value_de) VALUES ('Flachmuffen');
 INSERT INTO qgep.vl_channel_connection_type (value_fr) VALUES ('manchon_plat');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_connection_type FOREIGN KEY (connection_type)
 REFERENCES qgep.vl_channel_connection_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_channel_connection_type (value_en) VALUES ('slip_on_sleeves');
 INSERT INTO qgep.vl_channel_connection_type (value_de) VALUES ('Ueberschiebmuffen');
 INSERT INTO qgep.vl_channel_connection_type (value_fr) VALUES ('manchon_coulissant');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_connection_type FOREIGN KEY (connection_type)
 REFERENCES qgep.vl_channel_connection_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_channel_connection_type (value_en) VALUES ('butt_welded');
 INSERT INTO qgep.vl_channel_connection_type (value_de) VALUES ('spiegelgeschweisst');
 INSERT INTO qgep.vl_channel_connection_type (value_fr) VALUES ('manchon_soude_au_miroir');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_connection_type FOREIGN KEY (connection_type)
 REFERENCES qgep.vl_channel_connection_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_channel_connection_type (value_en) VALUES ('electric_welded_sleeves');
 INSERT INTO qgep.vl_channel_connection_type (value_de) VALUES ('Elektroschweissmuffen');
 INSERT INTO qgep.vl_channel_connection_type (value_fr) VALUES ('manchon_electrosoudable');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_connection_type FOREIGN KEY (connection_type)
 REFERENCES qgep.vl_channel_connection_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_channel_connection_type (value_en) VALUES ('push_fit_sleeves');
 INSERT INTO qgep.vl_channel_connection_type (value_de) VALUES ('Steckmuffen');
 INSERT INTO qgep.vl_channel_connection_type (value_fr) VALUES ('raccord_a_serrage');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_connection_type FOREIGN KEY (connection_type)
 REFERENCES qgep.vl_channel_connection_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_channel_connection_type (value_en) VALUES ('coupling');
 INSERT INTO qgep.vl_channel_connection_type (value_de) VALUES ('Kupplung');
 INSERT INTO qgep.vl_channel_connection_type (value_fr) VALUES ('raccord');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_connection_type FOREIGN KEY (connection_type)
 REFERENCES qgep.vl_channel_connection_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_channel_connection_type (value_en) VALUES ('flange');
 INSERT INTO qgep.vl_channel_connection_type (value_de) VALUES ('Flansch');
 INSERT INTO qgep.vl_channel_connection_type (value_fr) VALUES ('bride');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_connection_type FOREIGN KEY (connection_type)
 REFERENCES qgep.vl_channel_connection_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_channel_connection_type (value_en) VALUES ('screwed_sleeves');
 INSERT INTO qgep.vl_channel_connection_type (value_de) VALUES ('Schraubmuffen');
 INSERT INTO qgep.vl_channel_connection_type (value_fr) VALUES ('manchon_visse');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_connection_type FOREIGN KEY (connection_type)
 REFERENCES qgep.vl_channel_connection_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_channel_connection_type (value_en) VALUES ('other');
 INSERT INTO qgep.vl_channel_connection_type (value_de) VALUES ('andere');
 INSERT INTO qgep.vl_channel_connection_type (value_fr) VALUES ('autres');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_connection_type FOREIGN KEY (connection_type)
 REFERENCES qgep.vl_channel_connection_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_channel_connection_type (value_en) VALUES ('unknown');
 INSERT INTO qgep.vl_channel_connection_type (value_de) VALUES ('unbekannt');
 INSERT INTO qgep.vl_channel_connection_type (value_fr) VALUES ('inconnu');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_connection_type FOREIGN KEY (connection_type)
 REFERENCES qgep.vl_channel_connection_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_channel_connection_type (value_en) VALUES ('jacking_pipe_coupling');
 INSERT INTO qgep.vl_channel_connection_type (value_de) VALUES ('Vortriebsrohrkupplung');
 INSERT INTO qgep.vl_channel_connection_type (value_fr) VALUES ('raccord_pour_tube_de_pousse_tube');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_connection_type FOREIGN KEY (connection_type)
 REFERENCES qgep.vl_channel_connection_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_channel_function_hydraulic
(
code serial NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_channel_function_hydraulic_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_channel_function_hydraulic (value_en) VALUES ('jetting_pipe');
 INSERT INTO qgep.vl_channel_function_hydraulic (value_de) VALUES ('Spuelleitung');
 INSERT INTO qgep.vl_channel_function_hydraulic (value_fr) VALUES ('conduite_de_rincage');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_function_hydraulic FOREIGN KEY (function_hydraulic)
 REFERENCES qgep.vl_channel_function_hydraulic (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_channel_function_hydraulic (value_en) VALUES ('seepage_water_drain');
 INSERT INTO qgep.vl_channel_function_hydraulic (value_de) VALUES ('Sickerleitung');
 INSERT INTO qgep.vl_channel_function_hydraulic (value_fr) VALUES ('conduite_de_drainage');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_function_hydraulic FOREIGN KEY (function_hydraulic)
 REFERENCES qgep.vl_channel_function_hydraulic (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_channel_function_hydraulic (value_en) VALUES ('retention_pipe');
 INSERT INTO qgep.vl_channel_function_hydraulic (value_de) VALUES ('Speicherleitung');
 INSERT INTO qgep.vl_channel_function_hydraulic (value_fr) VALUES ('conduite_de_retention');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_function_hydraulic FOREIGN KEY (function_hydraulic)
 REFERENCES qgep.vl_channel_function_hydraulic (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_channel_function_hydraulic (value_en) VALUES ('restriction_pipe');
 INSERT INTO qgep.vl_channel_function_hydraulic (value_de) VALUES ('Drosselleitung');
 INSERT INTO qgep.vl_channel_function_hydraulic (value_fr) VALUES ('conduite_d_etranglement');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_function_hydraulic FOREIGN KEY (function_hydraulic)
 REFERENCES qgep.vl_channel_function_hydraulic (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_channel_function_hydraulic (value_en) VALUES ('pump_pressure_pipe');
 INSERT INTO qgep.vl_channel_function_hydraulic (value_de) VALUES ('Pumpendruckleitung');
 INSERT INTO qgep.vl_channel_function_hydraulic (value_fr) VALUES ('conduite_de_refoulement');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_function_hydraulic FOREIGN KEY (function_hydraulic)
 REFERENCES qgep.vl_channel_function_hydraulic (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_channel_function_hydraulic (value_en) VALUES ('drainage_transportation_pipe');
 INSERT INTO qgep.vl_channel_function_hydraulic (value_de) VALUES ('Drainagetransportleitung');
 INSERT INTO qgep.vl_channel_function_hydraulic (value_fr) VALUES ('conduite_de_transport_pour_le_drainage');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_function_hydraulic FOREIGN KEY (function_hydraulic)
 REFERENCES qgep.vl_channel_function_hydraulic (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_channel_function_hydraulic (value_en) VALUES ('unknown');
 INSERT INTO qgep.vl_channel_function_hydraulic (value_de) VALUES ('unbekannt');
 INSERT INTO qgep.vl_channel_function_hydraulic (value_fr) VALUES ('inconnu');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_function_hydraulic FOREIGN KEY (function_hydraulic)
 REFERENCES qgep.vl_channel_function_hydraulic (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_channel_function_hydraulic (value_en) VALUES ('other');
 INSERT INTO qgep.vl_channel_function_hydraulic (value_de) VALUES ('andere');
 INSERT INTO qgep.vl_channel_function_hydraulic (value_fr) VALUES ('autres');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_function_hydraulic FOREIGN KEY (function_hydraulic)
 REFERENCES qgep.vl_channel_function_hydraulic (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_channel_function_hydraulic (value_en) VALUES ('inverted_syphon');
 INSERT INTO qgep.vl_channel_function_hydraulic (value_de) VALUES ('Duekerleitung');
 INSERT INTO qgep.vl_channel_function_hydraulic (value_fr) VALUES ('siphon_inverse');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_function_hydraulic FOREIGN KEY (function_hydraulic)
 REFERENCES qgep.vl_channel_function_hydraulic (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_channel_function_hydraulic (value_en) VALUES ('vacuum_pipe');
 INSERT INTO qgep.vl_channel_function_hydraulic (value_de) VALUES ('Vakuumleitung');
 INSERT INTO qgep.vl_channel_function_hydraulic (value_fr) VALUES ('conduite_sous_vide');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_function_hydraulic FOREIGN KEY (function_hydraulic)
 REFERENCES qgep.vl_channel_function_hydraulic (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_channel_function_hydraulic (value_en) VALUES ('gravity_pipe');
 INSERT INTO qgep.vl_channel_function_hydraulic (value_de) VALUES ('Freispiegelleitung');
 INSERT INTO qgep.vl_channel_function_hydraulic (value_fr) VALUES ('conduite_a_ecoulement_gravitaire');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_function_hydraulic FOREIGN KEY (function_hydraulic)
 REFERENCES qgep.vl_channel_function_hydraulic (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_channel_usage_current
(
code serial NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_channel_usage_current_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_channel_usage_current (value_en) VALUES ('clean_wastewater');
 INSERT INTO qgep.vl_channel_usage_current (value_de) VALUES ('Reinabwasser');
 INSERT INTO qgep.vl_channel_usage_current (value_fr) VALUES ('eaux_claires');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_usage_current FOREIGN KEY (usage_current)
 REFERENCES qgep.vl_channel_usage_current (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_channel_usage_current (value_en) VALUES ('discharged_wastewater');
 INSERT INTO qgep.vl_channel_usage_current (value_de) VALUES ('entlastetes_Mischabwasser');
 INSERT INTO qgep.vl_channel_usage_current (value_fr) VALUES ('eaux_mixtes_deversees');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_usage_current FOREIGN KEY (usage_current)
 REFERENCES qgep.vl_channel_usage_current (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_channel_usage_current (value_en) VALUES ('creek_water');
 INSERT INTO qgep.vl_channel_usage_current (value_de) VALUES ('Bachwasser');
 INSERT INTO qgep.vl_channel_usage_current (value_fr) VALUES ('eaux_cours_d_eau');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_usage_current FOREIGN KEY (usage_current)
 REFERENCES qgep.vl_channel_usage_current (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_channel_usage_current (value_en) VALUES ('rain_wastewater');
 INSERT INTO qgep.vl_channel_usage_current (value_de) VALUES ('Regenabwasser');
 INSERT INTO qgep.vl_channel_usage_current (value_fr) VALUES ('eaux_pluviales');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_usage_current FOREIGN KEY (usage_current)
 REFERENCES qgep.vl_channel_usage_current (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_channel_usage_current (value_en) VALUES ('combined_wastewater');
 INSERT INTO qgep.vl_channel_usage_current (value_de) VALUES ('Mischabwasser');
 INSERT INTO qgep.vl_channel_usage_current (value_fr) VALUES ('eaux_mixtes');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_usage_current FOREIGN KEY (usage_current)
 REFERENCES qgep.vl_channel_usage_current (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_channel_usage_current (value_en) VALUES ('industrial_wastewater');
 INSERT INTO qgep.vl_channel_usage_current (value_de) VALUES ('Industrieabwasser');
 INSERT INTO qgep.vl_channel_usage_current (value_fr) VALUES ('eaux_industrielles');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_usage_current FOREIGN KEY (usage_current)
 REFERENCES qgep.vl_channel_usage_current (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_channel_usage_current (value_en) VALUES ('wastewater');
 INSERT INTO qgep.vl_channel_usage_current (value_de) VALUES ('Schmutzabwasser');
 INSERT INTO qgep.vl_channel_usage_current (value_fr) VALUES ('eaux_usees');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_usage_current FOREIGN KEY (usage_current)
 REFERENCES qgep.vl_channel_usage_current (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_channel_usage_current (value_en) VALUES ('other');
 INSERT INTO qgep.vl_channel_usage_current (value_de) VALUES ('andere');
 INSERT INTO qgep.vl_channel_usage_current (value_fr) VALUES ('autres');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_usage_current FOREIGN KEY (usage_current)
 REFERENCES qgep.vl_channel_usage_current (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_channel_usage_current (value_en) VALUES ('unknown');
 INSERT INTO qgep.vl_channel_usage_current (value_de) VALUES ('unbekannt');
 INSERT INTO qgep.vl_channel_usage_current (value_fr) VALUES ('inconnu');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_usage_current FOREIGN KEY (usage_current)
 REFERENCES qgep.vl_channel_usage_current (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_channel_usage_planned
(
code serial NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_channel_usage_planned_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_channel_usage_planned (value_en) VALUES ('clean_wastewater');
 INSERT INTO qgep.vl_channel_usage_planned (value_de) VALUES ('Reinabwasser');
 INSERT INTO qgep.vl_channel_usage_planned (value_fr) VALUES ('eaux_claires');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_usage_planned FOREIGN KEY (usage_planned)
 REFERENCES qgep.vl_channel_usage_planned (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_channel_usage_planned (value_en) VALUES ('discharged_combined_wastewater');
 INSERT INTO qgep.vl_channel_usage_planned (value_de) VALUES ('entlastetes_Mischabwasser');
 INSERT INTO qgep.vl_channel_usage_planned (value_fr) VALUES ('eaux_mixtes_deversees');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_usage_planned FOREIGN KEY (usage_planned)
 REFERENCES qgep.vl_channel_usage_planned (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_channel_usage_planned (value_en) VALUES ('creek_water');
 INSERT INTO qgep.vl_channel_usage_planned (value_de) VALUES ('Bachwasser');
 INSERT INTO qgep.vl_channel_usage_planned (value_fr) VALUES ('eaux_cours_d_eau');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_usage_planned FOREIGN KEY (usage_planned)
 REFERENCES qgep.vl_channel_usage_planned (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_channel_usage_planned (value_en) VALUES ('rain_wastewater');
 INSERT INTO qgep.vl_channel_usage_planned (value_de) VALUES ('Regenabwasser');
 INSERT INTO qgep.vl_channel_usage_planned (value_fr) VALUES ('eaux_pluviales');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_usage_planned FOREIGN KEY (usage_planned)
 REFERENCES qgep.vl_channel_usage_planned (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_channel_usage_planned (value_en) VALUES ('combined_wastewater');
 INSERT INTO qgep.vl_channel_usage_planned (value_de) VALUES ('Mischabwasser');
 INSERT INTO qgep.vl_channel_usage_planned (value_fr) VALUES ('eaux_mixtes');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_usage_planned FOREIGN KEY (usage_planned)
 REFERENCES qgep.vl_channel_usage_planned (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_channel_usage_planned (value_en) VALUES ('industrial_wastewater');
 INSERT INTO qgep.vl_channel_usage_planned (value_de) VALUES ('Industrieabwasser');
 INSERT INTO qgep.vl_channel_usage_planned (value_fr) VALUES ('eaux_industrielles');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_usage_planned FOREIGN KEY (usage_planned)
 REFERENCES qgep.vl_channel_usage_planned (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_channel_usage_planned (value_en) VALUES ('wastewater');
 INSERT INTO qgep.vl_channel_usage_planned (value_de) VALUES ('Schmutzabwasser');
 INSERT INTO qgep.vl_channel_usage_planned (value_fr) VALUES ('eaux_usees');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_usage_planned FOREIGN KEY (usage_planned)
 REFERENCES qgep.vl_channel_usage_planned (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_channel_usage_planned (value_en) VALUES ('other');
 INSERT INTO qgep.vl_channel_usage_planned (value_de) VALUES ('andere');
 INSERT INTO qgep.vl_channel_usage_planned (value_fr) VALUES ('autres');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_usage_planned FOREIGN KEY (usage_planned)
 REFERENCES qgep.vl_channel_usage_planned (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_channel_usage_planned (value_en) VALUES ('unknown');
 INSERT INTO qgep.vl_channel_usage_planned (value_de) VALUES ('unbekannt');
 INSERT INTO qgep.vl_channel_usage_planned (value_fr) VALUES ('inconnu');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_usage_planned FOREIGN KEY (usage_planned)
 REFERENCES qgep.vl_channel_usage_planned (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_discharge_point ADD CONSTRAINT oorel94 FOREIGN KEY (obj_id) REFERENCES qgep.od_wastewater_structure(obj_id);
ALTER TABLE qgep.od_manhole ADD CONSTRAINT oorel101 FOREIGN KEY (obj_id) REFERENCES qgep.od_wastewater_structure(obj_id);
CREATE TABLE qgep.vl_manhole_function
(
code serial NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_manhole_function_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_manhole_function (value_en) VALUES ('oil_separator');
 INSERT INTO qgep.vl_manhole_function (value_de) VALUES ('Oelabscheider');
 INSERT INTO qgep.vl_manhole_function (value_fr) VALUES ('separateur_d_hydrocarbures');
 ALTER TABLE qgep.od_manhole ADD CONSTRAINT fkey_vl_manhole_function FOREIGN KEY (function)
 REFERENCES qgep.vl_manhole_function (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_manhole_function (value_en) VALUES ('manhole');
 INSERT INTO qgep.vl_manhole_function (value_de) VALUES ('Kontrollschacht');
 INSERT INTO qgep.vl_manhole_function (value_fr) VALUES ('regard_de_visite');
 ALTER TABLE qgep.od_manhole ADD CONSTRAINT fkey_vl_manhole_function FOREIGN KEY (function)
 REFERENCES qgep.vl_manhole_function (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_manhole_function (value_en) VALUES ('rail_track_gully');
 INSERT INTO qgep.vl_manhole_function (value_de) VALUES ('Geleiseschacht');
 INSERT INTO qgep.vl_manhole_function (value_fr) VALUES ('evacuation_des_eaux_des_voies_ferrees');
 ALTER TABLE qgep.od_manhole ADD CONSTRAINT fkey_vl_manhole_function FOREIGN KEY (function)
 REFERENCES qgep.vl_manhole_function (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_manhole_function (value_en) VALUES ('slurry_collector');
 INSERT INTO qgep.vl_manhole_function (value_de) VALUES ('Schlammsammler');
 INSERT INTO qgep.vl_manhole_function (value_fr) VALUES ('depotoir');
 ALTER TABLE qgep.od_manhole ADD CONSTRAINT fkey_vl_manhole_function FOREIGN KEY (function)
 REFERENCES qgep.vl_manhole_function (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_manhole_function (value_en) VALUES ('other');
 INSERT INTO qgep.vl_manhole_function (value_de) VALUES ('andere');
 INSERT INTO qgep.vl_manhole_function (value_fr) VALUES ('autres');
 ALTER TABLE qgep.od_manhole ADD CONSTRAINT fkey_vl_manhole_function FOREIGN KEY (function)
 REFERENCES qgep.vl_manhole_function (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_manhole_function (value_en) VALUES ('unknown');
 INSERT INTO qgep.vl_manhole_function (value_de) VALUES ('unbekannt');
 INSERT INTO qgep.vl_manhole_function (value_fr) VALUES ('inconnu');
 ALTER TABLE qgep.od_manhole ADD CONSTRAINT fkey_vl_manhole_function FOREIGN KEY (function)
 REFERENCES qgep.vl_manhole_function (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_manhole_function (value_en) VALUES ('drainage_channel');
 INSERT INTO qgep.vl_manhole_function (value_de) VALUES ('Entwaesserungsrinne');
 INSERT INTO qgep.vl_manhole_function (value_fr) VALUES ('rigole_de_drainage');
 ALTER TABLE qgep.od_manhole ADD CONSTRAINT fkey_vl_manhole_function FOREIGN KEY (function)
 REFERENCES qgep.vl_manhole_function (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_manhole_function (value_en) VALUES ('gully');
 INSERT INTO qgep.vl_manhole_function (value_de) VALUES ('Einlaufschacht');
 INSERT INTO qgep.vl_manhole_function (value_fr) VALUES ('chambre_avec_grille_d_entree');
 ALTER TABLE qgep.od_manhole ADD CONSTRAINT fkey_vl_manhole_function FOREIGN KEY (function)
 REFERENCES qgep.vl_manhole_function (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_manhole_function (value_en) VALUES ('rain_water_manhole');
 INSERT INTO qgep.vl_manhole_function (value_de) VALUES ('Dachwasserschacht');
 INSERT INTO qgep.vl_manhole_function (value_fr) VALUES ('chambre_recolte_eaux_toitures');
 ALTER TABLE qgep.od_manhole ADD CONSTRAINT fkey_vl_manhole_function FOREIGN KEY (function)
 REFERENCES qgep.vl_manhole_function (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_manhole_function (value_en) VALUES ('floating_material_separator');
 INSERT INTO qgep.vl_manhole_function (value_de) VALUES ('Schwimmstoffabscheider');
 INSERT INTO qgep.vl_manhole_function (value_fr) VALUES ('separateur_materiaux_flottants');
 ALTER TABLE qgep.od_manhole ADD CONSTRAINT fkey_vl_manhole_function FOREIGN KEY (function)
 REFERENCES qgep.vl_manhole_function (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_manhole_function (value_en) VALUES ('drop_structure');
 INSERT INTO qgep.vl_manhole_function (value_de) VALUES ('Absturzbauwerk');
 INSERT INTO qgep.vl_manhole_function (value_fr) VALUES ('ouvrage_de_chute');
 ALTER TABLE qgep.od_manhole ADD CONSTRAINT fkey_vl_manhole_function FOREIGN KEY (function)
 REFERENCES qgep.vl_manhole_function (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_manhole_function (value_en) VALUES ('venting');
 INSERT INTO qgep.vl_manhole_function (value_de) VALUES ('Be_Entlueftung');
 INSERT INTO qgep.vl_manhole_function (value_fr) VALUES ('aeration');
 ALTER TABLE qgep.od_manhole ADD CONSTRAINT fkey_vl_manhole_function FOREIGN KEY (function)
 REFERENCES qgep.vl_manhole_function (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_manhole_function (value_en) VALUES ('flood_relief');
 INSERT INTO qgep.vl_manhole_function (value_de) VALUES ('Hochwasserentlastung');
 INSERT INTO qgep.vl_manhole_function (value_fr) VALUES ('deversoir_orage');
 ALTER TABLE qgep.od_manhole ADD CONSTRAINT fkey_vl_manhole_function FOREIGN KEY (function)
 REFERENCES qgep.vl_manhole_function (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_manhole_function (value_en) VALUES ('septic_tank');
 INSERT INTO qgep.vl_manhole_function (value_de) VALUES ('Klaergrube');
 INSERT INTO qgep.vl_manhole_function (value_fr) VALUES ('fosse_septique');
 ALTER TABLE qgep.od_manhole ADD CONSTRAINT fkey_vl_manhole_function FOREIGN KEY (function)
 REFERENCES qgep.vl_manhole_function (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_manhole_function (value_en) VALUES ('pump_station');
 INSERT INTO qgep.vl_manhole_function (value_de) VALUES ('Pumpwerk');
 INSERT INTO qgep.vl_manhole_function (value_fr) VALUES ('station_de_pompage');
 ALTER TABLE qgep.od_manhole ADD CONSTRAINT fkey_vl_manhole_function FOREIGN KEY (function)
 REFERENCES qgep.vl_manhole_function (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_manhole_function (value_en) VALUES ('jetting_manhole');
 INSERT INTO qgep.vl_manhole_function (value_de) VALUES ('Spuelschacht');
 INSERT INTO qgep.vl_manhole_function (value_fr) VALUES ('chambre_de_chasse');
 ALTER TABLE qgep.od_manhole ADD CONSTRAINT fkey_vl_manhole_function FOREIGN KEY (function)
 REFERENCES qgep.vl_manhole_function (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_manhole_material
(
code serial NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_manhole_material_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_manhole_material (value_en) VALUES ('other');
 INSERT INTO qgep.vl_manhole_material (value_de) VALUES ('andere');
 INSERT INTO qgep.vl_manhole_material (value_fr) VALUES ('autre');
 ALTER TABLE qgep.od_manhole ADD CONSTRAINT fkey_vl_manhole_material FOREIGN KEY (material)
 REFERENCES qgep.vl_manhole_material (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_manhole_material (value_en) VALUES ('concrete');
 INSERT INTO qgep.vl_manhole_material (value_de) VALUES ('Beton');
 INSERT INTO qgep.vl_manhole_material (value_fr) VALUES ('beton');
 ALTER TABLE qgep.od_manhole ADD CONSTRAINT fkey_vl_manhole_material FOREIGN KEY (material)
 REFERENCES qgep.vl_manhole_material (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_manhole_material (value_en) VALUES ('plastic');
 INSERT INTO qgep.vl_manhole_material (value_de) VALUES ('Kunststoff');
 INSERT INTO qgep.vl_manhole_material (value_fr) VALUES ('matiere_plastique');
 ALTER TABLE qgep.od_manhole ADD CONSTRAINT fkey_vl_manhole_material FOREIGN KEY (material)
 REFERENCES qgep.vl_manhole_material (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_manhole_material (value_en) VALUES ('unknown');
 INSERT INTO qgep.vl_manhole_material (value_de) VALUES ('unbekannt');
 INSERT INTO qgep.vl_manhole_material (value_fr) VALUES ('inconnu');
 ALTER TABLE qgep.od_manhole ADD CONSTRAINT fkey_vl_manhole_material FOREIGN KEY (material)
 REFERENCES qgep.vl_manhole_material (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_manhole_surface_inflow
(
code serial NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_manhole_surface_inflow_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_manhole_surface_inflow (value_en) VALUES ('grid');
 INSERT INTO qgep.vl_manhole_surface_inflow (value_de) VALUES ('Rost');
 INSERT INTO qgep.vl_manhole_surface_inflow (value_fr) VALUES ('grille_d_ecoulement');
 ALTER TABLE qgep.od_manhole ADD CONSTRAINT fkey_vl_manhole_surface_inflow FOREIGN KEY (surface_inflow)
 REFERENCES qgep.vl_manhole_surface_inflow (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_manhole_surface_inflow (value_en) VALUES ('intake_from_side');
 INSERT INTO qgep.vl_manhole_surface_inflow (value_de) VALUES ('Zulauf_seitlich');
 INSERT INTO qgep.vl_manhole_surface_inflow (value_fr) VALUES ('arrivee_laterale');
 ALTER TABLE qgep.od_manhole ADD CONSTRAINT fkey_vl_manhole_surface_inflow FOREIGN KEY (surface_inflow)
 REFERENCES qgep.vl_manhole_surface_inflow (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_manhole_surface_inflow (value_en) VALUES ('no');
 INSERT INTO qgep.vl_manhole_surface_inflow (value_de) VALUES ('keiner');
 INSERT INTO qgep.vl_manhole_surface_inflow (value_fr) VALUES ('aucune');
 ALTER TABLE qgep.od_manhole ADD CONSTRAINT fkey_vl_manhole_surface_inflow FOREIGN KEY (surface_inflow)
 REFERENCES qgep.vl_manhole_surface_inflow (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_manhole_surface_inflow (value_en) VALUES ('unknown');
 INSERT INTO qgep.vl_manhole_surface_inflow (value_de) VALUES ('unbekannt');
 INSERT INTO qgep.vl_manhole_surface_inflow (value_fr) VALUES ('inconnu');
 ALTER TABLE qgep.od_manhole ADD CONSTRAINT fkey_vl_manhole_surface_inflow FOREIGN KEY (surface_inflow)
 REFERENCES qgep.vl_manhole_surface_inflow (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_manhole_surface_inflow (value_en) VALUES ('other');
 INSERT INTO qgep.vl_manhole_surface_inflow (value_de) VALUES ('andere');
 INSERT INTO qgep.vl_manhole_surface_inflow (value_fr) VALUES ('autres');
 ALTER TABLE qgep.od_manhole ADD CONSTRAINT fkey_vl_manhole_surface_inflow FOREIGN KEY (surface_inflow)
 REFERENCES qgep.vl_manhole_surface_inflow (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_special_structure ADD CONSTRAINT oorel108 FOREIGN KEY (obj_id) REFERENCES qgep.od_wastewater_structure(obj_id);
CREATE TABLE qgep.vl_special_structure_bypass
(
code serial NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_special_structure_bypass_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_special_structure_bypass (value_en) VALUES ('existent');
 INSERT INTO qgep.vl_special_structure_bypass (value_de) VALUES ('vorhanden');
 INSERT INTO qgep.vl_special_structure_bypass (value_fr) VALUES ('existant');
 ALTER TABLE qgep.od_special_structure ADD CONSTRAINT fkey_vl_special_structure_bypass FOREIGN KEY (bypass)
 REFERENCES qgep.vl_special_structure_bypass (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_special_structure_bypass (value_en) VALUES ('inexistent');
 INSERT INTO qgep.vl_special_structure_bypass (value_de) VALUES ('nicht_vorhanden');
 INSERT INTO qgep.vl_special_structure_bypass (value_fr) VALUES ('inexistant');
 ALTER TABLE qgep.od_special_structure ADD CONSTRAINT fkey_vl_special_structure_bypass FOREIGN KEY (bypass)
 REFERENCES qgep.vl_special_structure_bypass (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_special_structure_bypass (value_en) VALUES ('unknown');
 INSERT INTO qgep.vl_special_structure_bypass (value_de) VALUES ('unbekannt');
 INSERT INTO qgep.vl_special_structure_bypass (value_fr) VALUES ('inconnu');
 ALTER TABLE qgep.od_special_structure ADD CONSTRAINT fkey_vl_special_structure_bypass FOREIGN KEY (bypass)
 REFERENCES qgep.vl_special_structure_bypass (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_special_structure_function
(
code serial NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_special_structure_function_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_special_structure_function (value_en) VALUES ('jetting_manhole');
 INSERT INTO qgep.vl_special_structure_function (value_de) VALUES ('Spuelschacht');
 INSERT INTO qgep.vl_special_structure_function (value_fr) VALUES ('chambre_de_chasse');
 ALTER TABLE qgep.od_special_structure ADD CONSTRAINT fkey_vl_special_structure_function FOREIGN KEY (function)
 REFERENCES qgep.vl_special_structure_function (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_special_structure_function (value_en) VALUES ('drop_structure');
 INSERT INTO qgep.vl_special_structure_function (value_de) VALUES ('Absturzbauwerk');
 INSERT INTO qgep.vl_special_structure_function (value_fr) VALUES ('ouvrage_de_chute');
 ALTER TABLE qgep.od_special_structure ADD CONSTRAINT fkey_vl_special_structure_function FOREIGN KEY (function)
 REFERENCES qgep.vl_special_structure_function (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_special_structure_function (value_en) VALUES ('pump_station');
 INSERT INTO qgep.vl_special_structure_function (value_de) VALUES ('Pumpwerk');
 INSERT INTO qgep.vl_special_structure_function (value_fr) VALUES ('station_de_pompage');
 ALTER TABLE qgep.od_special_structure ADD CONSTRAINT fkey_vl_special_structure_function FOREIGN KEY (function)
 REFERENCES qgep.vl_special_structure_function (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_special_structure_function (value_en) VALUES ('septic_tank');
 INSERT INTO qgep.vl_special_structure_function (value_de) VALUES ('Klaergrube');
 INSERT INTO qgep.vl_special_structure_function (value_fr) VALUES ('fosse_septique');
 ALTER TABLE qgep.od_special_structure ADD CONSTRAINT fkey_vl_special_structure_function FOREIGN KEY (function)
 REFERENCES qgep.vl_special_structure_function (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_special_structure_function (value_en) VALUES ('cesspit');
 INSERT INTO qgep.vl_special_structure_function (value_de) VALUES ('Jauchegrube');
 INSERT INTO qgep.vl_special_structure_function (value_fr) VALUES ('fosse_a_purin');
 ALTER TABLE qgep.od_special_structure ADD CONSTRAINT fkey_vl_special_structure_function FOREIGN KEY (function)
 REFERENCES qgep.vl_special_structure_function (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_special_structure_function (value_en) VALUES ('vortex_manhole');
 INSERT INTO qgep.vl_special_structure_function (value_de) VALUES ('Wirbelfallschacht');
 INSERT INTO qgep.vl_special_structure_function (value_fr) VALUES ('chambre_de_chute_a_vortex');
 ALTER TABLE qgep.od_special_structure ADD CONSTRAINT fkey_vl_special_structure_function FOREIGN KEY (function)
 REFERENCES qgep.vl_special_structure_function (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_special_structure_function (value_en) VALUES ('oil_separator');
 INSERT INTO qgep.vl_special_structure_function (value_de) VALUES ('Oelabscheider');
 INSERT INTO qgep.vl_special_structure_function (value_fr) VALUES ('separateur_d_hydrocarbures');
 ALTER TABLE qgep.od_special_structure ADD CONSTRAINT fkey_vl_special_structure_function FOREIGN KEY (function)
 REFERENCES qgep.vl_special_structure_function (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_special_structure_function (value_en) VALUES ('manhole');
 INSERT INTO qgep.vl_special_structure_function (value_de) VALUES ('Kontrollschacht');
 INSERT INTO qgep.vl_special_structure_function (value_fr) VALUES ('regard_de_visite');
 ALTER TABLE qgep.od_special_structure ADD CONSTRAINT fkey_vl_special_structure_function FOREIGN KEY (function)
 REFERENCES qgep.vl_special_structure_function (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_special_structure_function (value_en) VALUES ('unknown');
 INSERT INTO qgep.vl_special_structure_function (value_de) VALUES ('unbekannt');
 INSERT INTO qgep.vl_special_structure_function (value_fr) VALUES ('inconnu');
 ALTER TABLE qgep.od_special_structure ADD CONSTRAINT fkey_vl_special_structure_function FOREIGN KEY (function)
 REFERENCES qgep.vl_special_structure_function (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_special_structure_function (value_en) VALUES ('other');
 INSERT INTO qgep.vl_special_structure_function (value_de) VALUES ('andere');
 INSERT INTO qgep.vl_special_structure_function (value_fr) VALUES ('autres');
 ALTER TABLE qgep.od_special_structure ADD CONSTRAINT fkey_vl_special_structure_function FOREIGN KEY (function)
 REFERENCES qgep.vl_special_structure_function (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_special_structure_function (value_en) VALUES ('spill_way');
 INSERT INTO qgep.vl_special_structure_function (value_de) VALUES ('Hochwasserentlastung');
 INSERT INTO qgep.vl_special_structure_function (value_fr) VALUES ('deversoir_orage');
 ALTER TABLE qgep.od_special_structure ADD CONSTRAINT fkey_vl_special_structure_function FOREIGN KEY (function)
 REFERENCES qgep.vl_special_structure_function (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_special_structure_function (value_en) VALUES ('inverse_syphon_chamber');
 INSERT INTO qgep.vl_special_structure_function (value_de) VALUES ('Duekerkammer');
 INSERT INTO qgep.vl_special_structure_function (value_fr) VALUES ('chambre_avec_siphon_inverse');
 ALTER TABLE qgep.od_special_structure ADD CONSTRAINT fkey_vl_special_structure_function FOREIGN KEY (function)
 REFERENCES qgep.vl_special_structure_function (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_special_structure_function (value_en) VALUES ('floating_material_separator');
 INSERT INTO qgep.vl_special_structure_function (value_de) VALUES ('Schwimmstoffabscheider');
 INSERT INTO qgep.vl_special_structure_function (value_fr) VALUES ('separateur_materiaux_flottants');
 ALTER TABLE qgep.od_special_structure ADD CONSTRAINT fkey_vl_special_structure_function FOREIGN KEY (function)
 REFERENCES qgep.vl_special_structure_function (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_special_structure_function (value_en) VALUES ('terrain_depression');
 INSERT INTO qgep.vl_special_structure_function (value_de) VALUES ('Gelaendemulde');
 INSERT INTO qgep.vl_special_structure_function (value_fr) VALUES ('depression_de_terrain');
 ALTER TABLE qgep.od_special_structure ADD CONSTRAINT fkey_vl_special_structure_function FOREIGN KEY (function)
 REFERENCES qgep.vl_special_structure_function (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_special_structure_function (value_en) VALUES ('bolders_bedload_catchement_dam');
 INSERT INTO qgep.vl_special_structure_function (value_de) VALUES ('Geschiebefang');
 INSERT INTO qgep.vl_special_structure_function (value_fr) VALUES ('depotoir_pour_alluvions');
 ALTER TABLE qgep.od_special_structure ADD CONSTRAINT fkey_vl_special_structure_function FOREIGN KEY (function)
 REFERENCES qgep.vl_special_structure_function (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_special_structure_function (value_en) VALUES ('stormwater_tank_with_overflow');
 INSERT INTO qgep.vl_special_structure_function (value_de) VALUES ('Regenbecken_Durchlaufbecken');
 INSERT INTO qgep.vl_special_structure_function (value_fr) VALUES ('BEP_decantation');
 ALTER TABLE qgep.od_special_structure ADD CONSTRAINT fkey_vl_special_structure_function FOREIGN KEY (function)
 REFERENCES qgep.vl_special_structure_function (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_special_structure_function (value_en) VALUES ('stormwater_tank_retaining_first_flush');
 INSERT INTO qgep.vl_special_structure_function (value_de) VALUES ('Regenbecken_Fangbecken');
 INSERT INTO qgep.vl_special_structure_function (value_fr) VALUES ('BEP_retention');
 ALTER TABLE qgep.od_special_structure ADD CONSTRAINT fkey_vl_special_structure_function FOREIGN KEY (function)
 REFERENCES qgep.vl_special_structure_function (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_special_structure_function (value_en) VALUES ('stormwater_sedimentation_tank');
 INSERT INTO qgep.vl_special_structure_function (value_de) VALUES ('Regenbecken_Regenklaerbecken');
 INSERT INTO qgep.vl_special_structure_function (value_fr) VALUES ('BEP_clarification');
 ALTER TABLE qgep.od_special_structure ADD CONSTRAINT fkey_vl_special_structure_function FOREIGN KEY (function)
 REFERENCES qgep.vl_special_structure_function (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_special_structure_function (value_en) VALUES ('stormwater_retention_tank');
 INSERT INTO qgep.vl_special_structure_function (value_de) VALUES ('Regenbecken_Regenrueckhaltebecken');
 INSERT INTO qgep.vl_special_structure_function (value_fr) VALUES ('BEP_accumulation');
 ALTER TABLE qgep.od_special_structure ADD CONSTRAINT fkey_vl_special_structure_function FOREIGN KEY (function)
 REFERENCES qgep.vl_special_structure_function (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_special_structure_function (value_en) VALUES ('stormwater_composite_tank');
 INSERT INTO qgep.vl_special_structure_function (value_de) VALUES ('Regenbecken_Verbundbecken');
 INSERT INTO qgep.vl_special_structure_function (value_fr) VALUES ('BEP_combine');
 ALTER TABLE qgep.od_special_structure ADD CONSTRAINT fkey_vl_special_structure_function FOREIGN KEY (function)
 REFERENCES qgep.vl_special_structure_function (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_special_structure_function (value_en) VALUES ('side_access');
 INSERT INTO qgep.vl_special_structure_function (value_de) VALUES ('seitlicherZugang');
 INSERT INTO qgep.vl_special_structure_function (value_fr) VALUES ('acces_lateral');
 ALTER TABLE qgep.od_special_structure ADD CONSTRAINT fkey_vl_special_structure_function FOREIGN KEY (function)
 REFERENCES qgep.vl_special_structure_function (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_special_structure_function (value_en) VALUES ('venting');
 INSERT INTO qgep.vl_special_structure_function (value_de) VALUES ('Be_Entlueftung');
 INSERT INTO qgep.vl_special_structure_function (value_fr) VALUES ('aeration');
 ALTER TABLE qgep.od_special_structure ADD CONSTRAINT fkey_vl_special_structure_function FOREIGN KEY (function)
 REFERENCES qgep.vl_special_structure_function (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_infiltration_installation ADD CONSTRAINT oorel115 FOREIGN KEY (obj_id) REFERENCES qgep.od_wastewater_structure(obj_id);
CREATE TABLE qgep.vl_infiltration_installation_defects
(
code serial NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_infiltration_installation_defects_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_infiltration_installation_defects (value_en) VALUES ('none');
 INSERT INTO qgep.vl_infiltration_installation_defects (value_de) VALUES ('keine');
 INSERT INTO qgep.vl_infiltration_installation_defects (value_fr) VALUES ('aucune');
 ALTER TABLE qgep.od_infiltration_installation ADD CONSTRAINT fkey_vl_infiltration_installation_defects FOREIGN KEY (defects)
 REFERENCES qgep.vl_infiltration_installation_defects (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_infiltration_installation_defects (value_en) VALUES ('substantial');
 INSERT INTO qgep.vl_infiltration_installation_defects (value_de) VALUES ('wesentliche');
 INSERT INTO qgep.vl_infiltration_installation_defects (value_fr) VALUES ('importantes');
 ALTER TABLE qgep.od_infiltration_installation ADD CONSTRAINT fkey_vl_infiltration_installation_defects FOREIGN KEY (defects)
 REFERENCES qgep.vl_infiltration_installation_defects (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_infiltration_installation_defects (value_en) VALUES ('marginal');
 INSERT INTO qgep.vl_infiltration_installation_defects (value_de) VALUES ('unwesentliche');
 INSERT INTO qgep.vl_infiltration_installation_defects (value_fr) VALUES ('modestes');
 ALTER TABLE qgep.od_infiltration_installation ADD CONSTRAINT fkey_vl_infiltration_installation_defects FOREIGN KEY (defects)
 REFERENCES qgep.vl_infiltration_installation_defects (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_infiltration_installation_emergency_spillway
(
code serial NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_infiltration_installation_emergency_spillway_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_infiltration_installation_emergency_spillway (value_en) VALUES ('none');
 INSERT INTO qgep.vl_infiltration_installation_emergency_spillway (value_de) VALUES ('keiner');
 INSERT INTO qgep.vl_infiltration_installation_emergency_spillway (value_fr) VALUES ('aucun');
 ALTER TABLE qgep.od_infiltration_installation ADD CONSTRAINT fkey_vl_infiltration_installation_emergency_spillway FOREIGN KEY (emergency_spillway)
 REFERENCES qgep.vl_infiltration_installation_emergency_spillway (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_infiltration_installation_emergency_spillway (value_en) VALUES ('in_water_body');
 INSERT INTO qgep.vl_infiltration_installation_emergency_spillway (value_de) VALUES ('inVorfluter');
 INSERT INTO qgep.vl_infiltration_installation_emergency_spillway (value_fr) VALUES ('au_cours_d_eau_recepteur');
 ALTER TABLE qgep.od_infiltration_installation ADD CONSTRAINT fkey_vl_infiltration_installation_emergency_spillway FOREIGN KEY (emergency_spillway)
 REFERENCES qgep.vl_infiltration_installation_emergency_spillway (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_infiltration_installation_emergency_spillway (value_en) VALUES ('surface_discharge');
 INSERT INTO qgep.vl_infiltration_installation_emergency_spillway (value_de) VALUES ('oberflaechlichausmuendend');
 INSERT INTO qgep.vl_infiltration_installation_emergency_spillway (value_fr) VALUES ('deversement_en_surface');
 ALTER TABLE qgep.od_infiltration_installation ADD CONSTRAINT fkey_vl_infiltration_installation_emergency_spillway FOREIGN KEY (emergency_spillway)
 REFERENCES qgep.vl_infiltration_installation_emergency_spillway (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_infiltration_installation_emergency_spillway (value_en) VALUES ('in_combined_waste_water_drain');
 INSERT INTO qgep.vl_infiltration_installation_emergency_spillway (value_de) VALUES ('inMischwasserkanalisation');
 INSERT INTO qgep.vl_infiltration_installation_emergency_spillway (value_fr) VALUES ('dans_egouts_eaux_mixtes');
 ALTER TABLE qgep.od_infiltration_installation ADD CONSTRAINT fkey_vl_infiltration_installation_emergency_spillway FOREIGN KEY (emergency_spillway)
 REFERENCES qgep.vl_infiltration_installation_emergency_spillway (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_infiltration_installation_emergency_spillway (value_en) VALUES ('in_rain_waste_water_drain');
 INSERT INTO qgep.vl_infiltration_installation_emergency_spillway (value_de) VALUES ('inRegenwasserkanalisation');
 INSERT INTO qgep.vl_infiltration_installation_emergency_spillway (value_fr) VALUES ('dans_canalisation_eaux_pluviales');
 ALTER TABLE qgep.od_infiltration_installation ADD CONSTRAINT fkey_vl_infiltration_installation_emergency_spillway FOREIGN KEY (emergency_spillway)
 REFERENCES qgep.vl_infiltration_installation_emergency_spillway (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_infiltration_installation_emergency_spillway (value_en) VALUES ('unknown');
 INSERT INTO qgep.vl_infiltration_installation_emergency_spillway (value_de) VALUES ('unbekannt');
 INSERT INTO qgep.vl_infiltration_installation_emergency_spillway (value_fr) VALUES ('inconnu');
 ALTER TABLE qgep.od_infiltration_installation ADD CONSTRAINT fkey_vl_infiltration_installation_emergency_spillway FOREIGN KEY (emergency_spillway)
 REFERENCES qgep.vl_infiltration_installation_emergency_spillway (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_infiltration_installation_labeling
(
code serial NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_infiltration_installation_labeling_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_infiltration_installation_labeling (value_en) VALUES ('labeled');
 INSERT INTO qgep.vl_infiltration_installation_labeling (value_de) VALUES ('beschriftet');
 INSERT INTO qgep.vl_infiltration_installation_labeling (value_fr) VALUES ('signale');
 ALTER TABLE qgep.od_infiltration_installation ADD CONSTRAINT fkey_vl_infiltration_installation_labeling FOREIGN KEY (labeling)
 REFERENCES qgep.vl_infiltration_installation_labeling (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_infiltration_installation_labeling (value_en) VALUES ('not_labeled');
 INSERT INTO qgep.vl_infiltration_installation_labeling (value_de) VALUES ('nichtbeschriftet');
 INSERT INTO qgep.vl_infiltration_installation_labeling (value_fr) VALUES ('non_signale');
 ALTER TABLE qgep.od_infiltration_installation ADD CONSTRAINT fkey_vl_infiltration_installation_labeling FOREIGN KEY (labeling)
 REFERENCES qgep.vl_infiltration_installation_labeling (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_infiltration_installation_labeling (value_en) VALUES ('unknown');
 INSERT INTO qgep.vl_infiltration_installation_labeling (value_de) VALUES ('unbekannt');
 INSERT INTO qgep.vl_infiltration_installation_labeling (value_fr) VALUES ('inconnu');
 ALTER TABLE qgep.od_infiltration_installation ADD CONSTRAINT fkey_vl_infiltration_installation_labeling FOREIGN KEY (labeling)
 REFERENCES qgep.vl_infiltration_installation_labeling (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_infiltration_installation_seepage_utilization
(
code serial NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_infiltration_installation_seepage_utilization_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_infiltration_installation_seepage_utilization (value_en) VALUES ('clean_water');
 INSERT INTO qgep.vl_infiltration_installation_seepage_utilization (value_de) VALUES ('Reinabwasser');
 INSERT INTO qgep.vl_infiltration_installation_seepage_utilization (value_fr) VALUES ('eaux_claires');
 ALTER TABLE qgep.od_infiltration_installation ADD CONSTRAINT fkey_vl_infiltration_installation_seepage_utilization FOREIGN KEY (seepage_utilization)
 REFERENCES qgep.vl_infiltration_installation_seepage_utilization (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_infiltration_installation_seepage_utilization (value_en) VALUES ('rain_water');
 INSERT INTO qgep.vl_infiltration_installation_seepage_utilization (value_de) VALUES ('Regenabwasser');
 INSERT INTO qgep.vl_infiltration_installation_seepage_utilization (value_fr) VALUES ('eaux_pluviales');
 ALTER TABLE qgep.od_infiltration_installation ADD CONSTRAINT fkey_vl_infiltration_installation_seepage_utilization FOREIGN KEY (seepage_utilization)
 REFERENCES qgep.vl_infiltration_installation_seepage_utilization (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_infiltration_installation_seepage_utilization (value_en) VALUES ('unknown');
 INSERT INTO qgep.vl_infiltration_installation_seepage_utilization (value_de) VALUES ('unbekannt');
 INSERT INTO qgep.vl_infiltration_installation_seepage_utilization (value_fr) VALUES ('inconnu');
 ALTER TABLE qgep.od_infiltration_installation ADD CONSTRAINT fkey_vl_infiltration_installation_seepage_utilization FOREIGN KEY (seepage_utilization)
 REFERENCES qgep.vl_infiltration_installation_seepage_utilization (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_infiltration_installation_type
(
code serial NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_infiltration_installation_type_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_infiltration_installation_type (value_en) VALUES ('percolation_basin');
 INSERT INTO qgep.vl_infiltration_installation_type (value_de) VALUES ('Versickerungsbecken');
 INSERT INTO qgep.vl_infiltration_installation_type (value_fr) VALUES ('bassin_d_infiltration');
 ALTER TABLE qgep.od_infiltration_installation ADD CONSTRAINT fkey_vl_infiltration_installation_type FOREIGN KEY (type)
 REFERENCES qgep.vl_infiltration_installation_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_infiltration_installation_type (value_en) VALUES ('gravel_formation');
 INSERT INTO qgep.vl_infiltration_installation_type (value_de) VALUES ('Kieskoerper');
 INSERT INTO qgep.vl_infiltration_installation_type (value_fr) VALUES ('corps_de_gravier');
 ALTER TABLE qgep.od_infiltration_installation ADD CONSTRAINT fkey_vl_infiltration_installation_type FOREIGN KEY (type)
 REFERENCES qgep.vl_infiltration_installation_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_infiltration_installation_type (value_en) VALUES ('percolation_manhole');
 INSERT INTO qgep.vl_infiltration_installation_type (value_de) VALUES ('Versickerungsschacht');
 INSERT INTO qgep.vl_infiltration_installation_type (value_fr) VALUES ('puits_d_infiltration');
 ALTER TABLE qgep.od_infiltration_installation ADD CONSTRAINT fkey_vl_infiltration_installation_type FOREIGN KEY (type)
 REFERENCES qgep.vl_infiltration_installation_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_infiltration_installation_type (value_en) VALUES ('unknown');
 INSERT INTO qgep.vl_infiltration_installation_type (value_de) VALUES ('unbekannt');
 INSERT INTO qgep.vl_infiltration_installation_type (value_fr) VALUES ('inconnu');
 ALTER TABLE qgep.od_infiltration_installation ADD CONSTRAINT fkey_vl_infiltration_installation_type FOREIGN KEY (type)
 REFERENCES qgep.vl_infiltration_installation_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_infiltration_installation_type (value_en) VALUES ('surface_percolation');
 INSERT INTO qgep.vl_infiltration_installation_type (value_de) VALUES ('Flaechenfoermige_Versickerung');
 INSERT INTO qgep.vl_infiltration_installation_type (value_fr) VALUES ('infiltration_superficielle_sur_place');
 ALTER TABLE qgep.od_infiltration_installation ADD CONSTRAINT fkey_vl_infiltration_installation_type FOREIGN KEY (type)
 REFERENCES qgep.vl_infiltration_installation_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_infiltration_installation_type (value_en) VALUES ('percolation_over_the_shoulder');
 INSERT INTO qgep.vl_infiltration_installation_type (value_de) VALUES ('Versickerung_ueber_die_Schulter');
 INSERT INTO qgep.vl_infiltration_installation_type (value_fr) VALUES ('infiltration_par_les_bas_cotes');
 ALTER TABLE qgep.od_infiltration_installation ADD CONSTRAINT fkey_vl_infiltration_installation_type FOREIGN KEY (type)
 REFERENCES qgep.vl_infiltration_installation_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_infiltration_installation_type (value_en) VALUES ('depression_percolation');
 INSERT INTO qgep.vl_infiltration_installation_type (value_de) VALUES ('MuldenRigolenversickerung');
 INSERT INTO qgep.vl_infiltration_installation_type (value_fr) VALUES ('cuvettes_rigoles_filtrantes');
 ALTER TABLE qgep.od_infiltration_installation ADD CONSTRAINT fkey_vl_infiltration_installation_type FOREIGN KEY (type)
 REFERENCES qgep.vl_infiltration_installation_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_infiltration_installation_type (value_en) VALUES ('with_soil_passage');
 INSERT INTO qgep.vl_infiltration_installation_type (value_de) VALUES ('andere_mit_Bodenpassage');
 INSERT INTO qgep.vl_infiltration_installation_type (value_fr) VALUES ('autre_avec_passage_a_travers_sol');
 ALTER TABLE qgep.od_infiltration_installation ADD CONSTRAINT fkey_vl_infiltration_installation_type FOREIGN KEY (type)
 REFERENCES qgep.vl_infiltration_installation_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_infiltration_installation_type (value_en) VALUES ('percolation_gallery');
 INSERT INTO qgep.vl_infiltration_installation_type (value_de) VALUES ('Versickerungsstrang_Galerie');
 INSERT INTO qgep.vl_infiltration_installation_type (value_fr) VALUES ('bande_infiltration_galerie');
 ALTER TABLE qgep.od_infiltration_installation ADD CONSTRAINT fkey_vl_infiltration_installation_type FOREIGN KEY (type)
 REFERENCES qgep.vl_infiltration_installation_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_infiltration_installation_type (value_en) VALUES ('combination_manhole_pipe');
 INSERT INTO qgep.vl_infiltration_installation_type (value_de) VALUES ('Kombination_Schacht_Strang');
 INSERT INTO qgep.vl_infiltration_installation_type (value_fr) VALUES ('combinaison_puits_bande');
 ALTER TABLE qgep.od_infiltration_installation ADD CONSTRAINT fkey_vl_infiltration_installation_type FOREIGN KEY (type)
 REFERENCES qgep.vl_infiltration_installation_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_infiltration_installation_type (value_en) VALUES ('without_soil_passage');
 INSERT INTO qgep.vl_infiltration_installation_type (value_de) VALUES ('andere_ohne_Bodenpassage');
 INSERT INTO qgep.vl_infiltration_installation_type (value_fr) VALUES ('autre_sans_passage_a_travers_sol');
 ALTER TABLE qgep.od_infiltration_installation ADD CONSTRAINT fkey_vl_infiltration_installation_type FOREIGN KEY (type)
 REFERENCES qgep.vl_infiltration_installation_type (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_infiltration_installation_vehicle_access
(
code serial NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_infiltration_installation_vehicle_access_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_infiltration_installation_vehicle_access (value_en) VALUES ('accessible');
 INSERT INTO qgep.vl_infiltration_installation_vehicle_access (value_de) VALUES ('zugaenglich');
 INSERT INTO qgep.vl_infiltration_installation_vehicle_access (value_fr) VALUES ('accessible');
 ALTER TABLE qgep.od_infiltration_installation ADD CONSTRAINT fkey_vl_infiltration_installation_vehicle_access FOREIGN KEY (vehicle_access)
 REFERENCES qgep.vl_infiltration_installation_vehicle_access (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_infiltration_installation_vehicle_access (value_en) VALUES ('inaccessible');
 INSERT INTO qgep.vl_infiltration_installation_vehicle_access (value_de) VALUES ('unzugaenglich');
 INSERT INTO qgep.vl_infiltration_installation_vehicle_access (value_fr) VALUES ('inaccessible');
 ALTER TABLE qgep.od_infiltration_installation ADD CONSTRAINT fkey_vl_infiltration_installation_vehicle_access FOREIGN KEY (vehicle_access)
 REFERENCES qgep.vl_infiltration_installation_vehicle_access (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_infiltration_installation_vehicle_access (value_en) VALUES ('unknown');
 INSERT INTO qgep.vl_infiltration_installation_vehicle_access (value_de) VALUES ('unbekannt');
 INSERT INTO qgep.vl_infiltration_installation_vehicle_access (value_fr) VALUES ('inconnu');
 ALTER TABLE qgep.od_infiltration_installation ADD CONSTRAINT fkey_vl_infiltration_installation_vehicle_access FOREIGN KEY (vehicle_access)
 REFERENCES qgep.vl_infiltration_installation_vehicle_access (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_infiltration_installation_watertightness
(
code serial NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_infiltration_installation_watertightness_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_infiltration_installation_watertightness (value_en) VALUES ('watertight');
 INSERT INTO qgep.vl_infiltration_installation_watertightness (value_de) VALUES ('wasserdicht');
 INSERT INTO qgep.vl_infiltration_installation_watertightness (value_fr) VALUES ('etanche');
 ALTER TABLE qgep.od_infiltration_installation ADD CONSTRAINT fkey_vl_infiltration_installation_watertightness FOREIGN KEY (watertightness)
 REFERENCES qgep.vl_infiltration_installation_watertightness (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_infiltration_installation_watertightness (value_en) VALUES ('not_watertight');
 INSERT INTO qgep.vl_infiltration_installation_watertightness (value_de) VALUES ('nichtwasserdicht');
 INSERT INTO qgep.vl_infiltration_installation_watertightness (value_fr) VALUES ('non_etanche');
 ALTER TABLE qgep.od_infiltration_installation ADD CONSTRAINT fkey_vl_infiltration_installation_watertightness FOREIGN KEY (watertightness)
 REFERENCES qgep.vl_infiltration_installation_watertightness (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_infiltration_installation_watertightness (value_en) VALUES ('unknown');
 INSERT INTO qgep.vl_infiltration_installation_watertightness (value_de) VALUES ('unbekannt');
 INSERT INTO qgep.vl_infiltration_installation_watertightness (value_fr) VALUES ('inconnu');
 ALTER TABLE qgep.od_infiltration_installation ADD CONSTRAINT fkey_vl_infiltration_installation_watertightness FOREIGN KEY (watertightness)
 REFERENCES qgep.vl_infiltration_installation_watertightness (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_reach ADD CONSTRAINT oorel133 FOREIGN KEY (obj_id) REFERENCES qgep.od_wastewater_networkelement(obj_id);
CREATE TABLE qgep.vl_reach_horizontal_positioning
(
code serial NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_reach_horizontal_positioning_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_reach_horizontal_positioning (value_en) VALUES ('accurate');
 INSERT INTO qgep.vl_reach_horizontal_positioning (value_de) VALUES ('genau');
 INSERT INTO qgep.vl_reach_horizontal_positioning (value_fr) VALUES ('precis');
 ALTER TABLE qgep.od_reach ADD CONSTRAINT fkey_vl_reach_horizontal_positioning FOREIGN KEY (horizontal_positioning)
 REFERENCES qgep.vl_reach_horizontal_positioning (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_reach_horizontal_positioning (value_en) VALUES ('inaccurate');
 INSERT INTO qgep.vl_reach_horizontal_positioning (value_de) VALUES ('ungenau');
 INSERT INTO qgep.vl_reach_horizontal_positioning (value_fr) VALUES ('imprecis');
 ALTER TABLE qgep.od_reach ADD CONSTRAINT fkey_vl_reach_horizontal_positioning FOREIGN KEY (horizontal_positioning)
 REFERENCES qgep.vl_reach_horizontal_positioning (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_reach_horizontal_positioning (value_en) VALUES ('unknown');
 INSERT INTO qgep.vl_reach_horizontal_positioning (value_de) VALUES ('unbekannt');
 INSERT INTO qgep.vl_reach_horizontal_positioning (value_fr) VALUES ('inconnu');
 ALTER TABLE qgep.od_reach ADD CONSTRAINT fkey_vl_reach_horizontal_positioning FOREIGN KEY (horizontal_positioning)
 REFERENCES qgep.vl_reach_horizontal_positioning (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_reach_inside_coating
(
code serial NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_reach_inside_coating_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_reach_inside_coating (value_en) VALUES ('coating');
 INSERT INTO qgep.vl_reach_inside_coating (value_de) VALUES ('Anstrich_Beschichtung');
 INSERT INTO qgep.vl_reach_inside_coating (value_fr) VALUES ('peinture_revetement');
 ALTER TABLE qgep.od_reach ADD CONSTRAINT fkey_vl_reach_inside_coating FOREIGN KEY (inside_coating)
 REFERENCES qgep.vl_reach_inside_coating (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_reach_inside_coating (value_en) VALUES ('cement_mortar_lining');
 INSERT INTO qgep.vl_reach_inside_coating (value_de) VALUES ('Zementmoertelauskleidung');
 INSERT INTO qgep.vl_reach_inside_coating (value_fr) VALUES ('revetement_en_mortier_de_ciment');
 ALTER TABLE qgep.od_reach ADD CONSTRAINT fkey_vl_reach_inside_coating FOREIGN KEY (inside_coating)
 REFERENCES qgep.vl_reach_inside_coating (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_reach_inside_coating (value_en) VALUES ('brick_lining');
 INSERT INTO qgep.vl_reach_inside_coating (value_de) VALUES ('Kanalklinkerauskleidung');
 INSERT INTO qgep.vl_reach_inside_coating (value_fr) VALUES ('revetement_en_brique');
 ALTER TABLE qgep.od_reach ADD CONSTRAINT fkey_vl_reach_inside_coating FOREIGN KEY (inside_coating)
 REFERENCES qgep.vl_reach_inside_coating (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_reach_inside_coating (value_en) VALUES ('stoneware_lining');
 INSERT INTO qgep.vl_reach_inside_coating (value_de) VALUES ('Steinzeugauskleidung');
 INSERT INTO qgep.vl_reach_inside_coating (value_fr) VALUES ('revetement_en_gres');
 ALTER TABLE qgep.od_reach ADD CONSTRAINT fkey_vl_reach_inside_coating FOREIGN KEY (inside_coating)
 REFERENCES qgep.vl_reach_inside_coating (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_reach_inside_coating (value_en) VALUES ('other');
 INSERT INTO qgep.vl_reach_inside_coating (value_de) VALUES ('andere');
 INSERT INTO qgep.vl_reach_inside_coating (value_fr) VALUES ('autres');
 ALTER TABLE qgep.od_reach ADD CONSTRAINT fkey_vl_reach_inside_coating FOREIGN KEY (inside_coating)
 REFERENCES qgep.vl_reach_inside_coating (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_reach_inside_coating (value_en) VALUES ('unknown');
 INSERT INTO qgep.vl_reach_inside_coating (value_de) VALUES ('unbekannt');
 INSERT INTO qgep.vl_reach_inside_coating (value_fr) VALUES ('inconnu');
 ALTER TABLE qgep.od_reach ADD CONSTRAINT fkey_vl_reach_inside_coating FOREIGN KEY (inside_coating)
 REFERENCES qgep.vl_reach_inside_coating (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qgep.vl_reach_material
(
code serial NOT NULL,
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_reach_material_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_reach_material (value_en) VALUES ('fiber_cement');
 INSERT INTO qgep.vl_reach_material (value_de) VALUES ('Faserzement');
 INSERT INTO qgep.vl_reach_material (value_fr) VALUES ('fibrociment');
 ALTER TABLE qgep.od_reach ADD CONSTRAINT fkey_vl_reach_material FOREIGN KEY (material)
 REFERENCES qgep.vl_reach_material (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_reach_material (value_en) VALUES ('cast_ductile_iron');
 INSERT INTO qgep.vl_reach_material (value_de) VALUES ('Guss_duktil');
 INSERT INTO qgep.vl_reach_material (value_fr) VALUES ('fonte_ductile');
 ALTER TABLE qgep.od_reach ADD CONSTRAINT fkey_vl_reach_material FOREIGN KEY (material)
 REFERENCES qgep.vl_reach_material (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_reach_material (value_en) VALUES ('steel');
 INSERT INTO qgep.vl_reach_material (value_de) VALUES ('Stahl');
 INSERT INTO qgep.vl_reach_material (value_fr) VALUES ('acier');
 ALTER TABLE qgep.od_reach ADD CONSTRAINT fkey_vl_reach_material FOREIGN KEY (material)
 REFERENCES qgep.vl_reach_material (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_reach_material (value_en) VALUES ('stoneware');
 INSERT INTO qgep.vl_reach_material (value_de) VALUES ('Steinzeug');
 INSERT INTO qgep.vl_reach_material (value_fr) VALUES ('gres');
 ALTER TABLE qgep.od_reach ADD CONSTRAINT fkey_vl_reach_material FOREIGN KEY (material)
 REFERENCES qgep.vl_reach_material (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_reach_material (value_en) VALUES ('asbestos_cement');
 INSERT INTO qgep.vl_reach_material (value_de) VALUES ('Asbestzement');
 INSERT INTO qgep.vl_reach_material (value_fr) VALUES ('amiante_ciment');
 ALTER TABLE qgep.od_reach ADD CONSTRAINT fkey_vl_reach_material FOREIGN KEY (material)
 REFERENCES qgep.vl_reach_material (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_reach_material (value_en) VALUES ('bricks');
 INSERT INTO qgep.vl_reach_material (value_de) VALUES ('Gebrannte_Steine');
 INSERT INTO qgep.vl_reach_material (value_fr) VALUES ('terre_cuite');
 ALTER TABLE qgep.od_reach ADD CONSTRAINT fkey_vl_reach_material FOREIGN KEY (material)
 REFERENCES qgep.vl_reach_material (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
 INSERT INTO qgep.vl_reach_material (value_en) VALUES ('clay');
 INSERT INTO qgep.vl_reach_material (value_de) VALUES ('Ton');
 INSERT INTO qgep.vl_reach_material (value_fr) VALUES ('argile');
 ALTER TABLE qgep.od_reach ADD CONSTRAINT fke


COMMIT;
