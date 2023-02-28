package MNM.model;

import java.sql.Date;

public class MemberVO {

	private String m_Id;
	private String m_Pw;
	private String m_Nick;
	private String m_Gender;
	private String m_Mbti;
	private Date m_Joindate;
	private String m_Type;
	

	// 회원가입 5개 데이터를 받는 생성자
	public MemberVO(String mId, String mPw, String mNick, String mGender, String mMbti) {
		this.m_Id = mId;
		this.m_Pw = mPw;
		this.m_Nick = mNick;
		this.m_Gender = mGender;
		this.m_Mbti = mMbti;
	}
	
	// 로그인 2개 데이터 받는 생성자
	public MemberVO(String mId, String mPw) {
		this.m_Id = mId;
		this.m_Pw = mPw;
	}
	
	public MemberVO(String mId, String mPw, String mNick, String mGender, String mMbti, Date mJoindate, String mType) {
		this.m_Id = mId;
		this.m_Pw = mPw;
		this.m_Nick = mNick;
		this.m_Gender = mGender;
		this.m_Mbti = mMbti;
		this.m_Joindate = mJoindate;
		this.m_Type = mType;
		
	}
	
	// 기본생성자
	public MemberVO() {
		
	}


	// getter, setter 메소드
	public String getm_Id() {
		return m_Id;
	}
	
	public void setm_Id(String m_Id) {
		this.m_Id = m_Id;
	}
	
	public String getm_Pw() {
		return m_Pw;
	}
	
	public void setm_Pw(String m_Pw) {
		this.m_Pw = m_Pw;
	}
	
	public String getm_Nick() {
		return m_Nick;
	}
	
	public void setm_Nick(String m_Nick) {
		this.m_Nick = m_Nick;
	}
	
	public String getm_Gender() {
		return m_Gender;
	}
	
	public void setm_Gender(String m_Gender) {
		this.m_Gender = m_Gender;
	}
	
	public String getm_Mbti() {
		return m_Mbti;
	}
	
	public void setm_Mbti(String m_Mbti) {
		this.m_Mbti = m_Mbti;
	}
	
	public Date getm_Joindate() {
		return m_Joindate;
	}
	
	public void setm_Joindate(Date m_Joindate) {
		this.m_Joindate = m_Joindate;
	}
	
	public String getm_Type() {
		return m_Type;
	}
	
	public void setm_Type(String m_Type) {
		this.m_Type = m_Type;
	}
	

    
	// MemberInfo 모델 복사
	public void CopyData(MemberVO param) {
		this.m_Id = param.getm_Id();
		this.m_Pw = param.getm_Pw();
		this.m_Nick = param.getm_Nick();
		this.m_Gender = param.getm_Gender();
		this.m_Mbti = param.getm_Mbti();
		this.m_Joindate = param.getm_Joindate();
        this.m_Type = param.getm_Type();
	}
}