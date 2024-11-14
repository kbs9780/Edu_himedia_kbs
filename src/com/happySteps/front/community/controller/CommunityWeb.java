package com.happySteps.front.community.controller;

import java.io.File;
import java.util.Hashtable;
import java.util.LinkedList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.servlet.ModelAndView;

import com.happySteps.common.dto.FileDownloadDto;
import com.happySteps.common.dto.FileDto;
import com.happySteps.common.dto.FileUploadDto;
import com.happySteps.common.file.FileUpload;
import com.happySteps.front.comment.dto.CommentDto;
import com.happySteps.front.comment.service.CommentSrvc;
import com.happySteps.front.common.Common;
import com.happySteps.front.common.component.SessionCmpn;
import com.happySteps.front.common.dto.PagingDto;
import com.happySteps.front.common.dto.PagingListDto;
import com.happySteps.front.community.dto.CommunityDto;
import com.happySteps.front.community.service.CommunitySrvc;


/**
 * @version 1.0.0
 * @author 
 * @since :
 * <p>DESCRIPTION: 커뮤니티(전체글/인기글/자유게시판/Q&A/입양후기/정보글) 컨트롤러</p>
 * <p>IMPORTANT:</p>
 */
@Controller("com.happySteps.front.community.controller.CommunityWeb")
public class CommunityWeb extends Common {
	
	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(CommunityWeb.class);
	
	@Autowired
	private MessageSourceAccessor dynamicProperties;
	
	@Inject
	SessionCmpn sessionCmpn;
	
	@Inject
	CommunitySrvc communitySrvc;
	
	@Inject
	private CommentSrvc commentsrvc;
	
	/**
	 * @param type
	 * @param sequence
	 * @param model
	 * @return ModelAndView
	 * 
	 * @since 
	 * <p>DESCRIPTION: 파일 다운로드</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/community/board/download.web", method = RequestMethod.POST)
	public ModelAndView download(String type, long sequence, Model model) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			CommunityDto communityDto = new CommunityDto();
			
			FileDownloadDto fileDownloadDto = new FileDownloadDto();
			File file = null;
			
			//[TODO-개선: 타입이 정의되어 있지 않을 경우 처리]
			if (type.equals("BbsNotice")) communityDto.setCd_bbs_type(1);
			else if (type.equals("BbsQuestion")) communityDto.setCd_bbs_type(3);
			
			communityDto.setSeq_bbs((int)sequence);
			
			communityDto	= communitySrvc.select(communityDto);
			communityDto.setFile_orig(communityDto.getFile_orig());
			communityDto.setFile_save(communityDto.getFile_save());
			
			String pathBase		= dynamicProperties.getMessage("backoffice.upload.path", "[UNDEFINED]");
			
			file = new File(pathBase + "" + File.separator + communityDto.getFile_save());
			
			fileDownloadDto.setFile_original(communityDto.getFile_orig());
			fileDownloadDto.setFile_size(file.length());
			
			if (file == null || file.exists() == false ) {
				mav.setViewName("redirect:/error.web?code=404");
				
				return mav;
			}
			else {
				model.addAttribute("file", file);
				model.addAttribute("filename", fileDownloadDto.getFile_original());
				model.addAttribute("filesize", fileDownloadDto.getFile_size());
				
				mav.setViewName("fileDownloadView");
			}
			
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".download()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @param communityDto [게시판 빈]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-31
	 * <p>DESCRIPTION: 커뮤니티 글 삭제</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/community/board/remove.web", method = RequestMethod.POST)
	public ModelAndView remove(HttpServletRequest request, HttpServletResponse response, CommunityDto communityDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			communityDto.setUpdater(Integer.parseInt(getSession(request, "SEQ_MBR")));
			
			if (communitySrvc.deleteFlag(communityDto)) {
				request.setAttribute("script"	, "alert('삭제되었습니다.');");
				request.setAttribute("redirect"	, "/front/community/board/list.web?cd_bbs_type=" + communityDto.getCd_bbs_type());
			}
			else {
				request.setAttribute("script"	, "alert('시스템 관리자에게 문의하세요!');");
				request.setAttribute("redirect"	, "/");
			}
			mav.setViewName("forward:/servlet/result.web");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".remove()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @param communityDto [게시판 빈]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-31
	 * <p>DESCRIPTION: 커뮤니티 글 수정 처리</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/community/board/modifyProc.web", method = RequestMethod.POST)
	public ModelAndView modifyProc(HttpServletRequest request, HttpServletResponse response, CommunityDto communityDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			communityDto.setUpdater(Integer.parseInt(getSession(request, "SEQ_MBR")));
			
			if (communitySrvc.update(communityDto)) {
				request.setAttribute("script"	, "alert('수정되었습니다.');");
				request.setAttribute("redirect"	, "/front/community/board/list.web?cd_bbs_type=" + communityDto.getCd_bbs_type());
			}
			else {
				request.setAttribute("script"	, "alert('시스템 관리자에게 문의하세요!');");
				request.setAttribute("redirect"	, "/");
			}
			mav.setViewName("forward:/servlet/result.web");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".modifyProc()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @param communityDto [게시판 빈]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-31
	 * <p>DESCRIPTION:커뮤니티 수정 폼</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/community/board/modifyForm.web", method = RequestMethod.POST)
	public ModelAndView modifyForm(HttpServletRequest request, HttpServletResponse response, CommunityDto communityDto, PagingDto pagingDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			PagingListDto pagingListDto = communitySrvc.list(pagingDto);
			
			mav.addObject("paging"		, pagingListDto.getPaging());
			mav.addObject("ModifyForm"	, pagingListDto.getModifyForm());
			
			
			CommunityDto _communityDto = communitySrvc.select(communityDto);
			
			mav.addObject("communityDto", _communityDto);
			
			if (communityDto.getCd_bbs_type() == 5) {
				mav.setViewName("front/community/board/all/modifyForm");
			}
			else if (pagingDto.getCd_bbs_type() == 7) {
				mav.setViewName("front/community/board/storyboard/modifyForm");
			}
			else if (pagingDto.getCd_bbs_type() == 8) {
				mav.setViewName("front/community/board/qna/modifyForm");
			}
			else if (pagingDto.getCd_bbs_type() == 9) {
				mav.setViewName("front/community/board/adap/modifyForm");
			}
			else if (pagingDto.getCd_bbs_type() == 11) {
				mav.setViewName("front/community/board/information/modifyForm");
			}
			else {
				request.setAttribute("redirect"	, "/");
				mav.setViewName("forward:/servlet/result.web");
			}
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".modifyForm()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @param communityDto [게시판 빈]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-17
	 * <p>DESCRIPTION: 커뮤니티 글 보기</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	
	@RequestMapping(value = "/front/community/board/view.web", method = RequestMethod.POST)
	public ModelAndView view(HttpServletRequest request, HttpServletResponse response, CommunityDto communityDto, CommentDto commentDto) {

		ModelAndView mav = new ModelAndView("redirect:/error.web");

		try {
			int seq_mbr = Integer.parseInt(getSession(request, "SEQ_MBR"));
			 if ((getSession(request, "SEQ_MBR") == null)) {
				 throw new IllegalArgumentException("사용자 세션 정보가 없습니다.");
			}
			communityDto.setSeq_mbr(seq_mbr);
			mav.addObject("seq_mbr", seq_mbr);

			CommunityDto _communityDto = communitySrvc.select(communityDto);
			mav.addObject("communityDto", _communityDto);
			mav.addObject("cd_bbs_type", communityDto.getCd_bbs_type());

			
			if (communityDto.getCd_bbs_type() == 6) {
				mav.setViewName("front/community/board/popular/view");
				List<CommentDto> commentList = commentsrvc.getComments(communityDto.getSeq_bbs());
				mav.addObject("commentList", commentList);
				_communityDto = communitySrvc.allSelect(communityDto);
				mav.addObject("communityDto", _communityDto);
				mav.setViewName("front/community/board/all/view");

			} else if (communityDto.getCd_bbs_type() == 7) {
				List<CommentDto> commentList = commentsrvc.getComments(communityDto.getSeq_bbs());
				mav.addObject("commentList", commentList);
				mav.setViewName("front/community/board/storyboard/view");

			} else if (communityDto.getCd_bbs_type() == 8) {
				mav.setViewName("front/community/board/qna/view");
				List<CommentDto> commentList = commentsrvc.getComments(communityDto.getSeq_bbs());
				mav.addObject("commentList", commentList);
				if (_communityDto.getSeq_reply() > 0) {
					CommunityDto boardReplyDto = communitySrvc.selectReply(communityDto);
					mav.addObject("boardReplyDto", boardReplyDto);
				}
			} else if (communityDto.getCd_bbs_type() == 9) {
				mav.setViewName("front/community/board/adap/view");
				List<CommentDto> commentList = commentsrvc.getComments(communityDto.getSeq_bbs());
				mav.addObject("commentList", commentList);

			} else if (communityDto.getCd_bbs_type() == 11) {
				mav.setViewName("front/community/board/information/view");
				List<CommentDto> commentList = commentsrvc.getComments(communityDto.getSeq_bbs());
				mav.addObject("commentList", commentList);

			} else if (communityDto.getCd_bbs_type() == 5) {
				_communityDto = communitySrvc.allSelect(communityDto);
				mav.addObject("communityDto", _communityDto);
				mav.setViewName("front/community/board/all/view");

				List<CommentDto> commentList = commentsrvc.getComments(communityDto.getSeq_bbs());
				mav.addObject("commentList", commentList);

			} else {
				request.setAttribute("redirect", "/");
				mav.setViewName("forward:/servlet/result.web");
			}
		} catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".view()] " + e.getMessage(), e);
		}

		return mav;
	}

	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @param communityDto [게시판 빈]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-13
	 * <p>DESCRIPTION: 커뮤니티 목록</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/community/board/list.web")
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response, PagingDto pagingDto, CommunityDto communityDto) {
		ModelAndView mav = new ModelAndView("redirect:/error.web");

		try {
			if (pagingDto.getCd_bbs_type() == 5 && !sessionCmpn.isSession(request)) {
				request.setAttribute("redirect", "/front/login/loginForm.web?url=/front/community/board/list.web");
				mav.setViewName("forward:/servlet/result.web");
			} else {
				// 5번 글일 때 allList 호출
				if (pagingDto.getCd_bbs_type() == 5 ) {
					pagingDto.setRegister(Integer.parseInt(getSession(request, "SEQ_MBR")));
					PagingListDto pagingListDto = communitySrvc.allList(pagingDto);
					
					mav.addObject("paging", pagingListDto.getPaging());
					mav.addObject("list", pagingListDto.getList());
					mav.setViewName("front/community/board/all/list");
				} else {
					// 다른 cd_bbs_type에 대한 처리
					PagingListDto pagingListDto = communitySrvc.list(pagingDto);
					mav.addObject("paging", pagingListDto.getPaging());
					mav.addObject("list", pagingListDto.getList());

					if (pagingDto.getCd_bbs_type() == 6) {
						
						pagingDto.setRegister(Integer.parseInt(getSession(request, "SEQ_MBR")));
						PagingListDto pagingListDto1 = communitySrvc.popular_allList(pagingDto);
						
						mav.addObject("paging", pagingListDto1.getPaging());
						mav.addObject("list", pagingListDto1.getList());
						mav.setViewName("front/community/board/popular/list");
					} else if (pagingDto.getCd_bbs_type() == 7) {
						mav.setViewName("front/community/board/storyboard/list");
					} else if (pagingDto.getCd_bbs_type() == 8) {
						mav.setViewName("front/community/board/qna/list");
					} else if (pagingDto.getCd_bbs_type() == 9) {
						mav.setViewName("front/community/board/adap/list");
					} else if (pagingDto.getCd_bbs_type() == 11) {
						mav.setViewName("front/community/board/information/list");
					} else {
						request.setAttribute("redirect", "/");
						mav.setViewName("forward:/servlet/result.web");
					}
				}
			}
		} catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".list()] " + e.getMessage(), e);
		} finally {
			
		}
		return mav;
	}

	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-13
	 * <p>DESCRIPTION: 커뮤니티 쓰기 처리</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@SuppressWarnings({ "rawtypes", "unused", "unchecked" })
	@RequestMapping(value = "/front/community/board/writeProc.web", method = RequestMethod.POST)
	public ModelAndView writeProc(HttpServletRequest request, HttpServletResponse response, CommunityDto communityDto, FileUploadDto fileUploadDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		String message	= "";
		
		try {
			// 글을 쓸 때 세션에서 seq_mbr값을 체크
			communityDto.setRegister(Integer.parseInt(getSession(request, "SEQ_MBR")));
			//커뮤니티 게시판의 cd_ctg값은 8이기 때문에 모든 커뮤니티 게시판의 cd_ctg값이 8로 지정되도록 함
			communityDto.setCd_ctg(8);
			//register = seq_mbr 이기 때문에 관련 코드로 회원일련번호를 설정함
			communityDto.setSeq_mbr(communityDto.getRegister());
			String nickname = getSession(request, "NICKNAME");
			logger.debug("NICKNAME = " + nickname);
			
			communityDto.setNickname(nickname);
			
			//닉네임이 없으면 에러 처리
			if(nickname == null) {
				logger.error("없니 닉네임="+nickname);
				request.setAttribute("script", "alert('닉네임이 없습니다. 로그인 후 다시 시도해 주세요.');");
				request.setAttribute("redirect", "/front/login/loginForm.web"); 
				
				mav.setViewName("forward:/servlet/result.web");
				return mav;
				}

			// cd_bbs_type을 조건에 따라 설정(예: 특정 요청 파라미터에 따라 설정)
			String cd_bbs_type  = request.getParameter("cd_bbs_type");
			if (cd_bbs_type == null || (!cd_bbs_type.equals("7") && 
									 !cd_bbs_type.equals("8") && 
									 !cd_bbs_type.equals("9") && 
									 !cd_bbs_type.equals("11"))) {
				request.setAttribute("script", "alert('잘못된 요청입니다.');");
				request.setAttribute("redirect", "/front/community/index.web");
				mav.setViewName("forward:/servlet/result.web");
				return mav;
				}

			// **************************
			// For Board File
			// **************************
			String pathBase		= dynamicProperties.getMessage("backoffice.upload.path", "[UNDEFINED]") + "/bbs/";
			String maxSize		= dynamicProperties.getMessage("backoffice.upload.file.max10MB"			, "[UNDEFINED]");
			String allowedExt	= dynamicProperties.getMessage("backoffice.upload.file.extension.doc"	, "[UNDEFINED]");
			
			int countFile = 0;
			if (null != fileUploadDto.getFiles()) countFile = fileUploadDto.getFiles().size();
			
			FileDto[] fileDto = new FileDto[countFile];
			LinkedList<Object> uploadResult = FileUpload.upload(fileUploadDto, pathBase, maxSize, allowedExt, countFile);
			
			message	= (String)((Hashtable)uploadResult.getLast()).get("resultID");
			
			if (message.equals("success")) {
				
				Hashtable<String, String> hashtable	= (Hashtable<String, String>)uploadResult.getLast();
				
				String fileNameSrc	= "";
				String fileNameSve	= "";
				String fileSize		= "";
				long totalSize		= 0;
				
				logger.debug("countFile=" + countFile);
				for (int loop = 0; loop < countFile; loop++) {
					fileNameSrc		= (String)hashtable.get("files[" + loop + "]_fileSrcName");
					fileNameSve		= (String)hashtable.get("files[" + loop + "]_fileSveNameRelative");
					fileSize		= (String)hashtable.get("files[" + loop + "]_fileSveSize");
					if (fileSize == null || fileSize == "") fileSize = "0";
					
					fileDto[loop] = new FileDto();
					fileDto[loop].setFileNameOriginal(fileNameSrc);
					fileDto[loop].setFileNameSave(fileNameSve);
					fileDto[loop].setFileSize((Long.parseLong(fileSize)));
					logger.debug("fileNameSrc=" + fileNameSrc);
					logger.debug("fileNameSve=" + fileNameSve);
					logger.debug("fileSize=" + fileSize);
					
					totalSize += Long.parseLong(fileSize);
				}
				
				/*
				if (countFile >=2 ) {
					boardSrvc.insert(boardDto, boardFileDto);
				}
				else {
					boardSrvc.insert(boardDto);
				}
				*/
				
				communityDto.setFile_orig(fileNameSrc);
				communityDto.setFile_save("bbs\\" + fileNameSve);
				/*
				if (communitySrvc.insert(communityDto)) {
					// GET에서 POST로 변경
					String[] arrName = new String[1];
					String[] arrValue = new String[1];
					
					arrName[0] = "cd_bbs_type";
					arrValue[0] = "7";
					
					request.setAttribute("script"	, "alert('등록되었습니다.');");
					//request.setAttribute("post"		, "/front/community/board/list.web");
					request.setAttribute("name"		, arrName);
					request.setAttribute("value"	, arrValue);
					
					 request.setAttribute("script"	, "alert('등록되었습니다.');");
					 request.setAttribute("redirect"	, "/front/community/board/list.web?cd_bbs_type=" + communityDto.getCd_bbs_type());
				}*/
				if (communitySrvc.insert(communityDto)) {
					logger.debug("닉네임="+nickname);
					request.setAttribute("script"	, "alert('등록되었습니다.');");
					request.setAttribute("redirect", "/front/community/board/list.web?cd_bbs_type=" + communityDto.getCd_bbs_type());
				}
				else {
					request.setAttribute("script"	, "alert('시스템 관리자에게 문의하세요!');");
					request.setAttribute("redirect"	, "/");
				}
			}
			else {
				request.setAttribute("script"	, "alert('" + message + "');");
				request.setAttribute("redirect"	, "/");
			}
			
			
			mav.setViewName("forward:/servlet/result.web");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".writeProc()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @param communityDto [게시판 빈]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-11
	 * <p>DESCRIPTION: 커뮤니티 쓰기 폼</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/community/board/writeForm.web")
	public ModelAndView writeForm(HttpServletRequest request, HttpServletResponse response,CommunityDto communityDto, PagingDto pagingDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			PagingListDto pagingListDto = communitySrvc.list(pagingDto);
			
			mav.addObject("paging"	, pagingListDto.getPaging());
			mav.addObject("WriteForm"	, pagingListDto.getWriteForm());
			
			if (communityDto.getCd_bbs_type() == 7) {
				mav.setViewName("front/community/board/storyboard/writeForm");
			}
			else if (pagingDto.getCd_bbs_type() == 8) {
				mav.setViewName("front/community/board/qna/writeForm");
			}
			else {
				request.setAttribute("redirect"	, "/");
				mav.setViewName("forward:/servlet/result.web");
			}
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".writeForm()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	/*
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-08
	 * <p>DESCRIPTION:커뮤니티 메인 인덱스 연결</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/community/index.web")
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			mav.setViewName("front/community/index");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".index()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
}