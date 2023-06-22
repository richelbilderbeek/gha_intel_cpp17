#include <cassert>
#include <iostream>
#include <optional>
#include <string>

int main()
{
  static_assert("C++17");

  #ifdef __GNUC__
  #warning GNUC is defined in this example :-/
  #endif

  #ifdef clang
  #warning clang is defined in this example :-/
  #endif

  // If you know an Intel compiler specific flag, please let me know :-)

  const std::optional<std::string> maybe_string("Hello world");
  assert(maybe_string.has_value());
  std::cout << maybe_string.value() << '\n';
}
