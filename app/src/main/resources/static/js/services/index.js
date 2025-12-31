// 1. Import Required Modules
import { openModal } from '../components/modals.js';
import { API_BASE_URL } from '../config/config.js';

// 2. Define API Endpoints
const ADMIN_API = API_BASE_URL + '/admin';
const DOCTOR_API = API_BASE_URL + '/doctor/login';

// 3. Setup Button Event Listeners on Page Load
window.onload = function () {
    // Select login buttons (These IDs should exist in your HTML/Modal structure)
    const adminBtn = document.getElementById('adminLogin');
    const doctorBtn = document.getElementById('doctorLogin');

    // Attach listener for Admin
    if (adminBtn) {
        adminBtn.addEventListener('click', () => {
            openModal('adminLogin'); // Opens the Admin Login Modal
        });
    }

    // Attach listener for Doctor
    if (doctorBtn) {
        doctorBtn.addEventListener('click', () => {
            openModal('doctorLogin'); // Opens the Doctor Login Modal
        });
    }
};

// 4. Implement Admin Login Handler
// Attached to window so it can be called from the HTML onclick attributes inside the modal
window.adminLoginHandler = async function () {
    // Read values from the input fields (Ensure these IDs match your Modal HTML)
    const username = document.getElementById('adminUsername').value;
    const password = document.getElementById('adminPassword').value;

    const admin = { username, password };

    try {
        const response = await fetch(ADMIN_API, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(admin)
        });

        if (response.ok) {
            // Extract response (Token)
            const data = await response.json();
            
            // Store token
            localStorage.setItem("token", data);
            
            // Navigate/Update UI using helper from render.js
            selectRole('admin'); 
        } else {
            alert("Invalid credentials!");
        }
    } catch (error) {
        console.error("Admin Login Error:", error);
        alert("An error occurred during login.");
    }
};

// 5. Implement Doctor Login Handler
window.doctorLoginHandler = async function () {
    // Read values (Note: Doctor uses email per instructions)
    const email = document.getElementById('doctorEmail').value;
    const password = document.getElementById('doctorPassword').value;

    const doctor = { email, password };

    try {
        const response = await fetch(DOCTOR_API, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(doctor)
        });

        if (response.ok) {
            const data = await response.json();
            
            // Store token
            localStorage.setItem("token", data);
            
            // Navigate/Update UI
            selectRole('doctor');
        } else {
            alert("Invalid credentials!");
        }
    } catch (error) {
        console.error("Doctor Login Error:", error);
        alert("An error occurred during login.");
    }
};
