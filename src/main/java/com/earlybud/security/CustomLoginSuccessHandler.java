package com.earlybud.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.web.bind.annotation.RequestMapping;

import com.earlybud.controller.MemberUploadController;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomLoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler implements AuthenticationSuccessHandler {
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth)
			throws IOException, ServletException {
		HttpSession session = request.getSession();
		if(session!=null) {
			String redirectUrl = (String) session.getAttribute("prevPage");
			 if (redirectUrl != null) {
				 log.warn("Login Success");
				List<String> roleNames = new ArrayList<>();
				String userId = request.getParameter("username");
				auth.getAuthorities().forEach(authority -> {
				roleNames.add(authority.getAuthority());
				});
				log.warn("ROLE NAMES: " + roleNames);
				log.warn("USER NAME: " + userId);
				session.removeAttribute("prevPage");
                if (roleNames.contains("ROLE_ADMIN")) {
        			response.sendRedirect("admin/admin_home");
        			return;
        		}
        		if (roleNames.contains("ROLE_USER")) {
        			getRedirectStrategy().sendRedirect(request, response, redirectUrl);
        			return;
        		}
	        		response.sendRedirect("/");
	            } else {
	                super.onAuthenticationSuccess(request, response, auth);
	            }
		}else {
			super.onAuthenticationSuccess(request, response, auth);
		}
		

		
	}
}
