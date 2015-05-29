<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="2.9.0-Master" minimumScale="0" maximumScale="1e+08" simplifyDrawingHints="0" minLabelScale="0" maxLabelScale="1e+08" simplifyDrawingTol="1" simplifyMaxScale="1" hasScaleBasedVisibilityFlag="0" simplifyLocal="0" scaleBasedLabelVisibilityFlag="0">
 <edittypes>
  <edittype widgetv2type="Hidden" name="obj_id">
   <widgetv2config fieldEditable="1" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="brand">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="cover_shape">
   <widgetv2config OrderByValue="1" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" Layer="vl_cover_cover_shape" Value="value_en" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="Range" name="diameter">
   <widgetv2config AllowNull="1" fieldEditable="1" Step="10" Style="SpinBox" labelOnTop="0" Min="0" Max="9999" Suffix=" mm."/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="fastening">
   <widgetv2config OrderByValue="1" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" Layer="vl_cover_fastening" Value="value_en" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="Range" name="level">
   <widgetv2config AllowNull="1" fieldEditable="1" Step="1" Style="SpinBox" labelOnTop="0" Min="0" Max="4000"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="cover_material">
   <widgetv2config OrderByValue="1" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" Layer="vl_cover_material" Value="value_en" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="positional_accuracy">
   <widgetv2config OrderByValue="1" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" Layer="vl_cover_positional_accuracy" Value="value_en" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="sludge_bucket">
   <widgetv2config OrderByValue="1" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" Layer="vl_cover_sludge_bucket" Value="value_en" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="venting">
   <widgetv2config OrderByValue="1" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" Layer="vl_cover_venting" Value="value_en" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="identifier">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="remark">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="renovation_demand">
   <widgetv2config OrderByValue="1" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" Layer="vl_structure_part_renovation_demand" Value="value_en" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="dataowner">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="provider">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="Hidden" name="special_structure_obj_id">
   <widgetv2config fieldEditable="1" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="bypass">
   <widgetv2config OrderByValue="1" AllowNull="1" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" Layer="vl_special_structure_bypass" Value="value_en" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="Range" name="depth">
   <widgetv2config AllowNull="1" fieldEditable="1" Step="1" Style="SpinBox" labelOnTop="0" Min="0" Max="10000" Suffix=" mm."/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="emergency_spillway">
   <widgetv2config OrderByValue="1" AllowNull="1" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" Layer="vl_special_structure_emergency_spillway" Value="value_en" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="function">
   <widgetv2config OrderByValue="1" AllowNull="1" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" Layer="vl_special_structure_function" Value="value_en" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="stormwater_tank_arrangement">
   <widgetv2config OrderByValue="1" AllowNull="1" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" Layer="vl_special_structure_stormwater_tank_arrangement" Value="value_en" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="Range" name="upper_elevation">
   <widgetv2config AllowNull="1" fieldEditable="1" Step="10" Style="SpinBox" labelOnTop="0" Min="0" Max="4000" Suffix=" m.a.s.l."/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="accessibility">
   <widgetv2config OrderByValue="1" AllowNull="1" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" Layer="vl_wastewater_structure_accessibility" Value="value_en" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="contract_section">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="Hidden" name="detail_geometry_geometry">
   <widgetv2config fieldEditable="1" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="Hidden" name="detail_geometry_3d_geometry">
   <widgetv2config fieldEditable="1" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="financing">
   <widgetv2config OrderByValue="1" AllowNull="1" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" Layer="vl_wastewater_structure_financing" Value="value_en" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="Range" name="gross_costs">
   <widgetv2config AllowNull="1" fieldEditable="1" Step="1" Style="SpinBox" labelOnTop="0" Min="0" Max="100000" Suffix=" CHF."/>
  </edittype>
  <edittype widgetv2type="Range" name="inspection_interval">
   <widgetv2config AllowNull="1" fieldEditable="1" Step="1" Style="SpinBox" labelOnTop="0" Min="0" Max="1000"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="location_name">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="records">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="renovation_necessity">
   <widgetv2config OrderByValue="1" AllowNull="1" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" Layer="vl_wastewater_structure_renovation_necessity" Value="value_en" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="Range" name="replacement_value">
   <widgetv2config AllowNull="1" fieldEditable="1" Step="1" Style="SpinBox" labelOnTop="0" Min="0" Max="100000"/>
  </edittype>
  <edittype widgetv2type="Range" name="rv_base_year">
   <widgetv2config AllowNull="1" fieldEditable="1" Step="1" Style="SpinBox" labelOnTop="0" Min="1900" Max="2100"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="rv_construction_type">
   <widgetv2config OrderByValue="1" AllowNull="1" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="value_en" Layer="vl_reach_relining_construction" Value="value_en" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="status">
   <widgetv2config OrderByValue="1" AllowNull="1" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" Layer="vl_wastewater_structure_status" Value="value_en" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="structure_condition">
   <widgetv2config OrderByValue="1" AllowNull="1" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" Layer="vl_wastewater_structure_structure_condition" Value="value_en" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="Range" name="subsidies">
   <widgetv2config AllowNull="1" fieldEditable="1" Step="1" Style="SpinBox" labelOnTop="0" Min="0" Max="100000"/>
  </edittype>
  <edittype widgetv2type="Range" name="year_of_construction">
   <widgetv2config AllowNull="1" fieldEditable="1" Step="1" Style="SpinBox" labelOnTop="0" Min="1900" Max="2100"/>
  </edittype>
  <edittype widgetv2type="Range" name="year_of_replacement">
   <widgetv2config AllowNull="1" fieldEditable="1" Step="1" Style="SpinBox" labelOnTop="0" Min="1900" Max="2100"/>
  </edittype>
  <edittype widgetv2type="RelationReference" name="fk_owner">
   <widgetv2config OrderByValue="1" fieldEditable="1" ShowForm="0" Relation="vw_wizard_cover_special_structure-fk_owner-od_organization" ReadOnly="0" MapIdentification="0" labelOnTop="0" AllowNULL="1"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="fk_operator">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="Range" name="backflow_level">
   <widgetv2config AllowNull="1" fieldEditable="1" Step="1" Style="SpinBox" labelOnTop="0" Min="0" Max="4000" Suffix=" m.a.s.l."/>
  </edittype>
  <edittype widgetv2type="Range" name="bottom_level">
   <widgetv2config AllowNull="1" fieldEditable="1" Step="1" Style="SpinBox" labelOnTop="0" Min="0" Max="4000" Suffix=" m.a.s.l."/>
  </edittype>
 </edittypes>
 <renderer-v2 symbollevels="0" type="singleSymbol">
  <symbols>
   <symbol alpha="1" clip_to_extent="1" type="marker" name="0">
    <layer pass="0" class="SimpleMarker" locked="0">
     <prop k="angle" v="0"/>
     <prop k="color" v="151,53,127,255"/>
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
  <property key="labeling/repeatDistanceUnit" value="2"/>
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
 <editform>./forms/cover-special_structure-wizard.ui</editform>
 <editforminit/>
 <featformsuppress>0</featformsuppress>
 <annotationform>.</annotationform>
 <editorlayout>uifilelayout</editorlayout>
 <aliases>
  <alias field="accessibility" index="22" name="%#vw_wizard_cover_special_structure#accessibility#name#%"/>
  <alias field="backflow_level" index="42" name="%#vw_wizard_cover_special_structure#backflow_level#name#%"/>
  <alias field="bottom_level" index="43" name="%#vw_wizard_cover_special_structure#bottom_level#name#%"/>
  <alias field="brand" index="1" name="%#vw_wizard_cover_special_structure#brand#name#%"/>
  <alias field="bypass" index="16" name="%#vw_wizard_cover_special_structure#bypass#name#%"/>
  <alias field="contract_section" index="23" name="%#vw_wizard_cover_special_structure#contract_section#name#%"/>
  <alias field="cover_material" index="6" name="%#vw_wizard_cover_special_structure#cover_material#name#%"/>
  <alias field="cover_shape" index="2" name="%#vw_wizard_cover_special_structure#cover_shape#name#%"/>
  <alias field="dataowner" index="13" name="%#vw_wizard_cover_special_structure#dataowner#name#%"/>
  <alias field="depth" index="17" name="%#vw_wizard_cover_special_structure#depth#name#%"/>
  <alias field="detail_geometry_3d_geometry" index="25" name="%#vw_wizard_cover_special_structure#detail_geometry_3d_geometry#name#%"/>
  <alias field="detail_geometry_geometry" index="24" name="%#vw_wizard_cover_special_structure#detail_geometry_geometry#name#%"/>
  <alias field="diameter" index="3" name="%#vw_wizard_cover_special_structure#diameter#name#%"/>
  <alias field="emergency_spillway" index="18" name="%#vw_wizard_cover_special_structure#emergency_spillway#name#%"/>
  <alias field="fastening" index="4" name="%#vw_wizard_cover_special_structure#fastening#name#%"/>
  <alias field="financing" index="26" name="%#vw_wizard_cover_special_structure#financing#name#%"/>
  <alias field="fk_operator" index="41" name="%#vw_wizard_cover_special_structure#fk_operator#name#%"/>
  <alias field="fk_owner" index="40" name="%#vw_wizard_cover_special_structure#fk_owner#name#%"/>
  <alias field="function" index="19" name="%#vw_wizard_cover_special_structure#function#name#%"/>
  <alias field="gross_costs" index="27" name="%#vw_wizard_cover_special_structure#gross_costs#name#%"/>
  <alias field="identifier" index="10" name="%#vw_wizard_cover_special_structure#identifier#name#%"/>
  <alias field="inspection_interval" index="28" name="%#vw_wizard_cover_special_structure#inspection_interval#name#%"/>
  <alias field="level" index="5" name="%#vw_wizard_cover_special_structure#level#name#%"/>
  <alias field="location_name" index="29" name="%#vw_wizard_cover_special_structure#location_name#name#%"/>
  <alias field="positional_accuracy" index="7" name="%#vw_wizard_cover_special_structure#positional_accuracy#name#%"/>
  <alias field="provider" index="14" name="%#vw_wizard_cover_special_structure#provider#name#%"/>
  <alias field="records" index="30" name="%#vw_wizard_cover_special_structure#records#name#%"/>
  <alias field="remark" index="11" name="%#vw_wizard_cover_special_structure#remark#name#%"/>
  <alias field="renovation_demand" index="12" name="%#vw_wizard_cover_special_structure#renovation_demand#name#%"/>
  <alias field="renovation_necessity" index="31" name="%#vw_wizard_cover_special_structure#renovation_necessity#name#%"/>
  <alias field="replacement_value" index="32" name="%#vw_wizard_cover_special_structure#replacement_value#name#%"/>
  <alias field="rv_base_year" index="33" name="%#vw_wizard_cover_special_structure#rv_base_year#name#%"/>
  <alias field="rv_construction_type" index="34" name="%#vw_wizard_cover_special_structure#rv_construction_type#name#%"/>
  <alias field="sludge_bucket" index="8" name="%#vw_wizard_cover_special_structure#sludge_bucket#name#%"/>
  <alias field="special_structure_obj_id" index="15" name="%#vw_wizard_cover_special_structure#special_structure_obj_id#name#%"/>
  <alias field="status" index="35" name="%#vw_wizard_cover_special_structure#status#name#%"/>
  <alias field="stormwater_tank_arrangement" index="20" name="%#vw_wizard_cover_special_structure#stormwater_tank_arrangement#name#%"/>
  <alias field="structure_condition" index="36" name="%#vw_wizard_cover_special_structure#structure_condition#name#%"/>
  <alias field="subsidies" index="37" name="%#vw_wizard_cover_special_structure#subsidies#name#%"/>
  <alias field="upper_elevation" index="21" name="%#vw_wizard_cover_special_structure#upper_elevation#name#%"/>
  <alias field="venting" index="9" name="%#vw_wizard_cover_special_structure#venting#name#%"/>
  <alias field="year_of_construction" index="38" name="%#vw_wizard_cover_special_structure#year_of_construction#name#%"/>
  <alias field="year_of_replacement" index="39" name="%#vw_wizard_cover_special_structure#year_of_replacement#name#%"/>
 </aliases>
 <excludeAttributesWMS/>
 <excludeAttributesWFS/>
 <attributeactions/>
</qgis>
