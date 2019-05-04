package com.earlybud.daoTest;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.earlybud.member.dao.MemberDAO;
import com.earlybud.model.Member;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class MemberDaoTests {
	
	@Setter(onMethod_ = @Autowired)
	private MemberDAO dao;
	
	@Test
	public void testRead() {
		Member m = dao.read("admin90@email.com");
		
		log.info(m);
		
		m.getAuthList().forEach(auth -> log.info(auth));
	}
}
