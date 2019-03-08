\pset pager off

SELECT * FROM users;

SELECT * FROM posts WHERE user_id = 100;

SELECT posts.*, users.first_name, users.last_name FROM posts
INNER JOIN users ON posts.user_id = users.id;
WHERE posts.user_id = 200;

SELECT posts.*, users.username FROM posts
INNER JOIN users ON posts.user_id = users.id
WHERE users.first_name = 'Norene' AND users.last_name = 'Schmitt';

SELECT username FROM users
INNER JOIN posts ON posts.user_id = users.id
WHERE posts.created_at > '01/01/2015';

SELECT posts.title, posts.content, users.username FROM posts
INNER JOIN users ON posts.user_id = users.id
WHERE posts.created_at > '01/01/2015';

SELECT comments.*, posts.title AS "Post Title" FROM comments
INNER JOIN posts ON comments.post_id = posts.id;

SELECT comments.*, posts.title AS "post_title", posts.url AS "post_url", comments.body AS "comment_body" FROM comments
INNER JOIN posts ON comments.post_id = posts.id
WHERE posts.created_at < '01/01/2015';

SELECT comments.*, posts.title AS "post_title", posts.url AS "post_url", comments.body AS "comment_body" FROM comments
INNER JOIN posts ON comments.post_id = posts.id
WHERE posts.created_at > '01/01/2015';

SELECT comments.*, posts.title AS "post_title", posts.url AS "post_url", comments.body AS "comment_body" FROM comments
INNER JOIN posts ON comments.post_id = posts.id
WHERE comments.body LIKE '%USB%';

SELECT posts.title AS "post_title", users.first_name, users.last_name, comments.body AS "comment_body" FROM posts
INNER JOIN users ON posts.user_id = users.id
INNER JOIN comments ON posts.id = comments.post_id
WHERE comments.body LIKE '%matrix%';

SELECT users.first_name, users.last_name, comments.body AS "comment_body" FROM comments
INNER JOIN users ON comments.user_id = users.id
INNER JOIN posts ON comments.post_id = posts.id
WHERE comments.body LIKE '%SSL%' AND posts.content LIKE '%dolorum%';

SELECT users.first_name AS "post_author_first_name", users.last_name AS "post_author_last_name", posts.title AS "post_title", users.username AS "comment_author_username", comments.body AS "comment_body"
FROM posts
  INNER JOIN users ON posts.user_id = users.id
  INNER JOIN comments ON posts.id = comments.post_id
  WHERE ((comments.body) LIKE '%SSL%' OR (comments.body) LIKE '%firewall%')
  AND ((posts.content) LIKE '%nemo%');