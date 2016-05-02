# whereami-cpp [![Build status](https://travis-ci.org/nabijaczleweli/whereami-cpp.svg?branch=master)](https://travis-ci.org/nabijaczleweli/whereami-cpp) [![Licence](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE)
Locate the current executable and the current module on the file system, in C++

This a C++ port of [whereami](https://github.com/gpakosz/whereami).


### API ref
```c++
namespace whereami {
	/// Returns the full path of the current executable
  std::string executable_path();

	/// Returns the full path of the current module
  std::string module_path();
}
```
