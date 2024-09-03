Sample-api build changes
==================================

Release: 1.0.1
Author: Ramya P
Filename: changelog
- issue : docker build failed with the following error
  Error: pg_config executable not found.

  pg_config is required to build psycopg2 from source.  Please add the directory
  containing pg_config to the $PATH or specify the full executable path with the
  option:

      python setup.py build_ext --pg-config /path/to/pg_config build ...

  or with the pg_config option in 'setup.cfg'.

  **If you prefer to avoid building psycopg2 from source, please install the PyPI
  'psycopg2-binary' package instead**.
Resolution: Modify pyproject.toml with valid psycopg2 library (psycopg2-binary)

- issue: build docker images 
- Resolution: Created Dockerfile with required steps

- issue: start_local.sh run issue
- Resolution: added .dockerignore
