# Team Task Manager

A production-quality full-stack web application for managing team projects and tasks with role-based access control, built with Spring Boot and React.

![Java](https://img.shields.io/badge/Java-21-orange)
![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.2.5-green)
![React](https://img.shields.io/badge/React-18.3-blue)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-14+-blue)
![License](https://img.shields.io/badge/License-MIT-yellow)

## 📋 Table of Contents

- [Features](#features)
- [Tech Stack](#tech-stack)
- [Architecture](#architecture)
- [Getting Started](#getting-started)
- [API Documentation](#api-documentation)
- [Deployment](#deployment)
- [Screenshots](#screenshots)
- [Project Structure](#project-structure)
- [Contributing](#contributing)
- [License](#license)

## ✨ Features

### Authentication & Authorization
- ✅ JWT-based authentication
- ✅ Role-based access control (ADMIN, MEMBER)
- ✅ Secure password encryption with BCrypt
- ✅ Token-based session management

### Project Management
- ✅ Create, update, and delete projects
- ✅ Add team members to projects
- ✅ View all projects
- ✅ Track project members count

### Task Management
- ✅ Create and assign tasks
- ✅ Update task status (TODO, IN_PROGRESS, DONE)
- ✅ Priority tracking (LOW, MEDIUM, HIGH)
- ✅ Due date management
- ✅ Task filtering by project
- ✅ Assign/reassign tasks to users

### Dashboard
- ✅ Total tasks count
- ✅ Completed tasks tracking
- ✅ Pending tasks overview
- ✅ Overdue tasks alerts

### User Interface
- ✅ Modern, responsive design
- ✅ Intuitive navigation
- ✅ Real-time updates
- ✅ Mobile-friendly interface

## 🛠️ Tech Stack

### Backend
- **Java 21** - Programming language
- **Spring Boot 3.2.5** - Application framework
- **Spring Security** - Authentication & authorization
- **Spring Data JPA** - Data persistence
- **PostgreSQL** - Database
- **JWT (JSON Web Tokens)** - Secure authentication
- **Maven** - Build tool
- **Swagger/OpenAPI** - API documentation
- **Lombok** - Boilerplate reduction

### Frontend
- **React 18.3** - UI library
- **Vite** - Build tool
- **React Router DOM** - Routing
- **Axios** - HTTP client
- **Tailwind CSS** - Styling
- **Context API** - State management

### Deployment
- **Railway** - Backend & database hosting
- **Vercel** - Frontend hosting

## 🏗️ Architecture

### Backend Architecture

```
┌─────────────────────────────────────────────────────────┐
│                     Client Layer                         │
│              (React Frontend / API Clients)              │
└─────────────────────────────────────────────────────────┘
                            │
                            ▼
┌─────────────────────────────────────────────────────────┐
│                  Security Layer                          │
│         (JWT Filter, Authentication Manager)             │
└─────────────────────────────────────────────────────────┘
                            │
                            ▼
┌─────────────────────────────────────────────────────────┐
│                  Controller Layer                        │
│    (AuthController, ProjectController, TaskController)   │
└─────────────────────────────────────────────────────────┘
                            │
                            ▼
┌─────────────────────────────────────────────────────────┐
│                   Service Layer                          │
│      (Business Logic, RBAC, Validation)                  │
└─────────────────────────────────────────────────────────┘
                            │
                            ▼
┌─────────────────────────────────────────────────────────┐
│                 Repository Layer                         │
│              (Spring Data JPA)                           │
└─────────────────────────────────────────────────────────┘
                            │
                            ▼
┌─────────────────────────────────────────────────────────┐
│                   Database Layer                         │
│                   (PostgreSQL)                           │
└─────────────────────────────────────────────────────────┘
```

### Database Schema

```
┌──────────────┐         ┌──────────────────┐         ┌──────────────┐
│    Users     │         │  ProjectMembers  │         │   Projects   │
├──────────────┤         ├──────────────────┤         ├──────────────┤
│ id (PK)      │────┐    │ id (PK)          │    ┌────│ id (PK)      │
│ name         │    │    │ project_id (FK)  │────┘    │ title        │
│ email        │    │    │ user_id (FK)     │         │ description  │
│ password     │    │    └──────────────────┘         │ created_by   │
│ role         │    │                                  │ created_at   │
│ created_at   │    │                                  └──────────────┘
└──────────────┘    │                                         │
                    │                                         │
                    │    ┌──────────────────┐                │
                    │    │      Tasks       │                │
                    │    ├──────────────────┤                │
                    └────│ assigned_to (FK) │                │
                         │ created_by (FK)  │                │
                         │ project_id (FK)  │────────────────┘
                         │ id (PK)          │
                         │ title            │
                         │ description      │
                         │ status           │
                         │ priority         │
                         │ due_date         │
                         │ created_at       │
                         └──────────────────┘
```

## 🚀 Getting Started

### Prerequisites

- Java 21+
- Node.js 18+
- PostgreSQL 14+
- Maven 3.6+
- npm or yarn

### Backend Setup

1. **Navigate to backend directory:**
   ```bash
   cd Backend/Backend-Template
   ```

2. **Create PostgreSQL database:**
   ```sql
   CREATE DATABASE taskmanager;
   ```

3. **Configure environment variables:**
   ```bash
   cp .env.example .env
   ```
   
   Update `.env`:
   ```properties
   SPRING_DATASOURCE_URL=jdbc:postgresql://localhost:5432/taskmanager
   SPRING_DATASOURCE_USERNAME=postgres
   SPRING_DATASOURCE_PASSWORD=your_password
   JWT_SECRET=your_jwt_secret_key
   FRONTEND_URL=http://localhost:5173
   ```

4. **Build and run:**
   ```bash
   mvn clean install
   mvn spring-boot:run
   ```

   Backend will run on `http://localhost:8080`

### Frontend Setup

1. **Navigate to frontend directory:**
   ```bash
   cd Frontend/Frontend-Template
   ```

2. **Install dependencies:**
   ```bash
   npm install
   ```

3. **Configure environment variables:**
   ```bash
   cp .env.example .env
   ```
   
   Update `.env`:
   ```env
   VITE_API_URL=http://localhost:8080/api
   ```

4. **Run development server:**
   ```bash
   npm run dev
   ```

   Frontend will run on `http://localhost:5173`

## 📚 API Documentation

Once the backend is running, access the interactive API documentation:

**Swagger UI:** `http://localhost:8080/swagger-ui.html`

### Key Endpoints

#### Authentication
- `POST /api/auth/signup` - Register new user
- `POST /api/auth/login` - Login user

#### Projects
- `POST /api/projects` - Create project (ADMIN)
- `GET /api/projects` - Get all projects
- `GET /api/projects/{id}` - Get project by ID
- `PUT /api/projects/{id}` - Update project (ADMIN)
- `DELETE /api/projects/{id}` - Delete project (ADMIN)
- `POST /api/projects/{projectId}/members/{userId}` - Add member (ADMIN)

#### Tasks
- `POST /api/tasks` - Create task (ADMIN)
- `GET /api/projects/{projectId}/tasks` - Get tasks by project
- `PUT /api/tasks/{id}` - Update task (ADMIN)
- `PUT /api/tasks/{id}/status` - Update task status
- `PUT /api/tasks/{id}/assign/{userId}` - Assign task (ADMIN)
- `DELETE /api/tasks/{id}` - Delete task (ADMIN)

#### Dashboard
- `GET /api/dashboard` - Get dashboard statistics

### Standard Response Format

**Success:**
```json
{
  "success": true,
  "message": "Operation successful",
  "data": {}
}
```

**Error:**
```json
{
  "success": false,
  "message": "Error message",
  "data": null
}
```

## 🚢 Deployment

### Backend Deployment (Railway)

1. **Install Railway CLI:**
   ```bash
   npm i -g @railway/cli
   ```

2. **Login and initialize:**
   ```bash
   railway login
   railway init
   ```

3. **Add PostgreSQL:**
   ```bash
   railway add --database postgresql
   ```

4. **Set environment variables in Railway dashboard:**
   - `JWT_SECRET`
   - `FRONTEND_URL`

5. **Deploy:**
   ```bash
   railway up
   ```

### Frontend Deployment (Vercel)

1. **Install Vercel CLI:**
   ```bash
   npm i -g vercel
   ```

2. **Deploy:**
   ```bash
   cd Frontend/Frontend-Template
   vercel
   ```

3. **Set environment variable in Vercel dashboard:**
   - `VITE_API_URL` - Your Railway backend URL

## 📸 Screenshots

### Dashboard
![Dashboard](docs/screenshots/dashboard.png)

### Projects
![Projects](docs/screenshots/projects.png)

### Tasks
![Tasks](docs/screenshots/tasks.png)

## 📁 Project Structure

```
Team-Task-Manager/
├── Backend/
│   └── Backend-Template/
│       ├── src/main/java/com/taskmanager/
│       │   ├── auth/              # Authentication module
│       │   ├── user/              # User management
│       │   ├── project/           # Project management
│       │   ├── task/              # Task management
│       │   ├── dashboard/         # Dashboard statistics
│       │   ├── security/          # Security configuration
│       │   ├── config/            # App configuration
│       │   ├── exception/         # Exception handling
│       │   └── common/            # Common utilities
│       ├── src/main/resources/
│       │   └── application.properties
│       ├── pom.xml
│       └── README.md
│
├── Frontend/
│   └── Frontend-Template/
│       ├── src/
│       │   ├── api/               # API configuration
│       │   ├── components/        # Reusable components
│       │   ├── context/           # Context providers
│       │   ├── pages/             # Page components
│       │   ├── services/          # API services
│       │   ├── App.jsx
│       │   └── main.jsx
│       ├── package.json
│       └── README.md
│
└── README.md
```

## 🔒 Security Features

- JWT token-based authentication
- Password encryption with BCrypt
- Role-based access control (RBAC)
- CORS configuration
- Stateless session management
- Global exception handling
- Input validation
- SQL injection prevention

## 🎯 RBAC Rules

### ADMIN Permissions
- ✅ Create projects
- ✅ Add members to projects
- ✅ Create tasks
- ✅ Assign tasks to users
- ✅ Update any task
- ✅ Delete tasks
- ✅ Update task status

### MEMBER Permissions
- ✅ View assigned tasks
- ✅ Update status of assigned tasks only
- ❌ Cannot create/delete tasks
- ❌ Cannot create/delete projects

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👥 Authors

**Team Task Manager Development Team**

## 🙏 Acknowledgments

- Spring Boot Documentation
- React Documentation
- Tailwind CSS
- Railway
- Vercel

## 📞 Support

For support, email support@taskmanager.com or open an issue in the repository.

## 🔗 Links

- [Live Demo](#) - Coming soon
- [API Documentation](http://localhost:8080/swagger-ui.html)
- [Backend README](Backend/Backend-Template/README.md)
- [Frontend README](Frontend/Frontend-Template/README.md)

---

**Built with ❤️ using Spring Boot and React**
