import { deleteDoctor } from '../services/doctorServices.js';
import { getPatientData } from '../services/patientServices.js';
// Assuming showBookingOverlay is exported from util or handled in patientDashboard
import { showBookingOverlay } from '../util.js'; 

export function createDoctorCard(doctor) {
    // 1. Create Main Card Container
    const card = document.createElement("div");
    card.classList.add("doctor-card");

    // 2. Fetch User Role
    const role = localStorage.getItem("userRole");

    // 3. Create Doctor Info Section
    const infoDiv = document.createElement("div");
    infoDiv.classList.add("doctor-info");

    const name = document.createElement("h3");
    name.textContent = doctor.name;

    const specialty = document.createElement("p");
    specialty.innerHTML = `<strong>Specialty:</strong> ${doctor.specialty}`;

    const email = document.createElement("p");
    email.textContent = doctor.email;

    const availability = document.createElement("p");
    // Handle availability if it's an array or string
    const availText = Array.isArray(doctor.availableTimes) 
        ? doctor.availableTimes.join(", ") 
        : doctor.availableTimes || "N/A";
    availability.innerHTML = `<strong>Available:</strong> <span class="avail-time">${availText}</span>`;

    // Append info elements
    infoDiv.appendChild(name);
    infoDiv.appendChild(specialty);
    infoDiv.appendChild(email);
    infoDiv.appendChild(availability);

    // 4. Create Button Container
    const actionsDiv = document.createElement("div");
    actionsDiv.classList.add("card-actions");

    // 5. Conditionally Add Buttons Based on Role

    // --- ADMIN ROLE ---
    if (role === "admin") {
        const removeBtn = document.createElement("button");
        removeBtn.textContent = "Delete";
        removeBtn.classList.add("delete-btn");
        
        removeBtn.addEventListener("click", async () => {
            if (confirm(`Are you sure you want to remove Dr. ${doctor.name}?`)) {
                try {
                    const token = localStorage.getItem("token");
                    await deleteDoctor(doctor.id, token);
                    // Remove card from DOM on success
                    card.remove();
                    alert("Doctor removed successfully.");
                } catch (error) {
                    console.error("Error deleting doctor:", error);
                    alert("Failed to delete doctor.");
                }
            }
        });
        actionsDiv.appendChild(removeBtn);

    // --- GUEST PATIENT ROLE ---
    } else if (role === "patient" || !role) {
        const bookNow = document.createElement("button");
        bookNow.textContent = "Book Now";
        bookNow.classList.add("book-btn");
        
        bookNow.addEventListener("click", () => {
            alert("Please login to book an appointment.");
            // Optional: Trigger login modal here
        });
        actionsDiv.appendChild(bookNow);

    // --- LOGGED IN PATIENT ROLE ---
    } else if (role === "loggedPatient") {
        const bookNow = document.createElement("button");
        bookNow.textContent = "Book Now";
        bookNow.classList.add("book-btn");
        
        bookNow.addEventListener("click", async (e) => {
            try {
                const token = localStorage.getItem("token");
                // Fetch patient data to pre-fill booking logic
                const patientData = await getPatientData(token);
                
                // Call utility function to show the ripple effect and modal
                if (typeof showBookingOverlay === 'function') {
                    showBookingOverlay(e, doctor, patientData);
                } else {
                    console.error("Booking overlay function missing");
                }
            } catch (error) {
                console.error("Error preparing booking:", error);
                alert("Could not load booking details.");
            }
        });
        actionsDiv.appendChild(bookNow);
    }

    // 6. Final Assembly
    card.appendChild(infoDiv);
    card.appendChild(actionsDiv);

    return card;
}
