DROP TABLE qgep.is_dictionary_vw_field CASCADE;
CREATE TABLE qgep.is_dictionary_vw_field
(
  id serial NOT NULL,
  class_id integer,
  attribute_id integer,
  table_name character varying(80),
  field_name character varying(80),
  field_name_en character varying(80),
  field_name_de character varying(100),
  field_name_fr character varying(100),
  field_name_it character varying(100),
  field_description_en text,
  field_description_de text,
  field_description_fr text,
  field_description_it text,
  CONSTRAINT is_dictionary_vw_field_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);

ALTER TABLE qgep.is_dictionary_vw_field
  OWNER TO qgep;

-- Reach

INSERT INTO qgep.is_dictionary_vw_field ( 
  class_id, 
  attribute_id, 
  table_name, 
  field_name, 
  field_name_en, 
  field_name_de, 
  field_name_fr, 
  field_name_it, 
  field_description_en, 
  field_description_de, 
  field_description_fr, 
  field_description_it 
) SELECT 
    class_id,
    attribute_id, 
    'vw_reach', 
    field_name, 
    field_name_en, 
    field_name_de, 
    field_name_fr, 
    field_name_it, 
    field_description_en, 
    field_description_de, 
    field_description_fr, 
    field_description_it 
  FROM qgep.is_dictionary_od_field 
  WHERE table_name = 'od_reach'
  OR table_name = 'od_wastewater_networkelement';

-- Cover

INSERT INTO qgep.is_dictionary_vw_field ( 
  class_id, 
  attribute_id, 
  table_name, 
  field_name, 
  field_name_en, 
  field_name_de, 
  field_name_fr, 
  field_name_it, 
  field_description_en, 
  field_description_de, 
  field_description_fr, 
  field_description_it 
) SELECT 
    class_id,
    attribute_id, 
    'vw_cover', 
    field_name, 
    field_name_en, 
    field_name_de, 
    field_name_fr, 
    field_name_it, 
    field_description_en, 
    field_description_de, 
    field_description_fr, 
    field_description_it 
  FROM qgep.is_dictionary_od_field 
  WHERE table_name = 'od_cover'
  OR table_name = 'od_structure_part';

-- Manhole

INSERT INTO qgep.is_dictionary_vw_field ( 
  class_id, 
  attribute_id, 
  table_name, 
  field_name, 
  field_name_en, 
  field_name_de, 
  field_name_fr, 
  field_name_it, 
  field_description_en, 
  field_description_de, 
  field_description_fr, 
  field_description_it 
) SELECT 
    class_id,
    attribute_id, 
    'vw_manhole', 
    field_name, 
    field_name_en, 
    field_name_de, 
    field_name_fr, 
    field_name_it, 
    field_description_en, 
    field_description_de, 
    field_description_fr, 
    field_description_it 
  FROM qgep.is_dictionary_od_field 
  WHERE table_name = 'od_manhole'
  OR table_name = 'od_wastewater_structure';

  
-- Special Structure

INSERT INTO qgep.is_dictionary_vw_field ( 
  class_id, 
  attribute_id, 
  table_name, 
  field_name, 
  field_name_en, 
  field_name_de, 
  field_name_fr, 
  field_name_it, 
  field_description_en, 
  field_description_de, 
  field_description_fr, 
  field_description_it 
) SELECT 
    class_id,
    attribute_id, 
    'vw_special_structure', 
    field_name, 
    field_name_en, 
    field_name_de, 
    field_name_fr, 
    field_name_it, 
    field_description_en, 
    field_description_de, 
    field_description_fr, 
    field_description_it 
  FROM qgep.is_dictionary_od_field 
  WHERE table_name = 'od_special_structure'
  OR table_name = 'od_wastewater_structure';

CREATE VIEW qgep.vw_dictionary_field AS
  SELECT * 
    FROM qgep.is_dictionary_vw_field
  UNION
  SELECT *
  FROM qgep.is_dictionary_od_field;

ALTER VIEW qgep.vw_dictionary_field
  OWNER TO qgep;
