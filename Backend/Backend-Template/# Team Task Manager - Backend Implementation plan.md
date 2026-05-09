# Team Task Manager - Backend Implementation Guide

## Tech Stack

- Java 21
- Spring Boot
- Spring Security
- JWT Authentication
- Spring Data JPA
- PostgreSQL
- Maven
- Railway Deployment

---

# Architecture

Use Layered Architecture:

Controller
↓
Service
↓
Repository
↓
Database

---

# Package Structure

src/main/java/com/example/taskmanager

├── auth
├── user
├── project
├── task
├── dashboard
├── security
├── config
├── exception
├── common
└── util

---

# Dependencies

- Spring Web
- Spring Security
- Spring Data JPA
- PostgreSQL Driver
- Lombok
- Validation
- JWT
- Swagger/OpenAPI

---

# Authentication Module

## Features

- Signup
- Login
- JWT Generation
- JWT Validation
- Role-Based Access

---

# Roles

ADMIN
MEMBER

---

# Entity Relationships

User → Many Projects
Project → Many Tasks
Project → Many Members
Task → Assigned To User

---

# Entities

## User

Fields:
- id
- name
- email
- password
- role
- createdAt

---

## Project

Fields:
- id
- title
- description
- createdBy
- createdAt

---

## ProjectMember

Fields:
- id
- project
- user

---

## Task

Fields:
- id
- title
- description
- status
- priority
- dueDate
- assignedTo
- project
- createdBy
- createdAt

---

# Enums

## Role

ADMIN
MEMBER

---

## TaskStatus

TODO
IN_PROGRESS
DONE

---

## Priority

LOW
MEDIUM
HIGH

---

# DTOs

## SignupRequest

{
  "name": "Balaji",
  "email": "balaji@gmail.com",
  "password": "password123"
}

---

## LoginRequest

{
  "email": "balaji@gmail.com",
  "password": "password123"
}

---

## AuthResponse

{
  "token": "jwt-token",
  "type": "Bearer",
  "role": "ADMIN",
  "userId": 1,
  "name": "Balaji"
}

---

## CreateProjectRequest

{
  "title": "Team Task Manager",
  "description": "Manage all sprint tasks"
}

---

## ProjectResponse

{
  "id": 1,
  "title": "Team Task Manager",
  "description": "Manage all sprint tasks",
  "createdBy": "Balaji",
  "membersCount": 5
}

---

## CreateTaskRequest

{
  "title": "Implement JWT",
  "description": "Add Spring Security JWT",
  "priority": "HIGH",
  "dueDate": "2026-05-20",
  "projectId": 1,
  "assignedTo": 2
}

---

## TaskResponse

{
  "id": 1,
  "title": "Implement JWT",
  "status": "IN_PROGRESS",
  "priority": "HIGH",
  "assignedTo": "John",
  "projectName": "Task Manager"
}

---

# API Endpoints

# Auth APIs

POST /api/auth/signup

POST /api/auth/login

---

# Project APIs

POST /api/projects

GET /api/projects

GET /api/projects/{id}

POST /api/projects/{projectId}/members/{userId}

PUT /api/projects/{id}

DELETE /api/projects/{id}

---

# Task APIs

POST /api/tasks

GET /api/projects/{projectId}/tasks

PUT /api/tasks/{id}

PUT /api/tasks/{id}/status

PUT /api/tasks/{id}/assign/{userId}

DELETE /api/tasks/{id}

---

# Dashboard APIs

GET /api/dashboard

---

# Standard API Response

## Success Response

{
  "success": true,
  "message": "Task created successfully",
  "data": {}
}

---

## Error Response

{
  "success": false,
  "message": "Unauthorized"
}

---

# Validation Rules

Use Bean Validation.

Examples:

@NotBlank
@Email
@Size(min = 6)

---

# Security Rules

## ADMIN Permissions

- Create Project
- Add Members
- Create Tasks
- Assign Tasks
- Delete Tasks

---

## MEMBER Permissions

- View Assigned Tasks
- Update Task Status

---

# JWT Flow

Login
↓
Generate JWT
↓
Frontend stores token
↓
Frontend sends token in Authorization Header
↓
Backend validates token

Header Format:

Authorization: Bearer jwt-token

---

# Exception Handling

Use Global Exception Handler.

Handle:
- ResourceNotFoundException
- BadRequestException
- UnauthorizedException
- ValidationException

---

# Swagger

Enable Swagger/OpenAPI.

Endpoint:

/swagger-ui.html

---

# Database

Use PostgreSQL.

Railway PostgreSQL recommended.

---

# Deployment

Deploy Backend using Railway.

Environment Variables:

SPRING_DATASOURCE_URL
SPRING_DATASOURCE_USERNAME
SPRING_DATASOURCE_PASSWORD
JWT_SECRET

---

# Best Practices

- Use DTOs everywhere
- Never expose entities directly
- Use constructor injection
- Use service interfaces
- Keep business logic in service layer
- Use pagination if possible
- Use proper HTTP status codes

---

# Suggested Development Order

1. Project Setup
2. Security + JWT
3. Authentication APIs
4. Project Module
5. Task Module
6. Dashboard
7. Exception Handling
8. Swagger
9. Deployment