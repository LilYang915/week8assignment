use projects;
DROP TABLE IF EXISTS project;
DROP TABLE IF EXISTS material;
DROP TABLE IF EXISTS step;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS project_category;

create table project (
	project_id INT AUTO_INCREMENT not null,
	project_name VARCHAR(128) not NULL,
	estimated_hours DECIMAL(7,2),
	actual_hours DECIMAL(7,2),
	difficulty INT,
	notes TEXT, 
	primary key (project_id)
);

create table material (
material_id INT not null,
project_id INT not null,
material_name VARCHAR(128) not null,
num_required INT,
cost DECIMAL(7,2),
primary key (material_id),
 FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE
);

create table step (

step_id INT not null,
project_id INT not null,
step_text TEXT not null,
step_order INT not null,
primary key (step_id),
 FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE
);

create table category (

category_id INT not null,
category_name VARCHAR(128) not null,
primary key (category_id)

);

create table project_category (
project_id INT not null,
category_id INT not null,
 FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE cascade,
 FOREIGN KEY (category_id) REFERENCES category (category_id) ON DELETE cascade,
 unique key (project_id, category_id)
 
);


