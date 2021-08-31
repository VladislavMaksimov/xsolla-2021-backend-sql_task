CREATE TABLE users (
	id SERIAL PRIMARY KEY,
	user_id varchar NOT NULL UNIQUE,
	name varchar NOT NULL
);

CREATE TABLE payment_systems_types (
	id SERIAL PRIMARY KEY,
	name varchar NOT NULL UNIQUE
);

CREATE TABLE payment_systems_user_account_tokens (
	id SERIAL PRIMARY KEY,
	user_id integer REFERENCES users (id),
	ps_type_id integer REFERENCES payment_systems_types,
	token varchar NOT NULL
);

CREATE TABLE currency (
	id SERIAL PRIMARY KEY,
	name varchar NOT NULL UNIQUE
);

CREATE TABLE games (
	id SERIAL PRIMARY KEY,
	name varchar NOT NULL UNIQUE,
	description varchar
);

CREATE TABLE current_nominal_amount (
	id SERIAL PRIMARY KEY,
	id_game integer REFERENCES games,
	id_currency integer REFERENCES currency,
	amount decimal
);

CREATE TABLE payments (
	id SERIAL PRIMARY KEY,
	payment_number integer,
	payment_date date
);

CREATE TABLE transactions (
	id SERIAL PRIMARY KEY,
	id_payment integer REFERENCES payments,
	id_game integer REFERENCES games,
	id_token integer REFERENCES payment_systems_user_account_tokens,
	id_user integer REFERENCES users,
	purchase_nominal_currency integer REFERENCES currency (id),
	purchase_nominal_amount decimal,
	purchase_item_quantity integer,
	payment_currency integer REFERENCES currency (id),
	payment_amount decimal,
	vat decimal,
	canceled boolean
);