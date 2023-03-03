package MNM.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import MNM.command.Command;
import MNM.model.MbtiDTO;
import MNM.model.MemberDAO;
import MNM.model.MemberVO;
import MNM.model.MusicDTO;

public class LoginService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		String mId = request.getParameter("id");
		String mPw = request.getParameter("pw");
		
		MemberVO vo = new MemberVO(mId, mPw);
		MemberDAO dao = new MemberDAO();
		
		MemberVO result = dao.login(vo);
		
		String moveURL = null;
		if(result != null) {
			// 로그인 성공
			// 1. member_info 데이터 session에 정보 저장
			HttpSession session = request.getSession();
			session.setAttribute("member", result);
			
			// 2-1. session 정보에서 mbti 값만 빼서 변수에 담음
			String m_mbti = result.getm_Mbti();
			// 2-2. mbti 관련 데이터 데이터베이스에서 불러오는 메소드
			MbtiDTO mbti_data = dao.getMbti_data(m_mbti);
			// 2-3. mbti 관련 데이터 session에 저장
			session.setAttribute("mbti_data", mbti_data);
			
			// 3-1. 노래리스트 데이터 보내려고 아이디 가져오기
			String id = result.getm_Id();
			List<MusicDTO> music_data = dao.Login_getSong(id);
			// 3-2. 조회한 정보를 request 영역에 담기
			session.setAttribute("music_data", music_data);
			
			// 4. 로그인 메인페이지로 이동
			moveURL = "MainLogin";
		}else {
			// 실패 -> 로그인 화면 유지
			moveURL = "LoginForm";
		}
		return moveURL;
	}
	

}
	
	
	

