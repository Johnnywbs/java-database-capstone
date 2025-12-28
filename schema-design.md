# Smart Clinic Data Schema

## MySQL Database Design

### Table: patients
Stores personal information and authentication details for patients.
- **id**: INT, Primary Key, Auto Increment
- **full_name**: VARCHAR(100), Not Null
- **email**: VARCHAR(100), Unique, Not Null
- **password**: VARCHAR(255), Not Null (Encrypted)
- **phone_number**: VARCHAR(20)
- **birth_date**: DATE

### Table: doctors
Stores profiles of medical staff.
- **id**: INT, Primary Key, Auto Increment
- **full_name**: VARCHAR(100), Not Null
- **email**: VARCHAR(100), Unique, Not Null
- **specialty**: VARCHAR(100), Not Null (e.g., Cardiology, General)
- **office_hours**: VARCHAR(100) (e.g., "Mon-Fri 09:00-17:00")

### Table: clinic_locations
Stores the physical branches of the clinic network.
- **id**: INT, Primary Key, Auto Increment
- **name**: VARCHAR(100), Not Null (e.g., "Downtown Clinic", "West Side Hub")
- **address**: VARCHAR(255), Not Null
- **city**: VARCHAR(100), Not Null
- **contact_number**: VARCHAR(20)

### Table: appointments
The core link between patients and doctors. Defines the schedule and location.
- **id**: INT, Primary Key, Auto Increment
- **patient_id**: INT, Foreign Key -> patients(id) (ON DELETE CASCADE)
- **doctor_id**: INT, Foreign Key -> doctors(id) (ON DELETE SET NULL)
- **location_id**: INT, Foreign Key -> clinic_locations(id)
- **appointment_time**: DATETIME, Not Null
- **status**: INT, Not Null (0 = Scheduled, 1 = Completed, 2 = Cancelled)

### Table: payments
Tracks financial transactions linked to appointments.
- **id**: INT, Primary Key, Auto Increment
- **appointment_id**: INT, Foreign Key -> appointments(id)
- **amount**: DECIMAL(10, 2), Not Null (Use DECIMAL to avoid currency rounding errors)
- **payment_date**: DATETIME, Default CURRENT_TIMESTAMP
- **method**: VARCHAR(50) (e.g., "Credit Card", "Cash", "Insurance Claim")
- **status**: VARCHAR(20) (e.g., "Paid", "Pending", "Refunded")

### Table: patient_insurances
Stores insurance details for patients to process billing coverage.
- **id**: INT, Primary Key, Auto Increment
- **patient_id**: INT, Foreign Key -> patients(id)
- **provider_name**: VARCHAR(100), Not Null (e.g., "BlueCross", "Medicare")
- **policy_number**: VARCHAR(50), Unique, Not Null
- **coverage_percentage**: DECIMAL(5, 2) (e.g., 80.00 for 80% coverage)

### Table: admin
Stores credentials for system administrators.
- **id**: INT, Primary Key, Auto Increment
- **username**: VARCHAR(50), Unique, Not Null
- **password**: VARCHAR(255), Not Null (Encrypted)

---

## MongoDB Collection Design

### Collection: prescriptions
Stores medical prescriptions issued after an appointment. Using MongoDB allows for flexibility (e.g., varying number of medications, nested pharmacy details) without complex joins.

**Example Document:**
```json
{
  "_id": "ObjectId('64abc123456')",
  "appointmentId": 105,
  "patientId": 45,
  "doctorName": "Dr. Smith",
  "issueDate": "2023-10-25T14:30:00Z",
  "medications": [
    {
      "name": "Amoxicillin",
      "dosage": "500mg",
      "frequency": "Every 8 hours",
      "duration": "7 days"
    },
    {
      "name": "Ibuprofen",
      "dosage": "400mg",
      "frequency": "As needed for pain"
    }
  ],
  "doctorNotes": "Patient should drink plenty of water and rest.",
  "pharmacyRecommendation": {
    "name": "City Central Pharmacy",
    "address": "123 Main St",
    "phone": "555-0199"
  }
}
