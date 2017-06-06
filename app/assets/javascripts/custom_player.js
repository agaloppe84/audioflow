
var timer = 0;
var currentTrackPath = $('#current-track').data("track");
var currentTrackTitle = $('#current-track').data("title");
var currentTrackArtist = $('#current-track').data("artist");
var currentColor = $('#current-track').data("color");
$('#spanslash').html('<i class="fa fa-circle-o-notch fa-spin fa-3x fa-fw smallspin"></i>')
$('#total').html('')


var wavesurfer = Object.create(WaveSurfer);

wavesurfer.init({
  container: document.querySelector('#wave'),
  cursorColor: '#aaa',
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

  clearInterval(timer);
  timer = setInterval(function() {
    $('#current').text(formatTime(wavesurfer.getCurrentTime()));
  }, 1000);

});

wavesurfer.on('finish', function () {
  $('#siri-container').addClass('hidden');
});




wavesurfer.on('seek', function () {
	$('#current').text(formatTime(wavesurfer.getCurrentTime()));
});



$('#play-button').on('click', function(){
	wavesurfer.play();
  $(this).css("color", currentColor);
  $('#siri-container').removeClass('hidden');
});

$('#pause-button').on('click', function () {
	wavesurfer.playPause();
  $('#play-button').css("color", "white");
  $('#siri-container').addClass('hidden');
});

$('#stop-button').on('click', function(){
	wavesurfer.stop();
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
