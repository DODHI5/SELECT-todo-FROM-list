-- drop a database named `todo_app` if it exists
DROP DATABASE IF EXISTS  todo_app;

-- delete a user named `michael` if it exists
DROP ROLE IF EXISTS michael;

-- create a user named `michael` with an encrypted password `stonebreaker`
CREATE USER michael  WITH  ENCRYPTED  PASSWORD 'stonebreaker';

-- create a database named `todo_app`
CREATE DATABASE todo_app;

\c todo_app;

-- create a table named `tasks`
CREATE TABLE tasks (
  id serial,
  title VARCHAR (255) NOT NULL,
  description text NULL,
  created_at timestamp without time zone NOT NULL DEFAULT NOW(),
  updated_at timestamp without time zone NULL,
  completed boolean NOT NULL DEFAULT FALSE
);

ALTER TABLE tasks
 ADD PRIMARY KEY(id),

 DROP COLUMN completed,

 ADD COLUMN completed_at timestamp NULL DEFAULT NULL,

  ALTER COLUMN updated_at SET NOT NULL,

  ALTER COLUMN updated_at SET DEFAULT NOW();

INSERT INTO tasks (id,title,description,created_at,updated_at,completed_at)
VALUES (DEFAULT, 'Study SQL', 'Complete this exercise', NOW(), NOW(), NULL);

INSERT INTO tasks (title, description)
  VALUES ('Study PostgreSQL','Read all the documentation');

SELECT title
FROM tasks
WHERE completed_at is NULL;

UPDATE tasks 
SET completed_at = NOW()  
WHERE title = 'Study SQL';

SELECT title, description
FROM tasks
WHERE completed_at is NULL;

SELECT *
FROM tasks
ORDER BY created_at DESC;

INSERT INTO tasks (title, description)
  VALUES ('mistake 1','a test entry');

INSERT INTO tasks (title, description)
  VALUES ('mistake 2','another test entry');

INSERT INTO tasks (title, description)
  VALUES ('mistake 3','another test entry');

SELECT title
FROM tasks
WHERE title ~ 'mistake';

DELETE FROM tasks
WHERE title = 'mistake 1';

SELECT title, description
FROM tasks
WHERE title ~ 'mistake';

DELETE FROM tasks
WHERE title ~ 'mistake';

SELECT *
FROM tasks
ORDER BY title ASC ;

  