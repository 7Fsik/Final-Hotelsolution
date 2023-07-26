
document.getElementById("writeBtn2").addEventListener("click", function() {
    const root = this.getAttribute("data-root");
    window.location.href = root + "/board/post";
});

document.addEventListener("DOMContentLoaded", function() {
    // Attach click event to the clickable rows
    const clickableRows = document.querySelectorAll('.clickable-row');
    clickableRows.forEach(row => {
        row.addEventListener('click', function() {
            // Get the 'data-root' attribute value from the clicked row
            const root = this.getAttribute('data-root');
            // Get the 'no' attribute value from the clicked row
            const no = this.getAttribute('data-no');
            // Construct the URL with the 'no' parameter and redirect to it
            window.location.href = root + '/board/detail?no=' + no;
        });
    });
});
