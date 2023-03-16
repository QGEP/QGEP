<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="2.11.0-Master" minimumScale="-4.65661e-10" maximumScale="1e+08" hasScaleBasedVisibilityFlag="0">
 <edittypes>
  <edittype widgetv2type="Hidden" name="obj_id">
   <widgetv2config fieldEditable="1" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="bedding_encasement">
   <widgetv2config OrderByValue="0" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" Layer="vl_channel_bedding_encasement" Value="value_en" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="connection_type">
   <widgetv2config OrderByValue="0" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" Layer="vl_channel_connection_type" Value="value_en" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="function_hierarchic">
   <widgetv2config OrderByValue="0" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" Layer="vl_channel_function_hierarchic" Value="value_en" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="function_hydraulic">
   <widgetv2config OrderByValue="0" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" Layer="vl_channel_function_hydraulic" Value="value_en" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="jetting_interval">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="pipe_length">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="usage_current">
   <widgetv2config OrderByValue="0" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" Layer="vl_channel_usage_current" Value="value_en" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="usage_planned">
   <widgetv2config OrderByValue="0" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" Layer="vl_channel_usage_planned" Value="value_en" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="accessibility">
   <widgetv2config OrderByValue="1" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" Layer="vl_wastewater_structure_accessibility" Value="value_en" labelOnTop="0" AllowMulti="0"/>
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
   <widgetv2config OrderByValue="0" AllowNull="1" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="code" Layer="vl_wastewater_structure_financing" Value="value_en" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="Range" name="gross_costs">
   <widgetv2config AllowNull="1" fieldEditable="1" Step="1" Style="SpinBox" labelOnTop="0" Min="0" Max="5"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="identifier">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
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
  <edittype widgetv2type="TextEdit" name="remark">
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
   <widgetv2config AllowNull="1" fieldEditable="1" Step="1" Style="SpinBox" labelOnTop="0" Min="1900" Max="2100"/>
  </edittype>
  <edittype widgetv2type="Range" name="year_of_replacement">
   <widgetv2config AllowNull="1" fieldEditable="1" Step="1" Style="SpinBox" labelOnTop="0" Min="1900" Max="2100"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="last_modification">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="UniqueValues" name="dataowner">
   <widgetv2config fieldEditable="1" labelOnTop="0" Editable="1"/>
  </edittype>
  <edittype widgetv2type="UniqueValues" name="provider">
   <widgetv2config fieldEditable="1" labelOnTop="0" Editable="1"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="fk_owner">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="fk_operator">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
 </edittypes>
 <editform>./forms/channel.ui</editform>
 <editforminit/>
 <featformsuppress>0</featformsuppress>
 <annotationform>.</annotationform>
 <editorlayout>uifilelayout</editorlayout>
 <aliases>
  <alias field="accessibility" index="9" name=""/>
  <alias field="bedding_encasement" index="1" name=""/>
  <alias field="connection_type" index="2" name=""/>
  <alias field="contract_section" index="10" name=""/>
  <alias field="dataowner" index="30" name=""/>
  <alias field="detail_geometry_3d_geometry" index="12" name=""/>
  <alias field="detail_geometry_geometry" index="11" name=""/>
  <alias field="financing" index="13" name=""/>
  <alias field="fk_operator" index="33" name=""/>
  <alias field="fk_owner" index="32" name=""/>
  <alias field="function_hierarchic" index="3" name=""/>
  <alias field="function_hydraulic" index="4" name=""/>
  <alias field="gross_costs" index="14" name=""/>
  <alias field="identifier" index="15" name=""/>
  <alias field="inspection_interval" index="16" name=""/>
  <alias field="jetting_interval" index="5" name=""/>
  <alias field="last_modification" index="29" name=""/>
  <alias field="location_name" index="17" name=""/>
  <alias field="obj_id" index="0" name=""/>
  <alias field="pipe_length" index="6" name=""/>
  <alias field="provider" index="31" name=""/>
  <alias field="records" index="18" name=""/>
  <alias field="remark" index="19" name=""/>
  <alias field="renovation_necessity" index="20" name=""/>
  <alias field="replacement_value" index="21" name=""/>
  <alias field="rv_base_year" index="22" name=""/>
  <alias field="rv_construction_type" index="23" name=""/>
  <alias field="status" index="24" name=""/>
  <alias field="structure_condition" index="25" name=""/>
  <alias field="subsidies" index="26" name=""/>
  <alias field="usage_current" index="7" name=""/>
  <alias field="usage_planned" index="8" name=""/>
  <alias field="year_of_construction" index="27" name=""/>
  <alias field="year_of_replacement" index="28" name=""/>
 </aliases>
 <excludeAttributesWMS/>
 <excludeAttributesWFS/>
 <attributeactions/>
</qgis>
