document.addEventListener('turbolinks:load', function () {
    var passwords = document.querySelectorAll('input[type="password"]')
    if (passwords) {
        for (var i = 0 ; i < passwords.length; i++) {
            passwords[i].addEventListener('input', checkPassword)
        }
    }
})

function checkPassword() {

    var password = document.getElementById('user_password')
    var password_confirmation = document.getElementById('user_password_confirmation')

    if (password_confirmation.value == '') {
        password.classList.remove('is-valid', 'is-invalid')
        return
    }

    if (password.value != password_confirmation.value) {
        password.classList.remove('is-valid')
        password.classList.add('is-invalid')
    }
    else
    {
        password.classList.remove('is-invalid')
        password.classList.add('is-valid')
    }

}
