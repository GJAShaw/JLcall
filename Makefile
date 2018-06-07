# ------------------------------------------------------------------------------
# Makefile
# GNU makefile
# project: JLcall
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# variables
# ------------------------------------------------------------------------------

# release deliverables
release_dir := ./release
class_name := JLcall
dll_loadname := lcall
dll_filename := lib$(dll_loadname).so
package_name := com.avalokita.jlcall
package_path := $(subst .,/,$(package_name))

# C-related for JNI
CC := gcc
gcc_obj_opts := -g3 -ggdb3 -O0 -Wall
hdr_file := $(subst .,_,$(package_name))_$(class_name).h
include_dir := ./jni/include
csrc_dir := ./jni/src
csrc_file := $(subst .h,.c,$(hdr_file))

# Java-related
JAVA := java
JAVAC := javac
JAVAH := javah
JAVA_HOME := /usr/local/jdk1.8.0_152
src_dir := ./src

# test class
test_class := JLtest

# RM
RM := rm -fR

# file target name variables
appclass := $(release_dir)/$(package_path)/$(class_name).class
dll := $(release_dir)/$(dll_filename)
header := $(include_dir)/$(hdr_file)
testclass := $(release_dir)/$(test_class).class

# ------------------------------------------------------------------------------
# rules
# ------------------------------------------------------------------------------

# --------------------------------------
# all
# --------------------------------------
all: $(appclass) $(dll)

# --------------------------------------
# .ONESHELL
# --------------------------------------
.ONESHELL:

# --------------------------------------
# .PHONY
# --------------------------------------
.PHONY: .ONESHELL all clean tester testrun

# --------------------------------------
# class compilation
# --------------------------------------
$(release_dir)/%.class: $(src_dir)/%.java
	@echo "Compiling class $@"
	@$(JAVAC) -cp $(release_dir) -d $(release_dir) "$<"

# --------------------------------------
# JNI header creation
# --------------------------------------
$(header): $(class)
	@echo "Creating header $@"
	@$(JAVAH) -cp $(release_dir) -d $(include_dir) $(package_name).$(class_name)


# --------------------------------------
# dll compilation
# --------------------------------------
$(dll): $(csrc_dir)/$(csrc_file) $(header)
	@echo "Compiling dll $@"
	@$(CC) -I"$(JAVA_HOME)/include" -I"$(JAVA_HOME)/include/linux" \
		-I"$(include_dir)" -fPIC -shared -o "$@" "$<"

# --------------------------------------
# JLcall class compilation
# --------------------------------------
appclass: $(appclass)

# --------------------------------------
# JLtest class compilation
# --------------------------------------
tester: $(testclass)

# --------------------------------------
# JLtest run
# --------------------------------------
testrun:
	@$(JAVA) -cp $(release_dir) -Djava.library.path=$(release_dir) $(test_class)

# --------------------------------------
# clean
# --------------------------------------
clean:
	@echo "Deleting all targets and intermediate files"
	-@$(RM) $(release_dir)/$(package_path)/$(class_name).class
	-@$(RM) $(release_dir)/$(dll_filename)
	-@$(RM) $(include_dir)/$(hdr_file)
	-@$(RM) $(release_dir)/$(test_class).class

# ------------------------------------------------------------------------------
# EOF
# ------------------------------------------------------------------------------

