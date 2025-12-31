// 1. Import Required Modules
import { createDoctorCard } from '../js/components/doctorCard.js';
import { openModal } from '../js/components/modals.js';
import { getDoctors, filterDoctors } from '../js/services/doctorServices.js';
import { patientLogin, patientSignup } from '../js/services/patientServices.js';

// 2. Load Data and Bind Events on Load
document.addEventListener("DOMContentLoaded", () => {
    // Load all doctors initially
    loadDoctorCards();

    // Bind Signup Modal Trigger
    const signupBtn = document.getElementById("patientSignup");
    if (signupBtn) {
        signupBtn.addEventListener("click", () => openModal("patientSignup"));
    }

    // Bind Login Modal Trigger
    const loginBtn = document.getElementById("patientLogin");
    if (loginBtn) {
        loginBtn.addEventListener("click", () => openModal("patientLogin"));
    }

    // Bind Search and Filters
    const searchBar = document.getElementById("searchBar");
    const filterTime = document.getElementById("filterTime");
    const filterSpecialty = document.getElementById("filterSpecialty");

    if (searchBar) searchBar.addEventListener("input", filterDoctorsOnChange);
    if (filterTime) filterTime.addEventListener("change", filterDoctorsOnChange);
    if (filterSpecialty) filterSpecialty.addEventListener("change", filterDoctorsOnChange);
});

// Load All Doctors
async function loadDoctorCards() {
    const contentDiv = document.getElementById("content");
    contentDiv.innerHTML = ""; 

    const doctors = await getDoctors();
    renderDoctorCards(doctors);
}

// Filter Logic
async function filterDoctorsOnChange() {
    const searchBar = document.getElementById("searchBar");
    const filterTime = document.getElementById("filterTime");
    const filterSpecialty = document.getElementById("filterSpecialty");

    const name = searchBar ? searchBar.value : "";
    const time = filterTime ? filterTime.value : "";
    const specialty = filterSpecialty ? filterSpecialty.value : "";

    const doctors = await filterDoctors(name, time, specialty);
    
    const contentDiv = document.getElementById("content");
    if (!doctors || doctors.length === 0) {
        contentDiv.innerHTML = "<p>No doctors found with the given filters.</p>";
    } else {
        renderDoctorCards(doctors);
    }
}

// Render Helper
function renderDoctorCards(doctors) {
    const contentDiv = document.getElementById("content");
    contentDiv.innerHTML = "";

    doctors.forEach(doctor => {
        const card = createDoctorCard(doctor);
        contentDiv.appendChild(card);
    });
}

// 3. Handle Patient Signup (Global)
window.signupPatient = async function () {
    const name = document.getElementById("signupName").value;
    const email = document.getElementById("signupEmail").value;
    const password = document.getElementById("signupPassword").value;
    const phone = document.getElementById("signupPhone").value;
    const address = document.getElementById("signupAddress").value;

    const data = { name, email, password, phone, address };

    const result = await patientSignup(data);

    if (result.success) {
        alert("Signup successful! Please log in.");
        document.getElementById('modal').style.display = 'none';
    } else {
        alert("Error: " + result.message);
    }
};

// 4. Handle Patient Login (Global)
window.loginPatient = async function () {
    const email = document.getElementById("loginEmail").value;
    const password = document.getElementById("loginPassword").value;

    try {
        const response = await patientLogin({ email, password });
        
        if (response.ok) {
            const token = await response.text(); // or .json() depending on backend
            
            // Store Session
            localStorage.setItem("token", token);
            localStorage.setItem("userRole", "loggedPatient");
            
            alert("Login successful!");
            window.location.href = "/pages/patientDashboard.html"; // Redirect
        } else {
            alert("Invalid credentials.");
        }
    } catch (error) {
        console.error(error);
        alert("Login failed.");
    }
};
