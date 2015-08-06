<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="2.11.0-Master" minimumScale="-4.65661e-10" maximumScale="5000" simplifyDrawingHints="0" minLabelScale="0" maxLabelScale="1e+08" simplifyDrawingTol="1" simplifyMaxScale="1" hasScaleBasedVisibilityFlag="1" simplifyLocal="0" scaleBasedLabelVisibilityFlag="0">
 <edittypes>
  <edittype widgetv2type="TextEdit" name="obj_id">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="UniqueValues" name="brand">
   <widgetv2config fieldEditable="1" labelOnTop="0" Editable="1"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="cover_shape">
   <widgetv2config OrderByValue="1" AllowNull="1" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" Layer="vl_cover_cover_shape" Value="value_en" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="Range" name="diameter">
   <widgetv2config AllowNull="1" fieldEditable="1" Step="10" Style="SpinBox" labelOnTop="0" Min="0" Max="99999" Suffix=" mm"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="fastening">
   <widgetv2config OrderByValue="1" AllowNull="1" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" Layer="vl_cover_fastening" Value="value_en" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="Range" name="level">
   <widgetv2config AllowNull="1" fieldEditable="1" Step="10" Style="SpinBox" labelOnTop="0" Min="0" Max="4000" Suffix=" m.a.s.l."/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="cover_material">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="positional_accuracy">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="sludge_bucket">
   <widgetv2config OrderByValue="1" AllowNull="1" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" Layer="vl_cover_sludge_bucket" Value="value_en" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="venting">
   <widgetv2config OrderByValue="1" AllowNull="1" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" Layer="vl_cover_venting" Value="value_en" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="identifier">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="remark">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="renovation_demand">
   <widgetv2config OrderByValue="1" AllowNull="1" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" Layer="vl_structure_part_renovation_demand" Value="value_en" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="DateTime" name="last_modification">
   <widgetv2config fieldEditable="1" calendar_popup="0" allow_null="0" display_format="yyyy-MM-dd" field_format="yyyy-MM-dd" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="UniqueValues" name="dataowner">
   <widgetv2config fieldEditable="1" labelOnTop="0" Editable="1"/>
  </edittype>
  <edittype widgetv2type="UniqueValues" name="provider">
   <widgetv2config fieldEditable="1" labelOnTop="0" Editable="1"/>
  </edittype>
  <edittype widgetv2type="ValueMap" name="ws_type">
   <widgetv2config fieldEditable="1" labelOnTop="0">
    <value key="Discharge Point" value="discharge_point"/>
    <value key="Infiltration Installation" value="infiltration_installation"/>
    <value key="Manhole" value="manhole"/>
    <value key="Special Structure" value="special_structure"/>
   </widgetv2config>
  </edittype>
  <edittype widgetv2type="TextEdit" name="ws_obj_id">
   <widgetv2config IsMultiline="0" fieldEditable="0" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="accessibility">
   <widgetv2config OrderByValue="1" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" Layer="vl_wastewater_structure_accessibility" Value="value_en" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="contract_section">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="financing">
   <widgetv2config OrderByValue="1" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" Layer="vl_wastewater_structure_financing" Value="value_en" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="Range" name="gross_costs">
   <widgetv2config AllowNull="1" fieldEditable="1" Step="1" Style="SpinBox" labelOnTop="0" Min="0" Max="5"/>
  </edittype>
  <edittype widgetv2type="Range" name="inspection_interval">
   <widgetv2config AllowNull="1" fieldEditable="1" Step="1" Style="SpinBox" labelOnTop="0" Min="0" Max="5"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="location_name">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="records">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="renovation_necessity">
   <widgetv2config OrderByValue="1" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" Layer="vl_wastewater_structure_renovation_necessity" Value="value_en" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="Range" name="replacement_value">
   <widgetv2config AllowNull="1" fieldEditable="1" Step="1" Style="SpinBox" labelOnTop="0" Min="0" Max="5"/>
  </edittype>
  <edittype widgetv2type="Range" name="rv_base_year">
   <widgetv2config AllowNull="1" fieldEditable="1" Step="1" Style="SpinBox" labelOnTop="0" Min="0" Max="5"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="rv_construction_type">
   <widgetv2config OrderByValue="1" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" Layer="vl_wastewater_structure_rv_construction_type" Value="value_en" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="status">
   <widgetv2config OrderByValue="1" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" Layer="vl_wastewater_structure_status" Value="value_en" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="structure_condition">
   <widgetv2config OrderByValue="1" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" Layer="vl_wastewater_structure_structure_condition" Value="value_en" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="Range" name="subsidies">
   <widgetv2config AllowNull="1" fieldEditable="1" Step="1" Style="SpinBox" labelOnTop="0" Min="0" Max="5"/>
  </edittype>
  <edittype widgetv2type="Range" name="year_of_construction">
   <widgetv2config AllowNull="1" fieldEditable="1" Step="1" Style="SpinBox" labelOnTop="0" Min="1900" Max="2200"/>
  </edittype>
  <edittype widgetv2type="Range" name="year_of_replacement">
   <widgetv2config AllowNull="1" fieldEditable="1" Step="1" Style="SpinBox" labelOnTop="0" Min="1900" Max="2200"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="fk_owner">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="fk_operator">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="Range" name="depth">
   <widgetv2config AllowNull="1" fieldEditable="1" Step="1" Style="SpinBox" labelOnTop="0" Min="0" Max="5"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="dimension1">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="dimension2">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="upper_elevation">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="manhole_function">
   <widgetv2config OrderByValue="1" AllowNull="1" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" Layer="vl_manhole_function" Value="value_en" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="material">
   <widgetv2config OrderByValue="1" AllowNull="1" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" Layer="vl_cover_material" Value="value_en" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="Range" name="surface_inflow">
   <widgetv2config AllowNull="1" fieldEditable="1" Step="1" Style="SpinBox" labelOnTop="0" Min="0" Max="5"/>
  </edittype>
  <edittype widgetv2type="Hidden" name="channel_usage_current">
   <widgetv2config fieldEditable="1" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="Hidden" name="channel_function_hierarchic">
   <widgetv2config fieldEditable="1" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="Hidden" name="manhole_orientation">
   <widgetv2config fieldEditable="1" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="manhole_label">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="bypass">
   <widgetv2config OrderByValue="1" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" Layer="vl_special_structure_bypass" Value="value_en" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="special_structure_function">
   <widgetv2config OrderByValue="1" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" Layer="vl_special_structure_function" Value="value_en" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="stormwater_tank_arrangement">
   <widgetv2config OrderByValue="1" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" Layer="vl_special_structure_stormwater_tank_arrangement" Value="value_en" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="Range" name="highwater_level">
   <widgetv2config AllowNull="1" fieldEditable="1" Step="1" Style="SpinBox" labelOnTop="0" Min="0" Max="5"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="relevance">
   <widgetv2config OrderByValue="1" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" Layer="vl_discharge_point_relevance" Value="value_en" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="Range" name="terrain_level">
   <widgetv2config AllowNull="1" fieldEditable="1" Step="1" Style="SpinBox" labelOnTop="0" Min="0" Max="4000" Suffix=" m.a.s.l."/>
  </edittype>
  <edittype widgetv2type="Range" name="waterlevel_hydraulic">
   <widgetv2config AllowNull="1" fieldEditable="1" Step="1" Style="SpinBox" labelOnTop="0" Min="0" Max="5"/>
  </edittype>
  <edittype widgetv2type="Range" name="absorption_capacity">
   <widgetv2config AllowNull="1" fieldEditable="1" Step="1" Style="SpinBox" labelOnTop="0" Min="0" Max="5"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="defects">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="distance_to_aquifer">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="effective_area">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="emergency_spillway">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="kind">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="labeling">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="seepage_utilization">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="vehicle_access">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="watertightness">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="wn_obj_id">
   <widgetv2config IsMultiline="0" fieldEditable="0" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="backflow_level">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="bottom_level">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="wn_identifier">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="wn_remark">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="wn_last_modification">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="wn_dataowner">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="wn_provider">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
 </edittypes>
 <renderer-v2 forceraster="0" symbollevels="0" type="RuleRenderer">
  <rules key="{6736e613-3750-466f-8a9f-3310fefc92b3}">
   <rule scalemaxdenom="5001" filter="manhole_function IN (204,5345,4532,4533,4537,4798,5346) AND channel_function_hierarchic IN (5068,5069,5070,5071)" key="{a19553f0-3a86-466a-846c-34647de3eacb}" symbol="0" label="manhole, unknown, drop_structure, venting, jetting_manhole, separating_structure, stormwater_overflow  - main drainage system"/>
   <rule scalemaxdenom="2001" filter="manhole_function IN (204,5345,4532,4533,4537,4798,5346) AND channel_function_hierarchic NOT IN (5068,5069,5070,5071)" key="{18c180f3-844d-49e4-a8ee-e678c834fc08}" symbol="1" label="manhole, unknown, drop_structure, venting, jetting_manhole, separating_structure, stormwater_overflow - minor drainage system"/>
   <rule scalemaxdenom="5001" filter=" manhole_function = 228 AND channel_function_hierarchic IN (5068,5069,5070,5071)" key="{2287443e-21d4-4c14-8732-f925e912927a}" symbol="2" label="rail_track_gully - main drainage system"/>
   <rule scalemaxdenom="2001" filter=" manhole_function = 228 AND channel_function_hierarchic NOT IN (5068,5069,5070,5071)" key="{d23221ad-187f-4682-9458-42a19bd0acd2}" symbol="3" label="rail_track_gully - minor drainage system"/>
   <rule scalemaxdenom="5001" filter=" manhole_function = 4536 AND channel_function_hierarchic IN (5068,5069,5070,5071)" key="{830e1f8e-7bae-4271-8e7e-3b2705cf37c2}" symbol="4" label="pump_station - main drainage system"/>
   <rule scalemaxdenom="2001" filter=" manhole_function = 4536 AND channel_function_hierarchic NOT IN (5068,5069,5070,5071)" key="{01d58544-e7cb-482f-aa09-2d9bcc914bd0}" symbol="5" label="pump_station - minor drainage system"/>
   <rule scalemaxdenom="5001" filter=" manhole_function = 1008 AND channel_function_hierarchic IN (5068,5069,5070,5071)" key="{28f9989c-7e87-4782-8af8-e82e97e48f07}" symbol="6" label="oil_separator - main drainage system"/>
   <rule scalemaxdenom="2001" filter=" manhole_function = 1008 AND channel_function_hierarchic NOT IN (5068,5069,5070,5071)" key="{fd59f306-4bb0-45d4-9b8f-6c472fd6f453}" symbol="7" label="oil_separator - minor drainage system"/>
   <rule scalemaxdenom="5001" filter=" manhole_function = 1008 AND channel_function_hierarchic IN (5068,5069,5070,5071)" key="{23388bb8-4225-45a4-bff9-9e90282b2e84}" symbol="8" label="floating_material_separator - main drainage system"/>
   <rule scalemaxdenom="2001" filter=" manhole_function = 1008 AND channel_function_hierarchic NOT IN (5068,5069,5070,5071)" key="{98bce6a8-b6eb-425a-87e8-1b3bcd4f3458}" symbol="9" label="floating_material_separator - minor drainage system"/>
   <rule scalemaxdenom="5001" filter=" manhole_function = 3267 AND channel_function_hierarchic IN (5068,5069,5070,5071)" key="{fbd3e663-5247-4140-8ccb-1bb1eb3377e6}" symbol="10" label="rain_water_manhole - main drainage system"/>
   <rule scalemaxdenom="2001" filter=" manhole_function = 3267 AND channel_function_hierarchic NOT IN (5068,5069,5070,5071)" key="{5beea4bb-ddf3-4784-93a9-19961a171224}" symbol="11" label="rain_water_manhole - minor drainage system"/>
   <rule scalemaxdenom="5001" filter=" manhole_function = 2742 AND channel_function_hierarchic IN (5068,5069,5070,5071)" key="{9ee5d899-1f95-4c7f-8655-caa89c70a7df}" symbol="12" label="slurry_collector - main drainage system"/>
   <rule scalemaxdenom="2001" filter=" manhole_function = 2742 AND channel_function_hierarchic NOT IN (5068,5069,5070,5071)" key="{2abc1c58-4d39-41df-b8b2-1ff6ef069d55}" symbol="13" label="slurry_collector - minor drainage system"/>
   <rule scalemaxdenom="5001" filter=" manhole_function = 3266 AND channel_function_hierarchic IN (5068,5069,5070,5071)" key="{17940497-d239-43a6-afee-e6e1b2fe31a5}" symbol="14" label="gully - main drainage system"/>
   <rule scalemaxdenom="2001" filter=" manhole_function = 3266 AND channel_function_hierarchic NOT IN (5068,5069,5070,5071)" key="{045b859e-9d9a-4642-9630-3594f7bd745c}" symbol="15" label="gully - minor drainage system"/>
   <rule scalemaxdenom="5001" filter=" manhole_function = 3472 AND channel_function_hierarchic IN (5068,5069,5070,5071)" key="{7d42bd8b-f62f-443b-b2ad-56460df5fc6b}" symbol="16" label="drainage_channel - main drainage system"/>
   <rule scalemaxdenom="2001" filter=" manhole_function = 3472 AND channel_function_hierarchic NOT IN (5068,5069,5070,5071)" key="{ba077ab0-6fb6-47d8-a5a5-15ade7d1b6a4}" symbol="17" label="drainage_channel - minor drainage system"/>
   <rule scalemaxdenom="5001" filter=" manhole_function = 5344 AND channel_function_hierarchic IN (5068,5069,5070,5071)" key="{21b6aa82-108b-486c-b974-3b2151ac7d48}" symbol="18" label="other - main drainage system"/>
   <rule scalemaxdenom="2001" filter=" manhole_function = 5344 AND channel_function_hierarchic NOT IN (5068,5069,5070,5071)" key="{131efc32-074a-4bfc-8773-4efb43246fea}" symbol="19" label="other - minor drainage system"/>
   <rule scalemaxdenom="2001" filter="ELSE" key="{c431ef56-07b8-43fd-87bf-e0c20098ec5f}" symbol="20"/>
  </rules>
  <symbols>
   <symbol alpha="1" clip_to_extent="1" type="marker" name="0">
    <layer pass="0" class="SimpleMarker" locked="0">
     <prop k="angle" v="0"/>
     <prop k="color" v="255,255,255,255"/>
     <prop k="color_border_dd_active" v="1"/>
     <prop k="color_border_dd_expression" v="CASE WHEN channel_usage_current IN (4514, 4520) THEN '0,0,255,255' WHEN channel_usage_current = 4516 THEN '0,255,0,255' WHEN channel_usage_current = 4518 THEN '0,170,255,255' WHEN channel_usage_current = 4522 THEN '102,0,102,255' WHEN channel_usage_current IN (4524, 4526) THEN '255,0,0,255' ELSE '161,161,161,255' END"/>
     <prop k="color_border_dd_field" v=""/>
     <prop k="color_border_dd_useexpr" v="1"/>
     <prop k="horizontal_anchor_point" v="1"/>
     <prop k="name" v="circle"/>
     <prop k="offset" v="0,0"/>
     <prop k="offset_map_unit_scale" v="0,0"/>
     <prop k="offset_unit" v="MM"/>
     <prop k="outline_color" v="0,0,0,255"/>
     <prop k="outline_style" v="solid"/>
     <prop k="outline_width" v="0.35"/>
     <prop k="outline_width_map_unit_scale" v="0,0"/>
     <prop k="outline_width_unit" v="MM"/>
     <prop k="scale_method" v="area"/>
     <prop k="size" v="3"/>
     <prop k="size_map_unit_scale" v="0,0"/>
     <prop k="size_unit" v="MM"/>
     <prop k="vertical_anchor_point" v="1"/>
     <effect enabled="0" type="effectStack">
      <effect type="drawSource">
       <prop k="blend_mode" v="0"/>
       <prop k="draw_mode" v="2"/>
       <prop k="enabled" v="1"/>
       <prop k="transparency" v="0"/>
      </effect>
     </effect>
    </layer>
   </symbol>
   <symbol alpha="1" clip_to_extent="1" type="marker" name="1">
    <layer pass="0" class="SimpleMarker" locked="0">
     <prop k="angle" v="0"/>
     <prop k="color" v="255,255,255,255"/>
     <prop k="color_border_dd_active" v="1"/>
     <prop k="color_border_dd_expression" v="CASE WHEN channel_usage_current IN (4514, 4520) THEN '0,0,255,255' WHEN channel_usage_current = 4516 THEN '0,255,0,255' WHEN channel_usage_current = 4518 THEN '0,170,255,255' WHEN channel_usage_current = 4522 THEN '102,0,102,255' WHEN channel_usage_current IN (4524, 4526) THEN '255,0,0,255' ELSE '161,161,161,255' END"/>
     <prop k="color_border_dd_field" v=""/>
     <prop k="color_border_dd_useexpr" v="1"/>
     <prop k="horizontal_anchor_point" v="1"/>
     <prop k="name" v="circle"/>
     <prop k="offset" v="0,0"/>
     <prop k="offset_map_unit_scale" v="0,0"/>
     <prop k="offset_unit" v="MM"/>
     <prop k="outline_color" v="0,0,0,255"/>
     <prop k="outline_style" v="solid"/>
     <prop k="outline_width" v="0.35"/>
     <prop k="outline_width_map_unit_scale" v="0,0"/>
     <prop k="outline_width_unit" v="MM"/>
     <prop k="scale_method" v="area"/>
     <prop k="size" v="3"/>
     <prop k="size_map_unit_scale" v="0,0"/>
     <prop k="size_unit" v="MM"/>
     <prop k="vertical_anchor_point" v="1"/>
     <effect enabled="0" type="effectStack">
      <effect type="drawSource">
       <prop k="blend_mode" v="0"/>
       <prop k="draw_mode" v="2"/>
       <prop k="enabled" v="1"/>
       <prop k="transparency" v="0"/>
      </effect>
     </effect>
    </layer>
   </symbol>
   <symbol alpha="1" clip_to_extent="1" type="marker" name="10">
    <layer pass="0" class="SimpleMarker" locked="0">
     <prop k="angle" v="0"/>
     <prop k="color" v="255,255,255,255"/>
     <prop k="color_border_dd_active" v="1"/>
     <prop k="color_border_dd_expression" v="CASE WHEN channel_usage_current IN (4514, 4520) THEN '0,0,255,255' WHEN channel_usage_current = 4516 THEN '0,255,0,255' WHEN channel_usage_current = 4518 THEN '0,170,255,255' WHEN channel_usage_current = 4522 THEN '102,0,102,255' WHEN channel_usage_current IN (4524, 4526) THEN '255,0,0,255' ELSE '161,161,161,255' END"/>
     <prop k="color_border_dd_field" v=""/>
     <prop k="color_border_dd_useexpr" v="1"/>
     <prop k="horizontal_anchor_point" v="1"/>
     <prop k="name" v="circle"/>
     <prop k="offset" v="0,0"/>
     <prop k="offset_map_unit_scale" v="0,0"/>
     <prop k="offset_unit" v="MM"/>
     <prop k="outline_color" v="0,0,0,255"/>
     <prop k="outline_style" v="solid"/>
     <prop k="outline_width" v="0.3"/>
     <prop k="outline_width_map_unit_scale" v="0,0"/>
     <prop k="outline_width_unit" v="MM"/>
     <prop k="scale_method" v="area"/>
     <prop k="size" v="1.5"/>
     <prop k="size_map_unit_scale" v="0,0"/>
     <prop k="size_unit" v="MM"/>
     <prop k="vertical_anchor_point" v="1"/>
     <effect enabled="0" type="effectStack">
      <effect type="drawSource">
       <prop k="blend_mode" v="0"/>
       <prop k="draw_mode" v="2"/>
       <prop k="enabled" v="1"/>
       <prop k="transparency" v="0"/>
      </effect>
     </effect>
    </layer>
   </symbol>
   <symbol alpha="1" clip_to_extent="1" type="marker" name="11">
    <layer pass="0" class="SimpleMarker" locked="0">
     <prop k="angle" v="0"/>
     <prop k="color" v="255,255,255,255"/>
     <prop k="color_border_dd_active" v="1"/>
     <prop k="color_border_dd_expression" v="CASE WHEN channel_usage_current IN (4514, 4520) THEN '0,0,255,255' WHEN channel_usage_current = 4516 THEN '0,255,0,255' WHEN channel_usage_current = 4518 THEN '0,170,255,255' WHEN channel_usage_current = 4522 THEN '102,0,102,255' WHEN channel_usage_current IN (4524, 4526) THEN '255,0,0,255' ELSE '161,161,161,255' END"/>
     <prop k="color_border_dd_field" v=""/>
     <prop k="color_border_dd_useexpr" v="1"/>
     <prop k="horizontal_anchor_point" v="1"/>
     <prop k="name" v="circle"/>
     <prop k="offset" v="0,0"/>
     <prop k="offset_map_unit_scale" v="0,0"/>
     <prop k="offset_unit" v="MM"/>
     <prop k="outline_color" v="0,0,0,255"/>
     <prop k="outline_style" v="solid"/>
     <prop k="outline_width" v="0.3"/>
     <prop k="outline_width_map_unit_scale" v="0,0"/>
     <prop k="outline_width_unit" v="MM"/>
     <prop k="scale_method" v="area"/>
     <prop k="size" v="1.5"/>
     <prop k="size_map_unit_scale" v="0,0"/>
     <prop k="size_unit" v="MM"/>
     <prop k="vertical_anchor_point" v="1"/>
     <effect enabled="0" type="effectStack">
      <effect type="drawSource">
       <prop k="blend_mode" v="0"/>
       <prop k="draw_mode" v="2"/>
       <prop k="enabled" v="1"/>
       <prop k="transparency" v="0"/>
      </effect>
     </effect>
    </layer>
   </symbol>
   <symbol alpha="1" clip_to_extent="1" type="marker" name="12">
    <layer pass="0" class="SimpleMarker" locked="0">
     <prop k="angle" v="0"/>
     <prop k="color" v="215,215,215,255"/>
     <prop k="color_border_dd_active" v="1"/>
     <prop k="color_border_dd_expression" v="CASE WHEN channel_usage_current IN (4514, 4520) THEN '0,0,255,255' WHEN channel_usage_current = 4516 THEN '0,255,0,255' WHEN channel_usage_current = 4518 THEN '0,170,255,255' WHEN channel_usage_current = 4522 THEN '102,0,102,255' WHEN channel_usage_current IN (4524, 4526) THEN '255,0,0,255' ELSE '161,161,161,255' END"/>
     <prop k="color_border_dd_field" v=""/>
     <prop k="color_border_dd_useexpr" v="1"/>
     <prop k="horizontal_anchor_point" v="1"/>
     <prop k="name" v="circle"/>
     <prop k="offset" v="0,0"/>
     <prop k="offset_map_unit_scale" v="0,0"/>
     <prop k="offset_unit" v="MM"/>
     <prop k="outline_color" v="0,0,0,255"/>
     <prop k="outline_style" v="solid"/>
     <prop k="outline_width" v="0.3"/>
     <prop k="outline_width_map_unit_scale" v="0,0"/>
     <prop k="outline_width_unit" v="MM"/>
     <prop k="scale_method" v="area"/>
     <prop k="size" v="2"/>
     <prop k="size_map_unit_scale" v="0,0"/>
     <prop k="size_unit" v="MM"/>
     <prop k="vertical_anchor_point" v="1"/>
     <effect enabled="0" type="effectStack">
      <effect type="drawSource">
       <prop k="blend_mode" v="0"/>
       <prop k="draw_mode" v="2"/>
       <prop k="enabled" v="1"/>
       <prop k="transparency" v="0"/>
      </effect>
     </effect>
    </layer>
   </symbol>
   <symbol alpha="1" clip_to_extent="1" type="marker" name="13">
    <layer pass="0" class="SimpleMarker" locked="0">
     <prop k="angle" v="0"/>
     <prop k="color" v="215,215,215,255"/>
     <prop k="color_border_dd_active" v="1"/>
     <prop k="color_border_dd_expression" v="CASE WHEN channel_usage_current IN (4514, 4520) THEN '0,0,255,255' WHEN channel_usage_current = 4516 THEN '0,255,0,255' WHEN channel_usage_current = 4518 THEN '0,170,255,255' WHEN channel_usage_current = 4522 THEN '102,0,102,255' WHEN channel_usage_current IN (4524, 4526) THEN '255,0,0,255' ELSE '161,161,161,255' END"/>
     <prop k="color_border_dd_field" v=""/>
     <prop k="color_border_dd_useexpr" v="1"/>
     <prop k="horizontal_anchor_point" v="1"/>
     <prop k="name" v="circle"/>
     <prop k="offset" v="0,0"/>
     <prop k="offset_map_unit_scale" v="0,0"/>
     <prop k="offset_unit" v="MM"/>
     <prop k="outline_color" v="0,0,0,255"/>
     <prop k="outline_style" v="solid"/>
     <prop k="outline_width" v="0.3"/>
     <prop k="outline_width_map_unit_scale" v="0,0"/>
     <prop k="outline_width_unit" v="MM"/>
     <prop k="scale_method" v="area"/>
     <prop k="size" v="2"/>
     <prop k="size_map_unit_scale" v="0,0"/>
     <prop k="size_unit" v="MM"/>
     <prop k="vertical_anchor_point" v="1"/>
     <effect enabled="0" type="effectStack">
      <effect type="drawSource">
       <prop k="blend_mode" v="0"/>
       <prop k="draw_mode" v="2"/>
       <prop k="enabled" v="1"/>
       <prop k="transparency" v="0"/>
      </effect>
     </effect>
    </layer>
   </symbol>
   <symbol alpha="1" clip_to_extent="1" type="marker" name="14">
    <layer pass="0" class="SimpleMarker" locked="0">
     <prop k="angle" v="0"/>
     <prop k="color" v="215,215,215,255"/>
     <prop k="color_border_dd_active" v="1"/>
     <prop k="color_border_dd_expression" v="CASE WHEN channel_usage_current IN (4514, 4520) THEN '0,0,255,255' WHEN channel_usage_current = 4516 THEN '0,255,0,255' WHEN channel_usage_current = 4518 THEN '0,170,255,255' WHEN channel_usage_current = 4522 THEN '102,0,102,255' WHEN channel_usage_current IN (4524, 4526) THEN '255,0,0,255' ELSE '161,161,161,255' END"/>
     <prop k="color_border_dd_field" v=""/>
     <prop k="color_border_dd_useexpr" v="1"/>
     <prop k="horizontal_anchor_point" v="1"/>
     <prop k="name" v="circle"/>
     <prop k="offset" v="0,0"/>
     <prop k="offset_map_unit_scale" v="0,0"/>
     <prop k="offset_unit" v="MM"/>
     <prop k="outline_color" v="0,0,0,255"/>
     <prop k="outline_style" v="solid"/>
     <prop k="outline_width" v="0.3"/>
     <prop k="outline_width_map_unit_scale" v="0,0"/>
     <prop k="outline_width_unit" v="MM"/>
     <prop k="scale_method" v="area"/>
     <prop k="size" v="1.5"/>
     <prop k="size_map_unit_scale" v="0,0"/>
     <prop k="size_unit" v="MM"/>
     <prop k="vertical_anchor_point" v="1"/>
     <effect enabled="0" type="effectStack">
      <effect type="drawSource">
       <prop k="blend_mode" v="0"/>
       <prop k="draw_mode" v="2"/>
       <prop k="enabled" v="1"/>
       <prop k="transparency" v="0"/>
      </effect>
     </effect>
    </layer>
   </symbol>
   <symbol alpha="1" clip_to_extent="1" type="marker" name="15">
    <layer pass="0" class="SimpleMarker" locked="0">
     <prop k="angle" v="0"/>
     <prop k="color" v="215,215,215,255"/>
     <prop k="color_border_dd_active" v="1"/>
     <prop k="color_border_dd_expression" v="CASE WHEN channel_usage_current IN (4514, 4520) THEN '0,0,255,255' WHEN channel_usage_current = 4516 THEN '0,255,0,255' WHEN channel_usage_current = 4518 THEN '0,170,255,255' WHEN channel_usage_current = 4522 THEN '102,0,102,255' WHEN channel_usage_current IN (4524, 4526) THEN '255,0,0,255' ELSE '161,161,161,255' END"/>
     <prop k="color_border_dd_field" v=""/>
     <prop k="color_border_dd_useexpr" v="1"/>
     <prop k="horizontal_anchor_point" v="1"/>
     <prop k="name" v="circle"/>
     <prop k="offset" v="0,0"/>
     <prop k="offset_map_unit_scale" v="0,0"/>
     <prop k="offset_unit" v="MM"/>
     <prop k="outline_color" v="0,0,0,255"/>
     <prop k="outline_style" v="solid"/>
     <prop k="outline_width" v="0.3"/>
     <prop k="outline_width_map_unit_scale" v="0,0"/>
     <prop k="outline_width_unit" v="MM"/>
     <prop k="scale_method" v="area"/>
     <prop k="size" v="1.5"/>
     <prop k="size_map_unit_scale" v="0,0"/>
     <prop k="size_unit" v="MM"/>
     <prop k="vertical_anchor_point" v="1"/>
     <effect enabled="0" type="effectStack">
      <effect type="drawSource">
       <prop k="blend_mode" v="0"/>
       <prop k="draw_mode" v="2"/>
       <prop k="enabled" v="1"/>
       <prop k="transparency" v="0"/>
      </effect>
     </effect>
    </layer>
   </symbol>
   <symbol alpha="1" clip_to_extent="1" type="marker" name="16">
    <layer pass="0" class="SimpleMarker" locked="0">
     <prop k="angle" v="0"/>
     <prop k="color" v="255,255,255,255"/>
     <prop k="color_dd_active" v="1"/>
     <prop k="color_dd_expression" v="CASE WHEN channel_usage_current IN (4514, 4520) THEN '0,0,255,255' WHEN channel_usage_current = 4516 THEN '0,255,0,255' WHEN channel_usage_current = 4518 THEN '0,170,255,255' WHEN channel_usage_current = 4522 THEN '102,0,102,255' WHEN channel_usage_current IN (4524, 4526) THEN '255,0,0,255' ELSE '161,161,161,255' END"/>
     <prop k="color_dd_field" v=""/>
     <prop k="color_dd_useexpr" v="1"/>
     <prop k="horizontal_anchor_point" v="1"/>
     <prop k="name" v="circle"/>
     <prop k="offset" v="0,0"/>
     <prop k="offset_map_unit_scale" v="0,0"/>
     <prop k="offset_unit" v="MM"/>
     <prop k="outline_color" v="0,0,0,255"/>
     <prop k="outline_style" v="no"/>
     <prop k="outline_width" v="0.3"/>
     <prop k="outline_width_map_unit_scale" v="0,0"/>
     <prop k="outline_width_unit" v="MM"/>
     <prop k="scale_method" v="area"/>
     <prop k="size" v="0.8"/>
     <prop k="size_map_unit_scale" v="0,0"/>
     <prop k="size_unit" v="MM"/>
     <prop k="vertical_anchor_point" v="1"/>
     <effect enabled="0" type="effectStack">
      <effect type="drawSource">
       <prop k="blend_mode" v="0"/>
       <prop k="draw_mode" v="2"/>
       <prop k="enabled" v="1"/>
       <prop k="transparency" v="0"/>
      </effect>
     </effect>
    </layer>
   </symbol>
   <symbol alpha="1" clip_to_extent="1" type="marker" name="17">
    <layer pass="0" class="SimpleMarker" locked="0">
     <prop k="angle" v="0"/>
     <prop k="color" v="255,255,255,255"/>
     <prop k="color_dd_active" v="1"/>
     <prop k="color_dd_expression" v="CASE WHEN channel_usage_current IN (4514, 4520) THEN '0,0,255,255' WHEN channel_usage_current = 4516 THEN '0,255,0,255' WHEN channel_usage_current = 4518 THEN '0,170,255,255' WHEN channel_usage_current = 4522 THEN '102,0,102,255' WHEN channel_usage_current IN (4524, 4526) THEN '255,0,0,255' ELSE '161,161,161,255' END"/>
     <prop k="color_dd_field" v=""/>
     <prop k="color_dd_useexpr" v="1"/>
     <prop k="horizontal_anchor_point" v="1"/>
     <prop k="name" v="circle"/>
     <prop k="offset" v="0,0"/>
     <prop k="offset_map_unit_scale" v="0,0"/>
     <prop k="offset_unit" v="MM"/>
     <prop k="outline_color" v="0,0,0,255"/>
     <prop k="outline_style" v="no"/>
     <prop k="outline_width" v="0.3"/>
     <prop k="outline_width_map_unit_scale" v="0,0"/>
     <prop k="outline_width_unit" v="MM"/>
     <prop k="scale_method" v="area"/>
     <prop k="size" v="0.8"/>
     <prop k="size_map_unit_scale" v="0,0"/>
     <prop k="size_unit" v="MM"/>
     <prop k="vertical_anchor_point" v="1"/>
     <effect enabled="0" type="effectStack">
      <effect type="drawSource">
       <prop k="blend_mode" v="0"/>
       <prop k="draw_mode" v="2"/>
       <prop k="enabled" v="1"/>
       <prop k="transparency" v="0"/>
      </effect>
     </effect>
    </layer>
   </symbol>
   <symbol alpha="1" clip_to_extent="1" type="marker" name="18">
    <layer pass="0" class="SimpleMarker" locked="0">
     <prop k="angle" v="0"/>
     <prop k="color" v="255,255,255,255"/>
     <prop k="color_border_dd_active" v="1"/>
     <prop k="color_border_dd_expression" v="CASE WHEN channel_usage_current IN (4514, 4520) THEN '0,0,255,255' WHEN channel_usage_current = 4516 THEN '0,255,0,255' WHEN channel_usage_current = 4518 THEN '0,170,255,255' WHEN channel_usage_current = 4522 THEN '102,0,102,255' WHEN channel_usage_current IN (4524, 4526) THEN '255,0,0,255' ELSE '161,161,161,255' END"/>
     <prop k="color_border_dd_field" v=""/>
     <prop k="color_border_dd_useexpr" v="1"/>
     <prop k="horizontal_anchor_point" v="1"/>
     <prop k="name" v="circle"/>
     <prop k="offset" v="0,0"/>
     <prop k="offset_map_unit_scale" v="0,0"/>
     <prop k="offset_unit" v="MM"/>
     <prop k="outline_color" v="0,0,0,255"/>
     <prop k="outline_style" v="solid"/>
     <prop k="outline_width" v="0.3"/>
     <prop k="outline_width_map_unit_scale" v="0,0"/>
     <prop k="outline_width_unit" v="MM"/>
     <prop k="scale_method" v="area"/>
     <prop k="size" v="1.5"/>
     <prop k="size_map_unit_scale" v="0,0"/>
     <prop k="size_unit" v="MM"/>
     <prop k="vertical_anchor_point" v="1"/>
     <effect enabled="0" type="effectStack">
      <effect type="drawSource">
       <prop k="blend_mode" v="0"/>
       <prop k="draw_mode" v="2"/>
       <prop k="enabled" v="1"/>
       <prop k="transparency" v="0"/>
      </effect>
     </effect>
    </layer>
   </symbol>
   <symbol alpha="1" clip_to_extent="1" type="marker" name="19">
    <layer pass="0" class="SimpleMarker" locked="0">
     <prop k="angle" v="0"/>
     <prop k="color" v="255,255,255,255"/>
     <prop k="color_border_dd_active" v="1"/>
     <prop k="color_border_dd_expression" v="CASE WHEN channel_usage_current IN (4514, 4520) THEN '0,0,255,255' WHEN channel_usage_current = 4516 THEN '0,255,0,255' WHEN channel_usage_current = 4518 THEN '0,170,255,255' WHEN channel_usage_current = 4522 THEN '102,0,102,255' WHEN channel_usage_current IN (4524, 4526) THEN '255,0,0,255' ELSE '161,161,161,255' END"/>
     <prop k="color_border_dd_field" v=""/>
     <prop k="color_border_dd_useexpr" v="1"/>
     <prop k="horizontal_anchor_point" v="1"/>
     <prop k="name" v="circle"/>
     <prop k="offset" v="0,0"/>
     <prop k="offset_map_unit_scale" v="0,0"/>
     <prop k="offset_unit" v="MM"/>
     <prop k="outline_color" v="0,0,0,255"/>
     <prop k="outline_style" v="solid"/>
     <prop k="outline_width" v="0.3"/>
     <prop k="outline_width_map_unit_scale" v="0,0"/>
     <prop k="outline_width_unit" v="MM"/>
     <prop k="scale_method" v="area"/>
     <prop k="size" v="1.5"/>
     <prop k="size_map_unit_scale" v="0,0"/>
     <prop k="size_unit" v="MM"/>
     <prop k="vertical_anchor_point" v="1"/>
     <effect enabled="0" type="effectStack">
      <effect type="drawSource">
       <prop k="blend_mode" v="0"/>
       <prop k="draw_mode" v="2"/>
       <prop k="enabled" v="1"/>
       <prop k="transparency" v="0"/>
      </effect>
     </effect>
    </layer>
   </symbol>
   <symbol alpha="1" clip_to_extent="1" type="marker" name="2">
    <layer pass="0" class="SimpleMarker" locked="0">
     <prop k="angle" v="90"/>
     <prop k="color" v="255,0,0,255"/>
     <prop k="color_border_dd_active" v="1"/>
     <prop k="color_border_dd_expression" v="CASE WHEN channel_usage_current IN (4514, 4520) THEN '0,0,255,255' WHEN channel_usage_current = 4516 THEN '0,255,0,255' WHEN channel_usage_current = 4518 THEN '0,170,255,255' WHEN channel_usage_current = 4522 THEN '102,0,102,255' WHEN channel_usage_current IN (4524, 4526) THEN '255,0,0,255' ELSE '161,161,161,255' END"/>
     <prop k="color_border_dd_field" v=""/>
     <prop k="color_border_dd_useexpr" v="1"/>
     <prop k="horizontal_anchor_point" v="1"/>
     <prop k="name" v="line"/>
     <prop k="offset" v="1.2,0"/>
     <prop k="offset_map_unit_scale" v="0,0"/>
     <prop k="offset_unit" v="MM"/>
     <prop k="outline_color" v="0,0,0,255"/>
     <prop k="outline_style" v="solid"/>
     <prop k="outline_width" v="0.3"/>
     <prop k="outline_width_map_unit_scale" v="0,0"/>
     <prop k="outline_width_unit" v="MM"/>
     <prop k="scale_method" v="area"/>
     <prop k="size" v="2"/>
     <prop k="size_map_unit_scale" v="0,0"/>
     <prop k="size_unit" v="MM"/>
     <prop k="vertical_anchor_point" v="1"/>
     <effect enabled="0" type="effectStack">
      <effect type="drawSource">
       <prop k="blend_mode" v="0"/>
       <prop k="draw_mode" v="2"/>
       <prop k="enabled" v="1"/>
       <prop k="transparency" v="0"/>
      </effect>
     </effect>
    </layer>
    <layer pass="0" class="SimpleMarker" locked="0">
     <prop k="angle" v="90"/>
     <prop k="color" v="255,0,0,255"/>
     <prop k="color_border_dd_active" v="1"/>
     <prop k="color_border_dd_expression" v="CASE WHEN channel_usage_current IN (4514, 4520) THEN '0,0,255,255' WHEN channel_usage_current = 4516 THEN '0,255,0,255' WHEN channel_usage_current = 4518 THEN '0,170,255,255' WHEN channel_usage_current = 4522 THEN '102,0,102,255' WHEN channel_usage_current IN (4524, 4526) THEN '255,0,0,255' ELSE '161,161,161,255' END"/>
     <prop k="color_border_dd_field" v=""/>
     <prop k="color_border_dd_useexpr" v="1"/>
     <prop k="horizontal_anchor_point" v="1"/>
     <prop k="name" v="line"/>
     <prop k="offset" v="-1.2,0"/>
     <prop k="offset_map_unit_scale" v="0,0"/>
     <prop k="offset_unit" v="MM"/>
     <prop k="outline_color" v="0,0,0,255"/>
     <prop k="outline_style" v="solid"/>
     <prop k="outline_width" v="0.35"/>
     <prop k="outline_width_map_unit_scale" v="0,0"/>
     <prop k="outline_width_unit" v="MM"/>
     <prop k="scale_method" v="area"/>
     <prop k="size" v="2"/>
     <prop k="size_map_unit_scale" v="0,0"/>
     <prop k="size_unit" v="MM"/>
     <prop k="vertical_anchor_point" v="1"/>
     <effect enabled="0" type="effectStack">
      <effect type="drawSource">
       <prop k="blend_mode" v="0"/>
       <prop k="draw_mode" v="2"/>
       <prop k="enabled" v="1"/>
       <prop k="transparency" v="0"/>
      </effect>
     </effect>
    </layer>
    <layer pass="0" class="SimpleMarker" locked="0">
     <prop k="angle" v="0"/>
     <prop k="color" v="255,0,0,255"/>
     <prop k="color_border_dd_active" v="1"/>
     <prop k="color_border_dd_expression" v="CASE WHEN channel_usage_current IN (4514, 4520) THEN '0,0,255,255' WHEN channel_usage_current = 4516 THEN '0,255,0,255' WHEN channel_usage_current = 4518 THEN '0,170,255,255' WHEN channel_usage_current = 4522 THEN '102,0,102,255' WHEN channel_usage_current IN (4524, 4526) THEN '255,0,0,255' ELSE '161,161,161,255' END"/>
     <prop k="color_border_dd_field" v=""/>
     <prop k="color_border_dd_useexpr" v="1"/>
     <prop k="horizontal_anchor_point" v="1"/>
     <prop k="name" v="line"/>
     <prop k="offset" v="0,0"/>
     <prop k="offset_map_unit_scale" v="0,0"/>
     <prop k="offset_unit" v="MM"/>
     <prop k="outline_color" v="0,0,0,255"/>
     <prop k="outline_style" v="solid"/>
     <prop k="outline_width" v="0.3"/>
     <prop k="outline_width_map_unit_scale" v="0,0"/>
     <prop k="outline_width_unit" v="MM"/>
     <prop k="scale_method" v="area"/>
     <prop k="size" v="4"/>
     <prop k="size_map_unit_scale" v="0,0"/>
     <prop k="size_unit" v="MM"/>
     <prop k="vertical_anchor_point" v="1"/>
     <effect enabled="0" type="effectStack">
      <effect type="drawSource">
       <prop k="blend_mode" v="0"/>
       <prop k="draw_mode" v="2"/>
       <prop k="enabled" v="1"/>
       <prop k="transparency" v="0"/>
      </effect>
     </effect>
    </layer>
   </symbol>
   <symbol alpha="1" clip_to_extent="1" type="marker" name="20">
    <layer pass="0" class="SimpleMarker" locked="0">
     <prop k="angle" v="0"/>
     <prop k="color" v="255,33,252,255"/>
     <prop k="horizontal_anchor_point" v="1"/>
     <prop k="name" v="circle"/>
     <prop k="offset" v="0,0"/>
     <prop k="offset_map_unit_scale" v="0,0"/>
     <prop k="offset_unit" v="MM"/>
     <prop k="outline_color" v="0,0,0,255"/>
     <prop k="outline_style" v="solid"/>
     <prop k="outline_width" v="0"/>
     <prop k="outline_width_map_unit_scale" v="0,0"/>
     <prop k="outline_width_unit" v="MM"/>
     <prop k="scale_method" v="area"/>
     <prop k="size" v="2"/>
     <prop k="size_map_unit_scale" v="0,0"/>
     <prop k="size_unit" v="MM"/>
     <prop k="vertical_anchor_point" v="1"/>
     <effect enabled="0" type="effectStack">
      <effect type="drawSource">
       <prop k="blend_mode" v="0"/>
       <prop k="draw_mode" v="2"/>
       <prop k="enabled" v="1"/>
       <prop k="transparency" v="0"/>
      </effect>
     </effect>
    </layer>
   </symbol>
   <symbol alpha="1" clip_to_extent="1" type="marker" name="3">
    <layer pass="0" class="SimpleMarker" locked="0">
     <prop k="angle" v="90"/>
     <prop k="color" v="255,0,0,255"/>
     <prop k="color_border_dd_active" v="1"/>
     <prop k="color_border_dd_expression" v="CASE WHEN channel_usage_current IN (4514, 4520) THEN '0,0,255,255' WHEN channel_usage_current = 4516 THEN '0,255,0,255' WHEN channel_usage_current = 4518 THEN '0,170,255,255' WHEN channel_usage_current = 4522 THEN '102,0,102,255' WHEN channel_usage_current IN (4524, 4526) THEN '255,0,0,255' ELSE '161,161,161,255' END"/>
     <prop k="color_border_dd_field" v=""/>
     <prop k="color_border_dd_useexpr" v="1"/>
     <prop k="horizontal_anchor_point" v="1"/>
     <prop k="name" v="line"/>
     <prop k="offset" v="1.2,0"/>
     <prop k="offset_map_unit_scale" v="0,0"/>
     <prop k="offset_unit" v="MM"/>
     <prop k="outline_color" v="0,0,0,255"/>
     <prop k="outline_style" v="solid"/>
     <prop k="outline_width" v="0.3"/>
     <prop k="outline_width_map_unit_scale" v="0,0"/>
     <prop k="outline_width_unit" v="MM"/>
     <prop k="scale_method" v="area"/>
     <prop k="size" v="2"/>
     <prop k="size_map_unit_scale" v="0,0"/>
     <prop k="size_unit" v="MM"/>
     <prop k="vertical_anchor_point" v="1"/>
     <effect enabled="0" type="effectStack">
      <effect type="drawSource">
       <prop k="blend_mode" v="0"/>
       <prop k="draw_mode" v="2"/>
       <prop k="enabled" v="1"/>
       <prop k="transparency" v="0"/>
      </effect>
     </effect>
    </layer>
    <layer pass="0" class="SimpleMarker" locked="0">
     <prop k="angle" v="90"/>
     <prop k="color" v="255,0,0,255"/>
     <prop k="color_border_dd_active" v="1"/>
     <prop k="color_border_dd_expression" v="CASE WHEN channel_usage_current IN (4514, 4520) THEN '0,0,255,255' WHEN channel_usage_current = 4516 THEN '0,255,0,255' WHEN channel_usage_current = 4518 THEN '0,170,255,255' WHEN channel_usage_current = 4522 THEN '102,0,102,255' WHEN channel_usage_current IN (4524, 4526) THEN '255,0,0,255' ELSE '161,161,161,255' END"/>
     <prop k="color_border_dd_field" v=""/>
     <prop k="color_border_dd_useexpr" v="1"/>
     <prop k="horizontal_anchor_point" v="1"/>
     <prop k="name" v="line"/>
     <prop k="offset" v="-1.2,0"/>
     <prop k="offset_map_unit_scale" v="0,0"/>
     <prop k="offset_unit" v="MM"/>
     <prop k="outline_color" v="0,0,0,255"/>
     <prop k="outline_style" v="solid"/>
     <prop k="outline_width" v="0.35"/>
     <prop k="outline_width_map_unit_scale" v="0,0"/>
     <prop k="outline_width_unit" v="MM"/>
     <prop k="scale_method" v="area"/>
     <prop k="size" v="2"/>
     <prop k="size_map_unit_scale" v="0,0"/>
     <prop k="size_unit" v="MM"/>
     <prop k="vertical_anchor_point" v="1"/>
     <effect enabled="0" type="effectStack">
      <effect type="drawSource">
       <prop k="blend_mode" v="0"/>
       <prop k="draw_mode" v="2"/>
       <prop k="enabled" v="1"/>
       <prop k="transparency" v="0"/>
      </effect>
     </effect>
    </layer>
    <layer pass="0" class="SimpleMarker" locked="0">
     <prop k="angle" v="0"/>
     <prop k="color" v="255,0,0,255"/>
     <prop k="color_border_dd_active" v="1"/>
     <prop k="color_border_dd_expression" v="CASE WHEN channel_usage_current IN (4514, 4520) THEN '0,0,255,255' WHEN channel_usage_current = 4516 THEN '0,255,0,255' WHEN channel_usage_current = 4518 THEN '0,170,255,255' WHEN channel_usage_current = 4522 THEN '102,0,102,255' WHEN channel_usage_current IN (4524, 4526) THEN '255,0,0,255' ELSE '161,161,161,255' END"/>
     <prop k="color_border_dd_field" v=""/>
     <prop k="color_border_dd_useexpr" v="1"/>
     <prop k="horizontal_anchor_point" v="1"/>
     <prop k="name" v="line"/>
     <prop k="offset" v="0,0"/>
     <prop k="offset_map_unit_scale" v="0,0"/>
     <prop k="offset_unit" v="MM"/>
     <prop k="outline_color" v="0,0,0,255"/>
     <prop k="outline_style" v="solid"/>
     <prop k="outline_width" v="0.3"/>
     <prop k="outline_width_map_unit_scale" v="0,0"/>
     <prop k="outline_width_unit" v="MM"/>
     <prop k="scale_method" v="area"/>
     <prop k="size" v="4"/>
     <prop k="size_map_unit_scale" v="0,0"/>
     <prop k="size_unit" v="MM"/>
     <prop k="vertical_anchor_point" v="1"/>
     <effect enabled="0" type="effectStack">
      <effect type="drawSource">
       <prop k="blend_mode" v="0"/>
       <prop k="draw_mode" v="2"/>
       <prop k="enabled" v="1"/>
       <prop k="transparency" v="0"/>
      </effect>
     </effect>
    </layer>
   </symbol>
   <symbol alpha="1" clip_to_extent="1" type="marker" name="4">
    <layer pass="0" class="SimpleMarker" locked="0">
     <prop k="angle" v="0"/>
     <prop k="color" v="255,255,255,255"/>
     <prop k="color_border_dd_active" v="1"/>
     <prop k="color_border_dd_expression" v="CASE WHEN channel_usage_current IN (4514, 4520) THEN '0,0,255,255' WHEN channel_usage_current = 4516 THEN '0,255,0,255' WHEN channel_usage_current = 4518 THEN '0,170,255,255' WHEN channel_usage_current = 4522 THEN '102,0,102,255' WHEN channel_usage_current IN (4524, 4526) THEN '255,0,0,255' ELSE '161,161,161,255' END"/>
     <prop k="color_border_dd_field" v=""/>
     <prop k="color_border_dd_useexpr" v="1"/>
     <prop k="horizontal_anchor_point" v="1"/>
     <prop k="name" v="circle"/>
     <prop k="offset" v="0,0"/>
     <prop k="offset_map_unit_scale" v="0,0"/>
     <prop k="offset_unit" v="MM"/>
     <prop k="outline_color" v="0,0,0,255"/>
     <prop k="outline_style" v="solid"/>
     <prop k="outline_width" v="0.35"/>
     <prop k="outline_width_map_unit_scale" v="0,0"/>
     <prop k="outline_width_unit" v="MM"/>
     <prop k="scale_method" v="area"/>
     <prop k="size" v="4"/>
     <prop k="size_map_unit_scale" v="0,0"/>
     <prop k="size_unit" v="MM"/>
     <prop k="vertical_anchor_point" v="1"/>
     <effect enabled="0" type="effectStack">
      <effect type="drawSource">
       <prop k="blend_mode" v="0"/>
       <prop k="draw_mode" v="2"/>
       <prop k="enabled" v="1"/>
       <prop k="transparency" v="0"/>
      </effect>
     </effect>
    </layer>
    <layer pass="0" class="SimpleMarker" locked="0">
     <prop k="angle" v="0"/>
     <prop k="color" v="255,0,0,255"/>
     <prop k="color_dd_active" v="1"/>
     <prop k="color_dd_expression" v="CASE WHEN channel_usage_current IN (4514, 4520) THEN '0,0,255,255' WHEN channel_usage_current = 4516 THEN '0,255,0,255' WHEN channel_usage_current = 4518 THEN '0,170,255,255' WHEN channel_usage_current = 4522 THEN '102,0,102,255' WHEN channel_usage_current IN (4524, 4526) THEN '255,0,0,255' ELSE '161,161,161,255' END"/>
     <prop k="color_dd_field" v=""/>
     <prop k="color_dd_useexpr" v="1"/>
     <prop k="horizontal_anchor_point" v="1"/>
     <prop k="name" v="equilateral_triangle"/>
     <prop k="offset" v="0,0"/>
     <prop k="offset_map_unit_scale" v="0,0"/>
     <prop k="offset_unit" v="MM"/>
     <prop k="outline_color" v="0,0,0,255"/>
     <prop k="outline_style" v="no"/>
     <prop k="outline_width" v="0"/>
     <prop k="outline_width_map_unit_scale" v="0,0"/>
     <prop k="outline_width_unit" v="MM"/>
     <prop k="scale_method" v="area"/>
     <prop k="size" v="3.7"/>
     <prop k="size_map_unit_scale" v="0,0"/>
     <prop k="size_unit" v="MM"/>
     <prop k="vertical_anchor_point" v="1"/>
     <effect enabled="0" type="effectStack">
      <effect type="drawSource">
       <prop k="blend_mode" v="0"/>
       <prop k="draw_mode" v="2"/>
       <prop k="enabled" v="1"/>
       <prop k="transparency" v="0"/>
      </effect>
     </effect>
    </layer>
   </symbol>
   <symbol alpha="1" clip_to_extent="1" type="marker" name="5">
    <layer pass="0" class="SimpleMarker" locked="0">
     <prop k="angle" v="0"/>
     <prop k="color" v="255,255,255,255"/>
     <prop k="color_border_dd_active" v="1"/>
     <prop k="color_border_dd_expression" v="CASE WHEN channel_usage_current IN (4514, 4520) THEN '0,0,255,255' WHEN channel_usage_current = 4516 THEN '0,255,0,255' WHEN channel_usage_current = 4518 THEN '0,170,255,255' WHEN channel_usage_current = 4522 THEN '102,0,102,255' WHEN channel_usage_current IN (4524, 4526) THEN '255,0,0,255' ELSE '161,161,161,255' END"/>
     <prop k="color_border_dd_field" v=""/>
     <prop k="color_border_dd_useexpr" v="1"/>
     <prop k="horizontal_anchor_point" v="1"/>
     <prop k="name" v="circle"/>
     <prop k="offset" v="0,0"/>
     <prop k="offset_map_unit_scale" v="0,0"/>
     <prop k="offset_unit" v="MM"/>
     <prop k="outline_color" v="0,0,0,255"/>
     <prop k="outline_style" v="solid"/>
     <prop k="outline_width" v="0.35"/>
     <prop k="outline_width_map_unit_scale" v="0,0"/>
     <prop k="outline_width_unit" v="MM"/>
     <prop k="scale_method" v="area"/>
     <prop k="size" v="4"/>
     <prop k="size_map_unit_scale" v="0,0"/>
     <prop k="size_unit" v="MM"/>
     <prop k="vertical_anchor_point" v="1"/>
     <effect enabled="0" type="effectStack">
      <effect type="drawSource">
       <prop k="blend_mode" v="0"/>
       <prop k="draw_mode" v="2"/>
       <prop k="enabled" v="1"/>
       <prop k="transparency" v="0"/>
      </effect>
     </effect>
    </layer>
    <layer pass="0" class="SimpleMarker" locked="0">
     <prop k="angle" v="0"/>
     <prop k="color" v="255,0,0,255"/>
     <prop k="color_dd_active" v="1"/>
     <prop k="color_dd_expression" v="CASE WHEN channel_usage_current IN (4514, 4520) THEN '0,0,255,255' WHEN channel_usage_current = 4516 THEN '0,255,0,255' WHEN channel_usage_current = 4518 THEN '0,170,255,255' WHEN channel_usage_current = 4522 THEN '102,0,102,255' WHEN channel_usage_current IN (4524, 4526) THEN '255,0,0,255' ELSE '161,161,161,255' END"/>
     <prop k="color_dd_field" v=""/>
     <prop k="color_dd_useexpr" v="1"/>
     <prop k="horizontal_anchor_point" v="1"/>
     <prop k="name" v="equilateral_triangle"/>
     <prop k="offset" v="0,0"/>
     <prop k="offset_map_unit_scale" v="0,0"/>
     <prop k="offset_unit" v="MM"/>
     <prop k="outline_color" v="0,0,0,255"/>
     <prop k="outline_style" v="no"/>
     <prop k="outline_width" v="0"/>
     <prop k="outline_width_map_unit_scale" v="0,0"/>
     <prop k="outline_width_unit" v="MM"/>
     <prop k="scale_method" v="area"/>
     <prop k="size" v="3.7"/>
     <prop k="size_map_unit_scale" v="0,0"/>
     <prop k="size_unit" v="MM"/>
     <prop k="vertical_anchor_point" v="1"/>
     <effect enabled="0" type="effectStack">
      <effect type="drawSource">
       <prop k="blend_mode" v="0"/>
       <prop k="draw_mode" v="2"/>
       <prop k="enabled" v="1"/>
       <prop k="transparency" v="0"/>
      </effect>
     </effect>
    </layer>
   </symbol>
   <symbol alpha="1" clip_to_extent="1" type="marker" name="6">
    <layer pass="0" class="SimpleMarker" locked="0">
     <prop k="angle" v="0"/>
     <prop k="color" v="255,255,255,255"/>
     <prop k="color_border_dd_active" v="1"/>
     <prop k="color_border_dd_expression" v="CASE WHEN channel_usage_current IN (4514, 4520) THEN '0,0,255,255' WHEN channel_usage_current = 4516 THEN '0,255,0,255' WHEN channel_usage_current = 4518 THEN '0,170,255,255' WHEN channel_usage_current = 4522 THEN '102,0,102,255' WHEN channel_usage_current IN (4524, 4526) THEN '255,0,0,255' ELSE '161,161,161,255' END"/>
     <prop k="color_border_dd_field" v=""/>
     <prop k="color_border_dd_useexpr" v="1"/>
     <prop k="horizontal_anchor_point" v="1"/>
     <prop k="name" v="circle"/>
     <prop k="offset" v="0,0"/>
     <prop k="offset_map_unit_scale" v="0,0"/>
     <prop k="offset_unit" v="MM"/>
     <prop k="outline_color" v="0,0,0,255"/>
     <prop k="outline_style" v="solid"/>
     <prop k="outline_width" v="0.35"/>
     <prop k="outline_width_map_unit_scale" v="0,0"/>
     <prop k="outline_width_unit" v="MM"/>
     <prop k="scale_method" v="area"/>
     <prop k="size" v="3"/>
     <prop k="size_map_unit_scale" v="0,0"/>
     <prop k="size_unit" v="MM"/>
     <prop k="vertical_anchor_point" v="1"/>
     <effect enabled="0" type="effectStack">
      <effect type="drawSource">
       <prop k="blend_mode" v="0"/>
       <prop k="draw_mode" v="2"/>
       <prop k="enabled" v="1"/>
       <prop k="transparency" v="0"/>
      </effect>
     </effect>
    </layer>
    <layer pass="0" class="SimpleMarker" locked="0">
     <prop k="angle" v="0"/>
     <prop k="color" v="255,0,0,255"/>
     <prop k="color_border_dd_active" v="1"/>
     <prop k="color_border_dd_expression" v="CASE WHEN channel_usage_current IN (4514, 4520) THEN '0,0,255,255' WHEN channel_usage_current = 4516 THEN '0,255,0,255' WHEN channel_usage_current = 4518 THEN '0,170,255,255' WHEN channel_usage_current = 4522 THEN '102,0,102,255' WHEN channel_usage_current IN (4524, 4526) THEN '255,0,0,255' ELSE '161,161,161,255' END"/>
     <prop k="color_border_dd_field" v=""/>
     <prop k="color_border_dd_useexpr" v="1"/>
     <prop k="horizontal_anchor_point" v="1"/>
     <prop k="name" v="line"/>
     <prop k="offset" v="0.5,0"/>
     <prop k="offset_map_unit_scale" v="0,0"/>
     <prop k="offset_unit" v="MM"/>
     <prop k="outline_color" v="0,0,0,255"/>
     <prop k="outline_style" v="solid"/>
     <prop k="outline_width" v="0.35"/>
     <prop k="outline_width_map_unit_scale" v="0,0"/>
     <prop k="outline_width_unit" v="MM"/>
     <prop k="scale_method" v="area"/>
     <prop k="size" v="2"/>
     <prop k="size_map_unit_scale" v="0,0"/>
     <prop k="size_unit" v="MM"/>
     <prop k="vertical_anchor_point" v="1"/>
     <effect enabled="0" type="effectStack">
      <effect type="drawSource">
       <prop k="blend_mode" v="0"/>
       <prop k="draw_mode" v="2"/>
       <prop k="enabled" v="1"/>
       <prop k="transparency" v="0"/>
      </effect>
     </effect>
    </layer>
    <layer pass="0" class="SimpleMarker" locked="0">
     <prop k="angle" v="0"/>
     <prop k="color" v="255,0,0,255"/>
     <prop k="color_border_dd_active" v="1"/>
     <prop k="color_border_dd_expression" v="CASE WHEN channel_usage_current IN (4514, 4520) THEN '0,0,255,255' WHEN channel_usage_current = 4516 THEN '0,255,0,255' WHEN channel_usage_current = 4518 THEN '0,170,255,255' WHEN channel_usage_current = 4522 THEN '102,0,102,255' WHEN channel_usage_current IN (4524, 4526) THEN '255,0,0,255' ELSE '161,161,161,255' END"/>
     <prop k="color_border_dd_field" v=""/>
     <prop k="color_border_dd_useexpr" v="1"/>
     <prop k="horizontal_anchor_point" v="1"/>
     <prop k="name" v="line"/>
     <prop k="offset" v="-0.5,0"/>
     <prop k="offset_map_unit_scale" v="0,0"/>
     <prop k="offset_unit" v="MM"/>
     <prop k="outline_color" v="0,0,0,255"/>
     <prop k="outline_style" v="solid"/>
     <prop k="outline_width" v="0.35"/>
     <prop k="outline_width_map_unit_scale" v="0,0"/>
     <prop k="outline_width_unit" v="MM"/>
     <prop k="scale_method" v="area"/>
     <prop k="size" v="2"/>
     <prop k="size_map_unit_scale" v="0,0"/>
     <prop k="size_unit" v="MM"/>
     <prop k="vertical_anchor_point" v="1"/>
     <effect enabled="0" type="effectStack">
      <effect type="drawSource">
       <prop k="blend_mode" v="0"/>
       <prop k="draw_mode" v="2"/>
       <prop k="enabled" v="1"/>
       <prop k="transparency" v="0"/>
      </effect>
     </effect>
    </layer>
   </symbol>
   <symbol alpha="1" clip_to_extent="1" type="marker" name="7">
    <layer pass="0" class="SimpleMarker" locked="0">
     <prop k="angle" v="0"/>
     <prop k="color" v="255,255,255,255"/>
     <prop k="color_border_dd_active" v="1"/>
     <prop k="color_border_dd_expression" v="CASE WHEN channel_usage_current IN (4514, 4520) THEN '0,0,255,255' WHEN channel_usage_current = 4516 THEN '0,255,0,255' WHEN channel_usage_current = 4518 THEN '0,170,255,255' WHEN channel_usage_current = 4522 THEN '102,0,102,255' WHEN channel_usage_current IN (4524, 4526) THEN '255,0,0,255' ELSE '161,161,161,255' END"/>
     <prop k="color_border_dd_field" v=""/>
     <prop k="color_border_dd_useexpr" v="1"/>
     <prop k="horizontal_anchor_point" v="1"/>
     <prop k="name" v="circle"/>
     <prop k="offset" v="0,0"/>
     <prop k="offset_map_unit_scale" v="0,0"/>
     <prop k="offset_unit" v="MM"/>
     <prop k="outline_color" v="0,0,0,255"/>
     <prop k="outline_style" v="solid"/>
     <prop k="outline_width" v="0.35"/>
     <prop k="outline_width_map_unit_scale" v="0,0"/>
     <prop k="outline_width_unit" v="MM"/>
     <prop k="scale_method" v="area"/>
     <prop k="size" v="3"/>
     <prop k="size_map_unit_scale" v="0,0"/>
     <prop k="size_unit" v="MM"/>
     <prop k="vertical_anchor_point" v="1"/>
     <effect enabled="0" type="effectStack">
      <effect type="drawSource">
       <prop k="blend_mode" v="0"/>
       <prop k="draw_mode" v="2"/>
       <prop k="enabled" v="1"/>
       <prop k="transparency" v="0"/>
      </effect>
     </effect>
    </layer>
    <layer pass="0" class="SimpleMarker" locked="0">
     <prop k="angle" v="0"/>
     <prop k="color" v="255,0,0,255"/>
     <prop k="color_border_dd_active" v="1"/>
     <prop k="color_border_dd_expression" v="CASE WHEN channel_usage_current IN (4514, 4520) THEN '0,0,255,255' WHEN channel_usage_current = 4516 THEN '0,255,0,255' WHEN channel_usage_current = 4518 THEN '0,170,255,255' WHEN channel_usage_current = 4522 THEN '102,0,102,255' WHEN channel_usage_current IN (4524, 4526) THEN '255,0,0,255' ELSE '161,161,161,255' END"/>
     <prop k="color_border_dd_field" v=""/>
     <prop k="color_border_dd_useexpr" v="1"/>
     <prop k="horizontal_anchor_point" v="1"/>
     <prop k="name" v="line"/>
     <prop k="offset" v="0.5,0"/>
     <prop k="offset_map_unit_scale" v="0,0"/>
     <prop k="offset_unit" v="MM"/>
     <prop k="outline_color" v="0,0,0,255"/>
     <prop k="outline_style" v="solid"/>
     <prop k="outline_width" v="0.35"/>
     <prop k="outline_width_map_unit_scale" v="0,0"/>
     <prop k="outline_width_unit" v="MM"/>
     <prop k="scale_method" v="area"/>
     <prop k="size" v="2"/>
     <prop k="size_map_unit_scale" v="0,0"/>
     <prop k="size_unit" v="MM"/>
     <prop k="vertical_anchor_point" v="1"/>
     <effect enabled="0" type="effectStack">
      <effect type="drawSource">
       <prop k="blend_mode" v="0"/>
       <prop k="draw_mode" v="2"/>
       <prop k="enabled" v="1"/>
       <prop k="transparency" v="0"/>
      </effect>
     </effect>
    </layer>
    <layer pass="0" class="SimpleMarker" locked="0">
     <prop k="angle" v="0"/>
     <prop k="color" v="255,0,0,255"/>
     <prop k="color_border_dd_active" v="1"/>
     <prop k="color_border_dd_expression" v="CASE WHEN channel_usage_current IN (4514, 4520) THEN '0,0,255,255' WHEN channel_usage_current = 4516 THEN '0,255,0,255' WHEN channel_usage_current = 4518 THEN '0,170,255,255' WHEN channel_usage_current = 4522 THEN '102,0,102,255' WHEN channel_usage_current IN (4524, 4526) THEN '255,0,0,255' ELSE '161,161,161,255' END"/>
     <prop k="color_border_dd_field" v=""/>
     <prop k="color_border_dd_useexpr" v="1"/>
     <prop k="horizontal_anchor_point" v="1"/>
     <prop k="name" v="line"/>
     <prop k="offset" v="-0.5,0"/>
     <prop k="offset_map_unit_scale" v="0,0"/>
     <prop k="offset_unit" v="MM"/>
     <prop k="outline_color" v="0,0,0,255"/>
     <prop k="outline_style" v="solid"/>
     <prop k="outline_width" v="0.35"/>
     <prop k="outline_width_map_unit_scale" v="0,0"/>
     <prop k="outline_width_unit" v="MM"/>
     <prop k="scale_method" v="area"/>
     <prop k="size" v="2"/>
     <prop k="size_map_unit_scale" v="0,0"/>
     <prop k="size_unit" v="MM"/>
     <prop k="vertical_anchor_point" v="1"/>
     <effect enabled="0" type="effectStack">
      <effect type="drawSource">
       <prop k="blend_mode" v="0"/>
       <prop k="draw_mode" v="2"/>
       <prop k="enabled" v="1"/>
       <prop k="transparency" v="0"/>
      </effect>
     </effect>
    </layer>
   </symbol>
   <symbol alpha="1" clip_to_extent="1" type="marker" name="8">
    <layer pass="0" class="SimpleMarker" locked="0">
     <prop k="angle" v="0"/>
     <prop k="color" v="255,255,255,255"/>
     <prop k="color_border_dd_active" v="1"/>
     <prop k="color_border_dd_expression" v="CASE WHEN channel_usage_current IN (4514, 4520) THEN '0,0,255,255' WHEN channel_usage_current = 4516 THEN '0,255,0,255' WHEN channel_usage_current = 4518 THEN '0,170,255,255' WHEN channel_usage_current = 4522 THEN '102,0,102,255' WHEN channel_usage_current IN (4524, 4526) THEN '255,0,0,255' ELSE '161,161,161,255' END"/>
     <prop k="color_border_dd_field" v=""/>
     <prop k="color_border_dd_useexpr" v="1"/>
     <prop k="horizontal_anchor_point" v="1"/>
     <prop k="name" v="circle"/>
     <prop k="offset" v="0,0"/>
     <prop k="offset_map_unit_scale" v="0,0"/>
     <prop k="offset_unit" v="MM"/>
     <prop k="outline_color" v="0,0,0,255"/>
     <prop k="outline_style" v="solid"/>
     <prop k="outline_width" v="0.3"/>
     <prop k="outline_width_map_unit_scale" v="0,0"/>
     <prop k="outline_width_unit" v="MM"/>
     <prop k="scale_method" v="area"/>
     <prop k="size" v="1.5"/>
     <prop k="size_map_unit_scale" v="0,0"/>
     <prop k="size_unit" v="MM"/>
     <prop k="vertical_anchor_point" v="1"/>
     <effect enabled="0" type="effectStack">
      <effect type="drawSource">
       <prop k="blend_mode" v="0"/>
       <prop k="draw_mode" v="2"/>
       <prop k="enabled" v="1"/>
       <prop k="transparency" v="0"/>
      </effect>
     </effect>
    </layer>
    <layer pass="0" class="SimpleMarker" locked="0">
     <prop k="angle" v="0"/>
     <prop k="color" v="255,0,0,255"/>
     <prop k="color_border_dd_active" v="1"/>
     <prop k="color_border_dd_expression" v="CASE WHEN channel_usage_current IN (4514, 4520) THEN '0,0,255,255' WHEN channel_usage_current = 4516 THEN '0,255,0,255' WHEN channel_usage_current = 4518 THEN '0,170,255,255' WHEN channel_usage_current = 4522 THEN '102,0,102,255' WHEN channel_usage_current IN (4524, 4526) THEN '255,0,0,255' ELSE '161,161,161,255' END"/>
     <prop k="color_border_dd_field" v=""/>
     <prop k="color_border_dd_useexpr" v="1"/>
     <prop k="horizontal_anchor_point" v="1"/>
     <prop k="name" v="line"/>
     <prop k="offset" v="0.25,0"/>
     <prop k="offset_map_unit_scale" v="0,0"/>
     <prop k="offset_unit" v="MM"/>
     <prop k="outline_color" v="0,0,0,255"/>
     <prop k="outline_style" v="solid"/>
     <prop k="outline_width" v="0.3"/>
     <prop k="outline_width_map_unit_scale" v="0,0"/>
     <prop k="outline_width_unit" v="MM"/>
     <prop k="scale_method" v="area"/>
     <prop k="size" v="1"/>
     <prop k="size_map_unit_scale" v="0,0"/>
     <prop k="size_unit" v="MM"/>
     <prop k="vertical_anchor_point" v="1"/>
     <effect enabled="0" type="effectStack">
      <effect type="drawSource">
       <prop k="blend_mode" v="0"/>
       <prop k="draw_mode" v="2"/>
       <prop k="enabled" v="1"/>
       <prop k="transparency" v="0"/>
      </effect>
     </effect>
    </layer>
    <layer pass="0" class="SimpleMarker" locked="0">
     <prop k="angle" v="0"/>
     <prop k="color" v="255,0,0,255"/>
     <prop k="color_border_dd_active" v="1"/>
     <prop k="color_border_dd_expression" v="CASE WHEN channel_usage_current IN (4514, 4520) THEN '0,0,255,255' WHEN channel_usage_current = 4516 THEN '0,255,0,255' WHEN channel_usage_current = 4518 THEN '0,170,255,255' WHEN channel_usage_current = 4522 THEN '102,0,102,255' WHEN channel_usage_current IN (4524, 4526) THEN '255,0,0,255' ELSE '161,161,161,255' END"/>
     <prop k="color_border_dd_field" v=""/>
     <prop k="color_border_dd_useexpr" v="1"/>
     <prop k="horizontal_anchor_point" v="1"/>
     <prop k="name" v="line"/>
     <prop k="offset" v="-0.25,0"/>
     <prop k="offset_map_unit_scale" v="0,0"/>
     <prop k="offset_unit" v="MM"/>
     <prop k="outline_color" v="0,0,0,255"/>
     <prop k="outline_style" v="solid"/>
     <prop k="outline_width" v="0.3"/>
     <prop k="outline_width_map_unit_scale" v="0,0"/>
     <prop k="outline_width_unit" v="MM"/>
     <prop k="scale_method" v="area"/>
     <prop k="size" v="1"/>
     <prop k="size_map_unit_scale" v="0,0"/>
     <prop k="size_unit" v="MM"/>
     <prop k="vertical_anchor_point" v="1"/>
     <effect enabled="0" type="effectStack">
      <effect type="drawSource">
       <prop k="blend_mode" v="0"/>
       <prop k="draw_mode" v="2"/>
       <prop k="enabled" v="1"/>
       <prop k="transparency" v="0"/>
      </effect>
     </effect>
    </layer>
   </symbol>
   <symbol alpha="1" clip_to_extent="1" type="marker" name="9">
    <layer pass="0" class="SimpleMarker" locked="0">
     <prop k="angle" v="0"/>
     <prop k="color" v="255,255,255,255"/>
     <prop k="color_border_dd_active" v="1"/>
     <prop k="color_border_dd_expression" v="CASE WHEN channel_usage_current IN (4514, 4520) THEN '0,0,255,255' WHEN channel_usage_current = 4516 THEN '0,255,0,255' WHEN channel_usage_current = 4518 THEN '0,170,255,255' WHEN channel_usage_current = 4522 THEN '102,0,102,255' WHEN channel_usage_current IN (4524, 4526) THEN '255,0,0,255' ELSE '161,161,161,255' END"/>
     <prop k="color_border_dd_field" v=""/>
     <prop k="color_border_dd_useexpr" v="1"/>
     <prop k="horizontal_anchor_point" v="1"/>
     <prop k="name" v="circle"/>
     <prop k="offset" v="0,0"/>
     <prop k="offset_map_unit_scale" v="0,0"/>
     <prop k="offset_unit" v="MM"/>
     <prop k="outline_color" v="0,0,0,255"/>
     <prop k="outline_style" v="solid"/>
     <prop k="outline_width" v="0.3"/>
     <prop k="outline_width_map_unit_scale" v="0,0"/>
     <prop k="outline_width_unit" v="MM"/>
     <prop k="scale_method" v="area"/>
     <prop k="size" v="1.5"/>
     <prop k="size_map_unit_scale" v="0,0"/>
     <prop k="size_unit" v="MM"/>
     <prop k="vertical_anchor_point" v="1"/>
     <effect enabled="0" type="effectStack">
      <effect type="drawSource">
       <prop k="blend_mode" v="0"/>
       <prop k="draw_mode" v="2"/>
       <prop k="enabled" v="1"/>
       <prop k="transparency" v="0"/>
      </effect>
     </effect>
    </layer>
    <layer pass="0" class="SimpleMarker" locked="0">
     <prop k="angle" v="0"/>
     <prop k="color" v="255,0,0,255"/>
     <prop k="color_border_dd_active" v="1"/>
     <prop k="color_border_dd_expression" v="CASE WHEN channel_usage_current IN (4514, 4520) THEN '0,0,255,255' WHEN channel_usage_current = 4516 THEN '0,255,0,255' WHEN channel_usage_current = 4518 THEN '0,170,255,255' WHEN channel_usage_current = 4522 THEN '102,0,102,255' WHEN channel_usage_current IN (4524, 4526) THEN '255,0,0,255' ELSE '161,161,161,255' END"/>
     <prop k="color_border_dd_field" v=""/>
     <prop k="color_border_dd_useexpr" v="1"/>
     <prop k="horizontal_anchor_point" v="1"/>
     <prop k="name" v="line"/>
     <prop k="offset" v="0.25,0"/>
     <prop k="offset_map_unit_scale" v="0,0"/>
     <prop k="offset_unit" v="MM"/>
     <prop k="outline_color" v="0,0,0,255"/>
     <prop k="outline_style" v="solid"/>
     <prop k="outline_width" v="0.3"/>
     <prop k="outline_width_map_unit_scale" v="0,0"/>
     <prop k="outline_width_unit" v="MM"/>
     <prop k="scale_method" v="area"/>
     <prop k="size" v="1"/>
     <prop k="size_map_unit_scale" v="0,0"/>
     <prop k="size_unit" v="MM"/>
     <prop k="vertical_anchor_point" v="1"/>
     <effect enabled="0" type="effectStack">
      <effect type="drawSource">
       <prop k="blend_mode" v="0"/>
       <prop k="draw_mode" v="2"/>
       <prop k="enabled" v="1"/>
       <prop k="transparency" v="0"/>
      </effect>
     </effect>
    </layer>
    <layer pass="0" class="SimpleMarker" locked="0">
     <prop k="angle" v="0"/>
     <prop k="color" v="255,0,0,255"/>
     <prop k="color_border_dd_active" v="1"/>
     <prop k="color_border_dd_expression" v="CASE WHEN channel_usage_current IN (4514, 4520) THEN '0,0,255,255' WHEN channel_usage_current = 4516 THEN '0,255,0,255' WHEN channel_usage_current = 4518 THEN '0,170,255,255' WHEN channel_usage_current = 4522 THEN '102,0,102,255' WHEN channel_usage_current IN (4524, 4526) THEN '255,0,0,255' ELSE '161,161,161,255' END"/>
     <prop k="color_border_dd_field" v=""/>
     <prop k="color_border_dd_useexpr" v="1"/>
     <prop k="horizontal_anchor_point" v="1"/>
     <prop k="name" v="line"/>
     <prop k="offset" v="-0.25,0"/>
     <prop k="offset_map_unit_scale" v="0,0"/>
     <prop k="offset_unit" v="MM"/>
     <prop k="outline_color" v="0,0,0,255"/>
     <prop k="outline_style" v="solid"/>
     <prop k="outline_width" v="0.3"/>
     <prop k="outline_width_map_unit_scale" v="0,0"/>
     <prop k="outline_width_unit" v="MM"/>
     <prop k="scale_method" v="area"/>
     <prop k="size" v="1"/>
     <prop k="size_map_unit_scale" v="0,0"/>
     <prop k="size_unit" v="MM"/>
     <prop k="vertical_anchor_point" v="1"/>
     <effect enabled="0" type="effectStack">
      <effect type="drawSource">
       <prop k="blend_mode" v="0"/>
       <prop k="draw_mode" v="2"/>
       <prop k="enabled" v="1"/>
       <prop k="transparency" v="0"/>
      </effect>
     </effect>
    </layer>
   </symbol>
  </symbols>
  <effect enabled="0" type="effectStack">
   <effect type="drawSource">
    <prop k="blend_mode" v="0"/>
    <prop k="draw_mode" v="2"/>
    <prop k="enabled" v="1"/>
    <prop k="transparency" v="0"/>
   </effect>
  </effect>
 </renderer-v2>
 <customproperties>
  <property key="labeling" value="pal"/>
  <property key="labeling/addDirectionSymbol" value="false"/>
  <property key="labeling/angleOffset" value="0"/>
  <property key="labeling/blendMode" value="0"/>
  <property key="labeling/bufferBlendMode" value="0"/>
  <property key="labeling/bufferColorA" value="255"/>
  <property key="labeling/bufferColorB" value="255"/>
  <property key="labeling/bufferColorG" value="255"/>
  <property key="labeling/bufferColorR" value="255"/>
  <property key="labeling/bufferDraw" value="false"/>
  <property key="labeling/bufferJoinStyle" value="64"/>
  <property key="labeling/bufferNoFill" value="false"/>
  <property key="labeling/bufferSize" value="1"/>
  <property key="labeling/bufferSizeInMapUnits" value="false"/>
  <property key="labeling/bufferSizeMapUnitMaxScale" value="0"/>
  <property key="labeling/bufferSizeMapUnitMinScale" value="0"/>
  <property key="labeling/bufferTransp" value="0"/>
  <property key="labeling/centroidInside" value="false"/>
  <property key="labeling/centroidWhole" value="false"/>
  <property key="labeling/dataDefined/Color" value="1~~1~~CASE WHEN channel_usage_current IN (4514, 4520) THEN '0,0,255,255' WHEN channel_usage_current = 4516 THEN '0,255,0,255' WHEN channel_usage_current = 4518 THEN '0,170,255,255' WHEN channel_usage_current = 4522 THEN '102,0,102,255' WHEN channel_usage_current IN (4524, 4526) THEN '255,0,0,255' ELSE '161,161,161,255' END~~"/>
  <property key="labeling/dataDefined/Show" value="1~~1~~CASE WHEN  channel_function_hierarchic IN (5068,5069,5070,5071) THEN True END~~"/>
  <property key="labeling/decimals" value="3"/>
  <property key="labeling/displayAll" value="false"/>
  <property key="labeling/dist" value="2"/>
  <property key="labeling/distInMapUnits" value="false"/>
  <property key="labeling/distMapUnitMaxScale" value="0"/>
  <property key="labeling/distMapUnitMinScale" value="0"/>
  <property key="labeling/drawLabels" value="true"/>
  <property key="labeling/enabled" value="true"/>
  <property key="labeling/fieldName" value="CASE WHEN $scale &lt;= 500 THEN  manhole_label ELSE  ws_identifier END"/>
  <property key="labeling/fitInPolygonOnly" value="false"/>
  <property key="labeling/fontBold" value="false"/>
  <property key="labeling/fontCapitals" value="0"/>
  <property key="labeling/fontFamily" value="Cadastra Regular Condensed"/>
  <property key="labeling/fontItalic" value="false"/>
  <property key="labeling/fontLetterSpacing" value="0"/>
  <property key="labeling/fontLimitPixelSize" value="false"/>
  <property key="labeling/fontMaxPixelSize" value="10000"/>
  <property key="labeling/fontMinPixelSize" value="3"/>
  <property key="labeling/fontSize" value="7"/>
  <property key="labeling/fontSizeInMapUnits" value="false"/>
  <property key="labeling/fontSizeMapUnitMaxScale" value="0"/>
  <property key="labeling/fontSizeMapUnitMinScale" value="0"/>
  <property key="labeling/fontStrikeout" value="false"/>
  <property key="labeling/fontUnderline" value="false"/>
  <property key="labeling/fontWeight" value="50"/>
  <property key="labeling/fontWordSpacing" value="0"/>
  <property key="labeling/formatNumbers" value="false"/>
  <property key="labeling/isExpression" value="true"/>
  <property key="labeling/labelOffsetInMapUnits" value="true"/>
  <property key="labeling/labelOffsetMapUnitMaxScale" value="0"/>
  <property key="labeling/labelOffsetMapUnitMinScale" value="0"/>
  <property key="labeling/labelPerPart" value="false"/>
  <property key="labeling/leftDirectionSymbol" value="&lt;"/>
  <property key="labeling/limitNumLabels" value="false"/>
  <property key="labeling/maxCurvedCharAngleIn" value="20"/>
  <property key="labeling/maxCurvedCharAngleOut" value="-20"/>
  <property key="labeling/maxNumLabels" value="2000"/>
  <property key="labeling/mergeLines" value="false"/>
  <property key="labeling/minFeatureSize" value="0"/>
  <property key="labeling/multilineAlign" value="0"/>
  <property key="labeling/multilineHeight" value="1"/>
  <property key="labeling/namedStyle" value="Regular Condensed"/>
  <property key="labeling/obstacle" value="true"/>
  <property key="labeling/obstacleFactor" value="1"/>
  <property key="labeling/obstacleType" value="0"/>
  <property key="labeling/placeDirectionSymbol" value="0"/>
  <property key="labeling/placement" value="0"/>
  <property key="labeling/placementFlags" value="0"/>
  <property key="labeling/plussign" value="false"/>
  <property key="labeling/preserveRotation" value="true"/>
  <property key="labeling/previewBkgrdColor" value="#ffffff"/>
  <property key="labeling/priority" value="5"/>
  <property key="labeling/quadOffset" value="4"/>
  <property key="labeling/repeatDistance" value="0"/>
  <property key="labeling/repeatDistanceMapUnitMaxScale" value="0"/>
  <property key="labeling/repeatDistanceMapUnitMinScale" value="0"/>
  <property key="labeling/repeatDistanceUnit" value="1"/>
  <property key="labeling/reverseDirectionSymbol" value="false"/>
  <property key="labeling/rightDirectionSymbol" value=">"/>
  <property key="labeling/scaleMax" value="1501"/>
  <property key="labeling/scaleMin" value="1"/>
  <property key="labeling/scaleVisibility" value="true"/>
  <property key="labeling/shadowBlendMode" value="6"/>
  <property key="labeling/shadowColorB" value="0"/>
  <property key="labeling/shadowColorG" value="0"/>
  <property key="labeling/shadowColorR" value="0"/>
  <property key="labeling/shadowDraw" value="false"/>
  <property key="labeling/shadowOffsetAngle" value="135"/>
  <property key="labeling/shadowOffsetDist" value="1"/>
  <property key="labeling/shadowOffsetGlobal" value="true"/>
  <property key="labeling/shadowOffsetMapUnitMaxScale" value="0"/>
  <property key="labeling/shadowOffsetMapUnitMinScale" value="0"/>
  <property key="labeling/shadowOffsetUnits" value="1"/>
  <property key="labeling/shadowRadius" value="1.5"/>
  <property key="labeling/shadowRadiusAlphaOnly" value="false"/>
  <property key="labeling/shadowRadiusMapUnitMaxScale" value="0"/>
  <property key="labeling/shadowRadiusMapUnitMinScale" value="0"/>
  <property key="labeling/shadowRadiusUnits" value="1"/>
  <property key="labeling/shadowScale" value="100"/>
  <property key="labeling/shadowTransparency" value="30"/>
  <property key="labeling/shadowUnder" value="0"/>
  <property key="labeling/shapeBlendMode" value="0"/>
  <property key="labeling/shapeBorderColorA" value="255"/>
  <property key="labeling/shapeBorderColorB" value="128"/>
  <property key="labeling/shapeBorderColorG" value="128"/>
  <property key="labeling/shapeBorderColorR" value="128"/>
  <property key="labeling/shapeBorderWidth" value="0"/>
  <property key="labeling/shapeBorderWidthMapUnitMaxScale" value="0"/>
  <property key="labeling/shapeBorderWidthMapUnitMinScale" value="0"/>
  <property key="labeling/shapeBorderWidthUnits" value="1"/>
  <property key="labeling/shapeDraw" value="false"/>
  <property key="labeling/shapeFillColorA" value="255"/>
  <property key="labeling/shapeFillColorB" value="255"/>
  <property key="labeling/shapeFillColorG" value="255"/>
  <property key="labeling/shapeFillColorR" value="255"/>
  <property key="labeling/shapeJoinStyle" value="64"/>
  <property key="labeling/shapeOffsetMapUnitMaxScale" value="0"/>
  <property key="labeling/shapeOffsetMapUnitMinScale" value="0"/>
  <property key="labeling/shapeOffsetUnits" value="1"/>
  <property key="labeling/shapeOffsetX" value="0"/>
  <property key="labeling/shapeOffsetY" value="0"/>
  <property key="labeling/shapeRadiiMapUnitMaxScale" value="0"/>
  <property key="labeling/shapeRadiiMapUnitMinScale" value="0"/>
  <property key="labeling/shapeRadiiUnits" value="1"/>
  <property key="labeling/shapeRadiiX" value="0"/>
  <property key="labeling/shapeRadiiY" value="0"/>
  <property key="labeling/shapeRotation" value="0"/>
  <property key="labeling/shapeRotationType" value="0"/>
  <property key="labeling/shapeSVGFile" value=""/>
  <property key="labeling/shapeSizeMapUnitMaxScale" value="0"/>
  <property key="labeling/shapeSizeMapUnitMinScale" value="0"/>
  <property key="labeling/shapeSizeType" value="0"/>
  <property key="labeling/shapeSizeUnits" value="1"/>
  <property key="labeling/shapeSizeX" value="0"/>
  <property key="labeling/shapeSizeY" value="0"/>
  <property key="labeling/shapeTransparency" value="0"/>
  <property key="labeling/shapeType" value="0"/>
  <property key="labeling/textColorA" value="255"/>
  <property key="labeling/textColorB" value="0"/>
  <property key="labeling/textColorG" value="0"/>
  <property key="labeling/textColorR" value="0"/>
  <property key="labeling/textTransp" value="0"/>
  <property key="labeling/upsidedownLabels" value="0"/>
  <property key="labeling/wrapChar" value=""/>
  <property key="labeling/xOffset" value="0"/>
  <property key="labeling/yOffset" value="0"/>
 </customproperties>
 <blendMode>0</blendMode>
 <featureBlendMode>0</featureBlendMode>
 <layerTransparency>0</layerTransparency>
 <displayfield>obj_id</displayfield>
 <label>0</label>
 <labelattributes>
  <label fieldname="" text="Label"/>
  <family fieldname="" name="Cantarell"/>
  <size fieldname="" units="pt" value="12"/>
  <bold fieldname="" on="0"/>
  <italic fieldname="" on="0"/>
  <underline fieldname="" on="0"/>
  <strikeout fieldname="" on="0"/>
  <color fieldname="" red="0" blue="0" green="0"/>
  <x fieldname=""/>
  <y fieldname=""/>
  <offset x="0" y="0" units="pt" yfieldname="" xfieldname=""/>
  <angle fieldname="" value="0" auto="0"/>
  <alignment fieldname="" value="center"/>
  <buffercolor fieldname="" red="255" blue="255" green="255"/>
  <buffersize fieldname="" units="pt" value="1"/>
  <bufferenabled fieldname="" on=""/>
  <multilineenabled fieldname="" on=""/>
  <selectedonly on=""/>
 </labelattributes>
 <SingleCategoryDiagramRenderer diagramType="Pie">
  <DiagramCategory penColor="#000000" labelPlacementMethod="XHeight" penWidth="0" diagramOrientation="Up" minimumSize="0" barWidth="5" penAlpha="255" maxScaleDenominator="5000" backgroundColor="#ffffff" transparency="0" width="15" scaleDependency="Area" backgroundAlpha="255" angleOffset="1440" scaleBasedVisibility="1" enabled="0" height="15" sizeType="MM" minScaleDenominator="-4.65661e-10">
   <fontProperties description="Cantarell,11,-1,5,50,0,0,0,0,0" style=""/>
   <attribute field="" color="#000000" label=""/>
  </DiagramCategory>
 </SingleCategoryDiagramRenderer>
 <DiagramLayerSettings yPosColumn="-1" linePlacementFlags="10" placement="0" dist="0" xPosColumn="-1" priority="0" obstacle="0" showAll="1"/>
 <editform>.</editform>
 <editforminit>qgepplugin.ui.forms.vw_cover_open</editforminit>
 <featformsuppress>0</featformsuppress>
 <annotationform>.</annotationform>
 <editorlayout>tablayout</editorlayout>
 <aliases>
  <alias field="absorption_capacity" index="54" name=""/>
  <alias field="accessibility" index="18" name=""/>
  <alias field="backflow_level" index="65" name=""/>
  <alias field="bottom_level" index="66" name=""/>
  <alias field="brand" index="1" name=""/>
  <alias field="bypass" index="47" name=""/>
  <alias field="channel_function_hierarchic" index="44" name=""/>
  <alias field="channel_usage_current" index="43" name=""/>
  <alias field="contract_section" index="19" name=""/>
  <alias field="cover_material" index="6" name=""/>
  <alias field="cover_shape" index="2" name=""/>
  <alias field="dataowner" index="14" name=""/>
  <alias field="defects" index="55" name=""/>
  <alias field="depth" index="36" name=""/>
  <alias field="diameter" index="3" name=""/>
  <alias field="dimension1" index="37" name=""/>
  <alias field="dimension2" index="38" name=""/>
  <alias field="distance_to_aquifer" index="56" name=""/>
  <alias field="effective_area" index="57" name=""/>
  <alias field="emergency_spillway" index="58" name=""/>
  <alias field="fastening" index="4" name=""/>
  <alias field="financing" index="20" name=""/>
  <alias field="fk_operator" index="35" name=""/>
  <alias field="fk_owner" index="34" name=""/>
  <alias field="gross_costs" index="21" name=""/>
  <alias field="highwater_level" index="50" name=""/>
  <alias field="identifier" index="10" name=""/>
  <alias field="inspection_interval" index="22" name=""/>
  <alias field="kind" index="59" name=""/>
  <alias field="labeling" index="60" name=""/>
  <alias field="last_modification" index="13" name=""/>
  <alias field="level" index="5" name=""/>
  <alias field="location_name" index="23" name=""/>
  <alias field="manhole_function" index="40" name=""/>
  <alias field="manhole_orientation" index="45" name=""/>
  <alias field="material" index="41" name=""/>
  <alias field="obj_id" index="0" name=""/>
  <alias field="positional_accuracy" index="7" name=""/>
  <alias field="provider" index="15" name=""/>
  <alias field="records" index="24" name=""/>
  <alias field="relevance" index="51" name=""/>
  <alias field="remark" index="11" name=""/>
  <alias field="renovation_demand" index="12" name=""/>
  <alias field="renovation_necessity" index="25" name=""/>
  <alias field="replacement_value" index="26" name=""/>
  <alias field="rv_base_year" index="27" name=""/>
  <alias field="rv_construction_type" index="28" name=""/>
  <alias field="seepage_utilization" index="61" name=""/>
  <alias field="sludge_bucket" index="8" name=""/>
  <alias field="special_structure_function" index="48" name=""/>
  <alias field="status" index="29" name=""/>
  <alias field="stormwater_tank_arrangement" index="49" name=""/>
  <alias field="structure_condition" index="30" name=""/>
  <alias field="subsidies" index="31" name=""/>
  <alias field="surface_inflow" index="42" name=""/>
  <alias field="terrain_level" index="52" name=""/>
  <alias field="upper_elevation" index="39" name=""/>
  <alias field="vehicle_access" index="62" name=""/>
  <alias field="venting" index="9" name=""/>
  <alias field="waterlevel_hydraulic" index="53" name=""/>
  <alias field="watertightness" index="63" name=""/>
  <alias field="wn_dataowner" index="70" name=""/>
  <alias field="wn_identifier" index="67" name=""/>
  <alias field="wn_last_modification" index="69" name=""/>
  <alias field="wn_obj_id" index="64" name=""/>
  <alias field="wn_provider" index="71" name=""/>
  <alias field="wn_remark" index="68" name=""/>
  <alias field="ws_obj_id" index="17" name=""/>
  <alias field="ws_type" index="16" name=""/>
  <alias field="year_of_construction" index="32" name=""/>
  <alias field="year_of_replacement" index="33" name=""/>
 </aliases>
 <excludeAttributesWMS/>
 <excludeAttributesWFS/>
 <attributeEditorForm>
  <attributeEditorContainer name="General">
   <attributeEditorField index="16" name="ws_type"/>
   <attributeEditorField index="10" name="identifier"/>
   <attributeEditorField index="23" name="location_name"/>
   <attributeEditorField index="32" name="year_of_construction"/>
   <attributeEditorField index="40" name="manhole_function"/>
   <attributeEditorField index="48" name="special_structure_function"/>
   <attributeEditorField index="25" name="renovation_necessity"/>
   <attributeEditorField index="5" name="level"/>
   <attributeEditorField index="7" name="positional_accuracy"/>
   <attributeEditorField index="14" name="dataowner"/>
   <attributeEditorField index="29" name="status"/>
   <attributeEditorField index="9" name="venting"/>
   <attributeEditorField index="4" name="fastening"/>
   <attributeEditorField index="37" name="dimension1"/>
   <attributeEditorField index="38" name="dimension2"/>
  </attributeEditorContainer>
  <attributeEditorContainer name="Cover">
   <attributeEditorField index="1" name="brand"/>
   <attributeEditorField index="2" name="cover_shape"/>
   <attributeEditorField index="3" name="diameter"/>
   <attributeEditorField index="6" name="cover_material"/>
   <attributeEditorField index="8" name="sludge_bucket"/>
   <attributeEditorField index="11" name="remark"/>
   <attributeEditorField index="12" name="renovation_demand"/>
   <attributeEditorField index="14" name="dataowner"/>
   <attributeEditorField index="15" name="provider"/>
  </attributeEditorContainer>
  <attributeEditorContainer name="Wastewater Structure">
   <attributeEditorField index="17" name="ws_obj_id"/>
   <attributeEditorField index="18" name="accessibility"/>
   <attributeEditorField index="19" name="contract_section"/>
   <attributeEditorField index="20" name="financing"/>
   <attributeEditorField index="21" name="gross_costs"/>
   <attributeEditorField index="22" name="inspection_interval"/>
   <attributeEditorField index="23" name="location_name"/>
   <attributeEditorField index="24" name="records"/>
   <attributeEditorField index="25" name="renovation_necessity"/>
   <attributeEditorField index="26" name="replacement_value"/>
   <attributeEditorField index="27" name="rv_base_year"/>
   <attributeEditorField index="28" name="rv_construction_type"/>
   <attributeEditorField index="29" name="status"/>
   <attributeEditorField index="30" name="structure_condition"/>
   <attributeEditorField index="31" name="subsidies"/>
   <attributeEditorField index="32" name="year_of_construction"/>
   <attributeEditorField index="33" name="year_of_replacement"/>
   <attributeEditorField index="34" name="fk_owner"/>
   <attributeEditorField index="35" name="fk_operator"/>
  </attributeEditorContainer>
  <attributeEditorContainer name="Manhole">
   <attributeEditorField index="36" name="depth"/>
   <attributeEditorField index="37" name="dimension1"/>
   <attributeEditorField index="38" name="dimension2"/>
   <attributeEditorField index="39" name="upper_elevation"/>
   <attributeEditorField index="40" name="manhole_function"/>
   <attributeEditorField index="41" name="material"/>
   <attributeEditorField index="42" name="surface_inflow"/>
  </attributeEditorContainer>
  <attributeEditorContainer name="Special Structure">
   <attributeEditorField index="47" name="bypass"/>
   <attributeEditorField index="48" name="special_structure_function"/>
   <attributeEditorField index="49" name="stormwater_tank_arrangement"/>
   <attributeEditorField index="39" name="upper_elevation"/>
   <attributeEditorField index="36" name="depth"/>
   <attributeEditorField index="58" name="emergency_spillway"/>
  </attributeEditorContainer>
  <attributeEditorContainer name="Discharge Point">
   <attributeEditorField index="36" name="depth"/>
   <attributeEditorField index="58" name="emergency_spillway"/>
   <attributeEditorField index="50" name="highwater_level"/>
   <attributeEditorField index="51" name="relevance"/>
   <attributeEditorField index="52" name="terrain_level"/>
   <attributeEditorField index="39" name="upper_elevation"/>
   <attributeEditorField index="53" name="waterlevel_hydraulic"/>
  </attributeEditorContainer>
  <attributeEditorContainer name="Infiltration Installation">
   <attributeEditorField index="55" name="defects"/>
   <attributeEditorField index="56" name="distance_to_aquifer"/>
   <attributeEditorField index="57" name="effective_area"/>
   <attributeEditorField index="58" name="emergency_spillway"/>
   <attributeEditorField index="59" name="kind"/>
   <attributeEditorField index="60" name="labeling"/>
   <attributeEditorField index="61" name="seepage_utilization"/>
   <attributeEditorField index="62" name="vehicle_access"/>
   <attributeEditorField index="63" name="watertightness"/>
   <attributeEditorField index="37" name="dimension1"/>
   <attributeEditorField index="38" name="dimension2"/>
   <attributeEditorField index="39" name="upper_elevation"/>
  </attributeEditorContainer>
  <attributeEditorContainer name="Wastewater Node">
   <attributeEditorField index="64" name="wn_obj_id"/>
   <attributeEditorField index="65" name="backflow_level"/>
   <attributeEditorField index="66" name="bottom_level"/>
   <attributeEditorField index="67" name="wn_identifier"/>
   <attributeEditorField index="68" name="wn_remark"/>
   <attributeEditorField index="69" name="wn_last_modification"/>
   <attributeEditorField index="70" name="wn_dataowner"/>
   <attributeEditorField index="71" name="wn_provider"/>
  </attributeEditorContainer>
  <attributeEditorContainer name="Covers">
   <attributeEditorRelation relation="vw_cover20150507162234308_fk_wastewater_structure_vw_qgep_cover20150506155849784_obj_id" name="vw_cover20150507162234308_fk_wastewater_structure_vw_qgep_cover20150506155849784_obj_id"/>
  </attributeEditorContainer>
  <attributeEditorContainer name="Structure Parts">
   <attributeEditorRelation relation="vw_access_aid20150507162234295_fk_wastewater_structure_vw_qgep_cover20150506155849784_obj_id" name="vw_access_aid20150507162234295_fk_wastewater_structure_vw_qgep_cover20150506155849784_obj_id"/>
   <attributeEditorRelation relation="vw_backflow_prevention20150531093552085_fk_wastewater_structure_vw_qgep_cover_ws_obj_id" name="vw_backflow_prevention20150531093552085_fk_wastewater_structure_vw_qgep_cover_ws_obj_id"/>
   <attributeEditorRelation relation="vw_dryweather_flume20150507162234250_fk_wastewater_structure_vw_qgep_cover20150506155849784_obj_id" name="vw_dryweather_flume20150507162234250_fk_wastewater_structure_vw_qgep_cover20150506155849784_obj_id"/>
   <attributeEditorRelation relation="vw_benching20150507162234281_fk_wastewater_structure_vw_qgep_cover20150506155849784_obj_id" name="vw_benching20150507162234281_fk_wastewater_structure_vw_qgep_cover20150506155849784_obj_id"/>
   <attributeEditorRelation relation="vw_dryweather_downspout20150507162234268_fk_wastewater_structure_vw_qgep_cover20150506155849784_obj_id" name="vw_dryweather_downspout20150507162234268_fk_wastewater_structure_vw_qgep_cover20150506155849784_obj_id"/>
  </attributeEditorContainer>
  <attributeEditorContainer name="Maintenance">
   <attributeEditorRelation relation="od_maintenance_event20150530130856307_fk_wastewater_structure_vw_qgep_cover_obj_id" name="od_maintenance_event20150530130856307_fk_wastewater_structure_vw_qgep_cover_obj_id"/>
  </attributeEditorContainer>
 </attributeEditorForm>
 <attributeactions>
  <actionsetting action="feature = QgsMapLayerRegistry.instance().mapLayer('od_wastewater_structure').getFeatures( QgsFeatureRequest().setFilterExpression( 'obj_id = \'{}\''.format( '[% &quot;ws_obj_id&quot; %]' ) ) ).next()&#xa;qgepplugin.ui.forms.digitizeDrainageChannel(feature.id(), 'od_wastewater_structure')" icon="" capture="0" type="1" name="Digitize Drainage Channel"/>
  <actionsetting action="ws_lyr = QgsMapLayerRegistry.instance().mapLayer('od_wastewater_structure')&#xa;feature = ws_lyr.getFeatures( QgsFeatureRequest().setFilterExpression( 'obj_id = \'{}\''.format( '[% &quot;ws_obj_id&quot; %]' ) ) ).next()&#xa;ws_lyr.startEditing()&#xa;ws_lyr.setSelectedFeatures([feature.id()])&#xa;qgis.utils.iface.setActiveLayer(ws_lyr)&#xa;qgis.utils.iface.actionAddPart().trigger()" icon="" capture="0" type="1" name="Digitize"/>
 </attributeactions>
</qgis>
