package com.earlybud.junit;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
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
public class MessageTests {
	@Setter(onMethod_ = @Autowired)
	private DataSource ds;
	
	@Test
	public void testInsertMessage() {
		String sql = "insert into message (message_code,item_code,receiver,sender,content,send_date,read_check) "
				+ "values (MESSAGE_CODE_SEQ.nextval,null,?,?,?,sysdate,0)";
		for(int i=0; i<50; i++) {
			Connection con = null;
			PreparedStatement pstmt = null;
			
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, "admin90@email.com"); //보내는사람이 admin90@email.com
				if(i<50) {
					pstmt.setString(2, "user"+i+"@email.com"); //50명한테 보냄
					pstmt.setString(3, "관리자에게 메세지"+i);
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
