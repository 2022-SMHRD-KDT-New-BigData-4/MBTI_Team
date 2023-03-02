package MNM.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import MNM.command.Command;

public class LogoutService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		// 로그아웃 하자
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "Main";
	}

}
