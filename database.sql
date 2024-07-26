CREATE DATABASE motorcycles;
USE motorcycles;

CREATE TABLE tbl_owners(
owner_id INT AUTO_INCREMENT PRIMARY KEY,
Firstname VARCHAR(50) NOT NULL,
Lastname VARCHAR(50) NOT NULL,
Email VARCHAR(100) NOT NULL UNIQUE,
Phone_Number VARCHAR(15) NOT NULL
);


CREATE TABLE tbl_motorcycles (
motorcycle_id INT AUTO_INCREMENT PRIMARY KEY,
make VARCHAR(50) NOT NULL,
model VARCHAR(50) NOT NULL,
`year` INT NOT NULL CHECK (year > 1900), -- Ensure the year is realistic
owner_id INT NOT NULL,
FOREIGN KEY (owner_id) REFERENCES tbl_owners(owner_id)
);

DESC tbl_motorcycles;

CREATE TABLE tbl_service_records (
service_id INT AUTO_INCREMENT PRIMARY KEY,
motorcycle_id INT NOT NULL,
service_date DATE NOT NULL,
service_description TEXT NOT NULL,
cost DECIMAL(10, 2) NOT NULL CHECK (cost >= 0), -- Ensure cost is non-negative
FOREIGN KEY (motorcycle_id) REFERENCES tbl_motorcycles(motorcycle_id)
);
CREATE TABLE tbl_insurance (
insurance_id INT AUTO_INCREMENT PRIMARY KEY,
motorcycle_id INT NOT NULL,
provider_name VARCHAR(100) NOT NULL,
policy_number VARCHAR(50) NOT NULL UNIQUE,
start_date DATE NOT NULL,
end_date DATE NOT NULL,
FOREIGN KEY (motorcycle_id) REFERENCES tbl_motorcycles(motorcycle_id)
);

-- for insert statement follow the *tablename.insert files respectively


-- queries to show all owners, all motorcycles, all insurance records and all service records
SELECT * FROM tbl_owners;
SELECT * FROM tbl_motorcycles;
SELECT * FROM tbl_service_records;
SELECT * FROM tbl_insurance;






