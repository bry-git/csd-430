# CSD-430

### How to run each module
1. run `./deploy.sh` from project root and choose a module
    > you need docker compose and gradle to do this
2. browse to http://localhost:8080/$mod this will hold a container open while that shell is open
3. ctl+c will shut the container down and clean up file structure

### Creating a new module 
1. go to `File` > `Project Structure` > `New Module` and create a new module with these options
   - Java
   - Gradle
   - JUnit
   - Select 'Web Application'
   -  use defualt library Servlet 4.0.1