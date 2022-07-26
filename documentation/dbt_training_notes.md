#dbt training notes
## Vanderbilt / Northlabs


Recommended training course: https://courses.getdbt.com/courses/fundamentals
Note: It teaches the use of the cloud based ui, we use visual studio code on our local machines instead.  

- dbt training for VU team  
    - init setup 
        - macros
            - star.sql
            - generate_schema_name.sql
        - configure basics
        - .dbt/profile 
        - 

    - patterns and best practices
        - ## Naming Conventions
            - In working on this project, we established some conventions for naming our models.
                - **Sources** (src) refer to the raw table data that have been built in the warehouse through a loading process. (We will cover configuring Sources in the Sources module)
                - **Staging** (stg) refers to models that are built directly on top of sources. These have a one-to-one relationship with sources tables. These are used for very light transformations that shape the data into what you want it to be. These models are used to clean and standardize the data before transforming data downstream. Note: These are typically materialized as views.
                - **Intermediate** (int) refers to any models that exist between final fact and dimension tables. These should be built on staging models rather than directly on sources to leverage the data cleaning that was done in staging.
                - **Fact** (fct) refers to any data that represents something that occurred or is occurring. Examples include sessions, transactions, orders, stories, votes. These are typically skinny, long tables.
                - **Dimension** (dim) refers to data that represents a person, place or thing. Examples include customers, products, candidates, buildings, employees.
                - Note: The Fact and Dimension convention is based on previous normalized modeling techniques.
        - Model Naming Convention
            - Source
            - Stages: stg_source_name__table_name
            - Intermediate: int_meaningful name 
            - Facts fct_meaningful_name
            - Dimensions - dim_meaninful_name 
        - workflow 
            - Setup
                - install dbt 
                - clone dbt repo 
                - config .dbt/profiles.yml
                - dbt debug
                - dbt run 
                - debt test 
                - checkout results in snowflake
                -
            - git checkout -b user_name (or other branch name)
            - Edit 
                - dbt deps 
                - dbt seed
                - dbt run 
                    - dbt run -s/--select ????? ++
                - dbt test
            - 
        - packages.yml
            - keep updating as they come out with newer versions. 
        - 
    - code review
        - Naming standards followed
        - yml file with basic info and tests for each model 
- additional related knowledge required 
    - Learn features in VS Code 
        - Extensions
            - Better Jinja
            - Rainbow CSV
            - vscode-dbt
            - YAML 
            - dbt Power User 
        - techniques
            - split window
            - markdown view
            - terminal
            - 
    - tool to connect to snowflake to build and run SQL 
        - I use Coginiti Pro ~ $150/year individuals
        - dBeaver has a free version
        - https://dwgeek.com/sql-editor-available-for-snowflake.html/
        - https://docs.snowflake.com/en/user-guide/ecosystem-editors.html
    - branching and merging in git
    - reverse engineering from snowflake
    - code generation 

References: 
https://www.markdownguide.org/cheat-sheet/

https://code.visualstudio.com/docs/languages/markdown




Tuesday 07/12/2022 
* review prior lessons
    * clone repo - git clone https://devops.app.vanderbilt.edu/bitbucket/scm/do/dbt-snowflake002.git

    * cd to dbt 
    * dbt deps
    * dbt seed 
    * dbt run 
    * dbt test 
    * Product Files: 
        * dbt_project.yml 
        * packages.yml
    * Directory Organization f
        * Models
            * staging 
            * models
            * Marts
                * alumni
    * Staging layer 
        * src_source_name.yml
            * maps the raw database and schema to a short name. 
            *lists all the tables in raw layer
        * sql - light transformation - trim, rename_id, source column, dedupe logic. 
        * yml - List of columns and basics tests 

* Today's Lesson
    * Modeling 101 
    * CTE - Common Table Expressions
    
