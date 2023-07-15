# Highwing Tech Challenge

This project is divided into two parts
1. `data_ingest`: the code responsible for importing data from arbitrary CSV files into a relational database
2. `data_api`: a minimal JSON api capable of querying and returning data from the database.

The `data/` directory contains the original data files provided for the exercise. Each sub-project has a separate README file to provide additional data on how to run the projects.

## Overall Perspective

My focus during the project was on flexibility and performance of the data ingest. Given the nature of the challenge, the inconsistency of the data, and the business domain, it seemed best to me to focus on making the solution capable of changing to meet new data structures or changes in the business requirements. To accomplish this, most time was spent on building a simple expressive DSL capable of shaping the data into a consistent format along with validations to ensure that the incoming data met a standard prior to being imported into the database. Given a few unknowns, my goal was to make it as simple as possible to either reject invalid data or to morph the data to meet a specific format.

This focus left very little time to build the API, so I wrote a very simple API to return the data as a simple JSON data structure.

Finally, I chose a few tools that that I was only marginally familiar with (ROM, the Dry libraries) mainly because I enjoy using tech challenges as a chance to play with new toys and learn new things. The drawback to this approach is the implementation—particularly of the database layer—is not as clean as I might like. I think ROM provides more tooling for a cleaner configuration setup, but I hacked it in a bit to keep to time.
