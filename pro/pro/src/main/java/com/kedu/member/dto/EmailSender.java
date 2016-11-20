package com.kedu.member.dto;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;

public class EmailSender {
	
	@Autowired
	private JavaMailSender mailSender;
	
	public void SendEmail(EmailDto emailDto) throws Exception{
		
		MimeMessage msg = mailSender.createMimeMessage();
		try{
			msg.setSubject(emailDto.getSubject());
			msg.setText(emailDto.getContent());
			msg.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(emailDto.getReceiver()));
		}catch(MessagingException e){
			e.printStackTrace();
		}
		try{
			mailSender.send(msg);
		}catch(MailException e){
			e.printStackTrace();
		}
		
	}

}
