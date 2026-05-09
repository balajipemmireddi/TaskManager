# Team Task Manager - Frontend

Modern, responsive React application for Team Task Manager with JWT authentication and role-based access control.

## 🚀 Features

- **Authentication**
  - User signup and login
  - JWT token-based authentication
  - Persistent sessions with localStorage
  - Automatic token refresh

- **Dashboard**
  - Real-time task statistics
  - Total, completed, pending, and overdue tasks
  - Quick action cards

- **Project Management**
  - View all projects
  - Create new projects (ADMIN only)
  - Delete projects (ADMIN only)
  - View project details

- **Task Management**
  - View tasks by project
  - Create tasks (ADMIN only)
  - Update task status
  - Assign tasks to users (ADMIN only)
  - Delete tasks (ADMIN only)
  - Priority tracking (LOW, MEDIUM, HIGH)
  - Status tracking (TODO, IN_PROGRESS, DONE)

- **Role-Based Access Control**
  - ADMIN: Full access to all features
  - MEMBER: View and update assigned tasks only

## 🛠️ Tech Stack

- **React 18.3** - UI library
- **Vite** - Build tool and dev server
- **React Router DOM** - Client-side routing
- **Axios** - HTTP client
- **Tailwind CSS** - Utility-first CSS framework
- **Context API** - State management
- **JWT Decode** - Token parsing

## 📋 Prerequisites

- Node.js 18+ or higher
- npm or yarn
- Backend API running (see Backend README)

## 🔧 Installation & Setup

### 1. Clone the repository

```bash
git clone <repository-url>
cd Frontend/Frontend-Template
```

### 2. Install dependencies

```bash
npm install
```

### 3. Configure Environment Variables

Copy `.env.example` to `.env`:

```bash
cp .env.example .env
```

Update the API URL:

```env
VITE_API_URL=http://localhost:8080/api
```

For production:

```env
VITE_API_URL=https://your-backend-url.railway.app/api
```

### 4. Run the development server

```bash
npm run dev
```

The application will be available at `http://localhost:5173`

### 5. Build for production

```bash
npm run build
```

## 📁 Project Structure

```
src/
├── api/
│   └── axiosInstance.js       # Axios configuration with interceptors
├── components/
│   ├── DashboardCard.jsx      # Dashboard statistics card
│   ├── Loader.jsx             # Loading spinner
│   ├── Navbar.jsx             # Navigation bar
│   └── ProtectedRoute.jsx     # Route protection wrapper
├── context/
│   └── AuthContext.jsx        # Authentication context
├── pages/
│   ├── CreateProjectPage.jsx # Create project form
│   ├── CreateTaskPage.jsx    # Create task form
│   ├── DashboardPage.jsx     # Dashboard with statistics
│   ├── LoginPage.jsx         # Login form
│   ├── ProjectsPage.jsx      # Projects list
│   ├── SignupPage.jsx        # Signup form
│   └── TasksPage.jsx         # Tasks list
├── services/
│   ├── authService.js        # Authentication API calls
│   ├── dashboardService.js   # Dashboard API calls
│   ├── projectService.js     # Project API calls
│   └── taskService.js        # Task API calls
├── App.jsx                   # Main app component with routes
├── index.css                 # Global styles with Tailwind
└── main.jsx                  # App entry point
```

## 🔐 Authentication Flow

1. User signs up or logs in
2. Backend returns JWT token and user data
3. Token is stored in localStorage
4. Axios interceptor adds token to all requests
5. Protected routes check authentication status
6. On 401 error, user is redirected to login

## 🎨 UI Components

### Dashboard Cards
- Display key metrics with icons
- Color-coded by status
- Responsive grid layout

### Protected Routes
- Automatic authentication check
- Role-based access control
- Redirect to login if unauthenticated

### Navbar
- User information display
- Role badge
- Logout functionality
- Responsive design

## 🚢 Deployment

### Deploy to Vercel

1. Install Vercel CLI:

```bash
npm i -g vercel
```

2. Login to Vercel:

```bash
vercel login
```

3. Deploy:

```bash
vercel
```

4. Set environment variables in Vercel dashboard:
   - `VITE_API_URL` - Your backend API URL

### Deploy to Railway

1. Install Railway CLI:

```bash
npm i -g @railway/cli
```

2. Login to Railway:

```bash
railway login
```

3. Initialize project:

```bash
railway init
```

4. Add environment variable:

```bash
railway variables set VITE_API_URL=https://your-backend-url.railway.app/api
```

5. Deploy:

```bash
railway up
```

## 🔒 Security Features

- JWT token authentication
- Automatic token expiration handling
- Protected routes
- Role-based access control
- Secure HTTP-only communication
- XSS protection with React

## 📱 Responsive Design

- Mobile-first approach
- Tailwind CSS breakpoints
- Responsive navigation
- Adaptive layouts
- Touch-friendly interfaces

## 🎯 Available Routes

| Route | Access | Description |
|-------|--------|-------------|
| `/` | Public | Redirects to dashboard |
| `/login` | Public | Login page |
| `/signup` | Public | Signup page |
| `/dashboard` | Authenticated | Dashboard with statistics |
| `/projects` | Authenticated | Projects list |
| `/projects/create` | ADMIN | Create project form |
| `/projects/:id/tasks` | Authenticated | Tasks for a project |
| `/projects/:id/tasks/create` | ADMIN | Create task form |

## 🧪 Testing

Run linter:

```bash
npm run lint
```

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

## 🔗 Related

- [Backend Repository](../Backend-Template)
- [API Documentation](http://localhost:8080/swagger-ui.html)
