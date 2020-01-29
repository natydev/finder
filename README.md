# Finder

A useful application for **home inventory** written in *Ruby on Rails*.  
This project is **work in progress**, so you could encounter some functionalities not entirely completed.


## Installation

Ensure you have the following tools already installed on your system:

* Ruby v. 2.6.5
* Gem bundler v. >= 2.0.0
* Postgres v. >= 9.4

then clone this repository on your localhost, enter the root app directory and run from terminal:

```
bundle install
```

open `app/config/database.yml` and eventually set you db postgres `username` and `password`, then run:

```
bundle exec rake db:setup
```

now the app is ready to start in development environment with:

```
bundle exec rails s
```

point you browser at `http://localhost:3000` and login with user's email and password you can find in file `app/db/seeds.rb` at line 5-6.


## Testing

This project is provided with a good coverage of unit and integration tests, made with rspec.  
Run the complete suite with:

```
bundle exec rspec
```


## Contributing

You are free to improve or suggest new features/ideas.  
If you want to contribute keep these guidelines in mind:

* Code must be well formatted and **offences free**, use the provided `rubocop` gem.
* Use the same **coding conventions** as the rest of the project.
* Code must be **tested** (with rspec).
* Write code according to **SOLID** Principles.
* Ensure operation classes are according to **Railway pattern** using `dry-rb` gems.
* Before adopting a new view helper, consider to use **decorators** instead.

Steps to submit your code:

1. Fork the repo.
2. Oper your feature/namespaced branch
3. Commit your code following Github guidelines.
4. Make a PR with an exhaustive description.


## License

This code is free to use under the terms of the **GNU AGPLv3** license.
