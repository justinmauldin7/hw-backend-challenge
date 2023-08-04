# My Approach and Thought Process

In the below sections, I will be sharing some context to my take home challenge with the intended purpose of it to be used as a primer for the synchronous video discussion portion.  

My goal with these details is to help those reviewing the code and participating in the synchronous video discussion to understand my thought process while completing the take home portion, address any potential concerns you might have with my implementation, and set the stage for possible areas of refactor, discussion, or continued implementation during the synchronous video discussion.

Finally, and to be transparent, it is meant to highlight my strengths in communication & documentation in the take home challenge portion when my technical chops might not be a strength for me yet.  

(It is not mean to be or come off as self-aggrandizing. I would rather you have more information, context, & understanding in making your assessment than not enough.)

## My Implementation Choice:

For my implementation of the take home challenge, I chose Adventure 1: Start with Existing Codebase.

I chose this approach because I wanted to challenge myself to implement new technologies and paradigms I have not been familiar with at this point in my software development career.

I thought this gave me the best chance to learn what it truly would be like to work at Highwing and your tech stack and highlight my ability and willingness to learn new technologies, and get out of my comfort zone, instead of implement something that I was comfortable and familiar with.

Additionally, I chose this approach because I met informally with Emmie Hayes last week, and she mentioned during our chat that the 6 week "Batches" that Highwing does allows for you to really dive in and learn what you are implementing as a dev, instead of just finding a code snippet that gets the feature implemented the fastest.

I wanted to see what that might be like, so I took this approach to truly learn what I was tasked to implement & how it works, instead of just meeting some criteria or user stories.

(Additionally, here is a link to notes I took while learning these new concepts/technologies: [Highwing Take Home Challenge Notes](https://docs.google.com/document/d/1V3hV7k7ko9hgzt7iDIqaW0li8Oj4FS9yDvkYP2oOMzA/edit?usp=sharing))

## My Context:

In the 4 years that I have been a software developer, I have been a full-stack Rails developer, spending about 90% of my time coding standard Rails apps with the standard MVC format.

The idea of micro services & utilizing Rails without it's MVC convention is a completely new paradigm to me that I have only heard about in theory, but never had exposure too.

When I was at Measurabl (my last job), we were just getting into Event Driven Architecture with the implementation of Kafka for data transfer, instead of the Rails API that previously existed, but I did not get the chance to implement any Kafka tickets/features before I was laid off.

That is the closest I have come to the way that Highwing & the coding challenge handles its implementation.

With that said, when I said in the previous section that I wanted to learn new technologies and challenge myself, I was completely out of my comfort zone during this whole take home challenge with the exception of Ruby & some previous usage of Sidekiq & Minitest.


## My Time Commitment:

To be transparent, I spent quite a few more hours than 5 on this take home challenge.  

I probably spent close to 5 hours actually writing code for the challenge, but between me trying to learn about GPG, Roda, ROM, & Dry-schema, I spent several more hours just watching videos, reading documentation, reading over examples, googling, and troubleshooting over most of Wednesday & Thursday of this week.

I really was enjoying working on this problem and learning about these new technologies & paradigms that are so different from Rails and its conventions, so that is another reason for investing so much time into this challenge, as well as the challenge to take my time and learn instead of speeding to a solution, and just being slower when you are working on something that is completely new to you.

## Where I Left Off:

-**What I got working:**
  - I was able to successfully create the new API endpoint for the uploading of the encrypted client file and 
  - I was able to successfully automate the decryption of the file once it has been uploaded.

-**What I Implemented but isn't working:**
  - I implemented the updating of an existing record (with ROM's .changeset :update .commit), but it doesn't seem to be persisting the update.
  - I implemented the creation of a new record (with ROM's .changeset :create .commit), but it doesn't seem to be persisting the creation.

-**What I did not implement yet:**
  - I have not implemented the requirement for a clients name to be valid/part of it when it is created.

-**What I partially Implemented:**
(for possible use during the synchronous video discussion portion & time constraints)
  - Asynchronous execution of the file upload, decryption & updating & creating of records via Sidekiq.
  - Working tests in the "data_api" repo using Minitest.

## My New API Endpoint:

Client Upload - It takes a request body of a file.

It returns the above response body of JSON:
```
POST /client_upload

    {
        "success": "Records successfully imported."
    }
```

## My Approach to code-challenge@highwing.io Help:

I approached the code-challenge@highwing.io email address and reaching out to the Highwing dev team directly as a last resort type of resource if I truly was stuck chrunning on something endlessly with no movement or path forward in sight.

I had no way of knowing how quickly I would get a response back, and if that would set me back on progress I could be making on the challenge for a clarifying question.

With this thinking, I just made a decision in the way of trying to maximize my time to just save my clarifying questions for the synchronous video discussion, knowing that my code/implementation would be a work in progress, and we would address those questions and concerns synchronously.

I understand that this thinking and decision is a tradeoff I made in my implementation & code that will have to be address in the synchronous video discussion.

If this was a true working environment, I would have utilized a more preferred asynchronous communication tool such as Slack to ask my clarifying questions in real time.

(I have compiled some of the clarifying questions and concerns in the "My questions" section below.)


## Areas for Refactors/Improvements:

You will notice throughout the codebase that I have "TODO" & "FIX" code comments scattered throughout.

These are meant to be the areas that I have identified already that need refactors, improvements, or help getting to work during the synchronous video discussion.

## My Questions:

This is my list of clarifying questions I would have asked via Slack or directly if I was pairing with someone on this implementation to get clarity on, make work, or have a discussion on.

- Does Highwing use the "pgpme" gem? I tried getting their engine to work for the decryption & couldn't get it to work, so I just use the shell script instead. I think I am close and just need to figure out how to import the private.key or access the file without a password.  (I did a lot of searching and couldn't find anything, and their documentation isn't very good.) 

- How do you do an update on multiple field values with ROM?  I could not figure out a way to pass in an array of options (like you can in ActiveRecord) and have it update all those fields at once.  I could only get it to work if I updated one field at a time.  (I understand this is wildly inefficient & bad implementation, but best I could come up with because I couldn't find any examples in the ROM documentation or googling)

- How do you create a record in ROM with multiple field values?  Similar to the update, I couldn't find an example of multiple fields being updated at once.  I only saw them passing in the "id".

- In my implementation of the challenge, I spent my whole time in the "data_api" repo.  I never touched the code in the "data_ingest" repo.  Is that to be expected? Or did I fundamentally misunderstand something about the tech stack & implementation of this code base?

- There were no tests in the "data_api" repo.  Was that by design? Or was it expected that I would implement the tests for this repo?

- What does the Sidekiq implementation look like for a code base like this?  I have only ever utilized Sidekiq in a Rails application, and never implemented it before.  It was previously implemented.  (I did find some exmaples of adding Sidekiq to a Sinatra app as soemthing I would think would be similar.  I put some commented out code in the config.ru file from that example, but curious what else I might be missing.)

- What does the validation of the created record look like since I didn't get to that part of the implementation?  Is that done in the "data_apie" repo or is that validation done in the "data_ingest" portion?  Just looking at the code, I would assume the latter.

## Testing:

Whether it was a good decision or bad decision, I realized the "data_api" repo didn't have any tests and I didn't know if that was be design or expected for me to implement during the challenge, and due to the time constraints, I prioritized learning how the technologies worked & seeing if I could meet the basic requirements, rather than prioritizing writing tests for the new code I implemented, and I understand that this is a tradeoff.

Had I chosen Adventure 2: Build Using Whichever Tools You Prefer, I would have built a standard Rails app with Rspec for testing and I would have prioritized implementing everything using TDD.

It was engrained in us at Turing & mentioned by Leah Miller when I informally met with her that tests are always important & valued by Highwing.  

That being said, I know that you are going to want to see some tests.

I started laying the groundwork for adding tests during the synchronous video discussion if that was a potential area you wanted to focus on.

Additionally, I have linked below the take home challenge I got when I was hired by Measurabl where I completed it in Rails, using RSpec & using TDD for your reference as well.

[My Measurabl Take Home Repo](https://github.com/justinmauldin7/measurabl_api/tree/master).

- [Take Home Request Tests](https://github.com/justinmauldin7/measurabl_api/tree/master/spec/requests/api/v1).

- [Take Home Model Tests](https://github.com/justinmauldin7/measurabl_api/tree/master/spec/models).

## My Love for Documentation:

If it hasn't shown already, I really love writing documentation & I think it is one of my strengths as a developer.  

It is born partially out of my having a terrible memory, where the only way to quickly & efficiently remember something is to write it down for quick and easy recall, rather than having to rely on my brain to do the recall slower & in less detail.

Additionally, it is partially born out of my pervious career as a Customer Service rep where there is high turnover & usually poor onboarding for new hires.  If you can write down how to do something or how to learn some element of the job, it is then not siloed and lost when that person leaves the company.  It is recorded and accessible for the future even in a high turn over environment.

I think the latter can be applied to software development as well.  It isn't good to have information silos and sometimes you touch parts of the code or do setup tasks once every few moths or every few years and its hard to remember how you did it or what the code is doing for the future self, other developer on the team, or new hire to the team.

Finally, below is some documentation I wrote up recently when I started doing contract working fro my previous company & had to setup the codebase again from scratch after not doing it for 4 years.  It can now be used for the next developer who needs to use it.

  
[Accolader Local Setup Instructions Documenation](https://docs.google.com/document/d/1cu1K1ILdAzOWKn2fDra7xTpsO6WPlNTOFbOZ2KNcPQk/edit?usp=sharing)  
 

<br/><br/>
<br/><br/>

# Platform / Backend Engineer Challenge

Our goal with this challenge is to get a sense of how you reason through problems and build software to solve them.

More specifically, we're looking to get a sense of three things:
1. How do you think through the technical aspects of problems? Do your solutions meet the stated parameters? Are they efficient, maintainable, and well-organized?
1. How can you engage non-technical stakeholders to understand the problem space and explain how the solution impacts them?
1. Our core values include Collaboration, Kindness, and Improvement.
    - How well do you work within a team to collaborate and iterate on solutions?
    - How do you leverage your strengths to help your teammates improve?

### Deliverables will take two forms:
**The code you've written to meet the parameters of the challenge.**
- It doesn't have to be bulletproof but should include tests and documentation as you feel may be appropriate.

**A synchronous video discussion to review the challenge and talk through your approach and the considerations behind it.**
- We want to understand why you made the decisions you did and throw a few curveballs based on real-world feedback to see how you can collaboratively work through the feedback and iterate on your approaches.
- We will likely include some pairing on extensions to the challenge as well. Extensions will look different depending on your experience level and code submission. We'll let you know before the discussion if there's anything else to prepare.

Your code deliverable can either be an archive (tar or zip) - e.g., a downloaded snapshot from a Github repository - or just shared access to the repo itself.

We expect that you may have questions - the challenge is built inside Highwing's problem domain, which can sometimes be obtuse.  Please feel free to ask clarifying questions as you see fit. We'd much rather you ask for clarification than churn in isolation. For any questions specific to the challenge, you may reach the team by emailing code-challenge@highwing.io.

We don't want you to spend more than about 5 hours working on this challenge. If you don't finish everything, that's okay. Uncompleted questions are a good jumping-off point for the in-person discussion.


## The Problem

Highwing is in the process of onboarding a new insurance broker and looking to ingest their list of active insurance policies in order to make it available to insurance carriers to identify policies that they (the carrier) may be interested in competing to write. These policies are all property and casualty insurance - i.e., no health, benefits, or life. It comes from the broker's internal management systems, which have few (if any) validation capabilities built-in.

The ultimate goal is to expose this client's book to Highwing's carrier partners so that carrier users can spot opportunities that may be of interest to them and choose to pursue them. Chasing down an opportunity costs a fair bit of time, so we want to make sure that the data we provide to the carriers is good enough to be worth the effort they are investing to pursue. Carriers are specifically interested in policies that are renewing in the coming months - i.e., those that expire in the next 12 months. To that end, we want to evaluate this data with an eye towards two end goals - what work do we need to do with the broker to make this data ready for use, and how do we operationalize it on an ongoing basis?

## Choose Your Own Adventure

You may start with our existing Ruby codebase or start from scratch using whichever language(s) and framework(s) you prefer. Starting from scratch will require you to make some tradeoffs. Lean into the parts that showcase your talents or the parts you are most curious about. The existing Ruby codebase provides a head start by importing the data and exposing a few API endpoints. Read through all sections below before deciding on your strategy. We'd like to see some progress made into Part 3 below. Don't worry if you aren't able to finish since your stopping point is a perfect place to start our discussion.

### Adventure 1: Start with Existing Codebase (Most common)

---

#### 1. Existing Codebase Overview

This project is divided into two parts
1. `data_ingest`: the code responsible for importing data from arbitrary CSV files into a relational database
2. `data_api`: a minimal JSON api capable of querying and returning data from the database.

The `data/` directory contains the original data files provided for the exercise. Each sub-project has a separate README file to provide additional data on how to run the projects.

###### Overall Perspective

We built the Highwing Starter Repo with a focus on flexibility and performance of the data ingest. Given the nature of the challenge, the inconsistency of the data, and the business domain, we made the code capable of changing to meet new data structures or changes in the business requirements. We built a simple, expressive DSL capable of shaping the data into a consistent format along with validations to ensure that the incoming data met a standard prior to being imported into the database. Assuming a few unknowns, our goal was to make it as simple as possible to either reject invalid data or to morph the data to meet a specific format.

We wrote a very simple API to return the data as a JSON data structure.

Finally, we chose a few tools that that are simple and relatively dependency-light (ROM, the Dry libraries), which makes the database layer a bit more open-ended than the conventions Rails would otherwise provide. ROM provides more tooling for a cleaner configuration setup, but we did not make full use of that functionality.

#### 2. [Skip to Part 3](#part-3-upload-encrypted-client-csv-via-api)

### Adventure 2: Build Using Whichever Tools You Prefer

---

#### Part 1: Data Engineering
**(Skip if using the starter codebase)**

The data set consists of three tables - Clients, Carriers, and Policies. You can download them in CSV format [here](/data).

We're looking to load the data into a database to assess it and build some APIs around it. You may use whatever frameworks and helper libraries (e.g., Ruby, Rails, ActiveRecord, Sequel, Rake, Python, Pandas, raw SQL, Sidekiq/Active Job, etc.) you feel are a good fit.
Not a necessary implementation requirement, but be prepared to discuss the process of operationalizing your solution. How would you go about loading data into different environments given your solution? How would your solution adapt to a changing data model in the target database as API features expand? How would you manage updates to existing records, how would you scale for processing records to keep resources available to serve API requests? How would you manage or consider fault tolerance, retries, failed upserts, manual intervention, observation, and monitoring of the data pipeline? How would you ensure order of delivery if needed?

**Required:**

- Build an appropriate data model and script(s) to load data from the **Client CSV** file above into a relational database.
- A working solution need not have any UI but should have an executable task that can be run to load data and queried in a database console.

**For fun or if you'd like to showcase your data engineering chops:**

- Build an appropriate data model and set of scripts to load the remaining CSV files above into a relational database.

#### Part 2: API Design
**(Skip if using the starter codebase)**

Based on the data loaded in part 1, we'd like to start to implement API methods to begin accessing the data.

Build an API that returns some basic information from the data set.
We are not specifying an API protocol (HTTP, Grpc, etc.) or architectural style (REST/GraphQL/etc.), but assume your primary consumer of the API will be a frontend web application, and that the secondary consumer group might be B2B services.

**Required:**

- Return a list of all clients. We'll be checking this endpoint to validate the requirements outlined in Part 3.

You're welcome to use whatever frameworks and helper libraries you see fit to implement your API. There is no need for authentication or access control just yet.

#### Part 3: Upload Encrypted Client CSV Via API
**(Start here if using the starter codebase)**

**High Level Goal:** Our brokers send us data updates and we need to make sure our stored data accurately reflects these updates. For this exercise, you'll build an API endpoint that receives an encrypted file containing updated client records. After the endpoint receives the encrypted file, you'll need to decrypt it and update the clients table. Making a user wait for the file to process could be a frustrating experience. To improve this experience, let's trigger a background job from this new API endpoint and respond with a 200 status and a message stating that the file is being processed.. If using Ruby, something like Sidekiq could be a good option but you're welcome to reach for anything you'd like. Feel free to refactor code in the starter repo!

**Encryption/Decryption**
- We used GPG for encryption. You'll need to have the GPG command line tools installed.
Example: If using homebrew it should look something like:
```
$ brew install gnupg
```
- Or you can download a GnuPG package [here](https://gnupg.org/download/).
File dependencies (private.key, public.key, ClientUpdates.csv.gpg) are available in the [data/part_3_encryption](/data/part_3_encryption) directory
  - Note: We're storing these keys in fairly public spaces to make it easy for the code challenge. We don't condone this behavior ;)

- You should be able to import the private and public keys using something like:
```
$ gpg --import public.key
$ gpg --import private.key
```
- Once you have the keys imported you should be able to decrypt:

```
$ gpg --decrypt --output ClientUpdates.csv ClientUpdates.csv.gpg
```

- **Important:** We want to send the encrypted file to the API endpoint. The decryption process demonstrated above needs to be automated.

**Record Processing Requirements**

- Records that appear in the new spreadsheet and already exist in the table should be updated.
- Records that appear in the new spreadsheet but not in the table should be added.
- Records that appear in the table but not the spreadsheet should be left alone.
- IDs for records that exist in the table should not change when the new CSV is loaded.
- Clients require a name to be valid. We shouldn't store records that aren't valid but it would be good to know which records are invalid so we can fix them.

