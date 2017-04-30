$(document).ready(function () {
  var wrapper = $('.login-wrapper'),
      loginApi = 'login',
      loginButton = document.getElementById('user-login');
  function tryLogin() {
    $.ajax({
      url: loginApi,
      type: 'POST',
      data: {
        username: user,
        password: password
      }
    })
    .done( function( resp ) {

    })
    .fail( function( resp ) {

    });
  }
  if ( loginButton !== null ) {
    loginButton.addEventListener('click', tryLogin);

    var user = wrapper.find('.username').val().trim(),
        password = wrapper.find('.pass').val();
  }
});
