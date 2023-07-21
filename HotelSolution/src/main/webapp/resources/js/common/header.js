// Function to show received mails and hide others
function showReceivedMails() {
    hideAllMailCategories();
    document.querySelector('.received-mails').style.display = 'block';
}

// Function to show unread mails and hide others
function showUnreadMails() {
    hideAllMailCategories();
    document.querySelector('.unread-mails').style.display = 'block';
}

// Function to show sent mails and hide others
function showSentMails() {
    hideAllMailCategories();
    document.querySelector('.sent-mails').style.display = 'block';
}

// Helper function to hide all mail categories
function hideAllMailCategories() {
    document.querySelector('.received-mails').style.display = 'none';
    document.querySelector('.unread-mails').style.display = 'none';
    document.querySelector('.sent-mails').style.display = 'none';
}