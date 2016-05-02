# The MIT License (MIT)

# Copyright (c) 2016 нabijaczleweli

# Permission is hereby granted, free of charge, to any person obtaining a copy of
# this software and associated documentation files (the "Software"), to deal in
# the Software without restriction, including without limitation the rights to
# use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
# the Software, and to permit persons to whom the Software is furnished to do so,
# subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
# FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
# COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
# IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
# CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


include configMakefile


SOURCES := $(wildcard source/*.cpp)


.PHONY : clean all whereami dll stlib

all : whereami dll stlib

clean :
	rm -rf $(BUILD)

whereami : $(BUILD)/lib/libwhereami$(ARCH)
dll : whereami $(BUILD)/$(PREDLL)whereami++$(DLL)
stlib : whereami $(BUILD)/libwhereami++$(ARCH)


$(BUILD)/lib/libwhereami$(ARCH) : $(BUILD)/obj/whereami/whereami.o
	@mkdir -p $(dir $@)
	ar crs $@ $^

$(BUILD)/obj/whereami/whereami.o : external/whereami/src/whereami.c
	@mkdir -p $(dir $@)
	$(CC) $(CAR) -isystemexternal/whereami/src -c -o$@ $^

$(BUILD)/$(PREDLL)whereami++$(DLL) : $(patsubst source/%.cpp,$(BUILD)/obj/%$(OBJ),$(SOURCES))
	$(CXX) $(CXXAR) -L$(BUILD)/lib -shared -o$@ $^ -lwhereami

$(BUILD)/libwhereami++$(ARCH) : $(patsubst source/%.cpp,$(BUILD)/obj/%$(OBJ),$(SOURCES)) $(BUILD)/obj/whereami/whereami.o
	ar crs $@ $^


$(BUILD)/obj/%$(OBJ) : source/%.cpp
	@mkdir -p $(dir $@)
	$(CXX) $(CXXAR) -Iinclude -Iexternal/whereami/src -c -o$@ $^
