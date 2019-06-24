CREATE TABLE friends
(
user_id NVARCHAR2(20),
user_name NVARCHAR2(20),
CONSTRAINT friends_pk PRIMARY KEY(user_id)
);

CREATE TABLE message
(
message_id NVARCHAR2(20),
id_user NVARCHAR2(20),
message NVARCHAR2(240),
CONSTRAINT message_pk PRIMARY KEY(message_id),
CONSTRAINT message_pk FOREIGN KEY(message_id) REFERENCES firends(id_user)
);

CREATE TABLE comment_message
(
    comment_id NVARCHAR2(20),
    message_id NVARCHAR2(20),
    user_id NVARCHAR2(20),
    comment_text NVARCHAR2(240),
    CONSTRAINT comment_message_pk PRIMARY KEY(comment_id),
    CONSTRAINT comment_message_fk_message FOREIGN KEY(message_id) REFERENCES message(message_id),
    CONSTRAINT comment_message_fk_user FOREIGN KEY(user_id) REFERENCES friends(user_id)
);

/*SET SERVEROUTPUT ON;
BEGIN
DBMS_OUTPUT.ENABLE();
END;*/
--Без таблички выдает ошибку ибо поля такого не существует
CREATE OR REPLACE TRIGGER delete_product
AFTER DELETE on products
FOR EACH ROW
DECLARE
del_name products.product_name%TYPE;
BEGIN
    del_name:=:old.product_name;
    dbms_output.put_line(del_name);
    INSERT INTO products VALUES
--С созданной табличкой
CREATE OR REPLACE TRIGGER delete_user
BEFORE DELETE ON friends
FOR EACH ROW
DECLARE
del_name friends.user_name%TYPE;
BEGIN

    del_name:=:old.user_name;
    dbms_output.put_line(del_name);

END delete_user;

CREATE TABLE zakaz
(
id_zakaz NUMBER(20),
product NVARCHAR2(20)
);
DROP TABLE zakaz;


CREATE OR REPLACE PROCEDURE update_zakaz(comand in NVARCHAR2, 
                                update_id ZAKAZ.id_zakaz%TYPE,
                                update_product ZAKAZ.product%TYPE)
IS

BEGIN
    if(comand='delete') then
        DElETE FROM zakaz
        WHERE id_zakaz=update_id;
    elsif(comand='update') then
    UPDATE zakaz
    SET product=product
    WHERE id_zakaz=update_id;
    elsif(comand='insert')
    then
    INSERT INTO zakaz
    VALUES(update_id,update_product);
    else
        dbms_output.put_line('Такой команды нету');    
    end if;
END update_zakaz;
/
EXEC update_zakaz('insert',1,1);

CREATE OR REPLACE PROCEDURE super_duper_proc(k NUMBER)
IS
    CURSOR curosr 
    IS
        SELECT name_manager, date_zakaz,sum(zakaz) summ, count(product_count) counter
        FROM zamov
        GROUP BY name_manager, date_zakaz;
    counter number(10);
    cursor_manage NVARCHAR2(20);
    cursor_date NVARCHAR2(20);
    cursor_sum NUMBER(20);
    cursor_counter NUMBER(20);
BEGIN
/*Неявный курсор, но он дерьмо ибо к хуй задашь
    FOR i IN curosr
    LOOP
        SELECT count(name_manager) INTO counter
        FROM ZAMOV
        WHERE name_manager=i.name_manager;
        IF(counter>k) THEN
            dbms_output.put_line(i.name_manager || i.date_zakaz || i.summ || i.counter);
        END IF;
    END LOOP;*/
    --Явный
    OPEN curosr;
    LOOP
        FETCH curosr INTO cursor_manage,cursor_date,cursor_sum,cursor_counter;
        SELECT count(name_manager) INTO counter
        FROM ZAMOV
        WHERE name_manager=cursor_manage;
        IF(counter>k) THEN
            dbms_output.put_line(cursor_manage.name_manager || cursor_date.date_zakaz || cursor_sum.summ || cursor_counter.counter);
        END IF;
        IF(curosr %NOTFOUND) THEN
            EXIT;
        END IF;
    END LOOP;
    CLOSE curosr;
END;


create or replace procedure
display_book_by_type
(i_type IN varchar)
as
begin
for c1 in
(select
au_lname,
au_fname, 
title
from 
authors au,
titleauthor ta,
titles ti
where 
ti.title_id = ta.title_id
and
ta.au_id = au.au_id
and rtrim(type) = i_type
)
loop
dbms_output.put_line(c1.au_lname||', '||c1.au_fname||': '||c1.title);
end loop;
end;

BEGIN 
   OPEN c_customers; 
   LOOP 
   FETCH c_customers into c_id, c_name, c_addr; 
      EXIT WHEN c_customers%notfound; 
      dbms_output.put_line(c_id || ' ' || c_name || ' ' || c_addr); 
   END LOOP; 
   CLOSE c_customers;


CREATE TABLE friends
(
user_id NVARCHAR2(20),
user_name NVARCHAR2(20),
CONSTRAINT friends_pk PRIMARY KEY(user_id)
);

CREATE TABLE message
(
message_id NVARCHAR2(20),
id_user NVARCHAR2(20),
message NVARCHAR2(240),
CONSTRAINT message_pk PRIMARY KEY(message_id),
CONSTRAINT message_pk FOREIGN KEY(message_id) REFERENCES firends(id_user)
);

CREATE TABLE comment_message
(
    comment_id NVARCHAR2(20),
    message_id NVARCHAR2(20),
    user_id NVARCHAR2(20),
    comment_text NVARCHAR2(240),
    CONSTRAINT comment_message_pk PRIMARY KEY(comment_id),
    CONSTRAINT comment_message_fk_message FOREIGN KEY(message_id) REFERENCES message(message_id),
    CONSTRAINT comment_message_fk_user FOREIGN KEY(user_id) REFERENCES friends(user_id)
);

/*SET SERVEROUTPUT ON;
BEGIN
DBMS_OUTPUT.ENABLE();
END;*/
—Aac oaaee?ee auaaao ioeaeo eai iiey oaeiai ia nouanoaoao
CREATE OR REPLACE TRIGGER delete_product
AFTER DELETE on products
FOR EACH ROW
DECLARE
del_name products.product_name%TYPE;
BEGIN
    del_name:=:old.product_name;
    dbms_output.put_line(del_name);
    INSERT INTO products VALUES
—N nicaaiiie oaaee?eie
CREATE OR REPLACE TRIGGER delete_user
BEFORE DELETE ON friends
FOR EACH ROW
DECLARE
del_name friends.user_name%TYPE;
BEGIN

    del_name:=:old.user_name;
    dbms_output.put_line(del_name);

END delete_user;

CREATE TABLE zakaz
(
id_zakaz NUMBER(20),
product NVARCHAR2(20)
);
DROP TABLE zakaz;


CREATE OR REPLACE PROCEDURE update_zakaz(comand in NVARCHAR2, 
                                update_id ZAKAZ.id_zakaz%TYPE,
                                update_product ZAKAZ.product%TYPE)
IS

BEGIN
    if(comand='delete') then
        DElETE FROM zakaz
        WHERE id_zakaz=update_id;
    elsif(comand='update') then
    UPDATE zakaz
    SET product=product
    WHERE id_zakaz=update_id;
    elsif(comand='insert')
    then
    INSERT INTO zakaz
    VALUES(update_id,update_product);
    else
        dbms_output.put_line('Oaeie eiiaiau iaoo');    
    end if;
END update_zakaz;
/
EXEC update_zakaz('insert',1,1);

CREATE OR REPLACE PROCEDURE super_duper_proc(k NUMBER)
IS
    CURSOR curosr 
    IS
        SELECT name_manager, date_zakaz,sum(zakaz) summ, count(product_count) counter
        FROM zamov
        GROUP BY name_manager, date_zakaz;
    counter number(10);
    cursor_manage NVARCHAR2(20);
    cursor_date NVARCHAR2(20);
    cursor_sum NUMBER(20);
    cursor_counter NUMBER(20);
BEGIN
/*Iayaiue eo?ni?, ii ii aa?uii eai e ooe caaaou
    FOR i IN curosr
    LOOP
        SELECT count(name_manager) INTO counter
        FROM ZAMOV
        WHERE name_manager=i.name_manager;
        IF(counter>k) THEN
            dbms_output.put_line(i.name_manager || i.date_zakaz || i.summ || i.counter);
        END IF;
    END LOOP;*/
    —?aiue
    OPEN curosr;
    LOOP
        FETCH curosr INTO cursor_manage,cursor_date,cursor_sum,cursor_counter;
        SELECT count(name_manager) INTO counter
        FROM ZAMOV
        WHERE name_manager=cursor_manage;
        IF(counter>k) THEN
            dbms_output.put_line(cursor_manage.name_manager || cursor_date.date_zakaz || cursor_sum.summ || cursor_counter.counter);
        END IF;
        IF(curosr %NOTFOUND) THEN
            EXIT;
        END IF;
    END LOOP;
    CLOSE curosr;
END;

Волынянын, [24.06.19 13:35]
create or replace trigger my_trig before update on hui 
for each row 
declare 
updated_column hui.col1%type;
begin 
    if(:new.col3 > 10) then 
        :new.col3 := 10;
    end if;
end my_trig;

Волынянын, [24.06.19 13:35]
create or replace trigger my_trig after update on hui 
for each row 
declare 
updated_column hui.col1%type;
begin 
    updated_column := :old.col1;
    dbms_output.put_line(updated_column);
end my_trig;