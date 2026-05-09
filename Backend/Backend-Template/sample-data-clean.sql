-- Sample Data for Team Task Manager
-- This script CLEARS all existing data and inserts fresh sample data
-- Password for all users: password123
-- BCrypt hash: $2a$10$Bpi1b6h0h3uLfPM7YrDObeUUFY2whF598TWaUrFUY0VH06m9eXr46

-- ============================================
-- CLEAR ALL EXISTING DATA
-- ============================================
TRUNCATE TABLE tasks CASCADE;
TRUNCATE TABLE project_members CASCADE;
TRUNCATE TABLE projects CASCADE;
TRUNCATE TABLE users CASCADE;

-- Reset sequences to start from 1
ALTER SEQUENCE users_id_seq RESTART WITH 1;
ALTER SEQUENCE projects_id_seq RESTART WITH 1;
ALTER SEQUENCE tasks_id_seq RESTART WITH 1;
ALTER SEQUENCE project_members_id_seq RESTART WITH 1;

-- ============================================
-- INSERT USERS (20 users: 5 admins, 15 members)
-- ============================================
INSERT INTO users (name, email, password, role, created_at) VALUES
('John Admin', 'john.admin@company.com', '$2a$10$Bpi1b6h0h3uLfPM7YrDObeUUFY2whF598TWaUrFUY0VH06m9eXr46', 'ADMIN', NOW()),
('Sarah Manager', 'sarah.manager@company.com', '$2a$10$Bpi1b6h0h3uLfPM7YrDObeUUFY2whF598TWaUrFUY0VH06m9eXr46', 'ADMIN', NOW()),
('Mike Director', 'mike.director@company.com', '$2a$10$Bpi1b6h0h3uLfPM7YrDObeUUFY2whF598TWaUrFUY0VH06m9eXr46', 'ADMIN', NOW()),
('Lisa Lead', 'lisa.lead@company.com', '$2a$10$Bpi1b6h0h3uLfPM7YrDObeUUFY2whF598TWaUrFUY0VH06m9eXr46', 'ADMIN', NOW()),
('Tom Supervisor', 'tom.supervisor@company.com', '$2a$10$Bpi1b6h0h3uLfPM7YrDObeUUFY2whF598TWaUrFUY0VH06m9eXr46', 'ADMIN', NOW()),
('Alice Developer', 'alice.dev@company.com', '$2a$10$Bpi1b6h0h3uLfPM7YrDObeUUFY2whF598TWaUrFUY0VH06m9eXr46', 'MEMBER', NOW()),
('Bob Designer', 'bob.design@company.com', '$2a$10$Bpi1b6h0h3uLfPM7YrDObeUUFY2whF598TWaUrFUY0VH06m9eXr46', 'MEMBER', NOW()),
('Carol Tester', 'carol.test@company.com', '$2a$10$Bpi1b6h0h3uLfPM7YrDObeUUFY2whF598TWaUrFUY0VH06m9eXr46', 'MEMBER', NOW()),
('David Engineer', 'david.eng@company.com', '$2a$10$Bpi1b6h0h3uLfPM7YrDObeUUFY2whF598TWaUrFUY0VH06m9eXr46', 'MEMBER', NOW()),
('Emma Analyst', 'emma.analyst@company.com', '$2a$10$Bpi1b6h0h3uLfPM7YrDObeUUFY2whF598TWaUrFUY0VH06m9eXr46', 'MEMBER', NOW()),
('Frank Developer', 'frank.dev@company.com', '$2a$10$Bpi1b6h0h3uLfPM7YrDObeUUFY2whF598TWaUrFUY0VH06m9eXr46', 'MEMBER', NOW()),
('Grace Designer', 'grace.design@company.com', '$2a$10$Bpi1b6h0h3uLfPM7YrDObeUUFY2whF598TWaUrFUY0VH06m9eXr46', 'MEMBER', NOW()),
('Henry Tester', 'henry.test@company.com', '$2a$10$Bpi1b6h0h3uLfPM7YrDObeUUFY2whF598TWaUrFUY0VH06m9eXr46', 'MEMBER', NOW()),
('Iris Developer', 'iris.dev@company.com', '$2a$10$Bpi1b6h0h3uLfPM7YrDObeUUFY2whF598TWaUrFUY0VH06m9eXr46', 'MEMBER', NOW()),
('Jack Engineer', 'jack.eng@company.com', '$2a$10$Bpi1b6h0h3uLfPM7YrDObeUUFY2whF598TWaUrFUY0VH06m9eXr46', 'MEMBER', NOW()),
('Kate Analyst', 'kate.analyst@company.com', '$2a$10$Bpi1b6h0h3uLfPM7YrDObeUUFY2whF598TWaUrFUY0VH06m9eXr46', 'MEMBER', NOW()),
('Leo Developer', 'leo.dev@company.com', '$2a$10$Bpi1b6h0h3uLfPM7YrDObeUUFY2whF598TWaUrFUY0VH06m9eXr46', 'MEMBER', NOW()),
('Mia Designer', 'mia.design@company.com', '$2a$10$Bpi1b6h0h3uLfPM7YrDObeUUFY2whF598TWaUrFUY0VH06m9eXr46', 'MEMBER', NOW()),
('Noah Tester', 'noah.test@company.com', '$2a$10$Bpi1b6h0h3uLfPM7YrDObeUUFY2whF598TWaUrFUY0VH06m9eXr46', 'MEMBER', NOW()),
('Olivia Developer', 'olivia.dev@company.com', '$2a$10$Bpi1b6h0h3uLfPM7YrDObeUUFY2whF598TWaUrFUY0VH06m9eXr46', 'MEMBER', NOW());

-- ============================================
-- INSERT PROJECTS (50 projects)
-- ============================================
INSERT INTO projects (title, description, created_by, created_at) VALUES
('E-Commerce Platform', 'Build a modern e-commerce platform', 1, NOW() - INTERVAL '90 days'),
('Payment Gateway Integration', 'Integrate payment systems', 1, NOW() - INTERVAL '85 days'),
('Product Catalog System', 'Product management system', 2, NOW() - INTERVAL '80 days'),
('Shopping Cart Optimization', 'Improve cart performance', 2, NOW() - INTERVAL '75 days'),
('Order Management System', 'Order tracking system', 3, NOW() - INTERVAL '70 days'),
('iOS Mobile App', 'Native iOS app', 3, NOW() - INTERVAL '65 days'),
('Android Mobile App', 'Native Android app', 4, NOW() - INTERVAL '60 days'),
('React Native App', 'Cross-platform mobile app', 4, NOW() - INTERVAL '55 days'),
('Mobile App Testing', 'Mobile testing suite', 5, NOW() - INTERVAL '50 days'),
('App Store Deployment', 'Deploy to app stores', 5, NOW() - INTERVAL '45 days'),
('Company Website Redesign', 'Website redesign', 1, NOW() - INTERVAL '40 days'),
('Blog Platform', 'Blogging system', 2, NOW() - INTERVAL '35 days'),
('Admin Dashboard', 'Admin control panel', 3, NOW() - INTERVAL '30 days'),
('User Authentication System', 'OAuth2 authentication', 4, NOW() - INTERVAL '25 days'),
('API Documentation Portal', 'API documentation', 5, NOW() - INTERVAL '20 days'),
('Data Analytics Dashboard', 'Analytics and reporting', 1, NOW() - INTERVAL '15 days'),
('Business Intelligence Tool', 'BI dashboard', 2, NOW() - INTERVAL '10 days'),
('Machine Learning Pipeline', 'ML model training', 3, NOW() - INTERVAL '5 days'),
('Data Warehouse Setup', 'Data warehouse', 4, NOW()),
('ETL Process Automation', 'Data transformation', 5, NOW()),
('CI/CD Pipeline Setup', 'Deployment pipeline', 1, NOW() - INTERVAL '90 days'),
('Docker Containerization', 'Containerize services', 2, NOW() - INTERVAL '85 days'),
('Kubernetes Deployment', 'K8s cluster setup', 3, NOW() - INTERVAL '80 days'),
('Monitoring & Logging', 'ELK stack monitoring', 4, NOW() - INTERVAL '75 days'),
('Cloud Migration', 'Migrate to AWS', 5, NOW() - INTERVAL '70 days'),
('Security Audit', 'Security assessment', 1, NOW() - INTERVAL '65 days'),
('Penetration Testing', 'Security testing', 2, NOW() - INTERVAL '60 days'),
('GDPR Compliance', 'GDPR compliance', 3, NOW() - INTERVAL '55 days'),
('Encryption Implementation', 'Data encryption', 4, NOW() - INTERVAL '50 days'),
('Access Control System', 'RBAC implementation', 5, NOW() - INTERVAL '45 days'),
('Chatbot Development', 'AI chatbot', 1, NOW() - INTERVAL '40 days'),
('Recommendation Engine', 'ML recommendations', 2, NOW() - INTERVAL '35 days'),
('Image Recognition System', 'Computer vision', 3, NOW() - INTERVAL '30 days'),
('Natural Language Processing', 'NLP sentiment analysis', 4, NOW() - INTERVAL '25 days'),
('Automation Scripts', 'Process automation', 5, NOW() - INTERVAL '20 days'),
('Automated Testing Suite', 'Test automation', 1, NOW() - INTERVAL '15 days'),
('Performance Testing', 'Load testing', 2, NOW() - INTERVAL '10 days'),
('Quality Assurance Process', 'QA workflow', 3, NOW() - INTERVAL '5 days'),
('Bug Tracking System', 'Issue tracking', 4, NOW()),
('Test Documentation', 'Test cases', 5, NOW()),
('Code Refactoring', 'Legacy code modernization', 1, NOW() - INTERVAL '90 days'),
('Database Optimization', 'Query optimization', 2, NOW() - INTERVAL '85 days'),
('API Rate Limiting', 'API throttling', 3, NOW() - INTERVAL '80 days'),
('Notification System', 'Email notifications', 4, NOW() - INTERVAL '75 days'),
('Search Functionality', 'Elasticsearch integration', 5, NOW() - INTERVAL '70 days'),
('File Upload System', 'Cloud storage', 1, NOW() - INTERVAL '65 days'),
('Reporting Module', 'PDF reports', 2, NOW() - INTERVAL '60 days'),
('Internationalization', 'Multi-language support', 3, NOW() - INTERVAL '55 days'),
('Accessibility Improvements', 'WCAG compliance', 4, NOW() - INTERVAL '50 days'),
('Documentation Update', 'Technical documentation', 5, NOW() - INTERVAL '45 days');

-- ============================================
-- INSERT PROJECT MEMBERS
-- ============================================
INSERT INTO project_members (project_id, user_id) VALUES
(1, 6), (1, 7), (1, 8),
(2, 9), (2, 10), (2, 11),
(3, 12), (3, 13), (3, 14),
(4, 15), (4, 16), (4, 17),
(5, 18), (5, 19), (5, 20),
(6, 6), (6, 7), (6, 8),
(7, 9), (7, 10), (7, 11),
(8, 12), (8, 13), (8, 14),
(9, 15), (9, 16), (9, 17),
(10, 18), (10, 19), (10, 20);

-- ============================================
-- INSERT TASKS
-- ============================================

-- Detailed tasks for first project
INSERT INTO tasks (title, description, status, priority, due_date, project_id, assigned_to, created_by, created_at) VALUES
('Setup project repository', 'Initialize Git repo', 'DONE', 'HIGH', NOW() + INTERVAL '5 days', 1, 6, 1, NOW()),
('Design database schema', 'Create ERD', 'IN_PROGRESS', 'HIGH', NOW() + INTERVAL '10 days', 1, 7, 1, NOW()),
('Implement authentication', 'JWT auth', 'TODO', 'HIGH', NOW() + INTERVAL '15 days', 1, 8, 1, NOW()),
('Create API endpoints', 'REST API', 'TODO', 'MEDIUM', NOW() + INTERVAL '20 days', 1, 6, 1, NOW()),
('Build frontend', 'React UI', 'TODO', 'MEDIUM', NOW() + INTERVAL '25 days', 1, 7, 1, NOW()),
('Setup CI/CD', 'Automated deployment', 'TODO', 'LOW', NOW() + INTERVAL '30 days', 1, 8, 1, NOW()),
('Write tests', 'Unit and integration tests', 'TODO', 'MEDIUM', NOW() + INTERVAL '35 days', 1, 6, 1, NOW()),
('Deploy to production', 'Production deployment', 'TODO', 'HIGH', NOW() + INTERVAL '40 days', 1, 7, 1, NOW());

-- Generate 500 more tasks across all projects
INSERT INTO tasks (title, description, status, priority, due_date, project_id, assigned_to, created_by, created_at)
SELECT 
    'Task ' || s.n || ' for project ' || p.id,
    'Description for task ' || s.n,
    CASE (random() * 2)::int WHEN 0 THEN 'TODO' WHEN 1 THEN 'IN_PROGRESS' ELSE 'DONE' END,
    CASE (random() * 2)::int WHEN 0 THEN 'LOW' WHEN 1 THEN 'MEDIUM' ELSE 'HIGH' END,
    NOW() + (random() * 60 || ' days')::interval,
    p.id,
    6 + (random() * 14)::int,
    CASE WHEN p.id % 5 = 0 THEN 5 ELSE p.id % 5 END,
    NOW() - (random() * 90 || ' days')::interval
FROM projects p
CROSS JOIN generate_series(1, 10) AS s(n);

-- ============================================
-- SUMMARY
-- ============================================
-- Users: 20 (5 admins, 15 members)
-- Projects: 50
-- Tasks: 508 (8 detailed + 500 generated)
-- Password for all users: password123
-- 
-- Login examples:
-- Admin: john.admin@company.com / password123
-- Member: alice.dev@company.com / password123
