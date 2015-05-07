####################################################
# Ultimate QGIS plugin Makefile
####################################################

# REQUIREMENTS
# 1. This Makefile is for linux environment. It shall be extended to be used on other OS.
# 2. Folder name is the plugin name

# TIPS
# 1. If .ui files are in a subfolder and resources on top level
#     create a file resources_rc.py with:
#     from ..resources_rc import *

####################################################
# CONFIGURATION

# QGIS DIR
QGISDIR = $(HOME)/.qgis2

# i18n
LN_DIR = i18n
TRANSLATED_LANG = fr de

# COMMAND TO RUN DEFAULT APPLICATION (launch a URL)
# Linux 'open' or 'xdg-open' / OSX: 'open' / Win: 'start'
OPEN = xdg-open



###################################################
# DO NOT EDIT BELOW !

PLUGINNAME =$(shell basename $(CURDIR))
VERSION = `cat $(PLUGINNAME)/metadata.txt | grep version | sed 's/version=//'`

PY_FILES = $(filter-out ui_%.py, $(wildcard *.py) $(wildcard **/*.py))
EXTRAS = metadata.txt resources.qrc

UI_SOURCES=$(wildcard *.ui) $(wildcard **/*.ui)
UI_FILES=$(join $(dir $(UI_SOURCES)), $(notdir $(UI_SOURCES:%.ui=%.py)))

RC_SOURCES=$(wildcard *.qrc) $(wildcard **/*.qrc)
RC_FILES=$(join $(dir $(RC_SOURCES)), $(notdir $(RC_SOURCES:%.qrc=%_rc.py)))

LN_SOURCES=$(wildcard *.ts) $(wildcard **/*.ts)
LN_FILES=$(join $(dir $(LN_SOURCES)), $(notdir $(LN_SOURCES:%.ts=%.qm)))

GEN_FILES = ${UI_FILES} ${RC_FILES}

all: $(GEN_FILES)

$(UI_FILES): %.py: %.ui
	pyuic4 -o $@ $<

$(RC_FILES): %_rc.py: %.qrc
	pyrcc4 -o $@ $<

$(LN_FILES): %.qm: %.ts
	lrelease-qt4 $<

clean:
	rm -f $(GEN_FILES) *.pyc
	find $(CURDIR) -iname "*.pyc" -delete

compile: $(UI_FILES) $(RC_FILES) $(LN_FILES)

transup:
	$(foreach lang,$(TRANSLATED_LANG),pylupdate4 -noobsolete $(UI_SOURCES) $(PY_FILES) -ts $(LN_DIR)/$(PLUGINNAME)_$(lang).ts;)

deploy: compile transup
	mkdir -p $(QGISDIR)/python/plugins/$(PLUGINNAME)
	cp -rvf * $(QGISDIR)/python/plugins/$(PLUGINNAME)/
	rm -f $(QGISDIR)/python/plugins/$(PLUGINNAME)/$(PLUGINNAME)*.zip

# The dclean target removes compiled python files from plugin directory
dclean:
	find $(QGISDIR)/python/plugins/$(PLUGINNAME) -iname "*.pyc" -delete
	rm -f $(QGISDIR)/python/plugins/$(PLUGINNAME)/$(PLUGINNAME)*.zip

# The derase deletes deployed plugin
derase:
	rm -Rf $(QGISDIR)/python/plugins/$(PLUGINNAME)

zip: clean deploy dclean
	rm -f $(PLUGINNAME)-$(VERSION).zip
	cd $(QGISDIR)/python/plugins; zip -9r $(CURDIR)/$(PLUGINNAME)-$(VERSION).zip $(PLUGINNAME)

publish: zip
	$(OPEN) http://plugins.qgis.org/plugins/$(PLUGINNAME)/version/add/ &


