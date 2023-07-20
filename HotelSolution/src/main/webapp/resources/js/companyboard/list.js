document.getElementById("writeBtn").addEventListener("click", function() {
    var root = this.getAttribute("data-root");
    window.location.href = root + "/board/post";
});