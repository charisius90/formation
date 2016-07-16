package java;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Controller extends HttpServlet{
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("called!!");
		String cmd = req.getParameter("cmd");
		if(cmd.equals("target")){
			List<MemberDTO> members = new ArrayList<>();
			for(int i=0; i<10; i++){
				members.add(new MemberDTO("name"+i, null, null, false, false));
			}
			
			HttpSession session = req.getSession();
			session.setAttribute("members", members);
		}
	}

}
