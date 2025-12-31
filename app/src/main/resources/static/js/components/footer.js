function renderFooter() {
    // 1. Access the footer container
    const footer = document.getElementById("footer");

    if (!footer) return;

    // 2. Inject HTML content
    footer.innerHTML = `
        <footer class="footer">
            <div class="footer-content">
                <div class="footer-logo">
                    <img src="../assets/images/logo/logo.png" alt="Clinic Logo" style="height: 50px;">
                    <p>© 2025 Smart Clinic System.<br>All rights reserved.</p>
                </div>

                <div class="footer-links">
                    <div class="footer-column">
                        <h4>Company</h4>
                        <a href="#">About Us</a>
                        <a href="#">Careers</a>
                        <a href="#">Press</a>
                    </div>
                    <div class="footer-column">
                        <h4>Support</h4>
                        <a href="#">My Account</a>
                        <a href="#">Help Center</a>
                        <a href="#">Contact Us</a>
                    </div>
                    <div class="footer-column">
                        <h4>Legal</h4>
                        <a href="#">Terms & Conditions</a>
                        <a href="#">Privacy Policy</a>
                        <a href="#">Licensing</a>
                    </div>
                </div>
            </div>
        </footer>
    `;
}

// 3. Call the function
renderFooter();
