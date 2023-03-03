package MNM.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import MNM.command.Command;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// HashMap<Key, Value> - commanmd 방식
	HashMap<String, Command> map = null;

	// 제공하고자 하는 서비스에 대하여 기본 설정이 필요할 때 사용
	public void init(ServletConfig config) throws ServletException {

		// 어떤 요청이 들어왔을 때 해당하는 요청을 수행할 수 있는 클래스의 객체 생성 - command 방식
		map = new HashMap<>();
		map.put("JoinService.do", new JoinService());
		map.put("LoginService.do", new LoginService());
		map.put("MbtiMusicService.do", new MbtiMusicService());
		map.put("LogoutService.do", new LogoutService());
		map.put("JoinLikeService.do", new JoinLikeService());
		map.put("MainLikeService.do", new MainLikeService());
		map.put("MyListService.do", new MyListService());

	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 1. 들어온 요청이 어떤 요청인지 판단
		// getRequestURI() : 요청된 주소값 자체를 가져오는 메소드
		String uri = request.getRequestURI();
		// uri = 요청된 주소(/MBTInMUSIC/*.do)

		// 2. 프로젝트 이름만 분리 → getContextPath()
		String path = request.getContextPath();
		// path = 프로젝트 이름(/MBTInMUSIC)

		// 3. 문자열 잘라내기 → subString()
		String finaluri = uri.substring(path.length() + 1);
		// -> path.length() + 1 -> +1 함으로써 뒤 '/' 빼고 이후부터 자르게하기
		// finaluri = 요청된 서블릿(*.do)

		String finalpath = null;
		// 4-1. Go로 들어오면
		if (finaluri.contains("Go")) {
			// 4-2. 예를 들어 GoMain.do 라면 Main 으로 바꾸기
			finalpath = finaluri.substring(2).replaceAll(".do", "");
		}else {
			// 4-3. 그렇지 않은 경우, 페이지 결과 응답
			Command con = map.get(finaluri);
			finalpath = con.execute(request, response);
		}

		
		if (finalpath == null) {
			// ajax 통신인 경우에는 페이지 이동을 안하겠다! 라는 뜻
		} else if (finalpath.contains("redirect:/")) {
			// redirect 방식
			response.sendRedirect(finalpath.substring(10));
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/" + finalpath + ".jsp");
			rd.forward(request, response);

		}

	}

}
