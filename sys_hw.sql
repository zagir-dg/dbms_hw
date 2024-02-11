create schema "data storage and processing systems";

SET search_path TO "data storage and processing systems";
 

CREATE TABLE "transaction" (
  "transaction_id" serial PRIMARY KEY
  ,"product_id" smallint not null
  ,"customer_id" smallint not null
  ,"transaction_date" date not null
  ,"online_order" boolean null
  ,"order_status" varchar(9) 
);

CREATE TABLE "product" (
  "product_id" serial PRIMARY KEY
  ,"brand" varchar(14) null
  ,"product_line" varchar(8) null 
  ,"product_class" varchar(6) null 
  ,"product_size" varchar(6) null 
  ,"list_price" real not null 
  ,"standard_cost" real null
);

CREATE TABLE "customer" (
  "customer_id" serial PRIMARY KEY
  ,"first_name" varchar(14) not null
  ,"last_name" varchar(19) null
  ,"gender" varchar(6) not null
  ,"DOB" date null
  ,"job_title" varchar(50) null
  ,"job_industry_category" varchar(30) not null
  ,"wealth_segment" varchar(20) not null
  ,"deceased_indicator" varchar(1) not null
  ,"owns_car" varchar(3) not null
  ,"address" varchar(50) not null
  ,"postcode" smallint not null
  ,"state" varchar(20) not null
  ,"country" varchar(20) not null
  ,"property_valuation" smallint not null
);
