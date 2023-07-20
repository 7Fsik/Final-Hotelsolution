document.getElementById("mail-write-Btn").addEventListener("click", function() {
    const root = this.getAttribute("data-root");
    window.location.href = root + "/mail/post";
});