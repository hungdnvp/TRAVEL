using MailKit.Security;
using MimeKit;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI.WebControls;

namespace TRAVEL.Models
{
    public class SendMailService
    {
        private MailSettings mailSettings = new MailSettings();

        private MailContent mailContent = new MailContent();
        public string code { get; set; }

        public SendMailService()
        {
            mailSettings.Port = 587;
            mailSettings.Mail = "quanghungdo.vp@gmail.com";
            mailSettings.DisplayName = "TRAVEL AND ENJOY";
            mailSettings.Password = "qlettkqvzluyglms";
            mailSettings.Host = "smtp.gmail.com";

            mailContent.Subject = "TRAVEL CONFIRM FORGOT PASSWORD !!!";
            Random rd = new Random();
            code = rd.Next(10000, 99999).ToString();
            mailContent.Body = "Use " + code + " to change password your account";
        }
        public void setTo(string address) { mailContent.To = address; }


        public async Task SendMail()
        {
            var email = new MimeMessage();
            email.Sender = new MailboxAddress(mailSettings.DisplayName, mailSettings.Mail);
            email.From.Add(new MailboxAddress(mailSettings.DisplayName, mailSettings.Mail));
            email.To.Add(MailboxAddress.Parse(mailContent.To));
            email.Subject = mailContent.Subject;


            var builder = new BodyBuilder();
            builder.HtmlBody = mailContent.Body;
            email.Body = builder.ToMessageBody();

            // dùng SmtpClient của MailKit
            using (var smtp = new MailKit.Net.Smtp.SmtpClient())
            {
                try
                {
                    smtp.Connect(mailSettings.Host, mailSettings.Port, SecureSocketOptions.StartTls);
                    smtp.Authenticate(mailSettings.Mail, mailSettings.Password);
                    await smtp.SendAsync(email);
                }
                catch (Exception ex)
                {
                    Console.WriteLine("send mail failure");
                }

                smtp.Disconnect(true);
            }
            Console.WriteLine("send ok");

        }
        //public async Task SendEmailAsync(string email, string subject, string htmlMessage)
        //{
        //    await SendMail(new MailContent()
        //    {
        //        To = email,
        //        Subject = subject,
        //        Body = htmlMessage
        //    });
        //}
    }
}