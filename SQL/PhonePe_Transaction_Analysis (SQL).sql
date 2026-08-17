-----Phonepe_final_dataset------------------------------------------------------------------------------

------CREATE TABLE ALL_USERS--------------------------------------------------------------------------

CREATE TABLE All_Users(
  User_ID   VARCHAR(120),
  Name      VARCHAR(100),
  Age       BIGINT,	
  Join_Date DATE 
  );

SELECT * FROM All_Users;

DELETE FROM All_Users
WHERE User_ID IS NULL
  AND Name IS NULL
  AND Age IS NULL
  AND Join_Date IS NULL;

-----CREATE TABLE all_transactions------------------------------------------------------------------

CREATE TABLE all_transactions (
    transaction_id   VARCHAR(20) PRIMARY KEY,
    amount           NUMERIC(12,2),
    user_id          VARCHAR(15),
    service          VARCHAR(30),
    service_type     VARCHAR(40),
    payment_status   VARCHAR(30),
    reason           VARCHAR(40),
    txn_date         DATE
);

SELECT * FROM all_transactions ;

-----CREATE TABLE Money transfers------------------------------------------------------------------------

CREATE TABLE money_transfer (
    transaction_id   VARCHAR(20) PRIMARY KEY,
    user_id          VARCHAR(15),
    transfer_type    VARCHAR(40),
    amount           NUMERIC(12,2),
    txn_date         DATE,
    payment_status   VARCHAR(30),
    reason           VARCHAR(40)
);

SELECT * FROM money_transfer;


-------------------------------------------------------------------------------------------------------

---PHONEPE DATASET — JOINS & CALCULATIONS

----INNER JOIN------------------------------------------------------------------------------------

SELECT 
    t.transaction_id,
    u.name,
    u.age,
    t.service,
    t.service_type,
    t.amount,
    t.payment_status,
    t.txn_date
FROM all_transactions t
INNER JOIN all_users u ON t.user_id = u.user_id
ORDER BY t.txn_date DESC
LIMIT 100;

---LEFT JOIN--------------------------------------------------------------------------------------

SELECT
    u.user_id,
    u.name,
    u.age,
    COUNT(t.transaction_id) AS total_transactions
FROM all_users u
LEFT JOIN all_transactions t ON u.user_id = t.user_id
GROUP BY u.user_id, u.name, u.age
ORDER BY total_transactions DESC;

---RIGHT JOIN-----------------------------------------------------------------------------------

SELECT
    t.transaction_id,
    u.name,
    u.age,
    t.service,
    t.service_type,
    t.amount,
    t.payment_status,
    t.txn_date
FROM all_transactions t
LEFT JOIN all_users u ON t.user_id = u.user_id
ORDER BY t.txn_date DESC
LIMIT 100;

------------------------------------------------------------------------------------------------------------

--1.Total amount

SELECT SUM(amount) AS total_amount
FROM all_transactions;

--2.Average Age

SELECT AVG (AGE) AS AVG_age
FROM All_Users;

----------------------------------------------------------------------------------------------------

























