------ this file generates the qgep is_dictionary on QQIS
------ for questions etc please contact stefan burckhardt stefan.burckhardt@sjib.ch
------ version 25.06.2013 21:29:01
CREATE TABLE qgep.is_dictionary
(
  id integer NOT NULL,
  tablename text,
  name_en text,
  shortcut_en character(2),
  name_de text,
  shortcut_de character(2),
  name_fr text,
  shortcut_fr character(2),
  CONSTRAINT pkey_qgep_is_dictonary_id PRIMARY KEY (id ),
  CONSTRAINT unq_qgep_is_dictonary_tablename UNIQUE (tablename )
)
WITH (
  OIDS = False
);
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (1001,'qgep.od_dryweather_downspout','dryweather downspout','DD','Trockenwetterfallrohr','TF','Tuyau de chute par temps sec','TT');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (1022,'qgep.od_param_ca_mouse1','param ca mouse1','PM','EZG_PARAMETER_MOUSE1','EM','Paramètre BV MOUSE1','PM');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (1033,'qgep.od_fountain','fountain','FO','Brunnen','BR','Fontaine','FO');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (1034,'qgep.od_reservoir','reservoir','RV','Reservoir','RV','Réservoir','RE');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (1035,'qgep.od_building','building','BU','Gebäude','BD','Bâtiment','BT');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (1036,'qgep.od_individual_surface','individual surface','IS','Einzelfläche','FL','Surface individuelle','SI');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (104,'qgep.od_planning_zone','planning zone','PL','Planungszone','PL','Zones réservées','ZR');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (105,'qgep.od_zone','zone','ZO','Zone','ZO','Zone','ZO');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (106,'qgep.od_infiltration_zone','infiltration zone','IZ','Versickerungsbereich','VB','Zone d''infiltration','ZI');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (107,'qgep.od_benching','benching','BE','Bankett','BN','Banquette','BQ');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (108,'qgep.od_wwtp_energy_use','wwtp energy use','EU','ARA Energienutzung','AE','Utilisation d''énergie d''une STEP','EN');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (109,'qgep.od_electric_equipment','electric equipment','EE','Elektrische Einrichtung','EE','Equipement électrique','EE');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (11,'qgep.od_bathing_area','bathing area','BA','Badestelle','BS','Lieu de baignade','LB');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (110,'qgep.od_electromechanical_equipment','electromechanical equipment','EQ','Elektromechanische Ausrüstung','EA','Equipement électromécanique','EQ');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (111,'qgep.od_maintenance_event','maintenance event','ME','Erhaltungsereignis','EH','Evénement de maintenance','EM');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (112,'qgep.od_dam','dam','DA','Gewässer Wehr','WH','Ouvrage de retenue','OR');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (113,'qgep.od_ford','ford','FD','Furt','FU','Passage à gué','PG');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (114,'qgep.od_chute','chute','CE','Gewässer Absturz','AZ','Seuil','SL');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (115,'qgep.od_lock','lock','LO','Schleuse','SL','Ecluse','EC');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (116,'qgep.od_passage','passage','PA','Durchlass','DL','Passage en tuyau','PA');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (117,'qgep.od_blocking_debris','blocking debris','BD','Geschiebesperre','GP','Barrage à alluvions','BA');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (118,'qgep.od_rock_ramp','rock ramp','RR','Sohlrampe','SR','Rampe','RA');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (119,'qgep.od_fish_pass','fish pass','FP','Fischpass','FP','Echelle à poissons','EP');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (120,'qgep.od_groundwater_protection_zone','groundwater protection zone','GZ','Grundwasserschutzzone','GZ','Zone de protection des eaux souterraines','ZP');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (121,'qgep.od_ground_water_protection_perimeter','ground water protection perimeter','GP','Grundwasserschutzareal','GS','Périmètre de protection des eaux souterraines','PP');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (13,'qgep.od_structure_part','structure part','SP','Bauwerksteil','BT','Elément d''ouvrage','EO');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (15,'qgep.od_cover','cover','CO','Deckel','DE','Couvercle','CO');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (16,'qgep.od_throttle_shut_off_unit','throttle shut off unit','TS','Absperr/Drosselorgan','DR','Limiteur de débit','LD');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (18,'qgep.od_access_aid','access aid','AA','Einstiegshilfe','EF','Dispositif d''accès','DA');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (19,'qgep.od_catchment_area','catchment area','CA','Einzugsgebiet','EZ','Bassin versant','BV');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (2,'qgep.od_wastewater_structure','wastewater structure','WS','Abwasserbauwerk','BW','Ouvrage du réseau d''évacuation','OU');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (21,'qgep.od_river','river','RI','Fliessgewässer','FG','Cours d''eau','CE');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (23,'qgep.od_hazard_source','hazard source','HS','Gefahrenquelle','GQ','Source de danger','SD');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (24,'qgep.od_municipality','municipality','MU','Gemeinde','GE','Commune','CM');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (25,'qgep.od_surface_water_bodies','surface water bodies','CU','Oberflaechengewässer','GW','Eaux superficielles','ES');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (26,'qgep.od_water_course_segment','water course segment','SE','Gewaesserabschnitt','GA','Tronçon de cours d''eau','TC');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (2652,'qgep.od_sector_water_body','sector water body','SW','Gewässersektor','GK','Secteur d''eaux superficielles','SU');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (27,'qgep.od_river_bed','river bed','RD','Gewässersohle','GO','Fond du cours d''eau','FC');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (2721,'qgep.od_drainage_system','drainage system','DS','Entwässerungssystem','ES','Système d''évacuation des eaux','SY');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (2723,'qgep.od_control_center','control center','CC','Steuerungszentrale','SZ','Centrale de commande','CC');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (2733,'qgep.od_administrative_office','administrative office','AO','Amt','AM','Office','OF');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (28,'qgep.od_water_control_structure','water control structure','CS','Gewässerverbauung','GV','Aménagement de cours d''eau','AM');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (29,'qgep.od_water_catchment','water catchment','WC','Wasserfassung','WF','Captage','CP');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (2964,'qgep.od_profile_geometry','profile geometry','PG','Rohrprofil Geometrie','RG','Profil du tuyau_Géom.','TG');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (3,'qgep.od_waste_water_treatment','waste water treatment','TR','Abwasserbehandlung','AH','Traitement des eaux usées','TE');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (30,'qgep.od_aquifier','aquifier','AQ','Grundwasserleiter','GL','Aquifère','AQ');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (31,'qgep.od_reach','reach','RE','Haltung','HA','Tronçon','TR');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (3189,'qgep.od_param_ca_general','param ca general','PC','EZG_PARAMETER_ALLG','EG','Param BV géneral','PB');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (32,'qgep.od_reach_point','reach point','RP','Haltungspunkt','HP','Point de tronçon','PT');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (33,'qgep.od_hq_relation','hq relation','HQ','HQ-Relation','HR','Relation HQ','HQ');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (36,'qgep.od_hydr_geometry','hydr geometry','HG','Hydro Geometrie','HG','Géométrie hydraulique','GH');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (3679,'qgep.od_examination','examination','EX','Untersuchung','UN','Examen','IN');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (37,'qgep.od_hydr_geom_relation','hydr geom relation','HR','Hydro Geometrie Relation','HY','Relationgéom_hydr','RG');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (3705,'qgep.od_damage','damage','DG','Schaden','SC','Dommage','DO');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (3714,'qgep.od_damage_channel','damage channel','DC','Kanalschaden','KS','Dommage aux canalisations','DC');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (3728,'qgep.od_damage_manhole','damage manhole','DM','Normschachtschaden','SS','Dommage chambre standard','SS');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (3754,'qgep.od_file','file','FI','Datei','DA','Fichier','FI');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (3776,'qgep.od_data_media','data media','VO','Datenträger','DT','Support données','SO');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (38,'qgep.od_channel','channel','CL','Kanal','KA','Canalisation','CA');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (39,'qgep.od_canton','canton','CT','Kanton','KT','Canton','CN');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (4,'qgep.od_wastewater_node','wastewater node','WN','Abwasserknoten','AK','Noeud de réseau','NR');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (41,'qgep.od_leapingweir','leapingweir','LW','Leapingwehr','LW','Leapingweir','LW');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (42,'qgep.od_measurement_series','measurement series','MS','Messreihe','MH','Série de mesures','SE');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (43,'qgep.od_measurement_result','measurement result','MR','Messresultat','MR','Résultat de la mesure','RM');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (44,'qgep.od_measuring_point','measuring point','MP','Messstelle','MS','Station de mesure','SM');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (45,'qgep.od_manhole','manhole','MA','Normschacht','NS','Chambre standard','CS');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (4586,'qgep.od_cooperative','cooperative','CP','Genossenschaft/Kooperation','GN','Cooperative','GK');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (46,'qgep.od_surface_runoff_parameters','surface runoff parameters','SR','Oberflächenabflussparameter','OP','Paramètres d''écoulement superficiel','PE');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (47,'qgep.od_organisation','organisation','OG','Organisation','OG','Organisation','OG');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (48,'qgep.od_privat','privat','PR','Privat','PR','Privé','PR');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (49,'qgep.od_pipe_profile','pipe profile','PP','Rohrprofil','RP','Genre de profil de tuyau','GP');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (5,'qgep.od_wastewater_networkelement','wastewater networkelement','WE','Abwassernetzelement','AN','Elément du réseau d''évacuation des eaux','ER');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (50,'qgep.od_pump','pump','PU','Förderaggregat','FA','Installation de refoulement','IR');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (5000,'qgep.od_measure','measure','MM','Massnahme','MP','Mésure','MX');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (53,'qgep.od_retention_body','retention body','RB','Retentionskörper','RK','Volume de rétention','VR');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (55,'qgep.od_sludge_treatment','sludge treatment','ST','Schlammbehandlung','SH','Traitement des boues','TB');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (56,'qgep.od_lake','lake','LA','See','SE','Lac','LA');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (57,'qgep.od_special_structure','special structure','SS','Spezialbauwerk','SW','Ouvrage spécial','OC');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (58,'qgep.od_substance','substance','SB','Stoff','ST','Substance','SB');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (60,'qgep.od_prank_weir','prank weir','PW','Streichwehr','WE','Déversoir latéral','DL');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (6100,'qgep.od_building_group','building group','','Gebäudegruppe','GG','Bâtiment','BG');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (6101,'qgep.od_farm','farm','','Landwirtschaftsbetrieb','','Exploitation agricole','EA');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (6102,'qgep.od_disposal_without_drain','disposal without drain','','Abflusslose Entsorgung','','Evacuation sans rejet','SR');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (6103,'qgep.od_small_treatment_plant','small treatment plant','','KLARA','','Petite STEP','PS');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (6104,'qgep.od_disposal_with_drain','disposal with drain','','Entsorgung mit Abfluss','','Evacuation avec rejet','EV');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (6105,'qgep.od_building_group_baugwr','building group baugwr','','Gebäudegruppe BAUGWR','','Bâtiment BAUREGBL','');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (62,'qgep.od_dryweather_flume','dryweather flume','DF','Trockenwetterrinne','TR','Cunette de débit temps sec','CU');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (63,'qgep.od_overflow','overflow','OF','Überlauf','UE','Déversoir','DE');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (64,'qgep.od_overflow_characteristic','overflow characteristic','OC','Überlaufcharakteristik','UC','Caractéristiques du déversoir','CD');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (65,'qgep.od_river_bank','river bank','SI','Ufer','UF','Rive','RI');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (66,'qgep.od_accident','accident','AC','Unfall','UL','Accident','AC');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (67,'qgep.od_waste_water_association','waste water association','WA','Abwasserverband','AV','Association pour l''épuration des eaux usées','AS');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (68,'qgep.od_infiltration_installation','infiltration installation','II','Versickerungsanlage','VA','Installation d''infiltration','II');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (69,'qgep.od_discharge_point','discharge point','DP','Einleitstelle','VE','Exutoire au milieu récepteur','EX');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (70,'qgep.od_mechanical_pretreatment','mechanical pretreatment','MT','Mechanische Vorreinigung','MV','Prétraitement méchanique','ME');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (72,'qgep.od_water_body_protection_sector','water body protection sector','PS','Gewässerschutzbereich','GB','Secteur de protection des eaux','SP');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (8,'qgep.od_connection_object','connection object','CN','Anschlussobjekt','AO','Objet raccordé','OB');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (9,'qgep.od_waste_water_treatment_plant','waste water treatment plant','TP','Abwasserreinigungsanlage','AR','Station d''épuration des eaux usées','ST');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (97,'qgep.od_wwtp_structure','wwtp structure','WT','ARA Bauwerk','AW','Ouvrages d''une  STEP','OS');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (99,'qgep.od_measuring_device','measuring device','MV','Messgerät','MG','Appareil de mesure','AP');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (9999,'qgep.od_mutation','mutation','MD','MUTATION','MD','Mutation','MD');
