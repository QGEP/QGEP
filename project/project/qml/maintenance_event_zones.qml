<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis scaleBasedLabelVisibilityFlag="0" minLabelScale="0" maximumScale="1e+08" minimumScale="100000" simplifyLocal="0" simplifyDrawingTol="1" simplifyDrawingHints="1" hasScaleBasedVisibilityFlag="0" simplifyMaxScale="1" version="2.15.0-Master" maxLabelScale="1e+08">
  <edittypes>
    <edittype name="obj_id" widgetv2type="TextEdit">
      <widgetv2config UseHtml="0" IsMultiline="0" fieldEditable="1" labelOnTop="0"/>
    </edittype>
    <edittype name="clear_height" widgetv2type="Range">
      <widgetv2config AllowNull="1" Style="SpinBox" Max="99999" Suffix=" mm" fieldEditable="1" Step="100" labelOnTop="0" Min="0"/>
    </edittype>
    <edittype name="width" widgetv2type="TextEdit">
      <widgetv2config UseHtml="0" IsMultiline="0" fieldEditable="1" labelOnTop="0"/>
    </edittype>
    <edittype name="coefficient_of_friction" widgetv2type="Range">
      <widgetv2config AllowNull="1" Style="SpinBox" Max="999" Suffix=" m^(1/3)/s" fieldEditable="1" Step="1" labelOnTop="0" Min="0"/>
    </edittype>
    <edittype name="elevation_determination" widgetv2type="ValueRelation">
      <widgetv2config AllowMulti="0" Layer="vl_reach_elevation_determination" AllowNull="1" OrderByValue="1" UseCompleter="0" Key="code" Value="value_en" fieldEditable="1" FilterExpression="" labelOnTop="0"/>
    </edittype>
    <edittype name="horizontal_positioning" widgetv2type="ValueRelation">
      <widgetv2config AllowMulti="0" Layer="vl_reach_horizontal_positioning" AllowNull="1" OrderByValue="1" UseCompleter="0" Key="code" Value="value_en" fieldEditable="1" FilterExpression="" labelOnTop="0"/>
    </edittype>
    <edittype name="inside_coating" widgetv2type="ValueRelation">
      <widgetv2config AllowMulti="0" Layer="vl_reach_inside_coating" AllowNull="0" OrderByValue="1" UseCompleter="0" Key="code" Value="value_en" fieldEditable="1" FilterExpression="" labelOnTop="0"/>
    </edittype>
    <edittype name="length_effective" widgetv2type="Range">
      <widgetv2config AllowNull="1" Style="SpinBox" Max="30000" Suffix=" m" fieldEditable="1" Step="10" labelOnTop="0" Min="0"/>
    </edittype>
    <edittype name="slope_per_mill" widgetv2type="TextEdit">
      <widgetv2config UseHtml="0" IsMultiline="0" fieldEditable="1" labelOnTop="0"/>
    </edittype>
    <edittype name="material" widgetv2type="ValueRelation">
      <widgetv2config AllowMulti="0" Layer="vl_reach_material" AllowNull="1" OrderByValue="1" UseCompleter="0" Key="code" Value="value_en" fieldEditable="1" FilterExpression="" labelOnTop="0"/>
    </edittype>
    <edittype name="progression_3d_geometry" widgetv2type="Hidden">
      <widgetv2config fieldEditable="1" labelOnTop="0"/>
    </edittype>
    <edittype name="reliner_material" widgetv2type="ValueRelation">
      <widgetv2config AllowMulti="0" Layer="vl_reach_reliner_material" AllowNull="1" OrderByValue="1" UseCompleter="0" Key="code" Value="value_en" fieldEditable="1" FilterExpression="" labelOnTop="0"/>
    </edittype>
    <edittype name="reliner_nominal_size" widgetv2type="TextEdit">
      <widgetv2config UseHtml="0" IsMultiline="0" fieldEditable="1" labelOnTop="0"/>
    </edittype>
    <edittype name="relining_construction" widgetv2type="ValueRelation">
      <widgetv2config AllowMulti="0" Layer="vl_reach_relining_construction" AllowNull="1" OrderByValue="1" UseCompleter="0" Key="code" Value="value_en" fieldEditable="1" FilterExpression="" labelOnTop="0"/>
    </edittype>
    <edittype name="relining_kind" widgetv2type="ValueRelation">
      <widgetv2config AllowMulti="0" Layer="vl_reach_relining_kind" AllowNull="1" OrderByValue="1" UseCompleter="0" Key="code" Value="value_en" fieldEditable="1" FilterExpression="" labelOnTop="0"/>
    </edittype>
    <edittype name="ring_stiffness" widgetv2type="TextEdit">
      <widgetv2config UseHtml="0" IsMultiline="0" fieldEditable="1" labelOnTop="0"/>
    </edittype>
    <edittype name="slope_building_plan" widgetv2type="TextEdit">
      <widgetv2config UseHtml="0" IsMultiline="0" fieldEditable="1" labelOnTop="0"/>
    </edittype>
    <edittype name="wall_roughness" widgetv2type="TextEdit">
      <widgetv2config UseHtml="0" IsMultiline="0" fieldEditable="1" labelOnTop="0"/>
    </edittype>
    <edittype name="fk_pipe_profile" widgetv2type="RelationReference">
      <widgetv2config MapIdentification="0" OrderByValue="0" AllowNULL="1" ShowForm="0" AllowAddFeatures="0" fieldEditable="1" Relation="reach-fk_pipe_profile" ReadOnly="0" labelOnTop="0"/>
    </edittype>
    <edittype name="bedding_encasement" widgetv2type="TextEdit">
      <widgetv2config UseHtml="0" IsMultiline="0" fieldEditable="1" labelOnTop="0"/>
    </edittype>
    <edittype name="function_hierarchic" widgetv2type="ValueRelation">
      <widgetv2config AllowMulti="0" Layer="vl_channel_function_hierarchic" AllowNull="0" OrderByValue="1" UseCompleter="0" Key="code" Value="value_en" fieldEditable="1" FilterExpression="" labelOnTop="0"/>
    </edittype>
    <edittype name="connection_type" widgetv2type="ValueRelation">
      <widgetv2config AllowMulti="0" Layer="vl_channel_connection_type" AllowNull="0" OrderByValue="1" UseCompleter="0" Key="code" Value="value_en" fieldEditable="1" FilterExpression="" labelOnTop="0"/>
    </edittype>
    <edittype name="function_hydraulic" widgetv2type="ValueRelation">
      <widgetv2config AllowMulti="0" Layer="vl_channel_function_hydraulic" AllowNull="0" OrderByValue="1" UseCompleter="0" Key="code" Value="value_en" fieldEditable="1" FilterExpression="" labelOnTop="0"/>
    </edittype>
    <edittype name="jetting_interval" widgetv2type="TextEdit">
      <widgetv2config UseHtml="0" IsMultiline="0" fieldEditable="1" labelOnTop="0"/>
    </edittype>
    <edittype name="pipe_length" widgetv2type="TextEdit">
      <widgetv2config UseHtml="0" IsMultiline="0" fieldEditable="1" labelOnTop="0"/>
    </edittype>
    <edittype name="usage_current" widgetv2type="ValueRelation">
      <widgetv2config AllowMulti="0" Layer="vl_channel_usage_current" AllowNull="0" OrderByValue="1" UseCompleter="0" Key="code" Value="value_en" fieldEditable="1" FilterExpression="" labelOnTop="0"/>
    </edittype>
    <edittype name="usage_planned" widgetv2type="ValueRelation">
      <widgetv2config AllowMulti="0" Layer="vl_channel_usage_planned" AllowNull="0" OrderByValue="1" UseCompleter="0" Key="code" Value="value_en" fieldEditable="1" FilterExpression="" labelOnTop="0"/>
    </edittype>
    <edittype name="ws_obj_id" widgetv2type="TextEdit">
      <widgetv2config UseHtml="0" IsMultiline="0" fieldEditable="1" labelOnTop="0"/>
    </edittype>
    <edittype name="accessibility" widgetv2type="ValueRelation">
      <widgetv2config AllowMulti="0" Layer="vl_wastewater_structure_accessibility" AllowNull="0" OrderByValue="1" UseCompleter="0" Key="code" Value="value_en" fieldEditable="1" FilterExpression="" labelOnTop="0"/>
    </edittype>
    <edittype name="contract_section" widgetv2type="TextEdit">
      <widgetv2config UseHtml="0" IsMultiline="0" fieldEditable="1" labelOnTop="0"/>
    </edittype>
    <edittype name="financing" widgetv2type="ValueRelation">
      <widgetv2config AllowMulti="0" Layer="vl_wastewater_structure_financing" AllowNull="0" OrderByValue="1" UseCompleter="0" Key="code" Value="value_en" fieldEditable="1" FilterExpression="" labelOnTop="0"/>
    </edittype>
    <edittype name="gross_costs" widgetv2type="TextEdit">
      <widgetv2config UseHtml="0" IsMultiline="0" fieldEditable="1" labelOnTop="0"/>
    </edittype>
    <edittype name="inspection_interval" widgetv2type="TextEdit">
      <widgetv2config UseHtml="0" IsMultiline="0" fieldEditable="0" labelOnTop="0"/>
    </edittype>
    <edittype name="location_name" widgetv2type="TextEdit">
      <widgetv2config UseHtml="0" IsMultiline="0" fieldEditable="1" labelOnTop="0"/>
    </edittype>
    <edittype name="records" widgetv2type="TextEdit">
      <widgetv2config UseHtml="0" IsMultiline="0" fieldEditable="1" labelOnTop="0"/>
    </edittype>
    <edittype name="renovation_necessity" widgetv2type="ValueRelation">
      <widgetv2config AllowMulti="0" Layer="vl_wastewater_structure_renovation_necessity" AllowNull="0" OrderByValue="1" UseCompleter="0" Key="code" Value="value_en" fieldEditable="1" FilterExpression="" labelOnTop="0"/>
    </edittype>
    <edittype name="replacement_value" widgetv2type="TextEdit">
      <widgetv2config UseHtml="0" IsMultiline="0" fieldEditable="1" labelOnTop="0"/>
    </edittype>
    <edittype name="rv_base_year" widgetv2type="TextEdit">
      <widgetv2config UseHtml="0" IsMultiline="0" fieldEditable="1" labelOnTop="0"/>
    </edittype>
    <edittype name="rv_construction_type" widgetv2type="ValueRelation">
      <widgetv2config AllowMulti="0" Layer="vl_wastewater_structure_rv_construction_type" AllowNull="0" OrderByValue="1" UseCompleter="0" Key="code" Value="value_en" fieldEditable="1" FilterExpression="" labelOnTop="0"/>
    </edittype>
    <edittype name="status" widgetv2type="ValueRelation">
      <widgetv2config AllowMulti="0" Layer="vl_wastewater_structure_status" AllowNull="0" OrderByValue="1" UseCompleter="0" Key="code" Value="value_en" fieldEditable="1" FilterExpression="" labelOnTop="0"/>
    </edittype>
    <edittype name="structure_condition" widgetv2type="ValueRelation">
      <widgetv2config AllowMulti="0" Layer="vl_wastewater_structure_structure_condition" AllowNull="0" OrderByValue="1" UseCompleter="0" Key="code" Value="value_en" fieldEditable="1" FilterExpression="" labelOnTop="0"/>
    </edittype>
    <edittype name="subsidies" widgetv2type="TextEdit">
      <widgetv2config UseHtml="0" IsMultiline="0" fieldEditable="1" labelOnTop="0"/>
    </edittype>
    <edittype name="year_of_construction" widgetv2type="TextEdit">
      <widgetv2config UseHtml="0" IsMultiline="0" fieldEditable="1" labelOnTop="0"/>
    </edittype>
    <edittype name="year_of_replacement" widgetv2type="TextEdit">
      <widgetv2config UseHtml="0" IsMultiline="0" fieldEditable="1" labelOnTop="0"/>
    </edittype>
    <edittype name="fk_owner" widgetv2type="RelationReference">
      <widgetv2config MapIdentification="0" OrderByValue="0" AllowNULL="0" ShowForm="0" AllowAddFeatures="0" fieldEditable="1" Relation="vw_qgep_reach_fk_owner_od_organisation20160212172933583_obj_id" ReadOnly="0" labelOnTop="0"/>
    </edittype>
    <edittype name="fk_operator" widgetv2type="RelationReference">
      <widgetv2config MapIdentification="0" OrderByValue="0" AllowNULL="0" ShowForm="0" AllowAddFeatures="0" fieldEditable="1" Relation="vw_qgep_reach_fk_operator_od_organisation20160212172933583_obj_id" ReadOnly="0" labelOnTop="0"/>
    </edittype>
    <edittype name="identifier" widgetv2type="TextEdit">
      <widgetv2config UseHtml="0" IsMultiline="0" fieldEditable="1" labelOnTop="0"/>
    </edittype>
    <edittype name="remark" widgetv2type="TextEdit">
      <widgetv2config UseHtml="0" IsMultiline="0" fieldEditable="1" labelOnTop="0"/>
    </edittype>
    <edittype name="last_modification" widgetv2type="DateTime">
      <widgetv2config field_format="yyyy-MM-dd" display_format="yyyy-MM-dd" calendar_popup="0" fieldEditable="1" labelOnTop="0" allow_null="0"/>
    </edittype>
    <edittype name="fk_dataowner" widgetv2type="TextEdit">
      <widgetv2config UseHtml="0" IsMultiline="0" fieldEditable="1" labelOnTop="0"/>
    </edittype>
    <edittype name="fk_provider" widgetv2type="TextEdit">
      <widgetv2config UseHtml="0" IsMultiline="0" fieldEditable="1" labelOnTop="0"/>
    </edittype>
    <edittype name="fk_wastewater_structure" widgetv2type="RelationReference">
      <widgetv2config MapIdentification="0" OrderByValue="0" AllowNULL="0" ShowForm="1" AllowAddFeatures="0" fieldEditable="1" Relation="reach-fk_wastewater_structure-channel" ReadOnly="0" labelOnTop="0"/>
    </edittype>
    <edittype name="rp_from_obj_id" widgetv2type="Hidden">
      <widgetv2config fieldEditable="1" labelOnTop="0"/>
    </edittype>
    <edittype name="rp_from_elevation_accuracy" widgetv2type="ValueRelation">
      <widgetv2config AllowMulti="0" Layer="vl_reach_point_elevation_accuracy" AllowNull="1" OrderByValue="1" UseCompleter="0" Key="code" Value="value_en" fieldEditable="1" FilterExpression="" labelOnTop="0"/>
    </edittype>
    <edittype name="rp_from_identifier" widgetv2type="TextEdit">
      <widgetv2config UseHtml="0" IsMultiline="0" fieldEditable="1" labelOnTop="0"/>
    </edittype>
    <edittype name="rp_from_level" widgetv2type="Range">
      <widgetv2config AllowNull="1" Style="SpinBox" Max="4000" Suffix=" m.a.s.l." fieldEditable="1" Step="10" labelOnTop="0" Min="0"/>
    </edittype>
    <edittype name="rp_from_outlet_shape" widgetv2type="ValueRelation">
      <widgetv2config AllowMulti="0" Layer="vl_reach_point_outlet_shape" AllowNull="1" OrderByValue="1" UseCompleter="0" Key="code" Value="value_en" fieldEditable="1" FilterExpression="" labelOnTop="0"/>
    </edittype>
    <edittype name="rp_from_position_of_connection" widgetv2type="TextEdit">
      <widgetv2config UseHtml="0" IsMultiline="0" fieldEditable="1" labelOnTop="0"/>
    </edittype>
    <edittype name="rp_from_remark" widgetv2type="TextEdit">
      <widgetv2config UseHtml="0" IsMultiline="0" fieldEditable="1" labelOnTop="0"/>
    </edittype>
    <edittype name="rp_from_last_modification" widgetv2type="DateTime">
      <widgetv2config field_format="yyyy-MM-dd" display_format="yyyy-MM-dd" calendar_popup="0" fieldEditable="1" labelOnTop="0" allow_null="1"/>
    </edittype>
    <edittype name="rp_from_fk_dataowner" widgetv2type="TextEdit">
      <widgetv2config UseHtml="0" IsMultiline="0" fieldEditable="1" labelOnTop="0"/>
    </edittype>
    <edittype name="rp_from_fk_provider" widgetv2type="TextEdit">
      <widgetv2config UseHtml="0" IsMultiline="0" fieldEditable="1" labelOnTop="0"/>
    </edittype>
    <edittype name="rp_from_fk_wastewater_networkelement" widgetv2type="TextEdit">
      <widgetv2config UseHtml="0" IsMultiline="0" fieldEditable="1" labelOnTop="0"/>
    </edittype>
    <edittype name="rp_to_obj_id" widgetv2type="Hidden">
      <widgetv2config fieldEditable="1" labelOnTop="0"/>
    </edittype>
    <edittype name="rp_to_elevation_accuracy" widgetv2type="ValueRelation">
      <widgetv2config AllowMulti="0" Layer="vl_reach_point_elevation_accuracy" AllowNull="1" OrderByValue="1" UseCompleter="0" Key="code" Value="value_en" fieldEditable="1" FilterExpression="" labelOnTop="0"/>
    </edittype>
    <edittype name="rp_to_identifier" widgetv2type="TextEdit">
      <widgetv2config UseHtml="0" IsMultiline="0" fieldEditable="1" labelOnTop="0"/>
    </edittype>
    <edittype name="rp_to_level" widgetv2type="Range">
      <widgetv2config AllowNull="1" Style="SpinBox" Max="4000" Suffix=" m.a.s.l." fieldEditable="1" Step="10" labelOnTop="0" Min="0"/>
    </edittype>
    <edittype name="rp_to_outlet_shape" widgetv2type="ValueRelation">
      <widgetv2config AllowMulti="0" Layer="vl_reach_point_outlet_shape" AllowNull="1" OrderByValue="1" UseCompleter="0" Key="code" Value="value_en" fieldEditable="1" FilterExpression="" labelOnTop="0"/>
    </edittype>
    <edittype name="rp_to_position_of_connection" widgetv2type="TextEdit">
      <widgetv2config UseHtml="0" IsMultiline="0" fieldEditable="1" labelOnTop="0"/>
    </edittype>
    <edittype name="rp_to_remark" widgetv2type="TextEdit">
      <widgetv2config UseHtml="0" IsMultiline="0" fieldEditable="1" labelOnTop="0"/>
    </edittype>
    <edittype name="rp_to_last_modification" widgetv2type="DateTime">
      <widgetv2config field_format="yyyy-MM-dd" display_format="yyyy-MM-dd" calendar_popup="0" fieldEditable="1" labelOnTop="0" allow_null="1"/>
    </edittype>
    <edittype name="rp_to_fk_dataowner" widgetv2type="TextEdit">
      <widgetv2config UseHtml="0" IsMultiline="0" fieldEditable="1" labelOnTop="0"/>
    </edittype>
    <edittype name="rp_to_fk_provider" widgetv2type="TextEdit">
      <widgetv2config UseHtml="0" IsMultiline="0" fieldEditable="1" labelOnTop="0"/>
    </edittype>
    <edittype name="rp_to_fk_wastewater_networkelement" widgetv2type="TextEdit">
      <widgetv2config UseHtml="0" IsMultiline="0" fieldEditable="1" labelOnTop="0"/>
    </edittype>
    <edittype name="me_obj_id" widgetv2type="TextEdit">
      <widgetv2config UseHtml="0" IsMultiline="0" fieldEditable="1" labelOnTop="0"/>
    </edittype>
    <edittype name="me_active_zone" widgetv2type="TextEdit">
      <widgetv2config UseHtml="0" IsMultiline="0" fieldEditable="1" labelOnTop="0"/>
    </edittype>
    <edittype name="me_identifier" widgetv2type="TextEdit">
      <widgetv2config UseHtml="0" IsMultiline="0" fieldEditable="1" labelOnTop="0"/>
    </edittype>
    <edittype name="material_abbr_en" widgetv2type="TextEdit">
      <widgetv2config UseHtml="0" IsMultiline="0" fieldEditable="0" labelOnTop="0"/>
    </edittype>
    <edittype name="material_abbr_de" widgetv2type="TextEdit">
      <widgetv2config UseHtml="0" IsMultiline="0" fieldEditable="0" labelOnTop="0"/>
    </edittype>
    <edittype name="material_abbr_fr" widgetv2type="TextEdit">
      <widgetv2config UseHtml="0" IsMultiline="0" fieldEditable="0" labelOnTop="0"/>
    </edittype>
  </edittypes>
  <renderer-v2 type="RuleRenderer" symbollevels="0" enableorderby="0" forceraster="0">
    <rules key="{b3f3f0a1-c8d2-4416-8d68-3de95a17bc02}">
      <rule symbol="0" label="Wide reaches, accurate positioning, scale &lt;=2000" key="{9e580459-8bfa-4f04-be8f-68986341bd8e}" filter="width >= 300 and horizontal_positioning = 5378" scalemaxdenom="2001"/>
      <rule symbol="1" label="Wide reaches, inaccurate positioning, scale &lt;=2000" key="{a424a253-3ec2-46b0-9b46-a4a4cb732fb7}" filter="width >= 300 and horizontal_positioning &lt;> 5378" scalemaxdenom="2001"/>
      <rule symbol="2" label="Narrow main reaches, accurate positioning, scale &lt;=2000" key="{dd8104d5-d8fe-4f14-93dc-feb27d310ac3}" filter="(width &lt; 300 OR width IS NULL) AND function_hierarchic IN (5068,5069,5070,5071) AND horizontal_positioning = 5378" scalemaxdenom="2001"/>
      <rule symbol="3" label="Narrow main reaches, inaccurate positioning, scale &lt;=2000" key="{1a35f8ac-80d4-4195-95e4-076f6dbe1ecc}" filter="(width &lt; 300 OR width IS NULL) AND function_hierarchic IN (5068,5069,5070,5071) AND horizontal_positioning &lt;> 5378" scalemaxdenom="2001"/>
      <rule symbol="4" label="Narrow minor reaches, accurate positioning, scale &lt;=2000" key="{05072394-efd2-4299-abf8-f34a029a23a6}" filter="(width &lt; 300 OR width IS NULL) AND function_hierarchic NOT IN (5068,5069,5070,5071) AND horizontal_positioning = 5378" scalemaxdenom="2001"/>
      <rule symbol="5" label="Narrow minor reaches, inaccurate positioning, scale &lt;=2000" key="{e1b5e5a1-8ad6-447d-9483-c38ab0e189e6}" filter="(width &lt; 300 OR width IS NULL) AND function_hierarchic NOT IN (5068,5069,5070,5071) AND horizontal_positioning &lt;> 5378" scalemaxdenom="2001"/>
      <rule symbol="6" label="Wide reaches, accurate positioning, scale 2000-5000" key="{37d45500-ee03-4438-8431-1f6c18bc8ac9}" filter="width >= 600 and horizontal_positioning = 5378" scalemindenom="2001" scalemaxdenom="5001"/>
      <rule symbol="7" label="Wide reaches, inaccurate positioning, scale 2000-5000" key="{5085b144-096c-4a99-b901-c48d8ccab0de}" filter="width >= 600 and horizontal_positioning &lt;> 5378" scalemindenom="2001" scalemaxdenom="5001"/>
      <rule symbol="8" label="Narrow main reaches, accurate positioning, scale 1000-3000" key="{4d7a3723-99a5-420a-b1e6-ff0a12b8ede4}" filter="(width &lt; 600 OR width IS NULL) AND function_hierarchic IN (5068,5069,5070,5071) AND horizontal_positioning = 5378" scalemindenom="2001" scalemaxdenom="5001"/>
      <rule symbol="9" label="Narrow main reaches, inaccurate positioning, scale 1000-3000" key="{551fba99-38e1-4d21-9007-1e1ebba2a1d8}" filter="(width &lt; 600 OR width IS NULL) AND function_hierarchic IN (5068,5069,5070,5071) AND horizontal_positioning &lt;> 5378" scalemindenom="2001" scalemaxdenom="5001"/>
      <rule symbol="10" label="Main reaches, accurate positioning, scale >5000" key="{d0a8418c-2231-46eb-abe3-d840c2c67437}" filter="function_hierarchic IN (5068,5069,5070,5071) AND horizontal_positioning = 5378" scalemindenom="5001" scalemaxdenom="100000"/>
      <rule symbol="11" label="Main reaches, accurate positioning, scale >5000" key="{c7db9a9a-3d0f-4ab1-b0d3-301987626cab}" filter="function_hierarchic IN (5068,5069,5070,5071) AND horizontal_positioning &lt;> 5378" scalemindenom="5001" scalemaxdenom="100000"/>
      <rule symbol="12" label="Missing attributes" key="{7bf9a846-7dbb-4eed-aa7e-39a4ac741ff1}" filter="function_hierarchic IS NULL or horizontal_positioning IS NULL" scalemaxdenom="2001"/>
    </rules>
    <symbols>
      <symbol type="line" name="0" alpha="1" clip_to_extent="1">
        <layer class="SimpleLine" locked="0" pass="0">
          <prop v="flat" k="capstyle"/>
          <prop v="1" k="color_dd_active"/>
          <prop v="CASE &#xa;  WHEN  &quot;me_active_zone&quot; = 'A' THEN '#e41a1c'&#xa;  WHEN  &quot;me_active_zone&quot; = 'B' THEN '#377eb8'&#xa;  WHEN  &quot;me_active_zone&quot; = 'C' THEN '#4daf4a'&#xa;  WHEN  &quot;me_active_zone&quot; = 'D' THEN '#984ea3'&#xa;  WHEN  &quot;me_active_zone&quot; = 'E' THEN '#ff7f00'&#xa;  WHEN  &quot;me_active_zone&quot; = 'F' THEN '#ffff33'&#xa;  WHEN  &quot;me_active_zone&quot; = 'G' THEN '#a65628'&#xa;  WHEN  &quot;me_active_zone&quot; = 'H' THEN '#f781bf'&#xa;ELSE '161,161,161,80' END" k="color_dd_expression"/>
          <prop v="" k="color_dd_field"/>
          <prop v="1" k="color_dd_useexpr"/>
          <prop v="5;2" k="customdash"/>
          <prop v="0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0,0,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="0.26" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="1" k="width_dd_active"/>
          <prop v="toreal(width) / 1000" k="width_dd_expression"/>
          <prop v="" k="width_dd_field"/>
          <prop v="1" k="width_dd_useexpr"/>
          <prop v="0,0,0,0,0,0" k="width_map_unit_scale"/>
          <effect type="effectStack" enabled="0">
            <effect type="drawSource">
              <prop v="0" k="blend_mode"/>
              <prop v="2" k="draw_mode"/>
              <prop v="1" k="enabled"/>
              <prop v="0" k="transparency"/>
            </effect>
          </effect>
        </layer>
        <layer class="SimpleLine" locked="0" pass="0">
          <prop v="flat" k="capstyle"/>
          <prop v="1" k="color_dd_active"/>
          <prop v="CASE &#xa;  WHEN  &quot;me_active_zone&quot; = 'A' THEN '#e41a1c'&#xa;  WHEN  &quot;me_active_zone&quot; = 'B' THEN '#377eb8'&#xa;  WHEN  &quot;me_active_zone&quot; = 'C' THEN '#4daf4a'&#xa;  WHEN  &quot;me_active_zone&quot; = 'D' THEN '#984ea3'&#xa;  WHEN  &quot;me_active_zone&quot; = 'E' THEN '#ff7f00'&#xa;  WHEN  &quot;me_active_zone&quot; = 'F' THEN '#ffff33'&#xa;  WHEN  &quot;me_active_zone&quot; = 'G' THEN '#a65628'&#xa;  WHEN  &quot;me_active_zone&quot; = 'H' THEN '#f781bf'&#xa;ELSE '161,161,161,80' END" k="color_dd_expression"/>
          <prop v="" k="color_dd_field"/>
          <prop v="1" k="color_dd_useexpr"/>
          <prop v="5;2" k="customdash"/>
          <prop v="0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="203,176,112,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="0.3" k="line_width"/>
          <prop v="MM" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="1" k="offset_dd_active"/>
          <prop v="toreal(width) / 2000" k="offset_dd_expression"/>
          <prop v="" k="offset_dd_field"/>
          <prop v="1" k="offset_dd_useexpr"/>
          <prop v="0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="0,0,0,0,0,0" k="width_map_unit_scale"/>
          <effect type="effectStack" enabled="0">
            <effect type="drawSource">
              <prop v="0" k="blend_mode"/>
              <prop v="2" k="draw_mode"/>
              <prop v="1" k="enabled"/>
              <prop v="0" k="transparency"/>
            </effect>
          </effect>
        </layer>
        <layer class="SimpleLine" locked="0" pass="0">
          <prop v="flat" k="capstyle"/>
          <prop v="1" k="color_dd_active"/>
          <prop v="CASE &#xa;  WHEN  &quot;me_active_zone&quot; = 'A' THEN '#e41a1c'&#xa;  WHEN  &quot;me_active_zone&quot; = 'B' THEN '#377eb8'&#xa;  WHEN  &quot;me_active_zone&quot; = 'C' THEN '#4daf4a'&#xa;  WHEN  &quot;me_active_zone&quot; = 'D' THEN '#984ea3'&#xa;  WHEN  &quot;me_active_zone&quot; = 'E' THEN '#ff7f00'&#xa;  WHEN  &quot;me_active_zone&quot; = 'F' THEN '#ffff33'&#xa;  WHEN  &quot;me_active_zone&quot; = 'G' THEN '#a65628'&#xa;  WHEN  &quot;me_active_zone&quot; = 'H' THEN '#f781bf'&#xa;ELSE '161,161,161,80' END" k="color_dd_expression"/>
          <prop v="" k="color_dd_field"/>
          <prop v="1" k="color_dd_useexpr"/>
          <prop v="5;2" k="customdash"/>
          <prop v="0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0,0,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="0.3" k="line_width"/>
          <prop v="MM" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="1" k="offset_dd_active"/>
          <prop v="toreal(width) / - 2000" k="offset_dd_expression"/>
          <prop v="" k="offset_dd_field"/>
          <prop v="1" k="offset_dd_useexpr"/>
          <prop v="0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="0,0,0,0,0,0" k="width_map_unit_scale"/>
          <effect type="effectStack" enabled="0">
            <effect type="drawSource">
              <prop v="0" k="blend_mode"/>
              <prop v="2" k="draw_mode"/>
              <prop v="1" k="enabled"/>
              <prop v="0" k="transparency"/>
            </effect>
          </effect>
        </layer>
      </symbol>
      <symbol type="line" name="1" alpha="1" clip_to_extent="1">
        <layer class="SimpleLine" locked="0" pass="0">
          <prop v="flat" k="capstyle"/>
          <prop v="1" k="color_dd_active"/>
          <prop v="CASE &#xa;  WHEN  &quot;me_active_zone&quot; = 'A' THEN '#e41a1c'&#xa;  WHEN  &quot;me_active_zone&quot; = 'B' THEN '#377eb8'&#xa;  WHEN  &quot;me_active_zone&quot; = 'C' THEN '#4daf4a'&#xa;  WHEN  &quot;me_active_zone&quot; = 'D' THEN '#984ea3'&#xa;  WHEN  &quot;me_active_zone&quot; = 'E' THEN '#ff7f00'&#xa;  WHEN  &quot;me_active_zone&quot; = 'F' THEN '#ffff33'&#xa;  WHEN  &quot;me_active_zone&quot; = 'G' THEN '#a65628'&#xa;  WHEN  &quot;me_active_zone&quot; = 'H' THEN '#f781bf'&#xa;ELSE '161,161,161,80' END" k="color_dd_expression"/>
          <prop v="" k="color_dd_field"/>
          <prop v="1" k="color_dd_useexpr"/>
          <prop v="5;2" k="customdash"/>
          <prop v="0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0,0,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="0.26" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="1" k="width_dd_active"/>
          <prop v="toreal(width) / 1000" k="width_dd_expression"/>
          <prop v="" k="width_dd_field"/>
          <prop v="1" k="width_dd_useexpr"/>
          <prop v="0,0,0,0,0,0" k="width_map_unit_scale"/>
          <effect type="effectStack" enabled="0">
            <effect type="drawSource">
              <prop v="0" k="blend_mode"/>
              <prop v="2" k="draw_mode"/>
              <prop v="1" k="enabled"/>
              <prop v="0" k="transparency"/>
            </effect>
          </effect>
        </layer>
        <layer class="SimpleLine" locked="0" pass="0">
          <prop v="flat" k="capstyle"/>
          <prop v="1" k="color_dd_active"/>
          <prop v="CASE &#xa;  WHEN  &quot;me_active_zone&quot; = 'A' THEN '#e41a1c'&#xa;  WHEN  &quot;me_active_zone&quot; = 'B' THEN '#377eb8'&#xa;  WHEN  &quot;me_active_zone&quot; = 'C' THEN '#4daf4a'&#xa;  WHEN  &quot;me_active_zone&quot; = 'D' THEN '#984ea3'&#xa;  WHEN  &quot;me_active_zone&quot; = 'E' THEN '#ff7f00'&#xa;  WHEN  &quot;me_active_zone&quot; = 'F' THEN '#ffff33'&#xa;  WHEN  &quot;me_active_zone&quot; = 'G' THEN '#a65628'&#xa;  WHEN  &quot;me_active_zone&quot; = 'H' THEN '#f781bf'&#xa;ELSE '161,161,161,80' END" k="color_dd_expression"/>
          <prop v="" k="color_dd_field"/>
          <prop v="1" k="color_dd_useexpr"/>
          <prop v="1.5;1" k="customdash"/>
          <prop v="0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="203,176,112,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="0.3" k="line_width"/>
          <prop v="MM" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="1" k="offset_dd_active"/>
          <prop v="toreal(width) / 2000" k="offset_dd_expression"/>
          <prop v="" k="offset_dd_field"/>
          <prop v="1" k="offset_dd_useexpr"/>
          <prop v="0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="1" k="use_custom_dash"/>
          <prop v="0,0,0,0,0,0" k="width_map_unit_scale"/>
          <effect type="effectStack" enabled="0">
            <effect type="drawSource">
              <prop v="0" k="blend_mode"/>
              <prop v="2" k="draw_mode"/>
              <prop v="1" k="enabled"/>
              <prop v="0" k="transparency"/>
            </effect>
          </effect>
        </layer>
        <layer class="SimpleLine" locked="0" pass="0">
          <prop v="flat" k="capstyle"/>
          <prop v="1" k="color_dd_active"/>
          <prop v="CASE &#xa;  WHEN  &quot;me_active_zone&quot; = 'A' THEN '#e41a1c'&#xa;  WHEN  &quot;me_active_zone&quot; = 'B' THEN '#377eb8'&#xa;  WHEN  &quot;me_active_zone&quot; = 'C' THEN '#4daf4a'&#xa;  WHEN  &quot;me_active_zone&quot; = 'D' THEN '#984ea3'&#xa;  WHEN  &quot;me_active_zone&quot; = 'E' THEN '#ff7f00'&#xa;  WHEN  &quot;me_active_zone&quot; = 'F' THEN '#ffff33'&#xa;  WHEN  &quot;me_active_zone&quot; = 'G' THEN '#a65628'&#xa;  WHEN  &quot;me_active_zone&quot; = 'H' THEN '#f781bf'&#xa;ELSE '161,161,161,80' END" k="color_dd_expression"/>
          <prop v="" k="color_dd_field"/>
          <prop v="1" k="color_dd_useexpr"/>
          <prop v="1.5;1" k="customdash"/>
          <prop v="0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0,0,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="0.3" k="line_width"/>
          <prop v="MM" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="1" k="offset_dd_active"/>
          <prop v="toreal(width) / - 2000" k="offset_dd_expression"/>
          <prop v="" k="offset_dd_field"/>
          <prop v="1" k="offset_dd_useexpr"/>
          <prop v="0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="1" k="use_custom_dash"/>
          <prop v="0,0,0,0,0,0" k="width_map_unit_scale"/>
          <effect type="effectStack" enabled="0">
            <effect type="drawSource">
              <prop v="0" k="blend_mode"/>
              <prop v="2" k="draw_mode"/>
              <prop v="1" k="enabled"/>
              <prop v="0" k="transparency"/>
            </effect>
          </effect>
        </layer>
      </symbol>
      <symbol type="line" name="10" alpha="1" clip_to_extent="1">
        <layer class="SimpleLine" locked="0" pass="0">
          <prop v="flat" k="capstyle"/>
          <prop v="1" k="color_dd_active"/>
          <prop v="CASE &#xa;  WHEN  &quot;me_active_zone&quot; = 'A' THEN '#e41a1c'&#xa;  WHEN  &quot;me_active_zone&quot; = 'B' THEN '#377eb8'&#xa;  WHEN  &quot;me_active_zone&quot; = 'C' THEN '#4daf4a'&#xa;  WHEN  &quot;me_active_zone&quot; = 'D' THEN '#984ea3'&#xa;  WHEN  &quot;me_active_zone&quot; = 'E' THEN '#ff7f00'&#xa;  WHEN  &quot;me_active_zone&quot; = 'F' THEN '#ffff33'&#xa;  WHEN  &quot;me_active_zone&quot; = 'G' THEN '#a65628'&#xa;  WHEN  &quot;me_active_zone&quot; = 'H' THEN '#f781bf'&#xa;ELSE '161,161,161,80' END" k="color_dd_expression"/>
          <prop v="" k="color_dd_field"/>
          <prop v="1" k="color_dd_useexpr"/>
          <prop v="5;2" k="customdash"/>
          <prop v="0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0,0,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="0.5" k="line_width"/>
          <prop v="MM" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="0,0,0,0,0,0" k="width_map_unit_scale"/>
          <effect type="effectStack" enabled="0">
            <effect type="drawSource">
              <prop v="0" k="blend_mode"/>
              <prop v="2" k="draw_mode"/>
              <prop v="1" k="enabled"/>
              <prop v="0" k="transparency"/>
            </effect>
          </effect>
        </layer>
      </symbol>
      <symbol type="line" name="11" alpha="1" clip_to_extent="1">
        <layer class="SimpleLine" locked="0" pass="0">
          <prop v="flat" k="capstyle"/>
          <prop v="1" k="color_dd_active"/>
          <prop v="CASE &#xa;  WHEN  &quot;me_active_zone&quot; = 'A' THEN '#e41a1c'&#xa;  WHEN  &quot;me_active_zone&quot; = 'B' THEN '#377eb8'&#xa;  WHEN  &quot;me_active_zone&quot; = 'C' THEN '#4daf4a'&#xa;  WHEN  &quot;me_active_zone&quot; = 'D' THEN '#984ea3'&#xa;  WHEN  &quot;me_active_zone&quot; = 'E' THEN '#ff7f00'&#xa;  WHEN  &quot;me_active_zone&quot; = 'F' THEN '#ffff33'&#xa;  WHEN  &quot;me_active_zone&quot; = 'G' THEN '#a65628'&#xa;  WHEN  &quot;me_active_zone&quot; = 'H' THEN '#f781bf'&#xa;ELSE '161,161,161,80' END" k="color_dd_expression"/>
          <prop v="" k="color_dd_field"/>
          <prop v="1" k="color_dd_useexpr"/>
          <prop v="1.5;1" k="customdash"/>
          <prop v="0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0,0,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="0.5" k="line_width"/>
          <prop v="MM" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="1" k="use_custom_dash"/>
          <prop v="0,0,0,0,0,0" k="width_map_unit_scale"/>
          <effect type="effectStack" enabled="0">
            <effect type="drawSource">
              <prop v="0" k="blend_mode"/>
              <prop v="2" k="draw_mode"/>
              <prop v="1" k="enabled"/>
              <prop v="0" k="transparency"/>
            </effect>
          </effect>
        </layer>
      </symbol>
      <symbol type="line" name="12" alpha="1" clip_to_extent="1">
        <layer class="SimpleLine" locked="0" pass="5">
          <prop v="round" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="243,69,255,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="1" k="line_width"/>
          <prop v="MM" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="0,0,0,0,0,0" k="width_map_unit_scale"/>
        </layer>
      </symbol>
      <symbol type="line" name="2" alpha="1" clip_to_extent="1">
        <layer class="SimpleLine" locked="0" pass="0">
          <prop v="flat" k="capstyle"/>
          <prop v="1" k="color_dd_active"/>
          <prop v="CASE &#xa;  WHEN  &quot;me_active_zone&quot; = 'A' THEN '#e41a1c'&#xa;  WHEN  &quot;me_active_zone&quot; = 'B' THEN '#377eb8'&#xa;  WHEN  &quot;me_active_zone&quot; = 'C' THEN '#4daf4a'&#xa;  WHEN  &quot;me_active_zone&quot; = 'D' THEN '#984ea3'&#xa;  WHEN  &quot;me_active_zone&quot; = 'E' THEN '#ff7f00'&#xa;  WHEN  &quot;me_active_zone&quot; = 'F' THEN '#ffff33'&#xa;  WHEN  &quot;me_active_zone&quot; = 'G' THEN '#a65628'&#xa;  WHEN  &quot;me_active_zone&quot; = 'H' THEN '#f781bf'&#xa;ELSE '161,161,161,80' END" k="color_dd_expression"/>
          <prop v="" k="color_dd_field"/>
          <prop v="1" k="color_dd_useexpr"/>
          <prop v="5;2" k="customdash"/>
          <prop v="0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0,0,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="0.5" k="line_width"/>
          <prop v="MM" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="0,0,0,0,0,0" k="width_map_unit_scale"/>
          <effect type="effectStack" enabled="0">
            <effect type="drawSource">
              <prop v="0" k="blend_mode"/>
              <prop v="2" k="draw_mode"/>
              <prop v="1" k="enabled"/>
              <prop v="0" k="transparency"/>
            </effect>
          </effect>
        </layer>
      </symbol>
      <symbol type="line" name="3" alpha="1" clip_to_extent="1">
        <layer class="SimpleLine" locked="0" pass="0">
          <prop v="flat" k="capstyle"/>
          <prop v="1" k="color_dd_active"/>
          <prop v="CASE &#xa;  WHEN  &quot;me_active_zone&quot; = 'A' THEN '#e41a1c'&#xa;  WHEN  &quot;me_active_zone&quot; = 'B' THEN '#377eb8'&#xa;  WHEN  &quot;me_active_zone&quot; = 'C' THEN '#4daf4a'&#xa;  WHEN  &quot;me_active_zone&quot; = 'D' THEN '#984ea3'&#xa;  WHEN  &quot;me_active_zone&quot; = 'E' THEN '#ff7f00'&#xa;  WHEN  &quot;me_active_zone&quot; = 'F' THEN '#ffff33'&#xa;  WHEN  &quot;me_active_zone&quot; = 'G' THEN '#a65628'&#xa;  WHEN  &quot;me_active_zone&quot; = 'H' THEN '#f781bf'&#xa;ELSE '161,161,161,80' END" k="color_dd_expression"/>
          <prop v="" k="color_dd_field"/>
          <prop v="1" k="color_dd_useexpr"/>
          <prop v="1.5;1" k="customdash"/>
          <prop v="0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0,0,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="0.5" k="line_width"/>
          <prop v="MM" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="1" k="use_custom_dash"/>
          <prop v="0,0,0,0,0,0" k="width_map_unit_scale"/>
          <effect type="effectStack" enabled="0">
            <effect type="drawSource">
              <prop v="0" k="blend_mode"/>
              <prop v="2" k="draw_mode"/>
              <prop v="1" k="enabled"/>
              <prop v="0" k="transparency"/>
            </effect>
          </effect>
        </layer>
      </symbol>
      <symbol type="line" name="4" alpha="1" clip_to_extent="1">
        <layer class="SimpleLine" locked="0" pass="0">
          <prop v="flat" k="capstyle"/>
          <prop v="1" k="color_dd_active"/>
          <prop v="CASE &#xa;  WHEN  &quot;me_active_zone&quot; = 'A' THEN '#e41a1c'&#xa;  WHEN  &quot;me_active_zone&quot; = 'B' THEN '#377eb8'&#xa;  WHEN  &quot;me_active_zone&quot; = 'C' THEN '#4daf4a'&#xa;  WHEN  &quot;me_active_zone&quot; = 'D' THEN '#984ea3'&#xa;  WHEN  &quot;me_active_zone&quot; = 'E' THEN '#ff7f00'&#xa;  WHEN  &quot;me_active_zone&quot; = 'F' THEN '#ffff33'&#xa;  WHEN  &quot;me_active_zone&quot; = 'G' THEN '#a65628'&#xa;  WHEN  &quot;me_active_zone&quot; = 'H' THEN '#f781bf'&#xa;ELSE '161,161,161,80' END" k="color_dd_expression"/>
          <prop v="" k="color_dd_field"/>
          <prop v="1" k="color_dd_useexpr"/>
          <prop v="5;2" k="customdash"/>
          <prop v="0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0,0,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="0.3" k="line_width"/>
          <prop v="MM" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="0,0,0,0,0,0" k="width_map_unit_scale"/>
          <effect type="effectStack" enabled="0">
            <effect type="drawSource">
              <prop v="0" k="blend_mode"/>
              <prop v="2" k="draw_mode"/>
              <prop v="1" k="enabled"/>
              <prop v="0" k="transparency"/>
            </effect>
          </effect>
        </layer>
      </symbol>
      <symbol type="line" name="5" alpha="1" clip_to_extent="1">
        <layer class="SimpleLine" locked="0" pass="0">
          <prop v="flat" k="capstyle"/>
          <prop v="1" k="color_dd_active"/>
          <prop v="CASE &#xa;  WHEN  &quot;me_active_zone&quot; = 'A' THEN '#e41a1c'&#xa;  WHEN  &quot;me_active_zone&quot; = 'B' THEN '#377eb8'&#xa;  WHEN  &quot;me_active_zone&quot; = 'C' THEN '#4daf4a'&#xa;  WHEN  &quot;me_active_zone&quot; = 'D' THEN '#984ea3'&#xa;  WHEN  &quot;me_active_zone&quot; = 'E' THEN '#ff7f00'&#xa;  WHEN  &quot;me_active_zone&quot; = 'F' THEN '#ffff33'&#xa;  WHEN  &quot;me_active_zone&quot; = 'G' THEN '#a65628'&#xa;  WHEN  &quot;me_active_zone&quot; = 'H' THEN '#f781bf'&#xa;ELSE '161,161,161,80' END" k="color_dd_expression"/>
          <prop v="" k="color_dd_field"/>
          <prop v="1" k="color_dd_useexpr"/>
          <prop v="1.5;1" k="customdash"/>
          <prop v="0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0,0,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="0.3" k="line_width"/>
          <prop v="MM" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="1" k="use_custom_dash"/>
          <prop v="0,0,0,0,0,0" k="width_map_unit_scale"/>
          <effect type="effectStack" enabled="0">
            <effect type="drawSource">
              <prop v="0" k="blend_mode"/>
              <prop v="2" k="draw_mode"/>
              <prop v="1" k="enabled"/>
              <prop v="0" k="transparency"/>
            </effect>
          </effect>
        </layer>
      </symbol>
      <symbol type="line" name="6" alpha="1" clip_to_extent="1">
        <layer class="SimpleLine" locked="0" pass="0">
          <prop v="flat" k="capstyle"/>
          <prop v="1" k="color_dd_active"/>
          <prop v="CASE &#xa;  WHEN  &quot;me_active_zone&quot; = 'A' THEN '#e41a1c'&#xa;  WHEN  &quot;me_active_zone&quot; = 'B' THEN '#377eb8'&#xa;  WHEN  &quot;me_active_zone&quot; = 'C' THEN '#4daf4a'&#xa;  WHEN  &quot;me_active_zone&quot; = 'D' THEN '#984ea3'&#xa;  WHEN  &quot;me_active_zone&quot; = 'E' THEN '#ff7f00'&#xa;  WHEN  &quot;me_active_zone&quot; = 'F' THEN '#ffff33'&#xa;  WHEN  &quot;me_active_zone&quot; = 'G' THEN '#a65628'&#xa;  WHEN  &quot;me_active_zone&quot; = 'H' THEN '#f781bf'&#xa;ELSE '161,161,161,80' END" k="color_dd_expression"/>
          <prop v="" k="color_dd_field"/>
          <prop v="1" k="color_dd_useexpr"/>
          <prop v="5;2" k="customdash"/>
          <prop v="0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0,0,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="0.26" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="1" k="width_dd_active"/>
          <prop v="toreal(width) / 1000" k="width_dd_expression"/>
          <prop v="" k="width_dd_field"/>
          <prop v="1" k="width_dd_useexpr"/>
          <prop v="0,0,0,0,0,0" k="width_map_unit_scale"/>
          <effect type="effectStack" enabled="0">
            <effect type="drawSource">
              <prop v="0" k="blend_mode"/>
              <prop v="2" k="draw_mode"/>
              <prop v="1" k="enabled"/>
              <prop v="0" k="transparency"/>
            </effect>
          </effect>
        </layer>
        <layer class="SimpleLine" locked="0" pass="0">
          <prop v="flat" k="capstyle"/>
          <prop v="1" k="color_dd_active"/>
          <prop v="CASE &#xa;  WHEN  &quot;me_active_zone&quot; = 'A' THEN '#e41a1c'&#xa;  WHEN  &quot;me_active_zone&quot; = 'B' THEN '#377eb8'&#xa;  WHEN  &quot;me_active_zone&quot; = 'C' THEN '#4daf4a'&#xa;  WHEN  &quot;me_active_zone&quot; = 'D' THEN '#984ea3'&#xa;  WHEN  &quot;me_active_zone&quot; = 'E' THEN '#ff7f00'&#xa;  WHEN  &quot;me_active_zone&quot; = 'F' THEN '#ffff33'&#xa;  WHEN  &quot;me_active_zone&quot; = 'G' THEN '#a65628'&#xa;  WHEN  &quot;me_active_zone&quot; = 'H' THEN '#f781bf'&#xa;ELSE '161,161,161,80' END" k="color_dd_expression"/>
          <prop v="" k="color_dd_field"/>
          <prop v="1" k="color_dd_useexpr"/>
          <prop v="5;2" k="customdash"/>
          <prop v="0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="203,176,112,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="0.3" k="line_width"/>
          <prop v="MM" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="1" k="offset_dd_active"/>
          <prop v="toreal(width) / 2000" k="offset_dd_expression"/>
          <prop v="" k="offset_dd_field"/>
          <prop v="1" k="offset_dd_useexpr"/>
          <prop v="0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="0,0,0,0,0,0" k="width_map_unit_scale"/>
          <effect type="effectStack" enabled="0">
            <effect type="drawSource">
              <prop v="0" k="blend_mode"/>
              <prop v="2" k="draw_mode"/>
              <prop v="1" k="enabled"/>
              <prop v="0" k="transparency"/>
            </effect>
          </effect>
        </layer>
        <layer class="SimpleLine" locked="0" pass="0">
          <prop v="flat" k="capstyle"/>
          <prop v="1" k="color_dd_active"/>
          <prop v="CASE &#xa;  WHEN  &quot;me_active_zone&quot; = 'A' THEN '#e41a1c'&#xa;  WHEN  &quot;me_active_zone&quot; = 'B' THEN '#377eb8'&#xa;  WHEN  &quot;me_active_zone&quot; = 'C' THEN '#4daf4a'&#xa;  WHEN  &quot;me_active_zone&quot; = 'D' THEN '#984ea3'&#xa;  WHEN  &quot;me_active_zone&quot; = 'E' THEN '#ff7f00'&#xa;  WHEN  &quot;me_active_zone&quot; = 'F' THEN '#ffff33'&#xa;  WHEN  &quot;me_active_zone&quot; = 'G' THEN '#a65628'&#xa;  WHEN  &quot;me_active_zone&quot; = 'H' THEN '#f781bf'&#xa;ELSE '161,161,161,80' END" k="color_dd_expression"/>
          <prop v="" k="color_dd_field"/>
          <prop v="1" k="color_dd_useexpr"/>
          <prop v="5;2" k="customdash"/>
          <prop v="0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0,0,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="0.3" k="line_width"/>
          <prop v="MM" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="1" k="offset_dd_active"/>
          <prop v="toreal(width) / - 2000" k="offset_dd_expression"/>
          <prop v="" k="offset_dd_field"/>
          <prop v="1" k="offset_dd_useexpr"/>
          <prop v="0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="0,0,0,0,0,0" k="width_map_unit_scale"/>
          <effect type="effectStack" enabled="0">
            <effect type="drawSource">
              <prop v="0" k="blend_mode"/>
              <prop v="2" k="draw_mode"/>
              <prop v="1" k="enabled"/>
              <prop v="0" k="transparency"/>
            </effect>
          </effect>
        </layer>
      </symbol>
      <symbol type="line" name="7" alpha="1" clip_to_extent="1">
        <layer class="SimpleLine" locked="0" pass="0">
          <prop v="flat" k="capstyle"/>
          <prop v="1" k="color_dd_active"/>
          <prop v="CASE &#xa;  WHEN usage_current IN (4514, 4520) THEN '0,0,255,30' &#xa;  WHEN usage_current = 4516 THEN '0,255,0,30' &#xa;  WHEN usage_current = 4518 THEN '0,170,255,30' &#xa;  WHEN usage_current = 4522 THEN '102,0,102,30' &#xa;  WHEN usage_current IN (4524, 4526) THEN '255,0,0,30' &#xa;  ELSE '161,161,161,30' END" k="color_dd_expression"/>
          <prop v="" k="color_dd_field"/>
          <prop v="1" k="color_dd_useexpr"/>
          <prop v="5;2" k="customdash"/>
          <prop v="0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0,0,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="0.26" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="1" k="width_dd_active"/>
          <prop v="toreal(width) / 1000" k="width_dd_expression"/>
          <prop v="" k="width_dd_field"/>
          <prop v="1" k="width_dd_useexpr"/>
          <prop v="0,0,0,0,0,0" k="width_map_unit_scale"/>
          <effect type="effectStack" enabled="0">
            <effect type="drawSource">
              <prop v="0" k="blend_mode"/>
              <prop v="2" k="draw_mode"/>
              <prop v="1" k="enabled"/>
              <prop v="0" k="transparency"/>
            </effect>
          </effect>
        </layer>
        <layer class="SimpleLine" locked="0" pass="0">
          <prop v="flat" k="capstyle"/>
          <prop v="1" k="color_dd_active"/>
          <prop v="CASE &#xa;  WHEN  &quot;me_active_zone&quot; = 'A' THEN '#e41a1c'&#xa;  WHEN  &quot;me_active_zone&quot; = 'B' THEN '#377eb8'&#xa;  WHEN  &quot;me_active_zone&quot; = 'C' THEN '#4daf4a'&#xa;  WHEN  &quot;me_active_zone&quot; = 'D' THEN '#984ea3'&#xa;  WHEN  &quot;me_active_zone&quot; = 'E' THEN '#ff7f00'&#xa;  WHEN  &quot;me_active_zone&quot; = 'F' THEN '#ffff33'&#xa;  WHEN  &quot;me_active_zone&quot; = 'G' THEN '#a65628'&#xa;  WHEN  &quot;me_active_zone&quot; = 'H' THEN '#f781bf'&#xa;ELSE '161,161,161,80' END" k="color_dd_expression"/>
          <prop v="" k="color_dd_field"/>
          <prop v="1" k="color_dd_useexpr"/>
          <prop v="1.5;1" k="customdash"/>
          <prop v="0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="203,176,112,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="0.3" k="line_width"/>
          <prop v="MM" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="1" k="offset_dd_active"/>
          <prop v="toreal(width) / 2000" k="offset_dd_expression"/>
          <prop v="" k="offset_dd_field"/>
          <prop v="1" k="offset_dd_useexpr"/>
          <prop v="0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="1" k="use_custom_dash"/>
          <prop v="0,0,0,0,0,0" k="width_map_unit_scale"/>
          <effect type="effectStack" enabled="0">
            <effect type="drawSource">
              <prop v="0" k="blend_mode"/>
              <prop v="2" k="draw_mode"/>
              <prop v="1" k="enabled"/>
              <prop v="0" k="transparency"/>
            </effect>
          </effect>
        </layer>
        <layer class="SimpleLine" locked="0" pass="0">
          <prop v="flat" k="capstyle"/>
          <prop v="1" k="color_dd_active"/>
          <prop v="CASE &#xa;  WHEN  &quot;me_active_zone&quot; = 'A' THEN '#e41a1c'&#xa;  WHEN  &quot;me_active_zone&quot; = 'B' THEN '#377eb8'&#xa;  WHEN  &quot;me_active_zone&quot; = 'C' THEN '#4daf4a'&#xa;  WHEN  &quot;me_active_zone&quot; = 'D' THEN '#984ea3'&#xa;  WHEN  &quot;me_active_zone&quot; = 'E' THEN '#ff7f00'&#xa;  WHEN  &quot;me_active_zone&quot; = 'F' THEN '#ffff33'&#xa;  WHEN  &quot;me_active_zone&quot; = 'G' THEN '#a65628'&#xa;  WHEN  &quot;me_active_zone&quot; = 'H' THEN '#f781bf'&#xa;ELSE '161,161,161,80' END" k="color_dd_expression"/>
          <prop v="" k="color_dd_field"/>
          <prop v="1" k="color_dd_useexpr"/>
          <prop v="1.5;1" k="customdash"/>
          <prop v="0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0,0,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="0.3" k="line_width"/>
          <prop v="MM" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="1" k="offset_dd_active"/>
          <prop v="toreal(width) / - 2000" k="offset_dd_expression"/>
          <prop v="" k="offset_dd_field"/>
          <prop v="1" k="offset_dd_useexpr"/>
          <prop v="0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="1" k="use_custom_dash"/>
          <prop v="0,0,0,0,0,0" k="width_map_unit_scale"/>
          <effect type="effectStack" enabled="0">
            <effect type="drawSource">
              <prop v="0" k="blend_mode"/>
              <prop v="2" k="draw_mode"/>
              <prop v="1" k="enabled"/>
              <prop v="0" k="transparency"/>
            </effect>
          </effect>
        </layer>
      </symbol>
      <symbol type="line" name="8" alpha="1" clip_to_extent="1">
        <layer class="SimpleLine" locked="0" pass="0">
          <prop v="flat" k="capstyle"/>
          <prop v="1" k="color_dd_active"/>
          <prop v="CASE &#xa;  WHEN  &quot;me_active_zone&quot; = 'A' THEN '#e41a1c'&#xa;  WHEN  &quot;me_active_zone&quot; = 'B' THEN '#377eb8'&#xa;  WHEN  &quot;me_active_zone&quot; = 'C' THEN '#4daf4a'&#xa;  WHEN  &quot;me_active_zone&quot; = 'D' THEN '#984ea3'&#xa;  WHEN  &quot;me_active_zone&quot; = 'E' THEN '#ff7f00'&#xa;  WHEN  &quot;me_active_zone&quot; = 'F' THEN '#ffff33'&#xa;  WHEN  &quot;me_active_zone&quot; = 'G' THEN '#a65628'&#xa;  WHEN  &quot;me_active_zone&quot; = 'H' THEN '#f781bf'&#xa;ELSE '161,161,161,80' END" k="color_dd_expression"/>
          <prop v="" k="color_dd_field"/>
          <prop v="1" k="color_dd_useexpr"/>
          <prop v="5;2" k="customdash"/>
          <prop v="0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0,0,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="0.5" k="line_width"/>
          <prop v="MM" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="0,0,0,0,0,0" k="width_map_unit_scale"/>
          <effect type="effectStack" enabled="0">
            <effect type="drawSource">
              <prop v="0" k="blend_mode"/>
              <prop v="2" k="draw_mode"/>
              <prop v="1" k="enabled"/>
              <prop v="0" k="transparency"/>
            </effect>
          </effect>
        </layer>
      </symbol>
      <symbol type="line" name="9" alpha="1" clip_to_extent="1">
        <layer class="SimpleLine" locked="0" pass="0">
          <prop v="flat" k="capstyle"/>
          <prop v="1" k="color_dd_active"/>
          <prop v="CASE &#xa;  WHEN  &quot;me_active_zone&quot; = 'A' THEN '#e41a1c'&#xa;  WHEN  &quot;me_active_zone&quot; = 'B' THEN '#377eb8'&#xa;  WHEN  &quot;me_active_zone&quot; = 'C' THEN '#4daf4a'&#xa;  WHEN  &quot;me_active_zone&quot; = 'D' THEN '#984ea3'&#xa;  WHEN  &quot;me_active_zone&quot; = 'E' THEN '#ff7f00'&#xa;  WHEN  &quot;me_active_zone&quot; = 'F' THEN '#ffff33'&#xa;  WHEN  &quot;me_active_zone&quot; = 'G' THEN '#a65628'&#xa;  WHEN  &quot;me_active_zone&quot; = 'H' THEN '#f781bf'&#xa;ELSE '161,161,161,80' END" k="color_dd_expression"/>
          <prop v="" k="color_dd_field"/>
          <prop v="1" k="color_dd_useexpr"/>
          <prop v="1.5;1" k="customdash"/>
          <prop v="0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0,0,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="0.5" k="line_width"/>
          <prop v="MM" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="1" k="use_custom_dash"/>
          <prop v="0,0,0,0,0,0" k="width_map_unit_scale"/>
          <effect type="effectStack" enabled="0">
            <effect type="drawSource">
              <prop v="0" k="blend_mode"/>
              <prop v="2" k="draw_mode"/>
              <prop v="1" k="enabled"/>
              <prop v="0" k="transparency"/>
            </effect>
          </effect>
        </layer>
      </symbol>
    </symbols>
    <effect type="effectStack" enabled="0">
      <effect type="drawSource">
        <prop v="0" k="blend_mode"/>
        <prop v="2" k="draw_mode"/>
        <prop v="1" k="enabled"/>
        <prop v="0" k="transparency"/>
      </effect>
    </effect>
  </renderer-v2>
  <labeling type="simple"/>
  <customproperties>
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
    <property key="labeling/bufferTransp" value="0"/>
    <property key="labeling/centroidInside" value="false"/>
    <property key="labeling/centroidWhole" value="false"/>
    <property key="labeling/dataDefined/Color" value="1~~1~~CASE&#xa;  WHEN  usage_current IN (4514,4520) THEN '0,0,255,255' &#xa;  WHEN usage_current = 4516 THEN '0,255,0,255'&#xa;  WHEN usage_current = 4518 THEN '0,170,255,255'&#xa;  WHEN usage_current = 4522 THEN '102,0,102,255'&#xa;  WHEN usage_current IN (4524,4526) THEN '255,0,0,255'&#xa;ELSE '161,161,161,255'&#xa;END~~"/>
    <property key="labeling/dataDefined/LabelDistance" value="1~~1~~COALESCE(width,0) / 2000.0 + 0.1~~"/>
    <property key="labeling/dataDefined/Show" value="1~~1~~CASE WHEN $scale &lt;= 1000 THEN 1&#xa;ELSE&#xa; CASE WHEN function_hierarchic IN (5068,5069,5070,5071) THEN 1 ELSE 0 END&#xa;END~~"/>
    <property key="labeling/decimals" value="3"/>
    <property key="labeling/displayAll" value="false"/>
    <property key="labeling/dist" value="0.29999999999999999"/>
    <property key="labeling/distInMapUnits" value="true"/>
    <property key="labeling/distMapUnitMaxScale" value="0"/>
    <property key="labeling/distMapUnitMinScale" value="0"/>
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
    <label text="Label" fieldname=""/>
    <family name="Cantarell" fieldname=""/>
    <size units="pt" value="12" fieldname=""/>
    <bold on="0" fieldname=""/>
    <italic on="0" fieldname=""/>
    <underline on="0" fieldname=""/>
    <strikeout on="0" fieldname=""/>
    <color blue="0" red="0" green="0" fieldname=""/>
    <x fieldname=""/>
    <y fieldname=""/>
    <offset x="0" xfieldname="" yfieldname="" y="0" units="pt"/>
    <angle auto="0" value="0" fieldname=""/>
    <alignment value="center" fieldname=""/>
    <buffercolor blue="255" red="255" green="255" fieldname=""/>
    <buffersize units="pt" value="1" fieldname=""/>
    <bufferenabled on="" fieldname=""/>
    <multilineenabled on="" fieldname=""/>
    <selectedonly on=""/>
  </labelattributes>
  <SingleCategoryDiagramRenderer diagramType="Pie">
    <DiagramCategory angleOffset="1440" transparency="0" sizeScale="0,0,0,0,0,0" height="15" barWidth="5" width="15" labelPlacementMethod="XHeight" backgroundColor="#ffffff" enabled="0" penAlpha="255" maxScaleDenominator="1e+08" lineSizeScale="0,0,0,0,0,0" scaleDependency="Area" backgroundAlpha="255" sizeType="MM" minimumSize="0" scaleBasedVisibility="0" penColor="#000000" lineSizeType="MM" minScaleDenominator="100000" penWidth="0" diagramOrientation="Up">
      <fontProperties style="" description="Cantarell,11,-1,5,50,0,0,0,0,0"/>
      <attribute label="" field="" color="#000000"/>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings priority="0" placement="2" zIndex="0" obstacle="0" dist="0" xPosColumn="-1" showAll="1" yPosColumn="-1" linePlacementFlags="10"/>
  <annotationform>$HOME</annotationform>
  <aliases>
    <alias name="" field="accessibility" index="28"/>
    <alias name="" field="bedding_encasement" index="19"/>
    <alias name="" field="clear_height" index="1"/>
    <alias name="" field="coefficient_of_friction" index="3"/>
    <alias name="" field="connection_type" index="21"/>
    <alias name="" field="contract_section" index="29"/>
    <alias name="" field="elevation_determination" index="4"/>
    <alias name="" field="financing" index="30"/>
    <alias name="" field="fk_operator" index="45"/>
    <alias name="" field="fk_owner" index="44"/>
    <alias name="" field="fk_pipe_profile" index="18"/>
    <alias name="" field="fk_wastewater_structure" index="51"/>
    <alias name="" field="function_hierarchic" index="20"/>
    <alias name="" field="function_hydraulic" index="22"/>
    <alias name="" field="gross_costs" index="31"/>
    <alias name="" field="horizontal_positioning" index="5"/>
    <alias name="" field="identifier" index="46"/>
    <alias name="" field="inside_coating" index="6"/>
    <alias name="" field="inspection_interval" index="32"/>
    <alias name="" field="jetting_interval" index="23"/>
    <alias name="" field="last_modification" index="48"/>
    <alias name="" field="length_effective" index="7"/>
    <alias name="" field="location_name" index="33"/>
    <alias name="" field="material" index="9"/>
    <alias name="" field="obj_id" index="0"/>
    <alias name="" field="pipe_length" index="24"/>
    <alias name="" field="progression_3d_geometry" index="10"/>
    <alias name="" field="records" index="34"/>
    <alias name="" field="reliner_material" index="11"/>
    <alias name="" field="reliner_nominal_size" index="12"/>
    <alias name="" field="relining_construction" index="13"/>
    <alias name="" field="relining_kind" index="14"/>
    <alias name="" field="remark" index="47"/>
    <alias name="" field="renovation_necessity" index="35"/>
    <alias name="" field="replacement_value" index="36"/>
    <alias name="" field="ring_stiffness" index="15"/>
    <alias name="" field="rp_from_elevation_accuracy" index="53"/>
    <alias name="" field="rp_from_fk_wastewater_networkelement" index="62"/>
    <alias name="" field="rp_from_identifier" index="54"/>
    <alias name="" field="rp_from_last_modification" index="59"/>
    <alias name="" field="rp_from_level" index="55"/>
    <alias name="" field="rp_from_obj_id" index="52"/>
    <alias name="" field="rp_from_outlet_shape" index="56"/>
    <alias name="" field="rp_from_position_of_connection" index="57"/>
    <alias name="" field="rp_from_remark" index="58"/>
    <alias name="" field="rp_to_elevation_accuracy" index="64"/>
    <alias name="" field="rp_to_fk_wastewater_networkelement" index="73"/>
    <alias name="" field="rp_to_identifier" index="65"/>
    <alias name="" field="rp_to_last_modification" index="70"/>
    <alias name="" field="rp_to_level" index="66"/>
    <alias name="" field="rp_to_obj_id" index="63"/>
    <alias name="" field="rp_to_outlet_shape" index="67"/>
    <alias name="" field="rp_to_position_of_connection" index="68"/>
    <alias name="" field="rp_to_remark" index="69"/>
    <alias name="" field="rv_base_year" index="37"/>
    <alias name="" field="rv_construction_type" index="38"/>
    <alias name="" field="slope_building_plan" index="16"/>
    <alias name="" field="slope_per_mill" index="8"/>
    <alias name="" field="status" index="39"/>
    <alias name="" field="structure_condition" index="40"/>
    <alias name="" field="subsidies" index="41"/>
    <alias name="" field="usage_current" index="25"/>
    <alias name="" field="usage_planned" index="26"/>
    <alias name="" field="wall_roughness" index="17"/>
    <alias name="" field="width" index="2"/>
    <alias name="" field="ws_obj_id" index="27"/>
    <alias name="" field="year_of_construction" index="42"/>
    <alias name="" field="year_of_replacement" index="43"/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <attributeactions/>
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
    <attributeEditorContainer name="General" columnCount="0">
      <attributeEditorField name="clear_height" index="1"/>
      <attributeEditorField name="length_effective" index="7"/>
      <attributeEditorField name="material" index="9"/>
      <attributeEditorField name="inside_coating" index="6"/>
      <attributeEditorField name="fk_pipe_profile" index="18"/>
      <attributeEditorField name="dataowner" index="-1"/>
      <attributeEditorField name="rp_from_level" index="55"/>
      <attributeEditorField name="rp_to_level" index="66"/>
      <attributeEditorField name="horizontal_positioning" index="5"/>
      <attributeEditorField name="function_hierarchic" index="20"/>
      <attributeEditorField name="function_hydraulic" index="22"/>
      <attributeEditorField name="usage_current" index="25"/>
      <attributeEditorField name="status" index="39"/>
      <attributeEditorField name="year_of_construction" index="42"/>
      <attributeEditorField name="remark" index="47"/>
    </attributeEditorContainer>
    <attributeEditorContainer name="Reach" columnCount="0">
      <attributeEditorField name="obj_id" index="0"/>
      <attributeEditorField name="clear_height" index="1"/>
      <attributeEditorField name="width" index="2"/>
      <attributeEditorField name="coefficient_of_friction" index="3"/>
      <attributeEditorField name="elevation_determination" index="4"/>
      <attributeEditorField name="horizontal_positioning" index="5"/>
      <attributeEditorField name="inside_coating" index="6"/>
      <attributeEditorField name="length_effective" index="7"/>
      <attributeEditorField name="slope_per_mill" index="8"/>
      <attributeEditorField name="material" index="9"/>
      <attributeEditorField name="progression_3d_geometry" index="10"/>
      <attributeEditorField name="reliner_material" index="11"/>
      <attributeEditorField name="reliner_nominal_size" index="12"/>
      <attributeEditorField name="relining_construction" index="13"/>
      <attributeEditorField name="relining_kind" index="14"/>
      <attributeEditorField name="ring_stiffness" index="15"/>
      <attributeEditorField name="slope_building_plan" index="16"/>
      <attributeEditorField name="wall_roughness" index="17"/>
      <attributeEditorField name="fk_pipe_profile" index="18"/>
    </attributeEditorContainer>
    <attributeEditorContainer name="Wastewater Networkelement" columnCount="0">
      <attributeEditorField name="identifier" index="46"/>
      <attributeEditorField name="remark" index="47"/>
      <attributeEditorField name="last_modification" index="48"/>
      <attributeEditorField name="dataowner" index="-1"/>
      <attributeEditorField name="provider" index="-1"/>
    </attributeEditorContainer>
    <attributeEditorContainer name="Channel" columnCount="0">
      <attributeEditorField name="function_hierarchic" index="20"/>
      <attributeEditorField name="connection_type" index="21"/>
      <attributeEditorField name="function_hydraulic" index="22"/>
      <attributeEditorField name="jetting_interval" index="23"/>
      <attributeEditorField name="pipe_length" index="24"/>
      <attributeEditorField name="usage_current" index="25"/>
      <attributeEditorField name="usage_planned" index="26"/>
    </attributeEditorContainer>
    <attributeEditorContainer name="Wastewater Structure" columnCount="0">
      <attributeEditorField name="ws_obj_id" index="27"/>
      <attributeEditorField name="accessibility" index="28"/>
      <attributeEditorField name="contract_section" index="29"/>
      <attributeEditorField name="financing" index="30"/>
      <attributeEditorField name="gross_costs" index="31"/>
      <attributeEditorField name="inspection_interval" index="32"/>
      <attributeEditorField name="location_name" index="33"/>
      <attributeEditorField name="records" index="34"/>
      <attributeEditorField name="renovation_necessity" index="35"/>
      <attributeEditorField name="replacement_value" index="36"/>
      <attributeEditorField name="rv_base_year" index="37"/>
      <attributeEditorField name="rv_construction_type" index="38"/>
      <attributeEditorField name="status" index="39"/>
      <attributeEditorField name="structure_condition" index="40"/>
      <attributeEditorField name="subsidies" index="41"/>
      <attributeEditorField name="year_of_construction" index="42"/>
      <attributeEditorField name="year_of_replacement" index="43"/>
      <attributeEditorField name="fk_owner" index="44"/>
      <attributeEditorField name="fk_operator" index="45"/>
    </attributeEditorContainer>
    <attributeEditorContainer name="Reach Points" columnCount="0">
      <attributeEditorContainer name="From" columnCount="0">
        <attributeEditorField name="rp_from_obj_id" index="52"/>
        <attributeEditorField name="rp_from_elevation_accuracy" index="53"/>
        <attributeEditorField name="rp_from_identifier" index="54"/>
        <attributeEditorField name="rp_from_level" index="55"/>
        <attributeEditorField name="rp_from_outlet_shape" index="56"/>
        <attributeEditorField name="rp_from_position_of_connection" index="57"/>
        <attributeEditorField name="rp_from_remark" index="58"/>
        <attributeEditorField name="rp_from_last_modification" index="59"/>
        <attributeEditorField name="rp_from_dataowner" index="-1"/>
        <attributeEditorField name="rp_from_provider" index="-1"/>
        <attributeEditorField name="rp_from_fk_wastewater_networkelement" index="62"/>
      </attributeEditorContainer>
      <attributeEditorContainer name="To" columnCount="0">
        <attributeEditorField name="rp_to_obj_id" index="63"/>
        <attributeEditorField name="rp_to_elevation_accuracy" index="64"/>
        <attributeEditorField name="rp_to_identifier" index="65"/>
        <attributeEditorField name="rp_to_level" index="66"/>
        <attributeEditorField name="rp_to_outlet_shape" index="67"/>
        <attributeEditorField name="rp_to_position_of_connection" index="68"/>
        <attributeEditorField name="rp_to_remark" index="69"/>
        <attributeEditorField name="rp_to_last_modification" index="70"/>
        <attributeEditorField name="rp_to_dataowner" index="-1"/>
        <attributeEditorField name="rp_to_provider" index="-1"/>
        <attributeEditorField name="rp_to_fk_wastewater_networkelement" index="73"/>
      </attributeEditorContainer>
    </attributeEditorContainer>
    <attributeEditorContainer name="Maintenance" columnCount="0">
      <attributeEditorRelation name="od_maintenance_event20150530130856307_fk_wastewater_structure_vw_reach20141013202956655_ws_obj_id" relation=""/>
    </attributeEditorContainer>
  </attributeEditorForm>
  <widgets/>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <layerGeometryType>1</layerGeometryType>
</qgis>
