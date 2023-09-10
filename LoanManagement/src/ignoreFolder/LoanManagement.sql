-----User------------------------------------------------------------------------
DROP TABLE ms_users CASCADE;
CREATE TABLE ms_users(
	user_id serial PRIMARY KEY, 
    user_uname varchar(20) UNIQUE NOT NULL,
    user_cdate date,
    user_type varchar(4) NOT NULL, -- CUST/ADMN
    user_pwd varchar(50) NOT NULL,
    user_email varchar(60),
    user_recoveryemail varchar(60),
    user_mobile bigint NOT NULL CHECK (user_mobile >= 1000000000 AND user_mobile <= 9999999999)
);
SELECT * FROM ms_users;
DELETE FROM ms_users;

-----User Sessions---------------------------------------------------------------
DROP TABLE ms_usersessions CASCADE;
CREATE TABLE ms_usersessions(
	ussn_id serial PRIMARY KEY,
    ussn_user_id integer,
    ussn_sessionid varchar(50),
    ussn_cdate date,
    ussn_key varchar(20),
    ussn_host varchar(20),
    ussn_expire timestamp without time zone,
    ussn_status varchar(2), -- AC/NA
	FOREIGN KEY (ussn_user_id) REFERENCES ms_users(user_id)
);
SELECT * FROM ms_usersessions;
DELETE FROM ms_usersessions;

----Customers-----------------------------------------------------------
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
    FOREIGN KEY (cust_luser) REFERENCES ms_users(user_id)
);

SELECT * FROM ms_customers;
DELETE FROM ms_customers;

----Loan Applicants----------------------------------------------------------------
DROP TABLE ms_loanApplicants CASCADE;
Create table ms_loanApplicants(
	lnap_id serial PRIMARY KEY,
    lnap_cust_id int,
    lnap_apdate date DEFAULT now()::date, 
    lnap_lnty_id smallint,
    lnap_amount numeric, 
    lnap_emi_range_from numeric DEFAULT 0, 
    lnap_emi_range_to numeric DEFAULT 0, 
    lnap_nom_requested int,
    lnap_annual_income numeric,
    lnap_disposable_income numeric,
    lnap_cibil_score numeric DEFAULT 0, --updated by company
    lnap_status varchar(4) DEFAULT 'XXXX', -- INPR/APRV/RJCD
    lnap_conclusion_remarks varchar(255) DEFAULT 'XXXX',
    lnap_processed_user int DEFAULT 1,
    lnap_processed_date date DEFAULT now()::date,
    FOREIGN KEY (lnap_processed_user) REFERENCES ms_users(user_id),
    FOREIGN KEY (lnap_lnty_id) REFERENCES ms_loantypes(lnty_id),
    FOREIGN KEY (lnap_cust_id) REFERENCES ms_customers(cust_id)
);

SELECT * FROM ms_loanApplicants where lnap_apdate = '2023-09-10' AND lnap_amount BETWEEN 40000 AND 70000;
DELETE FROM ms_loanApplicants;

---Loan Applicants Nominees-----------------------------------------------------------------
DROP TABLE ms_loanApplicantsNominees CASCADE;
CREATE TABLE ms_loanApplicantsNominees(
	lnap_id int PRIMARY KEY,
    lnap_nominee varchar(50),
    lanp_relation varchar(50),
    FOREIGN KEY (lnap_id) REFERENCES ms_loanApplicants(lnap_id)
);
SELECT * FROM ms_loanApplicantsNominees;
DELETE FROM ms_loanApplicantsNominees;

-----Loan Types---------------------------------------------------------------
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
--DELETE FROM ms_loantypes;
-----------------------------------------------------------------------------

