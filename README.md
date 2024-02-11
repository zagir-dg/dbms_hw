# Нормализация базы данных до 3-нф

### Ниже описана исходная структура таблиц в базе данных в формате DBML (Database Markup Language) сайта [dbdiagram.io](https://dbdiagram.io/). 
1. [Изначально](https://dbdiagram.io/d/homework_1_step-65c626e8ac844320aecfe1fa) бд находится в первой номральной форме, так как данные на пересечении столбцов и строк содержат лишь скалярные значения, в каждом столбце данные одного типа, дубликаты отустутствуют как в таблице **transaction** так и в таблице **customer**.

<details>
<summary>Код схемы №1</summary>

```
Table transaction {
    transaction_id smallint [primary key]
    product_id smallint [primary key]
    customer_id smallint
    transaction_date date
    online_order binary
    order_status varchar(9)
    brand varchar(14)
    product_line varchar(8)
    product_class varchar(6)
    product_size varchar(6)
    list_price real
    standard_cost real
}
Table customer {
    customer_id smallint [primary key]
    first_name varchar(14)
    last_name varchar(19)
    gender varchar(6)
    DOB date
    job_title varchar(50)
    job_industry_category varchar(30)
    wealth_segment varchar(20)
    deceased_indicator varchar(1)
    owns_car varchar(3)
    address varchar(50)
    postcode smallint
    state varchar(20)
    country varchar(20)
    property_valuation smallint
}

Ref: "customer"."customer_id" < "transaction"."customer_id"
```

</details>

<br>

---

<br>

2.  * Таблица **customer** находится изначально так же во второй нормальной форме так как имеет лишь одно ключевое поле(*customer_id*) и так или иначе зависящие от него поля.

    * Таблица **transaction** не находится во второй нормальной форме так как имеет 2 ключевых поля(*transaction_id, product_id*). В то же время :

        1. transaction_date, online_order, order_status, customer_id зависят лишь от части ключа(а то есть от *transaction_id*).

        2. Остальные зависят от product_id.

По итогам анализа делим таблицу **transaction** на две. На [выходе](https://dbdiagram.io/d/homework_2_step-65c69433ac844320aed65050) таблица **transaction** и таблица **product**. Все таблицы соответствуют критериям второй нормальной формы.

<details>
    <summary>Код схемы №2</summary>

```
Table transaction {
    transaction_id smallint [primary key]
    product_id smallint
    customer_id smallint
    transaction_date date
    online_order binary
    order_status varchar(9)
}

Table product{
    product_id smallint [primary key]
    brand varchar(14)
    product_line varchar(8)
    product_class varchar(6)
    product_size varchar(6)
    list_price real
    standard_cost real
}

Table customer {
    customer_id smallint [primary key]
    first_name varchar(14)
    last_name varchar(19)
    gender varchar(6)
    DOB date
    job_title varchar(50)
    job_industry_category varchar(30)
    wealth_segment varchar(20)
    deceased_indicator varchar(1)
    owns_car varchar(3)
    address varchar(50)
    postcode smallint
    state varchar(20)
    country varchar(20)
    property_valuation smallint
}

Ref: "customer"."customer_id" < "transaction"."customer_id"

Ref: "product"."product_id" < "transaction"."product_id"
```

</details>


<br>

---

<br> 

3. 
    * Таблица **transaction** находится в третьей нормальной форме так как каждый столбец имеет прямую зависимость от теперь уже единственного первичного ключа(*transaction_id*)

    * Таблицы **product** и **customer** также находятся в третьей нормальной форме так как не имеют транзитивных свзязей.
    