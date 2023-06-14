
# Name of output .jar
JAR_TARGET = common.jar
# Relative path to a manifest file if you got one. Else leave empty.
JAR_PATH_TO_MANIFEST =

JAR_OPTIONS := cf

ifdef JAR_PATH_TO_MANIFEST
JAR_OPTIONS := $(JAR_OPTIONS)m
endif

DST_DIR = out
SRC_DIR = src/java

SRC_FILES = $(shell find $(SRC_DIR) -type f -name '*.java')
CLASSES = $(patsubst $(SRC_DIR)/%, $(DST_DIR)/%, $(SRC_FILES:%.java=%.class))


.PHONY: all compile clean jar

all: compile

compile: $(CLASSES)

$(DST_DIR)/%.class: $(SRC_DIR)/%.java
	javac -verbose -g -cp $(DST_DIR) -d $(DST_DIR) -sourcepath $(SRC_DIR) $(SRC_DIR)/$*.java

$(DST_DIR)/$(JAR_TARGET): compile
	cd $(DST_DIR) && jar $(JAR_OPTIONS) temp.jar $(JAR_MANIFEST_PATH) *
	mv $(DST_DIR)/temp.jar $@

jar: $(DST_DIR)/$(JAR_TARGET)

clean:
	rm -rf $(DST_DIR)

