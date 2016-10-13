### Building a CRUD App with React + Redux backed by a Rails 5 JSON API

Implementing JSON API according to standards:

http://jsonapi.org/

Built the JSON API with Rails 5 following this blog post:

http://www.thegreatcodeadventure.com/building-a-super-simple-rails-api-json-api-edition-2/

Building the React + Redux front-end following this blog post series:

http://www.thegreatcodeadventure.com/building-a-simple-crud-app-with-react-redux-part-1/

### Tools

React + Redux

Rails 5.0.0.1 JSON API

Docker

### Docker Cheatsheet

- build docker image based on Dockerfile

  - docker-compose build

- spin up and connect containers as directed in docker-compose.yml

  - docker-compose up -d

- run standard rails commands

  - docker-compose run app bundle install

  - docker-compose run app rails db:migrate

  - docker-compose run app rails db:setup
