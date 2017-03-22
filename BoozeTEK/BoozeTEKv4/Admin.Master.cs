using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
namespace BoozeTEKv4
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
                //if (!IsPostBack)
                //{
                //    #region
                //    List<MenuItem> lmi = Links.GetAdminMenu();
                //    foreach (MenuItem mi in lmi)
                //    {
                //        mnuMain.Items.Add(mi);

                //    }
            //}

            if (Request.IsAuthenticated)   // if user is logged in
                {
                    //hide the login button if logged in
                    //lbtnLogin.Visible = false;
                    //link to logout if logged in
                    lbtnLogOut.Visible = true;
                    //personalized greeting to display on the site
                    //Grab the cookie
                    if (Session["User_Email"] != null)
                    {
                        lblGreeting.Text = String.Concat("Welcome ", Session["User_Email"].ToString());
                        //enable greeting when user is authenticated
                    }
                }
                else
                {
                    Response.Redirect("~/Login.aspx");
                //login link if not authenticated
                    //lbtnLogin.Visible = true;
                    //hide logout button if not authenticated
                    lbtnLogOut.Visible = false;
                    //generic greeting to display on the site
                    lblGreeting.Text = "Welcome Guest(s)";
                }
            }






        protected void lbtnLogOut_Click(object sender, EventArgs e)
        // Log User Off from Cookie Authentication System
        //(.NET built in security system)
        {
            FormsAuthentication.SignOut();
            //set name session variable to nothing
            Session["User_Email"] = null;
            // Redirect user back to the Home Page
            Response.Redirect("~/Login");
        }

        
  
    }
}