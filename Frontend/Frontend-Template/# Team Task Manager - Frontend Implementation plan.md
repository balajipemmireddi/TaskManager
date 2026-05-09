# Team Task Manager - Frontend Implementation Guide

## Tech Stack

- React
- Vite
- React Router DOM
- Axios
- Tailwind CSS
- Context API

---

# Folder Structure

src/

├── api
├── pages
├── components
├── layouts
├── routes
├── context
├── hooks
├── utils
├── services
├── types
└── assets

---

# Pages

## Authentication

- LoginPage
- SignupPage

---

## Dashboard

- DashboardPage

---

## Projects

- ProjectListPage
- CreateProjectPage
- ProjectDetailsPage

---

## Tasks

- TaskListPage
- CreateTaskPage

---

# Components

- Navbar
- Sidebar
- DashboardCard
- ProjectCard
- TaskCard
- TaskTable
- TaskForm
- StatusBadge
- Loader
- ProtectedRoute

---

# Routing

/login

/signup

/dashboard

/projects

/projects/:id

/tasks

---

# State Management

Use Context API.

Contexts:
- AuthContext
- ProjectContext
- TaskContext

---

# Authentication Flow

User Login
↓
Receive JWT Token
↓
Store token in localStorage
↓
Attach token to all API requests
↓
Protect routes

---

# Axios Setup

Create axios instance.

Features:
- Base URL
- JWT Authorization Header
- Global Error Handling

Example:

const api = axios.create({
  baseURL: import.meta.env.VITE_API_URL
});

api.interceptors.request.use((config) => {
  const token = localStorage.getItem("token");

  if (token) {
    config.headers.Authorization = `Bearer ${token}`;
  }

  return config;
});

---

# Dashboard Features

Show:
- Total Tasks
- Completed Tasks
- Pending Tasks
- Overdue Tasks

---

# Project Features

- Create Project
- View Projects
- View Project Details
- Add Members

---

# Task Features

- Create Task
- Assign Task
- Update Status
- Filter Tasks
- Due Date Tracking

---

# API Files

src/api/

- authApi.js
- projectApi.js
- taskApi.js
- dashboardApi.js

---

# API Integration Rules

- Use async/await
- Handle loading state
- Handle error state
- Use reusable API methods

---

# Protected Routes

Unauthenticated users should redirect to /login.

---

# UI Guidelines

- Responsive Design
- Clean Dashboard UI
- Consistent spacing
- Use cards and tables
- Show loading states
- Show empty states

---

# Form Validation

Validate:
- Required fields
- Email format
- Password length
- Due dates

---

# Deployment

Deploy Frontend using:
- Vercel
OR
- Railway

---

# Environment Variables

VITE_API_URL=http://localhost:8080/api

---

# Best Practices

- Reusable Components
- Keep API logic separate
- Avoid duplicate code
- Use custom hooks if needed
- Keep components small
- Use proper folder naming

---

# Suggested Development Order

1. React Setup
2. Routing
3. Authentication Pages
4. Dashboard
5. Projects Module
6. Tasks Module
7. API Integration
8. Protected Routes
9. Deployment