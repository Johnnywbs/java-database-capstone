// 1. Import Required Modules
import { openModal } from '../js/components/modals.js';
import { getDoctors, filterDoctors, saveDoctor } from '../js/services/doctorServices.js';
import { createDoctorCard } from '../js/components/doctorCard.js';

// 2. Event Binding and Initial Load
document.addEventListener("DOMContentLoaded", () => {
    // Load doctors immediately
    loadDoctorCards();

    // Bind "Add Doctor" button
    const addDocBtn = document.getElementById('addDocBtn');
    if (addDocBtn) {
        addDocBtn.addEventListener('click', () => {
            openModal('addDoctor');
        });
    }

    // Bind Search and Filter Listeners
    const searchBar = document.getElementById("searchBar");
    const filterTime = document.getElementById("filterTime");
    const filterSpecialty = document.getElementById("filterSpecialty");

    if (searchBar) searchBar.addEventListener("input", filterDoctorsOnChange);
    if (filterTime) filterTime.addEventListener("change", filterDoctorsOnChange);
    if (filterSpecialty) filterSpecialty.addEventListener("change", filterDoctorsOnChange);
});

// Function to fetch and render all doctors
async function loadDoctorCards() {
    const contentDiv = document.getElementById("content");
    contentDiv.innerHTML = ""; // Clear current content

    const doctors = await getDoctors();
    renderDoctorCards(doctors);
}

// Function to handle filter logic
async function filterDoctorsOnChange() {
    const searchBar = document.getElementById("searchBar");
    const filterTime = document.getElementById("filterTime");
    const filterSpecialty = document.getElementById("filterSpecialty");

    // Gather values
    const name = searchBar ? searchBar.value : "";
    const time = filterTime ? filterTime.value : "";
    const specialty = filterSpecialty ? filterSpecialty.value : "";

    // Fetch filtered data
    const doctors = await filterDoctors(name, time, specialty);
    
    // Render
    const contentDiv = document.getElementById("content");
    if (!doctors || doctors.length === 0) {
        contentDiv.innerHTML = "<p>No doctors found.</p>";
    } else {
        renderDoctorCards(doctors);
    }
}

// Utility to render cards
function renderDoctorCards(doctors) {
    const contentDiv = document.getElementById("content");
    contentDiv.innerHTML = ""; // Clear existing

    doctors.forEach(doctor => {
        const card = createDoctorCard(doctor);
        contentDiv.appendChild(card);
    });
}

// 3. Handle Add Doctor Form Submission (Global Scope)
window.adminAddDoctor = async function () {
    // Collect Inputs
    const name = document.getElementById('docName').value;
    const specialty = document.getElementById('docSpecialty').value;
    const email = document.getElementById('docEmail').value;
    const mobileNumber = document.getElementById('docMobile').value;
    const password = document.getElementById('docPassword').value;

    // Collect Availability Checkboxes
    const checkboxes = document.querySelectorAll('input[name="availability"]:checked');
    const availableTimes = Array.from(checkboxes).map(cb => cb.value);

    const doctorData = {
        name,
        specialty,
        email,
        mobileNumber,
        password,
        availableTimes
    };

    // Auth Token Check
    const token = localStorage.getItem("token");
    if (!token) {
        alert("You must be logged in as Admin.");
        return;
    }

    // Call Service
    const result = await saveDoctor(doctorData, token);

    if (result.success) {
        alert("Doctor added successfully!");
        document.getElementById('modal').style.display = 'none'; // Close modal
        loadDoctorCards(); // Refresh list
    } else {
        alert("Error: " + result.message);
    }
};
