package MNM.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Command {

	// Command 인터페이스의 역할
	// : 각 기능별 구체적인 내용들은 달라지지만, 같은 메소드의 이름(execute)과
	// servlet을 사용하기 위하여 필수적인 매개변수를 정해진 틀로 만들어 사용하는 기능!
	public abstract String execute(HttpServletRequest request, HttpServletResponse response);

	
}
