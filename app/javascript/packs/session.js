const toggleButton = document.getElementById("toggle")

toggleButton.onclick = function () {
  document.getElementById("box").classList.toggle('rotate'); 
  toggleButton.innerText = toggleButton.innerText === 'Sign up' ? 'Login' : 'Sign up';
}