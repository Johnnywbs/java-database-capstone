// 1. Import API Base URL
import { API_BASE_URL } from "../config/config.js";

// 2. Set Doctor API Endpoint
const DOCTOR_API = API_BASE_URL + '/doctor';

// 3. Get All Doctors
export async function getDoctors() {
    try {
        const response = await fetch(DOCTOR_API);
        if (response.ok) {
            return await response.json();
        } else {
            console.error("Failed to fetch doctors:", response.status);
            return [];
        }
    } catch (error) {
        console.error("Error fetching doctors:", error);
        return [];
    }
}

// 4. Delete a Doctor
export async function deleteDoctor(id, token) {
    try {
        const response = await fetch(`${DOCTOR_API}/${id}/${token}`, {
            method: 'DELETE'
        });

        if (response.ok) {
            return { success: true, message: "Doctor deleted successfully" };
        } else {
            return { success: false, message: "Failed to delete doctor" };
        }
    } catch (error) {
        console.error("Error deleting doctor:", error);
        return { success: false, message: "Network error occurred" };
    }
}

// 5. Save (Add) a New Doctor
export async function saveDoctor(doctor, token) {
    try {
        const response = await fetch(`${DOCTOR_API}/register/${token}`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(doctor)
        });

        if (response.ok) {
            const data = await response.text(); // Assuming backend returns text message
            return { success: true, message: data };
        } else {
            return { success: false, message: "Failed to add doctor" };
        }
    } catch (error) {
        console.error("Error saving doctor:", error);
        return { success: false, message: "Network error occurred" };
    }
}

// 6. Filter Doctors
export async function filterDoctors(name, time, specialty) {
    // Handle empty/null values to build correct URL params
    const filterName = name || 'null';
    const filterTime = time || 'null';
    const filterSpecialty = specialty || 'null';

    const url = `${DOCTOR_API}/${filterName}/${filterTime}/${filterSpecialty}`;

    try {
        const response = await fetch(url);
        if (response.ok) {
            return await response.json();
        } else {
            console.error("Failed to filter doctors");
            return [];
        }
    } catch (error) {
        console.error("Error filtering doctors:", error);
        alert("An error occurred while filtering doctors.");
        return [];
    }
}
