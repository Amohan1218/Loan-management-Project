DROP TABLE ms_auser CASCADE;
CREATE TABLE ms_auser(
	auser_id serial PRIMARY KEY, 
    auser_username varchar(20) UNIQUE NOT NULL, 
    auser_password varchar(50) NOT NULL,
    auser_type varchar(10) NOT NULL
);
-- Insert the first record
INSERT INTO ms_auser (auser_username, auser_password, auser_type)
VALUES ('Amohan', '123456', 'admin');

-- Insert the second record
INSERT INTO ms_auser (auser_username, auser_password, auser_type)
VALUES ('chikdum', '123456', 'regular');
SELECT * FROM ms_auser;
DELETE FROM ms_auser;

--------------------------------------------------------------------
DROP TABLE ms_customers CASCADE;
CREATE TABLE ms_customers(
	cust_id serial PRIMARY KEY,
    cust_firstname varchar(50),
    cust_lastname varchar(50),
    cust_dob date, 
    cust_panno varchar(10),
    cust_mobile bigint NOT NULL CHECK (cust_mobile >= 1000000000 AND cust_mobile <= 9999999999),
    cust_address varchar(255),
    cust_gname varchar(50),
    cust_luudate date DEFAULT now()::date,
    cust_luser int DEFAULT 1,
    FOREIGN KEY (cust_luser) REFERENCES ms_auser(auser_id)
);
-- Insert the first record
INSERT INTO ms_customers (cust_firstname, cust_lastname, cust_dob, cust_panno, cust_mobile, cust_address, cust_gname)
VALUES ('John', 'Doe', '1990-05-15', 'ABCD1234E', 9876543210, '123 Main St, City', 'Johns Guardian');

-- Insert the second record
INSERT INTO ms_customers (cust_firstname, cust_lastname, cust_dob, cust_panno, cust_mobile, cust_address, cust_gname)
VALUES ('Sai', 'Smith', '1985-08-20', 'WXYZ5678F', 9876543211, '456 Elm St, Town', 'Janes Guardian');

SELECT * FROM ms_customers;
DELETE FROM ms_customers;

--------------------------------------------------------------------
DROP TABLE ms_loantypes CASCADE;
CREATE TABLE ms_loantypes(
	lnty_id serial PRIMARY KEY,
    lnty_name varchar(50),
    lnty_desc varchar(255)
);
-- Insert the first row
INSERT INTO ms_loantypes (lnty_name, lnty_desc)
VALUES ('Personal Loan', 'Short-term unsecured loan for personal expenses.');

-- Insert the second row
INSERT INTO ms_loantypes (lnty_name, lnty_desc)
VALUES ('Mortgage Loan', 'Long-term loan for purchasing real estate.');

-- Insert the third row
INSERT INTO ms_loantypes (lnty_name, lnty_desc)
VALUES ('Auto Loan', 'Loan for purchasing a vehicle.');

-- Insert the fourth row
INSERT INTO ms_loantypes (lnty_name, lnty_desc)
VALUES ('Business Loan', 'Loan for business purposes.');

-- Insert the fifth row
INSERT INTO ms_loantypes (lnty_name, lnty_desc)
VALUES ('Education Loan', 'Loan for financing education expenses.');

SELECT * FROM ms_loantypes;
DELETE FROM ms_loantypes;

--------------------------------------------------------------------
DROP TABLE ms_loanApplicants;
Create table ms_loanApplicants(
	lnap_id serial PRIMARY KEY,
    lnap_cust_id int,
    lnap_apdate date DEFAULT now()::date, 
    lnap_lnty_id smallint,
    lnap_amount numeric, 
    lnap_emi_range_from numeric DEFAULT 0, 
    lnap_emp_range_to numeric DEFAULT 0, 
    lnap_nom_requested int,
    lnap_annual_income numeric,
    lnap_disposable_income numeric,
    lnap_cibil_score numeric DEFAULT 0, --updated by company
    lnap_status varchar(4) DEFAULT 'XXXX', -- INPR/APRV/RJCD
    lnap_conclusion_remarks varchar(255) DEFAULT 'XXXX',
    lnap_processed_user int DEFAULT 1,
    lnap_processed_date date DEFAULT now()::date,
    FOREIGN KEY (lnap_processed_user) REFERENCES ms_auser(auser_id),
    FOREIGN KEY (lnap_lnty_id) REFERENCES ms_loantypes(lnty_id),
    FOREIGN KEY (lnap_cust_id) REFERENCES ms_customers(cust_id)
);

-- Insert the first record
INSERT INTO ms_loanApplicants (lnap_cust_id, lnap_lnty_id, lnap_amount, lnap_nom_requested, lnap_annual_income, lnap_disposable_income)
VALUES (1, 4, 10000.00, 2, 60000.00, 20000.00);

-- Insert the second record
INSERT INTO ms_loanApplicants (lnap_cust_id, lnap_lnty_id, lnap_amount, lnap_nom_requested, lnap_annual_income, lnap_disposable_income)
VALUES (2, 2, 500000.00, 4, 80000.00, 30000.00);

SELECT * FROM ms_loanApplicants;
DELETE FROM ms_loanApplicants;

--------------------------------------------------------------------
DROP TABLE loanApplicantsNominees;
CREATE TABLE loanApplicantsNominees(
	lnap_id int,
    lnap_nominee varchar(50),
    lanp_relation varchar(50),
    FOREIGN KEY (lnap_id) REFERENCES ms_loanApplicants(lnap_id)
);
SELECT * FROM loanApplicantsNominees;
DELETE FROM loanApplicantsNominees;

--------------------------------------------------------------------

