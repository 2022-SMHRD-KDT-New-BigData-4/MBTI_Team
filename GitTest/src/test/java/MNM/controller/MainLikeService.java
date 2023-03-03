package MNM.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import MNM.command.Command;
import MNM.model.MemberDAO;
import MNM.model.MemberVO;
import MNM.model.MusicDTO;

public class MainLikeService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// 변경사항 삭제시킬부분
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO)session.getAttribute("member");
		String song_seq = request.getParameter("song_seq");
		
		MusicDTO dto = new MusicDTO(Integer.parseInt(song_seq), vo.getm_Id());
		
		MemberDAO dao = new MemberDAO();
		dao.save_recSong(dto);
		
		
		

		
		return null;
	}

}
