CREATE  DATABASE IF NOT EXISTS blog;
GRANT ALL PRIVILEGES ON blog.* TO 'blog_api'@'%';
flush privileges;