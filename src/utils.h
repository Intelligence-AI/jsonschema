#ifndef INTELLIGENCE_JSONSCHEMA_CLI_UTILS_H_
#define INTELLIGENCE_JSONSCHEMA_CLI_UTILS_H_

#include <sourcemeta/jsontoolkit/json.h>
#include <sourcemeta/jsontoolkit/jsonschema.h>

#include <filesystem> // std::filesystem
#include <map>        // std::map
#include <set>        // std::set
#include <span>       // std::span
#include <string>     // std::string
#include <utility>    // std::pair
#include <vector>     // std::vector

namespace intelligence::jsonschema::cli {

// TODO: Tweak this function to take:
// - The options that take values
// - The options that are aliases to other options
auto parse_options(const std::span<const std::string> &arguments,
                   const std::set<std::string> &flags)
    -> std::map<std::string, std::vector<std::string>>;

auto for_each_schema(const std::vector<std::string> &arguments)
    -> std::vector<
        std::pair<std::filesystem::path, sourcemeta::jsontoolkit::JSON>>;

auto pretty_evaluate_callback(
    bool result,
    const sourcemeta::jsontoolkit::SchemaCompilerTemplate::value_type &,
    const sourcemeta::jsontoolkit::Pointer &evaluate_path,
    const sourcemeta::jsontoolkit::Pointer &instance_location,
    const sourcemeta::jsontoolkit::JSON &) -> void;

} // namespace intelligence::jsonschema::cli

#endif
