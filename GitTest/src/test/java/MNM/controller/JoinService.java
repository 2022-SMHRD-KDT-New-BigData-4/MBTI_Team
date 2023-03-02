package MNM.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import MNM.command.Command;
import MNM.model.MbtiDTO;
import MNM.model.MemberDAO;
import MNM.model.MemberVO;

public class JoinService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		// 0. 한글 인코딩
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		// 1. 데이터 꺼내오기
		String mId = request.getParameter("id");
		String mPw = request.getParameter("pw");
		String mNick = request.getParameter("nickname");
		String mGender = request.getParameter("gender");
		String mMbti = request.getParameter("mbti");

		// 2. 데이터 하나로 묶기
		MemberVO vo = new MemberVO(mId, mPw, mNick, mGender, mMbti);

		// 3. Join DAO 연결
		MemberDAO dao = new MemberDAO();
		int result = dao.join(vo);
		
		// 4-1. 장르 가져오기
		List<MbtiDTO> song_genre = dao.getSong_genre(mMbti);
		String genre_1 = song_genre.get(0).getGenre_1();
		String genre_2 = song_genre.get(0).getGenre_2();
		String genre_3 = song_genre.get(0).getGenre_3();
	
		String [] genre_arr = {genre_1, genre_2, genre_3};
		
		List<MbtiDTO> song_data = new ArrayList<MbtiDTO>();
		for (int i = 0; i < 3; i++) {
			// 5. 장르 기반 랜덤 노래리스트 데이터 가져와 리스트에 추가
			song_data.addAll(dao.getSong_data(genre_arr[i]));
			request.setAttribute("song_data", song_data);
		}
		
		
		// 6. result에 따른 페이지 이동(일단 로그인메인으로)
		String moveURL = null;
		if (result > 0) {
			moveURL = "JoinChoicesong";
			HttpSession session = request.getSession();
			session.setAttribute("nickname", mNick);
			session.setAttribute("MBTI", mMbti);

		} else {
			moveURL = "redirect:/GoMain.do";
		}
		return moveURL;

	}

}
