from cassandra.cluster import Cluster
from cassandra.query import SimpleStatement
from cassandra import ConsistencyLevel

cluster = Cluster()
session = cluster.connect('startit')

query1 = SimpleStatement("""
INSERT INTO material (material_theme, subject, material_content, similar_resources)
VALUES ('First laboratory material', 'Math modeling', 'Very interesting content',
[{resource_name: 'external resource, proposed by students', resource_content: 'maybe this is useful content', rating: 0},
{resource_name: 'one more external resource, proposed by students', resource_content: 'maybe this is a useful content', rating: 0}]);
""", consistency_level=ConsistencyLevel.ONE)
query2 = SimpleStatement("""
INSERT INTO material (material_theme, subject, material_content, similar_resources)
VALUES ('Second laboratory material', 'Math modeling', 'Less interesting content',
[{resource_name: 'external resource 2, proposed by students', resource_content: 'Im resource_content for the second lab!', rating: 0},
{resource_name: 'another one external resource 2, proposed by students', resource_content: 'one more external resource 2, proposed by students', rating: 0}]);
""", consistency_level=ConsistencyLevel.ONE)
query3 = SimpleStatement("""
INSERT INTO material (material_theme, subject, material_content, similar_resources)
VALUES ('Third laboratory material', 'Math modeling', 'Even less interesting content',
[{resource_name: 'external resource 3, proposed by students', resource_content: 'Im resource_content for the third lab!', rating: 0},
{resource_name: 'another one external resource 3, proposed by students', resource_content: 'one more external resource 3, proposed by students', rating: 0}]);
""", consistency_level=ConsistencyLevel.ONE)
session.execute(query1)
session.execute(query2)
session.execute(query3)
rows = session.execute("SELECT * FROM material;")
for row in rows:
    print(row)


query1 = SimpleStatement("""
INSERT INTO student (record_book, full_name, email, phone, works) VALUES ('KM-7316', 'Boniface Purbrick', 'bpurbrick0@businesswire.com', '646-746-2444',
[{attempt: 1, mark: 0, test_result: 'Memory error', plagiary: 15, laboratory_name: 'Solving integrals by numerical methods', work_content: 'here is laboratory implementation'},
{attempt: 2, mark: 3, test_result: 'Case with non-continuous function failed', plagiary: 18, laboratory_name: 'Solving integrals by numerical methods', work_content: 'here is laboratory implementation', operator_sequence: 'WddSSqwdq'}]);
""", consistency_level=ConsistencyLevel.ONE)
query2 = SimpleStatement("""
INSERT INTO student (record_book, full_name, email, phone, works) VALUES ('KM-7319', 'Mack Kynson', 'mkynson1@businessweek.com', '829-642-4291',
[{attempt: 1, mark: 8, test_result: 'All tests passed', plagiary: 15, laboratory_name: 'Solving integrals by numerical methods', work_content: 'here is laboratory implementation', operator_sequence: 'AddWsQdds'}]);
""", consistency_level=ConsistencyLevel.ONE)
query3 = SimpleStatement("""
INSERT INTO student (record_book, full_name, email, phone, works) VALUES ('KM-7315', 'Jemmie Filppetti', 'jfilppetti2@marketwatch.com', '754-196-4964', [{attempt: 1, mark: 8, test_result: 'All tests passed', plagiary: 8, laboratory_name: 'Solving integrals by numerical methods', work_content: 'here is laboratory implementation', operator_sequence: 'dWSaDdds'}]);
""", consistency_level=ConsistencyLevel.ONE)
session.execute(query1)
session.execute(query2)
session.execute(query3)
rows = session.execute("SELECT * FROM student;")
for row in rows:
    print(row)


query1 = SimpleStatement("""
INSERT INTO laboratory (laboratory_name, variant, task, materials, tests) VALUES ('Laboratory1', 1, 'Do laboratory1', [{material_theme: 'First laboratory material', subject: 'Math modeling', material_content: 'Very interesting content'}], [{input_data: '{args: [0, 1, 1, 2]}', expected_result: '{returnValue: 0}', on_fail_message: 'Incorrect value returned'}]);
""", consistency_level=ConsistencyLevel.ONE)
query2 = SimpleStatement("""
INSERT INTO laboratory (laboratory_name, variant, task, materials, tests) VALUES ('Laboratory2', 1, 'Do laboratory2', [{material_theme: 'Second laboratory material', subject: 'Math modeling', material_content: 'Less interesting content'}], [{input_data: '{args: [10, 11, 321, 20]}', expected_result: '{returnValue: 198}', on_fail_message: 'Incorrect value returned'}]);
""", consistency_level=ConsistencyLevel.ONE)
query3 = SimpleStatement("""
INSERT INTO laboratory (laboratory_name, variant, task, materials, tests) VALUES ('Laboratory3', 1, 'Do laboratory3', [{material_theme: 'Third laboratory material', subject: 'Math modeling', material_content: 'Even less interesting content'}], [{input_data: '{args: [10, "3"]}', expected_result: '{raisedException: TypeError}', on_fail_message: 'Exception didnt raise'}]);
""", consistency_level=ConsistencyLevel.ONE)
session.execute(query1)
session.execute(query2)
session.execute(query3)
rows = session.execute("SELECT * FROM laboratory;")
for row in rows:
    print(row)


query1 = SimpleStatement("""
INSERT INTO resource (resource_name, rating, resource_content) VALUES ('one more external resource, proposed by students', 0, 'maybe this is useful content');
""", consistency_level=ConsistencyLevel.ONE)
query2 = SimpleStatement("""
INSERT INTO resource (resource_name, rating, resource_content) VALUES ('another one external resource 2', 0, 'Im resource_content for the second lab!');
""", consistency_level=ConsistencyLevel.ONE)
query3 = SimpleStatement("""
INSERT INTO resource (resource_name, rating, resource_content) VALUES ('external resource 3, proposed by students', 0, 'Im resource_content for the third lab!');
""", consistency_level=ConsistencyLevel.ONE)
session.execute(query1)
session.execute(query2)
session.execute(query3)
rows = session.execute("SELECT * FROM resource;")
for row in rows:
    print(row)


query1 = SimpleStatement("""
UPDATE material SET material_content='new material content' WHERE material_theme='First laboratory material' AND subject='Math modeling';
""", consistency_level=ConsistencyLevel.ONE)
query2 = SimpleStatement("""
UPDATE material SET similar_resources=[{resource_name: 'new resource name', resource_content: 'Im resource_content for the second lab!', rating: 0}, {resource_name: 'another one external resource 2, proposed by students', resource_content: 'new resource content', rating: 0}] WHERE material_theme='Second laboratory material' AND subject='Math modeling';
""", consistency_level=ConsistencyLevel.ONE)
query3 = SimpleStatement("""
UPDATE material SET material_content='breaking content' WHERE material_theme='Third laboratory material' AND subject='Math modeling';
""", consistency_level=ConsistencyLevel.ONE)
session.execute(query1)
session.execute(query2)
session.execute(query3)
rows = session.execute("SELECT * FROM material;")
for row in rows:
    print(row)


query1 = SimpleStatement("""
UPDATE student SET phone='646-746-2440' WHERE record_book='KM-7316';
""", consistency_level=ConsistencyLevel.ONE)
query2 = SimpleStatement("""
UPDATE student SET email='abc@dot.com' WHERE record_book='KM-7319';
""", consistency_level=ConsistencyLevel.ONE)
query3 = SimpleStatement("""
UPDATE student SET works=[{attempt: 1, mark: 8, test_result: 'All tests passed', plagiary: 15, laboratory_name: 'Solving integrals by numerical methods', work_content: 'here is laboratory implementation', operator_sequence: 'AddWsQdds'}, {attempt: 1, mark: 8, test_result: 'All tests passed', plagiary: 6, laboratory_name: 'Zero-order methods', work_content: 'here is laboratory implementation', operator_sequence: 'ddwQaSAsdQ'}] WHERE record_book='KM-7315';
""", consistency_level=ConsistencyLevel.ONE)
session.execute(query1)
session.execute(query2)
session.execute(query3)
rows = session.execute("SELECT * FROM student;")
for row in rows:
    print(row)


query1 = SimpleStatement("""
UPDATE laboratory SET task='new_task' WHERE laboratory_name='Laboratory1' AND variant=1;
""", consistency_level=ConsistencyLevel.ONE)
query2 = SimpleStatement("""
UPDATE laboratory SET materials=[{material_theme: 'new material', subject: 'Math modeling', material_content: 'new content'}] WHERE laboratory_name='Laboratory2' AND variant=1;
""", consistency_level=ConsistencyLevel.ONE)
query3 = SimpleStatement("""
UPDATE laboratory SET task='new_task for v1' WHERE laboratory_name='Laboratory2' AND variant=1;
""", consistency_level=ConsistencyLevel.ONE)
session.execute(query1)
session.execute(query2)
session.execute(query3)
rows = session.execute("SELECT * FROM laboratory;")
for row in rows:
    print(row)


query1 = SimpleStatement("""
UPDATE resource SET rating=1 WHERE resource_name='one more external resource, proposed by students';
""", consistency_level=ConsistencyLevel.ONE)
query2 = SimpleStatement("""
UPDATE resource SET resource_content='new content' WHERE resource_name='one more external resource, proposed by students';
""", consistency_level=ConsistencyLevel.ONE)
query3 = SimpleStatement("""
UPDATE resource SET rating=1 WHERE resource_name='another one external resource 2';
""", consistency_level=ConsistencyLevel.ONE)
session.execute(query1)
session.execute(query2)
session.execute(query3)
rows = session.execute("SELECT * FROM resource;")
for row in rows:
    print(row)


query1 = SimpleStatement("""
SELECT similar_resources FROM material WHERE material_theme='First laboratory material' AND subject='Math modeling';
""", consistency_level=ConsistencyLevel.ONE)
query2 = SimpleStatement("""
SELECT full_name, works FROM student WHERE record_book='KM-7316';
""", consistency_level=ConsistencyLevel.ONE)
query3 = SimpleStatement("""
SELECT laboratory_name, materials FROM laboratory WHERE laboratory_name='Laboratory1';
""", consistency_level=ConsistencyLevel.ONE)
query4 = SimpleStatement("""
SELECT task, tests FROM laboratory WHERE laboratory_name='Laboratory1';
""", consistency_level=ConsistencyLevel.ONE)
rows1 = session.execute(query1)
rows2 = session.execute(query2)
rows3 = session.execute(query3)
rows4 = session.execute(query4)

print('First query result')
for row in rows1:
    print(row)

print('Second query result')
for row in rows2:
    print(row)

print('Third query result')
for row in rows3:
    print(row)

print('Fourth query result')
for row in rows4:
    print(row)


query1 = SimpleStatement("""
DELETE FROM material WHERE material_theme='First laboratory material' AND subject='Math modeling';
""", consistency_level=ConsistencyLevel.ONE)
query2 = SimpleStatement("""
DELETE FROM material WHERE material_theme='Second laboratory material' AND subject='Math modeling';
""", consistency_level=ConsistencyLevel.ONE)
query3 = SimpleStatement("""
DELETE FROM material WHERE material_theme='Third laboratory material' AND subject='Math modeling';
""", consistency_level=ConsistencyLevel.ONE)
session.execute(query1)
session.execute(query2)
session.execute(query3)
rows = session.execute("SELECT * FROM material;")
for row in rows:
    print(row)


query1 = SimpleStatement("""
DELETE FROM student WHERE record_book='KM-7316';
""", consistency_level=ConsistencyLevel.ONE)
query2 = SimpleStatement("""
DELETE FROM student WHERE record_book='KM-7319';
""", consistency_level=ConsistencyLevel.ONE)
query3 = SimpleStatement("""
DELETE FROM student WHERE record_book='KM-7315';
""", consistency_level=ConsistencyLevel.ONE)
session.execute(query1)
session.execute(query2)
session.execute(query3)
rows = session.execute("SELECT * FROM student;")
for row in rows:
    print(row)


query1 = SimpleStatement("""
DELETE FROM laboratory WHERE laboratory_name='Laboratory1' AND variant=1;
""", consistency_level=ConsistencyLevel.ONE)
query2 = SimpleStatement("""
DELETE FROM laboratory WHERE laboratory_name='Laboratory2' AND variant=1;
""", consistency_level=ConsistencyLevel.ONE)
query3 = SimpleStatement("""
DELETE FROM laboratory WHERE laboratory_name='Laboratory3' AND variant=1;
""", consistency_level=ConsistencyLevel.ONE)
session.execute(query1)
session.execute(query2)
session.execute(query3)
rows = session.execute("SELECT * FROM laboratory;")
for row in rows:
    print(row)


query1 = SimpleStatement("""
DELETE FROM resource WHERE resource_name='one more external resource, proposed by students';
""", consistency_level=ConsistencyLevel.ONE)
query2 = SimpleStatement("""
DELETE FROM resource WHERE resource_name='another one external resource 2';
""", consistency_level=ConsistencyLevel.ONE)
query3 = SimpleStatement("""
DELETE FROM resource WHERE resource_name='external resource 3, proposed by students';
""", consistency_level=ConsistencyLevel.ONE)
session.execute(query1)
session.execute(query2)
session.execute(query3)
rows = session.execute("SELECT * FROM resource;")
for row in rows:
    print(row)

