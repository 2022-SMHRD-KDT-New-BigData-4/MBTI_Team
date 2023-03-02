package MNM.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import MNM.command.Command;
import MNM.model.MemberDAO;

public class JoinLikeService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		String[] song_seq1 = request.getParameterValues("song_seqlst");
		System.out.println("송시퀀스 길이 : "+song_seq1.length); // o
		
		// 바뀐부분!
		System.out.println("song_length:"+song_seq1.length); // o
		
		int[] song_seq = new int[song_seq1.length];
		
		for(int i =0; i<song_seq1.length; i++) {
			song_seq[i]= Integer.parseInt(song_seq1[i]);
			System.out.println(song_seq[i]);
		}
		
		System.out.println("song_seq : " + song_seq);
		
//		MemberDAO dao = new MemberDAO();
//		for (int i = 0; i < song_seq.length; i++) {
//			// song_seq=>song_seq1 로 변환
//			System.out.println(song_seq[i]);
//			// System.out.println(song_seq);
//			dao.getRec_song(song_seq);
//			
//			
//
//			}
		
		//System.out.println(song_seq[0]);
		

		
		
		
		
		
		
		return "GoJoinSuccess.do";
	}

}
