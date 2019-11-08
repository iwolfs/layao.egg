(function() {
  const layao = {};
  function logout() {
    cookie.remove('authorization', {path: '/'});
    location.href = '/admin/signin';
  }

  layao.logout = logout;
  window.layao = layao;
})();