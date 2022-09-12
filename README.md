# CSD-430

### How to run each module
1. run `./deploy.sh` from project root and choose a module
    > you need docker compose and gradle to do this
2. browse to http://localhost:8080/ this will hold a container open while that shell is open
3. ctl+c will shut the container down and clean up file structure

### Creating a new module 
1. go to `File` > `Project Structure` > `New Module` and create a new module with these options
   - Java
   - Gradle
   - JUnit
   - Select 'Web Application'
   - use defualt library Servlet 4.0.1

### Working with Tomcat server
- read https://octopus.com/blog/defining-tomcat-context-paths 

#### Tomcat Context Paths
This table summaries the various context paths that will be assigned to web applications deployed from webapps, referenced in the server.xml file, or referenced from a file under conf/Catalina/localhost/.

| Configuration  |	Context |
|---------------|-----------|
| WAR file deployed under `webapps/app.war`	|   app
| Exploded deployment under `webapps/app` 	|   app
| WAR file deployed under `webapps/app#v1.war` |	app/v1
| Exploded deployment under `webapps/app#v1` 	 | app/v1
| WAR file deployed under `webapps/app#v1#feature.war` |	app/v1/feature
| Exploded deployment under `webapps/app#v1#feature` 	|  app/v1/feature
| `<Context path="/mydemo/version1" docBase="/apps/demo#v1.war"/>` in conf/server.xml |	/mydemo/version1
| `<Context path="path/is/ignored" docBase="/apps/myapp#v1.war"/>` in conf/Catalina/localhost/mydemo#version1.xml (i.e. config for /apps/myapp#v1.war) |	/mydemo/version1
| `<Context path="/path/is/ignored"/>` in conf/Catalina/localhost/mydemo#version1.xml (i.e. config for webapps/mydemo#version1.war) | 	/mydemo/version1







