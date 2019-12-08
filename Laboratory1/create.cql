CREATE KEYSPACE startit
  WITH REPLICATION = { 
   'class' : 'SimpleStrategy', 
   'replication_factor' : 1 
  };

USE startit;

CREATE TYPE resourcetype
(
  resource_name text,
  resource_content text,
  rating int,
);

CREATE TYPE materialtype (
  material_theme text,
  subject text,
  material_content text,
);

CREATE TYPE worktype (
  attempt int,
  mark int,
  test_result text,
  laboratory_name text,
  work_content text,
  plagiary int,
  operator_sequence text,
);

CREATE TYPE testtype (
  input_data text,
  expected_result text,
  on_fail_message text,
);

CREATE TABLE material (
  material_theme text,
  subject text,
  material_content text,
  similar_resources list<frozen<resourcetype>>,
  PRIMARY KEY (material_theme, subject)
);

CREATE TABLE student (
  record_book text,
  full_name text,
  email text,
  phone text,
  works list<frozen<worktype>>,
  PRIMARY KEY (record_book)
);

CREATE TABLE laboratory (
  laboratory_name text,
  variant int,
  task text,
  materials list<frozen<materialtype>> static,
  tests list<frozen<testtype>>,
  PRIMARY KEY (laboratory_name, variant)
);

CREATE TABLE resource (
  resource_name text,
  rating int,
  resource_content text,
  PRIMARY KEY (resource_name)
);
