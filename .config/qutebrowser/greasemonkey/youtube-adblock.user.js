setInterval(() => {
    const btn = document.querySelector('.videoAdUiSkipButton,.ytp-ad-skip-button')
    if (btn) {
        btn.click()
    }
    const ad = [...document.querySelectorAll('.ad-showing')][0];
    if (ad) {
        const video = document.querySelector('video')
        video.muted = true;
        video.hidden = true;
        if(video.duration != NaN) {
            video.currentTime = video.duration;
        }
        video.playbackRate = 16;
    }
}, 50)
