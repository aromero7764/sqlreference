CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "name" varchar,
  "email" varchar,
  "password" varchar,
  "age" int8,
  "courses_id" uuid,
  "rol" int
);

CREATE TABLE "courses" (
  "id" uuid PRIMARY KEY,
  "title" varchar,
  "description" text,
  "level" int,
  "teacher_id" int,
  "couse_videos" int,
  "category_id" int
);

CREATE TABLE "course_level" (
  "id" int PRIMARY KEY,
  "level_name" varchar
);

CREATE TABLE "teacher" (
  "id" int PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "course_video" (
  "id" int PRIMARY KEY,
  "title" varchar,
  "url_video" varchar
);

CREATE TABLE "categories" (
  "id" int PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "roles" (
  "id" int PRIMARY KEY,
  "rol_name" varchar
);

ALTER TABLE "users" ADD FOREIGN KEY ("courses_id") REFERENCES "courses" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("rol") REFERENCES "roles" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("level") REFERENCES "course_level" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("teacher_id") REFERENCES "teacher" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("couse_videos") REFERENCES "course_video" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("category_id") REFERENCES "categories" ("id");

/* agragando levels */ 

INSERT INTO public.course_level (id,level_name)
	VALUES (1,'principiante');
INSERT INTO public.course_level (id,level_name)
	VALUES (2,'medios');
INSERT INTO public.course_level (id,level_name)
	VALUES (3,'avanzados');

  /* agregando videos */

  INSERT INTO public.course_video (id,title,url_video)
	VALUES (1,'curso de js','https://www.youtube.com/watch?v=nHGF42O87WM&list=PLDfQIFbmwhrdZLXIEw0jwgcVjEG1fwpOf');
INSERT INTO public.course_video (id,title,url_video)
	VALUES (2,'bases de datros','https://www.youtube.com/watch?v=nHGF42O87WM&list=PLDfQIFbmwhrdZLXIEw0jwgcVjEG1fwpOf');


/* roles */

INSERT INTO public.roles (id,rol_name)
	VALUES (1,'student');
INSERT INTO public.roles (id,rol_name)
	VALUES (2,'teacher');
INSERT INTO public.roles (id,rol_name)
	VALUES (3,'admin');

/* categorias */
INSERT INTO public.categories (id,"name")
	VALUES (1,'programacion');
INSERT INTO public.categories (id,"name")
	VALUES (2,'desarrollo web');



  /* teacher */
  INSERT INTO public.teacher (id,"name")
	VALUES (1,'Pedrito Perez');

    /* users */

  INSERT INTO public.courses (id,title,description,"level",teacher_id,couse_videos,category_id)
	VALUES ('5f69b802-c482-4860-96f0-21d1cf77090b'::uuid,'Programacion','este es un curso de programacion',1,1,1,1);

