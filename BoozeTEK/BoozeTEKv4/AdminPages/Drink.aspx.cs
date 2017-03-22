using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BoozeTEKv4.AdminPages
{
    public partial class Drink : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Request.IsAuthenticated)
            {
                Response.Redirect("~/Login.aspx");
            }

            else
            {

                int Drink_ID = Convert.ToInt32(RouteData.Values["Drink_ID"]);
                if (!IsPostBack)
                {

                    if (Drink_ID > 0)   // if drink_id, update
                    {
                        lbtnUpdate.Text = "Update";
                        DrinkCS mt = new DrinkCS(Drink_ID);
                        txtDrinkName.Text = mt.Drink_Name;
                        txtDrinkDescription.Text = mt.Drink_Desc;
                    }
                    else  // if no drink_id, add
                    {
                        lbtnDelete.Visible = false;
                        lbtnUpdate.Text = "Add";
                        DrinkCS mt = new DrinkCS(Drink_ID);
                        txtDrinkName.Text = String.Empty;
                        txtDrinkDescription.Text = String.Empty;
                    }
                }
            }
        }
 
        protected void lbtnUpdate_Click(object sender, EventArgs e)
        {
            string updateBUTTON = lbtnUpdate.Text;

            if (updateBUTTON == "Update")    // update drink
            {
                DrinkCS sr = new DrinkCS();
                if (RouteData.Values["Drink_ID"] != null)
                {
                    bool success = false;
                    sr.Drink_ID = Convert.ToInt32(RouteData.Values["Drink_ID"]);
                    sr.Drink_Name = txtDrinkName.Text.Trim();
                    sr.Drink_Desc = txtDrinkDescription.Text.Trim();
                    
                    success = DrinkCS.UpdateDrink(sr);

                    if (success)  // if update is true
                    {
                        Response.Redirect("/Admin/Drinks");
                    }
                }
            }

            else   // insert drink
            {
                bool success = false;
                DrinkCS sr = new DrinkCS();
                sr.Drink_ID = Convert.ToInt32(RouteData.Values["Drink_ID"]);
                sr.Drink_Name = txtDrinkName.Text.Trim();
                sr.Drink_Desc = txtDrinkDescription.Text.Trim();

                success = DrinkCS.InsertDrink(sr);

                if (success)  // if insert is true
                {
                    Response.Redirect("/Admin/Drinks");
                }
            }
        }

        protected void lbtnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/Drinks");
        }

        protected void lbtnDelete_Click(object sender, EventArgs e)
        {
            DrinkCS sr = new DrinkCS();
            if (RouteData.Values["Drink_ID"] != null)
            {
                bool success = false;
                sr.Drink_ID = Convert.ToInt32(RouteData.Values["Drink_ID"]);
       
                success = DrinkCS.DeleteDrink(sr);

                if (success)  // if update is true
                {
                    Response.Redirect("/Admin/Drinks");
                }
                else if (!success)
                {
                    lblMessage.Text = "Drink Delete Failed! Drink is linked to Mix Table!";
                    return;   // exits the function

                }
            }
        }
    }
}