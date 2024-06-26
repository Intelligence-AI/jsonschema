if(NOT Hydra_FOUND)
  set(HYDRA_INSTALL OFF CACHE BOOL "disable installation")
  set(HYDRA_HTTPSERVER OFF CACHE BOOL "disable the Hydra HTTP server module")
  set(HYDRA_BUCKET OFF CACHE BOOL "disable the Hydra bucket module")
  add_subdirectory("${PROJECT_SOURCE_DIR}/vendor/hydra")
  set(Hydra_FOUND ON)
endif()
