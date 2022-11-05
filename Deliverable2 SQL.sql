CREATE TABLE "User" (
  "Id" SERIAL PRIMARY KEY NOT NULL,
  "Name" varchar NOT NULL,
  "Lastname" varchar NOT NULL,
  "Password" varchar NOT NULL,
  "Email" varchar NOT NULL,
  "Age" integer,
  "Status" varchar NOT NULL
);

CREATE TABLE "Post" (
  "Id" SERIAL PRIMARY KEY NOT NULL,
  "Title" varchar,
  "Description" varchar,
  "User_Id" integer UNIQUE NOT NULL,
  "Content" varchar,
  "Status" varchar
);

CREATE TABLE "Category" (
  "Id" SERIAL PRIMARY KEY NOT NULL,
  "Name" varchar NOT NULL,
  "Status" varchar
);

CREATE TABLE "Comment" (
  "Id" SERIAL PRIMARY KEY NOT NULL,
  "User_Id" integer,
  "Content" varchar NOT NULL,
  "Status" varchar
);

CREATE TABLE "rel_Category_Post" (
  "Id" SERIAL PRIMARY KEY,
  "Post_Id" integer,
  "Category_Id" integer
);

CREATE TABLE "rel_Comment_Post" (
  "Id" SERIAL PRIMARY KEY,
  "Post_Id" integer,
  "Comment_Id" integer
);

ALTER TABLE "Comment" ADD FOREIGN KEY ("User_Id") REFERENCES "User" ("Id");

ALTER TABLE "Post" ADD FOREIGN KEY ("User_Id") REFERENCES "User" ("Id");

ALTER TABLE "rel_Comment_Post" ADD FOREIGN KEY ("Post_Id") REFERENCES "Post" ("Id");

ALTER TABLE "rel_Comment_Post" ADD FOREIGN KEY ("Comment_Id") REFERENCES "Comment" ("Id");

ALTER TABLE "rel_Category_Post" ADD FOREIGN KEY ("Post_Id") REFERENCES "Post" ("Id");

ALTER TABLE "rel_Category_Post" ADD FOREIGN KEY ("Category_Id") REFERENCES "Category" ("Id");
