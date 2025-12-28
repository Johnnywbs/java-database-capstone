---

## Admin User Stories

**Title: Admin Login**
_As an Admin, I want to log in to the portal with my username and password, so that I can manage the platform securely._

**Acceptance Criteria:**
1. User can enter username and password.
2. Invalid credentials display an error message.
3. Successful login redirects to the Admin Dashboard.

**Priority:** High
**Story Points:** 3
**Notes:**
- Must use Spring Security for authentication.

---

**Title: Admin Logout**
_As an Admin, I want to log out of the portal, so that I can secure access to the system when I am done._

**Acceptance Criteria:**
1. Clicking "Logout" invalidates the user session.
2. User is redirected to the login page after logout.
3. Back button does not allow access to protected pages after logout.

**Priority:** High
**Story Points:** 2
**Notes:**
- Clear session cookies.

---

**Title: Add Doctor**
_As an Admin, I want to add doctors to the portal, so that they can be registered in the system and manage appointments._

**Acceptance Criteria:**
1. Admin allows entry of doctor details (Name, Specialty, Email).
2. Data is validated (e.g., email format).
3. Doctor information is saved to the MySQL database.
4. Success message is displayed.

**Priority:** High
**Story Points:** 5
**Notes:**
- Needs a form in Thymeleaf and a POST endpoint.

---

**Title: Delete Doctor**
_As an Admin, I want to delete a doctor profile from the portal, so that I can remove staff who are no longer working at the clinic._

**Acceptance Criteria:**
1. Admin sees a list of doctors with a "Delete" option.
2. Clicking delete prompts for confirmation.
3. Upon confirmation, the doctor record is removed from MySQL.
4. List refreshes to show the updated data.

**Priority:** Medium
**Story Points:** 5
**Notes:**
- Check for referential integrity (what happens to their appointments?).

---

**Title: Usage Statistics (Stored Procedure)**
_As an Admin, I want to execute a stored procedure in MySQL CLI, so that I can get the number of appointments per month and track usage statistics._

**Acceptance Criteria:**
1. A stored procedure exists in the MySQL database.
2. The procedure returns a count of appointments grouped by month.
3. The Admin can trigger this via CLI or a backend trigger.

**Priority:** Medium
**Story Points:** 8
**Notes:**
- Requires SQL knowledge to write the procedure.

---

## Patient User Stories

**Title: Public Doctor List**
_As a Patient, I want to view a list of doctors without logging in, so that I can explore options before registering._

**Acceptance Criteria:**
1. The doctor list page is accessible to unauthenticated users.
2. The list displays Doctor Name and Specialty.
3. Users are prompted to register/login if they try to book.

**Priority:** Medium
**Story Points:** 3
**Notes:**
- Needs to be excluded from Spring Security authentication filters.

---

**Title: Patient Registration**
_As a Patient, I want to sign up using my email and password, so that I can schedule appointments._

**Acceptance Criteria:**
1. Registration form captures Name, Email, and Password.
2. System verifies if the email is already in use.
3. Account is created in MySQL and user is redirected to Login.

**Priority:** High
**Story Points:** 5
**Notes:**
- Password must be encrypted (BCrypt).

---

**Title: Patient Login**
_As a Patient, I want to log in to the portal, so that I can manage my bookings._

**Acceptance Criteria:**
1. Patient enters valid credentials.
2. Successful login redirects to the Patient Dashboard.
3. Access is granted to patient-specific features.

**Priority:** High
**Story Points:** 2
**Notes:**
- Standard authentication flow.

---

**Title: Patient Logout**
_As a Patient, I want to log out of the portal, so that I can protect my account._

**Acceptance Criteria:**
1. Clicking Logout terminates the session.
2. Redirects to the home page.

**Priority:** Low
**Story Points:** 1
**Notes:**
- Shared logic with Admin logout.

---

**Title: Book Appointment**
_As a Patient, I want to book a one-hour appointment, so that I can consult a doctor._

**Acceptance Criteria:**
1. Patient selects a doctor and a valid time slot.
2. System verifies availability (no double booking).
3. Appointment is saved with a status of "Scheduled".
4. The duration is fixed at 1 hour by default.

**Priority:** High
**Story Points:** 8
**Notes:**
- Core functionality. Needs complex validation logic in the Service layer.

---

**Title: View Upcoming Appointments**
_As a Patient, I want to view my upcoming appointments, so that I can prepare properly._

**Acceptance Criteria:**
1. Patient Dashboard displays a list of future appointments.
2. Shows Date, Time, and Doctor's name.
3. Past appointments are either hidden or shown in a separate history section.

**Priority:** Medium
**Story Points:** 3
**Notes:**
- REST API endpoint needed to fetch data by Patient ID.

---

## Doctor User Stories

**Title: Doctor Login**
_As a Doctor, I want to log in to the portal, so that I can manage my appointments._

**Acceptance Criteria:**
1. Doctor enters username and password.
2. System identifies the user role as "Doctor".
3. Redirects to the Doctor Dashboard.

**Priority:** High
**Story Points:** 2
**Notes:**
- Role-based access control (RBAC) required.

---

**Title: Doctor Logout**
_As a Doctor, I want to log out of the portal, so that I can protect my data._

**Acceptance Criteria:**
1. Clicking Logout ends the current session.
2. Redirects to the login screen.
3. prevents unauthorized access to patient data on shared computers.

**Priority:** High
**Story Points:** 1
**Notes:**
- Security best practice.

---

**Title: View Appointment Calendar**
_As a Doctor, I want to view my appointment calendar, so that I can stay organized._

**Acceptance Criteria:**
1. Dashboard shows a daily or weekly view of appointments.
2. Appointments display time and Patient name.
3. Empty slots are clearly visible.

**Priority:** High
**Story Points:** 5
**Notes:**
- UI component needed (e.g., FullCalendar or custom table).

---

**Title: Manage Availability**
_As a Doctor, I want to mark my unavailability, so that I can inform patients of only available times._

**Acceptance Criteria:**
1. Doctor selects a date/time range to block off.
2. System marks these slots as "Unavailable" in the database.
3. Patients cannot book appointments during these times.

**Priority:** Medium
**Story Points:** 5
**Notes:**
- Logic check in the Booking Service to exclude these times.

---

**Title: Update Profile**
_As a Doctor, I want to update my profile with specialization and contact info, so that patients have up-to-date information._

**Acceptance Criteria:**
1. Form available to edit Specialty, Phone, and Office hours.
2. "Save" updates the Doctor entity in MySQL.
3. Changes are immediately visible on the public doctor list.

**Priority:** Low
**Story Points:** 3
**Notes:**
- Input validation required.

---

**Title: View Patient Details**
_As a Doctor, I want to view patient details for upcoming appointments, so that I can prepare properly._

**Acceptance Criteria:**
1. Clicking an appointment shows the linked Patient's profile.
2. Displays basic info (Name, Age) and any prior notes.
3. Data is read-only in this view.

**Priority:** Medium
**Story Points:** 3
**Notes:**
- Requires a join or fetch between Appointment and Patient entities.
