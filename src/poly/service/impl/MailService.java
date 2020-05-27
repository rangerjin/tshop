package poly.service.impl;

import java.util.Properties;
import java.util.Random;

import javax.annotation.Resource;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import poly.dto.MailDTO;
import poly.persistance.mapper.IMailMapper;
import poly.service.IMailService;
import poly.util.CmmUtil;

@Service("MailService")
public class MailService implements IMailService {

	// 로그 파일 생성 및 로그 출력을 위한 log4j 프레임워크의 자바 객체
	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "MailMapper")
	private IMailMapper mailMappper;

	final String host = "smtp.naver.com"; // 네이버에서 제공하는 SMTP서버
	final String user = "youngjinman3"; // 보인 네이버 아이디
	final String password = "gkakehs1!Q"; // 본인 네이버 비밀번호

	private String init() {
		Random ran = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;

		do {
			num = ran.nextInt(75) + 48;
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				sb.append((char) num);
			} else {
				continue;
			}

		} while (sb.length() < size);
		if (lowerCheck) {
			return sb.toString().toLowerCase();
		}
		return sb.toString();

	}

	private boolean lowerCheck;
	private int size;

	public String getKey(boolean lowerCheck, int size) {
		this.lowerCheck = lowerCheck;
		this.size = size;
		return init();
	}

	@Override
	public int doSendMail(MailDTO pDTO) {

		// 로그 찍기(추후 찍은 로그를 통해 이 함수에 접근했는지 파악하기가 용이하다
		log.info(this.getClass().getName() + ".doSendMail start!");

		// 메일 발송 성공 여부(발송성공 : 1, 발송실패 : 0)
		int res = 1;

		// 전달 받은 DTO로 부터 데이터 가져오기(DTO객체가 메모리에 올라가지 않아 Null이 발생할 수 있기 떄문에 에러방지 차원으로 if문
		// 사용함
		if (pDTO == null) {
			pDTO = new MailDTO();
		}

		String toMail = CmmUtil.nvl(pDTO.getToMail()); // 받는사람 CmmUtil.nvl(인자) null널값을 받으면 빈칸을 채우는 메서드

		Properties props = new Properties(); // 네이버 인증을 위해 자바에서 제공해주는 properties
		props.put("mail.smtp.host", host); // javax 외부 라이브러리에 메일 보내는 사람의 정보 설정
		props.put("mail.smtp.auth", "true"); // javax 외부 라이브러리에 메일 보내는 사람 인증 여부 설정

		// 네이버 SMTP서버 인증 처리 로직
		Session session = Session.getDefaultInstance(props, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});

		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(toMail));

			// 메일 제목
			message.setSubject(CmmUtil.nvl(pDTO.getTitle()));

			// 메일 내용
			message.setText(CmmUtil.nvl(pDTO.getContents()));

			// 메일 발송
			Transport.send(message);

		} catch (MessagingException e) { // 메일 정송 관련 에러 다 잡기
			res = 0; // 메일 발송이 실패했기 떄문에 0으로 변경
			log.info("[ERROR] " + this.getClass().getName() + ".doSendMail : " + e);

		} catch (Exception e) { // 모든 에러 다 잡기
			res = 0; // 메일 발송이 실패 했기 떄문에 0으로 변경
			log.info("[ERROR] " + this.getClass().getName() + ".doSendMail : " + e);
		}

		// 로그 찍기(추후 찍은 로그를 통해 이 함수 호출이 끝났는지 파악하기 용이하다.)
		log.info(this.getClass().getName() + ".doSendMail end!!!");
		return res;

	}

	@Override
	public void mailSendWithUserKey(String user_email, String user_id, HttpServletRequest request) {

		String user_key = getKey(false, 20);

		mailMappper.getKey(user_id, user_key);

		// 로그 찍기(추후 찍은 로그를 통해 이 함수에 접근했는지 파악하기가 용이하다
		log.info(this.getClass().getName() + ".mailSendWithUserKey start!");

		String toMail = user_email; // 받는사람 CmmUtil.nvl(인자) null널값을 받으면 빈칸을 채우는 메서드

		Properties props = new Properties(); // 네이버 인증을 위해 자바에서 제공해주는 properties
		props.put("mail.smtp.host", host); // javax 외부 라이브러리에 메일 보내는 사람의 정보 설정
		props.put("mail.smtp.auth", "true"); // javax 외부 라이브러리에 메일 보내는 사람 인증 여부 설정

		// 네이버 SMTP서버 인증 처리 로직
		Session session = Session.getDefaultInstance(props, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});

		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(toMail));

			// 메일 제목
			message.setSubject("Food24 [인증메일] 입니다", "utf-8");

			// 메일 내용
			message.setText("<h2>안녕하세요 Food24 입니다</h2><br><br>"
						+	"<h3>" + user_id + "님</h3>" + "<p>인증하기 버튼을 누르시면 로그인을 하실 수 있습니다 : "
						+ "<a href='http://localhost:8080" + request.getContextPath() + "/user/key_alter.do?user_id="
						+ user_id + "&user_key=" + user_key+"'>인증하기</a></p>"
						, "utf-8", "html");

			// 메일 발송
			Transport.send(message);

		} catch (MessagingException e) { // 메일 정송 관련 에러 다 잡기
			log.info("[ERROR] " + this.getClass().getName() + ".doSendMail : " + e);

		} catch (Exception e) { // 모든 에러 다 잡기
			log.info("[ERROR] " + this.getClass().getName() + ".doSendMail : " + e);
		}

		// 로그 찍기(추후 찍은 로그를 통해 이 함수 호출이 끝났는지 파악하기 용이하다.)
		log.info(this.getClass().getName() + ".doSendMail end!!!");
	}

	@Override
	public int alter_userKey_service(String user_id, String user_key) {
		
		int res = 0;
		
		res = mailMappper.updateUserKey(user_id, user_key);
		
		return res;
	}

	@Override
	public void mailSendWithPassword(String user_id, String user_email, HttpServletRequest request) {
		
	}

}
