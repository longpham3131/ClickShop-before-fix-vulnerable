package com.controller.web;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.MessagingException;
import  javax.mail.*;
/**
 * @author Nhat Minh
 */
public class SendEmailService {
    public static boolean sendEmailOtp(String SUBJECT, String TO, String MESSAGECONTENT) {
        boolean flag = false;
        System.out.println("above Properties set ");
        Properties properties = System.getProperties();
        System.out.println("Properties set ok");
        //SETTING IMPORTANT INFORMATION FOR PROPERTIES Obj


        Properties p = new Properties();
        p.put("mail.smtp.auth", "true");
        p.put("mail.smtp.starttls.enable", "true");
        p.put("mail.smtp.host", "smtp.gmail.com");
        p.put("mail.smtp.port", 587);
        //host set
        //step1: get session

        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() { // dùng để đăng nhập gmail
                return new PasswordAuthentication("pffgia3@gmail.com", "kietkiet00"); //check pls
            }
        });
        System.out.println("session getinstance ok");
        session.setDebug(true);

        //step2: set message
        MimeMessage message = new MimeMessage(session);
        System.out.println("mime mes set ok");
        try {
            //from
            // message.setFrom(from);
            message.setFrom(new InternetAddress("pffgia3@gmail.com"));
            //to
            message.setRecipients(Message.RecipientType.TO, TO);
            //content
            message.setText(MESSAGECONTENT);
            //step3: send email
            Transport.send(message);
        } catch (MessagingException e) {
            System.out.println(e);
            return false;

        }
        return true;
    }
}