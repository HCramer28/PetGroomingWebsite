using FinalProject.UI.MVC.Models;
using System.Web.Mvc;
using System.Net.Mail;
using System.Net;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace FinalProject.UI.MVC.Controllers
{
    public class HomeController : Controller
    {
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        [Authorize]
        public ActionResult About()
        {
            ViewBag.Message = "Your app description page.";

            return View();
        }

        [HttpGet]
        public ActionResult Contact()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Contact(ContactViewModel cvm)
        {
            //when a class has validation attributes, that validation should be checked before attempting to process any data. 
            if (!ModelState.IsValid)
            {
                //send them back to the form by passing the obj to the view, which returns the form with the original populated information
                return View(cvm);
            }
            //Only excutes if the form obj passes Model validation

            //build the message--what we see when we receive the email
            string message = $"You have received an email from {cvm.Name} with a subject {cvm.Subject}. Please respond to {cvm.Email} with your response to the following message: <br/> {cvm.Message}";

            //mail message-- what sends the email using system.net.mail
            MailMessage mm = new MailMessage(
                //from
                "admin@cramercoding.com",
                //TO--this assumes forwarding by the host(you@yourdomain.ext)
                "hmwarder28@att.net", // hard card untill SmarterASP works around the forwarding issue
                                      //Subject
                cvm.Subject,
                //Body
                message
                );

            //mailmessage properties
            //allow html formatting in the email(message has html in it)
            mm.IsBodyHtml = true;
            //if you want to mark emails with high priority
            mm.Priority = MailPriority.High;//the default is normal

            //respond to the senders email instead of our own SMTP client (webmail)
            mm.ReplyToList.Add(cvm.Email);

            //SMTP client-this is the info from the host(smarterasp.net)
            //this will allow the email to actually be sent
            SmtpClient client = new SmtpClient("mail.cramercoding.com");

            //client credentials(smarterasp requires your username and password)
            client.Credentials = new NetworkCredential("admin@cramercoding.com", "Clarence2016!");

            //it is possible that the mail server is down or configuration issue, we want to encapsulate our code in a try/catch
            try
            {
                //attemp to send the email
                client.Send(mm);
            }
            catch (Exception ex)
            {
                ViewBag.CustomerMessage = $"We're sorry your request could not be completed at this time.Please try again later. Error message: <br/> {ex.StackTrace}";

                //return the view with entire message so the user can copy/paste for later
                return View(cvm);
            }

            //if all goes well, return a view that displays a confirmation to the end user that the email was sent.
            return View("EmailConfirmation", cvm);

        }
    



        public ActionResult Packages()
        {
            ViewBag.Message = "Packages";

            return View();
        }
        
    }
}
