var siriWave = new SiriWave({
    container: document.getElementById('siri-container'),
    width: 60,
    height: 20,
    speed: 0.04,
    color: '#fff',
    frequency: 2.60,
    autostart: false,
    amplitudeInterpolationSpeed: 0.05,
    style: 'default'
});


var timer = 0;
var currentTrackPath = $('#current-track').data("track");
var currentTrackTitle = $('#current-track').data("title");
var currentTrackArtist = $('#current-track').data("artist");
var currentColor = $('#current-track').data("color");
$('#spanslash').html('<div class="ball-container"><div class="ball"></div><div class="ball"></div><div class="ball"></div><div class="ball"></div><div class="ball"></div><div class="ball"></div><div class="ball"></div></div>');
$('#total').html('');


var wavesurfer = Object.create(WaveSurfer);

wavesurfer.init({
  container: document.querySelector('#wave'),
  cursorColor: 'transparent',
  cursorWidth: 1,
  height: 80,
  waveColor: 'rgba(255,255,255,0.9)',
  progressColor: currentColor
});


wavesurfer.load(currentTrackPath);
// An event handler for when a track is loaded and ready to play.
wavesurfer.on('ready', function () {

  var duration = wavesurfer.getDuration();
  $('#current').text('0:00');
  $('#total').text(formatTime(duration));
  $('#spanslash').text('/')
  $(".player-control").removeClass('hidden');
  $('.second-bar-relative').removeClass('hidden');
  $('#track-desc').removeClass('hidden');


  clearInterval(timer);
  timer = setInterval(function() {
    $('#current').text(formatTime(wavesurfer.getCurrentTime()));
    $('#little-timer').text(formatTime(wavesurfer.getCurrentTime()));
    var amp = Math.floor(Math.random() * 2) + 0.5
    var amp2 = Math.floor(Math.random() * 0.5) + 0.1
    siriWave.setAmplitude(amp);
    siriWave.setSpeed(amp2);
  }, 1000);

});

wavesurfer.on('finish', function () {
  siriWave.stop();
});




wavesurfer.on('seek', function () {
	$('#current').text(formatTime(wavesurfer.getCurrentTime()));
});



$('#play-button').on('click', function(){
	wavesurfer.play();
  $(this).css("color", currentColor);
  siriWave.start();
  siriWave.setSpeed(0.04);
});

$('#pause-button').on('click', function () {
	wavesurfer.playPause();
  $('#play-button').css("color", "white");
  siriWave.stop();
});

$('#stop-button').on('click', function(){
	wavesurfer.stop();
});

$('#toggle-volume').on('click', function(){
  $(this).toggleClass('fa-volume-up');
  $(this).toggleClass('fa-volume-off');
  wavesurfer.toggleMute();
});


// Format time in minutes:seconds
function formatTime(time){
	time = Math.round(time);

	var minutes = Math.floor(time / 60),
		seconds = time - minutes * 60;

	seconds = seconds < 10 ? '0' + seconds : seconds;

	return minutes + ":" + seconds;
}


// Wavesurfer responsiveness
$(window).on('resize', function(){
	if($('#wave').is(":visible")) {
		wavesurfer.drawer.containerWidth = wavesurfer.drawer.container.clientWidth;
		wavesurfer.drawBuffer();
	}
});
