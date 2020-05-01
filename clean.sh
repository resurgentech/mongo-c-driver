#!/bin/bash

directory_list="  ./
                  ./src/libmongoc/
                  ./src/libmongoc/tests/
                  ./src/libmongoc/examples/
                  ./src/libmongoc/src/mongoc/
                  ./src/libmongoc/src/
                  ./src/libmongoc/build/
                  ./src/libmongoc/build/cmake/
                  ./src/
                  ./src/common/
                  ./src/libbson/
                  ./src/libbson/tests/
                  ./src/libbson/examples/
                  ./src/libbson/src/bson/
                  ./src/libbson/src/
                  ./src/libbson/src/jsonsl/
                  ./src/libbson/build/
                  ./src/libbson/build/cmake/
                  ./src/tools/
                  ./build/sphinx/readable/
                  ./build/sphinx/
                  ./build/
                  ./build/cmake/make_dist/
                  ./build/cmake/
                  ./generate_uninstall/
                  ./orchestration_configs/
                  "
file_list="Makefile cmake_install.cmake CMakeFiles CTestTestfile.cmake"

for DIR in $directory_list; do
  for FILE in $file_list; do
    rm -rf ${DIR}${FILE}
  done
done

file2_list=" ./VERSION_CURRENT
            ./src/libbson/bson
            ./src/libmongoc/mongoc
            ./src/libmongoc/libmongoc-static-1.0-config-version.cmake
            ./src/libmongoc/accept_test1.c
            ./src/libmongoc/libmongoc-static-1.0-config.cmake
            ./src/libmongoc/libmongoc-1.0-config-version.cmake
            ./src/libmongoc/src/mongoc/mongoc-version.h
            ./src/libmongoc/src/mongoc/mongoc-config.h
            ./src/libmongoc/src/libmongoc-1.0.pc
            ./src/libmongoc/src/libmongoc-ssl-1.0.pc
            ./src/libmongoc/src/CTestTestfile.cmake
            ./src/libmongoc/src/libmongoc-static-1.0.pc
            ./src/libmongoc/libmongoc-1.0-config.cmake
            ./src/libbson/libbson-1.0-config.cmake
            ./src/libbson/libbson-static-1.0-config.cmake
            ./src/libbson/libbson-1.0-config-version.cmake
            ./src/libbson/libbson-static-1.0-config-version.cmake
            ./src/libbson/src/libbson-static-1.0.pc
            ./src/libbson/src/bson/bson-config.h
            ./src/libbson/src/bson/bson-version.h
            ./src/libbson/src/libbson-1.0.pc
            "
for FILE in $file2_list; do
  rm -rf ${FILE}
done
