-- Sample Data for Team Task Manager
-- Run this script in your PostgreSQL database to populate with test data

-- Note: Passwords are BCrypt hashed version of "password123"
-- You can use this password to login as any of these users
-- BCrypt hash: $2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy

-- ============================================
-- USERS (20 users: 5 admins, 15 members)
-- ============================================

INSERT INTO users (name, email, password, role, created_at) VALUES
-- Admins
('John Admin', 'john.admin@company.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'ADMIN', NOW()),
('Sarah Manager', 'sarah.manager@company.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'ADMIN', NOW()),
('Mike Director', 'mike.director@company.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'ADMIN', NOW()),
('Lisa Lead', 'lisa.lead@company.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'ADMIN', NOW()),
('Tom Supervisor', 'tom.supervisor@company.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'ADMIN', NOW()),

-- Members
('Alice Developer', 'alice.dev@company.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'MEMBER', NOW()),
('Bob Designer', 'bob.design@company.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'MEMBER', NOW()),
('Carol Tester', 'carol.test@company.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'MEMBER', NOW()),
('David Engineer', 'david.eng@company.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'MEMBER', NOW()),
('Emma Analyst', 'emma.analyst@company.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'MEMBER', NOW()),
('Frank Developer', 'frank.dev@company.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'MEMBER', NOW()),
('Grace Designer', 'grace.design@company.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'MEMBER', NOW()),
('Henry Tester', 'henry.test@company.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'MEMBER', NOW()),
('Iris Developer', 'iris.dev@company.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'MEMBER', NOW()),
('Jack Engineer', 'jack.eng@company.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'MEMBER', NOW()),
('Kate Analyst', 'kate.analyst@company.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'MEMBER', NOW()),
('Leo Developer', 'leo.dev@company.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'MEMBER', NOW()),
('Mia Designer', 'mia.design@company.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'MEMBER', NOW()),
('Noah Tester', 'noah.test@company.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'MEMBER', NOW()),
('Olivia Developer', 'olivia.dev@company.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'MEMBER', NOW());

-- ============================================
-- PROJECTS (50 projects)
-- ============================================

INSERT INTO projects (title, description, created_by, created_at) VALUES
-- E-commerce Projects
('E-Commerce Platform', 'Build a modern e-commerce platform with React and Spring Boot', 1, NOW() - INTERVAL '90 days'),
('Payment Gateway Integration', 'Integrate Stripe and PayPal payment systems', 1, NOW() - INTERVAL '85 days'),
('Product Catalog System', 'Develop comprehensive product management system', 2, NOW() - INTERVAL '80 days'),
('Shopping Cart Optimization', 'Improve cart performance and user experience', 2, NOW() - INTERVAL '75 days'),
('Order Management System', 'Build order tracking and fulfillment system', 3, NOW() - INTERVAL '70 days'),

-- Mobile App Projects
('iOS Mobile App', 'Native iOS app for task management', 3, NOW() - INTERVAL '65 days'),
('Android Mobile App', 'Native Android app development', 4, NOW() - INTERVAL '60 days'),
('React Native App', 'Cross-platform mobile application', 4, NOW() - INTERVAL '55 days'),
('Mobile App Testing', 'Comprehensive mobile testing suite', 5, NOW() - INTERVAL '50 days'),
('App Store Deployment', 'Deploy apps to iOS and Android stores', 5, NOW() - INTERVAL '45 days'),

-- Web Development Projects
('Company Website Redesign', 'Modern responsive website redesign', 1, NOW() - INTERVAL '40 days'),
('Blog Platform', 'Content management and blogging system', 2, NOW() - INTERVAL '35 days'),
('Admin Dashboard', 'Comprehensive admin control panel', 3, NOW() - INTERVAL '30 days'),
('User Authentication System', 'OAuth2 and JWT authentication', 4, NOW() - INTERVAL '25 days'),
('API Documentation Portal', 'Interactive API documentation', 5, NOW() - INTERVAL '20 days'),

-- Data & Analytics Projects
('Data Analytics Dashboard', 'Real-time analytics and reporting', 1, NOW() - INTERVAL '15 days'),
('Business Intelligence Tool', 'BI dashboard with data visualization', 2, NOW() - INTERVAL '10 days'),
('Machine Learning Pipeline', 'ML model training and deployment', 3, NOW() - INTERVAL '5 days'),
('Data Warehouse Setup', 'Enterprise data warehouse implementation', 4, NOW()),
('ETL Process Automation', 'Automated data extraction and transformation', 5, NOW()),

-- DevOps & Infrastructure
('CI/CD Pipeline Setup', 'Automated deployment pipeline', 1, NOW() - INTERVAL '90 days'),
('Docker Containerization', 'Containerize all microservices', 2, NOW() - INTERVAL '85 days'),
('Kubernetes Deployment', 'K8s cluster setup and management', 3, NOW() - INTERVAL '80 days'),
('Monitoring & Logging', 'Implement ELK stack for monitoring', 4, NOW() - INTERVAL '75 days'),
('Cloud Migration', 'Migrate infrastructure to AWS', 5, NOW() - INTERVAL '70 days'),

-- Security Projects
('Security Audit', 'Comprehensive security assessment', 1, NOW() - INTERVAL '65 days'),
('Penetration Testing', 'Security penetration testing', 2, NOW() - INTERVAL '60 days'),
('GDPR Compliance', 'Ensure GDPR compliance across systems', 3, NOW() - INTERVAL '55 days'),
('Encryption Implementation', 'End-to-end encryption for sensitive data', 4, NOW() - INTERVAL '50 days'),
('Access Control System', 'Role-based access control implementation', 5, NOW() - INTERVAL '45 days'),

-- AI & Automation
('Chatbot Development', 'AI-powered customer support chatbot', 1, NOW() - INTERVAL '40 days'),
('Recommendation Engine', 'ML-based product recommendation system', 2, NOW() - INTERVAL '35 days'),
('Image Recognition System', 'Computer vision for product categorization', 3, NOW() - INTERVAL '30 days'),
('Natural Language Processing', 'NLP for sentiment analysis', 4, NOW() - INTERVAL '25 days'),
('Automation Scripts', 'Automate repetitive business processes', 5, NOW() - INTERVAL '20 days'),

-- Testing & QA
('Automated Testing Suite', 'Comprehensive test automation', 1, NOW() - INTERVAL '15 days'),
('Performance Testing', 'Load and stress testing framework', 2, NOW() - INTERVAL '10 days'),
('Quality Assurance Process', 'QA workflow and standards', 3, NOW() - INTERVAL '5 days'),
('Bug Tracking System', 'Issue tracking and management', 4, NOW()),
('Test Documentation', 'Test cases and documentation', 5, NOW()),

-- Miscellaneous
('Code Refactoring', 'Legacy code modernization', 1, NOW() - INTERVAL '90 days'),
('Database Optimization', 'Query optimization and indexing', 2, NOW() - INTERVAL '85 days'),
('API Rate Limiting', 'Implement API throttling and limits', 3, NOW() - INTERVAL '80 days'),
('Notification System', 'Email and push notification service', 4, NOW() - INTERVAL '75 days'),
('Search Functionality', 'Elasticsearch integration', 5, NOW() - INTERVAL '70 days'),
('File Upload System', 'Cloud storage integration', 1, NOW() - INTERVAL '65 days'),
('Reporting Module', 'Generate PDF and Excel reports', 2, NOW() - INTERVAL '60 days'),
('Internationalization', 'Multi-language support', 3, NOW() - INTERVAL '55 days'),
('Accessibility Improvements', 'WCAG 2.1 compliance', 4, NOW() - INTERVAL '50 days'),
('Documentation Update', 'Update all technical documentation', 5, NOW() - INTERVAL '45 days');

-- ============================================
-- PROJECT MEMBERS (Assign users to projects)
-- ============================================

-- Assign members to first 10 projects (3-5 members each)
INSERT INTO project_members (project_id, user_id) VALUES
-- Project 1: E-Commerce Platform
(1, 6), (1, 7), (1, 8), (1, 9),
-- Project 2: Payment Gateway
(2, 10), (2, 11), (2, 12),
-- Project 3: Product Catalog
(3, 13), (3, 14), (3, 15), (3, 16),
-- Project 4: Shopping Cart
(4, 17), (4, 18), (4, 19),
-- Project 5: Order Management
(5, 20), (5, 6), (5, 7), (5, 8),
-- Project 6: iOS App
(6, 9), (6, 10), (6, 11),
-- Project 7: Android App
(7, 12), (7, 13), (7, 14), (7, 15),
-- Project 8: React Native
(8, 16), (8, 17), (8, 18),
-- Project 9: Mobile Testing
(9, 19), (9, 20), (9, 6),
-- Project 10: App Store
(10, 7), (10, 8), (10, 9), (10, 10);

-- ============================================
-- TASKS (200+ tasks across projects)
-- ============================================

-- Project 1: E-Commerce Platform (20 tasks)
INSERT INTO tasks (title, description, status, priority, due_date, project_id, assigned_to, created_by, created_at) VALUES
('Setup project repository', 'Initialize Git repo and project structure', 'DONE', 'HIGH', NOW() - INTERVAL '85 days', 1, 6, 1, NOW() - INTERVAL '90 days'),
('Design database schema', 'Create ERD and database design', 'DONE', 'HIGH', NOW() - INTERVAL '80 days', 1, 7, 1, NOW() - INTERVAL '85 days'),
('Implement user authentication', 'JWT-based auth system', 'DONE', 'HIGH', NOW() - INTERVAL '75 days', 1, 8, 1, NOW() - INTERVAL '80 days'),
('Create product API endpoints', 'REST API for product management', 'IN_PROGRESS', 'HIGH', NOW() + INTERVAL '5 days', 1, 9, 1, NOW() - INTERVAL '75 days'),
('Build shopping cart functionality', 'Add to cart and checkout flow', 'IN_PROGRESS', 'MEDIUM', NOW() + INTERVAL '10 days', 1, 6, 1, NOW() - INTERVAL '70 days'),
('Implement payment processing', 'Stripe integration', 'TODO', 'HIGH', NOW() + INTERVAL '15 days', 1, 7, 1, NOW() - INTERVAL '65 days'),
('Design product listing page', 'UI/UX for product catalog', 'DONE', 'MEDIUM', NOW() - INTERVAL '60 days', 1, 8, 1, NOW() - INTERVAL '65 days'),
('Create order management', 'Order tracking system', 'IN_PROGRESS', 'MEDIUM', NOW() + INTERVAL '20 days', 1, 9, 1, NOW() - INTERVAL '60 days'),
('Implement search functionality', 'Product search with filters', 'TODO', 'MEDIUM', NOW() + INTERVAL '25 days', 1, 6, 1, NOW() - INTERVAL '55 days'),
('Add product reviews', 'Rating and review system', 'TODO', 'LOW', NOW() + INTERVAL '30 days', 1, 7, 1, NOW() - INTERVAL '50 days'),
('Setup email notifications', 'Order confirmation emails', 'TODO', 'MEDIUM', NOW() + INTERVAL '35 days', 1, 8, 1, NOW() - INTERVAL '45 days'),
('Implement wishlist feature', 'Save products for later', 'TODO', 'LOW', NOW() + INTERVAL '40 days', 1, 9, 1, NOW() - INTERVAL '40 days'),
('Create admin dashboard', 'Admin panel for management', 'IN_PROGRESS', 'HIGH', NOW() + INTERVAL '12 days', 1, 6, 1, NOW() - INTERVAL '35 days'),
('Add inventory management', 'Stock tracking system', 'TODO', 'MEDIUM', NOW() + INTERVAL '45 days', 1, 7, 1, NOW() - INTERVAL '30 days'),
('Implement discount codes', 'Coupon and promo system', 'TODO', 'LOW', NOW() + INTERVAL '50 days', 1, 8, 1, NOW() - INTERVAL '25 days'),
('Setup analytics tracking', 'Google Analytics integration', 'TODO', 'LOW', NOW() + INTERVAL '55 days', 1, 9, 1, NOW() - INTERVAL '20 days'),
('Create mobile responsive design', 'Mobile-first approach', 'IN_PROGRESS', 'HIGH', NOW() + INTERVAL '8 days', 1, 6, 1, NOW() - INTERVAL '15 days'),
('Implement lazy loading', 'Performance optimization', 'TODO', 'MEDIUM', NOW() + INTERVAL '60 days', 1, 7, 1, NOW() - INTERVAL '10 days'),
('Add social media integration', 'Share products on social media', 'TODO', 'LOW', NOW() + INTERVAL '65 days', 1, 8, 1, NOW() - INTERVAL '5 days'),
('Write API documentation', 'Swagger/OpenAPI docs', 'TODO', 'MEDIUM', NOW() + INTERVAL '70 days', 1, 9, 1, NOW());

-- Project 2: Payment Gateway (15 tasks)
INSERT INTO tasks (title, description, status, priority, due_date, project_id, assigned_to, created_by, created_at) VALUES
('Research payment providers', 'Compare Stripe, PayPal, Square', 'DONE', 'HIGH', NOW() - INTERVAL '80 days', 2, 10, 1, NOW() - INTERVAL '85 days'),
('Setup Stripe account', 'Create and configure Stripe', 'DONE', 'HIGH', NOW() - INTERVAL '75 days', 2, 11, 1, NOW() - INTERVAL '80 days'),
('Implement Stripe checkout', 'Payment form integration', 'DONE', 'HIGH', NOW() - INTERVAL '70 days', 2, 12, 1, NOW() - INTERVAL '75 days'),
('Add PayPal integration', 'PayPal payment option', 'IN_PROGRESS', 'HIGH', NOW() + INTERVAL '7 days', 2, 10, 1, NOW() - INTERVAL '70 days'),
('Implement refund system', 'Handle payment refunds', 'TODO', 'MEDIUM', NOW() + INTERVAL '14 days', 2, 11, 1, NOW() - INTERVAL '65 days'),
('Add payment webhooks', 'Handle payment events', 'IN_PROGRESS', 'HIGH', NOW() + INTERVAL '10 days', 2, 12, 1, NOW() - INTERVAL '60 days'),
('Create payment history', 'Transaction log and history', 'TODO', 'MEDIUM', NOW() + INTERVAL '21 days', 2, 10, 1, NOW() - INTERVAL '55 days'),
('Implement recurring payments', 'Subscription billing', 'TODO', 'MEDIUM', NOW() + INTERVAL '28 days', 2, 11, 1, NOW() - INTERVAL '50 days'),
('Add payment security', 'PCI compliance measures', 'IN_PROGRESS', 'HIGH', NOW() + INTERVAL '5 days', 2, 12, 1, NOW() - INTERVAL '45 days'),
('Setup fraud detection', 'Fraud prevention system', 'TODO', 'HIGH', NOW() + INTERVAL '35 days', 2, 10, 1, NOW() - INTERVAL '40 days'),
('Create invoice generation', 'PDF invoice creation', 'TODO', 'MEDIUM', NOW() + INTERVAL '42 days', 2, 11, 1, NOW() - INTERVAL '35 days'),
('Add multi-currency support', 'International payments', 'TODO', 'LOW', NOW() + INTERVAL '49 days', 2, 12, 1, NOW() - INTERVAL '30 days'),
('Implement payment analytics', 'Revenue tracking dashboard', 'TODO', 'MEDIUM', NOW() + INTERVAL '56 days', 2, 10, 1, NOW() - INTERVAL '25 days'),
('Add saved payment methods', 'Store customer cards', 'TODO', 'LOW', NOW() + INTERVAL '63 days', 2, 11, 1, NOW() - INTERVAL '20 days'),
('Write payment tests', 'Unit and integration tests', 'TODO', 'MEDIUM', NOW() + INTERVAL '70 days', 2, 12, 1, NOW() - INTERVAL '15 days');

-- Continue with more tasks for other projects...
-- (Adding 10 tasks each for projects 3-10)

-- Project 3: Product Catalog (10 tasks)
INSERT INTO tasks (title, description, status, priority, due_date, project_id, assigned_to, created_by, created_at) VALUES
('Design product data model', 'Define product attributes', 'DONE', 'HIGH', NOW() - INTERVAL '75 days', 3, 13, 2, NOW() - INTERVAL '80 days'),
('Create category system', 'Product categorization', 'DONE', 'HIGH', NOW() - INTERVAL '70 days', 3, 14, 2, NOW() - INTERVAL '75 days'),
('Implement product CRUD', 'Create, read, update, delete', 'IN_PROGRESS', 'HIGH', NOW() + INTERVAL '5 days', 3, 15, 2, NOW() - INTERVAL '70 days'),
('Add product images', 'Image upload and management', 'IN_PROGRESS', 'MEDIUM', NOW() + INTERVAL '12 days', 3, 16, 2, NOW() - INTERVAL '65 days'),
('Create product variants', 'Size, color variations', 'TODO', 'MEDIUM', NOW() + INTERVAL '19 days', 3, 13, 2, NOW() - INTERVAL '60 days'),
('Implement bulk import', 'CSV product import', 'TODO', 'LOW', NOW() + INTERVAL '26 days', 3, 14, 2, NOW() - INTERVAL '55 days'),
('Add product tags', 'Tagging system', 'TODO', 'LOW', NOW() + INTERVAL '33 days', 3, 15, 2, NOW() - INTERVAL '50 days'),
('Create product comparison', 'Compare multiple products', 'TODO', 'LOW', NOW() + INTERVAL '40 days', 3, 16, 2, NOW() - INTERVAL '45 days'),
('Implement stock alerts', 'Low stock notifications', 'TODO', 'MEDIUM', NOW() + INTERVAL '47 days', 3, 13, 2, NOW() - INTERVAL '40 days'),
('Add product SEO', 'Meta tags and descriptions', 'TODO', 'MEDIUM', NOW() + INTERVAL '54 days', 3, 14, 2, NOW() - INTERVAL '35 days');

-- Add more tasks for remaining projects (Projects 4-10)
-- Each with 8-12 tasks to reach 200+ total tasks

-- Project 4-50 tasks (simplified for brevity)
INSERT INTO tasks (title, description, status, priority, due_date, project_id, assigned_to, created_by, created_at)
SELECT 
    'Task ' || generate_series || ' for Project ' || project_id,
    'Description for task ' || generate_series,
    CASE (random() * 2)::int
        WHEN 0 THEN 'TODO'
        WHEN 1 THEN 'IN_PROGRESS'
        ELSE 'DONE'
    END,
    CASE (random() * 2)::int
        WHEN 0 THEN 'LOW'
        WHEN 1 THEN 'MEDIUM'
        ELSE 'HIGH'
    END,
    NOW() + (random() * 60 || ' days')::interval,
    project_id,
    6 + (random() * 14)::int, -- Random user between 6-20
    CASE 
        WHEN project_id <= 10 THEN (project_id % 5) + 1
        ELSE ((project_id - 1) % 5) + 1
    END, -- Assign creator based on project
    NOW() - (random() * 90 || ' days')::interval
FROM generate_series(1, 10) AS generate_series,
     generate_series(4, 50) AS project_id;

-- ============================================
-- SUMMARY
-- ============================================
-- Users: 20 (5 admins, 15 members)
-- Projects: 50
-- Tasks: 200+
-- Password for all users: password123
