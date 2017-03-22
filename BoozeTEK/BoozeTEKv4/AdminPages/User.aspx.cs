using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BoozeTEKv4.AdminPages
{
    public partial class User : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Request.IsAuthenticated)
            {
                Response.Redirect("~/Login.aspx");
            }

            else
            {
                int User_ID = Convert.ToInt32(RouteData.Values["User_ID"]);
                if (!IsPostBack)
                {
                    if (User_ID > 0)   // if user_id, update user
                    {
                        lbtnUpdate.Text = "Update";
                        UserCS mt = new UserCS(User_ID);
                        txtEmail.Text = mt.User_Email;
                        lblPassword.Visible = false;
                        lblConfirmPassword.Visible = false;
                        txtPassword.Visible = false;   //password
                        txtConfirmPassword.Visible = false;   //salt
                        chkAdmin_Rights.Checked = mt.Admin_Rights;
                    }
                    else  // if no user_id, add user
                    {
                        lbtnDelete.Visible = false;
                        lbtnUpdate.Text = "Add";
                        UserCS mt = new UserCS(User_ID);
                        txtEmail.Text = String.Empty;
                        txtPassword.Text = String.Empty;   //password
                        txtConfirmPassword.Text = String.Empty;   //salt
                        chkAdmin_Rights.Checked = false;
                    }
                }
            }
        }

        protected void lbtnUpdate_Click(object sender, EventArgs e)
        {
            string updateBUTTON = lbtnUpdate.Text;
            if (updateBUTTON == "Update")    // update user
            {
                UserCS sr = new UserCS();
                if (RouteData.Values["User_ID"] != null)
                {
                    bool success = false;
                    sr.User_ID = Convert.ToInt32(RouteData.Values["User_ID"]);
                    sr.User_Email = txtEmail.Text.Trim();
                    sr.Admin_Rights = chkAdmin_Rights.Checked;
                    success = UserCS.UpdateUser(sr);

                    if (success)  // if update is true
                    {
                        Response.Redirect("/Admin/Users");
                    }
                    else
                    {
                        lblMessage.Text = "Update User Failed! Please check your entry and try again!";
                        return;   // exits the function
                    }
                }
            }

            else   // insert / add user
            {
                bool success = false;
                UserCS sr = new UserCS();
                sr.User_Email = txtEmail.Text.Trim();
                sr.User_Pwd = UserCS.CreatePasswordHash(sr.User_Salt, txtPassword.Text.Trim());
                sr.Admin_Rights = chkAdmin_Rights.Checked;
                success = UserCS.InsertUser(sr);

               if (success)
                {
                    Response.Redirect("~/Admin/Users");
                }
                else
                {
                    lblMessage.Text = "Add User Failed! Please check your entry and try again!";
                    return;   // exits the function
                }
            }
        }

        protected void lbtnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/Users");
        }

        protected void lbtnDelete_Click(object sender, EventArgs e)
        {
            UserCS sr = new UserCS();
            if (RouteData.Values["User_ID"] != null)

            {
                bool success = false;
                sr.User_ID = Convert.ToInt32(RouteData.Values["User_ID"]);

                if (sr.Admin_Rights = chkAdmin_Rights.Checked)
                {
                    lblMessage.Text = "User Delete Failed! User is an ADMIN!";
                    return;   // exits the function
                }
                else
                {
                    success = UserCS.DeleteUser(sr);

                    if (success)  // if delete is true
                    {
                        Response.Redirect("/Admin/Users");
                    }
                    else if (!success)
                    {
                        lblMessage.Text = "User Delete Failed! User has a Virtual Bar!";
                        return;   // exits the function

                    }
                }
            }
        }
    }
}
