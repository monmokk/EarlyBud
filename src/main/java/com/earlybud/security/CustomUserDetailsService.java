package com.earlybud.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.earlybud.member.dao.MemberDAO;
import com.earlybud.model.Member;
import com.earlybud.security.model.EarlybudUser;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class CustomUserDetailsService implements UserDetailsService {

	/* (non-Javadoc)
	 * @see org.springframework.security.core.userdetails.UserDetailsService#loadUserByUsername(java.lang.String)
	 */
	@Setter(onMethod_ = { @Autowired })
	private MemberDAO dao;
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		log.warn("Load User By email : "+email); //email == userid
		
		Member member = dao.read(email);
		log.warn("queried by member mapper: "+member);
		return member == null? null: new EarlybudUser(member);
	}
	public int login_check(Member member) {
		System.out.println("로그인 서비스"+member);
		return dao.login_check(member);
	}
	public Member readM(String email) {
		System.out.println("여기는 커스텀 유저");
		return dao.readM(email);
	}
	public int save(Member member) {
		member.setPwd(passwordEncoder.encode(member.getPwd()));
		return dao.save(member);
	}
  public int update(Member member) {
		member.setPwd(passwordEncoder.encode(member.getPwd()));
		return dao.update(member);
	}
  public Member userDetail(String email) {
	  return dao.read(email);
  }
  public int updatePwd(Member member) {
		member.setPwd(passwordEncoder.encode(member.getPwd()));
		return dao.updatePwd(member);
	}
  
}
