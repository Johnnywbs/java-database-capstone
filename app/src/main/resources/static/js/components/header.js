function renderHeader() {
    const headerDiv = document.getElementById("header");
    
    // 1. Check current page - Clear session if on Landing Page
    if (window.location.pathname.endsWith("/") || window.location.pathname.endsWith("index.html")) {
        localStorage.removeItem("userRole");
        localStorage.removeItem("token");
    }

    // 2. Get Role and Token
    const role = localStorage.getItem("userRole");
    const token = localStorage.getItem("token");

    // 3. Auth Check: If session invalid for protected roles, force logout
    if ((role === "loggedPatient" || role === "admin" || role === "doctor") && !token) {
        localStorage.removeItem("userRole");
        localStorage.removeItem("token");
        alert("Session expired or invalid login. Please log in again.");
        window.location.href = "/";
        return;
    }

    // 4. Inject appropriate HTML based on role
    let headerContent = `
        <div class="header-container">
            <div class="logo-section">
                <img src="../assets/images/logo/logo.png" alt="Clinic Logo" class="logo-img">
                <h1>Smart Clinic</h1>
            </div>
            <nav class="nav-links">
    `;

    if (role === "admin") {
        headerContent += `
            <button id="addDocBtn" class="adminBtn">Add Doctor</button>
            <a href="#" id="logoutBtn">Logout</a>
        `;
    } else if (role === "doctor") {
        headerContent += `
            <span class="welcome-text">Dr. Dashboard</span>
            <a href="#" id="logoutBtn">Logout</a>
        `;
    } else if (role === "loggedPatient") {
        headerContent += `
            <a href="/pages/patientDashboard.html">Home</a>
            <a href="/pages/patientAppointments.html">Appointments</a>
            <a href="#" id="logoutBtn">Logout</a>
        `;
    } else {
        // Default (Unregistered/Guest Patient)
        headerContent += `
            <button id="loginBtn" class="nav-btn">Login</button>
            <button id="signupBtn" class="nav-btn">Sign Up</button>
        `;
    }

    headerContent += `
            </nav>
        </div>
    `;

    // 5. Finalize Injection
    if (headerDiv) {
        headerDiv.innerHTML = headerContent;
        attachHeaderButtonListeners(role);
    }
}

function attachHeaderButtonListeners(role) {
    // Logout Logic
    const logoutBtn = document.getElementById("logoutBtn");
    if (logoutBtn) {
        logoutBtn.addEventListener("click", (e) => {
            e.preventDefault();
            if (role === "loggedPatient") {
                // For patient, we just clear token and go back to public dashboard
                localStorage.removeItem("token");
                localStorage.setItem("userRole", "patient");
                window.location.href = "/pages/patientDashboard.html";
            } else {
                // For admin/doctor, full logout
                localStorage.removeItem("token");
                localStorage.removeItem("userRole");
                window.location.href = "/";
            }
        });
    }

    // Admin: Add Doctor Modal Trigger
    const addDocBtn = document.getElementById("addDocBtn");
    if (addDocBtn) {
        addDocBtn.addEventListener("click", () => {
            // Assumes openModal is globally available or imported in the main script
            if (typeof openModal === "function") {
                openModal("addDoctor");
            } else {
                console.error("openModal function not found");
            }
        });
    }

    // Guest: Login/Signup Modals
    const loginBtn = document.getElementById("loginBtn");
    const signupBtn = document.getElementById("signupBtn");
    
    if (loginBtn) {
        loginBtn.addEventListener("click", () => {
            if (typeof openModal === "function") openModal("login");
        });
    }
    if (signupBtn) {
        signupBtn.addEventListener("click", () => {
            if (typeof openModal === "function") openModal("register");
        });
    }
}

// Auto-run header rendering
renderHeader();
