# Admin Setup Guide

## Current Implementation

### Default Behavior
- **All users who sign up are assigned the `MEMBER` role by default**
- There is currently **no admin signup option** in the UI
- The first user needs to be manually promoted to ADMIN

---

## How to Create an Admin User

### Option 1: Direct Database Update (Recommended for First Admin)

After deploying your application and creating your first user account:

1. **Sign up normally** through the UI at `/signup`
2. **Access your PostgreSQL database** on Render:
   - Go to Render Dashboard → Your PostgreSQL database
   - Click "Connect" → Copy the PSQL Command
   - Run it in your terminal

3. **Update the user's role to ADMIN:**
   ```sql
   -- View all users
   SELECT id, name, email, role FROM users;
   
   -- Update the first user to ADMIN (replace 1 with actual user ID)
   UPDATE users SET role = 'ADMIN' WHERE id = 1;
   
   -- Or update by email
   UPDATE users SET role = 'ADMIN' WHERE email = 'your-email@example.com';
   
   -- Verify the change
   SELECT id, name, email, role FROM users;
   ```

4. **Log out and log back in** to get a new JWT token with ADMIN role

---

### Option 2: Add Role Selection to Signup (For Future Enhancement)

If you want to allow role selection during signup, you would need to:

#### Backend Changes:

1. **Update SignupRequest.java:**
   ```java
   @Data
   @NoArgsConstructor
   @AllArgsConstructor
   public class SignupRequest {
       @NotBlank(message = "Name is required")
       private String name;

       @NotBlank(message = "Email is required")
       @Email(message = "Email must be valid")
       private String email;

       @NotBlank(message = "Password is required")
       @Size(min = 6, message = "Password must be at least 6 characters")
       private String password;
       
       // Add this field
       private String role; // Optional: "ADMIN" or "MEMBER"
   }
   ```

2. **Update AuthService.java:**
   ```java
   public AuthResponse signup(SignupRequest request) {
       if (userRepository.existsByEmail(request.getEmail())) {
           throw new DuplicateResourceException("Email already exists");
       }

       User user = new User();
       user.setName(request.getName());
       user.setEmail(request.getEmail());
       user.setPassword(passwordEncoder.encode(request.getPassword()));
       
       // Allow role selection, default to MEMBER if not provided
       if (request.getRole() != null && request.getRole().equals("ADMIN")) {
           user.setRole(Role.ADMIN);
       } else {
           user.setRole(Role.MEMBER);
       }

       user = userRepository.save(user);
       // ... rest of the code
   }
   ```

#### Frontend Changes:

3. **Update SignupPage.jsx:**
   ```jsx
   const [formData, setFormData] = useState({
     name: '',
     email: '',
     password: '',
     role: 'MEMBER', // Add this
   });
   
   // Add role selection in the form:
   <div>
     <label htmlFor="role" className="block text-sm font-medium text-gray-700 mb-2">
       Account Type
     </label>
     <select
       id="role"
       name="role"
       className="appearance-none relative block w-full px-3 py-2 border border-gray-300 rounded-md"
       value={formData.role}
       onChange={handleChange}
     >
       <option value="MEMBER">Team Member</option>
       <option value="ADMIN">Administrator</option>
     </select>
   </div>
   ```

**⚠️ Security Warning:** Allowing anyone to sign up as ADMIN is a security risk! Consider:
- Only allowing the first user to be ADMIN
- Requiring an admin secret key
- Having existing admins promote users
- Using invitation-only admin registration

---

### Option 3: Admin Invitation System (Most Secure)

Create a separate admin-only endpoint to promote users:

1. **Add to AuthController.java:**
   ```java
   @PostMapping("/promote/{userId}")
   @PreAuthorize("hasRole('ADMIN')")
   public ResponseEntity<ApiResponse<String>> promoteToAdmin(@PathVariable Long userId) {
       User user = userRepository.findById(userId)
           .orElseThrow(() -> new ResourceNotFoundException("User not found"));
       
       user.setRole(Role.ADMIN);
       userRepository.save(user);
       
       return ResponseEntity.ok(ApiResponse.success("User promoted to admin", null));
   }
   ```

2. **Create an Admin Management Page** in the frontend where admins can:
   - View all users
   - Promote members to admin
   - Demote admins to member

---

## Current Workflow

### For the First Admin:
1. Deploy the application
2. Sign up through the UI (becomes MEMBER)
3. Manually update database to set role = 'ADMIN'
4. Log out and log back in
5. Now you have full admin privileges

### For Additional Admins:
- The first admin can either:
  - Manually update the database (Option 1)
  - Use an admin management feature (Option 3 - needs to be implemented)

### For Regular Members:
- Sign up normally through `/signup`
- Automatically assigned MEMBER role
- Can view projects and tasks
- Cannot create/delete projects or tasks

---

## Testing Admin Features

### As Admin, you can:
- ✅ Create projects
- ✅ Delete projects
- ✅ Create tasks
- ✅ Delete tasks
- ✅ Update task status
- ✅ View all projects and tasks

### As Member, you can:
- ✅ View projects
- ✅ View tasks
- ✅ Update task status
- ❌ Cannot create projects (shows error message)
- ❌ Cannot delete projects (button hidden)
- ❌ Cannot create tasks (button hidden)
- ❌ Cannot delete tasks (button hidden)

---

## Quick Database Commands

### Connect to Render PostgreSQL:
```bash
# Get the PSQL command from Render Dashboard → Database → Connect
psql -h <host> -U <user> -d <database> -p <port>
```

### Useful SQL Commands:
```sql
-- List all users
SELECT id, name, email, role, created_at FROM users;

-- Make user admin by ID
UPDATE users SET role = 'ADMIN' WHERE id = 1;

-- Make user admin by email
UPDATE users SET role = 'ADMIN' WHERE email = 'admin@example.com';

-- Make user member (demote)
UPDATE users SET role = 'MEMBER' WHERE email = 'user@example.com';

-- Count admins
SELECT COUNT(*) FROM users WHERE role = 'ADMIN';

-- Count members
SELECT COUNT(*) FROM users WHERE role = 'MEMBER';
```

---

## Recommendation

**For production use, I recommend:**

1. **First deployment:** Use Option 1 (direct database update) to create your first admin
2. **Future enhancement:** Implement Option 3 (admin invitation system) for better security
3. **Avoid:** Option 2 (public admin signup) unless you add proper security measures

This ensures:
- Secure admin access
- Controlled user permissions
- Audit trail of who has admin rights
- Easy management of team roles
