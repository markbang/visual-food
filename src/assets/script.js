$(document).ready(function() {
    $('#loading-container').show();
    setTimeout(function() {
        $('#loading-container').hide();
        $('#app').show();
    }, 1000);
});
