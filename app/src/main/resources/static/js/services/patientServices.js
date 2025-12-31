// 1. Import API Base URL
import { API_BASE_URL } from "../config/config.js";

// 2. Set the Base Patient API Endpoint
const PATIENT_API = API_BASE_URL + '/patient';

// 3. Handle Patient Signup
export async function patientSignup(data) {
    try {
        const response = await fetch(`${PATIENT_API}/register`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(data)
        });

        if (response.ok) {
            const message = await response.text();
            return { success: true, message: message };
        } else {
            return { success: false, message: "Registration failed. Email might be in use." };
        }
    } catch (error) {
        console.error("Signup error:", error);
        return { success: false, message: "Network error during signup." };
    }
}

// 4. Handle Patient Login
export async function patientLogin(data) {
    // Logging for dev purposes (remove in production)
    console.log("Attempting login for:", data.email);

    try {
        const response = await fetch(`${PATIENT_API}/login`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(data)
        });
        
        // Return full response for frontend to handle status/tokens
        return response;
    } catch (error) {
        console.error("Login error:", error);
        throw error; // Re-throw so caller handles it
    }
}

// 5. Fetch Logged-in Patient Data
export async function getPatientData(token) {
    try {
        const response = await fetch(`${PATIENT_API}/details/${token}`);
        if (response.ok) {
            return await response.json();
        } else {
            console.error("Failed to fetch patient details");
            return null;
        }
    } catch (error) {
        console.error("Error fetching patient data:", error);
        return null;
    }
}

// 6. Fetch Patient Appointments
export async function getPatientAppointments(id, token, user) {
    // Dynamic URL based on user role (doctor/patient dashboard context)
    const url = `${PATIENT_API}/${id}/appointments/${token}/${user}`;

    try {
        const response = await fetch(url);
        if (response.ok) {
            return await response.json();
        } else {
            console.error("Failed to fetch appointments");
            return null;
        }
    } catch (error) {
        console.error("Error fetching appointments:", error);
        return null;
    }
}

// 7. Filter Appointments
export async function filterAppointments(condition, name, token) {
    const filterCondition = condition || 'null';
    const filterName = name || 'null';
    
    // Construct filtered endpoint URL
    const url = `${PATIENT_API}/filter/${token}/${filterCondition}/${filterName}`;

    try {
        const response = await fetch(url);
        if (response.ok) {
            return await response.json();
        } else {
            console.error("Filter request failed");
            return [];
        }
    } catch (error) {
        console.error("Error filtering appointments:", error);
        alert("An error occurred while filtering appointments.");
        return [];
    }
}
