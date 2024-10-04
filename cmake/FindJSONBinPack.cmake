if(NOT JSONBinPack_FOUND)
  set(JSONBINPACK_INSTALL OFF CACHE BOOL "disable installation")
  set(JSONBINPACK_RUNTIME OFF CACHE BOOL "disable the JSON BinPack runtime module")
  add_subdirectory("${PROJECT_SOURCE_DIR}/vendor/jsonbinpack")
  set(JSONBinPack_FOUND ON)
endif()
