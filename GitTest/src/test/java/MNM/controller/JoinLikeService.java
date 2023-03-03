package MNM.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.tribes.util.Arrays;

import MNM.command.Command;
import MNM.model.MbtiDTO;
import MNM.model.MemberDAO;
import MNM.model.MusicDTO;
import MNM.model.MemberVO;

public class JoinLikeService implements Command {

   @Override
   public String execute(HttpServletRequest request, HttpServletResponse response) {

      String[] song_seqlst = request.getParameterValues("like_song");
      String song_seq = Arrays.toString(song_seqlst).replace("{", "").replace("}", "").replace(" ", "");

      MemberDAO dao = new MemberDAO();
      List<MusicDTO> song_data = dao.getRec_song(song_seq);
      // 추천 노래들 담긴 곳 : song_data
      
      // 아이디 불러오기
      HttpSession session = request.getSession();
      MemberVO member = (MemberVO) session.getAttribute("member");
      String id = member.getm_Id();
      
      int [] receive_song_seq = new int[song_data.size()];
      
      for (int i = 0; i < receive_song_seq.length; i++) {
    	  receive_song_seq[i] = song_data.get(i).getSong_seq();
    	  // System.out.println("가져온 송시퀀스 : " + receive_song_seq[i]);
    	  
    	  MusicDTO dto = new MusicDTO(receive_song_seq[i], id);
    	  dao.save_recSong(dto);
      }
      
      return "JoinSuccess";
   }

}