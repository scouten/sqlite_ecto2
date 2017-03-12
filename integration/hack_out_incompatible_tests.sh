#!/bin/bash

# Ugly but necessary hack to disable certain untagged tests that can't be
# supported by SQLite.

# WARNING: There is trailing whitespace on the `sed` line that must be retained.

if [ `uname` == "Darwin" ] ; then

sed -i "" '/test "insert all/ i\ 
  @tag :insert_cell_wise_defaults
' deps/ecto/integration_test/cases/repo.exs

sed -i "" '/test "Repo.insert_all escape/ i\ 
  @tag :insert_cell_wise_defaults
' deps/ecto/integration_test/sql/sql.exs

else

sed -i '/test "insert all/ i @tag :insert_cell_wise_defaults' deps/ecto/integration_test/cases/repo.exs

sed -i '/test "Repo.insert_all escape/ i @tag :insert_cell_wise_defaults' deps/ecto/integration_test/sql/sql.exs

fi
