package MNM.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import MNM.database.SqlSessionManager;

public class MemberDAO {

	// 작업을 진행할 수 있는 Connection 생성 -> 전역변수
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getFactory();

	MemberVO result = null;

// 1. 회원가입 메소드
	public int join(MemberVO vo) {

		// 1. connection 빌려오기
		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		int cnt = 0;
		try {
			// 2. SQL 문장 실행
			cnt = sqlSession.insert("join", vo);

		} finally {
			// 3. 문 닫기
			sqlSession.close();
		}
		// 4. return
		return cnt;

	}

// 2. 로그인 메소드

	public MemberVO login(MemberVO vo) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		try {
			result = sqlSession.selectOne("login", vo);
		} finally {
			sqlSession.close();
		}
		return result;
	}

// 3. 로그인 성공 시, mbti 앨범 선택시 메인페이지에 mbti 데이터 불러오기 위한 메소드
	public MbtiDTO getMbti_data(String m_mbti) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		MbtiDTO mbti_data = null;
		try {
			mbti_data = sqlSession.selectOne("getMbti_data", m_mbti);
		} finally {
			sqlSession.close();
		}
		return mbti_data;
	}

// 4. 장르 가져오는 메소드
	public List<MbtiDTO> getSong_genre(String mMbti) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		List<MbtiDTO> song_genre = null;
		try {
			song_genre = sqlSession.selectList("getSong_random", mMbti);
		} finally {
			sqlSession.close();
		}

		return song_genre;

	}

// 5. 장르 데이터베이스에 보내고 랜덤 노래리스트 뽑는 메소드
	public List<MbtiDTO> getSong_data(String genre_arr) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		List<MbtiDTO> song_data = null;
		try {
			song_data = sqlSession.selectList("getSong_data", genre_arr);
		} finally {
			sqlSession.close();
		}

		return song_data;
	}

	
// 6. 로그인 시 노래 가져오는 메소드
	public List<MbtiDTO> getSong_data() {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		List<MbtiDTO> song_data = null;
		try {
			song_data = sqlSession.selectList("getSong_data");
		} finally {
			sqlSession.close();
		}

		return song_data;
	}


	public void getRec_song(int[] song_seq) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		Map<String, Object> songSeq_list = new HashMap<>();
		songSeq_list.put("song_seq", song_seq);
		
		List<MbtiDTO> song_data = null;
		try {
			song_data = sqlSession.selectList("getRec_data", song_seq);
			System.out.println("rec : " + song_data);
		} finally {
			sqlSession.close();
		}

		//return song_data;
	}

}
