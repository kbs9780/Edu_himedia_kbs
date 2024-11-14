<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<style>
nav.gnb {
	display: flex;
	justify-content: space-around; /* 가로 정렬 */
	align-items: center; /* 세로 정렬 */
	width: 90%; /* 너비를 90%로 설정 */
	padding: 10px 0;
	background-color: #fff; /* 배경 색상 설정 */
	margin: 0 auto; /* 가로로 중앙 정렬 */
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
		<a href="/front/community/index.web" class="menugnb">커뮤니티 메인</a>
		<a href="/front/community/board/list.web?cd_bbs_type=5" class="menugnb">전체글 보기</a>
		<a href="/front/community/board/list.web?cd_bbs_type=6" class="menugnb">인기글 보기</a>
		<a href="/front/community/board/list.web?cd_bbs_type=7" class="menugnb">자유게시판</a>
		<a href="/front/community/board/list.web?cd_bbs_type=8" class="menugnb">QnA</a>
		<a href="/front/community/board/list.web?cd_bbs_type=9" class="menugnb">입양후기</a>
		<a href="/front/community/board/list.web?cd_bbs_type=11" class="menugnb">정보글</a>
		
		<span class="dropdown">
			<div class="write-button" onclick="toggleDropdown()">글쓰기</div>
			<div class="dropdown-content">
				<a href="/front/community/board/writeForm.web?cd_bbs_type=7">게시판 글쓰기</a>
				<a href="/front/community/board/writeForm.web?cd_bbs_type=8">질문하기</a>
			</div>
		</span>
	</span>
</nav>