Sample-api UNIT_TESTING
===========================================================

Author: Ramya P

Build Docker Image
docker build -t sample-api .
vagrant@vagrant:~/bcjobs/sample-api$ docker build -t sample-api .

<img width="941" alt="image" src="https://github.com/user-attachments/assets/418201df-aa24-4b44-8af5-29955fc7184a">

Run the docker container for the testing

vagrant@vagrant:~/bcjobs/sample-api$ docker run --rm -p 3003:3000 -d --name sample-api sample-api

Sanity Testing
vagrant@vagrant:~/bcjobs/sample-api$ curl http://0.0.0.0:3003/
{"message":"Sample API"}

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
Unit Testing execution
<img width="869" alt="image" src="https://github.com/user-attachments/assets/706be9f4-98a1-4f89-bae7-f25993d190f0">

