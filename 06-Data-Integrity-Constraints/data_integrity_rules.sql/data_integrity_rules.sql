-- ************************************************************
-- REPOSITORY: SQL-Mastery-Journey
-- MODULE: 06 - Constraints & Data Integrity
-- BRAND: Data With RISHAL
-- OBJECTIVE: Implementing business rules at the database level.
-- ************************************************************

/* SCENARIO: 
   As a Data Architect, you must ensure the 'Users' table 
   cannot accept garbage data. We need to enforce unique emails, 
   required names, and valid age ranges.
*/

-- 1. CREATING A PROTECTED TABLE
CREATE TABLE System_Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,  -- Auto-generates the ID
    full_name VARCHAR(100) NOT NULL,         -- Cannot be empty
    email VARCHAR(255) UNIQUE NOT NULL,      -- No two users can have the same email
    age INT,
    status VARCHAR(20) DEFAULT 'Active',     -- Defaults to Active if not specified
    
    -- BUSINESS RULE: Users must be at least 18 years old
    CONSTRAINT chk_age CHECK (age >= 18)
);

-- 2. TESTING THE ARCHITECTURE (Logical check)
-- This would fail because the email isn't unique or age is < 18.
-- INSERT INTO System_Users (full_name, email, age) VALUES ('Test User', 'test@mail.com', 15);

-- 3. ADDING A FOREIGN KEY (The "Relationship" Lock)
-- Ensuring a 'Profiles' table only links to users that actually exist.
CREATE TABLE User_Profiles (
    profile_id INT PRIMARY KEY,
    bio TEXT,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES System_Users(user_id)
);