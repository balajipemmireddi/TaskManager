# Team Task Manager - Complete Setup Guide

This guide will walk you through setting up the Team Task Manager application from scratch.

## 📋 Prerequisites Checklist

Before starting, ensure you have the following installed:

- [ ] Java 21 or higher
- [ ] Maven 3.6+
- [ ] Node.js 18+
- [ ] PostgreSQL 14+
- [ ] Git
- [ ] A code editor (VS Code, IntelliJ IDEA, etc.)

## 🗄️ Database Setup

### Step 1: Install PostgreSQL

**Windows:**
```bash
# Download from https://www.postgresql.org/download/windows/
# Run the installer and follow the wizard
```

**macOS:**
```bash
brew install postgresql@14
brew services start postgresql@14
```

**Linux (Ubuntu/Debian):**
```bash
sudo apt update
sudo apt install postgresql postgresql-contrib
sudo systemctl start postgresql
```

### Step 2: Create Database

```bash
# Access PostgreSQL
psql -U postgres

# Create database
CREATE DATABASE taskmanager;

# Create user (optional)
CREATE USER taskmanager_user WITH PASSWORD 'your_secure_password';
GRANT ALL PRIVILEGES ON DATABASE taskmanager TO taskmanager_user;

# Exit
\q
```

## 🔧 Backend Setup

### Step 1: Navigate to Backend Directory

```bash
cd Backend/Backend-Template
```

### Step 2: Configure Environment Variables

Create a `.env` file:

```bash
cp .env.example .env
```

Edit `.env` with your database credentials:

```properties
SPRING_DATASOURCE_URL=jdbc:postgresql://localhost:5432/taskmanager
SPRING_DATASOURCE_USERNAME=postgres
SPRING_DATASOURCE_PASSWORD=your_password
JWT_SECRET=VGhpcy1pcy1hLXZlcnktc2VjdXJlLWtleS1mb3ItdGVhbS10YXNrLW1hbmFnZXItand0LXRva2Vucy1wcm9kdWN0aW9u
FRONTEND_URL=http://localhost:5173
PORT=8080
```

### Step 3: Build the Application

```bash
# Clean and build
mvn clean install

# Skip tests if needed
mvn clean install -DskipTests
```

### Step 4: Run the Backend

```bash
mvn spring-boot:run
```

**Expected Output:**
```
Started TeamTaskManagerApplication in X.XXX seconds
```

**Verify Backend:**
- API: http://localhost:8080/api
- Swagger: http://localhost:8080/swagger-ui.html

## 💻 Frontend Setup

### Step 1: Navigate to Frontend Directory

```bash
cd Frontend/Frontend-Template
```

### Step 2: Install Dependencies

```bash
npm install
```

If you encounter errors:
```bash
npm install --legacy-peer-deps
```

### Step 3: Configure Environment Variables

Create a `.env` file:

```bash
cp .env.example .env
```

Edit `.env`:

```env
VITE_API_URL=http://localhost:8080/api
```

### Step 4: Run the Frontend

```bash
npm run dev
```

**Expected Output:**
```
VITE v5.x.x ready in XXX ms
➜  Local:   http://localhost:5173/
```

**Verify Frontend:**
- Open browser: http://localhost:5173

## 🧪 Testing the Application

### Step 1: Create an Admin User

Since the first user should be an ADMIN, you need to manually update the database:

1. **Sign up through the UI** (creates a MEMBER by default)
2. **Update the role in database:**

```sql
-- Connect to database
psql -U postgres -d taskmanager

-- Update user role to ADMIN
UPDATE users SET role = 'ADMIN' WHERE email = 'your_email@example.com';

-- Verify
SELECT id, name, email, role FROM users;
```

### Step 2: Test Authentication

1. **Login** with your credentials
2. Verify you see the dashboard
3. Check that your role shows as ADMIN in the navbar

### Step 3: Test Project Management

1. Click "Projects" in navbar
2. Click "Create Project"
3. Fill in:
   - Title: "Test Project"
   - Description: "My first project"
4. Click "Create Project"
5. Verify project appears in the list

### Step 4: Test Task Management

1. Click "View Tasks" on your project
2. Click "Create Task"
3. Fill in:
   - Title: "Test Task"
   - Description: "My first task"
   - Priority: HIGH
   - Due Date: (select a future date)
4. Click "Create Task"
5. Verify task appears in the list

### Step 5: Test Dashboard

1. Click "Dashboard" in navbar
2. Verify statistics are displayed:
   - Total Tasks
   - Completed Tasks
   - Pending Tasks
   - Overdue Tasks

## 🚀 Production Deployment

### Backend Deployment (Railway)

1. **Create Railway Account:**
   - Visit https://railway.app
   - Sign up with GitHub

2. **Install Railway CLI:**
   ```bash
   npm install -g @railway/cli
   ```

3. **Login:**
   ```bash
   railway login
   ```

4. **Initialize Project:**
   ```bash
   cd Backend/Backend-Template
   railway init
   ```

5. **Add PostgreSQL:**
   ```bash
   railway add --database postgresql
   ```

6. **Set Environment Variables:**
   
   In Railway dashboard, add:
   - `JWT_SECRET`: Your secure JWT secret
   - `FRONTEND_URL`: Your frontend URL (e.g., https://your-app.vercel.app)

7. **Deploy:**
   ```bash
   railway up
   ```

8. **Get Backend URL:**
   - Copy the URL from Railway dashboard
   - Format: `https://your-app.railway.app`

### Frontend Deployment (Vercel)

1. **Create Vercel Account:**
   - Visit https://vercel.com
   - Sign up with GitHub

2. **Install Vercel CLI:**
   ```bash
   npm install -g vercel
   ```

3. **Deploy:**
   ```bash
   cd Frontend/Frontend-Template
   vercel
   ```

4. **Set Environment Variable:**
   
   In Vercel dashboard:
   - Go to Settings → Environment Variables
   - Add `VITE_API_URL` = `https://your-backend.railway.app/api`

5. **Redeploy:**
   ```bash
   vercel --prod
   ```

## 🔍 Troubleshooting

### Backend Issues

**Problem: Database connection failed**
```
Solution:
1. Verify PostgreSQL is running: sudo systemctl status postgresql
2. Check database exists: psql -U postgres -l
3. Verify credentials in .env file
4. Check firewall settings
```

**Problem: Port 8080 already in use**
```
Solution:
1. Change PORT in .env file
2. Or kill the process: lsof -ti:8080 | xargs kill -9
```

**Problem: JWT token errors**
```
Solution:
1. Ensure JWT_SECRET is set in .env
2. Clear browser localStorage
3. Login again
```

### Frontend Issues

**Problem: Cannot connect to backend**
```
Solution:
1. Verify backend is running on port 8080
2. Check VITE_API_URL in .env
3. Check browser console for CORS errors
4. Verify FRONTEND_URL in backend .env
```

**Problem: npm install fails**
```
Solution:
1. Delete node_modules and package-lock.json
2. Run: npm install --legacy-peer-deps
3. Or use: npm install --force
```

**Problem: Blank page after login**
```
Solution:
1. Check browser console for errors
2. Verify token is stored in localStorage
3. Check network tab for API calls
4. Clear browser cache and localStorage
```

## 📊 Database Schema Verification

After running the application, verify tables were created:

```sql
-- Connect to database
psql -U postgres -d taskmanager

-- List all tables
\dt

-- Expected tables:
-- users
-- projects
-- project_members
-- tasks

-- View table structure
\d users
\d projects
\d project_members
\d tasks
```

## 🔐 Security Checklist

Before deploying to production:

- [ ] Change JWT_SECRET to a strong, unique value
- [ ] Use strong database passwords
- [ ] Enable HTTPS for both frontend and backend
- [ ] Set proper CORS origins
- [ ] Review and update security configurations
- [ ] Enable database backups
- [ ] Set up monitoring and logging
- [ ] Review API rate limiting
- [ ] Implement proper error handling
- [ ] Secure environment variables

## 📝 Next Steps

After successful setup:

1. **Create more users** with different roles
2. **Create multiple projects** to test functionality
3. **Assign tasks** to different users
4. **Test RBAC** by logging in as MEMBER
5. **Customize** the application for your needs
6. **Add features** as required
7. **Set up CI/CD** for automated deployments

## 🆘 Getting Help

If you encounter issues:

1. Check the [README.md](README.md) for general information
2. Review [Backend README](Backend/Backend-Template/README.md)
3. Review [Frontend README](Frontend/Frontend-Template/README.md)
4. Check application logs
5. Open an issue on GitHub
6. Contact support@taskmanager.com

## 📚 Additional Resources

- [Spring Boot Documentation](https://spring.io/projects/spring-boot)
- [React Documentation](https://react.dev)
- [PostgreSQL Documentation](https://www.postgresql.org/docs/)
- [Railway Documentation](https://docs.railway.app)
- [Vercel Documentation](https://vercel.com/docs)
- [JWT.io](https://jwt.io)

---

**Congratulations! Your Team Task Manager is now set up and running! 🎉**
