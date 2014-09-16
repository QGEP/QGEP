CREATE RULE vw_manhole_UPDATE 
AS ON UPDATE TO qgep.vw_manhole 
DO INSTEAD (
       UPDATE qgep.od_manhole SET 
         dimension1 = NEW.dimension1,
         dimension2 = NEW.dimension2,
         function = NEW.function,
         material = NEW.material,
         surface_inflow = NEW.surface_inflow
       WHERE obj_id=OLD.obj_id;
       UPDATE qgep.od_wastewater_structure SET
         accessibility = NEW.accessibility,
         contract_section = NEW.contract_section,
         depth = NEW.depth,
         detail_geometry_geometry = NEW.detail_geometry_geometry,
         detail_geometry_3d_geometry = NEW.detail_geometry_3d_geometry,
         financing = NEW.financing,
         gross_costs = NEW.gross_costs,
         identifier = NEW.identifier,
         inspection_interval = NEW.inspection_interval,
         location_name = NEW.location_name,
         records = NEW.records,
         remark = NEW.remark,
         renovation_necessity = NEW.renovation_necessity,
         replacement_value = NEW.replacement_value,
         rv_base_year = NEW.rv_base_year,
         rv_construction_type = NEW.rv_construction_type,
         status = NEW.status,
         structure_condition = NEW.structure_condition,
         subsidies = NEW.subsidies,
         year_of_construction = NEW.year_of_construction,
         year_of_replacement = NEW.year_of_replacement,
         last_modification = NEW.last_modification,
         dataowner = NEW.dataowner,
         provider = NEW.provider,
         fk_owner = NEW.fk_owner,
         fk_operator = NEW.fk_operator
       WHERE obj_id = OLD.obj_id
      );
