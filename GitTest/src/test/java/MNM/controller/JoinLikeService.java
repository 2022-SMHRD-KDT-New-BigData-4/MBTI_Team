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
	  
	   // 여기있는 song_seqlst친구를 담아야 할듯한데?
      String[] song_seqlst = request.getParameterValues("like_song");
      String song_seq = Arrays.toString(song_seqlst).replace("{", "").replace("}", "").replace(" ", "");
      MemberDAO dao = new MemberDAO();
      
      // 아이디 불러오기
      HttpSession session = request.getSession();
      MemberVO member = (MemberVO) session.getAttribute("member");
      String id = member.getm_Id();
      
      // 변경부분 -> 인트형으로 변환해서 담아야 한다고 생각합니다.
      int[] numArr = new int[song_seqlst.length];
      for(int i = 0; i< song_seqlst.length; i++) {
    	  numArr[i]=Integer.parseInt(song_seqlst[i]);
    	  MusicDTO dto = new MusicDTO(numArr[i],id);
    	  dao.save_recSong(dto);
      }
      
      List<MusicDTO> song_data = dao.getRec_song(song_seq);
      // 추천 노래들 담긴 곳 : song_data
      
      int [] receive_song_seq = new int[song_data.size()];
      
      
      
      for (int i = 0; i < receive_song_seq.length; i++) {
    	  receive_song_seq[i] = song_data.get(i).getSong_seq();
    	  // System.out.println("가져온 송시퀀스 : " + receive_song_seq[i]);   X3개씩 추천곡
    	  
    	  MusicDTO dto = new MusicDTO(receive_song_seq[i], id);
    	  /* 이부분 주석처리한 이유 음... 이렇게 하면 위시리스트에 기존 하트누른 친구들 X 추천곡 3개씩해서 다른 정보가 담깁니다.
    	  dao.save_recSong(dto);
    	  */
      }
      
      return "JoinSuccess";
   }

}