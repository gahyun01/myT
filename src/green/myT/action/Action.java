package green.myT.action;

import javax.servlet.http.*;

import green.myT.dto.ActionForward;

public interface Action {
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception;
}
