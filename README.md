# Highwing Tech Challenge

This project is divided into two parts
1. `data_ingest`: the code responsible for importing data from arbitrary CSV files into a relational database
2. `data_api`: a minimal JSON api capable of querying and returning data from the database.

The `data/` directory contains the original data files provided for the exercise. Each sub-project has a separate README file to provide additional data on how to run the projects.

## Overall Perspective

We built the Highwing Starter Repo with a focus on flexibility and performance of the data ingest. Given the nature of the challenge, the inconsistency of the data, and the business domain, we made the code capable of changing to meet new data structures or changes in the business requirements. We built a simple, expressive DSL capable of shaping the data into a consistent format along with validations to ensure that the incoming data met a standard prior to being imported into the database. Assuming a few unknowns, our goal was to make it as simple as possible to either reject invalid data or to morph the data to meet a specific format.

We wrote a very simple API to return the data as a JSON data structure.

Finally, we chose a few tools that that are somewhat new to us (ROM, the Dry libraries), which makes the database layer not as clean as we would normally produce. ROM provides more tooling for a cleaner configuration setup, but we did not make full use of that functionality.
