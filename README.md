# Element Lookup

This project is a shell script and PostgreSQL database schema designed to allow querying of element information from the periodic table. It was created to demonstrate proficiency in scripting, SQL, and PostgreSQL.

## Project Overview

The project consists of two main components:

- **`element.sh`**: A shell script that queries the periodic table database based on the provided element name or atomic number.
- **`periodic_table.sql`**: A PostgreSQL SQL dump file that creates and populates the periodic table database schema.

## Schema Details

### Tables

- **`elements`**
  - `atomic_number`: Unique identifier for each element.
  - `symbol`: Chemical symbol of the element.
  - `name`: Name of the element.

- **`properties`**
  - `atomic_number`: Unique identifier for each element, references `elements`.
  - `atomic_mass`: Atomic mass of the element.
  - `melting_point_celsius`: Melting point of the element (in Celsius).
  - `boiling_point_celsius`: Boiling point of the element (in Celsius).
  - `type_id`: Type of the element, references `types`.

- **`types`**
  - `type_id`: Unique identifier for each type.
  - `type`: Type of element (e.g., metal, nonmetal, metalloid).

### Sequences

Each table with a primary key uses a sequence to generate unique identifiers:
- `elements_atomic_number_seq`
- `types_type_id_seq`

### Constraints

- **Primary Key constraints** ensure each record is unique.
- **Unique constraints** prevent duplicate names or symbols for elements.
- **Foreign Key constraints** maintain relationships between tables (e.g., properties and elements).

## Getting Started

To get started with this project:

1. **Clone the Repository**
   - Clone this repository to your local machine using your preferred Git client.

2. **Set Up the Database**
   - Ensure you have PostgreSQL installed on your system.
   - Use the provided SQL dump file (`periodic_table.sql`) to create and populate the database. This file contains the schema definitions and sample data for the periodic table.

3. **Run the Shell Script**
   - Execute the `element.sh` script with an element name or atomic number as an argument to retrieve information about the element.

4. **Explore the Database**
   - Connect to the PostgreSQL database using a client like `psql` or a graphical tool like pgAdmin.
   - Explore the tables and relationships defined in the schema.

## Example Usage

To get information about an element, run:

```
./element.sh 1
```

or

```
./element.sh H
```

## What I Learned

- Writing and executing shell scripts to interact with a database.
- Designing and implementing a relational database schema for chemical elements.
- Using PostgreSQL features like sequences and constraints.

## Acknowledgements

- [PostgreSQL Documentation](https://www.postgresql.org/docs/)
- FreeCodeCamp for providing the certification and project guidelines.
