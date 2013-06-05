------ this file generates the qgep is_dictionary on QQIS
------ for questions etc please contact stefan burckhardt stefan.burckhardt@sjib.ch
------ version 24.04.2013 15:22:54
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
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (1001,'qgep.od_dryweather_downspout','dryweather_downspout','DD','Trockenwetterfallrohr','TF','Tuyau_chute','TT');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (1022,'qgep.od_param_ca_mouse1','param_ca_mouse1','PM','EZG_PARAMETER_MOUSE1','EM','Param_bv_mouse1','PM');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (1033,'qgep.od_fountain','fountain','FO','Brunnen','BR','Fontaine','FO');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (1034,'qgep.od_reservoir','reservoir','RV','Reservoir','RV','Reservoir','RE');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (1035,'qgep.od_building','building','BU','Gebaeude','BD','Batiment','BT');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (1036,'qgep.od_individual_surface','individual_surface','IS','Einzelflaeche','FL','Surface_individuelle','SI');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (104,'qgep.od_planning_zone','planning_zone','PL','Planungszone','PL','Zone_reservee','ZR');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (105,'qgep.od_zone','zone','ZO','Zone','ZO','Zone','ZO');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (106,'qgep.od_infiltration_zone','infiltration_zone','IZ','Versickerungsbereich','VB','Zone_infiltration','ZI');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (107,'qgep.od_benching','benching','BE','Bankett','BN','Banquette','BQ');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (108,'qgep.od_wwtp_energy_use','wwtp_energy_use','EU','ARAEnergienutzung','AE','Consommation_energie_step','EN');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (109,'qgep.od_electric_equipment','electric_equipment','EE','ElektrischeEinrichtung','EE','Equipement_electrique','EE');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (11,'qgep.od_bathing_area','bathing_area','BA','Badestelle','BS','Lieu_baignade','LB');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (110,'qgep.od_electromechanical_equipment','electromechanical_equipment','EQ','ElektromechanischeAusruestung','EA','Equipement_electromeca','EQ');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (111,'qgep.od_maintenance_event','maintenance_event','ME','Erhaltungsereignis','EH','Evenement_maintenance','EM');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (112,'qgep.od_dam','dam','DA','GewaesserWehr','WH','Ouvrage_retenue','OR');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (113,'qgep.od_ford','ford','FD','Furt','FU','Passage_a_gue','PG');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (114,'qgep.od_chute','chute','CE','GewaesserAbsturz','AZ','Seuil','SL');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (115,'qgep.od_lock','lock','LO','Schleuse','SL','Ecluse','EC');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (116,'qgep.od_passage','passage','PA','Durchlass','DL','Passage_sous_tuyaux','PA');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (117,'qgep.od_blocking_debris','blocking_debris','BD','Geschiebesperre','GP','Barrage_alluvions','BA');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (118,'qgep.od_rock_ramp','rock_ramp','RR','Sohlrampe','SR','Rampe','RA');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (119,'qgep.od_fish_pass','fish_pass','FP','Fischpass','FP','Echelle_poissons','EP');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (120,'qgep.od_groundwater_protection_zone','groundwater_protection_zone','GZ','Grundwasserschutzzone','GZ','Zone_prot_eaux_sout','ZP');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (121,'qgep.od_ground_water_protection_perimeter','ground_water_protection_perimeter','GP','Grundwasserschutzareal','GS','Perimetre_prot_eaux_sout','PP');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (13,'qgep.od_structure_part','structure_part','SP','BauwerksTeil','BT','Element_ouvrage','EO');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (15,'qgep.od_cover','cover','CO','Deckel','DE','Couvercle','CO');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (16,'qgep.od_throttle_shut_off_unit','throttle_shut_off_unit','TS','Absperr_Drosselorgan','DR','Limiteur_debit','LD');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (18,'qgep.od_access_aid','access_aid','AA','Einstiegshilfe','EF','Dispositif_d_acces','DA');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (19,'qgep.od_catchment_area','catchment_area','CA','Einzugsgebiet','EZ','Bassin_versant','BV');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (2,'qgep.od_wastewater_structure','wastewater_structure','WS','Abwasserbauwerk','BW','Ouvrage_reseau_as','OU');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (21,'qgep.od_river','river','RI','Fliessgewaesser','FG','Cours_eau','CE');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (23,'qgep.od_hazard_source','hazard_source','HS','Gefahrenquelle','GQ','Source_danger','SD');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (24,'qgep.od_municipality','municipality','MU','Gemeinde','GE','Commune','CM');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (25,'qgep.od_surface_water_bodies','surface_water_bodies','CU','Oberflaechengewaesser','GW','Eaux_superficielles','ES');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (26,'qgep.od_water_course_segment','water_course_segment','SE','Gewaesserabschnitt','GA','Troncon_cours_eau','TC');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (2652,'qgep.od_sector_water_body','sector_water_body','SW','Gewaessersektor','GK','Secteur_eaux_sup','SU');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (27,'qgep.od_river_bed','river_bed','RD','Gewaessersohle','GO','Fond_cours_eau','FC');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (2721,'qgep.od_drainage_system','drainage_system','DS','Entwaesserungssystem','ES','Systeme_evacuation_eaux','SY');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (2723,'qgep.od_control_center','control_center','CC','Steuerungszentrale','SZ','Centrale_commande','CC');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (2733,'qgep.od_administrative_office','administrative_office','AO','Amt','AM','Office','OF');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (28,'qgep.od_water_control_structure','water_control_structure','CS','Gewaesserverbauung','GV','Amenagement_cours_eau','AM');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (29,'qgep.od_water_catchment','water_catchment','WC','Wasserfassung','WF','Captage','CP');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (2964,'qgep.od_profile_geometry','profile_geometry','PG','Rohrprofil_Geometrie','RG','Profil_tuyau_geom','TG');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (3,'qgep.od_waste_water_treatment','waste_water_treatment','TR','Abwasserbehandlung','AH','Traitement_eaux_usees','TE');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (30,'qgep.od_aquifier','aquifier','AQ','Grundwasserleiter','GL','Aquifere','AQ');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (31,'qgep.od_reach','reach','RE','Haltung','HA','Troncon','TR');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (3189,'qgep.od_param_ca_general','param_ca_general','PC','EZG_PARAMETER_ALLG','EG','Param_bv_general','PB');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (32,'qgep.od_reach_point','reach_point','RP','Haltungspunkt','HP','Point_troncon','PT');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (33,'qgep.od_hq_relation','hq_relation','HQ','HQ_Relation','HR','Relation_hq','HQ');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (36,'qgep.od_hydr_geometry','hydr_geometry','HG','Hydr_Geometrie','HG','Geometrie_hydr','GH');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (3679,'qgep.od_examination','examination','EX','Untersuchung','UN','Examen','IN');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (37,'qgep.od_hydr_geom_relation','hydr_geom_relation','HR','Hydr_GeomRelation','HY','Relation_geom_hydr','RG');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (3705,'qgep.od_damage','damage','DG','Schaden','SC','Dommage','DO');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (3714,'qgep.od_damage_channel','damage_channel','DC','Kanalschaden','KS','Dommage_aux_canalisations','DC');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (3728,'qgep.od_damage_manhole','damage_manhole','DM','Normschachtschaden','SS','Dommage_chambre_standard','SS');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (3754,'qgep.od_file','file','FI','Datei','DA','Fichier','FI');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (3776,'qgep.od_data_media','data_media','VO','Datentraeger','DT','Support_donnees','SO');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (38,'qgep.od_channel','channel','CL','Kanal','KA','Canalisation','CA');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (39,'qgep.od_canton','canton','CT','Kanton','KT','Canton','CN');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (4,'qgep.od_wastewater_node','wastewater_node','WN','Abwasserknoten','AK','Noeud_reseau','NR');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (41,'qgep.od_leapingweir','leapingweir','LW','Leapingwehr','LW','Leaping_weir','LW');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (42,'qgep.od_measurement_series','measurement_series','MS','Messreihe','MH','Serie_mesures','SE');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (43,'qgep.od_measurement_result','measurement_result','MR','Messresultat','MR','Resultat_mesure','RM');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (44,'qgep.od_measuring_point','measuring_point','MP','Messstelle','MS','Station_mesure','SM');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (45,'qgep.od_manhole','manhole','MA','Normschacht','NS','Chambre_standard','CS');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (46,'qgep.od_surface_runoff_parameters','surface_runoff_parameters','SR','Oberflaechenabflussparameter','OP','Param_ecoulement_sup','PE');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (47,'qgep.od_organisation','organisation','OG','Organisation','OG','Organisation','OG');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (48,'qgep.od_privat','privat','PR','Privat','PR','Prive','PR');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (49,'qgep.od_pipe_profile','pipe_profile','PP','Rohrprofil','RP','Profil_tuyau','GP');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (5,'qgep.od_wastewater_networkelement','wastewater_networkelement','WE','Abwassernetzelement','AN','Element_reseau_evacuation','ER');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (50,'qgep.od_pump','pump','PU','FoerderAggregat','FA','Installation_refoulement','IR');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (5000,'qgep.od_measure','measure','MM','Massnahme','MP','Mesure','MX');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (53,'qgep.od_retention_body','retention_body','RB','Retentionskoerper','RK','Volume_retention','VR');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (55,'qgep.od_sludge_treatment','sludge_treatment','ST','Schlammbehandlung','SH','Traitement_boues','TB');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (56,'qgep.od_lake','lake','LA','See','SE','Lac','LA');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (57,'qgep.od_special_structure','special_structure','SS','Spezialbauwerk','SW','Ouvrage_special','OC');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (58,'qgep.od_substance','substance','SB','Stoff','ST','Substance','SB');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (60,'qgep.od_prank_weir','prank_weir','PW','Streichwehr','WE','Deversoir_lateral','DL');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (62,'qgep.od_dryweather_flume','dryweather_flume','DF','Trockenwetterrinne','TR','Cunette_debit_temps_sec','CU');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (63,'qgep.od_overflow','overflow','OF','Ueberlauf','UE','Deversoir','DE');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (64,'qgep.od_overflow_characteristic','overflow_characteristic','OC','Ueberlaufcharakteristik','UC','Caracteristiques_deversoir','CD');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (65,'qgep.od_river_bank','river_bank','SI','Ufer','UF','Rive','RI');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (66,'qgep.od_accident','accident','AC','Unfall','UL','Accident','AC');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (67,'qgep.od_waste_water_association','waste_water_association','WA','Abwasserverband','AV','Association_epuration_eau','AS');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (68,'qgep.od_infiltration_installation','infiltration_installation','II','Versickerungsanlage','VA','Installation_infiltration','II');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (69,'qgep.od_discharge_point','discharge_point','DP','Einleitstelle','VE','Exutoire','EX');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (70,'qgep.od_mechanical_pretreatment','mechanical_pretreatment','MT','MechanischeVorreinigung','MV','Pretraitement_mecanique','ME');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (72,'qgep.od_water_body_protection_sector','water_body_protection_sector','PS','Gewaesserschutzbereich','GB','Secteur_protection_eaux','SP');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (8,'qgep.od_connection_object','connection_object','CN','Anschlussobjekt','AO','Objet_raccorde','OB');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (9,'qgep.od_waste_water_treatment_plant','waste_water_treatment_plant','TP','Abwasserreinigungsanlage','AR','Station_epuration','ST');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (97,'qgep.od_wwtp_structure','wwtp_structure','WT','ARABauwerk','AW','Ouvrages_step','OS');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (99,'qgep.od_measuring_device','measuring_device','MV','Messgeraet','MG','Appareil_mesure','AP');
 INSERT INTO qgep.is_dictionary (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr) VALUES (9999,'qgep.od_mutation','mutation','MD','MUTATION','MD','Mutation','MD');
