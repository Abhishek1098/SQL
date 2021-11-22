# Advanced Sql 

# SQL Data Types and Schemas

## Some Built in Data Types
* date
* time
* timestamp
* interval: period of time
* extract (Can extract values of individual fields from date/time/timestamp)
* cast (can cast strings to date/time/timestamp)

## User Defined Types
* create type
```
create type Dollars as numeric (12,2) final
```
* create domain
```
create domain person_name char(20) not null
```
* Types and domains are similar. Domains can have constraints, such as **not null**, specified on them.

# Integrity Constraints

## Domain Constraints
* **Domain constraints** test values inserted into the database and test queries to ensure that the comparisons make sense
* New domains can be created from existing data types
```
create domain Dollars numeric(12,2)
```
```
create domain Pounds numeric(12,2)
```
* We can't **assign** or **compare** a value of type Dollars to Pounds
* However: We can convert by 
```
cast (r.A as Pounds)
```

## Large-Object Types
* Large objects (photos, videos, CAD files, etc.) are stored as a large object
* **blob**: binary large object
* **clob**: character large object
* When a query returns a large object, a pointer is returned rather than the large object itself

## Integrity Constraints
* Integrity constraints gaurd against accidental damage to the database, by ensuring that authorized changes to the database do not result in a loss of data consistency
* checking account > $10,000
* salary > $4 x hour
* customer must have a (non-null) phone number

## Constraints on a Single Relation
* not null
* primary key
* unique
* check(P), where P is a predicate

### Not Null
* Declare branch_name for branch is not null
```
branch_name char(15) not null
```
* Declare the domain Dollars to be not null
```
create domain Dollars numeric(12,2) not null
```

### Unique 
* unique(A1, A2, Am)
* Unique specification states that the attributes A1, A2, Am form a **candidate key**
* Candidate keys are permitted to be null (in constrast to primary keys)

### Check
* check(P) 
* P  = predicate
```
create table branch
    (branch_name char(15)
    branch_city char(30)
    assets  integer,
    primary key(branch_name)
    check(assets >= 0))
```
