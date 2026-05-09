# Render Deployment - Step by Step with Screenshots Guide

Visual guide for deploying Team Task Manager on Render with your existing database.

---

## 📋 Before You Start

### What You Need:
- ✅ Render account (free)
- ✅ Your code pushed to GitHub
- ✅ PostgreSQL database already on Render
- ✅ 15 minutes of time

### What You'll Get:
- ✅ Live backend API
- ✅ Live frontend website
- ✅ Fully functional application

---

## 🗄️ PART 1: Get Your Database Info (2 minutes)

### Step 1: Open Render Dashboard
1. Go to https://dashboard.render.com
2. Login to your account

### Step 2: Find Your Database
1. Look for your PostgreSQL database in the dashboard
2. Click on it to open

### Step 3: Copy Connection Details
1. Scroll down to **"Connections"** section
2. You'll see two URLs:
   - **Internal Database URL** ← Use this for backend
   - **External Database URL** ← Use this for local development

3. Copy the **Internal Database URL**
   - Format: `postgresql://username:password@hostname.render.com:5432/database`
   - Example: `postgresql://taskmanager_user:abc123@dpg-xxxxx.oregon-postgres.render.com:5432/taskmanager_db`

4. Also note separately:
   - **Username:** (e.g., `taskmanager_user`)
   - **Password:** (e.g., `abc123xyz`)

**✅ Checkpoint:** You have your database URL, username, and password copied

---

## 🚀 PART 2: Deploy Backend (7 minutes)

### Step 1: Create New Web Service

1. In Render Dashboard, click **"New +"** button (top right)
2. Select **"Web Service"**

### Step 2: Connect Your Repository

1. If first time:
   - Click **"Connect GitHub"**
   - Authorize Render to access your repositories
   
2. Find your repository in the list
3. Click **"Connect"** next to your repository

### Step 3: Configure Service - Basic Settings

Fill in these fields:

**Name:**
```
team-task-manager-backend
```

**Region:**
```
Oregon (US West)  ← Choose closest to you
```

**Branch:**
```
main  ← or your default branch
```

**Root Directory:**
```
Backend/Backend-Template
```
⚠️ **Important:** Type this exactly, case-sensitive!

**Runtime:**
```
Java
```
Select from dropdown

### Step 4: Configure Service - Build Settings

**Build Command:**
```bash
mvn clean package -DskipTests
```
⚠️ Copy exactly as shown

**Start Command:**
```bash
java -jar target/team-task-manager-1.0.0.jar
```
⚠️ Copy exactly as shown

### Step 5: Select Instance Type

**Instance Type:**
```
Free
```
Select "Free" from dropdown

### Step 6: Add Environment Variables

Click **"Advanced"** button to expand

Click **"Add Environment Variable"** and add these one by one:

**Variable 1:**
```
Key: SPRING_DATASOURCE_URL
Value: [Paste your Internal Database URL from Part 1]
```

**Variable 2:**
```
Key: SPRING_DATASOURCE_USERNAME
Value: [Paste your database username from Part 1]
```

**Variable 3:**
```
Key: SPRING_DATASOURCE_PASSWORD
Value: [Paste your database password from Part 1]
```

**Variable 4:**
```
Key: JWT_SECRET
Value: VGhpcy1pcy1hLXZlcnktc2VjdXJlLWtleS1mb3ItdGVhbS10YXNrLW1hbmFnZXItand0LXRva2Vucy1wcm9kdWN0aW9u
```
⚠️ Or generate your own: `openssl rand -base64 64`

**Variable 5:**
```
Key: FRONTEND_URL
Value: https://team-task-manager-frontend.onrender.com
```
⚠️ We'll update this after frontend deployment

**Variable 6:**
```
Key: PORT
Value: 8080
```

### Step 7: Create Service

1. Review all settings
2. Click **"Create Web Service"** button at bottom
3. Wait for deployment (5-10 minutes)

### Step 8: Monitor Deployment

You'll see:
- **Building...** - Maven is building your app
- **Deploying...** - App is starting
- **Live** - App is running! ✅

Watch the logs for any errors.

### Step 9: Get Your Backend URL

Once deployed, you'll see your URL at the top:
```
https://team-task-manager-backend.onrender.com
```

**Copy this URL!** You'll need it for frontend.

### Step 10: Test Backend

Open in browser:
```
https://team-task-manager-backend.onrender.com/swagger-ui.html
```

You should see Swagger UI with all API endpoints.

**✅ Checkpoint:** Backend is live and Swagger UI loads

---

## 🌐 PART 3: Deploy Frontend (5 minutes)

### Step 1: Create New Static Site

1. In Render Dashboard, click **"New +"** button
2. Select **"Static Site"**

### Step 2: Connect Repository

1. Select your repository (same as backend)
2. Click **"Connect"**

### Step 3: Configure Static Site

**Name:**
```
team-task-manager-frontend
```

**Branch:**
```
main
```

**Root Directory:**
```
Frontend/Frontend-Template
```
⚠️ Type exactly, case-sensitive!

**Build Command:**
```bash
npm install && npm run build
```

**Publish Directory:**
```
dist
```

### Step 4: Add Environment Variable

Click **"Advanced"** button

Click **"Add Environment Variable"**

**Variable:**
```
Key: VITE_API_URL
Value: https://team-task-manager-backend.onrender.com/api
```
⚠️ Replace with YOUR backend URL from Part 2, Step 9
⚠️ Don't forget `/api` at the end!

### Step 5: Create Static Site

1. Review settings
2. Click **"Create Static Site"**
3. Wait for deployment (3-5 minutes)

### Step 6: Get Your Frontend URL

Once deployed, you'll see:
```
https://team-task-manager-frontend.onrender.com
```

**Copy this URL!**

### Step 7: Test Frontend

Open in browser:
```
https://team-task-manager-frontend.onrender.com
```

You should see the login page!

**✅ Checkpoint:** Frontend loads and shows login page

---

## 🔄 PART 4: Update Backend CORS (2 minutes)

### Step 1: Go Back to Backend Service

1. In Render Dashboard
2. Click on your backend service
3. Go to **"Environment"** tab

### Step 2: Update FRONTEND_URL

1. Find `FRONTEND_URL` variable
2. Click **"Edit"**
3. Update value to:
```
https://team-task-manager-frontend.onrender.com
```
⚠️ Use YOUR frontend URL from Part 3, Step 6
⚠️ NO trailing slash!

4. Click **"Save Changes"**

### Step 3: Wait for Redeploy

Backend will automatically redeploy (1-2 minutes)

**✅ Checkpoint:** Backend redeployed with correct CORS

---

## 👤 PART 5: Create Admin User (3 minutes)

### Step 1: Sign Up Through UI

1. Go to your frontend URL
2. Click **"Sign Up"**
3. Fill in:
   - Name: Your Name
   - Email: your-email@example.com
   - Password: password123
4. Click **"Sign up"**

You'll be logged in as a MEMBER (default role)

### Step 2: Connect to Database

1. Go to Render Dashboard
2. Click on your PostgreSQL database
3. Scroll to **"Connections"**
4. Click **"External Connection"**
5. Copy the `psql` command shown

### Step 3: Open Terminal

Open your terminal (Command Prompt, PowerShell, or Terminal)

### Step 4: Connect to Database

Paste and run the `psql` command:
```bash
PGPASSWORD=your_password psql -h hostname.render.com -U username database_name
```

You should see:
```
database_name=>
```

### Step 5: Update User Role

Run this SQL command:
```sql
UPDATE users SET role = 'ADMIN' WHERE email = 'your-email@example.com';
```

Replace with your actual email!

### Step 6: Verify

```sql
SELECT id, name, email, role FROM users;
```

You should see your user with role = 'ADMIN'

### Step 7: Exit Database

```sql
\q
```

### Step 8: Logout and Login Again

1. Go to your frontend
2. Click **"Logout"**
3. Click **"Login"**
4. Enter your credentials
5. You should now see **(ADMIN)** next to your name in navbar

**✅ Checkpoint:** You're logged in as ADMIN

---

## ✅ PART 6: Test Everything (5 minutes)

### Test 1: Dashboard
1. Click **"Dashboard"** in navbar
2. You should see 4 cards with statistics
3. All should show 0 initially

### Test 2: Create Project
1. Click **"Projects"** in navbar
2. Click **"Create Project"** button
3. Fill in:
   - Title: Test Project
   - Description: My first project
4. Click **"Create Project"**
5. You should see your project in the list

### Test 3: Create Task
1. Click **"View Tasks"** on your project
2. Click **"Create Task"** button
3. Fill in:
   - Title: Test Task
   - Description: My first task
   - Priority: HIGH
   - Due Date: (select tomorrow)
4. Click **"Create Task"**
5. You should see your task in the list

### Test 4: Update Task Status
1. In the task list, find the Status dropdown
2. Change from **TODO** to **IN_PROGRESS**
3. Status should update immediately

### Test 5: Check Dashboard
1. Click **"Dashboard"** in navbar
2. You should now see:
   - Total Tasks: 1
   - Completed Tasks: 0
   - Pending Tasks: 1
   - Overdue Tasks: 0

**✅ All Tests Passed!** Your app is fully functional! 🎉

---

## 🎯 Your Live URLs

### Backend API:
```
https://team-task-manager-backend.onrender.com
```

### Frontend App:
```
https://team-task-manager-frontend.onrender.com
```

### API Documentation:
```
https://team-task-manager-backend.onrender.com/swagger-ui.html
```

---

## 🐛 Troubleshooting

### Problem: Backend won't start

**Check logs:**
1. Go to backend service
2. Click **"Logs"** tab
3. Look for errors

**Common issues:**
- Database URL wrong → Check it's the INTERNAL URL
- Missing environment variables → Verify all 6 are set
- Build failed → Check build command is correct

### Problem: Frontend shows blank page

**Check browser console:**
1. Press F12 in browser
2. Click **"Console"** tab
3. Look for errors

**Common issues:**
- Can't connect to backend → Check VITE_API_URL
- CORS error → Check FRONTEND_URL in backend
- Build failed → Check build command

### Problem: Can't login

**Check:**
1. Backend is running (check logs)
2. Database connection works (check backend logs)
3. JWT_SECRET is set
4. Try signup first, then login

### Problem: "Only ADMIN can..." error

**Solution:**
1. You need to update user role in database
2. Follow Part 5 again
3. Make sure to logout and login after updating role

---

## ⚠️ Important Notes

### Free Tier Limitations:
- Backend **sleeps after 15 minutes** of inactivity
- First request after sleep takes **30-60 seconds** to wake up
- This is normal for free tier
- Upgrade to paid plan ($7/month) to prevent sleeping

### Database Costs:
- PostgreSQL is **free for 90 days**
- After 90 days: **$7/month**
- You'll get email reminder before charges start

### Auto-Deploy:
- Every time you push to GitHub, Render auto-deploys
- Check logs to monitor deployments
- Can disable auto-deploy in settings if needed

---

## 🎉 Congratulations!

You've successfully deployed Team Task Manager on Render!

### What You've Accomplished:
✅ Backend API deployed and running
✅ Frontend website deployed and accessible
✅ Database connected and working
✅ Admin user created
✅ All features tested and working

### Next Steps:
1. Share your URLs with team
2. Create more users
3. Start managing projects and tasks
4. Customize as needed

---

## 📞 Need Help?

### Resources:
- **Full Guide:** [RENDER_DEPLOYMENT_GUIDE.md](RENDER_DEPLOYMENT_GUIDE.md)
- **Quick Start:** [RENDER_QUICK_START.md](RENDER_QUICK_START.md)
- **API Docs:** [API_DOCUMENTATION.md](API_DOCUMENTATION.md)
- **Render Docs:** https://render.com/docs
- **Render Community:** https://community.render.com

### Common Questions:

**Q: How do I add more users?**
A: They can sign up through the frontend. Update role in database if needed.

**Q: How do I update my app?**
A: Push changes to GitHub, Render auto-deploys.

**Q: How do I view logs?**
A: Render Dashboard → Your Service → Logs tab

**Q: How do I upgrade to paid plan?**
A: Render Dashboard → Your Service → Settings → Change instance type

---

**Enjoy your Team Task Manager! 🚀**
