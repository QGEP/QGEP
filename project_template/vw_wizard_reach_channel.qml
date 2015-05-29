<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="2.9.0-Master" minimumScale="-4.65661e-10" maximumScale="1e+08" simplifyDrawingHints="1" minLabelScale="0" maxLabelScale="1e+08" simplifyDrawingTol="1" simplifyMaxScale="1" hasScaleBasedVisibilityFlag="0" simplifyLocal="0" scaleBasedLabelVisibilityFlag="0">
 <edittypes>
  <edittype widgetv2type="Hidden" name="obj_id">
   <widgetv2config fieldEditable="1" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="bedding_encasement">
   <widgetv2config OrderByValue="1" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" Layer="vl_channel_bedding_encasement" Value="value_en" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="connection_type">
   <widgetv2config OrderByValue="1" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" Layer="vl_channel_connection_type" Value="value_en" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="function_hierarchic">
   <widgetv2config OrderByValue="1" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" Layer="vl_channel_function_hierarchic" Value="value_en" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="function_hydraulic">
   <widgetv2config OrderByValue="1" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" Layer="vl_channel_function_hydraulic" Value="value_en" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="Range" name="jetting_interval">
   <widgetv2config AllowNull="1" fieldEditable="1" Step="1" Style="SpinBox" labelOnTop="0" Min="0" Max="20" Suffix=" y"/>
  </edittype>
  <edittype widgetv2type="Range" name="pipe_length">
   <widgetv2config AllowNull="1" fieldEditable="1" Step="100" Style="SpinBox" labelOnTop="0" Min="0" Max="30000" Suffix=" m"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="usage_current">
   <widgetv2config OrderByValue="1" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" Layer="vl_channel_usage_current" Value="value_en" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="usage_planned">
   <widgetv2config OrderByValue="1" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" Layer="vl_channel_usage_planned" Value="value_en" labelOnTop="0" AllowMulti="0"/>
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
   <widgetv2config AllowNull="1" fieldEditable="1" Step="1" Style="SpinBox" labelOnTop="0" Min="0" Max="99999999" Suffix=" CHF"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="identifier">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="Range" name="inspection_interval">
   <widgetv2config AllowNull="1" fieldEditable="1" Step="1" Style="SpinBox" labelOnTop="0" Min="0" Max="20" Suffix=" y"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="location_name">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="records">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="remark">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="renovation_necessity">
   <widgetv2config OrderByValue="1" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" Layer="vl_wastewater_structure_renovation_necessity" Value="value_en" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="Range" name="replacement_value">
   <widgetv2config AllowNull="1" fieldEditable="1" Step="100" Style="SpinBox" labelOnTop="0" Min="0" Max="99999999" Suffix=" CHF"/>
  </edittype>
  <edittype widgetv2type="Range" name="rv_base_year">
   <widgetv2config AllowNull="1" fieldEditable="1" Step="1" Style="SpinBox" labelOnTop="0" Min="0" Max="2020"/>
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
   <widgetv2config AllowNull="1" fieldEditable="1" Step="1" Style="SpinBox" labelOnTop="0" Min="0" Max="99999999" Suffix=" CHF"/>
  </edittype>
  <edittype widgetv2type="Range" name="year_of_construction">
   <widgetv2config AllowNull="1" fieldEditable="1" Step="10" Style="SpinBox" labelOnTop="0" Min="1960" Max="2030"/>
  </edittype>
  <edittype widgetv2type="Range" name="year_of_replacement">
   <widgetv2config AllowNull="1" fieldEditable="1" Step="1" Style="SpinBox" labelOnTop="0" Min="1960" Max="2030"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="last_modification">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="dataowner">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="provider">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="RelationReference" name="fk_owner">
   <widgetv2config OrderByValue="0" fieldEditable="1" ShowForm="0" Relation="vw_wizard_reach_channel-fk_owner" ReadOnly="0" MapIdentification="0" labelOnTop="0" AllowNULL="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="fk_operator">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="Range" name="clear_height">
   <widgetv2config AllowNull="1" fieldEditable="1" Step="10" Style="SpinBox" labelOnTop="0" Min="0" Max="99999" Suffix=" mm"/>
  </edittype>
  <edittype widgetv2type="Range" name="coefficient_of_friction">
   <widgetv2config AllowNull="1" fieldEditable="1" Step="1" Style="SpinBox" labelOnTop="0" Min="0" Max="999" Suffix=" m^(1/3)/s"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="elevation_determination">
   <widgetv2config OrderByValue="1" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" Layer="vl_reach_elevation_determination" Value="value_en" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="horizontal_positioning">
   <widgetv2config OrderByValue="1" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" Layer="vl_reach_horizontal_positioning" Value="value_en" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="inside_coating">
   <widgetv2config OrderByValue="1" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" Layer="vl_reach_inside_coating" Value="value_en" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="Range" name="length_effective">
   <widgetv2config AllowNull="1" fieldEditable="1" Step="1" Style="SpinBox" labelOnTop="0" Min="0" Max="30000" Suffix=" m"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="material">
   <widgetv2config OrderByValue="1" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" Layer="vl_reach_material" Value="value_en" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="reliner_material">
   <widgetv2config OrderByValue="0" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" Layer="vl_reach_reliner_material" Value="value_en" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="Range" name="reliner_nominal_size">
   <widgetv2config AllowNull="1" fieldEditable="1" Step="1" Style="SpinBox" labelOnTop="0" Min="0" Max="1000"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="relining_construction">
   <widgetv2config OrderByValue="1" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" Layer="vl_reach_relining_construction" Value="value_en" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="relining_kind">
   <widgetv2config OrderByValue="1" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" Layer="vl_reach_relining_kind" Value="value_en" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="Range" name="ring_stiffness">
   <widgetv2config AllowNull="1" fieldEditable="1" Step="1" Style="SpinBox" labelOnTop="0" Min="0" Max="1000"/>
  </edittype>
  <edittype widgetv2type="Range" name="slope_building_plan">
   <widgetv2config AllowNull="1" fieldEditable="1" Step="1" Style="SpinBox" labelOnTop="0" Min="0" Max="1000"/>
  </edittype>
  <edittype widgetv2type="Range" name="wall_roughness">
   <widgetv2config AllowNull="1" fieldEditable="1" Step="1" Style="SpinBox" labelOnTop="0" Min="0" Max="100" Suffix=" mm"/>
  </edittype>
  <edittype widgetv2type="RelationReference" name="fk_pipe_profile">
   <widgetv2config OrderByValue="0" fieldEditable="1" ShowForm="0" Relation="vw_wizard_reach_channel-fk_pipe_profile" ReadOnly="0" MapIdentification="0" labelOnTop="0" AllowNULL="0"/>
  </edittype>
  <edittype widgetv2type="Hidden" name="fk_wastewater_structure">
   <widgetv2config fieldEditable="1" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="Hidden" name="rp_from_obj_id">
   <widgetv2config fieldEditable="1" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="rp_from_elevation_accuracy">
   <widgetv2config OrderByValue="1" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" Layer="vl_reach_point_elevation_accuracy" Value="value_en" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="rp_from_identifier">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="Range" name="rp_from_level">
   <widgetv2config AllowNull="1" fieldEditable="1" Step="1" Style="SpinBox" labelOnTop="0" Min="0" Max="4000" Suffix=" m.a.s.l."/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="rp_from_outlet_shape">
   <widgetv2config OrderByValue="1" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" Layer="vl_reach_point_outlet_shape" Value="value_en" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="Range" name="rp_from_position_of_connection">
   <widgetv2config AllowNull="1" fieldEditable="1" Step="1" Style="SpinBox" labelOnTop="0" Min="0" Max="10"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="rp_from_remark">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="Hidden" name="rp_from_last_modification">
   <widgetv2config fieldEditable="1" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="rp_from_dataowner">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="rp_from_provider">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="RelationReference" name="rp_from_fk_wastewater_networkelement">
   <widgetv2config OrderByValue="0" fieldEditable="1" ShowForm="0" Relation="vw_wizard_reach_channel-rp_from_fk_wastewater_networkelement" ReadOnly="0" MapIdentification="0" labelOnTop="0" AllowNULL="0"/>
  </edittype>
  <edittype widgetv2type="Hidden" name="rp_to_obj_id">
   <widgetv2config fieldEditable="1" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="rp_to_elevation_accuracy">
   <widgetv2config OrderByValue="1" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" Layer="vl_reach_point_elevation_accuracy" Value="value_en" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="rp_to_identifier">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="Range" name="rp_to_level">
   <widgetv2config AllowNull="1" fieldEditable="1" Step="1" Style="SpinBox" labelOnTop="0" Min="0" Max="4000" Suffix="m.a.s.l."/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="rp_to_outlet_shape">
   <widgetv2config OrderByValue="1" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" Layer="vl_reach_point_outlet_shape" Value="value_en" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="Range" name="rp_to_position_of_connection">
   <widgetv2config AllowNull="1" fieldEditable="1" Step="1" Style="SpinBox" labelOnTop="0" Min="0" Max="10"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="rp_to_remark">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="Hidden" name="rp_to_last_modification">
   <widgetv2config fieldEditable="1" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="rp_to_dataowner">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="rp_to_provider">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="RelationReference" name="rp_to_fk_wastewater_networkelement">
   <widgetv2config OrderByValue="0" fieldEditable="1" ShowForm="0" Relation="vw_wizard_reach_channel-rp_to_fk_wastewater_networkelement" ReadOnly="0" MapIdentification="0" labelOnTop="0" AllowNULL="0"/>
  </edittype>
 </edittypes>
 <renderer-v2 symbollevels="0" type="singleSymbol">
  <symbols>
   <symbol alpha="1" clip_to_extent="1" type="line" name="0">
    <layer pass="0" class="SimpleLine" locked="0">
     <prop k="capstyle" v="square"/>
     <prop k="customdash" v="5;2"/>
     <prop k="customdash_map_unit_scale" v="0,0"/>
     <prop k="customdash_unit" v="MM"/>
     <prop k="draw_inside_polygon" v="0"/>
     <prop k="joinstyle" v="bevel"/>
     <prop k="line_color" v="155,83,231,255"/>
     <prop k="line_style" v="solid"/>
     <prop k="line_width" v="0.26"/>
     <prop k="line_width_unit" v="MM"/>
     <prop k="offset" v="0"/>
     <prop k="offset_map_unit_scale" v="0,0"/>
     <prop k="offset_unit" v="MM"/>
     <prop k="use_custom_dash" v="0"/>
     <prop k="width_map_unit_scale" v="0,0"/>
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
  <rotation/>
  <sizescale scalemethod="diameter"/>
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
  <property key="labeling/decimals" value="3"/>
  <property key="labeling/displayAll" value="false"/>
  <property key="labeling/dist" value="0"/>
  <property key="labeling/distInMapUnits" value="false"/>
  <property key="labeling/distMapUnitMaxScale" value="0"/>
  <property key="labeling/distMapUnitMinScale" value="0"/>
  <property key="labeling/enabled" value="false"/>
  <property key="labeling/fieldName" value=""/>
  <property key="labeling/fontBold" value="false"/>
  <property key="labeling/fontCapitals" value="0"/>
  <property key="labeling/fontFamily" value="Cantarell"/>
  <property key="labeling/fontItalic" value="false"/>
  <property key="labeling/fontLetterSpacing" value="0"/>
  <property key="labeling/fontLimitPixelSize" value="false"/>
  <property key="labeling/fontMaxPixelSize" value="10000"/>
  <property key="labeling/fontMinPixelSize" value="3"/>
  <property key="labeling/fontSize" value="11"/>
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
  <property key="labeling/namedStyle" value="Regular"/>
  <property key="labeling/obstacle" value="true"/>
  <property key="labeling/placeDirectionSymbol" value="0"/>
  <property key="labeling/placement" value="2"/>
  <property key="labeling/placementFlags" value="10"/>
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
  <property key="labeling/scaleMax" value="10000000"/>
  <property key="labeling/scaleMin" value="1"/>
  <property key="labeling/scaleVisibility" value="false"/>
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
 <displayfield>location_name</displayfield>
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
 <editform>./forms/reach-channel-wizard.ui</editform>
 <editforminit/>
 <featformsuppress>0</featformsuppress>
 <annotationform>.</annotationform>
 <editorlayout>uifilelayout</editorlayout>
 <aliases>
  <alias field="accessibility" index="9" name="%#vw_wizard_reach_channel#accessibility#name#%"/>
  <alias field="bedding_encasement" index="1" name="%#vw_wizard_reach_channel#bedding_encasement#name#%"/>
  <alias field="clear_height" index="32" name="%#vw_wizard_reach_channel#clear_height#name#%"/>
  <alias field="coefficient_of_friction" index="33" name="%#vw_wizard_reach_channel#coefficient_of_friction#name#%"/>
  <alias field="connection_type" index="2" name="%#vw_wizard_reach_channel#connection_type#name#%"/>
  <alias field="contract_section" index="10" name="%#vw_wizard_reach_channel#contract_section#name#%"/>
  <alias field="dataowner" index="28" name="%#vw_wizard_reach_channel#dataowner#name#%"/>
  <alias field="elevation_determination" index="34" name="%#vw_wizard_reach_channel#elevation_determination#name#%"/>
  <alias field="financing" index="11" name="%#vw_wizard_reach_channel#financing#name#%"/>
  <alias field="fk_operator" index="31" name="%#vw_wizard_reach_channel#fk_operator#name#%"/>
  <alias field="fk_owner" index="30" name="%#vw_wizard_reach_channel#fk_owner#name#%"/>
  <alias field="fk_pipe_profile" index="46" name="%#vw_wizard_reach_channel#fk_pipe_profile#name#%"/>
  <alias field="fk_wastewater_structure" index="47" name="%#vw_wizard_reach_channel#fk_wastewater_structure#name#%"/>
  <alias field="function_hierarchic" index="3" name="%#vw_wizard_reach_channel#function_hierarchic#name#%"/>
  <alias field="function_hydraulic" index="4" name="%#vw_wizard_reach_channel#function_hydraulic#name#%"/>
  <alias field="gross_costs" index="12" name="%#vw_wizard_reach_channel#gross_costs#name#%"/>
  <alias field="horizontal_positioning" index="35" name="%#vw_wizard_reach_channel#horizontal_positioning#name#%"/>
  <alias field="identifier" index="13" name="%#vw_wizard_reach_channel#identifier#name#%"/>
  <alias field="inside_coating" index="36" name="%#vw_wizard_reach_channel#inside_coating#name#%"/>
  <alias field="inspection_interval" index="14" name="%#vw_wizard_reach_channel#inspection_interval#name#%"/>
  <alias field="jetting_interval" index="5" name="%#vw_wizard_reach_channel#jetting_interval#name#%"/>
  <alias field="last_modification" index="27" name="%#vw_wizard_reach_channel#last_modification#name#%"/>
  <alias field="length_effective" index="37" name="%#vw_wizard_reach_channel#length_effective#name#%"/>
  <alias field="location_name" index="15" name="%#vw_wizard_reach_channel#location_name#name#%"/>
  <alias field="material" index="38" name="%#vw_wizard_reach_channel#material#name#%"/>
  <alias field="pipe_length" index="6" name="%#vw_wizard_reach_channel#pipe_length#name#%"/>
  <alias field="provider" index="29" name="%#vw_wizard_reach_channel#provider#name#%"/>
  <alias field="records" index="16" name="%#vw_wizard_reach_channel#records#name#%"/>
  <alias field="reliner_material" index="39" name="%#vw_wizard_reach_channel#reliner_material#name#%"/>
  <alias field="reliner_nominal_size" index="40" name="%#vw_wizard_reach_channel#reliner_nominal_size#name#%"/>
  <alias field="relining_construction" index="41" name="%#vw_wizard_reach_channel#relining_construction#name#%"/>
  <alias field="relining_kind" index="42" name="%#vw_wizard_reach_channel#relining_kind#name#%"/>
  <alias field="remark" index="17" name="%#vw_wizard_reach_channel#remark#name#%"/>
  <alias field="renovation_necessity" index="18" name="%#vw_wizard_reach_channel#renovation_necessity#name#%"/>
  <alias field="replacement_value" index="19" name="%#vw_wizard_reach_channel#replacement_value#name#%"/>
  <alias field="ring_stiffness" index="43" name="%#vw_wizard_reach_channel#ring_stiffness#name#%"/>
  <alias field="rp_from_dataowner" index="56" name="%#vw_wizard_reach_channel#rp_from_dataowner#name#%"/>
  <alias field="rp_from_elevation_accuracy" index="49" name="%#vw_wizard_reach_channel#rp_from_elevation_accuracy#name#%"/>
  <alias field="rp_from_fk_wastewater_networkelement" index="58" name="%#vw_wizard_reach_channel#rp_from_fk_wastewater_networkelement#name#%"/>
  <alias field="rp_from_identifier" index="50" name="%#vw_wizard_reach_channel#rp_from_identifier#name#%"/>
  <alias field="rp_from_last_modification" index="55" name="%#vw_wizard_reach_channel#rp_from_last_modification#name#%"/>
  <alias field="rp_from_level" index="51" name="%#vw_wizard_reach_channel#rp_from_level#name#%"/>
  <alias field="rp_from_obj_id" index="48" name="%#vw_wizard_reach_channel#rp_from_obj_id#name#%"/>
  <alias field="rp_from_outlet_shape" index="52" name="%#vw_wizard_reach_channel#rp_from_outlet_shape#name#%"/>
  <alias field="rp_from_position_of_connection" index="53" name="%#vw_wizard_reach_channel#rp_from_position_of_connection#name#%"/>
  <alias field="rp_from_provider" index="57" name="%#vw_wizard_reach_channel#rp_from_provider#name#%"/>
  <alias field="rp_from_remark" index="54" name="%#vw_wizard_reach_channel#rp_from_remark#name#%"/>
  <alias field="rp_to_dataowner" index="67" name="%#vw_wizard_reach_channel#rp_to_dataowner#name#%"/>
  <alias field="rp_to_elevation_accuracy" index="60" name="%#vw_wizard_reach_channel#rp_to_elevation_accuracy#name#%"/>
  <alias field="rp_to_fk_wastewater_networkelement" index="69" name="%#vw_wizard_reach_channel#rp_to_fk_wastewater_networkelement#name#%"/>
  <alias field="rp_to_identifier" index="61" name="%#vw_wizard_reach_channel#rp_to_identifier#name#%"/>
  <alias field="rp_to_last_modification" index="66" name="%#vw_wizard_reach_channel#rp_to_last_modification#name#%"/>
  <alias field="rp_to_level" index="62" name="%#vw_wizard_reach_channel#rp_to_level#name#%"/>
  <alias field="rp_to_obj_id" index="59" name="%#vw_wizard_reach_channel#rp_to_obj_id#name#%"/>
  <alias field="rp_to_outlet_shape" index="63" name="%#vw_wizard_reach_channel#rp_to_outlet_shape#name#%"/>
  <alias field="rp_to_position_of_connection" index="64" name="%#vw_wizard_reach_channel#rp_to_position_of_connection#name#%"/>
  <alias field="rp_to_provider" index="68" name="%#vw_wizard_reach_channel#rp_to_provider#name#%"/>
  <alias field="rp_to_remark" index="65" name="%#vw_wizard_reach_channel#rp_to_remark#name#%"/>
  <alias field="rv_base_year" index="20" name="%#vw_wizard_reach_channel#rv_base_year#name#%"/>
  <alias field="rv_construction_type" index="21" name="%#vw_wizard_reach_channel#rv_construction_type#name#%"/>
  <alias field="slope_building_plan" index="44" name="%#vw_wizard_reach_channel#slope_building_plan#name#%"/>
  <alias field="status" index="22" name="%#vw_wizard_reach_channel#status#name#%"/>
  <alias field="structure_condition" index="23" name="%#vw_wizard_reach_channel#structure_condition#name#%"/>
  <alias field="subsidies" index="24" name="%#vw_wizard_reach_channel#subsidies#name#%"/>
  <alias field="usage_current" index="7" name="%#vw_wizard_reach_channel#usage_current#name#%"/>
  <alias field="usage_planned" index="8" name="%#vw_wizard_reach_channel#usage_planned#name#%"/>
  <alias field="wall_roughness" index="45" name="%#vw_wizard_reach_channel#wall_roughness#name#%"/>
  <alias field="year_of_construction" index="25" name="%#vw_wizard_reach_channel#year_of_construction#name#%"/>
  <alias field="year_of_replacement" index="26" name="%#vw_wizard_reach_channel#year_of_replacement#name#%"/>
 </aliases>
 <excludeAttributesWMS/>
 <excludeAttributesWFS/>
 <attributeactions/>
</qgis>
