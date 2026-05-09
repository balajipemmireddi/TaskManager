# MASTER CONTEXT FILE
# Team Task Manager

IMPORTANT:
Frontend and Backend MUST strictly follow this document.

No deviation allowed.

---

# Project Overview

Build a Team Task Manager web application where users can:

- Create projects
- Assign tasks
- Track progress
- Manage teams
- Use role-based access

---

# Tech Stack

## Backend

- Java 21
- Spring Boot
- Spring Security
- JWT
- PostgreSQL

---

## Frontend

- React
- Vite
- Axios
- Tailwind CSS

---

# Roles

ADMIN
MEMBER

---

# RBAC Rules

## ADMIN

Can:
- Create projects
- Add members
- Create tasks
- Assign tasks
- Delete tasks

---

## MEMBER

Can:
- View assigned tasks
- Update task status

---

# Entity Definitions

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

# Relationships

User → Many Tasks

Project → Many Tasks

Project → Many Members

Task → Belongs To Project

Task → Assigned To User

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

# API Base URL

/api

---

# Authentication APIs

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

# DTO Definitions

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

# Standard Response Format

## Success

{
  "success": true,
  "message": "Operation successful",
  "data": {}
}

---

## Error

{
  "success": false,
  "message": "Unauthorized"
}

---

# Validation Rules

- Email must be valid
- Password minimum 6 characters
- Title cannot be empty
- Due date cannot be past date

---

# Frontend Rules

- Use Axios only
- Use Context API
- Use Protected Routes
- Use reusable components
- Store JWT in localStorage

---

# Backend Rules

- Use DTOs
- No entity exposure
- Use layered architecture
- Use constructor injection
- Use JWT authentication
- Use global exception handling

---

# Naming Conventions

## Backend

Controller:
TaskController

Service:
TaskService

Repository:
TaskRepository

DTO:
TaskResponse

---

## Frontend

Pages:
DashboardPage.jsx

Components:
TaskCard.jsx

API Files:
taskApi.js

---

# Deployment Rules

Backend:
Railway

Frontend:
Vercel or Railway

Database:
Railway PostgreSQL

---

# Swagger

Enable Swagger UI.

Endpoint:
/swagger-ui.html

---

# README Requirements

Must include:
- Features
- Tech Stack
- Architecture
- Setup Steps
- API Endpoints
- Screenshots
- Live URL
- GitHub URL

---

# Final Goal

Application must:
- Be fully functional
- Be deployed live
- Follow RBAC properly
- Use JWT authentication
- Have clean UI
- Follow this contract strictly