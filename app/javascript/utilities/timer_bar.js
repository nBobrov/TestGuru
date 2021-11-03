document.addEventListener('turbolinks:load', function () {
    var timerBar = document.querySelector('.timer-bar')

    if (timerBar) setInterval( () => updateTimerBar(timerBar), 1000)
})

function updateTimerBar(timerBar) {

    var endTimeMs = timerBar.dataset.endTime
    var currentTimeMs = new Date().getTime()

    var leftTimeMs = endTimeMs - currentTimeMs

    if (leftTimeMs > 0) {
        var leftTime = new Date(leftTimeMs)
        var minutes = leftTime.getMinutes()
        var seconds = ( leftTime.getSeconds() > 9 ? leftTime.getSeconds() : '0' + leftTime.getSeconds() )
        timerBar.textContent  = minutes + ':' + seconds
    } else {
        clearInterval(this.interval)
        $('#form-test-passages').submit()
    }

}