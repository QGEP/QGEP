<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="2.99.0-Master" simplifyAlgorithm="2" minimumScale="100000" maximumScale="1e+08" simplifyDrawingHints="1" minLabelScale="0" maxLabelScale="1e+08" simplifyDrawingTol="1" simplifyMaxScale="1" hasScaleBasedVisibilityFlag="0" simplifyLocal="0" scaleBasedLabelVisibilityFlag="0">
  <edittypes>
    <edittype widgetv2type="TextEdit" name="obj_id">
      <widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="Range" name="clear_height">
      <widgetv2config AllowNull="1" fieldEditable="1" Step="100" constraint="" Style="SpinBox" labelOnTop="0" constraintDescription="" Min="0" notNull="0" Max="99999" Suffix=" mm"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="width">
      <widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="Range" name="coefficient_of_friction">
      <widgetv2config AllowNull="1" fieldEditable="1" Step="1" constraint="" Style="SpinBox" labelOnTop="0" constraintDescription="" Min="0" notNull="0" Max="999" Suffix=" m^(1/3)/s"/>
    </edittype>
    <edittype widgetv2type="ValueRelation" name="elevation_determination">
      <widgetv2config OrderByValue="1" AllowNull="1" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" constraint="" Layer="vl_reach_elevation_determination" Value="value_en" labelOnTop="0" constraintDescription="" AllowMulti="0" notNull="0"/>
    </edittype>
    <edittype widgetv2type="ValueRelation" name="horizontal_positioning">
      <widgetv2config OrderByValue="1" AllowNull="1" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" constraint="" Layer="vl_reach_horizontal_positioning" Value="value_en" labelOnTop="0" constraintDescription="" AllowMulti="0" notNull="0"/>
    </edittype>
    <edittype widgetv2type="ValueRelation" name="inside_coating">
      <widgetv2config OrderByValue="1" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" constraint="" Layer="vl_reach_inside_coating" Value="value_en" labelOnTop="0" constraintDescription="" AllowMulti="0" notNull="0"/>
    </edittype>
    <edittype widgetv2type="Range" name="length_effective">
      <widgetv2config AllowNull="1" fieldEditable="1" Step="10" constraint="" Style="SpinBox" labelOnTop="0" constraintDescription="" Min="0" notNull="0" Max="30000" Suffix=" m"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="slope_per_mill">
      <widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="ValueRelation" name="material">
      <widgetv2config OrderByValue="1" AllowNull="1" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" constraint="" Layer="vl_reach_material" Value="value_en" labelOnTop="0" constraintDescription="" AllowMulti="0" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="progression3d_geometry">
      <widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="ValueRelation" name="reliner_material">
      <widgetv2config OrderByValue="1" AllowNull="1" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" constraint="" Layer="vl_reach_reliner_material" Value="value_en" labelOnTop="0" constraintDescription="" AllowMulti="0" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="reliner_nominal_size">
      <widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="ValueRelation" name="relining_construction">
      <widgetv2config OrderByValue="1" AllowNull="1" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" constraint="" Layer="vl_reach_relining_construction" Value="value_en" labelOnTop="0" constraintDescription="" AllowMulti="0" notNull="0"/>
    </edittype>
    <edittype widgetv2type="ValueRelation" name="relining_kind">
      <widgetv2config OrderByValue="1" AllowNull="1" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" constraint="" Layer="vl_reach_relining_kind" Value="value_en" labelOnTop="0" constraintDescription="" AllowMulti="0" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="ring_stiffness">
      <widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="slope_building_plan">
      <widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="wall_roughness">
      <widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="RelationReference" name="fk_pipe_profile">
      <widgetv2config OrderByValue="0" fieldEditable="1" AllowAddFeatures="0" ShowForm="0" Relation="reach-fk_pipe_profile" ReadOnly="0" constraint="" MapIdentification="0" labelOnTop="0" constraintDescription="" notNull="0" AllowNULL="1"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="bedding_encasement">
      <widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="ValueRelation" name="function_hierarchic">
      <widgetv2config OrderByValue="1" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" constraint="" Layer="vl_channel_function_hierarchic" Value="value_en" labelOnTop="0" constraintDescription="" AllowMulti="0" notNull="0"/>
    </edittype>
    <edittype widgetv2type="ValueRelation" name="connection_type">
      <widgetv2config OrderByValue="1" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" constraint="" Layer="vl_channel_connection_type" Value="value_en" labelOnTop="0" constraintDescription="" AllowMulti="0" notNull="0"/>
    </edittype>
    <edittype widgetv2type="ValueRelation" name="function_hydraulic">
      <widgetv2config OrderByValue="1" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" constraint="" Layer="vl_channel_function_hydraulic" Value="value_en" labelOnTop="0" constraintDescription="" AllowMulti="0" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="jetting_interval">
      <widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="pipe_length">
      <widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="ValueRelation" name="usage_current">
      <widgetv2config OrderByValue="1" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" constraint="" Layer="vl_channel_usage_current" Value="value_en" labelOnTop="0" constraintDescription="" AllowMulti="0" notNull="0"/>
    </edittype>
    <edittype widgetv2type="ValueRelation" name="usage_planned">
      <widgetv2config OrderByValue="1" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" constraint="" Layer="vl_channel_usage_planned" Value="value_en" labelOnTop="0" constraintDescription="" AllowMulti="0" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="ws_obj_id">
      <widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="ValueRelation" name="accessibility">
      <widgetv2config OrderByValue="1" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" constraint="" Layer="vl_wastewater_structure_accessibility" Value="value_en" labelOnTop="0" constraintDescription="" AllowMulti="0" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="contract_section">
      <widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="ValueRelation" name="financing">
      <widgetv2config OrderByValue="1" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" constraint="" Layer="vl_wastewater_structure_financing" Value="value_en" labelOnTop="0" constraintDescription="" AllowMulti="0" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="gross_costs">
      <widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="inspection_interval">
      <widgetv2config IsMultiline="0" fieldEditable="0" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="location_name">
      <widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="records">
      <widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="ValueRelation" name="renovation_necessity">
      <widgetv2config OrderByValue="1" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" constraint="" Layer="vl_wastewater_structure_renovation_necessity" Value="value_en" labelOnTop="0" constraintDescription="" AllowMulti="0" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="replacement_value">
      <widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="rv_base_year">
      <widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="ValueRelation" name="rv_construction_type">
      <widgetv2config OrderByValue="1" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" constraint="" Layer="vl_wastewater_structure_rv_construction_type" Value="value_en" labelOnTop="0" constraintDescription="" AllowMulti="0" notNull="0"/>
    </edittype>
    <edittype widgetv2type="ValueRelation" name="status">
      <widgetv2config OrderByValue="1" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" constraint="" Layer="vl_wastewater_structure_status" Value="value_en" labelOnTop="0" constraintDescription="" AllowMulti="0" notNull="0"/>
    </edittype>
    <edittype widgetv2type="ValueRelation" name="structure_condition">
      <widgetv2config OrderByValue="1" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" constraint="" Layer="vl_wastewater_structure_structure_condition" Value="value_en" labelOnTop="0" constraintDescription="" AllowMulti="0" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="subsidies">
      <widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="year_of_construction">
      <widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="year_of_replacement">
      <widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="RelationReference" name="fk_owner">
      <widgetv2config OrderByValue="0" fieldEditable="1" AllowAddFeatures="0" ShowForm="0" Relation="vw_qgep_reach_fk_owner_od_organisation20160212172933583_obj_id" ReadOnly="0" constraint="" MapIdentification="0" labelOnTop="0" constraintDescription="" notNull="0" AllowNULL="0"/>
    </edittype>
    <edittype widgetv2type="RelationReference" name="fk_operator">
      <widgetv2config OrderByValue="0" fieldEditable="1" AllowAddFeatures="0" ShowForm="0" Relation="vw_qgep_reach_fk_operator_od_organisation20160212172933583_obj_id" ReadOnly="0" constraint="" MapIdentification="0" labelOnTop="0" constraintDescription="" notNull="0" AllowNULL="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="identifier">
      <widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="remark">
      <widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="DateTime" name="last_modification">
      <widgetv2config fieldEditable="1" calendar_popup="0" allow_null="0" display_format="yyyy-MM-dd" field_format="yyyy-MM-dd" constraint="" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="fk_dataowner">
      <widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="fk_provider">
      <widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="RelationReference" name="fk_wastewater_structure">
      <widgetv2config OrderByValue="0" fieldEditable="1" AllowAddFeatures="0" ShowForm="1" Relation="reach-fk_wastewater_structure-channel" ReadOnly="0" constraint="" MapIdentification="0" labelOnTop="0" constraintDescription="" notNull="0" AllowNULL="0"/>
    </edittype>
    <edittype widgetv2type="Hidden" name="rp_from_obj_id">
      <widgetv2config fieldEditable="1" constraint="" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="ValueRelation" name="rp_from_elevation_accuracy">
      <widgetv2config OrderByValue="1" AllowNull="1" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" constraint="" Layer="vl_reach_point_elevation_accuracy" Value="value_en" labelOnTop="0" constraintDescription="" AllowMulti="0" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="rp_from_identifier">
      <widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="Range" name="rp_from_level">
      <widgetv2config AllowNull="1" fieldEditable="1" Step="10" constraint="" Style="SpinBox" labelOnTop="0" constraintDescription="" Min="0" notNull="0" Max="4000" Suffix=" m.a.s.l."/>
    </edittype>
    <edittype widgetv2type="ValueRelation" name="rp_from_outlet_shape">
      <widgetv2config OrderByValue="1" AllowNull="1" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" constraint="" Layer="vl_reach_point_outlet_shape" Value="value_en" labelOnTop="0" constraintDescription="" AllowMulti="0" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="rp_from_position_of_connection">
      <widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="rp_from_remark">
      <widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="DateTime" name="rp_from_last_modification">
      <widgetv2config fieldEditable="1" calendar_popup="0" allow_null="1" display_format="yyyy-MM-dd" field_format="yyyy-MM-dd" constraint="" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="rp_from_fk_dataowner">
      <widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="rp_from_fk_provider">
      <widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="rp_from_fk_wastewater_networkelement">
      <widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="Hidden" name="rp_to_obj_id">
      <widgetv2config fieldEditable="1" constraint="" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="ValueRelation" name="rp_to_elevation_accuracy">
      <widgetv2config OrderByValue="1" AllowNull="1" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" constraint="" Layer="vl_reach_point_elevation_accuracy" Value="value_en" labelOnTop="0" constraintDescription="" AllowMulti="0" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="rp_to_identifier">
      <widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="Range" name="rp_to_level">
      <widgetv2config AllowNull="1" fieldEditable="1" Step="10" constraint="" Style="SpinBox" labelOnTop="0" constraintDescription="" Min="0" notNull="0" Max="4000" Suffix=" m.a.s.l."/>
    </edittype>
    <edittype widgetv2type="ValueRelation" name="rp_to_outlet_shape">
      <widgetv2config OrderByValue="1" AllowNull="1" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" constraint="" Layer="vl_reach_point_outlet_shape" Value="value_en" labelOnTop="0" constraintDescription="" AllowMulti="0" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="rp_to_position_of_connection">
      <widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="rp_to_remark">
      <widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="DateTime" name="rp_to_last_modification">
      <widgetv2config fieldEditable="1" calendar_popup="0" allow_null="1" display_format="yyyy-MM-dd" field_format="yyyy-MM-dd" constraint="" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="rp_to_fk_dataowner">
      <widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="rp_to_fk_provider">
      <widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="rp_to_fk_wastewater_networkelement">
      <widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="me_obj_id">
      <widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="me_active_zone">
      <widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="me_identifier">
      <widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="material_abbr_en">
      <widgetv2config IsMultiline="0" fieldEditable="0" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="material_abbr_de">
      <widgetv2config IsMultiline="0" fieldEditable="0" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="material_abbr_fr">
      <widgetv2config IsMultiline="0" fieldEditable="0" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
  </edittypes>
  <renderer-v2 forceraster="0" symbollevels="0" type="RuleRenderer" enableorderby="0">
    <rules key="{b3f3f0a1-c8d2-4416-8d68-3de95a17bc02}">
      <rule scalemaxdenom="2001" filter="width >= 300 and horizontal_positioning = 5378" key="{9e580459-8bfa-4f04-be8f-68986341bd8e}" symbol="0" label="Wide reaches, accurate positioning, scale &lt;=2000"/>
      <rule scalemaxdenom="2001" filter="width >= 300 and horizontal_positioning &lt;> 5378" key="{a424a253-3ec2-46b0-9b46-a4a4cb732fb7}" symbol="1" label="Wide reaches, inaccurate positioning, scale &lt;=2000"/>
      <rule scalemaxdenom="2001" filter="(width &lt; 300 OR width IS NULL) AND function_hierarchic IN (5068,5069,5070,5071) AND horizontal_positioning = 5378" key="{dd8104d5-d8fe-4f14-93dc-feb27d310ac3}" symbol="2" label="Narrow main reaches, accurate positioning, scale &lt;=2000"/>
      <rule scalemaxdenom="2001" filter="(width &lt; 300 OR width IS NULL) AND function_hierarchic IN (5068,5069,5070,5071) AND horizontal_positioning &lt;> 5378" key="{1a35f8ac-80d4-4195-95e4-076f6dbe1ecc}" symbol="3" label="Narrow main reaches, inaccurate positioning, scale &lt;=2000"/>
      <rule scalemaxdenom="2001" filter="(width &lt; 300 OR width IS NULL) AND function_hierarchic NOT IN (5068,5069,5070,5071) AND horizontal_positioning = 5378" key="{05072394-efd2-4299-abf8-f34a029a23a6}" symbol="4" label="Narrow minor reaches, accurate positioning, scale &lt;=2000"/>
      <rule scalemaxdenom="2001" filter="(width &lt; 300 OR width IS NULL) AND function_hierarchic NOT IN (5068,5069,5070,5071) AND horizontal_positioning &lt;> 5378" key="{e1b5e5a1-8ad6-447d-9483-c38ab0e189e6}" symbol="5" label="Narrow minor reaches, inaccurate positioning, scale &lt;=2000"/>
      <rule scalemaxdenom="5001" filter="width >= 600 and horizontal_positioning = 5378" key="{37d45500-ee03-4438-8431-1f6c18bc8ac9}" symbol="6" scalemindenom="2001" label="Wide reaches, accurate positioning, scale 2000-5000"/>
      <rule scalemaxdenom="5001" filter="width >= 600 and horizontal_positioning &lt;> 5378" key="{5085b144-096c-4a99-b901-c48d8ccab0de}" symbol="7" scalemindenom="2001" label="Wide reaches, inaccurate positioning, scale 2000-5000"/>
      <rule scalemaxdenom="5001" filter="(width &lt; 600 OR width IS NULL) AND function_hierarchic IN (5068,5069,5070,5071) AND horizontal_positioning = 5378" key="{4d7a3723-99a5-420a-b1e6-ff0a12b8ede4}" symbol="8" scalemindenom="2001" label="Narrow main reaches, accurate positioning, scale 1000-3000"/>
      <rule scalemaxdenom="5001" filter="(width &lt; 600 OR width IS NULL) AND function_hierarchic IN (5068,5069,5070,5071) AND horizontal_positioning &lt;> 5378" key="{551fba99-38e1-4d21-9007-1e1ebba2a1d8}" symbol="9" scalemindenom="2001" label="Narrow main reaches, inaccurate positioning, scale 1000-3000"/>
      <rule scalemaxdenom="100000" filter="function_hierarchic IN (5068,5069,5070,5071) AND horizontal_positioning = 5378" key="{d0a8418c-2231-46eb-abe3-d840c2c67437}" symbol="10" scalemindenom="5001" label="Main reaches, accurate positioning, scale >5000"/>
      <rule scalemaxdenom="100000" filter="function_hierarchic IN (5068,5069,5070,5071) AND horizontal_positioning &lt;> 5378" key="{c7db9a9a-3d0f-4ab1-b0d3-301987626cab}" symbol="11" scalemindenom="5001" label="Main reaches, accurate positioning, scale >5000"/>
      <rule scalemaxdenom="2001" filter="function_hierarchic IS NULL or horizontal_positioning IS NULL" key="{7bf9a846-7dbb-4eed-aa7e-39a4ac741ff1}" symbol="12" label="Missing attributes"/>
    </rules>
    <symbols>
      <symbol alpha="1" clip_to_extent="1" type="line" name="0">
        <layer pass="0" class="SimpleLine" locked="0">
          <prop k="capstyle" v="flat"/>
          <prop k="color_dd_active" v="1"/>
          <prop k="color_dd_expression" v="CASE WHEN usage_current IN (4514, 4520) THEN '0,0,255,30' WHEN usage_current = 4516 THEN '0,255,0,30' WHEN usage_current = 4518 THEN '0,170,255,30' WHEN usage_current = 4522 THEN '102,0,102,30' WHEN usage_current IN (4524, 4526) THEN '255,0,0,30' ELSE '161,161,161,30' END"/>
          <prop k="color_dd_field" v=""/>
          <prop k="color_dd_useexpr" v="1"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="0,0,0,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="0.26"/>
          <prop k="line_width_unit" v="MapUnit"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_dd_active" v="1"/>
          <prop k="width_dd_expression" v="toreal(width) / 1000"/>
          <prop k="width_dd_field" v=""/>
          <prop k="width_dd_useexpr" v="1"/>
          <prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
          <effect enabled="0" type="effectStack">
            <effect type="drawSource">
              <prop k="blend_mode" v="0"/>
              <prop k="draw_mode" v="2"/>
              <prop k="enabled" v="1"/>
              <prop k="transparency" v="0"/>
            </effect>
          </effect>
        </layer>
        <layer pass="0" class="SimpleLine" locked="0">
          <prop k="capstyle" v="flat"/>
          <prop k="color_dd_active" v="1"/>
          <prop k="color_dd_expression" v="CASE WHEN usage_current IN (4514, 4520) THEN '0,0,255,255' WHEN usage_current = 4516 THEN '0,255,0,255' WHEN usage_current = 4518 THEN '0,170,255,255' WHEN usage_current = 4522 THEN '102,0,102,255' WHEN usage_current IN (4524, 4526) THEN '255,0,0,255' ELSE '161,161,161,255' END"/>
          <prop k="color_dd_field" v=""/>
          <prop k="color_dd_useexpr" v="1"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="203,176,112,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="0.3"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_dd_active" v="1"/>
          <prop k="offset_dd_expression" v="toreal(width) / 2000"/>
          <prop k="offset_dd_field" v=""/>
          <prop k="offset_dd_useexpr" v="1"/>
          <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MapUnit"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
          <effect enabled="0" type="effectStack">
            <effect type="drawSource">
              <prop k="blend_mode" v="0"/>
              <prop k="draw_mode" v="2"/>
              <prop k="enabled" v="1"/>
              <prop k="transparency" v="0"/>
            </effect>
          </effect>
        </layer>
        <layer pass="0" class="SimpleLine" locked="0">
          <prop k="capstyle" v="flat"/>
          <prop k="color_dd_active" v="1"/>
          <prop k="color_dd_expression" v="CASE WHEN usage_current IN (4514, 4520) THEN '0,0,255,255' WHEN usage_current = 4516 THEN '0,255,0,255' WHEN usage_current = 4518 THEN '0,170,255,255' WHEN usage_current = 4522 THEN '102,0,102,255' WHEN usage_current IN (4524, 4526) THEN '255,0,0,255' ELSE '161,161,161,255' END"/>
          <prop k="color_dd_field" v=""/>
          <prop k="color_dd_useexpr" v="1"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="0,0,0,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="0.3"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_dd_active" v="1"/>
          <prop k="offset_dd_expression" v="toreal(width) / - 2000"/>
          <prop k="offset_dd_field" v=""/>
          <prop k="offset_dd_useexpr" v="1"/>
          <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MapUnit"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
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
      <symbol alpha="1" clip_to_extent="1" type="line" name="1">
        <layer pass="0" class="SimpleLine" locked="0">
          <prop k="capstyle" v="flat"/>
          <prop k="color_dd_active" v="1"/>
          <prop k="color_dd_expression" v="CASE WHEN usage_current IN (4514, 4520) THEN '0,0,255,30' WHEN usage_current = 4516 THEN '0,255,0,30' WHEN usage_current = 4518 THEN '0,170,255,30' WHEN usage_current = 4522 THEN '102,0,102,30' WHEN usage_current IN (4524, 4526) THEN '255,0,0,30' ELSE '161,161,161,30' END"/>
          <prop k="color_dd_field" v=""/>
          <prop k="color_dd_useexpr" v="1"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="0,0,0,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="0.26"/>
          <prop k="line_width_unit" v="MapUnit"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_dd_active" v="1"/>
          <prop k="width_dd_expression" v="toreal(width) / 1000"/>
          <prop k="width_dd_field" v=""/>
          <prop k="width_dd_useexpr" v="1"/>
          <prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
          <effect enabled="0" type="effectStack">
            <effect type="drawSource">
              <prop k="blend_mode" v="0"/>
              <prop k="draw_mode" v="2"/>
              <prop k="enabled" v="1"/>
              <prop k="transparency" v="0"/>
            </effect>
          </effect>
        </layer>
        <layer pass="0" class="SimpleLine" locked="0">
          <prop k="capstyle" v="flat"/>
          <prop k="color_dd_active" v="1"/>
          <prop k="color_dd_expression" v="CASE WHEN usage_current IN (4514, 4520) THEN '0,0,255,255' WHEN usage_current = 4516 THEN '0,255,0,255' WHEN usage_current = 4518 THEN '0,170,255,255' WHEN usage_current = 4522 THEN '102,0,102,255' WHEN usage_current IN (4524, 4526) THEN '255,0,0,255' ELSE '161,161,161,255' END"/>
          <prop k="color_dd_field" v=""/>
          <prop k="color_dd_useexpr" v="1"/>
          <prop k="customdash" v="1.5;1"/>
          <prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="203,176,112,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="0.3"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_dd_active" v="1"/>
          <prop k="offset_dd_expression" v="toreal(width) / 2000"/>
          <prop k="offset_dd_field" v=""/>
          <prop k="offset_dd_useexpr" v="1"/>
          <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MapUnit"/>
          <prop k="use_custom_dash" v="1"/>
          <prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
          <effect enabled="0" type="effectStack">
            <effect type="drawSource">
              <prop k="blend_mode" v="0"/>
              <prop k="draw_mode" v="2"/>
              <prop k="enabled" v="1"/>
              <prop k="transparency" v="0"/>
            </effect>
          </effect>
        </layer>
        <layer pass="0" class="SimpleLine" locked="0">
          <prop k="capstyle" v="flat"/>
          <prop k="color_dd_active" v="1"/>
          <prop k="color_dd_expression" v="CASE WHEN usage_current IN (4514, 4520) THEN '0,0,255,255' WHEN usage_current = 4516 THEN '0,255,0,255' WHEN usage_current = 4518 THEN '0,170,255,255' WHEN usage_current = 4522 THEN '102,0,102,255' WHEN usage_current IN (4524, 4526) THEN '255,0,0,255' ELSE '161,161,161,255' END"/>
          <prop k="color_dd_field" v=""/>
          <prop k="color_dd_useexpr" v="1"/>
          <prop k="customdash" v="1.5;1"/>
          <prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="0,0,0,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="0.3"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_dd_active" v="1"/>
          <prop k="offset_dd_expression" v="toreal(width) / - 2000"/>
          <prop k="offset_dd_field" v=""/>
          <prop k="offset_dd_useexpr" v="1"/>
          <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MapUnit"/>
          <prop k="use_custom_dash" v="1"/>
          <prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
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
      <symbol alpha="1" clip_to_extent="1" type="line" name="10">
        <layer pass="0" class="SimpleLine" locked="0">
          <prop k="capstyle" v="flat"/>
          <prop k="color_dd_active" v="1"/>
          <prop k="color_dd_expression" v="CASE WHEN usage_current IN (4514, 4520) THEN '0,0,255,255' WHEN usage_current = 4516 THEN '0,255,0,255' WHEN usage_current = 4518 THEN '0,170,255,255' WHEN usage_current = 4522 THEN '102,0,102,255' WHEN usage_current IN (4524, 4526) THEN '255,0,0,255' ELSE '161,161,161,255' END"/>
          <prop k="color_dd_field" v=""/>
          <prop k="color_dd_useexpr" v="1"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="0,0,0,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="0.5"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
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
      <symbol alpha="1" clip_to_extent="1" type="line" name="11">
        <layer pass="0" class="SimpleLine" locked="0">
          <prop k="capstyle" v="flat"/>
          <prop k="color_dd_active" v="1"/>
          <prop k="color_dd_expression" v="CASE WHEN usage_current IN (4514, 4520) THEN '0,0,255,255' WHEN usage_current = 4516 THEN '0,255,0,255' WHEN usage_current = 4518 THEN '0,170,255,255' WHEN usage_current = 4522 THEN '102,0,102,255' WHEN usage_current IN (4524, 4526) THEN '255,0,0,255' ELSE '161,161,161,255' END"/>
          <prop k="color_dd_field" v=""/>
          <prop k="color_dd_useexpr" v="1"/>
          <prop k="customdash" v="1.5;1"/>
          <prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="0,0,0,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="0.5"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="1"/>
          <prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
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
      <symbol alpha="1" clip_to_extent="1" type="line" name="12">
        <layer pass="5" class="SimpleLine" locked="0">
          <prop k="capstyle" v="round"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="round"/>
          <prop k="line_color" v="244,83,14,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="1"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
        </layer>
      </symbol>
      <symbol alpha="1" clip_to_extent="1" type="line" name="2">
        <layer pass="0" class="SimpleLine" locked="0">
          <prop k="capstyle" v="flat"/>
          <prop k="color_dd_active" v="1"/>
          <prop k="color_dd_expression" v="CASE WHEN usage_current IN (4514, 4520) THEN '0,0,255,255' WHEN usage_current = 4516 THEN '0,255,0,255' WHEN usage_current = 4518 THEN '0,170,255,255' WHEN usage_current = 4522 THEN '102,0,102,255' WHEN usage_current IN (4524, 4526) THEN '255,0,0,255' ELSE '161,161,161,255' END"/>
          <prop k="color_dd_field" v=""/>
          <prop k="color_dd_useexpr" v="1"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="0,0,0,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="0.5"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
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
      <symbol alpha="1" clip_to_extent="1" type="line" name="3">
        <layer pass="0" class="SimpleLine" locked="0">
          <prop k="capstyle" v="flat"/>
          <prop k="color_dd_active" v="1"/>
          <prop k="color_dd_expression" v="CASE WHEN usage_current IN (4514, 4520) THEN '0,0,255,255' WHEN usage_current = 4516 THEN '0,255,0,255' WHEN usage_current = 4518 THEN '0,170,255,255' WHEN usage_current = 4522 THEN '102,0,102,255' WHEN usage_current IN (4524, 4526) THEN '255,0,0,255' ELSE '161,161,161,255' END"/>
          <prop k="color_dd_field" v=""/>
          <prop k="color_dd_useexpr" v="1"/>
          <prop k="customdash" v="1.5;1"/>
          <prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="0,0,0,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="0.5"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="1"/>
          <prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
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
      <symbol alpha="1" clip_to_extent="1" type="line" name="4">
        <layer pass="0" class="SimpleLine" locked="0">
          <prop k="capstyle" v="flat"/>
          <prop k="color_dd_active" v="1"/>
          <prop k="color_dd_expression" v="CASE WHEN usage_current IN (4514, 4520) THEN '0,0,255,255' WHEN usage_current = 4516 THEN '0,255,0,255' WHEN usage_current = 4518 THEN '0,170,255,255' WHEN usage_current = 4522 THEN '102,0,102,255' WHEN usage_current IN (4524, 4526) THEN '255,0,0,255' ELSE '161,161,161,255' END"/>
          <prop k="color_dd_field" v=""/>
          <prop k="color_dd_useexpr" v="1"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="0,0,0,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="0.3"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
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
      <symbol alpha="1" clip_to_extent="1" type="line" name="5">
        <layer pass="0" class="SimpleLine" locked="0">
          <prop k="capstyle" v="flat"/>
          <prop k="color_dd_active" v="1"/>
          <prop k="color_dd_expression" v="CASE WHEN usage_current IN (4514, 4520) THEN '0,0,255,255' WHEN usage_current = 4516 THEN '0,255,0,255' WHEN usage_current = 4518 THEN '0,170,255,255' WHEN usage_current = 4522 THEN '102,0,102,255' WHEN usage_current IN (4524, 4526) THEN '255,0,0,255' ELSE '161,161,161,255' END"/>
          <prop k="color_dd_field" v=""/>
          <prop k="color_dd_useexpr" v="1"/>
          <prop k="customdash" v="1.5;1"/>
          <prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="0,0,0,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="0.3"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="1"/>
          <prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
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
      <symbol alpha="1" clip_to_extent="1" type="line" name="6">
        <layer pass="0" class="SimpleLine" locked="0">
          <prop k="capstyle" v="flat"/>
          <prop k="color_dd_active" v="1"/>
          <prop k="color_dd_expression" v="CASE WHEN usage_current IN (4514, 4520) THEN '0,0,255,30' WHEN usage_current = 4516 THEN '0,255,0,30' WHEN usage_current = 4518 THEN '0,170,255,30' WHEN usage_current = 4522 THEN '102,0,102,30' WHEN usage_current IN (4524, 4526) THEN '255,0,0,30' ELSE '161,161,161,30' END"/>
          <prop k="color_dd_field" v=""/>
          <prop k="color_dd_useexpr" v="1"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="0,0,0,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="0.26"/>
          <prop k="line_width_unit" v="MapUnit"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_dd_active" v="1"/>
          <prop k="width_dd_expression" v="toreal(width) / 1000"/>
          <prop k="width_dd_field" v=""/>
          <prop k="width_dd_useexpr" v="1"/>
          <prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
          <effect enabled="0" type="effectStack">
            <effect type="drawSource">
              <prop k="blend_mode" v="0"/>
              <prop k="draw_mode" v="2"/>
              <prop k="enabled" v="1"/>
              <prop k="transparency" v="0"/>
            </effect>
          </effect>
        </layer>
        <layer pass="0" class="SimpleLine" locked="0">
          <prop k="capstyle" v="flat"/>
          <prop k="color_dd_active" v="1"/>
          <prop k="color_dd_expression" v="CASE WHEN usage_current IN (4514, 4520) THEN '0,0,255,255' WHEN usage_current = 4516 THEN '0,255,0,255' WHEN usage_current = 4518 THEN '0,170,255,255' WHEN usage_current = 4522 THEN '102,0,102,255' WHEN usage_current IN (4524, 4526) THEN '255,0,0,255' ELSE '161,161,161,255' END"/>
          <prop k="color_dd_field" v=""/>
          <prop k="color_dd_useexpr" v="1"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="203,176,112,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="0.3"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_dd_active" v="1"/>
          <prop k="offset_dd_expression" v="toreal(width) / 2000"/>
          <prop k="offset_dd_field" v=""/>
          <prop k="offset_dd_useexpr" v="1"/>
          <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MapUnit"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
          <effect enabled="0" type="effectStack">
            <effect type="drawSource">
              <prop k="blend_mode" v="0"/>
              <prop k="draw_mode" v="2"/>
              <prop k="enabled" v="1"/>
              <prop k="transparency" v="0"/>
            </effect>
          </effect>
        </layer>
        <layer pass="0" class="SimpleLine" locked="0">
          <prop k="capstyle" v="flat"/>
          <prop k="color_dd_active" v="1"/>
          <prop k="color_dd_expression" v="CASE WHEN usage_current IN (4514, 4520) THEN '0,0,255,255' WHEN usage_current = 4516 THEN '0,255,0,255' WHEN usage_current = 4518 THEN '0,170,255,255' WHEN usage_current = 4522 THEN '102,0,102,255' WHEN usage_current IN (4524, 4526) THEN '255,0,0,255' ELSE '161,161,161,255' END"/>
          <prop k="color_dd_field" v=""/>
          <prop k="color_dd_useexpr" v="1"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="0,0,0,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="0.3"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_dd_active" v="1"/>
          <prop k="offset_dd_expression" v="toreal(width) / - 2000"/>
          <prop k="offset_dd_field" v=""/>
          <prop k="offset_dd_useexpr" v="1"/>
          <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MapUnit"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
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
      <symbol alpha="1" clip_to_extent="1" type="line" name="7">
        <layer pass="0" class="SimpleLine" locked="0">
          <prop k="capstyle" v="flat"/>
          <prop k="color_dd_active" v="1"/>
          <prop k="color_dd_expression" v="CASE WHEN usage_current IN (4514, 4520) THEN '0,0,255,30' WHEN usage_current = 4516 THEN '0,255,0,30' WHEN usage_current = 4518 THEN '0,170,255,30' WHEN usage_current = 4522 THEN '102,0,102,30' WHEN usage_current IN (4524, 4526) THEN '255,0,0,30' ELSE '161,161,161,30' END"/>
          <prop k="color_dd_field" v=""/>
          <prop k="color_dd_useexpr" v="1"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="0,0,0,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="0.26"/>
          <prop k="line_width_unit" v="MapUnit"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_dd_active" v="1"/>
          <prop k="width_dd_expression" v="toreal(width) / 1000"/>
          <prop k="width_dd_field" v=""/>
          <prop k="width_dd_useexpr" v="1"/>
          <prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
          <effect enabled="0" type="effectStack">
            <effect type="drawSource">
              <prop k="blend_mode" v="0"/>
              <prop k="draw_mode" v="2"/>
              <prop k="enabled" v="1"/>
              <prop k="transparency" v="0"/>
            </effect>
          </effect>
        </layer>
        <layer pass="0" class="SimpleLine" locked="0">
          <prop k="capstyle" v="flat"/>
          <prop k="color_dd_active" v="1"/>
          <prop k="color_dd_expression" v="CASE WHEN usage_current IN (4514, 4520) THEN '0,0,255,255' WHEN usage_current = 4516 THEN '0,255,0,255' WHEN usage_current = 4518 THEN '0,170,255,255' WHEN usage_current = 4522 THEN '102,0,102,255' WHEN usage_current IN (4524, 4526) THEN '255,0,0,255' ELSE '161,161,161,255' END"/>
          <prop k="color_dd_field" v=""/>
          <prop k="color_dd_useexpr" v="1"/>
          <prop k="customdash" v="1.5;1"/>
          <prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="203,176,112,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="0.3"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_dd_active" v="1"/>
          <prop k="offset_dd_expression" v="toreal(width) / 2000"/>
          <prop k="offset_dd_field" v=""/>
          <prop k="offset_dd_useexpr" v="1"/>
          <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MapUnit"/>
          <prop k="use_custom_dash" v="1"/>
          <prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
          <effect enabled="0" type="effectStack">
            <effect type="drawSource">
              <prop k="blend_mode" v="0"/>
              <prop k="draw_mode" v="2"/>
              <prop k="enabled" v="1"/>
              <prop k="transparency" v="0"/>
            </effect>
          </effect>
        </layer>
        <layer pass="0" class="SimpleLine" locked="0">
          <prop k="capstyle" v="flat"/>
          <prop k="color_dd_active" v="1"/>
          <prop k="color_dd_expression" v="CASE WHEN usage_current IN (4514, 4520) THEN '0,0,255,255' WHEN usage_current = 4516 THEN '0,255,0,255' WHEN usage_current = 4518 THEN '0,170,255,255' WHEN usage_current = 4522 THEN '102,0,102,255' WHEN usage_current IN (4524, 4526) THEN '255,0,0,255' ELSE '161,161,161,255' END"/>
          <prop k="color_dd_field" v=""/>
          <prop k="color_dd_useexpr" v="1"/>
          <prop k="customdash" v="1.5;1"/>
          <prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="0,0,0,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="0.3"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_dd_active" v="1"/>
          <prop k="offset_dd_expression" v="toreal(width) / - 2000"/>
          <prop k="offset_dd_field" v=""/>
          <prop k="offset_dd_useexpr" v="1"/>
          <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MapUnit"/>
          <prop k="use_custom_dash" v="1"/>
          <prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
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
      <symbol alpha="1" clip_to_extent="1" type="line" name="8">
        <layer pass="0" class="SimpleLine" locked="0">
          <prop k="capstyle" v="flat"/>
          <prop k="color_dd_active" v="1"/>
          <prop k="color_dd_expression" v="CASE WHEN usage_current IN (4514, 4520) THEN '0,0,255,255' WHEN usage_current = 4516 THEN '0,255,0,255' WHEN usage_current = 4518 THEN '0,170,255,255' WHEN usage_current = 4522 THEN '102,0,102,255' WHEN usage_current IN (4524, 4526) THEN '255,0,0,255' ELSE '161,161,161,255' END"/>
          <prop k="color_dd_field" v=""/>
          <prop k="color_dd_useexpr" v="1"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="0,0,0,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="0.5"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
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
      <symbol alpha="1" clip_to_extent="1" type="line" name="9">
        <layer pass="0" class="SimpleLine" locked="0">
          <prop k="capstyle" v="flat"/>
          <prop k="color_dd_active" v="1"/>
          <prop k="color_dd_expression" v="CASE WHEN usage_current IN (4514, 4520) THEN '0,0,255,255' WHEN usage_current = 4516 THEN '0,255,0,255' WHEN usage_current = 4518 THEN '0,170,255,255' WHEN usage_current = 4522 THEN '102,0,102,255' WHEN usage_current IN (4524, 4526) THEN '255,0,0,255' ELSE '161,161,161,255' END"/>
          <prop k="color_dd_field" v=""/>
          <prop k="color_dd_useexpr" v="1"/>
          <prop k="customdash" v="1.5;1"/>
          <prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="0,0,0,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="0.5"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="1"/>
          <prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
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
  <labeling type="simple"/>
  <customproperties>
    <property key="embeddedWidgets/count" value="0"/>
    <property key="labeling" value="pal"/>
    <property key="labeling/addDirectionSymbol" value="true"/>
    <property key="labeling/angleOffset" value="0"/>
    <property key="labeling/blendMode" value="0"/>
    <property key="labeling/bufferBlendMode" value="0"/>
    <property key="labeling/bufferColorA" value="255"/>
    <property key="labeling/bufferColorB" value="255"/>
    <property key="labeling/bufferColorG" value="255"/>
    <property key="labeling/bufferColorR" value="255"/>
    <property key="labeling/bufferDraw" value="true"/>
    <property key="labeling/bufferJoinStyle" value="64"/>
    <property key="labeling/bufferNoFill" value="false"/>
    <property key="labeling/bufferSize" value="1"/>
    <property key="labeling/bufferSizeInMapUnits" value="false"/>
    <property key="labeling/bufferSizeMapUnitMaxScale" value="0"/>
    <property key="labeling/bufferSizeMapUnitMinScale" value="0"/>
    <property key="labeling/bufferSizeMapUnitScale" value="0,0,0,0,0,0"/>
    <property key="labeling/bufferTransp" value="0"/>
    <property key="labeling/centroidInside" value="false"/>
    <property key="labeling/centroidWhole" value="false"/>
    <property key="labeling/dataDefined/Color" value="1~~1~~CASE&#xa;  WHEN  usage_current IN (4514,4520) THEN '0,0,255,255' &#xa;  WHEN usage_current = 4516 THEN '0,255,0,255'&#xa;  WHEN usage_current = 4518 THEN '0,170,255,255'&#xa;  WHEN usage_current = 4522 THEN '102,0,102,255'&#xa;  WHEN usage_current IN (4524,4526) THEN '255,0,0,255'&#xa;ELSE '161,161,161,255'&#xa;END~~"/>
    <property key="labeling/dataDefined/LabelDistance" value="1~~1~~COALESCE(width,0) / 2000.0 + 0.1~~"/>
    <property key="labeling/dataDefined/Show" value="1~~1~~CASE WHEN $scale &lt;= 1000 THEN 1&#xa;ELSE&#xa; CASE WHEN function_hierarchic IN (5068,5069,5070,5071) THEN 1 ELSE 0 END&#xa;END~~"/>
    <property key="labeling/decimals" value="3"/>
    <property key="labeling/displayAll" value="false"/>
    <property key="labeling/dist" value="0.3"/>
    <property key="labeling/distInMapUnits" value="true"/>
    <property key="labeling/distMapUnitMaxScale" value="0"/>
    <property key="labeling/distMapUnitMinScale" value="0"/>
    <property key="labeling/distMapUnitScale" value="0,0,0,0,0,0"/>
    <property key="labeling/drawLabels" value="true"/>
    <property key="labeling/enabled" value="true"/>
    <property key="labeling/fieldName" value="CONCAT(&#xa;COALESCE(&quot;material_abbr_en&quot;|| ' ',''),&#xa;COALESCE(&quot;width&quot;||' ', ''),&#xa;COALESCE(&quot;length_effective&quot;|| 'm ', ''),&#xa;COALESCE(&quot;slope_per_mill&quot;||'‰','' )&#xa;)"/>
    <property key="labeling/fitInPolygonOnly" value="false"/>
    <property key="labeling/fontBold" value="false"/>
    <property key="labeling/fontCapitals" value="0"/>
    <property key="labeling/fontFamily" value="Cantarell"/>
    <property key="labeling/fontItalic" value="false"/>
    <property key="labeling/fontLetterSpacing" value="0"/>
    <property key="labeling/fontLimitPixelSize" value="false"/>
    <property key="labeling/fontMaxPixelSize" value="10000"/>
    <property key="labeling/fontMinPixelSize" value="3"/>
    <property key="labeling/fontSize" value="8"/>
    <property key="labeling/fontSizeInMapUnits" value="false"/>
    <property key="labeling/fontSizeMapUnitMaxScale" value="0"/>
    <property key="labeling/fontSizeMapUnitMinScale" value="0"/>
    <property key="labeling/fontSizeMapUnitScale" value="0,0,0,0,0,0"/>
    <property key="labeling/fontStrikeout" value="false"/>
    <property key="labeling/fontUnderline" value="false"/>
    <property key="labeling/fontWeight" value="50"/>
    <property key="labeling/fontWordSpacing" value="0"/>
    <property key="labeling/formatNumbers" value="false"/>
    <property key="labeling/isExpression" value="true"/>
    <property key="labeling/labelOffsetInMapUnits" value="true"/>
    <property key="labeling/labelOffsetMapUnitMaxScale" value="0"/>
    <property key="labeling/labelOffsetMapUnitMinScale" value="0"/>
    <property key="labeling/labelOffsetMapUnitScale" value="0,0,0,0,0,0"/>
    <property key="labeling/labelPerPart" value="false"/>
    <property key="labeling/leftDirectionSymbol" value="&lt;"/>
    <property key="labeling/limitNumLabels" value="false"/>
    <property key="labeling/maxCurvedCharAngleIn" value="20"/>
    <property key="labeling/maxCurvedCharAngleOut" value="-20"/>
    <property key="labeling/maxNumLabels" value="2000"/>
    <property key="labeling/mergeLines" value="true"/>
    <property key="labeling/minFeatureSize" value="12"/>
    <property key="labeling/multilineAlign" value="0"/>
    <property key="labeling/multilineHeight" value="1"/>
    <property key="labeling/namedStyle" value="Regular"/>
    <property key="labeling/obstacle" value="true"/>
    <property key="labeling/obstacleFactor" value="1"/>
    <property key="labeling/obstacleType" value="0"/>
    <property key="labeling/offsetType" value="0"/>
    <property key="labeling/placeDirectionSymbol" value="0"/>
    <property key="labeling/placement" value="2"/>
    <property key="labeling/placementFlags" value="10"/>
    <property key="labeling/plussign" value="false"/>
    <property key="labeling/predefinedPositionOrder" value="TR,TL,BR,BL,R,L,TSR,BSR"/>
    <property key="labeling/preserveRotation" value="true"/>
    <property key="labeling/previewBkgrdColor" value="#ffffff"/>
    <property key="labeling/priority" value="5"/>
    <property key="labeling/quadOffset" value="4"/>
    <property key="labeling/repeatDistance" value="0"/>
    <property key="labeling/repeatDistanceMapUnitMaxScale" value="0"/>
    <property key="labeling/repeatDistanceMapUnitMinScale" value="0"/>
    <property key="labeling/repeatDistanceMapUnitScale" value="0,0,0,0,0,0"/>
    <property key="labeling/repeatDistanceUnit" value="1"/>
    <property key="labeling/reverseDirectionSymbol" value="false"/>
    <property key="labeling/rightDirectionSymbol" value=">"/>
    <property key="labeling/scaleMax" value="2001"/>
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
    <property key="labeling/shadowOffsetMapUnitScale" value="0,0,0,0,0,0"/>
    <property key="labeling/shadowOffsetUnits" value="1"/>
    <property key="labeling/shadowRadius" value="1.5"/>
    <property key="labeling/shadowRadiusAlphaOnly" value="false"/>
    <property key="labeling/shadowRadiusMapUnitMaxScale" value="0"/>
    <property key="labeling/shadowRadiusMapUnitMinScale" value="0"/>
    <property key="labeling/shadowRadiusMapUnitScale" value="0,0,0,0,0,0"/>
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
    <property key="labeling/shapeBorderWidthMapUnitScale" value="0,0,0,0,0,0"/>
    <property key="labeling/shapeBorderWidthUnits" value="1"/>
    <property key="labeling/shapeDraw" value="false"/>
    <property key="labeling/shapeFillColorA" value="255"/>
    <property key="labeling/shapeFillColorB" value="255"/>
    <property key="labeling/shapeFillColorG" value="255"/>
    <property key="labeling/shapeFillColorR" value="255"/>
    <property key="labeling/shapeJoinStyle" value="64"/>
    <property key="labeling/shapeOffsetMapUnitMaxScale" value="0"/>
    <property key="labeling/shapeOffsetMapUnitMinScale" value="0"/>
    <property key="labeling/shapeOffsetMapUnitScale" value="0,0,0,0,0,0"/>
    <property key="labeling/shapeOffsetUnits" value="1"/>
    <property key="labeling/shapeOffsetX" value="0"/>
    <property key="labeling/shapeOffsetY" value="0"/>
    <property key="labeling/shapeRadiiMapUnitMaxScale" value="0"/>
    <property key="labeling/shapeRadiiMapUnitMinScale" value="0"/>
    <property key="labeling/shapeRadiiMapUnitScale" value="0,0,0,0,0,0"/>
    <property key="labeling/shapeRadiiUnits" value="1"/>
    <property key="labeling/shapeRadiiX" value="0"/>
    <property key="labeling/shapeRadiiY" value="0"/>
    <property key="labeling/shapeRotation" value="0"/>
    <property key="labeling/shapeRotationType" value="0"/>
    <property key="labeling/shapeSVGFile" value=""/>
    <property key="labeling/shapeSizeMapUnitMaxScale" value="0"/>
    <property key="labeling/shapeSizeMapUnitMinScale" value="0"/>
    <property key="labeling/shapeSizeMapUnitScale" value="0,0,0,0,0,0"/>
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
    <property key="labeling/zIndex" value="0"/>
    <property key="variableNames" value="_fields_"/>
    <property key="variableValues" value=""/>
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
  <SingleCategoryDiagramRenderer diagramType="Pie" sizeLegend="0" attributeLegend="1">
    <DiagramCategory penColor="#000000" labelPlacementMethod="XHeight" penWidth="0" diagramOrientation="Up" sizeScale="0,0,0,0,0,0" minimumSize="0" barWidth="5" penAlpha="255" maxScaleDenominator="1e+08" backgroundColor="#ffffff" transparency="0" width="15" scaleDependency="Area" backgroundAlpha="255" angleOffset="1440" scaleBasedVisibility="0" enabled="0" height="15" lineSizeScale="0,0,0,0,0,0" sizeType="MM" lineSizeType="MM" minScaleDenominator="100000">
      <fontProperties description="Cantarell,11,-1,5,50,0,0,0,0,0" style=""/>
      <attribute field="" color="#000000" label=""/>
    </DiagramCategory>
    <symbol alpha="1" clip_to_extent="1" type="marker" name="sizeSymbol">
      <layer pass="0" class="SimpleMarker" locked="0">
        <prop k="angle" v="0"/>
        <prop k="color" v="255,0,0,255"/>
        <prop k="horizontal_anchor_point" v="1"/>
        <prop k="joinstyle" v="bevel"/>
        <prop k="name" v="circle"/>
        <prop k="offset" v="0,0"/>
        <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
        <prop k="offset_unit" v="MM"/>
        <prop k="outline_color" v="0,0,0,255"/>
        <prop k="outline_style" v="solid"/>
        <prop k="outline_width" v="0"/>
        <prop k="outline_width_map_unit_scale" v="0,0,0,0,0,0"/>
        <prop k="outline_width_unit" v="MM"/>
        <prop k="scale_method" v="diameter"/>
        <prop k="size" v="2"/>
        <prop k="size_map_unit_scale" v="0,0,0,0,0,0"/>
        <prop k="size_unit" v="MM"/>
        <prop k="vertical_anchor_point" v="1"/>
      </layer>
    </symbol>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings yPosColumn="-1" showColumn="0" linePlacementFlags="10" placement="2" dist="0" xPosColumn="-1" priority="0" obstacle="0" zIndex="0" showAll="1"/>
  <annotationform>$HOME</annotationform>
  <aliases>
    <alias field="accessibility" index="28" name=""/>
    <alias field="bedding_encasement" index="19" name=""/>
    <alias field="clear_height" index="1" name=""/>
    <alias field="coefficient_of_friction" index="3" name=""/>
    <alias field="connection_type" index="21" name=""/>
    <alias field="contract_section" index="29" name=""/>
    <alias field="elevation_determination" index="4" name=""/>
    <alias field="financing" index="30" name=""/>
    <alias field="fk_operator" index="45" name=""/>
    <alias field="fk_owner" index="44" name=""/>
    <alias field="fk_pipe_profile" index="18" name=""/>
    <alias field="fk_wastewater_structure" index="51" name=""/>
    <alias field="function_hierarchic" index="20" name=""/>
    <alias field="function_hydraulic" index="22" name=""/>
    <alias field="gross_costs" index="31" name=""/>
    <alias field="horizontal_positioning" index="5" name=""/>
    <alias field="identifier" index="46" name=""/>
    <alias field="inside_coating" index="6" name=""/>
    <alias field="inspection_interval" index="32" name=""/>
    <alias field="jetting_interval" index="23" name=""/>
    <alias field="last_modification" index="48" name=""/>
    <alias field="length_effective" index="7" name=""/>
    <alias field="location_name" index="33" name=""/>
    <alias field="material" index="9" name=""/>
    <alias field="obj_id" index="0" name=""/>
    <alias field="pipe_length" index="24" name=""/>
    <alias field="records" index="34" name=""/>
    <alias field="reliner_material" index="11" name=""/>
    <alias field="reliner_nominal_size" index="12" name=""/>
    <alias field="relining_construction" index="13" name=""/>
    <alias field="relining_kind" index="14" name=""/>
    <alias field="remark" index="47" name=""/>
    <alias field="renovation_necessity" index="35" name=""/>
    <alias field="replacement_value" index="36" name=""/>
    <alias field="ring_stiffness" index="15" name=""/>
    <alias field="rp_from_elevation_accuracy" index="53" name=""/>
    <alias field="rp_from_fk_wastewater_networkelement" index="62" name=""/>
    <alias field="rp_from_identifier" index="54" name=""/>
    <alias field="rp_from_last_modification" index="59" name=""/>
    <alias field="rp_from_level" index="55" name=""/>
    <alias field="rp_from_obj_id" index="52" name=""/>
    <alias field="rp_from_outlet_shape" index="56" name=""/>
    <alias field="rp_from_position_of_connection" index="57" name=""/>
    <alias field="rp_from_remark" index="58" name=""/>
    <alias field="rp_to_elevation_accuracy" index="64" name=""/>
    <alias field="rp_to_fk_wastewater_networkelement" index="73" name=""/>
    <alias field="rp_to_identifier" index="65" name=""/>
    <alias field="rp_to_last_modification" index="70" name=""/>
    <alias field="rp_to_level" index="66" name=""/>
    <alias field="rp_to_obj_id" index="63" name=""/>
    <alias field="rp_to_outlet_shape" index="67" name=""/>
    <alias field="rp_to_position_of_connection" index="68" name=""/>
    <alias field="rp_to_remark" index="69" name=""/>
    <alias field="rv_base_year" index="37" name=""/>
    <alias field="rv_construction_type" index="38" name=""/>
    <alias field="slope_building_plan" index="16" name=""/>
    <alias field="slope_per_mill" index="8" name=""/>
    <alias field="status" index="39" name=""/>
    <alias field="structure_condition" index="40" name=""/>
    <alias field="subsidies" index="41" name=""/>
    <alias field="usage_current" index="25" name=""/>
    <alias field="usage_planned" index="26" name=""/>
    <alias field="wall_roughness" index="17" name=""/>
    <alias field="width" index="2" name=""/>
    <alias field="ws_obj_id" index="27" name=""/>
    <alias field="year_of_construction" index="42" name=""/>
    <alias field="year_of_replacement" index="43" name=""/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <attributeactions default="-1"/>
  <attributetableconfig actionWidgetStyle="dropDown" sortExpression="" sortOrder="0">
    <columns>
      <column width="-1" hidden="1" type="field" name="rp_from_obj_id"/>
      <column width="-1" hidden="1" type="field" name="rp_to_obj_id"/>
      <column width="-1" hidden="0" type="field" name="obj_id"/>
      <column width="-1" hidden="0" type="field" name="clear_height"/>
      <column width="-1" hidden="0" type="field" name="width"/>
      <column width="-1" hidden="0" type="field" name="coefficient_of_friction"/>
      <column width="-1" hidden="0" type="field" name="elevation_determination"/>
      <column width="-1" hidden="0" type="field" name="horizontal_positioning"/>
      <column width="-1" hidden="0" type="field" name="inside_coating"/>
      <column width="-1" hidden="0" type="field" name="length_effective"/>
      <column width="-1" hidden="0" type="field" name="slope_per_mill"/>
      <column width="-1" hidden="0" type="field" name="material"/>
      <column width="-1" hidden="0" type="field" name="progression3d_geometry"/>
      <column width="-1" hidden="0" type="field" name="reliner_material"/>
      <column width="-1" hidden="0" type="field" name="reliner_nominal_size"/>
      <column width="-1" hidden="0" type="field" name="relining_construction"/>
      <column width="-1" hidden="0" type="field" name="relining_kind"/>
      <column width="-1" hidden="0" type="field" name="ring_stiffness"/>
      <column width="-1" hidden="0" type="field" name="slope_building_plan"/>
      <column width="-1" hidden="0" type="field" name="wall_roughness"/>
      <column width="-1" hidden="0" type="field" name="fk_pipe_profile"/>
      <column width="-1" hidden="0" type="field" name="bedding_encasement"/>
      <column width="-1" hidden="0" type="field" name="function_hierarchic"/>
      <column width="-1" hidden="0" type="field" name="connection_type"/>
      <column width="-1" hidden="0" type="field" name="function_hydraulic"/>
      <column width="-1" hidden="0" type="field" name="jetting_interval"/>
      <column width="-1" hidden="0" type="field" name="pipe_length"/>
      <column width="-1" hidden="0" type="field" name="usage_current"/>
      <column width="-1" hidden="0" type="field" name="usage_planned"/>
      <column width="-1" hidden="0" type="field" name="ws_obj_id"/>
      <column width="-1" hidden="0" type="field" name="accessibility"/>
      <column width="-1" hidden="0" type="field" name="contract_section"/>
      <column width="-1" hidden="0" type="field" name="financing"/>
      <column width="-1" hidden="0" type="field" name="gross_costs"/>
      <column width="-1" hidden="0" type="field" name="inspection_interval"/>
      <column width="-1" hidden="0" type="field" name="location_name"/>
      <column width="-1" hidden="0" type="field" name="records"/>
      <column width="-1" hidden="0" type="field" name="renovation_necessity"/>
      <column width="-1" hidden="0" type="field" name="replacement_value"/>
      <column width="-1" hidden="0" type="field" name="rv_base_year"/>
      <column width="-1" hidden="0" type="field" name="rv_construction_type"/>
      <column width="-1" hidden="0" type="field" name="status"/>
      <column width="-1" hidden="0" type="field" name="structure_condition"/>
      <column width="-1" hidden="0" type="field" name="subsidies"/>
      <column width="-1" hidden="0" type="field" name="year_of_construction"/>
      <column width="-1" hidden="0" type="field" name="year_of_replacement"/>
      <column width="-1" hidden="0" type="field" name="fk_owner"/>
      <column width="-1" hidden="0" type="field" name="fk_operator"/>
      <column width="-1" hidden="0" type="field" name="identifier"/>
      <column width="-1" hidden="0" type="field" name="remark"/>
      <column width="-1" hidden="0" type="field" name="last_modification"/>
      <column width="-1" hidden="0" type="field" name="fk_dataowner"/>
      <column width="-1" hidden="0" type="field" name="fk_provider"/>
      <column width="-1" hidden="0" type="field" name="fk_wastewater_structure"/>
      <column width="-1" hidden="0" type="field" name="rp_from_elevation_accuracy"/>
      <column width="-1" hidden="0" type="field" name="rp_from_identifier"/>
      <column width="-1" hidden="0" type="field" name="rp_from_level"/>
      <column width="-1" hidden="0" type="field" name="rp_from_outlet_shape"/>
      <column width="-1" hidden="0" type="field" name="rp_from_position_of_connection"/>
      <column width="-1" hidden="0" type="field" name="rp_from_remark"/>
      <column width="-1" hidden="0" type="field" name="rp_from_last_modification"/>
      <column width="-1" hidden="0" type="field" name="rp_from_fk_dataowner"/>
      <column width="-1" hidden="0" type="field" name="rp_from_fk_provider"/>
      <column width="-1" hidden="0" type="field" name="rp_from_fk_wastewater_networkelement"/>
      <column width="-1" hidden="0" type="field" name="rp_to_elevation_accuracy"/>
      <column width="-1" hidden="0" type="field" name="rp_to_identifier"/>
      <column width="-1" hidden="0" type="field" name="rp_to_level"/>
      <column width="-1" hidden="0" type="field" name="rp_to_outlet_shape"/>
      <column width="-1" hidden="0" type="field" name="rp_to_position_of_connection"/>
      <column width="-1" hidden="0" type="field" name="rp_to_remark"/>
      <column width="-1" hidden="0" type="field" name="rp_to_last_modification"/>
      <column width="-1" hidden="0" type="field" name="rp_to_fk_dataowner"/>
      <column width="-1" hidden="0" type="field" name="rp_to_fk_provider"/>
      <column width="-1" hidden="0" type="field" name="rp_to_fk_wastewater_networkelement"/>
      <column width="-1" hidden="0" type="field" name="me_obj_id"/>
      <column width="-1" hidden="0" type="field" name="me_active_zone"/>
      <column width="-1" hidden="0" type="field" name="me_identifier"/>
      <column width="-1" hidden="0" type="field" name="material_abbr_en"/>
      <column width="-1" hidden="0" type="field" name="material_abbr_de"/>
      <column width="-1" hidden="0" type="field" name="material_abbr_fr"/>
      <column width="-1" hidden="1" type="actions"/>
    </columns>
  </attributetableconfig>
  <editform>./forms/reach.ui</editform>
  <editforminit/>
  <editforminitcodesource>0</editforminitcodesource>
  <editforminitfilepath>.</editforminitfilepath>
  <editforminitcode><![CDATA[# -*- coding: utf-8 -*-
"""
QGIS forms can have a Python function that is called when the form is
opened.

Use this function to add extra logic to your forms.

Enter the name of the function in the "Python Init function"
field.
An example follows:
"""
from PyQt4.QtGui import QWidget

def my_form_open(dialog, layer, feature):
	geom = feature.geometry()
	control = dialog.findChild(QWidget, "MyLineEdit")
]]></editforminitcode>
  <featformsuppress>0</featformsuppress>
  <editorlayout>tablayout</editorlayout>
  <attributeEditorForm>
    <attributeEditorContainer name="General" groupBox="0" columnCount="0">
      <attributeEditorField index="1" name="clear_height"/>
      <attributeEditorField index="7" name="length_effective"/>
      <attributeEditorField index="9" name="material"/>
      <attributeEditorField index="6" name="inside_coating"/>
      <attributeEditorField index="18" name="fk_pipe_profile"/>
      <attributeEditorField index="-1" name="dataowner"/>
      <attributeEditorField index="55" name="rp_from_level"/>
      <attributeEditorField index="66" name="rp_to_level"/>
      <attributeEditorField index="5" name="horizontal_positioning"/>
      <attributeEditorField index="20" name="function_hierarchic"/>
      <attributeEditorField index="22" name="function_hydraulic"/>
      <attributeEditorField index="25" name="usage_current"/>
      <attributeEditorField index="39" name="status"/>
      <attributeEditorField index="42" name="year_of_construction"/>
      <attributeEditorField index="47" name="remark"/>
    </attributeEditorContainer>
    <attributeEditorContainer name="Reach" groupBox="0" columnCount="0">
      <attributeEditorField index="0" name="obj_id"/>
      <attributeEditorField index="1" name="clear_height"/>
      <attributeEditorField index="2" name="width"/>
      <attributeEditorField index="3" name="coefficient_of_friction"/>
      <attributeEditorField index="4" name="elevation_determination"/>
      <attributeEditorField index="5" name="horizontal_positioning"/>
      <attributeEditorField index="6" name="inside_coating"/>
      <attributeEditorField index="7" name="length_effective"/>
      <attributeEditorField index="8" name="slope_per_mill"/>
      <attributeEditorField index="9" name="material"/>
      <attributeEditorField index="-1" name="progression_3d_geometry"/>
      <attributeEditorField index="11" name="reliner_material"/>
      <attributeEditorField index="12" name="reliner_nominal_size"/>
      <attributeEditorField index="13" name="relining_construction"/>
      <attributeEditorField index="14" name="relining_kind"/>
      <attributeEditorField index="15" name="ring_stiffness"/>
      <attributeEditorField index="16" name="slope_building_plan"/>
      <attributeEditorField index="17" name="wall_roughness"/>
      <attributeEditorField index="18" name="fk_pipe_profile"/>
    </attributeEditorContainer>
    <attributeEditorContainer name="Wastewater Networkelement" groupBox="0" columnCount="0">
      <attributeEditorField index="46" name="identifier"/>
      <attributeEditorField index="47" name="remark"/>
      <attributeEditorField index="48" name="last_modification"/>
      <attributeEditorField index="-1" name="dataowner"/>
      <attributeEditorField index="-1" name="provider"/>
    </attributeEditorContainer>
    <attributeEditorContainer name="Channel" groupBox="0" columnCount="0">
      <attributeEditorField index="20" name="function_hierarchic"/>
      <attributeEditorField index="21" name="connection_type"/>
      <attributeEditorField index="22" name="function_hydraulic"/>
      <attributeEditorField index="23" name="jetting_interval"/>
      <attributeEditorField index="24" name="pipe_length"/>
      <attributeEditorField index="25" name="usage_current"/>
      <attributeEditorField index="26" name="usage_planned"/>
    </attributeEditorContainer>
    <attributeEditorContainer name="Wastewater Structure" groupBox="0" columnCount="0">
      <attributeEditorField index="27" name="ws_obj_id"/>
      <attributeEditorField index="28" name="accessibility"/>
      <attributeEditorField index="29" name="contract_section"/>
      <attributeEditorField index="30" name="financing"/>
      <attributeEditorField index="31" name="gross_costs"/>
      <attributeEditorField index="32" name="inspection_interval"/>
      <attributeEditorField index="33" name="location_name"/>
      <attributeEditorField index="34" name="records"/>
      <attributeEditorField index="35" name="renovation_necessity"/>
      <attributeEditorField index="36" name="replacement_value"/>
      <attributeEditorField index="37" name="rv_base_year"/>
      <attributeEditorField index="38" name="rv_construction_type"/>
      <attributeEditorField index="39" name="status"/>
      <attributeEditorField index="40" name="structure_condition"/>
      <attributeEditorField index="41" name="subsidies"/>
      <attributeEditorField index="42" name="year_of_construction"/>
      <attributeEditorField index="43" name="year_of_replacement"/>
      <attributeEditorField index="44" name="fk_owner"/>
      <attributeEditorField index="45" name="fk_operator"/>
    </attributeEditorContainer>
    <attributeEditorContainer name="Reach Points" groupBox="0" columnCount="0">
      <attributeEditorContainer name="From" groupBox="1" columnCount="0">
        <attributeEditorField index="52" name="rp_from_obj_id"/>
        <attributeEditorField index="53" name="rp_from_elevation_accuracy"/>
        <attributeEditorField index="54" name="rp_from_identifier"/>
        <attributeEditorField index="55" name="rp_from_level"/>
        <attributeEditorField index="56" name="rp_from_outlet_shape"/>
        <attributeEditorField index="57" name="rp_from_position_of_connection"/>
        <attributeEditorField index="58" name="rp_from_remark"/>
        <attributeEditorField index="59" name="rp_from_last_modification"/>
        <attributeEditorField index="-1" name="rp_from_dataowner"/>
        <attributeEditorField index="-1" name="rp_from_provider"/>
        <attributeEditorField index="62" name="rp_from_fk_wastewater_networkelement"/>
      </attributeEditorContainer>
      <attributeEditorContainer name="To" groupBox="1" columnCount="0">
        <attributeEditorField index="63" name="rp_to_obj_id"/>
        <attributeEditorField index="64" name="rp_to_elevation_accuracy"/>
        <attributeEditorField index="65" name="rp_to_identifier"/>
        <attributeEditorField index="66" name="rp_to_level"/>
        <attributeEditorField index="67" name="rp_to_outlet_shape"/>
        <attributeEditorField index="68" name="rp_to_position_of_connection"/>
        <attributeEditorField index="69" name="rp_to_remark"/>
        <attributeEditorField index="70" name="rp_to_last_modification"/>
        <attributeEditorField index="-1" name="rp_to_dataowner"/>
        <attributeEditorField index="-1" name="rp_to_provider"/>
        <attributeEditorField index="73" name="rp_to_fk_wastewater_networkelement"/>
      </attributeEditorContainer>
    </attributeEditorContainer>
    <attributeEditorContainer name="Maintenance" groupBox="0" columnCount="0">
      <attributeEditorRelation relation="" name="od_maintenance_event20150530130856307_fk_wastewater_structure_vw_reach20141013202956655_ws_obj_id"/>
    </attributeEditorContainer>
  </attributeEditorForm>
  <widgets/>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <layerGeometryType>1</layerGeometryType>
</qgis>
