##### Prerequisites

The setups steps expect following tools installed on the system.

- Github
- Ruby [2.5.8]
- Rails [5.2.6]

##### 1. Check out the repository

```bash
git clone https://github.com/al-lo-co/ex-mongodb.git
```

##### 2. Install gems

And you should install the gems.

```ruby
bundle install
```

##### 3. Create and setup the database

Run the following commands to create and setup the database.

```ruby
bundle exec rake db:setup
```

##### 4. Start the Rails server

You can start the rails server using the command given below.

```ruby
bundle exec rails s
```

##### 5. Run specs

You can check the rails tests using the command given below.

```ruby
bundle exec rspec
```

##### 6. Info

This project started with the course called "Curso de introducción a Ruby on Rails" of Platzi, and the main intention was to develop a platform to manage tasks with it's properly categories and with it's properly participants and owners. 

In the Main branch the project has the basics of the course. In the branch Mongodb-config, there is the next step, the next course called "Curso intermedio de Ruby on Rails", where it contains the same project with Mongo and the use of several Specs. 