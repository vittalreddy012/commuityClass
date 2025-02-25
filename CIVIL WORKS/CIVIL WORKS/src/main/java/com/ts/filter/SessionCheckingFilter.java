package com.ts.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter("/SessionCheckingFilter")
public class SessionCheckingFilter implements Filter {


    public SessionCheckingFilter() {
        // TODO Auto-generated constructor stub
    }

	public void destroy() {
		// TODO Auto-generated method stub
	}

	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {

        final HttpServletRequest request = (HttpServletRequest) req;
        final HttpServletResponse response = (HttpServletResponse) res;

        String path = request.getRequestURI();
        int p = path.lastIndexOf("/");
        String action = path.substring(p + 1);
       try {
        	 if (action != null && (action.equalsIgnoreCase("")
            		  || action.equalsIgnoreCase("login")
                      || action.equalsIgnoreCase("logout")
                      || action.equalsIgnoreCase("userLogin")
                    )) {
            	chain.doFilter(request, response);
            } else {   
            	 HttpSession session = request.getSession();
            	if (session.getAttribute("userName") == null) {
            		 session.invalidate();
                    RequestDispatcher rd = request.getRequestDispatcher("sessionExpired");
                    rd.forward(request, response);
                } else {
                	chain.doFilter(request, response);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
}
	
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
