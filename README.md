# ChatChat
  * Hosted website: https://chatchatphx.herokuapp.com/ 
  * What it is: Multi-room chat program utilizing Elixir, Phoenix framework, Javascript, PostgreSQL, and Heroku. 
  * How to use: Type in a name to be used in the chat room when the prompt shows up. Type something in the text box and press enter. Happy chatting! 

## To run locally:
  * Download files off Heroku GitHub with `git clone: https://git.heroku.com/chatchatphx.git`
  * Unzip files
  * CD into the file and open terminal by typing cmd in the folder search bar
  * Install dependencies with `mix deps.get`
  * Install Node.js dependencies with `npm install` inside the `assets` directory
  * Enter your own psql credentials in dev.exs
  * CD back into the root of the folder
  * Run `mix ecto.create` to create the table in psql
  * Run `mix ecto.migrate` in the root folder to migrate the database locally
  * Start Phoenix endpoint with `mix phx.server`
  * Open a web browser and type in http://localhost:4000/ 

## To open different chat rooms locally or online:
  * Local: Open a web browser and type in http://localhost:4000/chat/name_of_room
  * Online: Open a web browser and type in https://chatchatphx.herokuapp.com/chat/name_of_room 
    > name_of_room can be substituted for any string including characters, numbers, and symbols (except # and % keys)

## Debugging
  * Ensure there is only one migration file under repo/migrations, delete any extra files 
  * If there are database connection issues:
    > Delete the _build folder in the root
    > Reinstall dependencies with `mix deps.get`
    > Run `mix ecto.drop` to drop the table
    > Create a new table by `mix ecto.create`
    > Migrate the existing table schema by `mix ecto.migrate`