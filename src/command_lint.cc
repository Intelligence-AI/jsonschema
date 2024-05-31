#include <sourcemeta/jsontoolkit/json.h>
#include <sourcemeta/jsontoolkit/jsonschema.h>

#include <cstdlib>  // EXIT_SUCCESS
#include <iostream> // std::cerr, std::cout, std::endl

#include "command.h"
#include "utils.h"

// TODO: Implement a --fix flag
auto intelligence::jsonschema::cli::lint(
    const std::span<const std::string> &arguments) -> int {
  const auto options{parse_options(arguments, {})};

  sourcemeta::jsontoolkit::SchemaTransformBundle bundle;
  bundle.add(
      sourcemeta::jsontoolkit::SchemaTransformBundle::Category::Modernize);
  bundle.add(
      sourcemeta::jsontoolkit::SchemaTransformBundle::Category::AntiPattern);

  bool result{true};
  for (const auto &entry : for_each_json(options.at(""))) {
    const bool subresult = bundle.check(
        entry.second, sourcemeta::jsontoolkit::default_schema_walker,
        resolver(options),
        [&entry](const auto &pointer, const auto &name, const auto &message) {
          std::cout << entry.first.string() << "\n";
          std::cout << "    ";
          sourcemeta::jsontoolkit::stringify(pointer, std::cout);
          std::cout << " " << message << " (" << name << ")\n";
        });

    if (!subresult) {
      result = false;
    }
  }

  return result ? EXIT_SUCCESS : EXIT_FAILURE;
}
