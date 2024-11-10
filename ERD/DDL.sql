CREATE TABLE "Books" (
  "id" serial PRIMARY KEY NOT NULL,
  "created_date" timestamp WITH time ZONE DEFAULT NOW(),
  "title" varchar(100) NOT NULL,
  "category_id" int4,
  "publisher_id" int4,
  "year" int4,
  "description" text,
  "created_by" int4,
  CONSTRAINT fk_category_id FOREIGN KEY (category_id) REFERENCES "Categories"(id),
  CONSTRAINT fk_publisher_id FOREIGN KEY (publisher_id) REFERENCES "Publishers"(id)
);

ALTER TABLE "Books" DROP CONSTRAINT fk_book_author_id;
ALTER TABLE "Books" DROP COLUMN book_author_id;

CREATE TABLE "Categories" (
  "id" serial PRIMARY KEY NOT null,
  "created_date" timestamp WITH time ZONE DEFAULT NOW(),
  "name" varchar NOT NULL,
  "created_by" int4
);

CREATE TABLE "Publishers" (
  "id" serial PRIMARY KEY NOT null,
  "created_date" timestamp WITH time ZONE DEFAULT NOW(),
  "name" varchar(100) NOT NULL,
  "address" varchar(100),
  "created_by" int4
);

CREATE TABLE "Authors" (
  "id" serial PRIMARY KEY NOT null,
  "created_date" timestamp WITH time ZONE DEFAULT NOW(),
  "name" varchar(100) NOT NULL,
  "created_by" int4
);

CREATE TABLE "Book_Authors" (
  "id" serial PRIMARY KEY NOT NULL,
  "created_date" timestamp WITH time ZONE DEFAULT NOW(),
  "book_id" int4,
  "author_id" int4,
  "created_by" int4
);

ALTER TABLE "Book_Authors" ADD CONSTRAINT fk_book_id FOREIGN KEY (book_id) REFERENCES "Books"(id);
ALTER TABLE "Book_Authors" ADD CONSTRAINT fk_author_id FOREIGN KEY(author_id) REFERENCES "Authors"(id);


CREATE TABLE "Users" (
  "id" serial PRIMARY KEY NOT null,
  "created_date" timestamp WITH time ZONE DEFAULT NOW(),
  "username" varchar(100) NOT null,
  "fullname" varchar(200) NOT null,
  "gender" varchar(10),
  "email" varchar(100) NOT null,
  "no_telephone" varchar(20),
  "address" varchar(200),
  "is_admin" boolean,
  "created_by" int4
);

CREATE TABLE "Borrows" (
  "id" serial PRIMARY KEY NOT null,
  "created_date" timestamp WITH time ZONE DEFAULT NOW(),
  "user_id" int4,
  "start_date" timestamp WITH time ZONE DEFAULT NOW(),
  "due_date" timestamp WITH time ZONE,
  "status_id" int4,
  "created_by" int4,
   CONSTRAINT fk_user_id FOREIGN KEY("user_id") REFERENCES "Users"("id"),
   CONSTRAINT fk_status_id FOREIGN KEY(status_id) REFERENCES "Status"(id)
);



CREATE TABLE "Borrow_Details" (
  "id" serial PRIMARY KEY NOT null,
  "created_date" timestamp WITH time ZONE DEFAULT NOW(),
  "borrow_id" int4,
  "book_detail_id" int4,
  "return_date" timestamp,
  "status_id" int4,
  "created_by" int4,
   CONSTRAINT fk_book_detail_id FOREIGN KEY (book_detail_id) REFERENCES "Book_Details"(id),   
   CONSTRAINT fk_borrow_id FOREIGN KEY (borrow_id) REFERENCES "Borrows"(id),
   CONSTRAINT fk_status_id FOREIGN KEY  (status_id) REFERENCES "Status"(id)
);


DROP TABLE "Borrow_Details" ;


CREATE TABLE "Book_Requests" (
  "id" serial PRIMARY KEY NOT null,
  "created_date" timestamp WITH time ZONE DEFAULT NOW(),
  "borrow_date" timestamp,
  "book_detail_id" int4,
  "user_id" int4,
  "status_id" int4,
  "is_taken" boolean,
  "created_by" int4,
  CONSTRAINT fk_book_detail_id FOREIGN KEY(book_detail_id) REFERENCES "Book_Details"(id),   
  CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES "Users"(id),   
  CONSTRAINT fk_status_id FOREIGN KEY  (status_id) REFERENCES "Status"(id)
);


DROP TABLE "Book_Requests" ;

CREATE TABLE "Status" (
  "id" serial PRIMARY KEY NOT NULL,
  "created_date" timestamp WITH time ZONE DEFAULT NOW(),
  "name" varchar(100) NOT NULL,
  "created_by" int4
);

CREATE TABLE "Book_Details" (
  "id" serial PRIMARY KEY NOT null,
  "created_date" timestamp WITH time ZONE DEFAULT NOW(),
  "library_book_id" int4,
  "isbn" varchar(100),
  "is_available" boolean,
  "created_by" int4,
   CONSTRAINT fk_library_book_id FOREIGN KEY(library_book_id) REFERENCES "Library_Books"(id)  
);

CREATE TABLE "Library" (
  "id" serial PRIMARY KEY,
  "created_date" timestamp WITH time ZONE DEFAULT NOW(),
  "name" varchar(100) NOT NULL,
  "city" varchar(50) NOT NULL,
  "address" varchar(200),
  "created_by" int4
);

CREATE TABLE "Library_Books" (
  "id" serial PRIMARY KEY NOT null,
  "created_date" timestamp WITH time ZONE DEFAULT NOW(),
  "library_id" int4,
  "book_id" int4,
  "stocks" int4,
  "created_by" int4,
  CONSTRAINT fk_book_id FOREIGN KEY(book_id) REFERENCES "Books"(id),
  CONSTRAINT fk_library_id FOREIGN KEY(library_id) REFERENCES "Library"(id)
);

ALTER TABLE "Library_Books" ADD COLUMN quantity int2;


