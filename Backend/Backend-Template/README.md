# Team Task Manager - Backend

Production-quality REST API for Team Task Manager application built with Spring Boot, JWT Authentication, and PostgreSQL.

## 🚀 Features

- **Authentication & Authorization**
  - JWT-based authentication
  - Role-based access control (ADMIN, MEMBER)
  - Secure password encryption with BCrypt

- **Project Management**
  - Create, update, delete projects
  - Add members to projects
  - View all projects

- **Task Management**
  - Create and assign tasks
  - Update task status and details
  - Priority tracking (LOW, MEDIUM, HIGH)
  - Due date management
  - Task filtering by project

- **Dashboard**
  - Total tasks count
  - Completed tasks
  - Pending tasks
  - Overdue tasks tracking

## 🛠️ Tech Stack

- **Java 21**
- **Spring Boot 3.2.5**
- **Spring Security** with JWT
- **Spring Data JPA**
- **PostgreSQL**
- **Maven**
- **Swagger/OpenAPI** for API documentation
- **Lombok** for boilerplate reduction

## 📋 Prerequisites

- Java 21 or higher
- Maven 3.6+
- PostgreSQL 14+

## 🔧 Installation & Setup

### 1. Clone the repository

```bash
git clone <repository-url>
cd Backend/Backend-Template
```

### 2. Configure Database

Create a PostgreSQL database:

```sql
CREATE DATABASE taskmanager;
```

### 3. Configure Environment Variables

Copy `.env.example` to `.env` and update the values:

```bash
cp .env.example .env
```

Update the following variables:

```properties
SPRING_DATASOURCE_URL=jdbc:postgresql://localhost:5432/taskmanager
SPRING_DATASOURCE_USERNAME=postgres
SPRING_DATASOURCE_PASSWORD=your_password
JWT_SECRET=your_jwt_secret_key
FRONTEND_URL=http://localhost:5173
```

### 4. Build the application

```bash
mvn clean install
```

### 5. Run the application

```bash
mvn spring-boot:run
```

The API will be available at `http://localhost:8080`

## 📚 API Documentation

Once the application is running, access the Swagger UI at:

```
http://localhost:8080/swagger-ui.html
```

## 🔐 API Endpoints

### Authentication

| Method | Endpoint | Description | Access |
|--------|----------|-------------|--------|
| POST | `/api/auth/signup` | Register new user | Public |
| POST | `/api/auth/login` | Login user | Public |

### Projects

| Method | Endpoint | Description | Access |
|--------|----------|-------------|--------|
| POST | `/api/projects` | Create project | ADMIN |
| GET | `/api/projects` | Get all projects | Authenticated |
| GET | `/api/projects/{id}` | Get project by ID | Authenticated |
| PUT | `/api/projects/{id}` | Update project | ADMIN |
| DELETE | `/api/projects/{id}` | Delete project | ADMIN |
| POST | `/api/projects/{projectId}/members/{userId}` | Add member | ADMIN |

### Tasks

| Method | Endpoint | Description | Access |
|--------|----------|-------------|--------|
| POST | `/api/tasks` | Create task | ADMIN |
| GET | `/api/projects/{projectId}/tasks` | Get tasks by project | Authenticated |
| PUT | `/api/tasks/{id}` | Update task | ADMIN |
| PUT | `/api/tasks/{id}/status` | Update task status | MEMBER (own tasks) / ADMIN |
| PUT | `/api/tasks/{id}/assign/{userId}` | Assign task | ADMIN |
| DELETE | `/api/tasks/{id}` | Delete task | ADMIN |

### Dashboard

| Method | Endpoint | Description | Access |
|--------|----------|-------------|--------|
| GET | `/api/dashboard` | Get dashboard stats | Authenticated |

## 📦 Project Structure

```
src/main/java/com/taskmanager/
├── auth/                    # Authentication module
│   ├── dto/                # Auth DTOs
│   ├── AuthController.java
│   └── AuthService.java
├── user/                   # User module
│   ├── User.java
│   └── UserRepository.java
├── project/                # Project module
│   ├── dto/
│   ├── Project.java
│   ├── ProjectMember.java
│   ├── ProjectRepository.java
│   ├── ProjectMemberRepository.java
│   ├── ProjectController.java
│   └── ProjectService.java
├── task/                   # Task module
│   ├── dto/
│   ├── Task.java
│   ├── TaskRepository.java
│   ├── TaskController.java
│   └── TaskService.java
├── dashboard/              # Dashboard module
│   ├── dto/
│   ├── DashboardController.java
│   └── DashboardService.java
├── security/               # Security configuration
│   ├── JwtService.java
│   ├── JwtAuthenticationFilter.java
│   └── UserDetailsServiceImpl.java
├── config/                 # Application configuration
│   ├── SecurityConfig.java
│   └── OpenApiConfig.java
├── exception/              # Exception handling
│   ├── GlobalExceptionHandler.java
│   ├── ResourceNotFoundException.java
│   ├── DuplicateResourceException.java
│   └── UnauthorizedAccessException.java
└── common/                 # Common utilities
    ├── Role.java
    ├── TaskStatus.java
    ├── Priority.java
    └── ApiResponse.java
```

## 🚢 Deployment to Railway

### 1. Install Railway CLI

```bash
npm i -g @railway/cli
```

### 2. Login to Railway

```bash
railway login
```

### 3. Initialize Railway Project

```bash
railway init
```

### 4. Add PostgreSQL Database

```bash
railway add --database postgresql
```

### 5. Set Environment Variables

In Railway dashboard, add the following environment variables:

- `SPRING_DATASOURCE_URL` - Provided by Railway PostgreSQL
- `SPRING_DATASOURCE_USERNAME` - Provided by Railway PostgreSQL
- `SPRING_DATASOURCE_PASSWORD` - Provided by Railway PostgreSQL
- `JWT_SECRET` - Your secure JWT secret
- `FRONTEND_URL` - Your frontend URL

### 6. Deploy

```bash
railway up
```

## 🔒 Security Features

- JWT token-based authentication
- Password encryption with BCrypt
- Role-based access control (RBAC)
- CORS configuration
- Stateless session management
- Global exception handling

## 🧪 Testing

Run tests with:

```bash
mvn test
```

## 📝 Standard API Response Format

### Success Response

```json
{
  "success": true,
  "message": "Operation successful",
  "data": {}
}
```

### Error Response

```json
{
  "success": false,
  "message": "Error message",
  "data": null
}
```

## 🎯 RBAC Rules

### ADMIN Permissions
- Create projects
- Add members to projects
- Create tasks
- Assign tasks to users
- Update any task
- Delete tasks
- Update task status

### MEMBER Permissions
- View assigned tasks
- Update status of assigned tasks only

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## 📄 License

This project is licensed under the MIT License.

## 👥 Authors

Team Task Manager Development Team

## 📞 Support

For support, email support@taskmanager.com
