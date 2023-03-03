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
   private String GOOD_REL;
   private String GOOD_REL2;
   private String BAD_REL;
   private String BAD_REL2;
   
   
public MbtiDTO() {
	   
   }


public String getGOOD_REL() {
	return GOOD_REL;
}


public void setGOOD_REL(String gOOD_REL) {
	GOOD_REL = gOOD_REL;
}


public String getGOOD_REL2() {
	return GOOD_REL2;
}


public void setGOOD_REL2(String gOOD_REL2) {
	GOOD_REL2 = gOOD_REL2;
}


public String getBAD_REL() {
	return BAD_REL;
}


public void setBAD_REL(String bAD_REL) {
	BAD_REL = bAD_REL;
}


public String getBAD_REL2() {
	return BAD_REL2;
}


public void setBAD_REL2(String bAD_REL2) {
	BAD_REL2 = bAD_REL2;
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