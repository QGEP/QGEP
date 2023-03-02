<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis styleCategories="Symbology|Forms" version="3.22.6-Białowieża">
  <fieldConfiguration>
    <field name="fk_material">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option type="bool" name="AllowMulti" value="false"/>
            <Option type="bool" name="AllowNull" value="false"/>
            <Option type="QString" name="Description" value=""/>
            <Option type="QString" name="FilterExpression" value=""/>
            <Option type="QString" name="Key" value="vsacode"/>
            <Option type="QString" name="Layer" value="vl_reach_material"/>
            <Option type="QString" name="LayerName" value="vl_reach_material"/>
            <Option type="QString" name="LayerProviderName" value="postgres"/>
            <Option type="QString" name="LayerSource" value="service='pg_qgep' key='code' checkPrimaryKeyUnicity='1' table=&quot;qgep_vl&quot;.&quot;reach_material&quot;"/>
            <Option type="int" name="NofColumns" value="1"/>
            <Option type="bool" name="OrderByValue" value="false"/>
            <Option type="bool" name="UseCompleter" value="false"/>
            <Option type="QString" name="Value" value="value_fr"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="coefficient_of_friction">
      <editWidget type="Range">
        <config>
          <Option type="Map">
            <Option type="bool" name="AllowNull" value="true"/>
            <Option type="int" name="Max" value="2147483647"/>
            <Option type="int" name="Min" value="-2147483648"/>
            <Option type="int" name="Precision" value="0"/>
            <Option type="int" name="Step" value="1"/>
            <Option type="QString" name="Style" value="SpinBox"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="vl_reach_material_value_fr">
      <editWidget type="Hidden">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <editform tolerant="1"></editform>
  <editforminit/>
  <editforminitcodesource>0</editforminitcodesource>
  <editforminitfilepath></editforminitfilepath>
  <editforminitcode><![CDATA[# -*- coding: utf-8 -*-
"""
Les formulaires QGIS peuvent avoir une fonction Python qui est appelée lorsque le formulaire est
ouvert.

Utilisez cette fonction pour ajouter une logique supplémentaire à vos formulaires.

Entrez le nom de la fonction dans le champ 
"Fonction d'initialisation Python".
Voici un exemple:
"""
from qgis.PyQt.QtWidgets import QWidget

def my_form_open(dialog, layer, feature):
    geom = feature.geometry()
    control = dialog.findChild(QWidget, "MyLineEdit")
]]></editforminitcode>
  <featformsuppress>0</featformsuppress>
  <editorlayout>tablayout</editorlayout>
  <attributeEditorForm>
    <attributeEditorField index="0" name="fk_material" showLabel="1"/>
    <attributeEditorField index="1" name="coefficient_of_friction" showLabel="1"/>
  </attributeEditorForm>
  <editable>
    <field name="coefficient_of_friction" editable="1"/>
    <field name="fk_material" editable="0"/>
    <field name="vl_reach_material_value_fr" editable="0"/>
  </editable>
  <labelOnTop>
    <field name="coefficient_of_friction" labelOnTop="0"/>
    <field name="fk_material" labelOnTop="0"/>
    <field name="vl_reach_material_value_fr" labelOnTop="0"/>
  </labelOnTop>
  <reuseLastValue>
    <field reuseLastValue="0" name="coefficient_of_friction"/>
    <field reuseLastValue="0" name="fk_material"/>
    <field reuseLastValue="0" name="vl_reach_material_value_fr"/>
  </reuseLastValue>
  <dataDefinedFieldProperties/>
  <widgets/>
  <layerGeometryType>4</layerGeometryType>
</qgis>
