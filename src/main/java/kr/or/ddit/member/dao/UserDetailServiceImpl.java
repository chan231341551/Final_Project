package kr.or.ddit.member.dao;

import javax.inject.Inject;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.MemberVOWrapper;

@Service("userDetailService")
public class UserDetailServiceImpl implements UserDetailsService{
	@Inject
	private MemberDAO memberDAO;
	@Inject
	private MessageSourceAccessor accessor;
	
	@Override
	public UserDetails loadUserByUsername(String memEmail) throws UsernameNotFoundException {
		MemberVO member = memberDAO.selectMember(memEmail);
		
		LocaleContextHolder.getLocale();
		if(member==null) {
			String exceptionMessage = accessor.getMessage("JdbcDaoImpl.notFound", new Object[] {memEmail});
			throw new UsernameNotFoundException(exceptionMessage);
		}
		UserDetails user = new MemberVOWrapper(member);
		return user;
	}
}
