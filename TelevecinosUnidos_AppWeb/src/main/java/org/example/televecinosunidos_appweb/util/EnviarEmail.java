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

    public void sendEmailASerenazgo(String destinatario, String tempPassword) {
        init();
        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress((String) properties.get("mail.smtp.mail.sender")));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(destinatario));
            message.setSubject("Contraseña Temporal para ingresar ");
            message.setText("Bienvenido serenazgo San Miguelino. Su contraseña temporal es: " + tempPassword + "\nPor favor cambie su contraseña al ingresar a la plataforma.");

            Transport.send(message);
            System.out.println("Correo enviado exitosamente.");
        } catch (MessagingException me) {
            me.printStackTrace();
        }
    }

    public void sendEmailDenegacionSolicitante(String destinatario,String nombreSolicitante) {
        init();
        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress((String) properties.get("mail.smtp.mail.sender")));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(destinatario));
            message.setSubject("Notificación sobre solicitud de acceso a la plataforma");


            String contenidoCorreo = "Estimado/a " + nombreSolicitante +"\n" +
                    "Nos dirigimos a usted para informarle que, tras una revisión detallada, lamentamos comunicarle que su solicitud de acceso a nuestra plataforma ha sido denegada.\n" +
                    "Aunque apreciamos su interés en formar parte de nuestra comunidad, en esta ocasión no ha sido posible aprobar su solicitud. Queremos asegurarle que esta decisión no refleja ningún juicio personal, sino que se ha tomado tras considerar varios factores importantes para el buen funcionamiento y seguridad de nuestra plataforma .\n" +
                    "Si tiene alguna pregunta o desea obtener más información sobre esta decisión, no dude en contactarnos a través de televecinos.unidos@gmail.com y estaremos encantados de asistirle.\n" +
                    "Agradecemos su comprensión y le deseamos todo lo mejor en sus futuros proyectos.\n" +
                    "Atentamente,\n" +
                    "Administración de Televecinos Unidos";
            message.setText(contenidoCorreo);
            Transport.send(message);
            System.out.println("Correo enviado exitosamente.");
        } catch (MessagingException me) {
            me.printStackTrace();
        }
    }


    public void sendEmailPromoverVecinoACoordinador(String destinatario,String nombreVecino) {
        init();
        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress((String) properties.get("mail.smtp.mail.sender")));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(destinatario));
            message.setSubject("Asignación de Rol de Coordinador");


            String contenidoCorreo  = "Estimado/a " + nombreVecino + "\n" +
                    "Nos complace informarle que ha sido seleccionado/a para asumir el rol de Coordinador en nuestra plataforma. Esta asignación refleja nuestra confianza en sus habilidades y en su capacidad para contribuir positivamente a nuestra comunidad.\n" +
                    "Como Coordinador, tendrá acceso a funciones adicionales que le permitirán gestionar y supervisar diversas actividades dentro de la plataforma. Su nuevo rol será fundamental para mantener el buen funcionamiento y la seguridad de nuestra comunidad.\n" +
                    "Si tiene alguna pregunta o necesita asistencia relacionada con sus nuevas responsabilidades, no dude en ponerse en contacto con nosotros. Estaremos encantados de ayudarle en lo que necesite.\n" +
                    "Gracias por su compromiso y dedicación continuos. Estamos seguros de que hará una contribución significativa en su nuevo rol.\n" +
                    "Atentamente,\n" +
                    "Administración de Televecinos Unidos";

            message.setText(contenidoCorreo);
            Transport.send(message);
            System.out.println("Correo enviado exitosamente.");
        } catch (MessagingException me) {
            me.printStackTrace();
        }
    }
}
