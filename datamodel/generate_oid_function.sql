-- Function: qgep.generate_oid()

--DROP FUNCTION qgep.generate_oid();

CREATE OR REPLACE FUNCTION qgep.generate_oid(prefix text, table_name text)
  RETURNS text AS
$BODY$
DECLARE
  myrec_shortcut record;
  myrec_seq record;
BEGIN
  IF char_length(prefix) != 8 THEN
    RAISE EXCEPTION 'character length of prefix must be 8';
  END IF;
  BEGIN
    SELECT shortcut_en INTO STRICT myrec_shortcut FROM qgep.is_dictionary WHERE tablename = table_name;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE EXCEPTION 'dictionary entry for table % not found', table_name;
        WHEN TOO_MANY_ROWS THEN
            RAISE EXCEPTION 'dictonary entry for table % not unique', table_name;
  END;
  SELECT nextval('qgep.seq_' || table_name || '_oid') AS seqval INTO myrec_seq;
  IF NOT FOUND THEN
    RAISE EXCEPTION 'sequence for table % not found', table_name;
  END IF;
  RETURN prefix || myrec_shortcut.shortcut_en || to_char(myrec_seq.seqval,'FM000000');
END;
$BODY$
  LANGUAGE plpgsql STABLE
  COST 100;
