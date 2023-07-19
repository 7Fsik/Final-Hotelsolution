document.getElementById("writeBtn").addEventListener("click", function() {
    const root = this.getAttribute("data-root");
    window.location.href = root + "/mail/post";
});