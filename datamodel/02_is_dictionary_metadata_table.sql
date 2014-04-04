------ this file generates the qgep is_dictionary (Modul dss) in en on QGEP
------ for questions etc. please contact stefan burckhardt stefan.burckhardt@sjib.ch
------ version 13.03.2014 21:18:49
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
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (23,'od_hazard_source','hazard source','HS','Gefahrenquelle','GQ','source de danger','SD');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (24,'od_municipality','municipality','MU','Gemeinde','GE','commune','CM');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (25,'od_surface_water_bodies','surface water bodies','CU','Oberflächengewässer','GW','eaux superficielles','ES');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (26,'od_water_course_segment','water course segment','SE','Gewässerabschnitt','GA','tronçon de cours d''eau','TC');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (2652,'od_sector_water_body','sector water body','SW','Gewässersektor','GK','secteur d''eaux superficielles','SU');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (27,'od_river_bed','river bed','RD','Gewässersohle','GO','fond du cours d''eau','FC');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (2721,'od_drainage_system','drainage system','DS','Entwässerungssystem','ES','système d''évacuation des eaux','SY');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (2723,'od_control_center','control center','CC','Steuerungszentrale','SZ','centrale de commande','CC');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (2733,'od_administrative_office','administrative office','AO','Amt','AM','office','OF');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (28,'od_water_control_structure','water control structure','CS','Gewässerverbauung','GV','aménagement de cours d''eau','AM');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (29,'od_water_catchment','water catchment','WC','Wasserfassung','WF','captage','CP');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (2964,'od_profile_geometry','profile geometry','PG','Rohrprofil Geometrie','RG','profil du tuyau geometrie','TG');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (3,'od_waste_water_treatment','waste water treatment','TR','Abwasserbehandlung','AH','traitement des eaux usées','TE');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (30,'od_aquifier','aquifier','AQ','Grundwasserleiter','GL','aquifère','AQ');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (31,'od_reach','reach','RE','Haltung','HA','tronçon','TR');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (3189,'od_param_ca_general','param ca general','PC','EZG_PARAMETER_ALLG','EG','param bv géneral','PB');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (32,'od_reach_point','reach point','RP','Haltungspunkt','HP','point de tronçon','PT');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (33,'od_hq_relation','hq relation','HQ','HQ-Relation','HR','relation hq','HQ');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (36,'od_hydr_geometry','hydraulic geometry','HG','Hydro-Geometrie','HG','géométrie hydraulique','GH');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (3679,'od_examination','examination','EX','Untersuchung','UN','examen','IN');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (37,'od_hydr_geom_relation','hydr geom relation','HR','Hydro-Geometrie-Relation','HY','relation géometrie hydraulique','RG');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (3705,'od_damage','damage','DG','Schaden','SC','dommage','DO');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (3714,'od_damage_channel','damage channel','DC','Kanalschaden','KS','dommage aux canalisations','DC');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (1001,'od_dryweather_downspout','dryweather downspout','DD','Trockenwetterfallrohr','TF','tuyau de chute par temps sec','TT');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (1022,'od_param_ca_mouse1','param ca mouse1','PM','EZG_PARAMETER_MOUSE1','EM','paramètre bv mouse1','PM');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (1033,'od_fountain','fountain','FO','Brunnen','BR','fontaine','FO');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (1034,'od_reservoir','reservoir','RV','Reservoir','RV','réservoir','RE');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (1035,'od_building','building','BU','Gebäude','BD','bâtiment','BT');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (1036,'od_individual_surface','individual surface','IS','Einzelfläche','FL','surface individuelle','SI');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (104,'od_planning_zone','planning zone','PL','Planungszone','PL','zones réservées','ZR');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (105,'od_zone','zone','ZO','Zone','ZO','zone','ZO');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (106,'od_infiltration_zone','infiltration zone','IZ','Versickerungsbereich','VB','zone d''infiltration','ZI');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (107,'od_benching','benching','BE','Bankett','BN','banquette','BQ');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (108,'od_wwtp_energy_use','wwtp energy use','EU','ARA Energienutzung','AE','consomation d''énergie d''une step','EN');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (109,'od_electric_equipment','electric equipment','EE','Elektrische Einrichtung','EE','equipement électrique','EE');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (11,'od_bathing_area','bathing area','BA','Badestelle','BS','lieu de baignade','LB');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (110,'od_electromechanical_equipment','electromechanical equipment','EQ','Elektromechanische Ausrüstung','EA','equipement électromécanique','EQ');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (111,'od_maintenance_event','maintenance event','ME','Erhaltungsereignis','EH','evénement de maintenance','EM');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (112,'od_dam','dam','DA','Gewässerwehr','WH','ouvrage de retenue','OR');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (113,'od_ford','ford','FD','Furt','FU','passage à gué','PG');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (114,'od_chute','chute','CE','Gewässer Absturz','AZ','seuil','SL');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (115,'od_lock','lock','LO','Schleuse','SL','ecluse','EC');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (116,'od_passage','passage','PA','Durchlass','DL','passage en tuyau','PA');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (117,'od_blocking_debris','blocking debris','BD','Geschiebesperre','GP','barrage à alluvions','BA');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (118,'od_rock_ramp','rock ramp','RR','Sohlrampe','SR','rampe','RA');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (119,'od_fish_pass','fish pass','FP','Fischpass','FP','echelle à poissons','EP');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (120,'od_groundwater_protection_zone','groundwater protection zone','GZ','Grundwasserschutzzone','GZ','zone de protection des eaux souterraines','ZP');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (121,'od_ground_water_protection_perimeter','ground water protection perimeter','GP','Grundwasserschutzareal','GS','périmètre de protection des eaux souterraines','PP');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (13,'od_structure_part','structure part','SP','Bauwerksteil','BT','elément d''ouvrage','EO');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (15,'od_cover','cover','CO','Deckel','DE','couvercle','CO');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (16,'od_throttle_shut_off_unit','throttle shut off unit','TS','Absperr-/Drosselorgan','DR','limiteur de débit','LD');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (18,'od_access_aid','access aid','AA','Einstiegshilfe','EF','dispositif d''accès','DA');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (19,'od_catchment_area','catchment area','CA','Einzugsgebiet','EZ','bassin versant','BV');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (2,'od_wastewater_structure','wastewater structure','WS','Abwasserbauwerk','BW','ouvrage du réseau d''évacuation','OU');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (21,'od_river','river','RI','Fliessgewässer','FG','cours d''eau','CE');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (3728,'od_damage_manhole','damage manhole','DM','Normschachtschaden','SS','dommage chambre standard','SS');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (3754,'od_file','file','FI','Datei','DA','fichier','FI');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (3776,'od_data_media','data media','VO','Datenträger','DT','support données','SO');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (38,'od_channel','channel','CL','Kanal','KA','canalisation','CA');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (39,'od_canton','canton','CT','Kanton','KT','canton','CN');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (4,'od_wastewater_node','wastewater node','WN','Abwasserknoten','AK','noeud de réseau','NR');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (41,'od_leapingweir','leapingweir','LW','Leapingwehr','LW','leapingweir','LW');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (42,'od_measurement_series','measurement series','MS','Messreihe','MH','série de mesures','SE');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (43,'od_measurement_result','measurement result','MR','Messresultat','MR','résultat de la mesure','RM');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (44,'od_measuring_point','measuring point','MP','Messstelle','MS','station de mesure','SM');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (45,'od_manhole','manhole','MA','Normschacht','NS','chambre standard','CS');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (4586,'od_cooperative','cooperative','CP','Genossenschaft/Kooperation','GN','cooperative','GK');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (46,'od_surface_runoff_parameters','surface runoff parameters','SR','Oberflächenabflussparameter','OP','paramètres d''écoulement superficiel','PE');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (47,'od_organisation','organisation','OG','Organisation','OG','organisation','OG');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (48,'od_private','private','PR','Privat','PR','privé','PR');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (49,'od_pipe_profile','pipe profile','PP','Rohrprofil','RP','genre de profil de tuyau','GP');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (5,'od_wastewater_networkelement','wastewater networkelement','WE','Abwassernetzelement','AN','elément du réseau d''évacuation des eaux','ER');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (50,'od_pump','pump','PU','Förderaggregat','FA','installation de refoulement','IR');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (5000,'od_measure','measure','MM','Massnahme','MP','mésure','MX');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (53,'od_retention_body','retention body','RB','Retentionskörper','RK','volume de rétention','VR');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (55,'od_sludge_treatment','sludge treatment','ST','Schlammbehandlung','SH','traitement des boues','TB');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (56,'od_lake','lake','LA','See','SE','lac','LA');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (57,'od_special_structure','special structure','SS','Spezialbauwerk','SW','ouvrage spécial','OC');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (58,'od_substance','substance','SB','Stoff','ST','substance','SB');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (60,'od_prank_weir','prank weir','PW','Streichwehr','WE','déversoir latéral','DL');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (6100,'od_building_group','building group','BG','Gebäudegruppe','GG','bâtiment','BG');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (6101,'od_farm','farm','FA','Landwirtschaftsbetrieb','LB','exploitation agricole','EA');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (6103,'od_small_treatment_plant','small treatment plant','SM','KLARA','KL','petite step','PS');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (6105,'od_building_group_baugwr','building group baugwr','BW','Gebäudegruppe BAUGWR','BA','bâtiment bauregbl','BR');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (6107,'od_toilet','toilet','','Toilette','','toilette','');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (62,'od_dryweather_flume','dryweather flume','DF','Trockenwetterrinne','TR','cunette de débit temps sec','CU');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (63,'od_overflow','overflow','OF','Überlauf','UE','déversoir','DE');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (64,'od_overflow_characteristic','overflow characteristic','OC','Überlaufcharakteristik','UC','caractéristiques du déversoir','CD');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (65,'od_river_bank','river bank','SI','Ufer','UF','rive','RI');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (66,'od_accident','accident','AC','Unfall','UL','accident','AC');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (67,'od_waste_water_association','waste water association','WA','Abwasserverband','AV','association pour l''épuration des eaux usées','AS');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (68,'od_infiltration_installation','infiltration installation','II','Versickerungsanlage','VA','installation d''infiltration','II');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (69,'od_discharge_point','discharge point','DP','Einleitstelle','VE','exutoire au milieu récepteur','EX');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (70,'od_mechanical_pretreatment','mechanical pretreatment','MT','Mechanische Vorreinigung','MV','prétraitement méchanique','ME');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (72,'od_water_body_protection_sector','water body protection sector','PS','Gewässerschutzbereich','GB','secteur de protection des eaux','SP');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (8,'od_connection_object','connection object','CN','Anschlussobjekt','AO','objet raccordé','OB');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (9,'od_waste_water_treatment_plant','waste water treatment plant','TP','Abwasserreinigungsanlage','AR','station d''épuration des eaux usées','ST');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (97,'od_wwtp_structure','wwtp structure','WT','ARA Bauwerk','AW','ouvrages d''une  step','OS');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (99,'od_measuring_device','measuring device','MV','Messgerät','MG','appareil de mesure','AP');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (9998,'od_text','TEXT','','Text','TX','texte','TX');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (9999,'od_mutation','mutation','MD','Mutation','MD','mutation','MD');
