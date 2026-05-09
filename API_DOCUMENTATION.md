# Team Task Manager - API Documentation

Complete API reference for the Team Task Manager application.

## Base URL

```
Development: http://localhost:8080/api
Production: https://your-backend.railway.app/api
```

## Authentication

All endpoints except `/auth/signup` and `/auth/login` require JWT authentication.

**Header Format:**
```
Authorization: Bearer <jwt_token>
```

---

## 📋 Table of Contents

1. [Authentication APIs](#authentication-apis)
2. [Project APIs](#project-apis)
3. [Task APIs](#task-apis)
4. [Dashboard APIs](#dashboard-apis)
5. [Error Responses](#error-responses)

---

## Authentication APIs

### 1. Sign Up

Create a new user account.

**Endpoint:** `POST /api/auth/signup`

**Access:** Public

**Request Body:**
```json
{
  "name": "John Doe",
  "email": "john@example.com",
  "password": "password123"
}
```

**Validation Rules:**
- `name`: Required, not blank
- `email`: Required, valid email format
- `password`: Required, minimum 6 characters

**Success Response (201 Created):**
```json
{
  "success": true,
  "message": "User registered successfully",
  "data": {
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
    "type": "Bearer",
    "role": "MEMBER",
    "userId": 1,
    "name": "John Doe"
  }
}
```

**Error Response (409 Conflict):**
```json
{
  "success": false,
  "message": "Email already exists",
  "data": null
}
```

---

### 2. Login

Authenticate an existing user.

**Endpoint:** `POST /api/auth/login`

**Access:** Public

**Request Body:**
```json
{
  "email": "john@example.com",
  "password": "password123"
}
```

**Success Response (200 OK):**
```json
{
  "success": true,
  "message": "Login successful",
  "data": {
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
    "type": "Bearer",
    "role": "ADMIN",
    "userId": 1,
    "name": "John Doe"
  }
}
```

**Error Response (401 Unauthorized):**
```json
{
  "success": false,
  "message": "Invalid email or password",
  "data": null
}
```

---

## Project APIs

### 1. Create Project

Create a new project.

**Endpoint:** `POST /api/projects`

**Access:** ADMIN only

**Headers:**
```
Authorization: Bearer <jwt_token>
```

**Request Body:**
```json
{
  "title": "Team Task Manager",
  "description": "Manage all sprint tasks"
}
```

**Validation Rules:**
- `title`: Required, not blank
- `description`: Optional

**Success Response (201 Created):**
```json
{
  "success": true,
  "message": "Project created successfully",
  "data": {
    "id": 1,
    "title": "Team Task Manager",
    "description": "Manage all sprint tasks",
    "createdBy": "John Doe",
    "membersCount": 0
  }
}
```

**Error Response (403 Forbidden):**
```json
{
  "success": false,
  "message": "Only ADMIN can create projects",
  "data": null
}
```

---

### 2. Get All Projects

Retrieve all projects.

**Endpoint:** `GET /api/projects`

**Access:** Authenticated users

**Headers:**
```
Authorization: Bearer <jwt_token>
```

**Success Response (200 OK):**
```json
{
  "success": true,
  "message": "Projects retrieved successfully",
  "data": [
    {
      "id": 1,
      "title": "Team Task Manager",
      "description": "Manage all sprint tasks",
      "createdBy": "John Doe",
      "membersCount": 5
    },
    {
      "id": 2,
      "title": "E-commerce Platform",
      "description": "Build online store",
      "createdBy": "Jane Smith",
      "membersCount": 3
    }
  ]
}
```

---

### 3. Get Project by ID

Retrieve a specific project.

**Endpoint:** `GET /api/projects/{id}`

**Access:** Authenticated users

**Headers:**
```
Authorization: Bearer <jwt_token>
```

**Path Parameters:**
- `id` (Long): Project ID

**Success Response (200 OK):**
```json
{
  "success": true,
  "message": "Project retrieved successfully",
  "data": {
    "id": 1,
    "title": "Team Task Manager",
    "description": "Manage all sprint tasks",
    "createdBy": "John Doe",
    "membersCount": 5
  }
}
```

**Error Response (404 Not Found):**
```json
{
  "success": false,
  "message": "Project not found",
  "data": null
}
```

---

### 4. Update Project

Update an existing project.

**Endpoint:** `PUT /api/projects/{id}`

**Access:** ADMIN only

**Headers:**
```
Authorization: Bearer <jwt_token>
```

**Path Parameters:**
- `id` (Long): Project ID

**Request Body:**
```json
{
  "title": "Updated Project Title",
  "description": "Updated description"
}
```

**Success Response (200 OK):**
```json
{
  "success": true,
  "message": "Project updated successfully",
  "data": {
    "id": 1,
    "title": "Updated Project Title",
    "description": "Updated description",
    "createdBy": "John Doe",
    "membersCount": 5
  }
}
```

---

### 5. Delete Project

Delete a project.

**Endpoint:** `DELETE /api/projects/{id}`

**Access:** ADMIN only

**Headers:**
```
Authorization: Bearer <jwt_token>
```

**Path Parameters:**
- `id` (Long): Project ID

**Success Response (200 OK):**
```json
{
  "success": true,
  "message": "Project deleted successfully",
  "data": null
}
```

---

### 6. Add Member to Project

Add a user as a member of a project.

**Endpoint:** `POST /api/projects/{projectId}/members/{userId}`

**Access:** ADMIN only

**Headers:**
```
Authorization: Bearer <jwt_token>
```

**Path Parameters:**
- `projectId` (Long): Project ID
- `userId` (Long): User ID to add

**Success Response (200 OK):**
```json
{
  "success": true,
  "message": "Member added successfully",
  "data": null
}
```

**Error Response (404 Not Found):**
```json
{
  "success": false,
  "message": "User not found",
  "data": null
}
```

---

## Task APIs

### 1. Create Task

Create a new task.

**Endpoint:** `POST /api/tasks`

**Access:** ADMIN only

**Headers:**
```
Authorization: Bearer <jwt_token>
```

**Request Body:**
```json
{
  "title": "Implement JWT Authentication",
  "description": "Add Spring Security JWT",
  "priority": "HIGH",
  "dueDate": "2026-05-20",
  "projectId": 1,
  "assignedTo": 2
}
```

**Validation Rules:**
- `title`: Required, not blank
- `description`: Optional
- `priority`: Required, one of [LOW, MEDIUM, HIGH]
- `dueDate`: Required, valid date format (YYYY-MM-DD)
- `projectId`: Required
- `assignedTo`: Optional, user ID

**Success Response (201 Created):**
```json
{
  "success": true,
  "message": "Task created successfully",
  "data": {
    "id": 1,
    "title": "Implement JWT Authentication",
    "status": "TODO",
    "priority": "HIGH",
    "assignedTo": "Jane Smith",
    "projectName": "Team Task Manager"
  }
}
```

---

### 2. Get Tasks by Project

Retrieve all tasks for a specific project.

**Endpoint:** `GET /api/projects/{projectId}/tasks`

**Access:** Authenticated users

**Headers:**
```
Authorization: Bearer <jwt_token>
```

**Path Parameters:**
- `projectId` (Long): Project ID

**Success Response (200 OK):**
```json
{
  "success": true,
  "message": "Tasks retrieved successfully",
  "data": [
    {
      "id": 1,
      "title": "Implement JWT Authentication",
      "status": "IN_PROGRESS",
      "priority": "HIGH",
      "assignedTo": "Jane Smith",
      "projectName": "Team Task Manager"
    },
    {
      "id": 2,
      "title": "Create Database Schema",
      "status": "DONE",
      "priority": "MEDIUM",
      "assignedTo": "John Doe",
      "projectName": "Team Task Manager"
    }
  ]
}
```

---

### 3. Update Task

Update task details.

**Endpoint:** `PUT /api/tasks/{id}`

**Access:** ADMIN only

**Headers:**
```
Authorization: Bearer <jwt_token>
```

**Path Parameters:**
- `id` (Long): Task ID

**Request Body:**
```json
{
  "title": "Updated Task Title",
  "description": "Updated description",
  "priority": "MEDIUM",
  "dueDate": "2026-05-25"
}
```

**Success Response (200 OK):**
```json
{
  "success": true,
  "message": "Task updated successfully",
  "data": {
    "id": 1,
    "title": "Updated Task Title",
    "status": "IN_PROGRESS",
    "priority": "MEDIUM",
    "assignedTo": "Jane Smith",
    "projectName": "Team Task Manager"
  }
}
```

---

### 4. Update Task Status

Update the status of a task.

**Endpoint:** `PUT /api/tasks/{id}/status`

**Access:** 
- ADMIN: Can update any task
- MEMBER: Can only update their assigned tasks

**Headers:**
```
Authorization: Bearer <jwt_token>
```

**Path Parameters:**
- `id` (Long): Task ID

**Request Body:**
```json
{
  "status": "IN_PROGRESS"
}
```

**Valid Status Values:**
- `TODO`
- `IN_PROGRESS`
- `DONE`

**Success Response (200 OK):**
```json
{
  "success": true,
  "message": "Task status updated successfully",
  "data": {
    "id": 1,
    "title": "Implement JWT Authentication",
    "status": "IN_PROGRESS",
    "priority": "HIGH",
    "assignedTo": "Jane Smith",
    "projectName": "Team Task Manager"
  }
}
```

**Error Response (403 Forbidden):**
```json
{
  "success": false,
  "message": "You can only update your assigned tasks",
  "data": null
}
```

---

### 5. Assign Task

Assign a task to a user.

**Endpoint:** `PUT /api/tasks/{taskId}/assign/{userId}`

**Access:** ADMIN only

**Headers:**
```
Authorization: Bearer <jwt_token>
```

**Path Parameters:**
- `taskId` (Long): Task ID
- `userId` (Long): User ID to assign

**Success Response (200 OK):**
```json
{
  "success": true,
  "message": "Task assigned successfully",
  "data": null
}
```

---

### 6. Delete Task

Delete a task.

**Endpoint:** `DELETE /api/tasks/{id}`

**Access:** ADMIN only

**Headers:**
```
Authorization: Bearer <jwt_token>
```

**Path Parameters:**
- `id` (Long): Task ID

**Success Response (200 OK):**
```json
{
  "success": true,
  "message": "Task deleted successfully",
  "data": null
}
```

---

## Dashboard APIs

### Get Dashboard Statistics

Retrieve dashboard statistics for the authenticated user.

**Endpoint:** `GET /api/dashboard`

**Access:** Authenticated users

**Headers:**
```
Authorization: Bearer <jwt_token>
```

**Success Response (200 OK):**
```json
{
  "success": true,
  "message": "Dashboard retrieved successfully",
  "data": {
    "totalTasks": 15,
    "completedTasks": 8,
    "pendingTasks": 7,
    "overdueTasks": 2
  }
}
```

---

## Error Responses

### Standard Error Format

All error responses follow this format:

```json
{
  "success": false,
  "message": "Error description",
  "data": null
}
```

### HTTP Status Codes

| Code | Description |
|------|-------------|
| 200 | OK - Request successful |
| 201 | Created - Resource created successfully |
| 400 | Bad Request - Invalid input |
| 401 | Unauthorized - Authentication required |
| 403 | Forbidden - Insufficient permissions |
| 404 | Not Found - Resource not found |
| 409 | Conflict - Resource already exists |
| 500 | Internal Server Error - Server error |

### Common Error Messages

**Authentication Errors:**
```json
{
  "success": false,
  "message": "Invalid email or password",
  "data": null
}
```

**Authorization Errors:**
```json
{
  "success": false,
  "message": "Only ADMIN can create projects",
  "data": null
}
```

**Validation Errors:**
```json
{
  "success": false,
  "message": "Validation failed",
  "data": {
    "email": "Email must be valid",
    "password": "Password must be at least 6 characters"
  }
}
```

**Resource Not Found:**
```json
{
  "success": false,
  "message": "Project not found",
  "data": null
}
```

---

## Testing with cURL

### Sign Up
```bash
curl -X POST http://localhost:8080/api/auth/signup \
  -H "Content-Type: application/json" \
  -d '{
    "name": "John Doe",
    "email": "john@example.com",
    "password": "password123"
  }'
```

### Login
```bash
curl -X POST http://localhost:8080/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{
    "email": "john@example.com",
    "password": "password123"
  }'
```

### Create Project (with token)
```bash
curl -X POST http://localhost:8080/api/projects \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN" \
  -d '{
    "title": "Test Project",
    "description": "Project description"
  }'
```

### Get All Projects
```bash
curl -X GET http://localhost:8080/api/projects \
  -H "Authorization: Bearer YOUR_JWT_TOKEN"
```

---

## Rate Limiting

Currently, there are no rate limits implemented. For production, consider implementing rate limiting to prevent abuse.

## Versioning

Current API Version: **v1**

The API is currently unversioned. Future versions will use URL versioning:
- v1: `/api/v1/...`
- v2: `/api/v2/...`

---

## Support

For API support:
- Email: support@taskmanager.com
- Documentation: http://localhost:8080/swagger-ui.html
- GitHub Issues: [Repository Issues](https://github.com/your-repo/issues)

---

**Last Updated:** May 9, 2026
