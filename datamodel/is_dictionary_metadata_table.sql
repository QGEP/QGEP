CREATE TABLE qgep.is_dictionary (
    id integer NOT NULL,
    tablename text,
    name_en text,
    shortcut_en character(2),
    name_de text,
    shortcut_de character(2),
    name_fr text,
    shortcut_fr character(2)
);
INSERT INTO qgep.is_dictionary VALUES (31, 'od_reach', 'reach', 'RE', 'Haltung', 'HA', 'troncon', 'TR');
INSERT INTO qgep.is_dictionary VALUES (107, 'od_benching', 'benching', 'BE', 'Bankett', 'BN', 'banquette', 'BQ');
INSERT INTO qgep.is_dictionary VALUES (13, 'od_structure_part', 'structure_part', 'SP', 'BauwerksTeil', 'BT', 'element_ouvrage', 'EO');
INSERT INTO qgep.is_dictionary VALUES (15, 'od_cover', 'cover', 'CO', 'Deckel', 'DE', 'couvercle', 'CO');
INSERT INTO qgep.is_dictionary VALUES (18, 'od_access_aid', 'access_aid', 'AA', 'Einstiegshilfe', 'EF', 'dispositif_d_acces', 'DA');
INSERT INTO qgep.is_dictionary VALUES (2, 'od_wastewater_structure', 'wastewater_structure', 'WS', 'Abwasserbauwerk', 'BW', 'ouvrage_reseau_as', 'OU');
INSERT INTO qgep.is_dictionary VALUES (32, 'od_reach_point', 'reach_point', 'RP', 'Haltungspunkt', 'HP', 'point_troncon', 'PT');
INSERT INTO qgep.is_dictionary VALUES (38, 'od_channel', 'channel', 'CH', 'Kanal', 'KA', 'canalisation', 'CA');
INSERT INTO qgep.is_dictionary VALUES (4, 'od_wastewater_node', 'wastewater_node', 'WN', 'Abwasserknoten', 'AK', 'noeud_reseau', 'NR');
INSERT INTO qgep.is_dictionary VALUES (45, 'od_manhole', 'manhole', 'MA', 'Normschacht', 'NS', 'chambre_standard', 'CS');
INSERT INTO qgep.is_dictionary VALUES (47, 'od_organisation', 'organisation', 'OG', 'Organisation', 'OG', 'organisation', 'OG');
INSERT INTO qgep.is_dictionary VALUES (49, 'od_pipe_profile', 'pipe_profile', 'PP', 'Rohrprofil', 'RP', 'profil_tuyau', 'GP');
INSERT INTO qgep.is_dictionary VALUES (5, 'od_wastewater_networkelement', 'wastewater_networkelement', 'WE', 'Abwassernetzelement', 'AN', 'element_reseau_evacuation', 'ER');
INSERT INTO qgep.is_dictionary VALUES (57, 'od_special_structure', 'special_structure', 'SS', 'Spezialbauwerk', 'SW', 'ouvrage_special', 'OC');
INSERT INTO qgep.is_dictionary VALUES (62, 'od_dryweather_flume', 'dryweather_flume', 'DF', 'Trockenwetterrinne', 'TR', 'cunette_debit_temps_sec', 'CU');
INSERT INTO qgep.is_dictionary VALUES (68, 'od_infiltration_installation', 'infiltration_installation', 'II', 'Versickerungsanlage', 'VA', 'installation_infiltration', 'II');
INSERT INTO qgep.is_dictionary VALUES (69, 'od_discharge_point', 'discharge_point', 'DP', 'Einleitstelle', 'VE', 'exutoire_milieu_recepteur', 'EX');
ALTER TABLE ONLY qgep.is_dictionary
    ADD CONSTRAINT pkey_qgep_is_dictonary_id PRIMARY KEY (id);
ALTER TABLE ONLY qgep.is_dictionary
    ADD CONSTRAINT unq_qgep_is_dictonary_tablename UNIQUE (tablename);

CREATE UNIQUE INDEX in_qgep_is_dictionary_id
  ON qgep.is_dictionary
  USING btree
  (id );

CREATE UNIQUE INDEX in_qgep_is_dictionary_tablename
  ON qgep.is_dictionary
  USING btree
  (tablename );