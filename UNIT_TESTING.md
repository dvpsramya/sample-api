Sample-api UNIT_TESTING
===========================================================

Author: Ramya P
===========================================================
Build Docker Image
docker build -t sample-api .
vagrant@vagrant:~/bcjobs/sample-api$ docker build -t sample-api .
================================================================
<img width="941" alt="image" src="https://github.com/user-attachments/assets/418201df-aa24-4b44-8af5-29955fc7184a">

vagrant@vagrant:~/bcjobs/sample-api$ docker images
REPOSITORY   TAG       IMAGE ID       CREATED          SIZE
sample-api   latest    4cfa4658eac7   25 seconds ago   205MB
================================================================
Run the docker container for the testing
===============================================================
vagrant@vagrant:~/bcjobs/sample-api$ docker run --rm -p 3003:3000 -d --name sample-api sample-api
5ec95b7bfd5527f91afd978d6ae53a2847d75b222a14d6460a6174b3b1c0aea3
vagrant@vagrant:~/bcjobs/sample-api$ docker ps
CONTAINER ID   IMAGE        COMMAND                  CREATED         STATUS         PORTS                                         NAMES
5ec95b7bfd55   sample-api   "poetry run fastapi …"   3 seconds ago   Up 3 seconds   0.0.0.0:3003->3000/tcp, [::]:3003->3000/tcp   sample-api
vagrant@vagrant:~/bcjobs/sample-api$
===============================================================
Sanity Testing
vagrant@vagrant:~/bcjobs/sample-api$ curl http://0.0.0.0:3003/
{"message":"Sample API"}vagrant@vagrant:~/bcjobs/sample-api$
vagrant@vagrant:~/bcjobs/sample-api$ curl  http://0.0.0.0:3003/docs

    <!DOCTYPE html>
    <html>
    <head>
    <link type="text/css" rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swagger-ui-dist@5/swagger-ui.css">
    <link rel="shortcut icon" href="https://fastapi.tiangolo.com/img/favicon.png">
    <title>Sample API - Swagger UI</title>
    </head>
    <body>
    <div id="swagger-ui">
    </div>
    <script src="https://cdn.jsdelivr.net/npm/swagger-ui-dist@5/swagger-ui-bundle.js"></script>
    <!-- `SwaggerUIBundle` is now available on the page -->
    <script>
    const ui = SwaggerUIBundle({
        url: '/openapi.json',
    "dom_id": "#swagger-ui",
"layout": "BaseLayout",
"deepLinking": true,
"showExtensions": true,
"showCommonExtensions": true,
oauth2RedirectUrl: window.location.origin + '/docs/oauth2-redirect',
    presets: [
        SwaggerUIBundle.presets.apis,
        SwaggerUIBundle.SwaggerUIStandalonePreset
        ],
    })
    </script>
    </body>
    </html>
    vagrant@vagrant:~/bcjobs/sample-api$
============================================================
Unit Testing execurion
docker exec -it sample-api /bin/bash
5ec95b7bfd55:/usr/src/app# ls -rlt
total 160
-rwxrwxr-x    1 root     root           464 Sep  2 22:45 start-local.sh
-rwxrwxr-x    1 root     root           399 Sep  2 22:45 run-unit-tests.sh
-rw-rw-r--    1 root     root        110701 Sep  2 22:45 poetry.lock
-rw-rw-r--    1 root     root          1915 Sep  2 22:45 docker-compose.yml
drwxrwxr-x    3 root     root          4096 Sep  2 22:45 db
drwxrwxr-x    2 root     root          4096 Sep  3 02:55 tests
-rw-rw-r--    1 root     root           580 Sep  3 04:41 Dockerfile
-rw-rw-r--    1 root     root           639 Sep  3 05:07 pyproject.toml
-rw-rw-r--    1 root     root          2125 Sep  3 05:17 README.md
-rw-rw-r--    1 root     root          1161 Sep  3 05:18 changelog.md
-rw-rw-r--    1 root     root            11 Sep  3 05:24 UNIT_TESTING.md
drwxrwxr-x    1 root     root          4096 Sep  3 05:27 src
5ec95b7bfd55:/usr/src/app# poetry run pytest ./tests -x -o log_cli=true --disable-warnings -vvv
==================================================================== test session starts ====================================================================
platform linux -- Python 3.12.3, pytest-8.3.2, pluggy-1.5.0 -- /root/.cache/pypoetry/virtualenvs/sample-api-VA82Wl8V-py3.12/bin/python
cachedir: .pytest_cache
rootdir: /usr/src/app
configfile: pyproject.toml
plugins: anyio-4.4.0
collected 8 items

tests/test_housing_struct.py::test_postal_code_correct_format PASSED                                                                                  [ 12%]
tests/test_housing_struct.py::test_postal_code_lower_case PASSED                                                                                      [ 25%]
tests/test_housing_struct.py::test_postal_code_bad_format_zip_code PASSED                                                                             [ 37%]
tests/test_housing_struct.py::test_postal_code_bad_format_backwards PASSED                                                                            [ 50%]
tests/test_housing_struct.py::test_postal_code_field_set PASSED                                                                                       [ 62%]
tests/test_housing_struct.py::test_empty_string_city PASSED                                                                                           [ 75%]
tests/test_housing_struct.py::test_empty_string_street PASSED                                                                                         [ 87%]
tests/test_housing_struct.py::test_missing_housing_type_id PASSED                                                                                     [100%]

===================================================================== 8 passed in 0.18s =====================================================================
5ec95b7bfd55:/usr/src/app#
