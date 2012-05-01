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
 ALTER TABLE qgep.od_wastewater_structure ADD COLUMN depth  smallint ;
COMMENT ON COLUMN qgep.od_wastewater_structure.depth IS 'yy_Funktion (berechneter Wert) = zugehöriger Abwasserknoten.Sohlenkote minus Deckel.Kote (falls Sohlenkote nicht seperat erfasst, dann ist es die tiefer liegende Haltungspunkt.Kote). Siehe auch SIA 405 2015 4.3.4. / Funktion (berechneter Wert) = zugehörig';
SELECT AddGeometryColumn('qgep', 'od_wastewater_structure', 'detail_geometry_geometry', 21781, 'POLYGON', 2);
COMMENT ON COLUMN qgep.od_wastewater_structure.detail_geometry_geometry IS ' / Detaillierte Geometrie insbesondere bei Spezialbauwerken. Bei Normschächten mit Dimension1 und 2 arbeiten. Dito bei normierten Versickerungsanlagen. In INTERLIS OPTIONAL gesetzt, da nicht bei allen Abwasserbauwerken zwingend. Kanäle haben normalerweise';
SELECT AddGeometryColumn('qgep', 'od_wastewater_structure', 'detail_geometry3d_geometry', 21781, 'POLYGON', 2);
COMMENT ON COLUMN qgep.od_wastewater_structure.detail_geometry3d_geometry IS 'yyy / Detaillierte Geometrie (3D) insbesondere bei Spezialbauwerken. Bei Normschächten mit Dimension1 und 2 arbeiten. Dito bei normierten Versickerungsanlagen. In INTERLIS / GEOMETRIE_DETAILLEE3D: Géométrie détaillée particulièrement pour un OUVRAGE_SPECI';
 ALTER TABLE qgep.od_wastewater_structure ADD COLUMN disposition_state  varchar(50) ;
COMMENT ON COLUMN qgep.od_wastewater_structure.disposition_state IS 'yyy_Betriebs- und Planungszustand in dem sich das Abwasserbauwerk befindet / Betriebs- und Planungszustand in dem sich das Abwasserbauwerk befindet / Etat de fonctionnement et de planification';
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
CREATE TABLE qgep.od_reach_point
(
   obj_id  varchar(36) NOT NULL,
   CONSTRAINT pkey_qgep_od_reach_point_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_reach_point.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_reach_point ADD COLUMN elevation_accuracy  varchar(50) ;
COMMENT ON COLUMN qgep.od_reach_point.elevation_accuracy IS 'yyy_Quantifizierung der Genauigkeit der Höhenlage der Kote in Relation zum Höhenfixpunktnetz (z.B. Grundbuchvermessung oder Landesnivellement). / Quantifizierung der Genauigkeit der Höhenlage der Kote in Relation zum Höhenfixpunktnetz (z.B. Grundbuchverme';
 ALTER TABLE qgep.od_reach_point ADD COLUMN identifier  varchar(20) ;
 CREATE UNIQUE INDEX in_od_reach_point_identifier ON qgep.od_reach_point USING btree (identifier);
COMMENT ON COLUMN qgep.od_reach_point.identifier IS ' /  / ';
 ALTER TABLE qgep.od_reach_point ADD COLUMN level  decimal(4,3) ;
COMMENT ON COLUMN qgep.od_reach_point.level IS 'yyy / Sohlenhöhe des Haltungsendes / Cote du radier de la fin du tronçon';
 ALTER TABLE qgep.od_reach_point ADD COLUMN outlet_shape  varchar(50) ;
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
CREATE TABLE qgep.od_manhole
(
   obj_id  varchar(36) NOT NULL,
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
COMMENT ON COLUMN qgep.od_manhole.dimension2 IS ' / Dimension2 des Schachtes (kleinstes Innenmass). Bei runden Schächten wird Dimension2 leer gelassen, bei ovalen abgefüllt. Für eckige Schächte Detailgeometrie verwenden. / Dimension2 de la chambre (plus petite mesure intérieure).';
 ALTER TABLE qgep.od_manhole ADD COLUMN function  varchar(50) ;
COMMENT ON COLUMN qgep.od_manhole.function IS ' n';
 ALTER TABLE qgep.od_manhole ADD COLUMN material  varchar(50) ;
COMMENT ON COLUMN qgep.od_manhole.material IS ' .';
 ALTER TABLE qgep.od_manhole ADD COLUMN surface_inflow  varchar(50) ;
COMMENT ON COLUMN qgep.od_manhole.surface_inflow IS ' e';
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
 ALTER TABLE qgep.od_reach ADD COLUMN coefficient_of_friction  smallint ;
COMMENT ON COLUMN qgep.od_reach.coefficient_of_friction IS 'yyy http://www.linguee.com/english-german/search?source=auto&query=reibungsbeiwert / Hydraulische Kenngrösse zur Beschreibung der Beschaffenheit der Kanalwandung. Beiwert für die Formeln nach Manning-Strickler (K oder kstr) / Constante de rugosité selon M';
 ALTER TABLE qgep.od_reach ADD COLUMN depth  smallint ;
COMMENT ON COLUMN qgep.od_reach.depth IS 'yyy_Maximale Innenhöhe des Kanalprofiles / Maximale Innenhöhe des Kanalprofiles / Hauteur intérieure maximale du profil';
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
CREATE TABLE qgep.vl_structure_part_renovation_demand
(
code character varying(50),
value_en character varying(50),
value_de character varying(50),
value_fr character varying(50),
active boolean,
CONSTRAINT pkey_qgep_vl_structure_part_renovation_demand_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
 INSERT INTO qgep.vl_structure_part_renovation_demand (code, value_en, value_de, value_fr) VALUES ('137','necessary','notwendig','necessaire');
 INSERT INTO qgep.vl_structure_part_renovation_demand (code, value_en, value_de, value_fr) VALUES ('138','not_necessary','nicht_notwendig','pas_necessaire');
 INSERT INTO qgep.vl_structure_part_renovation_demand (code, value_en, value_de, value_fr) VALUES ('3042','unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_structure_part ADD CONSTRAINT fkey_vl_structure_part_renovation_demand FOREIGN KEY (renovation_demand)
 REFERENCES qgep.vl_structure_part_renovation_demand (code) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_structure_part ADD COLUMN wastewater_structure varchar (36);
ALTER TABLE qgep.od_structure_part ADD CONSTRAINT rel_OD_BAUWERKSTEIL_OD_ABWASSERBAUWERK FOREIGN KEY (qgep.fs_wastewater_structure) REFERENCES qgep.od_wastewater_structure(obj_id);
ALTER TABLE qgep.od_wastewater_networkelement ADD COLUMN wastewater_structure varchar (36);
ALTER TABLE qgep.od_wastewater_networkelement ADD CONSTRAINT rel_OD_ABWASSERNETZELEMENT_OD_ABWASSERBAUWERK FOREIGN KEY (qgep.fs_wastewater_structure) REFERENCES qgep.od_wastewater_structure(obj_id);
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
 INSERT INTO qgep.vl_pipe_profile_profile_type (code, value_en, value_de, value_fr) VALUES ('3350','circular_profile','Kreisprofil','circulaire');
 INSERT INTO qgep.vl_pipe_profile_profile_type (code, value_en, value_de, value_fr) VALUES ('3351','egg_profile','Eiprofil','ovoide');
 INSERT INTO qgep.vl_pipe_profile_profile_type (code, value_en, value_de, value_fr) VALUES ('3352','mouth_profile','Maulprofil','profil_en_voute');
 INSERT INTO qgep.vl_pipe_profile_profile_type (code, value_en, value_de, value_fr) VALUES ('3353','rectangular_profile','Rechteckprofil','rectangulaire');
 INSERT INTO qgep.vl_pipe_profile_profile_type (code, value_en, value_de, value_fr) VALUES ('3354','open_profile','offenes_Profil','profil_ouvert');
 INSERT INTO qgep.vl_pipe_profile_profile_type (code, value_en, value_de, value_fr) VALUES ('3355','special_profile','Spezialprofil','profil_special');
 INSERT INTO qgep.vl_pipe_profile_profile_type (code, value_en, value_de, value_fr) VALUES ('3356','other','andere','autres');
 INSERT INTO qgep.vl_pipe_profile_profile_type (code, value_en, value_de, value_fr) VALUES ('3357','unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_pipe_profile ADD CONSTRAINT fkey_vl_pipe_profile_profile_type FOREIGN KEY (profile_type)
 REFERENCES qgep.vl_pipe_profile_profile_type varchar(36) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
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
 INSERT INTO qgep.vl_wastewater_structure_accessibility (code, value_en, value_de, value_fr) VALUES ('3444','covered','ueberdeckt','couvert');
 INSERT INTO qgep.vl_wastewater_structure_accessibility (code, value_en, value_de, value_fr) VALUES ('3445','accessible','zugaenglich','accessible');
 INSERT INTO qgep.vl_wastewater_structure_accessibility (code, value_en, value_de, value_fr) VALUES ('3446','inaccessible','unzugaenglich','inaccessible');
 INSERT INTO qgep.vl_wastewater_structure_accessibility (code, value_en, value_de, value_fr) VALUES ('3447','unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_wastewater_structure ADD CONSTRAINT fkey_vl_wastewater_structure_accessibility FOREIGN KEY (accessibility)
 REFERENCES qgep.vl_wastewater_structure_accessibility varchar(36) MATCH SIMPLE 
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
 INSERT INTO qgep.vl_wastewater_structure_disposition_state (code, value_en, value_de, value_fr) VALUES ('10','tentative','provisorisch','provisoire');
 INSERT INTO qgep.vl_wastewater_structure_disposition_state (code, value_en, value_de, value_fr) VALUES ('2683','will_be_suspended','wird_aufgehoben','sera_supprime');
 INSERT INTO qgep.vl_wastewater_structure_disposition_state (code, value_en, value_de, value_fr) VALUES ('2763','calculation_alternative','Berechnungsvariante','variante_de_calcul');
 INSERT INTO qgep.vl_wastewater_structure_disposition_state (code, value_en, value_de, value_fr) VALUES ('2764','planned','geplant','planifie');
 INSERT INTO qgep.vl_wastewater_structure_disposition_state (code, value_en, value_de, value_fr) VALUES ('3027','unknown','unbekannt','inconnu');
 INSERT INTO qgep.vl_wastewater_structure_disposition_state (code, value_en, value_de, value_fr) VALUES ('3325','suspended_unknown','aufgehoben_unbekannt','supprime_inconnu');
 INSERT INTO qgep.vl_wastewater_structure_disposition_state (code, value_en, value_de, value_fr) VALUES ('3633','nonoperational','ausser_Betrieb','hors_service');
 INSERT INTO qgep.vl_wastewater_structure_disposition_state (code, value_en, value_de, value_fr) VALUES ('3634','operational','in_Betrieb','en_service');
 INSERT INTO qgep.vl_wastewater_structure_disposition_state (code, value_en, value_de, value_fr) VALUES ('3653','project','Projekt','projet');
 INSERT INTO qgep.vl_wastewater_structure_disposition_state (code, value_en, value_de, value_fr) VALUES ('7','suspended_not_filled','aufgehoben_nicht_verfuellt','supprime_non_demoli');
 INSERT INTO qgep.vl_wastewater_structure_disposition_state (code, value_en, value_de, value_fr) VALUES ('8','filled','verfuellt','demoli');
 ALTER TABLE qgep.od_wastewater_structure ADD CONSTRAINT fkey_vl_wastewater_structure_disposition_state FOREIGN KEY (disposition_state)
 REFERENCES qgep.vl_wastewater_structure_disposition_state varchar(36) MATCH SIMPLE 
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
 INSERT INTO qgep.vl_wastewater_structure_renovation_demand (code, value_en, value_de, value_fr) VALUES ('1','urgent','dringend','urgent');
 INSERT INTO qgep.vl_wastewater_structure_renovation_demand (code, value_en, value_de, value_fr) VALUES ('2','short_term','kurzfristig','a_court_terme');
 INSERT INTO qgep.vl_wastewater_structure_renovation_demand (code, value_en, value_de, value_fr) VALUES ('3','medium_term','mittelfristig','a_moyen_terme');
 INSERT INTO qgep.vl_wastewater_structure_renovation_demand (code, value_en, value_de, value_fr) VALUES ('3023','unknown','unbekannt','inconnu');
 INSERT INTO qgep.vl_wastewater_structure_renovation_demand (code, value_en, value_de, value_fr) VALUES ('4','long_term','langfristig','a_long_terme');
 INSERT INTO qgep.vl_wastewater_structure_renovation_demand (code, value_en, value_de, value_fr) VALUES ('5','no','keiner','aucun');
 ALTER TABLE qgep.od_wastewater_structure ADD CONSTRAINT fkey_vl_wastewater_structure_renovation_demand FOREIGN KEY (renovation_demand)
 REFERENCES qgep.vl_wastewater_structure_renovation_demand varchar(36) MATCH SIMPLE 
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
 INSERT INTO qgep.vl_wastewater_structure_structure_condition (code, value_en, value_de, value_fr) VALUES ('3037','unknown','unbekannt','inconnu');
 INSERT INTO qgep.vl_wastewater_structure_structure_condition (code, value_en, value_de, value_fr) VALUES ('3359','Z1','Z1','Z1');
 INSERT INTO qgep.vl_wastewater_structure_structure_condition (code, value_en, value_de, value_fr) VALUES ('3360','Z2','Z2','Z2');
 INSERT INTO qgep.vl_wastewater_structure_structure_condition (code, value_en, value_de, value_fr) VALUES ('3361','Z3','Z3','Z3');
 INSERT INTO qgep.vl_wastewater_structure_structure_condition (code, value_en, value_de, value_fr) VALUES ('3362','Z4','Z4','Z4');
 INSERT INTO qgep.vl_wastewater_structure_structure_condition (code, value_en, value_de, value_fr) VALUES ('3363','Z0','Z0','Z0');
 ALTER TABLE qgep.od_wastewater_structure ADD CONSTRAINT fkey_vl_wastewater_structure_structure_condition FOREIGN KEY (structure_condition)
 REFERENCES qgep.vl_wastewater_structure_structure_condition varchar(36) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_wastewater_structure ADD COLUMN owner varchar (36);
ALTER TABLE qgep.od_wastewater_structure ADD CONSTRAINT rel_OD_ABWASSERBAUWERK_OD_ORGANISATION FOREIGN KEY (qgep.fs_owner) REFERENCES qgep.od_organisation(obj_id);
ALTER TABLE qgep.od_wastewater_structure ADD COLUMN operator varchar (36);
ALTER TABLE qgep.od_wastewater_structure ADD CONSTRAINT rel_OD_ABWASSERBAUWERK_OD_ORGANISATION FOREIGN KEY (qgep.fs_operator) REFERENCES qgep.od_organisation(obj_id);
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
 INSERT INTO qgep.vl_reach_point_elevation_accuracy (code, value_en, value_de, value_fr) VALUES ('3245','plusminus_1cm','plusminus_1cm','plus_moins_1cm');
 INSERT INTO qgep.vl_reach_point_elevation_accuracy (code, value_en, value_de, value_fr) VALUES ('3246','plusminus_3cm','plusminus_3cm','plus_moins_3cm');
 INSERT INTO qgep.vl_reach_point_elevation_accuracy (code, value_en, value_de, value_fr) VALUES ('3247','plusminus_6cm','plusminus_6cm','plus_moins_6cm');
 INSERT INTO qgep.vl_reach_point_elevation_accuracy (code, value_en, value_de, value_fr) VALUES ('3248','more_than_6cm','groesser_6cm','plusque_6cm');
 INSERT INTO qgep.vl_reach_point_elevation_accuracy (code, value_en, value_de, value_fr) VALUES ('3327','unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_reach_point ADD CONSTRAINT fkey_vl_reach_point_elevation_accuracy FOREIGN KEY (elevation_accuracy)
 REFERENCES qgep.vl_reach_point_elevation_accuracy varchar(36) MATCH SIMPLE 
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
 INSERT INTO qgep.vl_reach_point_outlet_shape (code, value_en, value_de, value_fr) VALUES ('285','round_edged','abgerundet','arrondi');
 INSERT INTO qgep.vl_reach_point_outlet_shape (code, value_en, value_de, value_fr) VALUES ('286','sharp_edged','scharfkantig','aretes_vives');
 INSERT INTO qgep.vl_reach_point_outlet_shape (code, value_en, value_de, value_fr) VALUES ('298','orifice','blendenfoermig','en_forme_de_seuil_ou_diaphragme');
 INSERT INTO qgep.vl_reach_point_outlet_shape (code, value_en, value_de, value_fr) VALUES ('3074','unknown','unbekannt','inconnu');
 INSERT INTO qgep.vl_reach_point_outlet_shape (code, value_en, value_de, value_fr) VALUES ('3358','no_cross_section_change','keine_Querschnittsaenderung','pas_de_changement_de_section');
 ALTER TABLE qgep.od_reach_point ADD CONSTRAINT fkey_vl_reach_point_outlet_shape FOREIGN KEY (outlet_shape)
 REFERENCES qgep.vl_reach_point_outlet_shape varchar(36) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_reach_point ADD COLUMN wastewater_networkelement varchar (36);
ALTER TABLE qgep.od_reach_point ADD CONSTRAINT rel_OD_HALTUNGSPUNKT_OD_ABWASSERNETZELEMENT FOREIGN KEY (qgep.fs_wastewater_networkelement) REFERENCES qgep.od_wastewater_networkelement(obj_id);
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
 INSERT INTO qgep.vl_dryweather_flume_material (code, value_en, value_de, value_fr) VALUES ('237','cement_mortar','Zementmoertel','mortier_de_ciment');
 INSERT INTO qgep.vl_dryweather_flume_material (code, value_en, value_de, value_fr) VALUES ('238','stoneware','Steinzeug','gres');
 INSERT INTO qgep.vl_dryweather_flume_material (code, value_en, value_de, value_fr) VALUES ('239','plastic','Kunststoff','plastique');
 INSERT INTO qgep.vl_dryweather_flume_material (code, value_en, value_de, value_fr) VALUES ('3017','unknown','unbekannt','inconnu');
 INSERT INTO qgep.vl_dryweather_flume_material (code, value_en, value_de, value_fr) VALUES ('3221','other','andere','autres');
 INSERT INTO qgep.vl_dryweather_flume_material (code, value_en, value_de, value_fr) VALUES ('354','combined','kombiniert','combine');
 ALTER TABLE qgep.od_dryweather_flume ADD CONSTRAINT fkey_vl_dryweather_flume_material FOREIGN KEY (material)
 REFERENCES qgep.vl_dryweather_flume_material varchar(36) MATCH SIMPLE 
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
 INSERT INTO qgep.vl_cover_cover_shape (code, value_en, value_de, value_fr) VALUES ('3498','round','rund','rond');
 INSERT INTO qgep.vl_cover_cover_shape (code, value_en, value_de, value_fr) VALUES ('3499','rectangular','eckig','anguleux');
 INSERT INTO qgep.vl_cover_cover_shape (code, value_en, value_de, value_fr) VALUES ('3500','other','andere','autres');
 INSERT INTO qgep.vl_cover_cover_shape (code, value_en, value_de, value_fr) VALUES ('3501','unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_cover ADD CONSTRAINT fkey_vl_cover_cover_shape FOREIGN KEY (cover_shape)
 REFERENCES qgep.vl_cover_cover_shape varchar(36) MATCH SIMPLE 
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
 INSERT INTO qgep.vl_cover_fastening (code, value_en, value_de, value_fr) VALUES ('174','bolted','verschraubt','visse');
 INSERT INTO qgep.vl_cover_fastening (code, value_en, value_de, value_fr) VALUES ('175','not_bolted','nicht_verschraubt','non_visse');
 INSERT INTO qgep.vl_cover_fastening (code, value_en, value_de, value_fr) VALUES ('3090','unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_cover ADD CONSTRAINT fkey_vl_cover_fastening FOREIGN KEY (fastening)
 REFERENCES qgep.vl_cover_fastening varchar(36) MATCH SIMPLE 
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
 INSERT INTO qgep.vl_cover_location_accuracy (code, value_en, value_de, value_fr) VALUES ('3236','plusminus_3cm','plusminus_3cm','plus_moins_3cm');
 INSERT INTO qgep.vl_cover_location_accuracy (code, value_en, value_de, value_fr) VALUES ('3241','plusminus_10cm','plusminus_10cm','plus_moins_10cm');
 INSERT INTO qgep.vl_cover_location_accuracy (code, value_en, value_de, value_fr) VALUES ('3242','plusminus_50cm','plusminus_50cm','plus_moins_50cm');
 INSERT INTO qgep.vl_cover_location_accuracy (code, value_en, value_de, value_fr) VALUES ('3243','more_than_50cm','groesser_50cm','plusque_50cm');
 INSERT INTO qgep.vl_cover_location_accuracy (code, value_en, value_de, value_fr) VALUES ('3326','unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_cover ADD CONSTRAINT fkey_vl_cover_location_accuracy FOREIGN KEY (location_accuracy)
 REFERENCES qgep.vl_cover_location_accuracy varchar(36) MATCH SIMPLE 
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
 INSERT INTO qgep.vl_cover_material (code, value_en, value_de, value_fr) VALUES ('233','cast_iron','Guss','fonte');
 INSERT INTO qgep.vl_cover_material (code, value_en, value_de, value_fr) VALUES ('234','concrete','Beton','beton');
 INSERT INTO qgep.vl_cover_material (code, value_en, value_de, value_fr) VALUES ('235','cast_iron_with_conrete_filling','Guss_mit_Betonfuellung','fonte_avec_remplissage_en_beton');
 INSERT INTO qgep.vl_cover_material (code, value_en, value_de, value_fr) VALUES ('236','cast_iron_with_pavement_filling','Guss_mit_Belagsfuellung','fonte_avec_remplissage_enrobe');
 INSERT INTO qgep.vl_cover_material (code, value_en, value_de, value_fr) VALUES ('2976','other','andere','autres');
 INSERT INTO qgep.vl_cover_material (code, value_en, value_de, value_fr) VALUES ('3015','unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_cover ADD CONSTRAINT fkey_vl_cover_material FOREIGN KEY (material)
 REFERENCES qgep.vl_cover_material varchar(36) MATCH SIMPLE 
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
 INSERT INTO qgep.vl_cover_sludge_bucket (code, value_en, value_de, value_fr) VALUES ('3066','unknown','unbekannt','inconnu');
 INSERT INTO qgep.vl_cover_sludge_bucket (code, value_en, value_de, value_fr) VALUES ('422','existent','vorhanden','existant');
 INSERT INTO qgep.vl_cover_sludge_bucket (code, value_en, value_de, value_fr) VALUES ('423','inexistent','nicht_vorhanden','inexistant');
 ALTER TABLE qgep.od_cover ADD CONSTRAINT fkey_vl_cover_sludge_bucket FOREIGN KEY (sludge_bucket)
 REFERENCES qgep.vl_cover_sludge_bucket varchar(36) MATCH SIMPLE 
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
 INSERT INTO qgep.vl_cover_venting (code, value_en, value_de, value_fr) VALUES ('229','vented','entlueftet','aere');
 INSERT INTO qgep.vl_cover_venting (code, value_en, value_de, value_fr) VALUES ('230','not_vented','nicht_entlueftet','non_aere');
 INSERT INTO qgep.vl_cover_venting (code, value_en, value_de, value_fr) VALUES ('3092','unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_cover ADD CONSTRAINT fkey_vl_cover_venting FOREIGN KEY (venting)
 REFERENCES qgep.vl_cover_venting varchar(36) MATCH SIMPLE 
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
 INSERT INTO qgep.vl_access_aid_type (code, value_en, value_de, value_fr) VALUES ('240','ladder','Leiter','echelle');
 INSERT INTO qgep.vl_access_aid_type (code, value_en, value_de, value_fr) VALUES ('241','step_iron','Steigeisen','echelons');
 INSERT INTO qgep.vl_access_aid_type (code, value_en, value_de, value_fr) VALUES ('243','pressurized_door','Drucktuere','porte_etanche');
 INSERT INTO qgep.vl_access_aid_type (code, value_en, value_de, value_fr) VALUES ('2977','other','andere','autres');
 INSERT INTO qgep.vl_access_aid_type (code, value_en, value_de, value_fr) VALUES ('3048','unknown','unbekannt','inconnu');
 INSERT INTO qgep.vl_access_aid_type (code, value_en, value_de, value_fr) VALUES ('3230','door','Tuere','porte');
 INSERT INTO qgep.vl_access_aid_type (code, value_en, value_de, value_fr) VALUES ('3473','staircase','Treppe','escalier');
 INSERT INTO qgep.vl_access_aid_type (code, value_en, value_de, value_fr) VALUES ('91','footstep_niches','Trittnischen','marchepieds');
 INSERT INTO qgep.vl_access_aid_type (code, value_en, value_de, value_fr) VALUES ('92','none','keine','aucun_equipement_d_acces');
 ALTER TABLE qgep.od_access_aid ADD CONSTRAINT fkey_vl_access_aid_type FOREIGN KEY (type)
 REFERENCES qgep.vl_access_aid_type varchar(36) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
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
 INSERT INTO qgep.vl_benching_type (code, value_en, value_de, value_fr) VALUES ('3033','unknown','unbekannt','inconnu');
 INSERT INTO qgep.vl_benching_type (code, value_en, value_de, value_fr) VALUES ('3211','other','andere','autres');
 INSERT INTO qgep.vl_benching_type (code, value_en, value_de, value_fr) VALUES ('3231','no','kein','aucun');
 INSERT INTO qgep.vl_benching_type (code, value_en, value_de, value_fr) VALUES ('93','onesided','einseitig','simple');
 INSERT INTO qgep.vl_benching_type (code, value_en, value_de, value_fr) VALUES ('94','double_sided','beidseitig','double');
 ALTER TABLE qgep.od_benching ADD CONSTRAINT fkey_vl_benching_type FOREIGN KEY (type)
 REFERENCES qgep.vl_benching_type varchar(36) MATCH SIMPLE 
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
 INSERT INTO qgep.vl_manhole_function (code, value_en, value_de, value_fr) VALUES ('1008','oil_separator','Oelabscheider','separateur_d_hydrocarbures');
 INSERT INTO qgep.vl_manhole_function (code, value_en, value_de, value_fr) VALUES ('204','manhole','Kontrollschacht','regard_de_visite');
 INSERT INTO qgep.vl_manhole_function (code, value_en, value_de, value_fr) VALUES ('228','rail_track_gully','Geleiseschacht','evacuation_des_eaux_des_voies_ferrees');
 INSERT INTO qgep.vl_manhole_function (code, value_en, value_de, value_fr) VALUES ('2742','slurry_collector','Schlammsammler','depotoir');
 INSERT INTO qgep.vl_manhole_function (code, value_en, value_de, value_fr) VALUES ('3266','gully','Einlaufschacht','chambre_avec_grille_d_entree');
 INSERT INTO qgep.vl_manhole_function (code, value_en, value_de, value_fr) VALUES ('3267','rain_water_manhole','Dachwasserschacht','chambre_recolte_eaux_toitures');
 INSERT INTO qgep.vl_manhole_function (code, value_en, value_de, value_fr) VALUES ('2989','other','andere','autres');
 INSERT INTO qgep.vl_manhole_function (code, value_en, value_de, value_fr) VALUES ('3006','unknown','unbekannt','inconnu');
 INSERT INTO qgep.vl_manhole_function (code, value_en, value_de, value_fr) VALUES ('3332','floating_material_separator','Schwimmstoffabscheider','separateur_materiaux_flottants');
 INSERT INTO qgep.vl_manhole_function (code, value_en, value_de, value_fr) VALUES ('3472','drainage_channel','Entwaesserungsrinne','rigole_de_drainage');
 INSERT INTO qgep.vl_manhole_function (code, value_en, value_de, value_fr) VALUES ('4532','drop_structure','Absturzbauwerk','ouvrage_de_chute');
 INSERT INTO qgep.vl_manhole_function (code, value_en, value_de, value_fr) VALUES ('4533','venting','Be_Entlueftung','aeration');
 INSERT INTO qgep.vl_manhole_function (code, value_en, value_de, value_fr) VALUES ('4534','spill_way','Hochwasserentlastung','deversoir_orage');
 INSERT INTO qgep.vl_manhole_function (code, value_en, value_de, value_fr) VALUES ('4535','septic_tank','Klaergrube','fosse_septique');
 INSERT INTO qgep.vl_manhole_function (code, value_en, value_de, value_fr) VALUES ('4536','pump_station','Pumpwerk','station_de_pompage');
 INSERT INTO qgep.vl_manhole_function (code, value_en, value_de, value_fr) VALUES ('4537','jetting_manhole','Spuelschacht','chambre_de_chasse');
 ALTER TABLE qgep.od_manhole ADD CONSTRAINT fkey_vl_manhole_function FOREIGN KEY (function)
 REFERENCES qgep.vl_manhole_function varchar(36) MATCH SIMPLE 
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
 INSERT INTO qgep.vl_manhole_material (code, value_en, value_de, value_fr) VALUES ('4540','other','andere','autre');
 INSERT INTO qgep.vl_manhole_material (code, value_en, value_de, value_fr) VALUES ('4541','concrete','Beton','beton');
 INSERT INTO qgep.vl_manhole_material (code, value_en, value_de, value_fr) VALUES ('4542','plastic','Kunststoff','matiere_plastique');
 INSERT INTO qgep.vl_manhole_material (code, value_en, value_de, value_fr) VALUES ('4543','unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_manhole ADD CONSTRAINT fkey_vl_manhole_material FOREIGN KEY (material)
 REFERENCES qgep.vl_manhole_material varchar(36) MATCH SIMPLE 
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
 INSERT INTO qgep.vl_manhole_surface_inflow (code, value_en, value_de, value_fr) VALUES ('2739','grid','Rost','grille_d_ecoulement');
 INSERT INTO qgep.vl_manhole_surface_inflow (code, value_en, value_de, value_fr) VALUES ('2740','intake_from_side','Zulauf_seitlich','arrivee_laterale');
 INSERT INTO qgep.vl_manhole_surface_inflow (code, value_en, value_de, value_fr) VALUES ('2741','no','keiner','aucune');
 INSERT INTO qgep.vl_manhole_surface_inflow (code, value_en, value_de, value_fr) VALUES ('3062','unknown','unbekannt','inconnu');
 INSERT INTO qgep.vl_manhole_surface_inflow (code, value_en, value_de, value_fr) VALUES ('3218','other','andere','autres');
 ALTER TABLE qgep.od_manhole ADD CONSTRAINT fkey_vl_manhole_surface_inflow FOREIGN KEY (surface_inflow)
 REFERENCES qgep.vl_manhole_surface_inflow varchar(36) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
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
 INSERT INTO qgep.vl_channel_bedding_encasement (code, value_en, value_de, value_fr) VALUES ('12','sand','Sand','sable');
 INSERT INTO qgep.vl_channel_bedding_encasement (code, value_en, value_de, value_fr) VALUES ('158','in_soil','erdverlegt','enterre');
 INSERT INTO qgep.vl_channel_bedding_encasement (code, value_en, value_de, value_fr) VALUES ('18','in_channel_suspended','in_Kanal_aufgehaengt','suspendu_dans_le_canal');
 INSERT INTO qgep.vl_channel_bedding_encasement (code, value_en, value_de, value_fr) VALUES ('2765','in_channel_concrete_casted','in_Kanal_einbetoniert','betonne_dans_le_canal');
 INSERT INTO qgep.vl_channel_bedding_encasement (code, value_en, value_de, value_fr) VALUES ('2766','in_jacking_pipe_concrete','in_Vortriebsrohr_Beton','en_pousse_tube_en_beton');
 INSERT INTO qgep.vl_channel_bedding_encasement (code, value_en, value_de, value_fr) VALUES ('2767','in_jacking_pipe_steel','in_Vortriebsrohr_Stahl','en_pousse_tube_en_acier');
 INSERT INTO qgep.vl_channel_bedding_encasement (code, value_en, value_de, value_fr) VALUES ('2986','other','andere','autres');
 INSERT INTO qgep.vl_channel_bedding_encasement (code, value_en, value_de, value_fr) VALUES ('3084','unknown','unbekannt','inconnu');
 INSERT INTO qgep.vl_channel_bedding_encasement (code, value_en, value_de, value_fr) VALUES ('3424','SIA_type_1','SIA_Typ1','SIA_type_1');
 INSERT INTO qgep.vl_channel_bedding_encasement (code, value_en, value_de, value_fr) VALUES ('3425','SIA_type_2','SIA_Typ2','SIA_type_2');
 INSERT INTO qgep.vl_channel_bedding_encasement (code, value_en, value_de, value_fr) VALUES ('3426','SIA_type_3','SIA_Typ3','SIA_type_3');
 INSERT INTO qgep.vl_channel_bedding_encasement (code, value_en, value_de, value_fr) VALUES ('3427','SIA_type_4','SIA_Typ4','SIA_type_4');
 INSERT INTO qgep.vl_channel_bedding_encasement (code, value_en, value_de, value_fr) VALUES ('3636','in_walk_in_passage','in_Leitungsgang','en_galerie');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_bedding_encasement FOREIGN KEY (bedding_encasement)
 REFERENCES qgep.vl_channel_bedding_encasement varchar(36) MATCH SIMPLE 
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
 INSERT INTO qgep.vl_channel_connection_type (code, value_en, value_de, value_fr) VALUES ('185','bell_shaped_sleeves','Glockenmuffen','emboitement_a_cloche');
 INSERT INTO qgep.vl_channel_connection_type (code, value_en, value_de, value_fr) VALUES ('186','beaked_sleeves','Spitzmuffen','emboitement_simple');
 INSERT INTO qgep.vl_channel_connection_type (code, value_en, value_de, value_fr) VALUES ('187','flat_sleeves','Flachmuffen','manchon_plat');
 INSERT INTO qgep.vl_channel_connection_type (code, value_en, value_de, value_fr) VALUES ('188','slip_on_sleeves','Ueberschiebmuffen','manchon_coulissant');
 INSERT INTO qgep.vl_channel_connection_type (code, value_en, value_de, value_fr) VALUES ('189','butt_welded','spiegelgeschweisst','manchon_soude_au_miroir');
 INSERT INTO qgep.vl_channel_connection_type (code, value_en, value_de, value_fr) VALUES ('190','electric_welded_sleeves','Elektroschweissmuffen','manchon_electrosoudable');
 INSERT INTO qgep.vl_channel_connection_type (code, value_en, value_de, value_fr) VALUES ('191','push_fit_sleeves','Steckmuffen','raccord_a_serrage');
 INSERT INTO qgep.vl_channel_connection_type (code, value_en, value_de, value_fr) VALUES ('192','coupling','Kupplung','raccord');
 INSERT INTO qgep.vl_channel_connection_type (code, value_en, value_de, value_fr) VALUES ('193','flange','Flansch','bride');
 INSERT INTO qgep.vl_channel_connection_type (code, value_en, value_de, value_fr) VALUES ('194','screwed_sleeves','Schraubmuffen','manchon_visse');
 INSERT INTO qgep.vl_channel_connection_type (code, value_en, value_de, value_fr) VALUES ('2988','other','andere','autres');
 INSERT INTO qgep.vl_channel_connection_type (code, value_en, value_de, value_fr) VALUES ('3036','unknown','unbekannt','inconnu');
 INSERT INTO qgep.vl_channel_connection_type (code, value_en, value_de, value_fr) VALUES ('3666','jacking_pipe_coupling','Vortriebsrohrkupplung','raccord_pour_tube_de_pousse_tube');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_connection_type FOREIGN KEY (connection_type)
 REFERENCES qgep.vl_channel_connection_type varchar(36) MATCH SIMPLE 
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
 INSERT INTO qgep.vl_channel_function_hydraulic (code, value_en, value_de, value_fr) VALUES ('144','jetting_pipe','Spuelleitung','conduite_de_rincage');
 INSERT INTO qgep.vl_channel_function_hydraulic (code, value_en, value_de, value_fr) VALUES ('145','seepage_water_drain','Sickerleitung','conduite_de_drainage');
 INSERT INTO qgep.vl_channel_function_hydraulic (code, value_en, value_de, value_fr) VALUES ('21','retention_pipe','Speicherleitung','conduite_de_retention');
 INSERT INTO qgep.vl_channel_function_hydraulic (code, value_en, value_de, value_fr) VALUES ('22','restriction_pipe','Drosselleitung','conduite_d_etranglement');
 INSERT INTO qgep.vl_channel_function_hydraulic (code, value_en, value_de, value_fr) VALUES ('23','pump_pressure_pipe','Pumpendruckleitung','conduite_de_refoulement');
 INSERT INTO qgep.vl_channel_function_hydraulic (code, value_en, value_de, value_fr) VALUES ('2546','drainage_transportation_pipe','Drainagetransportleitung','conduite_de_transport_pour_le_drainage');
 INSERT INTO qgep.vl_channel_function_hydraulic (code, value_en, value_de, value_fr) VALUES ('3012','unknown','unbekannt','inconnu');
 INSERT INTO qgep.vl_channel_function_hydraulic (code, value_en, value_de, value_fr) VALUES ('3214','other','andere','autres');
 INSERT INTO qgep.vl_channel_function_hydraulic (code, value_en, value_de, value_fr) VALUES ('3610','inverted_syphon','Duekerleitung','siphon_inverse');
 INSERT INTO qgep.vl_channel_function_hydraulic (code, value_en, value_de, value_fr) VALUES ('3655','vacuum_pipe','Vakuumleitung','conduite_sous_vide');
 INSERT INTO qgep.vl_channel_function_hydraulic (code, value_en, value_de, value_fr) VALUES ('367','gravity_pipe','Freispiegelleitung','conduite_a_ecoulement_gravitaire');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_function_hydraulic FOREIGN KEY (function_hydraulic)
 REFERENCES qgep.vl_channel_function_hydraulic varchar(36) MATCH SIMPLE 
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
 INSERT INTO qgep.vl_channel_usage_current (code, value_en, value_de, value_fr) VALUES ('4514','clean_wastewater','Reinabwasser','eaux_claires');
 INSERT INTO qgep.vl_channel_usage_current (code, value_en, value_de, value_fr) VALUES ('4516','discharged_wastewater','entlastetes_Mischabwasser','eaux_mixtes_deversees');
 INSERT INTO qgep.vl_channel_usage_current (code, value_en, value_de, value_fr) VALUES ('4518','creek_water','Bachwasser','eaux_cours_d_eau');
 INSERT INTO qgep.vl_channel_usage_current (code, value_en, value_de, value_fr) VALUES ('4520','rain_wastewater','Regenabwasser','eaux_pluviales');
 INSERT INTO qgep.vl_channel_usage_current (code, value_en, value_de, value_fr) VALUES ('4522','combined_wastewater','Mischabwasser','eaux_mixtes');
 INSERT INTO qgep.vl_channel_usage_current (code, value_en, value_de, value_fr) VALUES ('4524','industrial_wastewater','Industrieabwasser','eaux_industrielles');
 INSERT INTO qgep.vl_channel_usage_current (code, value_en, value_de, value_fr) VALUES ('4526','wastewater','Schmutzabwasser','eaux_usees');
 INSERT INTO qgep.vl_channel_usage_current (code, value_en, value_de, value_fr) VALUES ('4570','other','andere','autres');
 INSERT INTO qgep.vl_channel_usage_current (code, value_en, value_de, value_fr) VALUES ('4571','unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_usage_current FOREIGN KEY (usage_current)
 REFERENCES qgep.vl_channel_usage_current varchar(36) MATCH SIMPLE 
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
 INSERT INTO qgep.vl_channel_usage_planned (code, value_en, value_de, value_fr) VALUES ('4515','clean_wastewater','Reinabwasser','eaux_claires');
 INSERT INTO qgep.vl_channel_usage_planned (code, value_en, value_de, value_fr) VALUES ('4517','discharged_combined_wastewater','entlastetes_Mischabwasser','eaux_mixtes_deversees');
 INSERT INTO qgep.vl_channel_usage_planned (code, value_en, value_de, value_fr) VALUES ('4519','creek_water','Bachwasser','eaux_cours_d_eau');
 INSERT INTO qgep.vl_channel_usage_planned (code, value_en, value_de, value_fr) VALUES ('4521','rain_wastewater','Regenabwasser','eaux_pluviales');
 INSERT INTO qgep.vl_channel_usage_planned (code, value_en, value_de, value_fr) VALUES ('4523','combined_wastewater','Mischabwasser','eaux_mixtes');
 INSERT INTO qgep.vl_channel_usage_planned (code, value_en, value_de, value_fr) VALUES ('4525','industrial_wastewater','Industrieabwasser','eaux_industrielles');
 INSERT INTO qgep.vl_channel_usage_planned (code, value_en, value_de, value_fr) VALUES ('4527','wastewater','Schmutzabwasser','eaux_usees');
 INSERT INTO qgep.vl_channel_usage_planned (code, value_en, value_de, value_fr) VALUES ('4568','other','andere','autres');
 INSERT INTO qgep.vl_channel_usage_planned (code, value_en, value_de, value_fr) VALUES ('4569','unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_channel ADD CONSTRAINT fkey_vl_channel_usage_planned FOREIGN KEY (usage_planned)
 REFERENCES qgep.vl_channel_usage_planned varchar(36) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_discharge_point ADD CONSTRAINT oorel_od_discharge_point_wastewater_structure FOREIGN KEY (obj_id) REFERENCES qgep.od_wastewater_structure(obj_id);
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
 INSERT INTO qgep.vl_special_structure_bypass (code, value_en, value_de, value_fr) VALUES ('2681','existent','vorhanden','existant');
 INSERT INTO qgep.vl_special_structure_bypass (code, value_en, value_de, value_fr) VALUES ('2682','inexistent','nicht_vorhanden','inexistant');
 INSERT INTO qgep.vl_special_structure_bypass (code, value_en, value_de, value_fr) VALUES ('3055','unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_special_structure ADD CONSTRAINT fkey_vl_special_structure_bypass FOREIGN KEY (bypass)
 REFERENCES qgep.vl_special_structure_bypass varchar(36) MATCH SIMPLE 
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
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr) VALUES ('227','jetting_manhole','Spuelschacht','chambre_de_chasse');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr) VALUES ('245','drop_structure','Absturzbauwerk','ouvrage_de_chute');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr) VALUES ('246','pump_station','Pumpwerk','station_de_pompage');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr) VALUES ('247','septic_tank','Klaergrube','fosse_septique');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr) VALUES ('2744','cesspit','Jauchegrube','fosse_a_purin');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr) VALUES ('2745','vortex_manhole','Wirbelfallschacht','chambre_de_chute_a_vortex');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr) VALUES ('2768','oil_separator','Oelabscheider','separateur_d_hydrocarbures');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr) VALUES ('2998','manhole','Kontrollschacht','regard_de_visite');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr) VALUES ('3008','unknown','unbekannt','inconnu');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr) VALUES ('3202','other','andere','autres');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr) VALUES ('3233','spill_way','Hochwasserentlastung','deversoir_orage');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr) VALUES ('3234','inverse_syphon_chamber','Duekerkammer','chambre_avec_siphon_inverse');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr) VALUES ('3331','floating_material_separator','Schwimmstoffabscheider','separateur_materiaux_flottants');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr) VALUES ('3348','terrain_depression','Gelaendemulde','depression_de_terrain');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr) VALUES ('336','bolders_bedload_catchement_dam','Geschiebefang','depotoir_pour_alluvions');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr) VALUES ('3673','stormwater_tank_with_overflow','Regenbecken_Durchlaufbecken','BEP_decantation');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr) VALUES ('3674','stormwater_tank_retaining_first_flush','Regenbecken_Fangbecken','BEP_retention');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr) VALUES ('3675','stormwater_sedimentation_tank','Regenbecken_Regenklaerbecken','BEP_clarification');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr) VALUES ('3676','stormwater_retention_tank','Regenbecken_Regenrueckhaltebecken','BEP_accumulation');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr) VALUES ('3677','stormwater_composite_tank','Regenbecken_Verbundbecken','BEP_combine');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr) VALUES ('383','side_access','seitlicherZugang','acces_lateral');
 INSERT INTO qgep.vl_special_structure_function (code, value_en, value_de, value_fr) VALUES ('386','venting','Be_Entlueftung','aeration');
 ALTER TABLE qgep.od_special_structure ADD CONSTRAINT fkey_vl_special_structure_function FOREIGN KEY (function)
 REFERENCES qgep.vl_special_structure_function varchar(36) MATCH SIMPLE 
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
 INSERT INTO qgep.vl_infiltration_installation_defects (code, value_en, value_de, value_fr) VALUES ('3274','none','keine','aucune');
 INSERT INTO qgep.vl_infiltration_installation_defects (code, value_en, value_de, value_fr) VALUES ('3275','substantial','wesentliche','importantes');
 INSERT INTO qgep.vl_infiltration_installation_defects (code, value_en, value_de, value_fr) VALUES ('3276','marginal','unwesentliche','modestes');
 ALTER TABLE qgep.od_infiltration_installation ADD CONSTRAINT fkey_vl_infiltration_installation_defects FOREIGN KEY (defects)
 REFERENCES qgep.vl_infiltration_installation_defects varchar(36) MATCH SIMPLE 
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
 INSERT INTO qgep.vl_infiltration_installation_emergency_spillway (code, value_en, value_de, value_fr) VALUES ('3303','none','keiner','aucun');
 INSERT INTO qgep.vl_infiltration_installation_emergency_spillway (code, value_en, value_de, value_fr) VALUES ('3304','in_water_body','inVorfluter','au_cours_d_eau_recepteur');
 INSERT INTO qgep.vl_infiltration_installation_emergency_spillway (code, value_en, value_de, value_fr) VALUES ('3305','surface_discharge','oberflaechlichausmuendend','deversement_en_surface');
 INSERT INTO qgep.vl_infiltration_installation_emergency_spillway (code, value_en, value_de, value_fr) VALUES ('3306','in_combined_waste_water_drain','inMischwasserkanalisation','dans_egouts_eaux_mixtes');
 INSERT INTO qgep.vl_infiltration_installation_emergency_spillway (code, value_en, value_de, value_fr) VALUES ('3307','in_rain_waste_water_drain','inRegenwasserkanalisation','dans_canalisation_eaux_pluviales');
 INSERT INTO qgep.vl_infiltration_installation_emergency_spillway (code, value_en, value_de, value_fr) VALUES ('3308','unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_infiltration_installation ADD CONSTRAINT fkey_vl_infiltration_installation_emergency_spillway FOREIGN KEY (emergency_spillway)
 REFERENCES qgep.vl_infiltration_installation_emergency_spillway varchar(36) MATCH SIMPLE 
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
 INSERT INTO qgep.vl_infiltration_installation_labeling (code, value_en, value_de, value_fr) VALUES ('3328','labeled','beschriftet','signale');
 INSERT INTO qgep.vl_infiltration_installation_labeling (code, value_en, value_de, value_fr) VALUES ('3329','not_labeled','nichtbeschriftet','non_signale');
 INSERT INTO qgep.vl_infiltration_installation_labeling (code, value_en, value_de, value_fr) VALUES ('3330','unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_infiltration_installation ADD CONSTRAINT fkey_vl_infiltration_installation_labeling FOREIGN KEY (labeling)
 REFERENCES qgep.vl_infiltration_installation_labeling varchar(36) MATCH SIMPLE 
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
 INSERT INTO qgep.vl_infiltration_installation_seepage_utilization (code, value_en, value_de, value_fr) VALUES ('273','clean_water','Reinabwasser','eaux_claires');
 INSERT INTO qgep.vl_infiltration_installation_seepage_utilization (code, value_en, value_de, value_fr) VALUES ('274','rain_water','Regenabwasser','eaux_pluviales');
 INSERT INTO qgep.vl_infiltration_installation_seepage_utilization (code, value_en, value_de, value_fr) VALUES ('3086','unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_infiltration_installation ADD CONSTRAINT fkey_vl_infiltration_installation_seepage_utilization FOREIGN KEY (seepage_utilization)
 REFERENCES qgep.vl_infiltration_installation_seepage_utilization varchar(36) MATCH SIMPLE 
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
 INSERT INTO qgep.vl_infiltration_installation_type (code, value_en, value_de, value_fr) VALUES ('3279','surface_percolation','Flaechenfoermige_Versickerung','infiltration_superficielle_sur_place');
 INSERT INTO qgep.vl_infiltration_installation_type (code, value_en, value_de, value_fr) VALUES ('3280','percolation_over_the_shoulder','Versickerung_ueber_die_Schulter','infiltration_par_les_bas_cotes');
 INSERT INTO qgep.vl_infiltration_installation_type (code, value_en, value_de, value_fr) VALUES ('276','percolation_basin','Versickerungsbecken','bassin_d_infiltration');
 INSERT INTO qgep.vl_infiltration_installation_type (code, value_en, value_de, value_fr) VALUES ('277','gravel_formation','Kieskoerper','corps_de_gravier');
 INSERT INTO qgep.vl_infiltration_installation_type (code, value_en, value_de, value_fr) VALUES ('278','percolation_manhole','Versickerungsschacht','puits_d_infiltration');
 INSERT INTO qgep.vl_infiltration_installation_type (code, value_en, value_de, value_fr) VALUES ('3087','unknown','unbekannt','inconnu');
 INSERT INTO qgep.vl_infiltration_installation_type (code, value_en, value_de, value_fr) VALUES ('3281','depression_percolation','MuldenRigolenversickerung','cuvettes_rigoles_filtrantes');
 INSERT INTO qgep.vl_infiltration_installation_type (code, value_en, value_de, value_fr) VALUES ('3282','with_soil_passage','andere_mit_Bodenpassage','autre_avec_passage_a_travers_sol');
 INSERT INTO qgep.vl_infiltration_installation_type (code, value_en, value_de, value_fr) VALUES ('3283','percolation_gallery','Versickerungsstrang_Galerie','bande_infiltration_galerie');
 INSERT INTO qgep.vl_infiltration_installation_type (code, value_en, value_de, value_fr) VALUES ('3284','combination_manhole_pipe','Kombination_Schacht_Strang','combinaison_puits_bande');
 INSERT INTO qgep.vl_infiltration_installation_type (code, value_en, value_de, value_fr) VALUES ('3285','without_soil_passage','andere_ohne_Bodenpassage','autre_sans_passage_a_travers_sol');
 ALTER TABLE qgep.od_infiltration_installation ADD CONSTRAINT fkey_vl_infiltration_installation_type FOREIGN KEY (type)
 REFERENCES qgep.vl_infiltration_installation_type varchar(36) MATCH SIMPLE 
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
 INSERT INTO qgep.vl_infiltration_installation_vehicle_access (code, value_en, value_de, value_fr) VALUES ('3287','accessible','zugaenglich','accessible');
 INSERT INTO qgep.vl_infiltration_installation_vehicle_access (code, value_en, value_de, value_fr) VALUES ('3288','inaccessible','unzugaenglich','inaccessible');
 INSERT INTO qgep.vl_infiltration_installation_vehicle_access (code, value_en, value_de, value_fr) VALUES ('3289','unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_infiltration_installation ADD CONSTRAINT fkey_vl_infiltration_installation_vehicle_access FOREIGN KEY (vehicle_access)
 REFERENCES qgep.vl_infiltration_installation_vehicle_access varchar(36) MATCH SIMPLE 
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
 INSERT INTO qgep.vl_infiltration_installation_watertightness (code, value_en, value_de, value_fr) VALUES ('3294','watertight','wasserdicht','etanche');
 INSERT INTO qgep.vl_infiltration_installation_watertightness (code, value_en, value_de, value_fr) VALUES ('3295','not_watertight','nichtwasserdicht','non_etanche');
 INSERT INTO qgep.vl_infiltration_installation_watertightness (code, value_en, value_de, value_fr) VALUES ('3296','unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_infiltration_installation ADD CONSTRAINT fkey_vl_infiltration_installation_watertightness FOREIGN KEY (watertightness)
 REFERENCES qgep.vl_infiltration_installation_watertightness varchar(36) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
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
 INSERT INTO qgep.vl_reach_horizontal_positioning (code, value_en, value_de, value_fr) VALUES ('3630','accurate','genau','precis');
 INSERT INTO qgep.vl_reach_horizontal_positioning (code, value_en, value_de, value_fr) VALUES ('3631','inaccurate','ungenau','imprecis');
 INSERT INTO qgep.vl_reach_horizontal_positioning (code, value_en, value_de, value_fr) VALUES ('3632','unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_reach ADD CONSTRAINT fkey_vl_reach_horizontal_positioning FOREIGN KEY (horizontal_positioning)
 REFERENCES qgep.vl_reach_horizontal_positioning varchar(36) MATCH SIMPLE 
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
 INSERT INTO qgep.vl_reach_inside_coating (code, value_en, value_de, value_fr) VALUES ('248','coating','Anstrich_Beschichtung','peinture_revetement');
 INSERT INTO qgep.vl_reach_inside_coating (code, value_en, value_de, value_fr) VALUES ('249','cement_mortar_lining','Zementmoertelauskleidung','revetement_en_mortier_de_ciment');
 INSERT INTO qgep.vl_reach_inside_coating (code, value_en, value_de, value_fr) VALUES ('250','brick_lining','Kanalklinkerauskleidung','revetement_en_brique');
 INSERT INTO qgep.vl_reach_inside_coating (code, value_en, value_de, value_fr) VALUES ('251','stoneware_lining','Steinzeugauskleidung','revetement_en_gres');
 INSERT INTO qgep.vl_reach_inside_coating (code, value_en, value_de, value_fr) VALUES ('2984','other','andere','autres');
 INSERT INTO qgep.vl_reach_inside_coating (code, value_en, value_de, value_fr) VALUES ('3044','unknown','unbekannt','inconnu');
 ALTER TABLE qgep.od_reach ADD CONSTRAINT fkey_vl_reach_inside_coating FOREIGN KEY (inside_coating)
 REFERENCES qgep.vl_reach_inside_coating varchar(36) MATCH SIMPLE 
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
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr) VALUES ('147','fiber_cement','Faserzement','fibrociment');
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr) VALUES ('148','cast_ductile_iron','Guss_duktil','fonte_ductile');
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr) VALUES ('153','steel','Stahl','acier');
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr) VALUES ('154','stoneware','Steinzeug','gres');
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr) VALUES ('3256','concrete_unknown','Beton_unbekannt','beton_inconnu');
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr) VALUES ('3258','plastic_unknown','Kunststoff_unbekannt','plastique_inconnu');
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr) VALUES ('2754','asbestos_cement','Asbestzement','amiante_ciment');
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr) VALUES ('2755','bricks','Gebrannte_Steine','terre_cuite');
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr) VALUES ('2761','clay','Ton','argile');
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr) VALUES ('2762','cement','Zement','ciment');
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr) VALUES ('2985','other','andere','autres');
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr) VALUES ('3016','unknown','unbekannt','inconnu');
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr) VALUES ('3638','concrete_normal','Beton_Normalbeton','beton_normal');
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr) VALUES ('3639','concrete_insitu','Beton_Ortsbeton','beton_coule_sur_place');
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr) VALUES ('3640','concrete_presspipe','Beton_Pressrohrbeton','beton_pousse_tube');
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr) VALUES ('3641','concrete_special','Beton_Spezialbeton','beton_special');
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr) VALUES ('3648','cast_gray_iron','Guss_Grauguss','fonte_grise');
 INSERT INTO qgep.vl_reach_material (code, value_en, value_de, value_fr) VALUES ('3654','steel_stainless','Stahl_rostfrei','acier_inoxydable');
 ALTER TABLE qgep.od_reach ADD CONSTRAINT fkey_vl_reach_material FOREIGN KEY (material)
 REFERENCES qgep.vl_reach_material varchar(36) MATCH SIMPLE 
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qgep.od_reach ADD COLUMN reach_point_from varchar (36);
ALTER TABLE qgep.od_reach ADD CONSTRAINT rel_OD_HALTUNG_OD_HALTUNGSPUNKT FOREIGN KEY (qgep.fs_reach_point_from) REFERENCES qgep.od_reach_point(obj_id);
ALTER TABLE qgep.od_reach ADD COLUMN reach_point_to varchar (36);
ALTER TABLE qgep.od_reach ADD CONSTRAINT rel_OD_HALTUNG_OD_HALTUNGSPUNKT FOREIGN KEY (qgep.fs_reach_point_to) REFERENCES qgep.od_reach_point(obj_id);
ALTER TABLE qgep.od_reach ADD COLUMN pipe_profile varchar (36);
ALTER TABLE qgep.od_reach ADD CONSTRAINT rel_OD_HALTUNG_OD_ROHRPROFIL FOREIGN KEY (qgep.fs_pipe_profile) REFERENCES qgep.od_pipe_profile(obj_id);
ALTER TABLE qgep.od_wastewater_node ADD CONSTRAINT oorel_od_wastewater_node_wastewater_networkelement FOREIGN KEY (obj_id) REFERENCES qgep.od_wastewater_networkelement(obj_id);
COMMIT;
