# Team Task Manager - Render Deployment Guide

Complete guide for deploying both Backend and Frontend to Render with PostgreSQL database.

## 📋 Prerequisites

- Render account (https://render.com)
- GitHub account with your code pushed
- PostgreSQL database already created on Render

---

## 🗄️ Step 1: Configure Your Existing Render Database

### Get Database Connection Details

1. Go to your Render Dashboard
2. Click on your PostgreSQL database
3. Scroll down to "Connections"
4. Copy these values:
   - **Internal Database URL** (for backend on Render)
   - **External Database URL** (for local development)
   - **Hostname**
   - **Port**
   - **Database**
   - **Username**
   - **Password**

### Database URL Format

Your database URL will look like:
```
postgresql://username:password@hostname:port/database
```

Example:
```
postgresql://taskmanager_user:abc123xyz@dpg-xxxxx.oregon-postgres.render.com:5432/taskmanager_db
```

---

## 🚀 Step 2: Deploy Backend to Render

### 2.1 Create Web Service

1. **Go to Render Dashboard**
   - Click "New +" button
   - Select "Web Service"

2. **Connect Repository**
   - Connect your GitHub account if not already connected
   - Select your repository
   - Click "Connect"

3. **Configure Service**
   
   **Basic Settings:**
   - **Name:** `team-task-manager-backend`
   - **Region:** Choose closest to your users (e.g., Oregon, Frankfurt)
   - **Branch:** `main` (or your default branch)
   - **Root Directory:** `Backend/Backend-Template`
   - **Runtime:** `Java`

   **Build Settings:**
   - **Build Command:**
     ```bash
     mvn clean package -DskipTests
     ```
   
   - **Start Command:**
     ```bash
     java -jar target/team-task-manager-1.0.0.jar
     ```

   **Instance Type:**
   - Select "Free" or "Starter" based on your needs

### 2.2 Add Environment Variables

Click "Advanced" and add these environment variables:

| Key | Value | Notes |
|-----|-------|-------|
| `SPRING_DATASOURCE_URL` | Your Internal Database URL | From Render DB dashboard |
| `SPRING_DATASOURCE_USERNAME` | Your DB username | From Render DB dashboard |
| `SPRING_DATASOURCE_PASSWORD` | Your DB password | From Render DB dashboard |
| `JWT_SECRET` | Generate secure key | See below |
| `FRONTEND_URL` | `https://your-frontend.onrender.com` | Update after frontend deployment |
| `PORT` | `8080` | Default port |

**Generate JWT Secret:**
```bash
# On Linux/Mac
openssl rand -base64 64

# Or use this online
# https://generate-random.org/api-key-generator
```

### 2.3 Deploy Backend

1. Click "Create Web Service"
2. Wait for deployment (5-10 minutes)
3. Monitor logs for any errors
4. Once deployed, note your backend URL:
   ```
   https://team-task-manager-backend.onrender.com
   ```

### 2.4 Verify Backend Deployment

Test these endpoints:

1. **Health Check:**
   ```bash
   curl https://team-task-manager-backend.onrender.com/api/auth/login
   ```

2. **Swagger UI:**
   ```
   https://team-task-manager-backend.onrender.com/swagger-ui.html
   ```

3. **Test Signup:**
   ```bash
   curl -X POST https://team-task-manager-backend.onrender.com/api/auth/signup \
     -H "Content-Type: application/json" \
     -d '{
       "name": "Test User",
       "email": "test@example.com",
       "password": "password123"
     }'
   ```

---

## 🌐 Step 3: Deploy Frontend to Render

### 3.1 Create Static Site

1. **Go to Render Dashboard**
   - Click "New +" button
   - Select "Static Site"

2. **Connect Repository**
   - Select your repository
   - Click "Connect"

3. **Configure Static Site**
   
   **Basic Settings:**
   - **Name:** `team-task-manager-frontend`
   - **Branch:** `main`
   - **Root Directory:** `Frontend/Frontend-Template`
   - **Build Command:**
     ```bash
     npm install && npm run build
     ```
   - **Publish Directory:** `dist`

### 3.2 Add Environment Variables

Add this environment variable:

| Key | Value |
|-----|-------|
| `VITE_API_URL` | `https://team-task-manager-backend.onrender.com/api` |

### 3.3 Deploy Frontend

1. Click "Create Static Site"
2. Wait for deployment (3-5 minutes)
3. Note your frontend URL:
   ```
   https://team-task-manager-frontend.onrender.com
   ```

### 3.4 Update Backend CORS

1. Go back to your backend service on Render
2. Update the `FRONTEND_URL` environment variable:
   ```
   https://team-task-manager-frontend.onrender.com
   ```
3. Click "Save Changes"
4. Backend will automatically redeploy

---

## 🔧 Step 4: Configuration Files for Render

### Backend: Create render.yaml (Optional)

Create this file in your backend root directory for easier redeployment:

```yaml
services:
  - type: web
    name: team-task-manager-backend
    runtime: java
    buildCommand: mvn clean package -DskipTests
    startCommand: java -jar target/team-task-manager-1.0.0.jar
    envVars:
      - key: SPRING_DATASOURCE_URL
        sync: false
      - key: SPRING_DATASOURCE_USERNAME
        sync: false
      - key: SPRING_DATASOURCE_PASSWORD
        sync: false
      - key: JWT_SECRET
        sync: false
      - key: FRONTEND_URL
        sync: false
      - key: PORT
        value: 8080
```

### Frontend: Update package.json

Ensure your `package.json` has the correct build script:

```json
{
  "scripts": {
    "dev": "vite",
    "build": "vite build",
    "preview": "vite preview"
  }
}
```

---

## 🗄️ Step 5: Database Setup

### Create Initial Admin User

Since your database is already on Render, connect to it and create an admin user:

#### Option 1: Using Render Shell

1. Go to your PostgreSQL database on Render
2. Click "Connect" → "External Connection"
3. Use the provided command to connect via psql

#### Option 2: Using SQL Client

Use the External Database URL to connect with tools like:
- pgAdmin
- DBeaver
- TablePlus

#### Create Admin User

After signing up through the UI, update the user role:

```sql
-- Connect to your database
-- Then run:

-- View all users
SELECT id, name, email, role FROM users;

-- Update first user to ADMIN
UPDATE users SET role = 'ADMIN' WHERE id = 1;

-- Or update by email
UPDATE users SET role = 'ADMIN' WHERE email = 'your-email@example.com';

-- Verify
SELECT id, name, email, role FROM users;
```

---

## ✅ Step 6: Verification Checklist

### Backend Verification

- [ ] Backend URL is accessible
- [ ] Swagger UI loads: `https://your-backend.onrender.com/swagger-ui.html`
- [ ] Database connection successful (check logs)
- [ ] Signup endpoint works
- [ ] Login endpoint works
- [ ] JWT tokens are generated
- [ ] No errors in logs

### Frontend Verification

- [ ] Frontend URL is accessible
- [ ] Login page loads
- [ ] Signup page loads
- [ ] Can create account
- [ ] Can login
- [ ] Dashboard loads after login
- [ ] Can create projects (as ADMIN)
- [ ] Can create tasks (as ADMIN)
- [ ] No console errors

### Integration Verification

- [ ] Frontend can communicate with backend
- [ ] CORS is configured correctly
- [ ] JWT authentication works
- [ ] Protected routes work
- [ ] All CRUD operations work
- [ ] Role-based access control works

---

## 🐛 Troubleshooting

### Backend Issues

**Problem: Build fails**
```
Solution:
1. Check Java version in logs (should be 21)
2. Verify pom.xml is correct
3. Check build command is correct
4. Review build logs for specific errors
```

**Problem: Database connection fails**
```
Solution:
1. Verify database URL is correct (use Internal URL)
2. Check username and password
3. Ensure database is running
4. Check database logs
5. Verify network connectivity
```

**Problem: Application crashes on startup**
```
Solution:
1. Check environment variables are set
2. Review application logs
3. Verify JWT_SECRET is set
4. Check database migrations
```

### Frontend Issues

**Problem: Build fails**
```
Solution:
1. Check Node version (should be 18+)
2. Verify package.json is correct
3. Check build command
4. Review build logs
```

**Problem: Cannot connect to backend**
```
Solution:
1. Verify VITE_API_URL is correct
2. Check backend is running
3. Verify CORS settings
4. Check browser console for errors
5. Test backend URL directly
```

**Problem: 404 on page refresh**
```
Solution:
1. Add _redirects file in public folder:
   /* /index.html 200
2. Or configure in Render dashboard
```

### CORS Issues

**Problem: CORS errors in browser console**
```
Solution:
1. Update FRONTEND_URL in backend environment variables
2. Ensure it matches your frontend URL exactly
3. No trailing slash in URL
4. Redeploy backend after changes
```

---

## 🔄 Continuous Deployment

### Auto-Deploy on Git Push

Render automatically deploys when you push to your connected branch:

1. Make changes to your code
2. Commit and push to GitHub:
   ```bash
   git add .
   git commit -m "Your changes"
   git push origin main
   ```
3. Render will automatically detect and deploy

### Manual Deploy

To manually trigger a deployment:

1. Go to your service on Render
2. Click "Manual Deploy"
3. Select "Clear build cache & deploy" if needed

---

## 📊 Monitoring

### Backend Monitoring

1. **View Logs:**
   - Go to your backend service
   - Click "Logs" tab
   - Monitor for errors

2. **Metrics:**
   - Click "Metrics" tab
   - Monitor CPU, Memory, Response times

3. **Set Up Alerts:**
   - Go to Settings
   - Configure email alerts for failures

### Frontend Monitoring

1. **View Logs:**
   - Go to your static site
   - Click "Logs" tab

2. **Deploy History:**
   - View all deployments
   - Rollback if needed

---

## 💰 Render Free Tier Limitations

### Free Tier Includes:

- **Web Services:** 750 hours/month
- **Static Sites:** Unlimited
- **PostgreSQL:** 90 days free, then $7/month
- **Automatic sleep:** Services sleep after 15 minutes of inactivity
- **Cold starts:** 30-60 seconds to wake up

### Important Notes:

- Backend will sleep after 15 minutes of inactivity
- First request after sleep takes 30-60 seconds
- Consider upgrading to paid plan for production use
- Database is NOT free after 90 days

---

## 🚀 Upgrade to Paid Plan (Recommended for Production)

### Benefits:

- No automatic sleep
- Faster performance
- More resources
- Better support
- Custom domains

### Pricing:

- **Starter:** $7/month per service
- **Standard:** $25/month per service
- **PostgreSQL:** $7/month (after free trial)

---

## 📝 Environment Variables Reference

### Backend Environment Variables

```bash
# Database (from Render PostgreSQL)
SPRING_DATASOURCE_URL=postgresql://user:pass@host:5432/db
SPRING_DATASOURCE_USERNAME=your_username
SPRING_DATASOURCE_PASSWORD=your_password

# JWT Configuration
JWT_SECRET=your_generated_secret_key_here

# CORS Configuration
FRONTEND_URL=https://your-frontend.onrender.com

# Server Configuration
PORT=8080
```

### Frontend Environment Variables

```bash
# API Configuration
VITE_API_URL=https://your-backend.onrender.com/api
```

---

## 🔗 Quick Links

### Your Deployed URLs

**Backend:**
```
https://team-task-manager-backend.onrender.com
```

**Frontend:**
```
https://team-task-manager-frontend.onrender.com
```

**Swagger Documentation:**
```
https://team-task-manager-backend.onrender.com/swagger-ui.html
```

**Render Dashboard:**
```
https://dashboard.render.com
```

---

## 📞 Support

### Render Support

- Documentation: https://render.com/docs
- Community: https://community.render.com
- Status: https://status.render.com

### Application Support

- GitHub Issues: Your repository issues page
- Email: support@taskmanager.com

---

## ✅ Final Checklist

- [ ] Database is running on Render
- [ ] Backend deployed successfully
- [ ] Frontend deployed successfully
- [ ] Environment variables configured
- [ ] CORS configured correctly
- [ ] Admin user created
- [ ] All features tested
- [ ] No errors in logs
- [ ] Monitoring set up
- [ ] URLs documented

---

**Congratulations! Your Team Task Manager is now live on Render! 🎉**

**Backend:** https://your-backend.onrender.com
**Frontend:** https://your-frontend.onrender.com
