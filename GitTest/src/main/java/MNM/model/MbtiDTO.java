package MNM.model;

public class MbtiDTO {
   
   // 로그인 시 가져올 데이터베이스에 있는 MBTI_DATA 테이블에 관한 dto입니다
   private String MBTI_IMG;
   private String M_MBTI;
   private String MBTI_REP;
   private String TAG1;
   private String TAG2;
   private String TAG3;
   private String TAG4;
   private String MBTI_LONGEXP;
   private String MBTI_JOB;
   
   private String genre_1;
   private String genre_2;
   private String genre_3;
   private String song_name;
   private String singer;
   private String song_seq;
   
   
   public void song_data(String song_name, String singer, String song_seq) {
		this.song_name = song_name;
		this.singer = singer;
		this.song_seq = song_seq;
	}
   
   public void genre_arr(String genre_1, String genre_2, String genre_3) {
	this.genre_1 = genre_1;
	this.genre_2 = genre_2;
	this.genre_3 = genre_3;
}
   
public MbtiDTO() {
	   
   }
   public MbtiDTO(String genre_1) {
	   genre_1 = this.genre_1; 

   }
   
   
// getter/setter 메소드
   
   public String getSong_name() {
	return song_name;
}

public String getSong_seq() {
	return song_seq;
}

public void setSong_seq(String song_seq) {
	this.song_seq = song_seq;
}

public String getGenre_1() {
	return genre_1;
}


public void setGenre_1(String genre_1) {
	this.genre_1 = genre_1;
}


public String getGenre_2() {
	return genre_2;
}


public void setGenre_2(String genre_2) {
	this.genre_2 = genre_2;
}


public String getGenre_3() {
	return genre_3;
}


public void setGenre_3(String genre_3) {
	this.genre_3 = genre_3;
}


public void setSong_name(String song_name) {
	this.song_name = song_name;
}

public String getSinger() {
	return singer;
}

public void setSinger(String singer) {
	this.singer = singer;
}

public String getMBTI_IMG() {
	return MBTI_IMG;
}
public void setMBTI_IMG(String mBTI_IMG) {
	MBTI_IMG = mBTI_IMG;
}
public String getM_MBTI() {
	return M_MBTI;
}
public void setM_MBTI(String m_MBTI) {
	M_MBTI = m_MBTI;
}
public String getMBTI_REP() {
	return MBTI_REP;
}
public void setMBTI_REP(String mBTI_REP) {
	MBTI_REP = mBTI_REP;
}
public String getTAG1() {
	return TAG1;
}
public void setTAG1(String tAG1) {
	TAG1 = tAG1;
}
public String getTAG2() {
	return TAG2;
}
public void setTAG2(String tAG2) {
	TAG2 = tAG2;
}
public String getTAG3() {
	return TAG3;
}
public void setTAG3(String tAG3) {
	TAG3 = tAG3;
}
public String getTAG4() {
	return TAG4;
}
public void setTAG4(String tAG4) {
	TAG4 = tAG4;
}
public String getMBTI_LONGEXP() {
	return MBTI_LONGEXP;
}
public void setMBTI_LONGEXP(String mBTI_LONGEXP) {
	MBTI_LONGEXP = mBTI_LONGEXP;
}
public String getMBTI_JOB() {
	return MBTI_JOB;
}
public void setMBTI_JOB(String mBTI_JOB) {
	MBTI_JOB = mBTI_JOB;
}

}