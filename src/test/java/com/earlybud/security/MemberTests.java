package com.earlybud.security;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"
})
@Log4j
public class MemberTests {
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;
	
	@Setter(onMethod_ = @Autowired)
	private DataSource ds;
	/*
	@Test
	public void testInsertMember() { //유저 백개 만듦
		String sql = "insert into member(email, pwd, nickname, joindate) values (?,?,?,?)";
		
		for(int i = 0; i<100; i++) {
			Connection con = null;
			PreparedStatement pstmt = null;
			
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(2, pwencoder.encode("pw"+i));
				
				if(i<80) {
					pstmt.setString(1, "user"+i+"@email.com");
					pstmt.setString(3, "일반사용자"+i);
				}else {
					pstmt.setString(1, "admin"+i+"@email.com");
					pstmt.setString(3, "관리자"+i);
				}
				
				pstmt.executeUpdate();
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if(pstmt != null) pstmt.close();
					if(con != null) con.close();
				}catch(Exception e) {}		
			}			
		}
	}//
	*/
	
	@Test //그 백개에 권한 부여함
	public void testInsertAuth() {
		String sql = "insert into authorities (email, authority) values (?,?)";
		for(int i=0; i<100; i++) {
			Connection con = null;
			PreparedStatement pstmt = null;
			
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				
				if(i<80) {
					pstmt.setString(1, "user"+i+"@email.com");
					pstmt.setString(2, "ROLE_USER");
				}else {
					pstmt.setString(1, "admin"+i+"@email.com");
					pstmt.setString(2, "ROLE_ADMIN");
				}
				
				pstmt.executeUpdate();
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if(pstmt != null) pstmt.close();
					if(con != null) con.close();
				}catch(Exception e) {}		
			}
		}
	}
	
}
