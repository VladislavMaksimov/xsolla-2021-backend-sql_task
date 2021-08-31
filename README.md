# Задание по реляционным БД (Xsolla School 2021 Backend)

Код написан для PostgreSQL.

Скрипты:
- schema.sql - создание таблиц;
- indices.sql - расстановка индексов;
- queries.sql - запросы к БД;
- insertions.sql - добавление данных в БД.

## Задание

Декомпозировать приведенную структуру платежей и товаров на таблицы до 3НФ (нормальной формы). Расставить связи между таблицами через первичные и вторичные ключи. Указать, какие индексы необходимо создать, учитывая запросы, которые будут применяться к данным. Результатом должны быть SQL запросы на создание схемы БД (при желании можно создать ER диаграмму).

## Таблица

<table>
    <thead>
        <tr>
            <th> Game </th>
            <th> Description </th>
            <th> Current nominal currency </th>
            <th> Current nominal amount </th>
            <th> Purchase item quantity </th>
            <th> Purchase nominal currency </th>
            <th> Purchase nominal amount </th>
            <th> User name </th>
            <th> User id </th>
            <th> Payment number </th>
            <th> Payment date </th>
            <th> Canceled </th>
            <th> Payment currency </th>
            <th> Payment amount </th>
            <th> VAT </th>
            <th> Payment system type </th>
            <th> Payment system user account token </th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td> GTA 5 </td>
            <td> GTA 5 Desc </td>
            <td> RUB </td>
            <td> 999.00 </td>
            <td> 1 </td>
            <td> RUB </td>
            <td> 1300.00 </td>
            <td> Sergey </td>
            <td> xsf-saf-fa4f </td>
            <td> 1 </td>
            <td> 2020-01-01 </td>
            <td> 0 </td>
            <td> RUB </td>
            <td> 1400.00 </td>
            <td> 100.00 </td>
            <td> Credit cards </td>
            <td> xsd-safv-bfs </td>
        </tr>
        <tr>
            <td> GTA 5 </td>
            <td> GTA 5 Desc </td>
            <td> USD </td>
            <td> 20.00 </td>
            <td> 2 </td>
            <td> USD </td>
            <td> 25.00 </td>
            <td> Sumail </td>
            <td> gsg-fsg-hssh </td>
            <td> 2 </td>
            <td> 2020-01-02 </td>
            <td> 1 </td>
            <td> TRY </td>
            <td> 200.00 </td>
            <td> 0.00 </td>
            <td> Credit cards </td>
            <td> xag-mhfb-grg </td>
        </tr>
        <tr>
            <td> GTA 5 </td>
            <td> GTA 5 Desc </td>
            <td> USD </td>
            <td> 20.00 </td>
            <td> 1 </td>
            <td> USD </td>
            <td> 20.00 </td>
            <td> Mitya </td>
            <td> sgs-dgs-gsgs </td>
            <td> 3 </td>
            <td> 2020-01-02 </td>
            <td> 0 </td>
            <td> RUB </td>
            <td> 1400.00 </td>
            <td> 0.00 </td>
            <td> PayPal </td>
            <td> gej-jacf-qrt </td>
        </tr>
        <tr>
            <td> GTA 5 </td>
            <td> GTA 5 Desc </td>
            <td> EUR </td>
            <td> 15.00 </td>
            <td> 1 </td>
            <td> EUR </td>
            <td> 15.00 </td>
            <td> Sergey </td>
            <td> sdg-sdg-sdgg </td>
            <td> 4 </td>
            <td> 2020-01-03 </td>
            <td> 0 </td>
            <td> EUR </td>
            <td> 16.00 </td>
            <td> 1.00 </td>
            <td> Credit cards </td>
            <td> xsd-safv-bfs </td>
        </tr>
        <tr>
            <td> RDR 2 </td>
            <td> RDR 2 Desc </td>
            <td> RUB </td>
            <td> 1399.00 </td>
            <td> 1 </td>
            <td> RUB </td>
            <td> 1399.00 </td>
            <td> Sergey </td>
            <td> xsf-saf-fa4f </td>
            <td> 1 </td>
            <td> 2020-01-01 </td>
            <td> 0 </td>
            <td> RUB </td>
            <td> 1500.00 </td>
            <td> 101.00 </td>
            <td> Credit cards </td>
            <td> xsd-safv-bfs </td>
        </tr>
        <tr>
            <td> RDR 2 </td>
            <td> RDR 2 Desc </td>
            <td> RUB </td>
            <td> 1399.00 </td>
            <td> 1 </td>
            <td> RUB </td>
            <td> 1399.00 </td>
            <td> Sergey </td>
            <td> xsf-saf-fa4f </td>
            <td> 5 </td>
            <td> 2020-01-05 </td>
            <td> 0 </td>
            <td> RUB </td>
            <td> 1500.00 </td>
            <td> 101.00 </td>
            <td> PayPal </td>
            <td> gej-jacf-qrt </td>
        </tr>
        <tr>
            <td> Skyrim </td>
            <td> Skyrim Desc </td>
            <td> USD </td>
            <td> 10.00 </td>
        </tr>
        <tr>
            <td> Oblivion </td>
            <td> Oblivion Desc </td>
            <td> USD </td>
            <td> 15.00 </td>
        </tr>
    </tbody>											
</table>

## Легенда

**current nominal amount / price** - указанная продавцом стоимость, актуальная на данный момент
**purchase nominal amount / price** - указанная продавцом стоимость в определенной валюте на момент покупки
**payment amount / price** - стоимость, которую заплатил пользователь в валюте его выбранного способа оплаты
**VAT** - взятый с платежа налог (НДС)

## Запросы

1. Вывод всех успешно купленных за определенный период игр
2. Вывод всех платежей по указанному токену сохраненного аккаунта пользователя
3. Вывод всех платежей по указанному токену сохраненного аккаунта за определенный период времени