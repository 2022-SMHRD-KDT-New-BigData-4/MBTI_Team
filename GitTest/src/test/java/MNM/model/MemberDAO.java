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
   
// 2. 장르 가져오는 메소드
   public List<MusicDTO> getSong_genre(String mMbti) {
	   
	   SqlSession sqlSession = sqlSessionFactory.openSession(true);
	   
	   List<MusicDTO> song_genre = null;
	   try {
		   song_genre = sqlSession.selectList("getSong_random", mMbti);
	   } finally {
		   sqlSession.close();
	   }
	   
	   return song_genre;
	   
   }
   
// 3. 장르 데이터베이스에 보내고 랜덤 노래리스트 뽑는 메소드
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
   
   
// 4. 랜덤 장르 곡들 가져오는 메소드
   public List<MusicDTO> getRec_song(String song_seq) {
	   SqlSession sqlSession = sqlSessionFactory.openSession(true);
	   
	   System.out.println(song_seq);
	   List<MusicDTO> song_data = null;
	   try {
		   song_data = sqlSession.selectList("getRec_data", song_seq);
	   } finally {
		   sqlSession.close();
	   }
	   
	   return song_data;
   }
   
// 5. 추천된 노래 리스트 데이터베이스에 인서트
   public int save_recSong(MusicDTO dto) {
	   
	   SqlSession sqlSession = sqlSessionFactory.openSession(true);
	   
	   int cnt = 0;
	   try {
		   cnt = sqlSession.insert("save_recSong", dto);
		   // System.out.println("cnt" + cnt);
	   } finally {
		   sqlSession.close();
	   }
	   return cnt;
   }

// 6. 로그인 메소드

   public MemberVO login(MemberVO vo) {

      SqlSession sqlSession = sqlSessionFactory.openSession(true);
      try {
         result = sqlSession.selectOne("login", vo);
      } finally {
         sqlSession.close();
      }
      return result;
   }

// 7. 로그인 성공 시, mbti 앨범 선택시 메인페이지에 mbti 데이터 불러오기 위한 메소드
   public MbtiDTO getMbti_data(String mMbti) {

      SqlSession sqlSession = sqlSessionFactory.openSession(true);

      MbtiDTO mbti_data = null;
      try {
         mbti_data = sqlSession.selectOne("getMbti_data", mMbti);
      } finally {
         sqlSession.close();
      }
      return mbti_data;
   }

public List<MusicDTO> Login_getSong(String id) {
	
	SqlSession sqlSession = sqlSessionFactory.openSession(true);

    List<MusicDTO> music_data = null;
    try {
    	music_data = sqlSession.selectList("login_getSong", id);
    	// System.out.println("가져온 뮤직데이터 : " + music_data);
    } finally {
       sqlSession.close();
    }
    return music_data;
}



}