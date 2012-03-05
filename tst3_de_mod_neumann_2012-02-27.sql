CREATE SCHEMA qgep;

CREATE TABLE qgep.od_organisation
(
   obj_id  VARCHAR(36) NOT NULL,
   CONSTRAINT pkey_od_organisation_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_organisation.obj_id IS 'INTERLIS OID mit Postfix/Präfix oder UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_organisation ADD COLUMN bemerkung  varchar(80) ;
 ALTER TABLE qgep.od_organisation ADD COLUMN bezeichnung  varchar(20) ;
 CREATE UNIQUE INDEX in_od_organisation_bezeichnung ON qgep.od_organisation USING btree (bezeichnung);
 ALTER TABLE qgep.od_organisation ADD COLUMN letzte_aenderung timestamp without time zone;
 ALTER TABLE qgep.od_organisation ADD COLUMN datenherr VARCHAR(50) ;
CREATE TABLE qgep.od_haltungspunkt
(
   obj_id  VARCHAR(36) NOT NULL,
   CONSTRAINT pkey_od_haltungspunkt_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_haltungspunkt.obj_id IS 'INTERLIS OID mit Postfix/Präfix oder UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_haltungspunkt ADD COLUMN auslaufform  varchar(50) ;
 ALTER TABLE qgep.od_haltungspunkt ADD COLUMN bemerkung  varchar(80) ;
 ALTER TABLE qgep.od_haltungspunkt ADD COLUMN bezeichnung  varchar(20) ;
 CREATE UNIQUE INDEX in_od_haltungspunkt_bezeichnung ON qgep.od_haltungspunkt USING btree (bezeichnung);
 ALTER TABLE qgep.od_haltungspunkt ADD COLUMN hoehengenauigkeit  varchar(50);
 ALTER TABLE qgep.od_haltungspunkt ADD COLUMN kote  decimal(4,3);
 ALTER TABLE qgep.od_haltungspunkt ADD COLUMN lage geometry;
 ALTER TABLE qgep.od_haltungspunkt ADD CONSTRAINT enforce_dims_lage CHECK (ndims (lage) = 2);
 ALTER TABLE qgep.od_haltungspunkt ADD CONSTRAINT enforce_geotype_lage CHECK (geometrytype (lage) = 'POINT'::text OR lage IS NULL);
 ALTER TABLE qgep.od_haltungspunkt ADD COLUMN lage_anschluss  smallint ;
 ALTER TABLE qgep.od_haltungspunkt ADD COLUMN letzte_aenderung timestamp without time zone ;
 ALTER TABLE qgep.od_haltungspunkt ADD COLUMN datenherr VARCHAR(50) ;
CREATE TABLE qgep.od_bauwerksteil
(
   obj_id  VARCHAR(36) NOT NULL,
   CONSTRAINT pkey_od_bauwerksteil_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_bauwerksteil.obj_id IS 'INTERLIS OID mit Postfix/Präfix oder UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_bauwerksteil ADD COLUMN bemerkung  varchar(80) ;
 ALTER TABLE qgep.od_bauwerksteil ADD COLUMN bezeichnung  varchar(20) ;
 CREATE UNIQUE INDEX in_od_bauwerksteil_bezeichnung ON qgep.od_bauwerksteil USING btree (bezeichnung);
 ALTER TABLE qgep.od_bauwerksteil ADD COLUMN instandstellung  varchar(50) ;
 ALTER TABLE qgep.od_bauwerksteil ADD COLUMN letzte_aenderung timestamp without time zone ;
 ALTER TABLE qgep.od_bauwerksteil ADD COLUMN datenherr VARCHAR(50) ;
CREATE TABLE qgep.od_abwassernetzelement
(
   obj_id  VARCHAR(36) NOT NULL,
   CONSTRAINT pkey_od_abwassernetzelement_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_abwassernetzelement.obj_id IS 'INTERLIS OID mit Postfix/Präfix oder UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_abwassernetzelement ADD COLUMN bemerkung  varchar(80) ;
 ALTER TABLE qgep.od_abwassernetzelement ADD COLUMN bezeichnung  varchar(20) ;
 CREATE UNIQUE INDEX in_od_abwassernetzelement_bezeichnung ON qgep.od_abwassernetzelement USING btree (bezeichnung);
 ALTER TABLE qgep.od_abwassernetzelement ADD COLUMN letzte_aenderung timestamp without time zone ;
 ALTER TABLE qgep.od_abwassernetzelement ADD COLUMN datenherr VARCHAR(50) ;
CREATE TABLE qgep.od_rohrprofil
(
   obj_id  VARCHAR(36) NOT NULL,
   CONSTRAINT pkey_od_rohrprofil_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_rohrprofil.obj_id IS 'INTERLIS OID mit Postfix/Präfix oder UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_rohrprofil ADD COLUMN bemerkung  varchar(80) ;
 ALTER TABLE qgep.od_rohrprofil ADD COLUMN bezeichnung  varchar(20) ;
 CREATE UNIQUE INDEX in_od_rohrprofil_bezeichnung ON qgep.od_rohrprofil USING btree (bezeichnung);
 ALTER TABLE qgep.od_rohrprofil ADD COLUMN hoehenbreitenverhaeltnis  decimal(3,2) ;
 ALTER TABLE qgep.od_rohrprofil ADD COLUMN profiltyp  varchar(50) ;
 ALTER TABLE qgep.od_rohrprofil ADD COLUMN letzte_aenderung timestamp without time zone ;
 ALTER TABLE qgep.od_rohrprofil ADD COLUMN datenherr VARCHAR(50) ;
CREATE TABLE qgep.od_abwasserbauwerk
(
   obj_id  VARCHAR(36) NOT NULL,
   CONSTRAINT pkey_od_abwasserbauwerk_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_abwasserbauwerk.obj_id IS 'INTERLIS OID mit Postfix/Präfix oder UUOID, see www.interlis.ch';
 ALTER TABLE qgep.od_abwasserbauwerk ADD COLUMN baujahr  smallint ;
 ALTER TABLE qgep.od_abwasserbauwerk ADD COLUMN baulicherzustand  varchar(50) ;
 ALTER TABLE qgep.od_abwasserbauwerk ADD COLUMN baulos  varchar(50) ;
 ALTER TABLE qgep.od_abwasserbauwerk ADD COLUMN bemerkung  varchar(80) ;
 ALTER TABLE qgep.od_abwasserbauwerk ADD COLUMN bezeichnung  varchar(20) ;
 CREATE UNIQUE INDEX in_od_abwasserbauwerk_bezeichnung ON qgep.od_abwasserbauwerk USING btree (bezeichnung);
 ALTER TABLE qgep.od_abwasserbauwerk ADD COLUMN bruttokosten  decimal(8,2) ;
 ALTER TABLE qgep.od_abwasserbauwerk ADD COLUMN ersatzjahr  smallint ;
 ALTER TABLE qgep.od_abwasserbauwerk ADD COLUMN inspektionsintervall  decimal(2,2) ;
 ALTER TABLE qgep.od_abwasserbauwerk ADD COLUMN sanierungsbedarf  varchar(50) ;
 ALTER TABLE qgep.od_abwasserbauwerk ADD COLUMN standortname  varchar(50) ;
 ALTER TABLE qgep.od_abwasserbauwerk ADD COLUMN status  varchar(50) ;
 ALTER TABLE qgep.od_abwasserbauwerk ADD COLUMN subventionen  decimal(8,2) ;
 ALTER TABLE qgep.od_abwasserbauwerk ADD COLUMN zugaenglichkeit  varchar(50) ;
 ALTER TABLE qgep.od_abwasserbauwerk ADD COLUMN letzte_aenderung timestamp without time zone ;
 ALTER TABLE qgep.od_abwasserbauwerk ADD COLUMN datenherr VARCHAR(50) ;
CREATE TABLE qgep.od_bankett
(
   obj_id  VARCHAR(36) NOT NULL,
   CONSTRAINT pkey_od_bankett_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_bankett.obj_id IS 'INTERLIS OID mit Postfix/Präfix oder UUOID, see www.interlis.ch';
-- ALTER TABLE qgep.od_bankett ADD COLUMN ..    ;
 ALTER TABLE qgep.od_bankett ADD COLUMN art  varchar(50) ;
CREATE TABLE qgep.od_trockenwetterrinne
(
   obj_id  VARCHAR(36) NOT NULL,
   CONSTRAINT pkey_od_trockenwetterrinne_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_trockenwetterrinne.obj_id IS 'INTERLIS OID mit Postfix/Präfix oder UUOID, see www.interlis.ch';
-- ALTER TABLE qgep.od_trockenwetterrinne ADD COLUMN ..    ;
 ALTER TABLE qgep.od_trockenwetterrinne ADD COLUMN material  varchar(50) ;
CREATE TABLE qgep.od_deckel
(
   obj_id  VARCHAR(36) NOT NULL,
   CONSTRAINT pkey_OD_DECKEL_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_deckel.obj_id IS 'INTERLIS OID mit Postfix/Präfix oder UUOID, see www.interlis.ch';
-- ALTER TABLE qgep.od_deckel ADD COLUMN ..    ;
 ALTER TABLE qgep.od_deckel ADD COLUMN deckelform  varchar(50) ;
 ALTER TABLE qgep.od_deckel ADD COLUMN durchmesser  smallint ;
 ALTER TABLE qgep.od_deckel ADD COLUMN entlueftung  varchar(50) ;
 ALTER TABLE qgep.od_deckel ADD COLUMN fabrikat  varchar(50) ;
 ALTER TABLE qgep.od_deckel ADD COLUMN kote  decimal(4,3) ;
 ALTER TABLE qgep.od_deckel ADD COLUMN lage geometry;
 ALTER TABLE qgep.od_deckel ADD CONSTRAINT enforce_dims_lage CHECK (ndims (lage) = 2);
 ALTER TABLE qgep.od_deckel ADD CONSTRAINT enforce_geotype_lage CHECK (geometrytype (lage) = 'POINT'::text OR lage IS NULL);
 ALTER TABLE qgep.od_deckel ADD COLUMN lagegenauigkeit  varchar(50) ;
 ALTER TABLE qgep.od_deckel ADD COLUMN material  varchar(50) ;
 ALTER TABLE qgep.od_deckel ADD COLUMN schlammeimer  varchar(50) ;
 ALTER TABLE qgep.od_deckel ADD COLUMN verschluss  varchar(50) ;
CREATE TABLE qgep.od_einstiegshilfe
(
   obj_id  VARCHAR(36) NOT NULL,
   CONSTRAINT pkey_OD_EINSTIEGSHILFE_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_einstiegshilfe.obj_id IS 'INTERLIS OID mit Postfix/Präfix oder UUOID, see www.interlis.ch';
-- ALTER TABLE qgep.od_einstiegshilfe ADD COLUMN ..    ;
 ALTER TABLE qgep.od_einstiegshilfe ADD COLUMN art  varchar(50) ;
CREATE TABLE qgep.od_trockenwetterfallrohr
(
   obj_id  VARCHAR(36) NOT NULL,
   CONSTRAINT pkey_OD_TROCKENWETTERFALLROHR_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_trockenwetterfallrohr.obj_id IS 'INTERLIS OID mit Postfix/Präfix oder UUOID, see www.interlis.ch';
-- ALTER TABLE qgep.od_trockenwetterfallrohr ADD COLUMN ..    ;
 ALTER TABLE qgep.od_trockenwetterfallrohr ADD COLUMN durchmesser  smallint ;
CREATE TABLE qgep.od_kanal
(
   obj_id  VARCHAR(36) NOT NULL,
   CONSTRAINT pkey_OD_KANAL_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_kanal.obj_id IS 'INTERLIS OID mit Postfix/Präfix oder UUOID, see www.interlis.ch';
-- ALTER TABLE qgep.od_kanal ADD COLUMN ..    ;
 ALTER TABLE qgep.od_kanal ADD COLUMN bettung_umhuellung  varchar(50) ;
 ALTER TABLE qgep.od_kanal ADD COLUMN funktionhierarchisch  varchar(50) ;
 ALTER TABLE qgep.od_kanal ADD COLUMN funktionhydraulisch  varchar(50) ;
 ALTER TABLE qgep.od_kanal ADD COLUMN nutzungsart_geplant  varchar(50) ;
 ALTER TABLE qgep.od_kanal ADD COLUMN nutzungsart_ist  varchar(50) ;
 ALTER TABLE qgep.od_kanal ADD COLUMN rohrlaenge  decimal(5,2) ;
 ALTER TABLE qgep.od_kanal ADD COLUMN spuelintervall  decimal(2,2) ;
 ALTER TABLE qgep.od_kanal ADD COLUMN verbindungsart  varchar(50) ;
CREATE TABLE qgep.od_vorflutereinlauf
(
   obj_id  VARCHAR(36) NOT NULL,
   CONSTRAINT pkey_od_vorflutereinlauf_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_vorflutereinlauf.obj_id IS 'INTERLIS OID mit Postfix/Präfix oder UUOID, see www.interlis.ch';
-- ALTER TABLE qgep.od_vorflutereinlauf ADD COLUMN ..    ;
 ALTER TABLE qgep.od_vorflutereinlauf ADD COLUMN hochwasserkote  decimal(4,3) ;
CREATE TABLE qgep.od_normschacht
(
   obj_id  VARCHAR(36) NOT NULL,
   CONSTRAINT pkey_OD_NORMSCHACHT_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_normschacht.obj_id IS 'INTERLIS OID mit Postfix/Präfix oder UUOID, see www.interlis.ch';
-- ALTER TABLE qgep.od_normschacht ADD COLUMN ..    ;
 ALTER TABLE qgep.od_normschacht ADD COLUMN dimension1  smallint ;
 ALTER TABLE qgep.od_normschacht ADD COLUMN dimension2  smallint ;
 ALTER TABLE qgep.od_normschacht ADD COLUMN funktion  varchar(50) ;
 ALTER TABLE qgep.od_normschacht ADD COLUMN material  varchar(50) ;
 ALTER TABLE qgep.od_normschacht ADD COLUMN oberflaechenzulauf  varchar(50) ;
CREATE TABLE qgep.od_spezialbauwerk
(
   obj_id  VARCHAR(36) NOT NULL,
   CONSTRAINT pkey_od_spezialbauwerk_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_spezialbauwerk.obj_id IS 'INTERLIS OID mit Postfix/Präfix oder UUOID, see www.interlis.ch';
-- ALTER TABLE qgep.od_spezialbauwerk ADD COLUMN ..    ;
 ALTER TABLE qgep.od_spezialbauwerk ADD COLUMN bypass  varchar(50) ;
 ALTER TABLE qgep.od_spezialbauwerk ADD COLUMN funktion  varchar(50) ;
CREATE TABLE qgep.od_versickerungsanlage
(
   obj_id  VARCHAR(36) NOT NULL,
   CONSTRAINT pkey_OD_VERSICKERUNGSANLAGE_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_versickerungsanlage.obj_id IS 'INTERLIS OID mit Postfix/Präfix oder UUOID, see www.interlis.ch';
-- ALTER TABLE qgep.od_versickerungsanlage ADD COLUMN ..    ;
 ALTER TABLE qgep.od_versickerungsanlage ADD COLUMN art  varchar(50) ;
 ALTER TABLE qgep.od_versickerungsanlage ADD COLUMN beschriftung  varchar(50) ;
 ALTER TABLE qgep.od_versickerungsanlage ADD COLUMN dimension1  smallint ;
 ALTER TABLE qgep.od_versickerungsanlage ADD COLUMN dimension2  smallint ;
 ALTER TABLE qgep.od_versickerungsanlage ADD COLUMN gwdistanz  decimal(5,2) ;
 ALTER TABLE qgep.od_versickerungsanlage ADD COLUMN maengel  varchar(50) ;
 ALTER TABLE qgep.od_versickerungsanlage ADD COLUMN notueberlauf  varchar(50) ;
 ALTER TABLE qgep.od_versickerungsanlage ADD COLUMN saugwagen  varchar(50) ;
 ALTER TABLE qgep.od_versickerungsanlage ADD COLUMN schluckvermoegen  decimal(5,3) ;
 ALTER TABLE qgep.od_versickerungsanlage ADD COLUMN versickerungswasser  varchar(50) ;
 ALTER TABLE qgep.od_versickerungsanlage ADD COLUMN wasserdichtheit  varchar(50) ;
 ALTER TABLE qgep.od_versickerungsanlage ADD COLUMN wirksameflaeche  decimal(6,2) ;
CREATE TABLE qgep.od_haltung
(
   obj_id  VARCHAR(36) NOT NULL,
   CONSTRAINT pkey_OD_HALTUNG_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_haltung.obj_id IS 'INTERLIS OID mit Postfix/Präfix oder UUOID, see www.interlis.ch';
-- ALTER TABLE qgep.od_haltung ADD COLUMN ..    ;
 ALTER TABLE qgep.od_haltung ADD COLUMN innenschutz  varchar(50) ;
 ALTER TABLE qgep.od_haltung ADD COLUMN laengeeffektiv  decimal(5,2) ;
 ALTER TABLE qgep.od_haltung ADD COLUMN lagebestimmung  varchar(50) ;
 ALTER TABLE qgep.od_haltung ADD COLUMN lichte_hoehe  smallint ;
 ALTER TABLE qgep.od_haltung ADD COLUMN material  varchar(50) ;
 ALTER TABLE qgep.od_haltung ADD COLUMN reibungsbeiwert  smallint ;
 ALTER TABLE qgep.od_haltung ADD COLUMN wandrauhigkeit  decimal(3,2) ;
CREATE TABLE qgep.od_abwasserknoten
(
   obj_id  VARCHAR(36) NOT NULL,
   CONSTRAINT pkey_od_abwasserknoten_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
COMMENT ON COLUMN qgep.od_abwasserknoten.obj_id IS 'INTERLIS OID mit Postfix/Präfix oder UUOID, see www.interlis.ch';
-- ALTER TABLE qgep.od_abwasserknoten ADD COLUMN ..    ;
 ALTER TABLE qgep.od_abwasserknoten ADD COLUMN lage geometry;
 ALTER TABLE qgep.od_abwasserknoten ADD CONSTRAINT enforce_dims_lage CHECK (ndims (lage) = 2);
 ALTER TABLE qgep.od_abwasserknoten ADD CONSTRAINT enforce_geotype_lage CHECK (geometrytype (lage) = 'POINT'::text OR lage IS NULL);
 ALTER TABLE qgep.od_abwasserknoten ADD COLUMN rueckstaukote  decimal(4,3) ;
 ALTER TABLE qgep.od_abwasserknoten ADD COLUMN sohlenkote  decimal(4,3) ;
ALTER TABLE qgep.od_abwasserknoten ADD COLUMN fs_hydr_geometrie varchar(36);
--need to discuss this
--ALTER TABLE qgep.od_abwasserknoten ADD CONSTRAINT rel7 FOREIGN KEY (fs_hydr_geometrie) REFERENCES qgep.od_hydr_geometrie(obj_id);
CREATE TABLE qgep.wb_haltungspunkt_auslaufform( wert  varchar(50) not null );
 CREATE UNIQUE INDEX in_wb_haltungspunkt_auslaufform_wert ON qgep.wb_haltungspunkt_auslaufform (wert);
ALTER TABLE qgep.od_haltungspunkt ADD CONSTRAINT rel_od_haltungspunkt13 FOREIGN KEY (auslaufform) REFERENCES qgep.wb_haltungspunkt_auslaufform(wert);
 INSERT INTO qgep.wb_haltungspunkt_auslaufform (wert) VALUES ('abgerundet');
 INSERT INTO qgep.wb_haltungspunkt_auslaufform (wert) VALUES ('scharfkantig');
 INSERT INTO qgep.wb_haltungspunkt_auslaufform (wert) VALUES ('blendenfoermig');
 INSERT INTO qgep.wb_haltungspunkt_auslaufform (wert) VALUES ('unbekannt');
 INSERT INTO qgep.wb_haltungspunkt_auslaufform (wert) VALUES ('keine_Querschnittsaenderung');
CREATE TABLE qgep.wb_haltungspunkt_hoehengenauigkeit( wert  varchar(50) not null );
 CREATE UNIQUE INDEX in_wb_haltungspunkt_hoehengenauigkeit_wert ON qgep.wb_haltungspunkt_hoehengenauigkeit (wert);
ALTER TABLE qgep.od_haltungspunkt ADD CONSTRAINT rel_od_haltungspunkt16 FOREIGN KEY (hoehengenauigkeit) REFERENCES qgep.wb_haltungspunkt_hoehengenauigkeit(wert);
 INSERT INTO qgep.wb_haltungspunkt_hoehengenauigkeit (wert) VALUES ('plusminus_1cm');
 INSERT INTO qgep.wb_haltungspunkt_hoehengenauigkeit (wert) VALUES ('plusminus_3cm');
 INSERT INTO qgep.wb_haltungspunkt_hoehengenauigkeit (wert) VALUES ('plusminus_6cm');
 INSERT INTO qgep.wb_haltungspunkt_hoehengenauigkeit (wert) VALUES ('groesser_6cm');
 INSERT INTO qgep.wb_haltungspunkt_hoehengenauigkeit (wert) VALUES ('unbekannt');
ALTER TABLE qgep.od_haltungspunkt ADD COLUMN fs_abwassernetzelement varchar (36);
ALTER TABLE qgep.od_haltungspunkt ADD CONSTRAINT rel20 FOREIGN KEY (fs_abwassernetzelement) REFERENCES qgep.od_abwassernetzelement(obj_id);
CREATE TABLE qgep.wb_bauwerksteil_instandstellung( wert  varchar(50) not null );
 CREATE UNIQUE INDEX in_wb_bauwerksteil_instandstellung_wert ON qgep.wb_bauwerksteil_instandstellung (wert);
ALTER TABLE qgep.od_bauwerksteil ADD CONSTRAINT rel_od_bauwerksteil25 FOREIGN KEY (instandstellung) REFERENCES qgep.wb_bauwerksteil_instandstellung(wert);
 INSERT INTO qgep.wb_bauwerksteil_instandstellung (wert) VALUES ('notwendig');
 INSERT INTO qgep.wb_bauwerksteil_instandstellung (wert) VALUES ('nicht_notwendig');
 INSERT INTO qgep.wb_bauwerksteil_instandstellung (wert) VALUES ('unbekannt');
ALTER TABLE qgep.od_bauwerksteil ADD COLUMN fs_abwasserbauwerk varchar (36);
ALTER TABLE qgep.od_bauwerksteil ADD CONSTRAINT rel26 FOREIGN KEY (fs_abwasserbauwerk) REFERENCES qgep.od_abwasserbauwerk(obj_id);
ALTER TABLE qgep.od_abwassernetzelement ADD COLUMN fs_abwasserbauwerk varchar (36);
ALTER TABLE qgep.od_abwassernetzelement ADD CONSTRAINT rel29 FOREIGN KEY (fs_abwasserbauwerk) REFERENCES qgep.od_abwasserbauwerk(obj_id);
CREATE TABLE qgep.wb_rohrprofil_profiltyp( wert  varchar(50) not null );
 CREATE UNIQUE INDEX in_wb_rohrprofil_wert ON qgep.wb_rohrprofil_profiltyp (wert);
ALTER TABLE qgep.od_rohrprofil ADD CONSTRAINT rel_od_rohrprofil33 FOREIGN KEY (profiltyp) REFERENCES qgep.wb_rohrprofil_profiltyp(wert);
 INSERT INTO qgep.wb_rohrprofil_profiltyp (wert) VALUES ('Kreisprofil');
 INSERT INTO qgep.wb_rohrprofil_profiltyp (wert) VALUES ('Eiprofil');
 INSERT INTO qgep.wb_rohrprofil_profiltyp (wert) VALUES ('Maulprofil');
 INSERT INTO qgep.wb_rohrprofil_profiltyp (wert) VALUES ('Rechteckprofil');
 INSERT INTO qgep.wb_rohrprofil_profiltyp (wert) VALUES ('offenes_Profil');
 INSERT INTO qgep.wb_rohrprofil_profiltyp (wert) VALUES ('Spezialprofil');
 INSERT INTO qgep.wb_rohrprofil_profiltyp (wert) VALUES ('andere');
 INSERT INTO qgep.wb_rohrprofil_profiltyp (wert) VALUES ('unbekannt');
CREATE TABLE qgep.qb_abwasserbauwerk_baulicherzustand( wert  varchar(50) not null );
 CREATE UNIQUE INDEX in_qb_abwasserbauwerk_baulicherzustand_wert ON qgep.qb_abwasserbauwerk_baulicherzustand (wert);
ALTER TABLE qgep.od_abwasserbauwerk ADD CONSTRAINT rel_od_abwasserbauwerk36 FOREIGN KEY (baulicherzustand) REFERENCES qgep.qb_abwasserbauwerk_baulicherzustand(wert);
 INSERT INTO qgep.qb_abwasserbauwerk_baulicherzustand (wert) VALUES ('unbekannt');
 INSERT INTO qgep.qb_abwasserbauwerk_baulicherzustand (wert) VALUES ('Z1');
 INSERT INTO qgep.qb_abwasserbauwerk_baulicherzustand (wert) VALUES ('Z2');
 INSERT INTO qgep.qb_abwasserbauwerk_baulicherzustand (wert) VALUES ('Z3');
 INSERT INTO qgep.qb_abwasserbauwerk_baulicherzustand (wert) VALUES ('Z4');
 INSERT INTO qgep.qb_abwasserbauwerk_baulicherzustand (wert) VALUES ('Z0');
CREATE TABLE qgep.wb_abwasserbauwerk_sanierungsbedarf( wert  varchar(50) not null );
 CREATE UNIQUE INDEX in_wb_abwasserbauwerk_sanierungsbedarf_wert ON qgep.wb_abwasserbauwerk_sanierungsbedarf (wert);
ALTER TABLE qgep.od_abwasserbauwerk ADD CONSTRAINT rel_od_abwasserbauwerk44 FOREIGN KEY (sanierungsbedarf) REFERENCES qgep.wb_abwasserbauwerk_sanierungsbedarf(wert);
 INSERT INTO qgep.wb_abwasserbauwerk_sanierungsbedarf (wert) VALUES ('dringend');
 INSERT INTO qgep.wb_abwasserbauwerk_sanierungsbedarf (wert) VALUES ('kurzfristig');
 INSERT INTO qgep.wb_abwasserbauwerk_sanierungsbedarf (wert) VALUES ('mittelfristig');
 INSERT INTO qgep.wb_abwasserbauwerk_sanierungsbedarf (wert) VALUES ('unbekannt');
 INSERT INTO qgep.wb_abwasserbauwerk_sanierungsbedarf (wert) VALUES ('langfristig');
 INSERT INTO qgep.wb_abwasserbauwerk_sanierungsbedarf (wert) VALUES ('keiner');
CREATE TABLE qgep.wb_abwasserbauwerk_status( wert  varchar(50) not null );
 CREATE UNIQUE INDEX in_wb_abwasserbauwerk_status_wert ON qgep.wb_abwasserbauwerk_status (wert);
ALTER TABLE qgep.od_abwasserbauwerk ADD CONSTRAINT rel_od_abwasserbauwerk46 FOREIGN KEY (status) REFERENCES qgep.wb_abwasserbauwerk_status(wert);
 INSERT INTO qgep.wb_abwasserbauwerk_status (wert) VALUES ('provisorisch');
 INSERT INTO qgep.wb_abwasserbauwerk_status (wert) VALUES ('wird_aufgehoben');
 INSERT INTO qgep.wb_abwasserbauwerk_status (wert) VALUES ('Berechnungsvariante');
 INSERT INTO qgep.wb_abwasserbauwerk_status (wert) VALUES ('geplant');
 INSERT INTO qgep.wb_abwasserbauwerk_status (wert) VALUES ('unbekannt');
 INSERT INTO qgep.wb_abwasserbauwerk_status (wert) VALUES ('in_Betrieb');
 INSERT INTO qgep.wb_abwasserbauwerk_status (wert) VALUES ('Projekt');
 INSERT INTO qgep.wb_abwasserbauwerk_status (wert) VALUES ('aufgehoben_unbekannt');
 INSERT INTO qgep.wb_abwasserbauwerk_status (wert) VALUES ('ausser_Betrieb');
 INSERT INTO qgep.wb_abwasserbauwerk_status (wert) VALUES ('aufgehoben_nicht_verfuellt');
 INSERT INTO qgep.wb_abwasserbauwerk_status (wert) VALUES ('verfuellt');
CREATE TABLE qgep.wb_abwasserbauwerk_zugaenglichkeit( wert  varchar(50) not null );
 CREATE UNIQUE INDEX in_wb_abwasserbauwerk_zugaenglichkeit_wert ON qgep.wb_abwasserbauwerk_zugaenglichkeit (wert);
ALTER TABLE qgep.od_abwasserbauwerk ADD CONSTRAINT rel_od_abwasserbauwerk48 FOREIGN KEY (zugaenglichkeit) REFERENCES qgep.wb_abwasserbauwerk_zugaenglichkeit(wert);
 INSERT INTO qgep.wb_abwasserbauwerk_zugaenglichkeit (wert) VALUES ('ueberdeckt');
 INSERT INTO qgep.wb_abwasserbauwerk_zugaenglichkeit (wert) VALUES ('zugaenglich');
 INSERT INTO qgep.wb_abwasserbauwerk_zugaenglichkeit (wert) VALUES ('unzugaenglich');
 INSERT INTO qgep.wb_abwasserbauwerk_zugaenglichkeit (wert) VALUES ('unbekannt');
ALTER TABLE qgep.od_abwasserbauwerk ADD COLUMN fs_eigentuemer varchar (36);
ALTER TABLE qgep.od_abwasserbauwerk ADD CONSTRAINT rel49 FOREIGN KEY (fs_eigentuemer) REFERENCES qgep.od_organisation(obj_id);
ALTER TABLE qgep.od_abwasserbauwerk ADD COLUMN fs_betreiber varchar (36);
ALTER TABLE qgep.od_abwasserbauwerk ADD CONSTRAINT rel50 FOREIGN KEY (fs_betreiber) REFERENCES qgep.od_organisation(obj_id);
ALTER TABLE qgep.od_bankett ADD CONSTRAINT oorel51 FOREIGN KEY (obj_id) REFERENCES qgep.od_bauwerksteil(obj_id);
CREATE TABLE qgep.wb_bankett_art( wert  varchar(50) not null );
 CREATE UNIQUE INDEX in_wb_bankett_art_wert ON qgep.wb_bankett_art (wert);
ALTER TABLE qgep.od_bankett ADD CONSTRAINT rel_od_bankett53 FOREIGN KEY (art) REFERENCES qgep.wb_bankett_art(wert);
 INSERT INTO qgep.wb_bankett_art (wert) VALUES ('unbekannt');
 INSERT INTO qgep.wb_bankett_art (wert) VALUES ('andere');
 INSERT INTO qgep.wb_bankett_art (wert) VALUES ('kein');
 INSERT INTO qgep.wb_bankett_art (wert) VALUES ('einseitig');
 INSERT INTO qgep.wb_bankett_art (wert) VALUES ('beidseitig');
ALTER TABLE qgep.od_trockenwetterrinne ADD CONSTRAINT oorel54 FOREIGN KEY (obj_id) REFERENCES qgep.od_bauwerksteil(obj_id);
CREATE TABLE qgep.wb_trockenwetterrinne_material( wert  varchar(50) not null );
 CREATE UNIQUE INDEX in_wb_trockenwetterrinne_material_wert ON qgep.wb_trockenwetterrinne_material (wert);
ALTER TABLE qgep.od_trockenwetterrinne ADD CONSTRAINT rel_od_trockenwetterrinne56 FOREIGN KEY (material) REFERENCES qgep.wb_trockenwetterrinne_material(wert);
 INSERT INTO qgep.wb_trockenwetterrinne_material (wert) VALUES ('Zementmoertel');
 INSERT INTO qgep.wb_trockenwetterrinne_material (wert) VALUES ('Steinzeug');
 INSERT INTO qgep.wb_trockenwetterrinne_material (wert) VALUES ('Kunststoff');
 INSERT INTO qgep.wb_trockenwetterrinne_material (wert) VALUES ('unbekannt');
 INSERT INTO qgep.wb_trockenwetterrinne_material (wert) VALUES ('andere');
 INSERT INTO qgep.wb_trockenwetterrinne_material (wert) VALUES ('kombiniert');
ALTER TABLE qgep.od_deckel ADD CONSTRAINT oorel57 FOREIGN KEY (obj_id) REFERENCES qgep.od_bauwerksteil(obj_id);
CREATE TABLE qgep.wb_deckel_deckelform( wert  varchar(50) not null );
 CREATE UNIQUE INDEX in_wb_deckel_deckelform_wert ON qgep.wb_deckel_deckelform (wert);
ALTER TABLE qgep.od_deckel ADD CONSTRAINT rel_od_deckel59 FOREIGN KEY (deckelform) REFERENCES qgep.wb_deckel_deckelform(wert);
 INSERT INTO qgep.wb_deckel_deckelform (wert) VALUES ('rund');
 INSERT INTO qgep.wb_deckel_deckelform (wert) VALUES ('eckig');
 INSERT INTO qgep.wb_deckel_deckelform (wert) VALUES ('andere');
 INSERT INTO qgep.wb_deckel_deckelform (wert) VALUES ('unbekannt');
CREATE TABLE qgep.wb_deckel_entlueftung( wert  varchar(50) not null );
 CREATE UNIQUE INDEX in_wb_deckel_entlueftung_wert ON qgep.wb_deckel_entlueftung (wert);
ALTER TABLE qgep.od_deckel ADD CONSTRAINT rel_od_deckel61 FOREIGN KEY (entlueftung) REFERENCES qgep.wb_deckel_entlueftung(wert);
 INSERT INTO qgep.wb_deckel_entlueftung (wert) VALUES ('entlueftet');
 INSERT INTO qgep.wb_deckel_entlueftung (wert) VALUES ('nicht_entlueftet');
 INSERT INTO qgep.wb_deckel_entlueftung (wert) VALUES ('unbekannt');
CREATE TABLE qgep.wb_deckel_lagegenauigkeit( wert  varchar(50) not null );
 CREATE UNIQUE INDEX in_wb_deckel_lagegenauigkeit_wert ON qgep.wb_deckel_lagegenauigkeit (wert);
ALTER TABLE qgep.od_deckel ADD CONSTRAINT rel_od_deckel65 FOREIGN KEY (lagegenauigkeit) REFERENCES qgep.wb_deckel_lagegenauigkeit(wert);
 INSERT INTO qgep.wb_deckel_lagegenauigkeit (wert) VALUES ('plusminus_3cm');
 INSERT INTO qgep.wb_deckel_lagegenauigkeit (wert) VALUES ('plusminus_10cm');
 INSERT INTO qgep.wb_deckel_lagegenauigkeit (wert) VALUES ('plusminus_50cm');
 INSERT INTO qgep.wb_deckel_lagegenauigkeit (wert) VALUES ('groesser_50cm');
 INSERT INTO qgep.wb_deckel_lagegenauigkeit (wert) VALUES ('unbekannt');
CREATE TABLE qgep.wb_deckel_material( wert  varchar(50) not null );
 CREATE UNIQUE INDEX in_wb_deckel_material_wert ON qgep.wb_deckel_material (wert);
ALTER TABLE qgep.od_deckel ADD CONSTRAINT rel_od_deckel66 FOREIGN KEY (material) REFERENCES qgep.wb_deckel_material(wert);
 INSERT INTO qgep.wb_deckel_material (wert) VALUES ('Guss');
 INSERT INTO qgep.wb_deckel_material (wert) VALUES ('Beton');
 INSERT INTO qgep.wb_deckel_material (wert) VALUES ('Guss_mit_Betonfuellung');
 INSERT INTO qgep.wb_deckel_material (wert) VALUES ('Guss_mit_Belagsfuellung');
 INSERT INTO qgep.wb_deckel_material (wert) VALUES ('andere');
 INSERT INTO qgep.wb_deckel_material (wert) VALUES ('unbekannt');
CREATE TABLE qgep.wb_deckel_schlammeimer( wert  varchar(50) not null );
 CREATE UNIQUE INDEX in_wb_deckel_schlammeimer_wert ON qgep.wb_deckel_schlammeimer (wert);
ALTER TABLE qgep.od_deckel ADD CONSTRAINT rel_od_deckel67 FOREIGN KEY (schlammeimer) REFERENCES qgep.wb_deckel_schlammeimer(wert);
 INSERT INTO qgep.wb_deckel_schlammeimer (wert) VALUES ('unbekannt');
 INSERT INTO qgep.wb_deckel_schlammeimer (wert) VALUES ('vorhanden');
 INSERT INTO qgep.wb_deckel_schlammeimer (wert) VALUES ('nicht_vorhanden');
CREATE TABLE qgep.wb_deckel_verschluss( wert  varchar(50) not null );
 CREATE UNIQUE INDEX in_wb_deckel_verschluss_wert ON qgep.wb_deckel_verschluss (wert);
ALTER TABLE qgep.od_deckel ADD CONSTRAINT rel_od_deckel68 FOREIGN KEY (verschluss) REFERENCES qgep.wb_deckel_verschluss(wert);
 INSERT INTO qgep.wb_deckel_verschluss (wert) VALUES ('verschraubt');
 INSERT INTO qgep.wb_deckel_verschluss (wert) VALUES ('nicht_verschraubt');
 INSERT INTO qgep.wb_deckel_verschluss (wert) VALUES ('unbekannt');
ALTER TABLE qgep.od_einstiegshilfe ADD CONSTRAINT oorel69 FOREIGN KEY (obj_id) REFERENCES qgep.od_bauwerksteil(obj_id);
CREATE TABLE qgep.wb_einstiegshilfe_art( wert  varchar(50) not null );
 CREATE UNIQUE INDEX in_wb_einstiegshilfe_art_wert ON qgep.wb_einstiegshilfe_art (wert);
ALTER TABLE qgep.od_einstiegshilfe ADD CONSTRAINT rel_od_einstiegshilfe71 FOREIGN KEY (art) REFERENCES qgep.wb_einstiegshilfe_art(wert);
 INSERT INTO qgep.wb_einstiegshilfe_art (wert) VALUES ('Leiter');
 INSERT INTO qgep.wb_einstiegshilfe_art (wert) VALUES ('Steigeisen');
 INSERT INTO qgep.wb_einstiegshilfe_art (wert) VALUES ('Drucktuere');
 INSERT INTO qgep.wb_einstiegshilfe_art (wert) VALUES ('andere');
 INSERT INTO qgep.wb_einstiegshilfe_art (wert) VALUES ('unbekannt');
 INSERT INTO qgep.wb_einstiegshilfe_art (wert) VALUES ('Tuere');
 INSERT INTO qgep.wb_einstiegshilfe_art (wert) VALUES ('Treppe');
 INSERT INTO qgep.wb_einstiegshilfe_art (wert) VALUES ('Trittnischen');
 INSERT INTO qgep.wb_einstiegshilfe_art (wert) VALUES ('keine');
ALTER TABLE qgep.od_trockenwetterfallrohr ADD CONSTRAINT oorel72 FOREIGN KEY (obj_id) REFERENCES qgep.od_bauwerksteil(obj_id);
ALTER TABLE qgep.od_kanal ADD CONSTRAINT oorel75 FOREIGN KEY (obj_id) REFERENCES qgep.od_abwasserbauwerk(obj_id);
CREATE TABLE qgep.wb_kanal_bettung_umhuellung( wert  varchar(50) not null );
 CREATE UNIQUE INDEX in_wb_kanal_bettung_umhuellung_wert ON qgep.wb_kanal_bettung_umhuellung (wert);
ALTER TABLE qgep.od_kanal ADD CONSTRAINT rel_od_kanal77 FOREIGN KEY (bettung_umhuellung) REFERENCES qgep.wb_kanal_bettung_umhuellung(wert);
 INSERT INTO qgep.wb_kanal_bettung_umhuellung (wert) VALUES ('Sand');
 INSERT INTO qgep.wb_kanal_bettung_umhuellung (wert) VALUES ('erdverlegt');
 INSERT INTO qgep.wb_kanal_bettung_umhuellung (wert) VALUES ('in_Kanal_aufgehaengt');
 INSERT INTO qgep.wb_kanal_bettung_umhuellung (wert) VALUES ('in_Kanal_einbetoniert');
 INSERT INTO qgep.wb_kanal_bettung_umhuellung (wert) VALUES ('in_Vortriebsrohr_Beton');
 INSERT INTO qgep.wb_kanal_bettung_umhuellung (wert) VALUES ('in_Vortriebsrohr_Stahl');
 INSERT INTO qgep.wb_kanal_bettung_umhuellung (wert) VALUES ('andere');
 INSERT INTO qgep.wb_kanal_bettung_umhuellung (wert) VALUES ('unbekannt');
 INSERT INTO qgep.wb_kanal_bettung_umhuellung (wert) VALUES ('in_Leitungsgang');
 INSERT INTO qgep.wb_kanal_bettung_umhuellung (wert) VALUES ('SIA_Typ1');
 INSERT INTO qgep.wb_kanal_bettung_umhuellung (wert) VALUES ('SIA_Typ2');
 INSERT INTO qgep.wb_kanal_bettung_umhuellung (wert) VALUES ('SIA_Typ3');
 INSERT INTO qgep.wb_kanal_bettung_umhuellung (wert) VALUES ('SIA_Typ4');
CREATE TABLE qgep.wb_kanal_funktionhierarchisch( wert  varchar(50) not null );
 CREATE UNIQUE INDEX in_wb_kanal_funktionhierarchisch_wert ON qgep.wb_kanal_funktionhierarchisch (wert);
ALTER TABLE qgep.od_kanal ADD CONSTRAINT rel_od_kanal78 FOREIGN KEY (funktionhierarchisch) REFERENCES qgep.wb_kanal_funktionhierarchisch(wert);
 INSERT INTO qgep.wb_kanal_funktionhierarchisch (wert) VALUES ('Hauptsammelkanal');
 INSERT INTO qgep.wb_kanal_funktionhierarchisch (wert) VALUES ('Sammelkanal');
 INSERT INTO qgep.wb_kanal_funktionhierarchisch (wert) VALUES ('Sanierungsleitung');
 INSERT INTO qgep.wb_kanal_funktionhierarchisch (wert) VALUES ('andere');
 INSERT INTO qgep.wb_kanal_funktionhierarchisch (wert) VALUES ('unbekannt');
 INSERT INTO qgep.wb_kanal_funktionhierarchisch (wert) VALUES ('Arealentwaesserung');
 INSERT INTO qgep.wb_kanal_funktionhierarchisch (wert) VALUES ('Strassenentwaesserung');
 INSERT INTO qgep.wb_kanal_funktionhierarchisch (wert) VALUES ('Gewaesser');
 INSERT INTO qgep.wb_kanal_funktionhierarchisch (wert) VALUES ('Liegenschaftsentwaesserung');
 INSERT INTO qgep.wb_kanal_funktionhierarchisch (wert) VALUES ('Hauptsammelkanal_regional');
CREATE TABLE qgep.wb_kanal_funktionhydraulisch( wert  varchar(50) not null );
 CREATE UNIQUE INDEX in_wb_kanal_funktionhydraulisch_wert ON qgep.wb_kanal_funktionhydraulisch (wert);
ALTER TABLE qgep.od_kanal ADD CONSTRAINT rel_od_kanal79 FOREIGN KEY (funktionhydraulisch) REFERENCES qgep.wb_kanal_funktionhydraulisch(wert);
 INSERT INTO qgep.wb_kanal_funktionhydraulisch (wert) VALUES ('Spuelleitung');
 INSERT INTO qgep.wb_kanal_funktionhydraulisch (wert) VALUES ('Sickerleitung');
 INSERT INTO qgep.wb_kanal_funktionhydraulisch (wert) VALUES ('Speicherleitung');
 INSERT INTO qgep.wb_kanal_funktionhydraulisch (wert) VALUES ('Drosselleitung');
 INSERT INTO qgep.wb_kanal_funktionhydraulisch (wert) VALUES ('Pumpendruckleitung');
 INSERT INTO qgep.wb_kanal_funktionhydraulisch (wert) VALUES ('Drainagetransportleitung');
 INSERT INTO qgep.wb_kanal_funktionhydraulisch (wert) VALUES ('unbekannt');
 INSERT INTO qgep.wb_kanal_funktionhydraulisch (wert) VALUES ('andere');
 INSERT INTO qgep.wb_kanal_funktionhydraulisch (wert) VALUES ('Duekerleitung');
 INSERT INTO qgep.wb_kanal_funktionhydraulisch (wert) VALUES ('Vakuumleitung');
 INSERT INTO qgep.wb_kanal_funktionhydraulisch (wert) VALUES ('Freispiegelleitung');
CREATE TABLE qgep.wb_kanal_nutzungsart_geplant( wert  varchar(50) not null );
 CREATE UNIQUE INDEX in_wb_kanal_nutzungsart_geplant_wert ON qgep.wb_kanal_nutzungsart_geplant (wert);
ALTER TABLE qgep.od_kanal ADD CONSTRAINT rel_od_kanal80 FOREIGN KEY (nutzungsart_geplant) REFERENCES qgep.wb_kanal_nutzungsart_geplant(wert);
 INSERT INTO qgep.wb_kanal_nutzungsart_geplant (wert) VALUES ('Reinabwasser');
 INSERT INTO qgep.wb_kanal_nutzungsart_geplant (wert) VALUES ('entlastetes_Mischabwasser');
 INSERT INTO qgep.wb_kanal_nutzungsart_geplant (wert) VALUES ('Bachwasser');
 INSERT INTO qgep.wb_kanal_nutzungsart_geplant (wert) VALUES ('Regenabwasser');
 INSERT INTO qgep.wb_kanal_nutzungsart_geplant (wert) VALUES ('Mischabwasser');
 INSERT INTO qgep.wb_kanal_nutzungsart_geplant (wert) VALUES ('Industrieabwasser');
 INSERT INTO qgep.wb_kanal_nutzungsart_geplant (wert) VALUES ('Schmutzabwasser');
 INSERT INTO qgep.wb_kanal_nutzungsart_geplant (wert) VALUES ('andere');
 INSERT INTO qgep.wb_kanal_nutzungsart_geplant (wert) VALUES ('unbekannt');
CREATE TABLE qgep.wb_kanal_nutzungsart_ist( wert  varchar(50) not null );
 CREATE UNIQUE INDEX in_wb_kanal_nutzungsart_ist_wert ON qgep.wb_kanal_nutzungsart_ist (wert);
ALTER TABLE qgep.od_kanal ADD CONSTRAINT rel_od_kanal81 FOREIGN KEY (nutzungsart_ist) REFERENCES qgep.wb_kanal_nutzungsart_ist(wert);
 INSERT INTO qgep.wb_kanal_nutzungsart_ist (wert) VALUES ('Reinabwasser');
 INSERT INTO qgep.wb_kanal_nutzungsart_ist (wert) VALUES ('entlastetes_Mischabwasser');
 INSERT INTO qgep.wb_kanal_nutzungsart_ist (wert) VALUES ('Bachwasser');
 INSERT INTO qgep.wb_kanal_nutzungsart_ist (wert) VALUES ('Regenabwasser');
 INSERT INTO qgep.wb_kanal_nutzungsart_ist (wert) VALUES ('Mischabwasser');
 INSERT INTO qgep.wb_kanal_nutzungsart_ist (wert) VALUES ('Industrieabwasser');
 INSERT INTO qgep.wb_kanal_nutzungsart_ist (wert) VALUES ('Schmutzabwasser');
 INSERT INTO qgep.wb_kanal_nutzungsart_ist (wert) VALUES ('andere');
 INSERT INTO qgep.wb_kanal_nutzungsart_ist (wert) VALUES ('unbekannt');
CREATE TABLE qgep.wb_kanal_verbindungsart( wert  varchar(50) not null );
 CREATE UNIQUE INDEX in_wb_kanal_verbindungsart_wert ON qgep.wb_kanal_verbindungsart (wert);
ALTER TABLE qgep.od_kanal ADD CONSTRAINT rel_od_kanal84 FOREIGN KEY (verbindungsart) REFERENCES qgep.wb_kanal_verbindungsart(wert);
 INSERT INTO qgep.wb_kanal_verbindungsart (wert) VALUES ('Glockenmuffen');
 INSERT INTO qgep.wb_kanal_verbindungsart (wert) VALUES ('Spitzmuffen');
 INSERT INTO qgep.wb_kanal_verbindungsart (wert) VALUES ('Flachmuffen');
 INSERT INTO qgep.wb_kanal_verbindungsart (wert) VALUES ('Ueberschiebmuffen');
 INSERT INTO qgep.wb_kanal_verbindungsart (wert) VALUES ('spiegelgeschweisst');
 INSERT INTO qgep.wb_kanal_verbindungsart (wert) VALUES ('Elektroschweissmuffen');
 INSERT INTO qgep.wb_kanal_verbindungsart (wert) VALUES ('Steckmuffen');
 INSERT INTO qgep.wb_kanal_verbindungsart (wert) VALUES ('Kupplung');
 INSERT INTO qgep.wb_kanal_verbindungsart (wert) VALUES ('Flansch');
 INSERT INTO qgep.wb_kanal_verbindungsart (wert) VALUES ('Schraubmuffen');
 INSERT INTO qgep.wb_kanal_verbindungsart (wert) VALUES ('andere');
 INSERT INTO qgep.wb_kanal_verbindungsart (wert) VALUES ('unbekannt');
 INSERT INTO qgep.wb_kanal_verbindungsart (wert) VALUES ('Vortriebsrohrkupplung');
ALTER TABLE qgep.od_vorflutereinlauf ADD CONSTRAINT oorel85 FOREIGN KEY (obj_id) REFERENCES qgep.od_abwasserbauwerk(obj_id);
ALTER TABLE qgep.od_vorflutereinlauf ADD COLUMN fs_gewaessersektor varchar(36);
--ALTER TABLE qgep.od_vorflutereinlauf ADD CONSTRAINT rel88 FOREIGN KEY (fs_gewaessersektor) REFERENCES qgep.od_gewaessersektor(obj_id);
ALTER TABLE qgep.od_normschacht ADD CONSTRAINT oorel89 FOREIGN KEY (obj_id) REFERENCES qgep.od_abwasserbauwerk(obj_id);
CREATE TABLE qgep.wb_normschacht_funktion( wert  varchar(50) not null );
 CREATE UNIQUE INDEX in_wb_normschacht_funktion_wert ON qgep.wb_normschacht_funktion (wert);
ALTER TABLE qgep.od_normschacht ADD CONSTRAINT rel_od_normschacht93 FOREIGN KEY (funktion) REFERENCES qgep.wb_normschacht_funktion(wert);
 INSERT INTO qgep.wb_normschacht_funktion (wert) VALUES ('Oelabscheider');
 INSERT INTO qgep.wb_normschacht_funktion (wert) VALUES ('Kontrollschacht');
 INSERT INTO qgep.wb_normschacht_funktion (wert) VALUES ('Geleiseschacht');
 INSERT INTO qgep.wb_normschacht_funktion (wert) VALUES ('Schlammsammler');
 INSERT INTO qgep.wb_normschacht_funktion (wert) VALUES ('andere');
 INSERT INTO qgep.wb_normschacht_funktion (wert) VALUES ('unbekannt');
 INSERT INTO qgep.wb_normschacht_funktion (wert) VALUES ('Einlaufschacht');
 INSERT INTO qgep.wb_normschacht_funktion (wert) VALUES ('Dachwasserschacht');
 INSERT INTO qgep.wb_normschacht_funktion (wert) VALUES ('Schwimmstoffabscheider');
 INSERT INTO qgep.wb_normschacht_funktion (wert) VALUES ('Entwaesserungsrinne');
 INSERT INTO qgep.wb_normschacht_funktion (wert) VALUES ('Absturzbauwerk');
 INSERT INTO qgep.wb_normschacht_funktion (wert) VALUES ('Be_Entlueftung');
 INSERT INTO qgep.wb_normschacht_funktion (wert) VALUES ('Hochwasserentlastung');
 INSERT INTO qgep.wb_normschacht_funktion (wert) VALUES ('Klaergrube');
 INSERT INTO qgep.wb_normschacht_funktion (wert) VALUES ('Pumpwerk');
 INSERT INTO qgep.wb_normschacht_funktion (wert) VALUES ('Spuelschacht');
CREATE TABLE qgep.wb_normschacht_material( wert  varchar(50) not null );
 CREATE UNIQUE INDEX in_wb_normschacht_material_wert ON qgep.wb_normschacht_material (wert);
ALTER TABLE qgep.od_normschacht ADD CONSTRAINT rel_od_normschacht94 FOREIGN KEY (material) REFERENCES qgep.wb_normschacht_material(wert);
 INSERT INTO qgep.wb_normschacht_material (wert) VALUES ('andere');
 INSERT INTO qgep.wb_normschacht_material (wert) VALUES ('Beton');
 INSERT INTO qgep.wb_normschacht_material (wert) VALUES ('Kunststoff');
 INSERT INTO qgep.wb_normschacht_material (wert) VALUES ('unbekannt');
CREATE TABLE qgep.wb_normschacht_oberflaechenzulauf( wert  varchar(50) not null );
 CREATE UNIQUE INDEX in_wb_normschacht_oberflaechenzulauf_wert ON qgep.wb_normschacht_oberflaechenzulauf (wert);
ALTER TABLE qgep.od_normschacht ADD CONSTRAINT rel_od_normschacht95 FOREIGN KEY (oberflaechenzulauf) REFERENCES qgep.wb_normschacht_oberflaechenzulauf(wert);
 INSERT INTO qgep.wb_normschacht_oberflaechenzulauf (wert) VALUES ('Rost');
 INSERT INTO qgep.wb_normschacht_oberflaechenzulauf (wert) VALUES ('Zulauf_seitlich');
 INSERT INTO qgep.wb_normschacht_oberflaechenzulauf (wert) VALUES ('keiner');
 INSERT INTO qgep.wb_normschacht_oberflaechenzulauf (wert) VALUES ('unbekannt');
 INSERT INTO qgep.wb_normschacht_oberflaechenzulauf (wert) VALUES ('andere');
ALTER TABLE qgep.od_spezialbauwerk ADD CONSTRAINT oorel96 FOREIGN KEY (obj_id) REFERENCES qgep.od_abwasserbauwerk(obj_id);
CREATE TABLE qgep.wb_spezialbauwerk_bypass( wert  varchar(50) not null );
 CREATE UNIQUE INDEX in_wb_spezialbauwerk_bypass_wert ON qgep.wb_spezialbauwerk_bypass (wert);
ALTER TABLE qgep.od_spezialbauwerk ADD CONSTRAINT rel_od_spezialbauwerk98 FOREIGN KEY (bypass) REFERENCES qgep.wb_spezialbauwerk_bypass(wert);
 INSERT INTO qgep.wb_spezialbauwerk_bypass (wert) VALUES ('vorhanden');
 INSERT INTO qgep.wb_spezialbauwerk_bypass (wert) VALUES ('nicht_vorhanden');
 INSERT INTO qgep.wb_spezialbauwerk_bypass (wert) VALUES ('unbekannt');
CREATE TABLE qgep.wb_spezialbauwerk_funktion( wert  varchar(50) not null );
 CREATE UNIQUE INDEX in_wb_spezialbauwerk_funktion_wert ON qgep.wb_spezialbauwerk_funktion (wert);
ALTER TABLE qgep.od_spezialbauwerk ADD CONSTRAINT rel_od_spezialbauwerk99 FOREIGN KEY (funktion) REFERENCES qgep.wb_spezialbauwerk_funktion(wert);
 INSERT INTO qgep.wb_spezialbauwerk_funktion (wert) VALUES ('Spuelschacht');
 INSERT INTO qgep.wb_spezialbauwerk_funktion (wert) VALUES ('Absturzbauwerk');
 INSERT INTO qgep.wb_spezialbauwerk_funktion (wert) VALUES ('Pumpwerk');
 INSERT INTO qgep.wb_spezialbauwerk_funktion (wert) VALUES ('Klaergrube');
 INSERT INTO qgep.wb_spezialbauwerk_funktion (wert) VALUES ('Jauchegrube');
 INSERT INTO qgep.wb_spezialbauwerk_funktion (wert) VALUES ('Wirbelfallschacht');
 INSERT INTO qgep.wb_spezialbauwerk_funktion (wert) VALUES ('Oelabscheider');
 INSERT INTO qgep.wb_spezialbauwerk_funktion (wert) VALUES ('Kontrollschacht');
 INSERT INTO qgep.wb_spezialbauwerk_funktion (wert) VALUES ('unbekannt');
 INSERT INTO qgep.wb_spezialbauwerk_funktion (wert) VALUES ('andere');
 INSERT INTO qgep.wb_spezialbauwerk_funktion (wert) VALUES ('Hochwasserentlastung');
 INSERT INTO qgep.wb_spezialbauwerk_funktion (wert) VALUES ('Duekerkammer');
 INSERT INTO qgep.wb_spezialbauwerk_funktion (wert) VALUES ('Schwimmstoffabscheider');
 INSERT INTO qgep.wb_spezialbauwerk_funktion (wert) VALUES ('Gelaendemulde');
 INSERT INTO qgep.wb_spezialbauwerk_funktion (wert) VALUES ('Geschiebefang');
 INSERT INTO qgep.wb_spezialbauwerk_funktion (wert) VALUES ('Regenbecken_Durchlaufbecken');
 INSERT INTO qgep.wb_spezialbauwerk_funktion (wert) VALUES ('Regenbecken_Fangbecken');
 INSERT INTO qgep.wb_spezialbauwerk_funktion (wert) VALUES ('Regenbecken_Regenklaerbecken');
 INSERT INTO qgep.wb_spezialbauwerk_funktion (wert) VALUES ('Regenbecken_Regenrueckhaltebecken');
 INSERT INTO qgep.wb_spezialbauwerk_funktion (wert) VALUES ('Regenbecken_Verbundbecken');
 INSERT INTO qgep.wb_spezialbauwerk_funktion (wert) VALUES ('seitlicherZugang');
 INSERT INTO qgep.wb_spezialbauwerk_funktion (wert) VALUES ('Be_Entlueftung');
 INSERT INTO qgep.wb_spezialbauwerk_funktion (wert) VALUES ('Trennschacht');
ALTER TABLE qgep.od_versickerungsanlage ADD CONSTRAINT oorel100 FOREIGN KEY (obj_id) REFERENCES qgep.od_abwasserbauwerk(obj_id);
CREATE TABLE qgep.wb_versickerungsanlage_art( wert  varchar(50) not null );
 CREATE UNIQUE INDEX in_wb_versickerungsanlage_art_wert ON qgep.wb_versickerungsanlage_art (wert);
ALTER TABLE qgep.od_versickerungsanlage ADD CONSTRAINT rel_od_versickerungsanlage102 FOREIGN KEY (art) REFERENCES qgep.wb_versickerungsanlage_art(wert);
 INSERT INTO qgep.wb_versickerungsanlage_art (wert) VALUES ('Versickerungsbecken');
 INSERT INTO qgep.wb_versickerungsanlage_art (wert) VALUES ('Kieskoerper');
 INSERT INTO qgep.wb_versickerungsanlage_art (wert) VALUES ('Versickerungsschacht');
 INSERT INTO qgep.wb_versickerungsanlage_art (wert) VALUES ('unbekannt');
 INSERT INTO qgep.wb_versickerungsanlage_art (wert) VALUES ('Flaechenfoermige_Versickerung');
 INSERT INTO qgep.wb_versickerungsanlage_art (wert) VALUES ('Versickerung_ueber_die_Schulter');
 INSERT INTO qgep.wb_versickerungsanlage_art (wert) VALUES ('MuldenRigolenversickerung');
 INSERT INTO qgep.wb_versickerungsanlage_art (wert) VALUES ('andere_mit_Bodenpassage');
 INSERT INTO qgep.wb_versickerungsanlage_art (wert) VALUES ('Versickerungsstrang_Galerie');
 INSERT INTO qgep.wb_versickerungsanlage_art (wert) VALUES ('Kombination_Schacht_Strang');
 INSERT INTO qgep.wb_versickerungsanlage_art (wert) VALUES ('andere_ohne_Bodenpassage');
CREATE TABLE qgep.wb_versickerungsanlage_beschriftung( wert  varchar(50) not null );
 CREATE UNIQUE INDEX in_wb_versickerungsanlage_beschriftung_wert ON qgep.wb_versickerungsanlage_beschriftung (wert);
ALTER TABLE qgep.od_versickerungsanlage ADD CONSTRAINT rel_od_versickerungsanlage103 FOREIGN KEY (beschriftung) REFERENCES qgep.wb_versickerungsanlage_beschriftung(wert);
 INSERT INTO qgep.wb_versickerungsanlage_beschriftung (wert) VALUES ('beschriftet');
 INSERT INTO qgep.wb_versickerungsanlage_beschriftung (wert) VALUES ('nichtbeschriftet');
 INSERT INTO qgep.wb_versickerungsanlage_beschriftung (wert) VALUES ('unbekannt');
CREATE TABLE qgep.wb_versickerungsanlage_maengel( wert  varchar(50) not null );
 CREATE UNIQUE INDEX in_wb_versickerungsanlage_maengel_wert ON qgep.wb_versickerungsanlage_maengel (wert);
ALTER TABLE qgep.od_versickerungsanlage ADD CONSTRAINT rel_od_versickerungsanlage107 FOREIGN KEY (maengel) REFERENCES qgep.wb_versickerungsanlage_maengel(wert);
 INSERT INTO qgep.wb_versickerungsanlage_maengel (wert) VALUES ('keine');
 INSERT INTO qgep.wb_versickerungsanlage_maengel (wert) VALUES ('wesentliche');
 INSERT INTO qgep.wb_versickerungsanlage_maengel (wert) VALUES ('unwesentliche');
CREATE TABLE qgep.wb_versickerungsanlage_notueberlauf( wert  varchar(50) not null );
 CREATE UNIQUE INDEX in_wb_versickerungsanlage_notueberlauf_wert ON qgep.wb_versickerungsanlage_notueberlauf (wert);
ALTER TABLE qgep.od_versickerungsanlage ADD CONSTRAINT rel_od_versickerungsanlage108 FOREIGN KEY (notueberlauf) REFERENCES qgep.wb_versickerungsanlage_notueberlauf(wert);
 INSERT INTO qgep.wb_versickerungsanlage_notueberlauf (wert) VALUES ('keiner');
 INSERT INTO qgep.wb_versickerungsanlage_notueberlauf (wert) VALUES ('inVorfluter');
 INSERT INTO qgep.wb_versickerungsanlage_notueberlauf (wert) VALUES ('oberflaechlichausmuendend');
 INSERT INTO qgep.wb_versickerungsanlage_notueberlauf (wert) VALUES ('inMischwasserkanalisation');
 INSERT INTO qgep.wb_versickerungsanlage_notueberlauf (wert) VALUES ('inRegenwasserkanalisation');
 INSERT INTO qgep.wb_versickerungsanlage_notueberlauf (wert) VALUES ('unbekannt');
CREATE TABLE qgep.wb_versickerungsanlage_saugwagen( wert  varchar(50) not null );
 CREATE UNIQUE INDEX in_wb_versickerungsanlage_saugwagen_wert ON qgep.wb_versickerungsanlage_saugwagen (wert);
ALTER TABLE qgep.od_versickerungsanlage ADD CONSTRAINT rel_od_versickerungsanlage109 FOREIGN KEY (saugwagen) REFERENCES qgep.wb_versickerungsanlage_saugwagen(wert);
 INSERT INTO qgep.wb_versickerungsanlage_saugwagen (wert) VALUES ('zugaenglich');
 INSERT INTO qgep.wb_versickerungsanlage_saugwagen (wert) VALUES ('unzugaenglich');
 INSERT INTO qgep.wb_versickerungsanlage_saugwagen (wert) VALUES ('unbekannt');
CREATE TABLE qgep.wb_versickerungsanlage_versickerungswasser( wert  varchar(50) not null );
 CREATE UNIQUE INDEX in_wb_versickerungsanlage_versickerungswasser_wert ON qgep.wb_versickerungsanlage_versickerungswasser (wert);
ALTER TABLE qgep.od_versickerungsanlage ADD CONSTRAINT rel_od_versickerungsanlage111 FOREIGN KEY (versickerungswasser) REFERENCES qgep.wb_versickerungsanlage_versickerungswasser(wert);
 INSERT INTO qgep.wb_versickerungsanlage_versickerungswasser (wert) VALUES ('Reinabwasser');
 INSERT INTO qgep.wb_versickerungsanlage_versickerungswasser (wert) VALUES ('Regenabwasser');
 INSERT INTO qgep.wb_versickerungsanlage_versickerungswasser (wert) VALUES ('unbekannt');
CREATE TABLE qgep.wb_versickerungsanlage_wasserdichtheit( wert  varchar(50) not null );
 CREATE UNIQUE INDEX in_wb_versickerungsanlage_wasserdichtheit_wert ON qgep.wb_versickerungsanlage_wasserdichtheit (wert);
ALTER TABLE qgep.od_versickerungsanlage ADD CONSTRAINT rel_od_versickerungsanlage112 FOREIGN KEY (wasserdichtheit) REFERENCES qgep.wb_versickerungsanlage_wasserdichtheit(wert);
 INSERT INTO qgep.wb_versickerungsanlage_wasserdichtheit (wert) VALUES ('wasserdicht');
 INSERT INTO qgep.wb_versickerungsanlage_wasserdichtheit (wert) VALUES ('nichtwasserdicht');
 INSERT INTO qgep.wb_versickerungsanlage_wasserdichtheit (wert) VALUES ('unbekannt');
ALTER TABLE qgep.od_versickerungsanlage ADD COLUMN fs_grundwasserleiter varchar(36);
--ALTER TABLE qgep.od_versickerungsanlage ADD CONSTRAINT rel114 FOREIGN KEY (fs_grundwasserleiter) REFERENCES qgep.od_grundwasserleiter(obj_id);
ALTER TABLE qgep.od_haltung ADD CONSTRAINT oorel115 FOREIGN KEY (obj_id) REFERENCES qgep.od_abwassernetzelement(obj_id);
CREATE TABLE qgep.wb_haltung_innenschutz( wert  varchar(50) not null );
 CREATE UNIQUE INDEX in_wb_haltung_innenschutz_wert ON qgep.wb_haltung_innenschutz (wert);
ALTER TABLE qgep.od_haltung ADD CONSTRAINT rel_od_haltung117 FOREIGN KEY (innenschutz) REFERENCES qgep.wb_haltung_innenschutz(wert);
 INSERT INTO qgep.wb_haltung_innenschutz (wert) VALUES ('Anstrich_Beschichtung');
 INSERT INTO qgep.wb_haltung_innenschutz (wert) VALUES ('Zementmoertelauskleidung');
 INSERT INTO qgep.wb_haltung_innenschutz (wert) VALUES ('Kanalklinkerauskleidung');
 INSERT INTO qgep.wb_haltung_innenschutz (wert) VALUES ('Steinzeugauskleidung');
 INSERT INTO qgep.wb_haltung_innenschutz (wert) VALUES ('andere');
 INSERT INTO qgep.wb_haltung_innenschutz (wert) VALUES ('unbekannt');
CREATE TABLE qgep.wb_haltung_lagebestimmung( wert  varchar(50) not null );
 CREATE UNIQUE INDEX in_wb_haltung_lagebestimmung_wert ON qgep.wb_haltung_lagebestimmung (wert);
ALTER TABLE qgep.od_haltung ADD CONSTRAINT rel_od_haltung119 FOREIGN KEY (lagebestimmung) REFERENCES qgep.wb_haltung_lagebestimmung(wert);
 INSERT INTO qgep.wb_haltung_lagebestimmung (wert) VALUES ('genau');
 INSERT INTO qgep.wb_haltung_lagebestimmung (wert) VALUES ('ungenau');
 INSERT INTO qgep.wb_haltung_lagebestimmung (wert) VALUES ('unbekannt');
CREATE TABLE qgep.wb_haltung_material( wert  varchar(50) not null );
 CREATE UNIQUE INDEX in_wb_haltung_material_wert ON qgep.wb_haltung_material (wert);
ALTER TABLE qgep.od_haltung ADD CONSTRAINT rel_od_haltung121 FOREIGN KEY (Material) REFERENCES qgep.wb_haltung_material(wert);
 INSERT INTO qgep.wb_haltung_material (wert) VALUES ('Faserzement');
 INSERT INTO qgep.wb_haltung_material (wert) VALUES ('Guss_duktil');
 INSERT INTO qgep.wb_haltung_material (wert) VALUES ('Stahl');
 INSERT INTO qgep.wb_haltung_material (wert) VALUES ('Steinzeug');
 INSERT INTO qgep.wb_haltung_material (wert) VALUES ('Asbestzement');
 INSERT INTO qgep.wb_haltung_material (wert) VALUES ('Gebrannte_Steine');
 INSERT INTO qgep.wb_haltung_material (wert) VALUES ('Ton');
 INSERT INTO qgep.wb_haltung_material (wert) VALUES ('Zement');
 INSERT INTO qgep.wb_haltung_material (wert) VALUES ('andere');
 INSERT INTO qgep.wb_haltung_material (wert) VALUES ('unbekannt');
 INSERT INTO qgep.wb_haltung_material (wert) VALUES ('Beton_Normalbeton');
 INSERT INTO qgep.wb_haltung_material (wert) VALUES ('Beton_Ortsbeton');
 INSERT INTO qgep.wb_haltung_material (wert) VALUES ('Beton_Pressrohrbeton');
 INSERT INTO qgep.wb_haltung_material (wert) VALUES ('Beton_Spezialbeton');
 INSERT INTO qgep.wb_haltung_material (wert) VALUES ('Kunststoff_Epoxydharz');
 INSERT INTO qgep.wb_haltung_material (wert) VALUES ('Kunststoff_Hartpolyethylen');
 INSERT INTO qgep.wb_haltung_material (wert) VALUES ('Kunststoff_Polyester_GUP');
 INSERT INTO qgep.wb_haltung_material (wert) VALUES ('Kunststoff_Polyethylen');
 INSERT INTO qgep.wb_haltung_material (wert) VALUES ('Kunststoff_Polypropylen');
 INSERT INTO qgep.wb_haltung_material (wert) VALUES ('Kunststoff_Polyvinilchlorid');
 INSERT INTO qgep.wb_haltung_material (wert) VALUES ('Guss_Grauguss');
 INSERT INTO qgep.wb_haltung_material (wert) VALUES ('Beton_unbekannt');
 INSERT INTO qgep.wb_haltung_material (wert) VALUES ('Kunststoff_unbekannt');
 INSERT INTO qgep.wb_haltung_material (wert) VALUES ('Stahl_rostfrei');
ALTER TABLE qgep.od_haltung ADD COLUMN fs_vonhaltungspunkt varchar(36);
ALTER TABLE qgep.od_haltung ADD CONSTRAINT rel125 FOREIGN KEY (fs_vonhaltungspunkt) REFERENCES qgep.od_haltungspunkt(obj_id);
ALTER TABLE qgep.od_haltung ADD COLUMN fs_nachhaltungspunkt varchar(36);
ALTER TABLE qgep.od_haltung ADD CONSTRAINT rel126 FOREIGN KEY (fs_nachhaltungspunkt) REFERENCES qgep.od_haltungspunkt(obj_id);
ALTER TABLE qgep.od_haltung ADD COLUMN fs_rohrprofil varchar(36);
ALTER TABLE qgep.od_haltung ADD CONSTRAINT rel127 FOREIGN KEY (fs_rohrprofil) REFERENCES qgep.od_rohrprofil(obj_id);
ALTER TABLE qgep.od_abwasserknoten ADD CONSTRAINT oorel128 FOREIGN KEY (obj_id) REFERENCES qgep.od_abwassernetzelement(obj_id);
