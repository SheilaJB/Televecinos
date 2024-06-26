package org.example.televecinosunidos_appweb.util;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EnviarEmail {
    private final Properties properties = new Properties();
    private Session session;

    private void init() {
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.mail.sender", "televecinos.unidos@gmail.com");
        properties.put("mail.smtp.user", "televecinos.unidos@gmail.com");
        properties.put("mail.smtp.auth", "true");

        session = Session.getInstance(properties, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(
                        (String) properties.get("mail.smtp.user"), "qbew xbvm swes kmmu");
            }
        });
    }

    public void sendEmail(String destinatario, String tempPassword) {
        init();
        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress((String) properties.get("mail.smtp.mail.sender")));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(destinatario));
            message.setSubject("Contraseña Temporal para ingresar ");
            message.setText("Bienvenido vecino San Miguelino. Su contraseña temporal es: " + tempPassword + ". Por favor cambie su contraseña al ingresar a la plataforma.");

            Transport.send(message);
            System.out.println("Correo enviado exitosamente.");
        } catch (MessagingException me) {
            me.printStackTrace();
        }
    }
}
