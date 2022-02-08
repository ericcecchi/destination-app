# Destination
> Curated travel recommendations from tastemakers you love

## Getting started

### Prerequisites
Destination requires a PostgreSQL database. The easiest way to setup Postgres locally on a Mac is with Postgres.app.
[You can download and install it from the website](https://postgresapp.com/).

### Local setup
To run the app locally, clone the repo and then install the dependencies:

```
gem install bundler
bundle config set --local without 'production'
bundle install
```

Set up a local `.env` file with the appropriate values for your local database:

```bash
cp .env.example .env
# Edit .env and add your values
```

Next, migrate the database:

```bash
rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```bash
rails test
```

If the test suite passes, you'll be ready to run the app in a local server:

```bash
rails server
```

When developing locally, you should also run webpack in another terminal window:
```bash
bin/webpack-dev-server
```
