-- Fix passwords for all users
-- This BCrypt hash is for password: password123
-- Hash: $2a$10$Bpi1b6h0h3uLfPM7YrDObeUUFY2whF598TWaUrFUY0VH06m9eXr46

UPDATE users 
SET password = '$2a$10$Bpi1b6h0h3uLfPM7YrDObeUUFY2whF598TWaUrFUY0VH06m9eXr46'
WHERE email LIKE '%@company.com';

-- Verify the update
SELECT id, name, email, role, 
       CASE 
         WHEN password = '$2a$10$Bpi1b6h0h3uLfPM7YrDObeUUFY2whF598TWaUrFUY0VH06m9eXr46' 
         THEN 'Password Updated ✓' 
         ELSE 'Old Password' 
       END as status
FROM users
ORDER BY id;

-- Now you can login with:
-- Email: john.admin@company.com
-- Password: password123
