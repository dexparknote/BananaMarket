package com.spring.banana;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.banana.vo.BananaReviewAlarmVO;
import com.banana.vo.BananaShopAlarmVO;
import com.banana.vo.DongneCommentVO;
import com.banana.vo.SessionVO;
import com.enroll.service.DongneCommentServiceImpl;

@Controller
public class DongneCommentController {
	
	@Autowired
	private  DongneCommentServiceImpl dongneCommentService;
	
	/**
	 * 리뷰 alarm
	 */
	@ResponseBody
	@RequestMapping(value="/review_alarm_write.do", method=RequestMethod.GET)
	public String review_alarm_write(BananaReviewAlarmVO vo, HttpSession session, String bid, String brid) {
		SessionVO svo = (SessionVO)session.getAttribute("svo");
		vo.setMid(svo.getMid());
		vo.setBid(bid);
		vo.setBrid(brid);
		System.out.println(svo.getMid()+","+bid+","+brid);
		return dongneCommentService.reviewAlarmWrite(vo);
	}
	
	/**
	 * 동네생활 - 댓글 삭제 처리
	 */
	@RequestMapping(value="/comment_delete_proc.do", method=RequestMethod.GET)
	public String comment_delete_proc(String brid ) {
		return (String)dongneCommentService.delete(brid);
	}
	
	@RequestMapping(value="/subcomment_delete_proc.do", method=RequestMethod.GET)
	public String subcomment_delete_proc(String brid , String bstitle ) throws UnsupportedEncodingException {
		return (String)dongneCommentService.delete1(brid ,bstitle);
	}
	
	
	/**
	 * 동네생활 - 댓글 수정 처리
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value="/comment_update_proc.do", method=RequestMethod.POST)
	public ModelAndView comment_update_proc(DongneCommentVO vo ,String bstitle) throws UnsupportedEncodingException {
		vo.setTitle(bstitle);
		return (ModelAndView)dongneCommentService.update1(vo);
	}
	
	/**
	 * 내 근처 - 댓글 수정 화면
	 * @return
	 */
	@RequestMapping(value="/dongneLifeComment_update.do",method=RequestMethod.GET)
	public ModelAndView dongneLifeComment_update(String brid, String rno ,String bstitle){
		return (ModelAndView)dongneCommentService.getUpdateContent(brid, rno ,bstitle); 
	}
	
	/**
	 * 동네생활 - 댓글 리스트
	 */
	@ResponseBody
	@RequestMapping(value="/comment_list_ajax_proc.do", method=RequestMethod.GET,
					produces="text/plain;charset=UTF-8")
	public String comment_list_ajax_proc(String bid) {
		return dongneCommentService.getCommentListAjaxProc(bid);
	}
	
	/**
	 * 동네생활 - 댓글 작성 처리
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value="/dongneLife_review_write_proc.do", method=RequestMethod.POST)
	public ModelAndView dongneLife_review_write_proc(DongneCommentVO vo, String bid, HttpSession session ,String loc ,String bstitle) throws UnsupportedEncodingException {
		vo.setBid(bid);
		vo.setTitle(bstitle);
		vo.setLoc(loc);
		SessionVO svo = (SessionVO)session.getAttribute("svo");
		vo.setMid(svo.getMid());
		return (ModelAndView)dongneCommentService.insert1(vo);
	}
	
}
