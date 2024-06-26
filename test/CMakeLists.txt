macro(add_jsonschema_test_unix name)
  if(UNIX)
    add_test(NAME JSONSchema.${name} COMMAND
      "${CMAKE_CURRENT_SOURCE_DIR}/${name}.sh"
      "$<TARGET_FILE:jsonschema_cli>")
  endif()
endmacro()

macro(add_jsonschema_test_unix_ci name)
  if(JSONSCHEMA_TESTS_CI AND UNIX)
    add_test(NAME JSONSchema.ci.${name} COMMAND
      "${CMAKE_CURRENT_SOURCE_DIR}/ci/${name}.sh"
      "$<TARGET_FILE:jsonschema_cli>")
  endif()
endmacro()

add_jsonschema_test_unix(help)
add_jsonschema_test_unix(format_single)
add_jsonschema_test_unix(format_invalid_path)
add_jsonschema_test_unix(format_directory)
add_jsonschema_test_unix(format_cwd)
add_jsonschema_test_unix(format_multi_extension)
add_jsonschema_test_unix(format_check_single_fail)
add_jsonschema_test_unix(format_check_single_pass)
add_jsonschema_test_unix(format_directory_ignore_directory)
add_jsonschema_test_unix(format_directory_ignore_file)
add_jsonschema_test_unix(format_check_single_invalid)
add_jsonschema_test_unix(frame)
add_jsonschema_test_unix(bundle_non_remote)
add_jsonschema_test_unix(bundle_into_resolve_directory)
add_jsonschema_test_unix(bundle_remote_single_schema)
add_jsonschema_test_unix(bundle_remote_no_http)
add_jsonschema_test_unix(bundle_remote_directory)
add_jsonschema_test_unix(bundle_remote_directory_without_id)
add_jsonschema_test_unix(lint_pass)
add_jsonschema_test_unix(lint_fail)
add_jsonschema_test_unix(lint_fix)
add_jsonschema_test_unix(metaschema_fail_directory)
add_jsonschema_test_unix(metaschema_fail_single)
add_jsonschema_test_unix(metaschema_fail_non_schema)
add_jsonschema_test_unix(metaschema_pass_cwd)
add_jsonschema_test_unix(metaschema_pass_single)

# Validate
add_jsonschema_test_unix(validate/fail_instance_directory)
add_jsonschema_test_unix(validate/fail_instance_enoent)
add_jsonschema_test_unix(validate/fail_instance_invalid_json)
add_jsonschema_test_unix(validate/fail_invalid_ref)
add_jsonschema_test_unix(validate/fail_no_instance)
add_jsonschema_test_unix(validate/fail_no_schema)
add_jsonschema_test_unix(validate/fail_relative_external_ref_missing)
add_jsonschema_test_unix(validate/fail_resolve_enoent)
add_jsonschema_test_unix(validate/fail_resolve_directory_with_invalid_json)
add_jsonschema_test_unix(validate/fail_resolve_invalid_json)
add_jsonschema_test_unix(validate/fail_schema_directory)
add_jsonschema_test_unix(validate/fail_schema_enoent)
add_jsonschema_test_unix(validate/fail_schema_invalid_json)
add_jsonschema_test_unix(validate/fail_schema_non_schema)
add_jsonschema_test_unix(validate/fail_schema_unknown_dialect)
add_jsonschema_test_unix(validate/fail_schema_unsupported_dialect)
add_jsonschema_test_unix(validate/pass_resolve)
add_jsonschema_test_unix(validate/pass_resolve_custom_extension)
add_jsonschema_test_unix(validate/pass_resolve_verbose)
add_jsonschema_test_unix(validate/pass_verbose)
add_jsonschema_test_unix(validate/pass_draft4)
add_jsonschema_test_unix(validate/pass_draft6)
add_jsonschema_test_unix(validate/pass_draft7)
add_jsonschema_test_unix(validate/fail_draft4)
add_jsonschema_test_unix(validate/fail_draft6)
add_jsonschema_test_unix(validate/fail_draft7)

# Test
add_jsonschema_test_unix(test/fail_true_single_resolve)
add_jsonschema_test_unix(test/fail_true_single_resolve_verbose)
add_jsonschema_test_unix(test/fail_false_single_resolve)
add_jsonschema_test_unix(test/fail_false_single_resolve_verbose)
add_jsonschema_test_unix(test/fail_multi_resolve)
add_jsonschema_test_unix(test/fail_multi_resolve_verbose)
add_jsonschema_test_unix(test/fail_unresolvable)
add_jsonschema_test_unix(test/fail_unsupported)
add_jsonschema_test_unix(test/fail_unsupported_verbose)
add_jsonschema_test_unix(test/fail_not_object)
add_jsonschema_test_unix(test/fail_no_schema)
add_jsonschema_test_unix(test/fail_schema_non_string)
add_jsonschema_test_unix(test/fail_no_tests)
add_jsonschema_test_unix(test/fail_tests_non_array)
add_jsonschema_test_unix(test/fail_test_case_non_object)
add_jsonschema_test_unix(test/fail_test_case_no_data)
add_jsonschema_test_unix(test/fail_test_case_non_string_description)
add_jsonschema_test_unix(test/fail_test_case_no_valid)
add_jsonschema_test_unix(test/fail_test_case_non_boolean_valid)
add_jsonschema_test_unix(test/pass_empty)
add_jsonschema_test_unix(test/pass_empty_verbose)
add_jsonschema_test_unix(test/pass_single_resolve)
add_jsonschema_test_unix(test/pass_single_resolve_verbose)
add_jsonschema_test_unix(test/pass_single_no_description_verbose)
add_jsonschema_test_unix(test/pass_single_no_test_description_verbose)
add_jsonschema_test_unix(test/pass_multi_directory_resolve)
add_jsonschema_test_unix(test/pass_multi_directory_resolve_verbose)

# CI specific tests
add_jsonschema_test_unix_ci(bundle_remote_http)
add_jsonschema_test_unix_ci(fail_validate_http_non_200)
add_jsonschema_test_unix_ci(fail_validate_http_non_200_verbose)
add_jsonschema_test_unix_ci(fail_validate_http_non_schema)
add_jsonschema_test_unix_ci(fail_validate_http_non_schema_verbose)
add_jsonschema_test_unix_ci(pass_validate_http)
add_jsonschema_test_unix_ci(pass_validate_http_verbose)
