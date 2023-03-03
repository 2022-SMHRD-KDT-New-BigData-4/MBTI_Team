package MNM.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import MNM.command.Command;
import MNM.model.MbtiDTO;
import MNM.model.MemberDAO;
import MNM.model.MemberVO;
import MNM.model.MusicDTO;

public class MyListService implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		MemberVO member= (MemberVO)session.getAttribute("member");
		String id = member.getm_Id();
		


		
		MemberDAO dao = new MemberDAO();
		
		List<MusicDTO> myList_song = dao.getMyList_song(id);
		
		session.setAttribute("myList_song", myList_song);
		System.out.println("마이리스트서비스 : " + myList_song); // o 
		
		
		return "MyListMusic";
	}

}
