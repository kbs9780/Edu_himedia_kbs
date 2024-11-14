/**
 * @author rkdcodbs77@naver.com
 * @since 2024-10-24
 *
 * <p>DESCRIPTION: 커뮤니티 상세보기 관련 function
 * <p>IMPORTANT:</p>
 */

//대댓글 저장
	function saveReply(seq_comment_parent, depth, seq_bbs) {
		//const seq_mbr = sessionStorage.getItem('SEQ_MBR');
		//console.log("회원번호 가져오셨나요??제출 해주세요"+seq_mbr);
		const content = document.getElementById(`replyContent_${seq_comment_parent}`).value;
		const seq_mbr = document.getElementById("seq_mbr").value;
		//console.log("회원번호 가져오셨나요??제출 해주세요"+seq_mbr);
		//const cd_ctg = document.getElementById("cd_ctg").value;
		const commentElement = document.querySelector(`div[data-seq-bbs]`);
		const newDepth = depth + 1; // 부모 댓글의 depth에 1을 추가
		if (!content.trim()) {
			alert('답글 내용을 입력해 주세요.');
			return;
		}

		fetch(`/front/comment/saveReply.json`, {
			method: 'POST',
			headers: { 
				'Content-Type': 'application/json; charset=UTF-8' 
			},
			body: JSON.stringify({ 
				seq_bbs: seq_bbs,
				seq_comment_parent: seq_comment_parent, 
				//seq_mbr: seq_mbr,
				content: content, 
				depth: newDepth // 증가된 depth 값 전송
			})
		})
		.then(response => {
			if (!response.ok) throw new Error('오류 발생');
			return response.json();
		})
		.then(data => {
			if (data.error) {
				alert(data.error);
			} else {
				alert('답글이 등록되었습니다.');
				location.reload();// 등록 후 페이지 새로고침
			}
		})
		.catch(error => {
			console.error('Error:', error);
			alert('답글 등록 중 오류가 발생했습니다.');
		});
	}
	
// 대댓글 취소
function cancelReply(seq_comment) {
	const replyForm = document.getElementById(`replyForm_${seq_comment}`);
	replyForm.style.display = "none"; // 폼 숨기기
	document.getElementById(`replyContent_${seq_comment}`).value = ""; // 텍스트 영역 초기화
}	
	

// 대댓글 폼 보여주기
function showReplyForm(seq_comment) {
		document.getElementById(`replyForm_${seq_comment}`).style.display = 'block';
	}

// 댓글 삭제
function deleteComment(seq_comment) {
	//const seq_mbr = sessionStorage.getItem('SEQ_MBR');
	//alert("삭제할 때 회원 일련번호: " + seq_mbr);

	// 삭제 확인 메시지
	if (!confirm('정말로 이 댓글을 삭제하시겠습니까?')) {
		return; 
	}

	fetch(`/front/comment/delete.json`, {
		method: 'POST',
		headers: { 'Content-Type': 'application/json; charset=UTF-8' 
		},
		body: JSON.stringify({ seq_comment: seq_comment})
	})
	.then(response => {
		if (!response.ok) {
			throw new Error('오류 발생');
		}
		return response.json();
	})
	.then(data => {
		if (data.error) {
			alert(data.error); // 서버에서 에러 메시지가 있는 경우 표시
		} else {
			alert('댓글이 삭제되었습니다.'); // 성공 메시지
		location.reload(); // 삭제 후 페이지 새로고침
		}
	})
	.catch((error) => {
		console.error('Error:', error); // 오류 메시지 출력
		alert('댓글 삭제 중 오류가 발생했습니다.'); // 사용자에게 오류 알림
	});
}


// 댓글 수정
function editComment(seq_comment) {
	const seq_mbr = sessionStorage.getItem('SEQ_MBR');
	//alert("수정할 때 회원 일련번호: " + seq_mbr);
	const content = document.getElementById(`editCommentContent_${seq_comment}`).value; // 수정할 댓글 내용 입력

// 댓글 내용 검증
	if (!content.trim()) {
		alert('수정할 댓글 내용을 입력해 주세요.');
		return; 
	}

	fetch(`/front/comment/edit.json`, {
		method: 'POST',
		headers: { 
			'Content-Type': 'application/json; charset=UTF-8' 
		},
		body: JSON.stringify({ seq_comment: seq_comment, seq_mbr: seq_mbr, content: content 
		})
	})
	.then(response => {
		if (!response.ok) {
			throw new Error('오류 발생');
		}
		return response.json();
	})
	.then(data => {
		if (data.error) {
			alert(data.error); // 서버에서 에러 메시지가 있는 경우 표시
		} else {
			alert('댓글이 수정되었습니다'); // 성공 메시지
			location.reload(); // 수정 후 페이지 새로고침
		}
	})
	.catch((error) => {
		console.error('Error:', error); // 오류 메시지 출력
		alert('댓글 수정 중 오류가 발생했습니다.', error); // 사용자에게 오류 알림
	});
}
//댓글 수정 폼 보여주기
function showEditForm(seq_comment) {
	const editArea = document.getElementById(`commentEditArea_${seq_comment}`);
	const commentContent = document.getElementById(`commentContent_${seq_comment}`).innerText;

// 수정할 댓글 내용을 수정 폼에 채우기
	document.getElementById(`editCommentContent_${seq_comment}`).value = commentContent;

// 수정 영역을 보이게 하고, 댓글 내용 숨김
	editArea.style.display = 'block';
}
// 댓글 등록
		function addComment(seq_bbs) {
			const seq_mbr = sessionStorage.getItem('SEQ_MBR');
			const nickname = sessionStorage.getItem('NICKNAME');// 세션에서 닉네임 가져오기
			const dt_reg = sessionStorage.getItem('DT_REG');
			const content = document.getElementById('commentContent').value; 
			//console.log("닉네임:", sessionStorage.getItem('NICKNAME'));
			//alert("게시글번호 가져옴?=" + seq_bbs);
			//alert("댓글내용 가져옴?=" + content);
			
			fetch('/front/comment/add.json', {
				method: 'POST',
				headers: { 'Content-Type': 'application/json' },
				body: JSON.stringify({ seq_bbs: seq_bbs, seq_mbr: seq_mbr, content: content, nickname: nickname, dt_reg: dt_reg}) // 오타 수정
			})
			.then(response => {
				if (!response.ok) {
					throw new Error('오류발생');
				}
				return response.json();
			})
			.then(data => {
				alert('댓글이 등록되었습니다.'); // 성공 메시지
				location.reload();  // 등록 후 페이지 새로고침
			})
			.catch((error) => {
				console.error('Error:', error); // 오류 메시지 출력
			});
		}
// 좋아요 이미지 클릭 시 이모지 변경
function toggleLike(seq_bbs) {
	const likeElement = document.getElementById('likeElement'); // 이모지를 표시할 요소
	const seq_mbr = sessionStorage.getItem('SEQ_MBR');
	const cd_bbs_type = document.getElementById("cd_bbs_type").value;

	fetch('/front/community/board/like.json', {
		method: 'POST',
		headers: {
			'Content-Type': 'application/json',
		},
		body: JSON.stringify({ seq_bbs: seq_bbs, seq_mbr: seq_mbr, cd_bbs_type: cd_bbs_type })
	})
	.then(response => response.json())
	.then(data => {
// 이모지 상태 토글
		if (likeElement.innerText === '🤍') {
			likeElement.innerText = '❤️'; // 좋아요 추가
		} else {
			likeElement.innerText = '🤍'; // 좋아요 취소
		}

// 좋아요 수 업데이트
		LikeCount.innerText = `${data.like_count}개`;
	})
	.catch((error) => {
		console.error('Error:', error);
	});
}
//좋아요 카운트
	function LikeCount(seq_bbs) {
		fetch('/front/community/board/like_count.json', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json',
			},
			body: JSON.stringify({ seq_bbs: seq_bbs })
		})
		.then(response => response.json())
		.then(data => {
			// 좋아요 수 업데이트
			updateLikeCount(data.newLikeCount);
		})
		.catch((error) => {
			console.error('Error:', error);
		});
	}
//글삭제
	function remove(value) {
		var frmMain = document.getElementById("frmMain");
		
		document.getElementById("cd_bbs_type").value = value;
		frmMain.action="/front/community/board/remove.web";
		frmMain.submit();
	}
	
//수정폼 보여주기
	function modifyForm(value) {
		var frmMain = document.getElementById("frmMain");
		
		document.getElementById("cd_bbs_type").value = value;
		frmMain.action="/front/community/board/modifyForm.web";
		frmMain.submit();
	}

//다운로드
		function download(type, sequence) {
			var frmMain = document.getElementById("frmMain");
			frmMain.type.setAttribute("value", type);
			frmMain.sequence.setAttribute("value", sequence);
			frmMain.action = "/front/community/board/download.web";
			frmMain.target = "frmBlank";
			frmMain.submit();
		}
//상세보기
		function goView(value) {
			var frmMain = document.getElementById("frmMain");
			document.getElementById("seq_bbs").value = value;
			frmMain.action="/front/community/board/view.web";
			frmMain.target = "";
			frmMain.submit();
		}
//목록 가기
		function goList(value) {
			location.href = "/front/community/board/list.web?cd_bbs_type=" + value;
		}
