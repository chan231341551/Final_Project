package kr.or.ddit.member.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.exception.UserNotFoundException;
import kr.or.ddit.member.dao.MemberDAO;
import kr.or.ddit.member.mail.MailHandler;
import kr.or.ddit.member.mail.TempKey;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.project.attach.service.AttatchService;
import kr.or.ddit.vo.PagingVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	private AttatchService attService;
	@Inject
	private MemberDAO memberDAO;
	@Resource(name="authenticationManager")
	private AuthenticationManager authenticationManager;
	@Inject
	private PasswordEncoder encoder;
	@Inject
	private JavaMailSender mailSender;
	
	@Override
	public ServiceResult createMember(MemberVO member) throws Exception {
		ServiceResult result = null;
		try {
			retrieveMember(member.getMemEmail());
			result = ServiceResult.PKDUPLICATED;
		}catch (UserNotFoundException e) {
			String encoded = encoder.encode(member.getMemPass());
			member.setMemPass(encoded);
			
			//랜덤 문자열을 생성해서 mail_key 컬럼에 넣어주기
			String mailKey = new TempKey().getKey(30,false); //랜덤키 길이 설정
	        member.setMailKey(mailKey);
	        
	        
			int rowcnt = memberDAO.insertMember(member);
			memberDAO.updateMailKey(member);
			
			MailHandler sendMail = new MailHandler(mailSender);
	        sendMail.setSubject("[BlueMine 인증메일 입니다.]"); //메일제목
	        sendMail.setText(
	                "<h1>BlueMine 메일인증</h1>" +
	                "<br>BlueMine에 오신것을 환영합니다!" +
	                "<br>아래 [이메일 인증 확인]을 눌러주세요." +
	                "<br><a href='http://192.168.35.28/member/registerEmail?memEmail=" + member.getMemEmail() +
	                "&mailKey=" + mailKey +
	                "' target='_blank'>이메일 인증 확인</a>");
	        sendMail.setFrom("BlueMine@BlueMine.com", "BlueMine");
	        sendMail.setTo(member.getMemEmail());
	        sendMail.send();
			result = rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		}
		return result;
	}

	@Override
	public List<MemberVO> retrieveMemberList(PagingVO<MemberVO> pagingVO) {
		pagingVO.setTotalRecord(memberDAO.selectTotalRecord(pagingVO));
		List<MemberVO> memberList = memberDAO.selectMemberList(pagingVO);
		pagingVO.setDataList(memberList);
		return memberList;
	}

	@Override
	public MemberVO retrieveMember(String memEmail) {
		MemberVO member = memberDAO.selectMember(memEmail);
		if(member==null)
			throw new UserNotFoundException(String.format(memEmail+"에 해당하는 사용자 없음."));
		return member;
	}

	@Override
	public ServiceResult modifyMember(MemberVO member) {
		ServiceResult result = null;
		Authentication inputData = new UsernamePasswordAuthenticationToken(member.getMemEmail(), member.getMemPass());
		try {
			authenticationManager.authenticate(inputData);
			int rowcnt = memberDAO.updateMember(member);
			result = rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		}catch (UsernameNotFoundException e) {
			result = ServiceResult.NOTEXIST;
		}catch (AuthenticationException e) {
			result = ServiceResult.INVALIDPASSWORD;
		}
		return result;
	}

	@Override
	public ServiceResult removeMember(MemberVO member) {
		ServiceResult result = null;
		Authentication inputData = 
				new UsernamePasswordAuthenticationToken(member.getMemEmail(), member.getMemPass());
		try {
			authenticationManager.authenticate(inputData);
			int rowcnt = memberDAO.deleteMember(member.getMemEmail());
			result = rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		}catch (UsernameNotFoundException e) {
			result = ServiceResult.NOTEXIST;
		}catch (AuthenticationException e) {
			result = ServiceResult.INVALIDPASSWORD;
		}
		return result;
	}

	@Override
	public int updateMailKey(MemberVO member) throws Exception {
		return memberDAO.updateMailKey(member);
	}

	@Override
	public int updateMailAuth(MemberVO member) throws Exception {
		return memberDAO.updateMailAuth(member);
	}

	@Override
	public int emailCheck(String memEmail) {
		return memberDAO.emailCheck(memEmail);
	}

	@Override
	public int modifyMemAttNo(MemberVO member) {
		MultipartFile[] files = member.getFiles();
		if(files!=null && files.length > 0) {
		int memAttNo = attService.createAttatch(files,"profileImg");
		member.setMemAttNo(memAttNo);
		} 
		return memberDAO.updateMemAttNo(member);
	}

	@Override
	public ServiceResult modifySomeThing(MemberVO member) {
		ServiceResult result = null;
		int cnt = memberDAO.updateSomeThing(member);
		result = cnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		return result;
	}

	@Override
	public Integer emailAuth(String memEmail) {
		return memberDAO.emailAuth(memEmail);
	}

	@Override
	public MemberVO retrieveProjectMember(Map<String, String> proMap) {
		return memberDAO.selectProjectMember(proMap);
	}

	
}

