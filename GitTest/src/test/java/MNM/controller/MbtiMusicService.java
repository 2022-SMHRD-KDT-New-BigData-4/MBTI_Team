package MNM.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import MNM.command.Command;
import MNM.model.MbtiDTO;
import MNM.model.MemberDAO;
import MNM.model.MusicDTO;

public class MbtiMusicService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		// 여기서 istj 박스를 누르면 MbtiDTO 객체로 istj 관련 데이터 받기

		String mMbti = (String) request.getParameter("mbti");
		// System.out.println(mbti);

		// mbti 관련 데이터 데이터베이스에서 불러오는 메소드
		MemberDAO dao = new MemberDAO();
		MbtiDTO mbti_data = dao.getMbti_data(mMbti);

		// mbti 관련 데이터 보내기
		request.setAttribute("mbti_data", mbti_data);

		
		// mbti 관련 장르 가져오기
		List<MusicDTO> song_genre = dao.getSong_genre(mMbti);
		String genre_1 = song_genre.get(0).getGenre_1();
		String genre_2 = song_genre.get(0).getGenre_2();
		String genre_3 = song_genre.get(0).getGenre_3();
		
		String[] genre_arr = { genre_1, genre_2, genre_3 };

		List<MbtiDTO> mbti_songlst = new ArrayList<MbtiDTO>();
		for (int i = 0; i < 3; i++) {
			// 장르 기반 랜덤 노래리스트 데이터 가져와 리스트에 추가
			mbti_songlst.addAll(dao.getSong_data(genre_arr[i]));
			
			HttpSession session = request.getSession();
			session.setAttribute("mbti_songlst", mbti_songlst);
			// System.out.println("송데이터 : " + mbti_songlst);
		}

		return "MbtiMusicList";
	}
}
