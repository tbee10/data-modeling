ccreate table users (
user_id serial primary key,
email text not null, 
"password" text not null,
ip_address text not null
);

create table recipe_posts (
post_id serial primary key,
user_id int not null references users(user_id),
recipe_post text not null,
ingredients_instructions text not null unique,
image_url text not null,
date_created timestamp with time zone not null
);

create table comments (
comment_id serial primary key,
user_id int not null references users(user_id),
post_id int not null references recipe_posts(post_id),
body text not null
);

create table recipe_groups (
group_id serial primary key,
recipe_group_posts text not null
);

create table recipe_groups_users_join (
id serial primary key,
user_id int not null references users(user_id),
group_id int not null references recipe_groups(group_id)
);

create table recipe_group_posts (
id serial primary key,
post_id int not null references recipe_posts(post_id),
group_id int not null references recipe_groups(group_id)
);

create table grocery_list (
ingredients_from_recipes text not null references recipe_posts(ingredients_instructions)
);