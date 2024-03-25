package green.myT.dao;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface MapperInterface {
	public String mapping(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException;

}
