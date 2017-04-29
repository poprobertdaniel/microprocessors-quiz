$(document).ready(function () {
  var wrapper = $('.login-wrapper'),
      loginApi = 'login',
      loginButton = document.getElementById('user-login');
  loginButton.addEventListener('click', tryLogin);

  var user = wrapper.find('.username').val().trim(),
      password = wrapper.find('.pass').val();

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
});
