# Render Deployment - Quick Start Guide

Fast track guide to deploy Team Task Manager on Render.

## 🎯 Prerequisites

- ✅ Render account
- ✅ GitHub repository with code
- ✅ PostgreSQL database on Render (already created)

---

## 🚀 Backend Deployment (5 minutes)

### 1. Create Web Service

**Render Dashboard → New + → Web Service**

### 2. Configuration

| Setting | Value |
|---------|-------|
| **Name** | `team-task-manager-backend` |
| **Root Directory** | `Backend/Backend-Template` |
| **Runtime** | Java |
| **Build Command** | `mvn clean package -DskipTests` |
| **Start Command** | `java -jar target/team-task-manager-1.0.0.jar` |
| **Instance Type** | Free |

### 3. Environment Variables

```bash
SPRING_DATASOURCE_URL=<your-render-db-internal-url>
SPRING_DATASOURCE_USERNAME=<your-db-username>
SPRING_DATASOURCE_PASSWORD=<your-db-password>
JWT_SECRET=<generate-with-openssl-rand-base64-64>
FRONTEND_URL=https://your-frontend.onrender.com
PORT=8080
```

### 4. Deploy

Click **"Create Web Service"** → Wait 5-10 minutes

### 5. Test

```
https://your-backend.onrender.com/swagger-ui.html
```

---

## 🌐 Frontend Deployment (3 minutes)

### 1. Create Static Site

**Render Dashboard → New + → Static Site**

### 2. Configuration

| Setting | Value |
|---------|-------|
| **Name** | `team-task-manager-frontend` |
| **Root Directory** | `Frontend/Frontend-Template` |
| **Build Command** | `npm install && npm run build` |
| **Publish Directory** | `dist` |

### 3. Environment Variables

```bash
VITE_API_URL=https://your-backend.onrender.com/api
```

### 4. Deploy

Click **"Create Static Site"** → Wait 3-5 minutes

### 5. Update Backend CORS

Go back to backend service → Update `FRONTEND_URL` to your frontend URL → Save

---

## 👤 Create Admin User

### 1. Sign up through UI

Visit your frontend → Sign up with email/password

### 2. Connect to Database

**Render Dashboard → Your PostgreSQL → Connect → External Connection**

### 3. Update Role

```sql
UPDATE users SET role = 'ADMIN' WHERE email = 'your-email@example.com';
```

---

## ✅ Verification

### Backend
- [ ] `https://your-backend.onrender.com/swagger-ui.html` loads
- [ ] Can signup via API
- [ ] Can login via API

### Frontend
- [ ] `https://your-frontend.onrender.com` loads
- [ ] Can login
- [ ] Dashboard shows
- [ ] Can create projects

---

## 🐛 Common Issues

### Backend won't start
```bash
# Check logs for:
- Database connection errors → Verify DB URL
- Port binding errors → Ensure PORT=8080
- JWT errors → Verify JWT_SECRET is set
```

### Frontend can't connect
```bash
# Check:
- VITE_API_URL is correct
- Backend FRONTEND_URL matches frontend URL
- No CORS errors in browser console
```

### Database connection fails
```bash
# Use INTERNAL database URL for backend on Render
# Format: postgresql://user:pass@host.render.com:5432/db
```

---

## 📋 Quick Commands

### Get Database URL
```bash
# Render Dashboard → PostgreSQL → Connections → Internal Database URL
```

### Generate JWT Secret
```bash
openssl rand -base64 64
```

### Test Backend
```bash
curl https://your-backend.onrender.com/api/auth/login
```

### View Logs
```bash
# Render Dashboard → Your Service → Logs
```

---

## 🔗 Your URLs

**Backend:**
```
https://team-task-manager-backend.onrender.com
```

**Frontend:**
```
https://team-task-manager-frontend.onrender.com
```

**Swagger:**
```
https://team-task-manager-backend.onrender.com/swagger-ui.html
```

---

## ⚠️ Important Notes

1. **Free tier sleeps after 15 min** - First request takes 30-60s
2. **Database costs $7/month** after 90-day trial
3. **Use Internal DB URL** for backend on Render
4. **Update CORS** after frontend deployment
5. **Create admin user** manually via SQL

---

## 📞 Need Help?

- Full Guide: [RENDER_DEPLOYMENT_GUIDE.md](RENDER_DEPLOYMENT_GUIDE.md)
- Render Docs: https://render.com/docs
- Render Community: https://community.render.com

---

**Total Time: ~10 minutes** ⏱️

**Status: Ready to Deploy!** 🚀
