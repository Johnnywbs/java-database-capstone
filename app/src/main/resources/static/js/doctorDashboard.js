// 1. Import Required Modules
// Note: We use getPatientAppointments as the service function
import { getPatientAppointments } from '../js/services/patientServices.js';
import { createPatientRow } from '../js/components/patientRows.js';

// 2. Initialize Global Variables
const patientTableBody = document.querySelector("#patientTable tbody");
let selectedDate = new Date().toISOString().split('T')[0]; // Default to Today
const token = localStorage.getItem("token");
let patientName = "null"; // Default string for search

// 3. Setup Listeners on Load
document.addEventListener("DOMContentLoaded", () => {
    // Initial Load
    loadAppointments();

    // Date Picker Logic
    const datePicker = document.getElementById("dateFilter");
    if (datePicker) {
        datePicker.value = selectedDate;
        datePicker.addEventListener("change", (e) => {
            selectedDate = e.target.value;
            loadAppointments();
        });
    }

    // Search Bar Logic
    const searchBar = document.getElementById("searchBar");
    if (searchBar) {
        searchBar.addEventListener("input", (e) => {
            const val = e.target.value.trim();
            patientName = val === "" ? "null" : val;
            loadAppointments();
        });
    }

    // "Today's Appointments" Button
    const todayBtn = document.getElementById("todayBtn");
    if (todayBtn) {
        todayBtn.addEventListener("click", () => {
            const today = new Date().toISOString().split('T')[0];
            selectedDate = today;
            if (datePicker) datePicker.value = today;
            loadAppointments();
        });
    }
});

// 4. Load Appointments Function
async function loadAppointments() {
    // Clear table
    if (patientTableBody) patientTableBody.innerHTML = "";

    try {
        // Fetch appointments (Doctor ID 0 or extracted from token on backend)
        const appointments = await getPatientAppointments(0, token, "doctor");

        if (!appointments || appointments.length === 0) {
            patientTableBody.innerHTML = `<tr><td colspan="5" class="noPatientRecord">No Appointments found for today.</td></tr>`;
            return;
        }

        // Render Rows
        // Note: Ideally the backend filters by date. If not, filter here:
        // const filtered = appointments.filter(a => a.date === selectedDate);
        
        appointments.forEach(appointment => {
            const row = createPatientRow(appointment);
            patientTableBody.appendChild(row);
        });

    } catch (error) {
        console.error("Error loading appointments:", error);
        patientTableBody.innerHTML = `<tr><td colspan="5" class="error">Error loading data.</td></tr>`;
    }
}
