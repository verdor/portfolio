# Portfolio app

## Setup for development

1. Install Docker and Docker Compose. Follow the
   [installation instructions](https://docs.docker.com/install/) on the Docker
   for your OS
1. Clone this repo to a directory on your developer machine
1. Build The Project running the command `docker-compose build`. It'll take a
   while
1. Create and Migrate the the PostgreSQL database for the project
   `docker-compose run web rake db:create db:migrate`
1. Start application `docker-compose up`
1. You can test accessing Rails console `docker-compose exec web rails console`
1. You should now be able to browse to
   [http://localhost:3000](http://localhost:3000) and see the app running

### Tips

If you are running Docker on Linux, the files rails new created are owned by
root. This happens because the container runs as the root user. If this is the
case, change the ownership of the new files. [tips](https://docs.docker.com/compose/rails/)

`sudo chown -R $USER:$USER .`

`docker-compose run web rails --version`

If you add a gem in the Gemfile, you need to restart Docker or run the command
`docker-compose run web bundle install`
