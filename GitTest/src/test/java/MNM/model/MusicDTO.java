package MNM.model;

public class MusicDTO {
	
	private String genre_1;
	private String genre_2;
	private String genre_3;

	private int song_seq;
	private String song_genre;
	private String song_name;
	private String singer;
	private String album_src;
	private String video_src;
	private String m_Id;
	
	public MusicDTO() {
		
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




	public MusicDTO(int receive_song_seq, String id) {
		this.song_seq = receive_song_seq;
		this.m_Id = id;
	
	}


	public int getSong_seq() {
		return song_seq;
	}
	public void setSong_seq(int song_seq) {
		this.song_seq = song_seq;
	}
	public String getSong_genre() {
		return song_genre;
	}
	public void setSong_genre(String song_genre) {
		this.song_genre = song_genre;
	}
	public String getSong_name() {
		return song_name;
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
	public String getAlbum_src() {
		return album_src;
	}
	public void setAlbum_src(String album_src) {
		this.album_src = album_src;
	}
	public String getVideo_src() {
		return video_src;
	}
	public void setVideo_src(String video_src) {
		this.video_src = video_src;
	}
	public String getM_Id() {
		return m_Id;
	}
	public void setM_Id(String m_Id) {
		this.m_Id = m_Id;
	}
	
	
	
	
	
}
