The exam will be comprehensive and will cover all of the chapters (Ch. 1, 6, 2, 3, 4, and 7) as well as the types of SQL queries we covered in the homework assignments. 
The exam will have around 7-10 questions, and the format and types of questions will be similar to those on the midterm exam.

* Standard SQL queries (for these types of queries, you're only allowed to use standard SQL syntax covered in class, and 5 standard aggregate functions, i.e., sum(), count(), avg(), max(), min()).
* Relational Expressions.
* Given an SQL query, convert it to a relational expression, and vice versa.
* Given an SQL query in one format, convert it to a different format (e.g., Nested Sub-Query to non-Nested Sub-Query, etc.).
* Questions about key concepts – as was the case on the midterm exam, I'm looking for answers "in your own words" (vs., taking answers from exercise questions, slides, etc.). For that reason, I expect everyone's answers to be "unique" (i.e., not resembling someone else's answers), but they also must be accurate and precise.

Some of the topics include (but are not limited to):
- Good tables vs. bad tables
- Design process
- BCNF
- 3NF
- LLJD (Lossless Join Decomposition)
- Dependency Preservation
- Various types of keys: Super keys, Candidate keys, Primary keys, Foreign keys
- Decomposition
- Armstrong’s Axioms + additional axioms derived from Armstrong's Axioms (including proofs, as in the exercise questions)
- Functional Dependencies
- Closure of Attribute Sets
- Set vs. Multi-Set
- Entity sets, Relationship sets
- Relation, Domain, Atomic Domain
- Cartesian Product vs. Joins
- Various Join types
- Derived Relations/Tables
- WITH, VIEWS
- Nested Sub-Queries
- DDL (e.g., domain constraints, check clause, referential integrity)


# Good tables vs. bad tables
A non-exhaustive list. For all these questions, yes is a good answer and no is bad.

* Does the table serve a clear business function? 
* How well does it fit the application's purpose?
* Is the table well-named? 
* Are the table's columns well-named? 
* Would a business user understand what they mean?
* Does the table have a primary key?
* Does the table have unique constraints on all the business (candidate) keys?
* Are all the foreign keys defined?
* Do all the columns with constrained values have a foreign key to a reference data table or a check constraint (or an enum for MySQL)?
* Do all the columns have the correct (strongest) data type?
* Is the table correctly normalised? (In an OLTP environment that means at least Boyce-Codd Normal Form, things are different in data warehouses.)
* Is the table free of any columns which hold "smart keys", CSV strings, JSON, XML, different data items whose meaning is dependent on metadata held in another column (or another table), or any other exotic structure which seemed like a good idea at the time but which will incur a legacy of horrible code and data corruption for years after?
* Are all the columns scalar, using recognised Oracle built-in data types (i.e. no nested tables or user-defined types)?
* Does the Physical Data Model diagram include the table?
* Is the table derivable from entities in the Logical Data Model diagram?
* Do you have scripts of the DDL for the table and its dependent objects? Are those scripts in source control?
* Does the table conform to whatever modelling and coding standards you have (if any)?
* Is the table physically implemented properly (e.g. all necessary indexes, index-organized if appropriate, partitioning if appropriate)?
* Is the table defensible? How comfortable would you be explaining it to another experienced data modeller, database developer or business user?

[src](https://stackoverflow.com/questions/50264281/how-to-evaluate-whether-a-tables-good-or-bad-in-a-database-system)


# Overall Database Design Process Overall Database Design Process

* We have assumed schema R is given
    * R could have been generated when converting E-R diagram to a set of tables.
    * R could have been a single relation containing all attributes that are of interest (called universal relation).
    * Normalization breaks R into smaller relations.
    * R could have been the result of some ad hoc design of relations, which we then test/convert to normal form.

[src](Chapter 7 Relational Database Design.pdf)

# BCNF

**Boyce–Codd normal form** (or BCNF or 3.5NF) is a normal form used in database normalization. It is a slightly stronger version of the **third normal form (3NF)**. BCNF was developed in 1974 by Raymond F. Boyce and Edgar F. Codd to address certain types of anomalies not dealt with by 3NF as originally defined.

If a relational schema is in BCNF then all redundancy based on functional dependency has been removed, although other types of redundancy may still exist. A relational schema R is in Boyce–Codd normal form if and only if for every one of its dependencies X → Y, at least one of the following conditions hold:
- X → Y is a trivial functional dependency (Y ⊆ X),
- X is a superkey for schema R.

[src](https://en.wikipedia.org/wiki/Boyce%E2%80%93Codd_normal_form)