# whereami-cpp [![Build status](https://travis-ci.org/nabijaczleweli/whereami-cpp.svg?branch=master)](https://travis-ci.org/nabijaczleweli/whereami-cpp) [![Licence](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE)
Locate the current executable and the current module on the file system, in C++

This a C++ port of [whereami](https://github.com/gpakosz/whereami).


### API ref
```c++
namespace whereami {
  /// Returns the full path of the current executable or an empty string on failure
  std::string executable_path();

  /// Returns the full path of the current module or an empty string on failure
  std::string module_path();

  /// Returns the filename of the current executable or an empty string on failure
  std::string executable_name();

  /// Returns the filename of the current module or an empty string on failure
  std::string module_name();

  /// Returns the directory of the current executable or an empty string on failure
  std::string executable_dir();

  /// Returns the directory of the current module or an empty string on failure
  std::string module_dir();
}
```
