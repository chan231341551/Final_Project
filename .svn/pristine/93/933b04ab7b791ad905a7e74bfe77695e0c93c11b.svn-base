<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

	<a data-bs-toggle="offcanvas" data-bs-target="#offcanvasScrolling3"
		style="position: fixed; bottom: 100px; right: 30px; width: 50px;"
		aria-controls="offcanvasScrolling3"> <img
		src="${pageContext.request.contextPath }/resources/images/icon/capture.png"
		width="60" height="60" />
	</a>

	<div class="offcanvas offcanvas-end" data-bs-scroll="true"
		data-bs-backdrop="false" tabindex="-1" id="offcanvasScrolling3"
		aria-labelledby="offcanvasScrollingLabel">
		<div class="offcanvas-header">
			<h5 class="offcanvas-title" id="offcanvasScrollingLabel"></h5>
			<button type="button" class="btn-close" data-bs-dismiss="offcanvas"
				aria-label="Close"></button>
		</div>
		<div class="offcanvas-body">
			<div class="card-header">
				<h5 class="card-title">캡처 모드</h5>
			</div>
			<div class="card-body">
				<video id="video" autoplay></video>
				<button id="start">start</button>
				<button id="stop" disabled>stop</button>
				<button id="snapshot" disabled>snapshot</button>	
			</div>
		</div>
	</div>

<script type="text/javascript">
	const videoElement = document.querySelector('#video');
	const startButton = document.querySelector('#start');
	const stopButton = document.querySelector('#stop');
	const snapshotButton = document.querySelector('#snapshot');
	// 화면캡쳐(video)를 시작하는 함수
	async function startCapture() {
	  try {
	    const displayMediaOptions = { audio: false, video: { cursor: 'always' } };
	    const captureStream = await navigator.mediaDevices.getDisplayMedia(displayMediaOptions);
	    videoElement.srcObject = captureStream;
	    startButton.disabled = true;
	    stopButton.disabled = false;
	    snapshotButton.disabled = false;
	  } catch (err) {
	    console.error(err);
	  }
	}
	// 화면캡쳐를 중지하는 함수
	function stopCapture() {
	  const tracks = videoElement.srcObject.getTracks();
	  tracks.forEach((track) => track.stop());
	  videoElement.srcObject = null;
	  startButton.disabled = false;
	  stopButton.disabled = true;
	  snapshotButton.disabled = true;
	}
	// 스냅샷을 찍는 함수
	async function takeSnapshot() {
	  const track = videoElement.srcObject.getVideoTracks()[0];
	  const imageCapture = new ImageCapture(track);
	  const image = await imageCapture.grabFrame();
	  // ...
	}
	startButton.addEventListener('click', startCapture);
	stopButton.addEventListener('click', stopCapture);
	snapshotButton.addEventListener('click', takeSnapshot);
</script>
