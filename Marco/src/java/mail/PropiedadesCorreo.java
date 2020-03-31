package mail;
import java.util.Date;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author APRENDIZ
 */
public class PropiedadesCorreo {

    public static void envioCorreo(String host, String puerto, final String usuario,
            final String clave, String destinatario, String asunto, String mensaje) throws AddressException, MessagingException {

        //Propiedades Servidor SMTP
        //java.util.Properties
        Properties propiedades = new Properties();
        propiedades.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        propiedades.put("mail.smtp.host", host);
        propiedades.put("mail.smtp.port", puerto);
        propiedades.put("mail.smtp.auth", "true");
        propiedades.put("mail.smtp.starttls.enable", "true");

        //javax.mail.authenticator
        Authenticator autenticar = new Authenticator() {

            public PasswordAuthentication getPasswordAuthentication() {

                return new PasswordAuthentication(usuario, clave);
            }
        }; // obligado esto va aqui por seguridad del metodo (._.)

        //Sesion > session.mail
       
            Session sesion = Session.getInstance(propiedades, autenticar);

            //MiMessage > javax.mail.internet.MimeMessage
            Message msj = new MimeMessage(sesion);

            //setFrom(new > javax.mail.internet.InternetAddress;
            //Añadir clause for AddressExeption y MessaginException;
            msj.setFrom(new InternetAddress(usuario));

            InternetAddress[] direcciones = {new InternetAddress(destinatario)};

            msj.setRecipients(Message.RecipientType.TO, direcciones);

            msj.setSubject(asunto);
            // date > util
            msj.setSentDate(new Date());
            msj.setText(mensaje);

            //TODO DEBE LLEGAR AQUI 
            Transport.send(msj);


    }

}
