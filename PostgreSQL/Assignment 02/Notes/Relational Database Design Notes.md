# Chapter 7: Relational Database Design

**Primary Key** is a unique and non-null key which identify a record uniquely in table. **Candidate key** is also a unique key to identify a record uniquely in a table but a table can have multiple candidate keys.

**Lossy Decomposition** bad

## First Normal Form

**Domain** is **atomic** if elements that make it up are indivisble.

A relational schema R is in **first normal** form if the domains of all 
attributes of R are atomic.

Atomicity is actually a property of how the elements of the domain are 
used.
Strings would normally be atomic but for example: 'CS115' 'CS112'
The first 2 chars represent section.

**Doing so is a bad idea: leads to encoding of information in 
application program rather than in the database.**

## Goal:
*Decide whether a particular relation R is in “good” form.*
In the case that a relation R is not in “good” form, decompose it into a set of relations {R1, R2, ..., Rn} such that 
1. each relation is in good form 
2. the decomposition is a lossless-join decomposition

Our theory is based on:
1. **functional dependencies**
2. **multivalued dependencies**

## Functional Dependency

>What is Functional Dependency?
>Functional Dependency (FD) is a constraint that determines the relation of one attribute to another attribute in a Database Management System (DBMS). Functional Dependency helps to maintain the quality of data in the database. It plays a vital role to find the difference between good and bad database design.
[Source](https://www.guru99.com/dbms-functional-dependency.html)

Other columns are functional dependent on primary key of table.

1. Constraints on the set of legal relations
2. Require that the value for a certain set of attributes determines uniquely the value of another set of attributes
3. its a **key**
