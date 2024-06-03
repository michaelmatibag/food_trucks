# FoodTrucks

FoodTrucks is a web application built with the Phoenix framework in Elixir. It serves data about food trucks from a PostgreSQL database, and periodically refreshes this data from a CSV file fetched from a public endpoint.

## Features

- List all food trucks
- View details of a specific food truck
- Create, update, and delete food truck records
- Periodically update the database with data from a CSV file

## Getting Started

### Prerequisites

- Elixir
- Erlang/OTP
- PostgreSQL

### Installation

1. Clone the repository:

   ```sh
   git clone https://github.com/yourusername/food_trucks.git
   cd food_trucks
   ```

2. Install dependencies:

   ```sh
   mix deps.get
   ```

3. Create and migrate the database:

   ```sh
   mix ecto.create
   mix ecto.migrate
   ```

4. Seed the database (optional):

   ```sh
   mix run priv/repo/seeds.exs
   ```

5. Start the Phoenix server:

   ```sh
   mix phx.server
   ```

6. The application can be accessed at [http://localhost:4000](http://localhost:4000).

### Running Tests

To run the tests:

```sh
mix test
```

### Project Structure

- **config/**: Configuration files for different environments.
- **lib/**: Main source code directory.
  - **food_trucks/**: Main application code.
    - **food/**: Context module for managing food trucks.
      - **truck.ex**: Defines the `Truck` schema.
    - **repo.ex**: Defines the `Repo` module for interacting with the database.
    - **csv_fetcher.ex**: Module for fetching and processing CSV data.
    - **application.ex**: Defines the `Application` module, starting the supervision tree.
  - **food_trucks.ex**: Entry point for the `FoodTrucks` application.
  - **food_trucks_web/**: Web-related code.
    - **channels/**: WebSocket channels (if any).
    - **controllers/**: Controller modules for handling web requests.
      - **truck_controller.ex**: Controller for handling truck-related web requests.
    - **endpoint.ex**: Defines the `Endpoint` module.
    - **router.ex**: Defines the application's routes.
    - **views/**: View modules for rendering responses.
    - **templates/**: Templates for rendering HTML (if applicable).
  - **food_trucks_web.ex**: Entry point for the web interface.
- **priv/**: Privileged (private) data, such as database migrations and static assets.
  - **repo/**: Database-related files.
    - **migrations/**: Database migration files.
    - **seeds.exs**: Script for seeding the database.
  - **static/**: Static assets (e.g., HTML, CSS, JS).
- **test/**: Test files.
  - **food_trucks/**: Tests for the main application code.
    - **food_truck_test.exs**: Tests for the `Food` context.
  - **food_trucks_web/**: Tests for the web-related code.
    - **controllers/**: Controller tests.
      - **truck_controller_test.exs**: Tests for the `TruckController`.
    - **views/**: View tests.
  - **test_helper.exs**: Helper file for setting up tests.
- **mix.exs**: Mix build tool configuration file.

### Updating Data

The application periodically fetches and updates food truck data from a public CSV file available at [this endpoint](https://data.sfgov.org/api/views/rqzj-sfat/rows.csv). The data is fetched and imported into the PostgreSQL database every hour.

## Contributing

1. Fork the repository
2. Create a new branch (`git checkout -b feature-branch`)
3. Make your changes
4. Commit your changes (`git commit -am 'Add new feature'`)
5. Push to the branch (`git push origin feature-branch`)
6. Create a new Pull Request

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
