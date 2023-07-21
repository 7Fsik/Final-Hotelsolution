document.getElementById("writeBtn2").addEventListener("click", function() {
    var root = this.getAttribute("data-root");
    window.location.href = root + "/board/post";
});