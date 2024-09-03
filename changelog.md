Sample-api build changes
==================================

Release: 1.0.1
Author: Ramya P
Filename: changelog
- issue : docker build failed with the following error
12.11   Backend subprocess exited when trying to invoke get_requires_for_build_wheel
12.11
12.11   running egg_info
12.11   writing psycopg2.egg-info/PKG-INFO
12.11   writing dependency_links to psycopg2.egg-info/dependency_links.txt
12.11   writing top-level names to psycopg2.egg-info/top_level.txt
12.11
12.11   Error: pg_config executable not found.
12.11
12.11   pg_config is required to build psycopg2 from source.  Please add the directory
12.11   containing pg_config to the $PATH or specify the full executable path with the
12.11   option:
12.11
12.11       python setup.py build_ext --pg-config /path/to/pg_config build ...
12.11
12.11   or with the pg_config option in 'setup.cfg'.
12.11
12.11   If you prefer to avoid building psycopg2 from source, please install the PyPI
12.11   'psycopg2-binary' package instead.

Resolution: Modify pyproject.toml with valid psycopg2 library (psycopg2-binary)

- issue: build docker images 
- Resolution: Created Dockerfile with required steps

- issue: start_local.sh run issue
- Resolution: added .dockerignore
