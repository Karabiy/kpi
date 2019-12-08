INSERT INTO material (material_theme, subject, material_content, similar_resources) VALUES ('First laboratory material', 'Math modeling', 'Very interesting content', [{resource_name: 'external resource, proposed by students', resource_content: 'maybe this is useful content', rating: 0}, {resource_name: 'one more external resource, proposed by students', resource_content: 'maybe this is a useful content', rating: 0}]);

INSERT INTO material (material_theme, subject, material_content, similar_resources) VALUES ('Second laboratory material', 'Math modeling', 'Less interesting content', [{resource_name: 'external resource 2, proposed by students', resource_content: 'Im resource_content for the second lab!', rating: 0}, {resource_name: 'another one external resource 2, proposed by students', resource_content: 'one more external resource 2, proposed by students', rating: 0}]);

INSERT INTO material (material_theme, subject, material_content, similar_resources) VALUES ('Third laboratory material', 'Math modeling', 'Even less interesting content', [{resource_name: 'external resource 3, proposed by students', resource_content: 'Im resource_content for the third lab!', rating: 0}, {resource_name: 'another one external resource 3, proposed by students', resource_content: 'one more external resource 3, proposed by students', rating: 0}]);

SELECT * FROM material;


INSERT INTO student (record_book, full_name, email, phone, works) VALUES ('KM-7316', 'Boniface Purbrick', 'bpurbrick0@businesswire.com', '646-746-2444', [{attempt: 1, mark: 0, test_result: 'Memory error', plagiary: 15, laboratory_name: 'Solving integrals by numerical methods', work_content: 'here is laboratory implementation'}, {attempt: 2, mark: 3, test_result: 'Case with non-continuous function failed', plagiary: 18, laboratory_name: 'Solving integrals by numerical methods', work_content: 'here is laboratory implementation', operator_sequence: 'WddSSqwdq'}]);

INSERT INTO student (record_book, full_name, email, phone, works) VALUES ('KM-7319', 'Mack Kynson', 'mkynson1@businessweek.com', '829-642-4291', [{attempt: 1, mark: 8, test_result: 'All tests passed', plagiary: 15, laboratory_name: 'Solving integrals by numerical methods', work_content: 'here is laboratory implementation', operator_sequence: 'AddWsQdds'}]);

INSERT INTO student (record_book, full_name, email, phone, works) VALUES ('KM-7315', 'Jemmie Filppetti', 'jfilppetti2@marketwatch.com', '754-196-4964', [{attempt: 1, mark: 8, test_result: 'All tests passed', plagiary: 8, laboratory_name: 'Solving integrals by numerical methods', work_content: 'here is laboratory implementation', operator_sequence: 'dWSaDdds'}]);

SELECT * FROM student;


INSERT INTO laboratory (laboratory_name, variant, task, materials, tests) VALUES ('Laboratory1', 1, 'Do laboratory1', [{material_theme: 'First laboratory material', subject: 'Math modeling', material_content: 'Very interesting content'}], [{input_data: '{args: [0, 1, 1, 2]}', expected_result: '{returnValue: 0}'}, on_fail_message: 'Incorrect value returned']);

INSERT INTO laboratory (laboratory_name, variant, task, materials, tests) VALUES ('Laboratory2', 1, 'Do laboratory2', [{material_theme: 'Second laboratory material', subject: 'Math modeling', material_content: 'Less interesting content'}], [{input_data: '{args: [10, 11, 321, 20]}', expected_result: '{returnValue: 198}, on_fail_message: 'Incorrect value returned'}]);

INSERT INTO laboratory (laboratory_name, variant, task, materials, tests) VALUES ('Laboratory3', 1, 'Do laboratory3', [{material_theme: 'Third laboratory material', subject: 'Math modeling', material_content: 'Even less interesting content'}], [{input_data: '{args: [10, "3"]}', expected_result: '{raisedException: TypeError}, on_fail_message: 'Exception didnt raise'}]);

SELECT * FROM laboratory;


INSERT INTO resource (resource_name, rating, resource_content) VALUES ('one more external resource, proposed by students', 0, 'maybe this is useful content');
INSERT INTO resource (resource_name, rating, resource_content) VALUES ('another one external resource 2', 0, 'Im resource_content for the second lab!');
INSERT INTO resource (resource_name, rating, resource_content) VALUES ('external resource 3, proposed by students', 0, 'Im resource_content for the third lab!');

SELECT * FROM resource;


UPDATE material SET material_content='new material content' WHERE material_theme='First laboratory material' AND subject='Math modeling';
UPDATE material SET similar_resources=[{resource_name: 'new resource name', resource_content: 'Im resource_content for the second lab!', rating: 0}, {resource_name: 'another one external resource 2, proposed by students', resource_content: 'new resource content', rating: 0}] WHERE material_theme='Second laboratory material' AND subject='Math modeling';
UPDATE material SET material_content='breaking content' WHERE material_theme='Third laboratory material' AND subject='Math modeling';

SELECT * FROM material;


UPDATE student SET phone='646-746-2440' WHERE record_book='KM-7316';
UPDATE student SET email='abc@dot.com' WHERE record_book='KM-7319';
UPDATE student SET works=[{attempt: 1, mark: 8, test_result: 'All tests passed', plagiary: 15, laboratory_name: 'Solving integrals by numerical methods', work_content: 'here is laboratory implementation', operator_sequence: 'AddWsQdds'}, {attempt: 1, mark: 8, test_result: 'All tests passed', plagiary: 6, laboratory_name: 'Zero-order methods', work_content: 'here is laboratory implementation', operator_sequence: 'ddwQaSAsdQ'}] WHERE record_book='KM-7315';

SELECT * FROM student;


UPDATE laboratory SET task='new_task' WHERE laboratory_name='Laboratory1' AND variant=1;
UPDATE laboratory SET materials=[{material_theme: 'new material', subject: 'Math modeling', material_content: 'new content'}] WHERE laboratory_name='Laboratory2' AND variant=1;
UPDATE laboratory SET task='new_task for v1' WHERE laboratory_name='Laboratory2' AND variant=1;

SELECT * FROM laboratory;


UPDATE resource SET rating=1 WHERE resource_name='one more external resource, proposed by students';
UPDATE resource SET resource_content='new content' WHERE resource_name='one more external resource, proposed by students';
UPDATE resource SET rating=1 WHERE resource_name='another one external resource 2';

SELECT * FROM resource;


SELECT similar_resources FROM material WHERE material_theme='First laboratory material' AND subject='Math modeling';
SELECT full_name, works FROM student WHERE record_book='KM-7316';
SELECT laboratory_name, materials FROM laboratory WHERE laboratory_name='Laboratory1';
SELECT task, tests FROM laboratory WHERE laboratory_name='Laboratory1';


DELETE FROM material WHERE material_theme='First laboratory material' AND subject='Math modeling';
DELETE FROM material WHERE material_theme='Second laboratory material' AND subject='Math modeling';
DELETE FROM material WHERE material_theme='Third laboratory material' AND subject='Math modeling';

SELECT * FROM material;


DELETE FROM student WHERE record_book='KM-7316';
DELETE FROM student WHERE record_book='KM-7319';
DELETE FROM student WHERE record_book='KM-7315';

SELECT * FROM student;


DELETE FROM laboratory WHERE laboratory_name='Laboratory1' AND variant=1;
DELETE FROM laboratory WHERE laboratory_name='Laboratory2' AND variant=1;
DELETE FROM laboratory WHERE laboratory_name='Laboratory3' AND variant=1;

SELECT * FROM laboratory;


DELETE FROM resource WHERE resource_name='one more external resource, proposed by students';
DELETE FROM resource WHERE resource_name='another one external resource 2';
DELETE FROM resource WHERE resource_name='external resource 3, proposed by students';

SELECT * FROM student;

