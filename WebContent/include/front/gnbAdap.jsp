<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<style>
nav.gnb {
	display: flex;
	justify-content: space-around; /* 가로 정렬 */
	align-items: center; /* 세로 정렬 */
	width: 100%;
	padding: 10px 0;
    background-color: #fff; /* 배경 색상 설정 */
}

	button, .write-button {
		display: inline-block;
		padding: 10px 20px;
		background-color: #F9F3EC; 
		color: black; /* 글자색 검정 */
		text-decoration: none; /* 밑줄 제거 */
		border-radius: 5px; /* 둥근 모서리 */
		transition: background-color 0.3s; /* 배경색 전환 효과 */
		cursor: pointer; /* 마우스 포인터 표시 */
	}

	button:hover, .write-button:hover {
		background-color: #f5f5dc; /* 호버 시 색상 변경 */
	}

	.gnb ul {
		list-style-type: none;
		padding: 0;
		margin: 0;
	}
	.gnb li {
		display: inline;
		margin-right: 15px;
	}
	.gnb a {
		text-decoration: none;
		color: #000;
		padding: 15px 20px;
		border-radius: 4px;
		transition: background-color 0.3s;
	}

	.gnb a:hover {
		background-color: #f5f5dc; /* 호버 시 색상 변경 */
	}
	
	/* 드롭다운 스타일 */
	.dropdown {
		position: relative;
		display: inline-block;
	}

	.dropdown-content {
		display: none;
		position: absolute;
		background-color: white;
		box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
		padding: 10px;
		z-index: 1;
		border-radius: 5px;
		width: 250px;
	}

	.dropdown-content a {
		padding: 10px;
		color: black;
		text-decoration: none;
		border: 1px solid #ddd;
		margin: 5px 0;
		border-radius: 4px;
		transition: background-color 0.3s;
	}

	.dropdown-content a:hover {
		background-color: #f5f5dc;
	}

	/* 드롭다운 표시 */
	.dropdown.show .dropdown-content {
		display: flex;
		flex-direction: column;
	}
</style>
<script>
	function toggleDropdown() {
		var dropdown = document.querySelector('.dropdown');
		dropdown.classList.toggle('show');
	}

	window.onclick = function(event) {
		if (!event.target.matches('.write-button')) {
			var dropdowns = document.getElementsByClassName('dropdown');
			for (var i = 0; i < dropdowns.length; i++) {
				var openDropdown = dropdowns[i];
				if (openDropdown.classList.contains('show')) {
					openDropdown.classList.remove('show');
				}
			}
		}
	}
</script>

<nav class="gnb">
	<span>
		<a href="/front/adap/about.web" class="menugnb">입양안내</a>
		<a href="/front/adap/list.web" class="menugnb">입양공고 보기</a>
		
	</span>
</nav>