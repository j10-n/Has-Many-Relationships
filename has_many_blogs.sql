DROP DATABASE IF EXISTS has_many_blogs;
DROP USER IF EXISTS has_many_user;
CREATE USER has_many_user;
CREATE DATABASE has_many_blogs WITH OWNER has_many_user;

\c has_many_blogs;

DROP TABLE IF EXISTS users;
CREATE TABLE users(
    ID serial NOT NULL PRIMARY KEY,
    username character varying(90) NOT NULL,
    first_name character varying(90) NULL DEFAULT NULL,
    last_name character varying(90) NULL DEFAULT NULL,
    created_at timestamp with time zone NOT NULL DEFAULT now(),
    updated_at timestamp with time zone NOT NULL DEFAULT now()
);

DROP TABLE IF EXISTS posts;
CREATE TABLE posts (
  ID SERIAL PRIMARY KEY NOT NULL,
  title character varying(180) NULL DEFAULT NULL,
  url character varying(510) NULL DEFAULT NULL,
  content text NULL DEFAULT NULL,
  created_at timestamp with time zone NOT NULL DEFAULT now(),
  updated_at timestamp with time zone NOT NULL DEFAULT now(),
  user_id INTEGER REFERENCES users(id)
);

DROP TABLE IF EXISTS comments;
CREATE TABLE comments (
  ID SERIAL PRIMARY KEY NOT NULL,
  body character varying(510) NULL DEFAULT NULL,
  created_at timestamp with time zone NOT NULL DEFAULT now(),
  updated_at timestamp with time zone NOT NULL DEFAULT now(),
  post_id INTEGER REFERENCES posts(id),
  user_id INTEGER REFERENCES users(id)
);

CREATE INDEX index_for_users
  ON users (first_name, last_name);

CREATE INDEX index_for_posts
  ON posts (title, url, content);

CREATE INDEX index_for_comments
  ON comments (body);

\i scripts/blog_data.sql;
