INSERT INTO 
        users (user_id, name)
    VALUES 
        ('xsf-saf-fa4f', 'Sergey'),
        ('gsg-fsg-hssh', 'Sumail'),
        ('sgs-dgs-gsgs', 'Mitya'),
        ('sdg-sdg-sdgg', 'Sergey');

INSERT INTO 
        payment_systems_types (name)
    VALUES 
        ('Credit cards'),
        ('PayPal');

INSERT INTO 
        payment_systems_user_account_tokens (user_id, ps_type_id, token)
    VALUES 
        (1, 1, 'xsd-safv-bfs'),
        (2, 1, 'xag-mhfb-grg'),
        (3, 2, 'gej-jacf-qrt'),
        (4, 1, 'xsd-safv-bfs');

INSERT INTO 
        currency (name)
    VALUES 
        ('RUB'),
        ('USD'),
        ('EUR'),
        ('TRY');

INSERT INTO
        games (name, description)
    VALUES
        ('GTA 5', 'GTA 5 Desc'),
        ('RDR 2', 'RDR 2 Desc'),
        ('Skyrim', 'Skyrim Desc'),
        ('Oblivion', 'Oblivion Desc');

INSERT INTO
        current_nominal_amount (id_game, id_currency, amount)
    VALUES
        (1, 1, 1300.00),
        (1, 2, 20.00),
        (1, 3, 15.00),
        (2, 1, 1399.00),
        (3, 2, 10.00),
        (4, 2, 15.00);

INSERT INTO
        payments (payment_number, payment_date)
    VALUES
        (1, '2020-01-01'),
        (2, '2020-01-02'),
        (3, '2020-01-02'),
        (4, '2020-01-03'),
        (5, '2020-01-05');

INSERT INTO
        transactions (
            id_payment,
            id_game,
            id_token,
            id_user,
            purchase_nominal_currency,
            purchase_nominal_amount,
            purchase_item_quantity,
            payment_currency,
            payment_amount,
            vat,
            canceled
        )
    VALUES
        (1, 1, 1, 1, 1, 1300.00, 1, 1, 1400.00, 100.00, FALSE),
        (2, 1, 2, 2, 2, 25.00, 2, 4, 200.00, 0.00, TRUE),
        (3, 1, 3, 3, 2, 20.00, 1, 1, 1400.00, 0.00, FALSE),
        (4, 1, 4, 4, 3, 15.00, 1, 3, 16.00, 1.00, FALSE),
        (1, 2, 1, 1, 1, 1399.00, 1, 1, 1500.00, 101.00, FALSE),
        (5, 2, 3, 1, 1, 1399.00, 1, 1, 1500.00, 101.00, FALSE);