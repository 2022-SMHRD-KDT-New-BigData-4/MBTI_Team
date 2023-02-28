package MNM.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import MNM.command.Command;
import MNM.model.MemberDAO;

public class JoinLikeService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		String[] song_seqlst = request.getParameterValues("song_seqlst");
		
		for (int i = 0; i < song_seqlst.length; i++) {
			System.out.println(song_seqlst[i]);
			HashMap<String, String[]> hashmap = new HashMap<String, String[]>();
			hashmap.put("song_seq", song_seqlst);
		}

		MemberDAO dao = new MemberDAO();
		//dao.getRec_song(song_namelst);
		
		
		
		
		
		return "GoJoinSuccess.do";
	}

}
