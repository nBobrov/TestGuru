document.addEventListener('turbolinks:load', function () {
    var progressBar = document.querySelector('.progress-bar')

    if (progressBar) updateProgressBar(progressBar)
})

function updateProgressBar(progressBar) {
    var numberCurrentQuestion = progressBar.dataset.numberCurrentQuestion
    var questionCount = progressBar.dataset.questionCount

    var persent = Math.round((numberCurrentQuestion - 1) * 100 / questionCount)

    progressBar.style.width = persent + '%'
    progressBar.textContent = persent + '%'
}