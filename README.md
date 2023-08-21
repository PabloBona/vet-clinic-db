<h1>Vet Clinic Database Project</h1>
This project involves creating a database for a vet clinic to manage animals' information. You'll be using SQL to create tables, insert data, and perform various queries. The goal is to create a well-structured database and gain experience in managing data within a relational database system.


# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
- [💻 Getting Started](#getting-started)
  - [Setup](#setup)
  - [Usage](#usage)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [❓ FAQ](#faq)
- [📝 License](#license)

<!-- PROJECT DESCRIPTION -->

# 📖 [Vet Clinic Database Project] <a name="about-project"></a>

This project involves creating a relational database for a vet clinic. The database will store information about animals, such as their names, birthdates, escape attempts, neutering status, weight, and species. You will be using SQL to define the structure of the database, insert sample data, and perform various queries to extract useful information.


## 🛠 Built With <a name="built-with"></a>
The project is built using SQL for database management.

## 💻 Getting Started <a name="getting-started"></a>

This repository includes files with plain SQL that can be used to recreate a database:

- Use [schema.sql](./schema.sql) to create all tables.
- Use [data.sql](./data.sql) to populate tables with sample data.
- Check [queries.sql](./queries.sql) for examples of queries that can be run on a newly created database. **Important note: this file might include queries that make changes in the database (e.g., remove records). Use them responsibly!**

<a name="readme-top"></a>
Follow these steps to understand and work on the project:


### Tech Stack <a name="tech-stack"></a>

The project is built using the following technologies:

- **Server**: [Express.js](https://expressjs.com/) - A fast and minimalist web framework for Node.js.
- **Database**: [PostgreSQL](https://www.postgresql.org/) - A powerful, open-source relational database system.

Feel free to modify or expand the tech stack as needed for your project's requirements.


### Key Features <a name="key-features"></a>

- **[SQL Database Management: Create, structure, and manage a relational database using SQL commands.]**
- **[Data Manipulation: Insert, update, and delete data within the database using SQL statements.]**
- **[Querying Data: Perform various types of SQL queries to extract meaningful information from the database.]**

<p align="right">(<a href="#readme-top">back to top</a>)</p>



### 🛠 Setup <a name="setup"></a>

1. Clone this repository to your local machine:

```bash
git clone https://github.com/PabloBona/vet-clinic-db
```

2. Set up a PostgreSQL database named `vet_clinic`.

### Database Structure

The `schema.sql` file includes SQL commands to create the `animals` table with the following columns:

- `id`: A unique identifier for each animal.
- `name`: The name of the animal.
- `date_of_birth`: The birthdate of the animal.
- `escape_attempts`: The number of escape attempts made by the animal.
- `neutered`: A boolean indicating if the animal is neutered.
- `weight_kg`: The weight of the animal in kilograms.
- `species`: The species of the animal.

You can execute the `schema.sql` file to create the table structure by running:

```bash
psql -d vet_clinic -a -f schema.sql
```

Make sure you have PostgreSQL installed and configured on your machine before running the command.

Feel free to modify the column descriptions and structure according to your project's needs.

Please note that the database schema and structure provided are based on your project's requirements and can be adjusted as necessary.

## 🛠 Usage <a name="usage"></a>
The data.sql file contains SQL commands to insert sample data into the animals table. You can use these commands to populate the table with information about different animals.

The queries.sql file contains SQL queries to answer various questions about the data stored in the animals table. These queries cover topics like filtering animals based on conditions, retrieving specific information, and calculating aggregate values.

After running the queries, you can take screenshots of the results to showcase your work.

<!-- AUTHORS -->

## 👥 Authors <a name="authors"></a>


👤 **Pablo Bonasera**

- GitHub: [@Pablobona](https://github.com/PabloBona)

👤 **lRebornsl**

- GitHub: [@lRebornsl](https://github.com/lRebornsl)
- Twitter: [@RebornsDev](https://twitter.com/RebornsDev)
- LinkedIn: [Anthony Vásquez](https://www.linkedin.com/in/avvm98/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>


- [ x ] **[User Authentication: Implement user authentication and authorization to allow different users to access and manage animal records with appropriate permissions.]**
- [ x ] **[Appointment Scheduling: Create a feature that enables users to schedule appointments for animals, such as check-ups, vaccinations, and surgeries.]**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>

 

If you like this project or if it helped you, please give a ⭐️. I'd really appreciate it!

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>

 

I would like to thank Microverse and all my peers and colleagues at Microverse for giving me the opportunity to work on this project.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FAQ (optional) -->

## ❓ FAQ <a name="faq"></a>

- **[How do I set up the PostgreSQL database for this project?]**

  - Clone the repository to your local machine
  - Create a new PostgreSQL database named "vet_clinic".
  - Execute the SQL commands in the "schema.sql" file to create the necessary table structure.
  - Populate the database with sample data by executing the SQL commands in the "data.sql" file.

- **[How can I run the queries provided in the "queries.sql" file?]**

  - To run the queries provided in the "queries.sql" file, you can use a PostgreSQL client or interface, such as psql command-line tool or a graphical tool like pgAdmin. Connect to your "vet_clinic" database and execute the queries in the file to retrieve the desired information from the database.


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](MIT.md) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
