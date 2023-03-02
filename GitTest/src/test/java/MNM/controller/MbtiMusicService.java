package MNM.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import MNM.command.Command;
import MNM.model.MbtiDTO;
import MNM.model.MemberDAO;

public class MbtiMusicService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		// 여기서 istj 박스를 누르면 MbtiDTO 객체로 istj 관련 데이터 받기
		
		String m_mbti = (String)request.getParameter("mbti");
		// System.out.println(mbti);
		
		// mbti 관련 데이터 데이터베이스에서 불러오는 메소드
		MemberDAO dao = new MemberDAO();
		MbtiDTO mbti_data = dao.getMbti_data(m_mbti);
			
		// mbti 관련 데이터 보내기
		request.setAttribute("mbti_data", mbti_data);

		return "MbtiMusicList";
	}
}
