-- Вывод всех успешно купленных за определенный период игр?

SELECT g.name
    FROM games g
        JOIN transactions t ON g.id = t.id_game
        JOIN payments p ON t.id_payment = p.id
    WHERE t.canceled = FALSE
        AND p.payment_date = '2020-01-01';

-- Вывод всех платежей по указанному токену сохраненного аккаунта пользователя?

SELECT DISTINCT p.payment_number, p.payment_date
    FROM payments p
        JOIN transactions t ON p.id = t.id_payment
        JOIN payment_systems_user_account_tokens psut ON t.id_token = psut.id
    WHERE psut.token = 'xsd-safv-bfs';

-- Вывод всех платежей по указанному токену сохраненного аккаунта за определенный период времени?

SELECT DISTINCT p.payment_number, p.payment_date
    FROM payments p
        JOIN transactions t ON p.id = t.id_payment
        JOIN payment_systems_user_account_tokens psut ON t.id_token = psut.id
    WHERE psut.token = 'xsd-safv-bfs'
        AND p.payment_date = '2020-01-01';