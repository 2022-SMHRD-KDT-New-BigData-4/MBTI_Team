// Get the modal
let modal = document.getElementById('myModal');

// Get the button that opens the modal
let downBtn = document.querySelectorAll(".downBtn")

// Get the <span> element that closes the modal
let closeBtn = document.getElementById("close");

$(document).on('click', '.downBtn', function (e) {
    e.preventDefault();
    $(modal).css('display', 'block');
})

closeBtn.onclick = function () {
    modal.style.display = "none";
}

// 리스트 마우스 오버시
let trHover = document.querySelectorAll(".trHover")

// document.querySelector('.trHover').addEventListener('mouseenter', () => {
//     trHover.style.backgroundColor = "#fff";
// });

// document.querySelector('.trHover').addEventListener('mouseleave', () => {
// 	trHover.style.backgroundColor = "red";
// });

$(document).ready(function() {
	$(".trHover").mouseover(function () {
		// Java Script
//		document.getElementsByClassName("cls").style.backgroundColor;
		
		// $(this).css('background', '#00ff00');
        $(this).css('background', 'rgba(255, 255, 255, 0.1)');
	});
	$(".trHover").mouseout(function () { 
        $(this).css('background', 'rgba(255, 255, 255, 0)');
	});
});	