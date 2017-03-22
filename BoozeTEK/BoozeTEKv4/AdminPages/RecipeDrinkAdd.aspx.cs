using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace BoozeTEKv4.AdminPages
{
    public partial class RecipeDrinkAdd : System.Web.UI.Page
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
                        DrinkCS mt = new DrinkCS(Drink_ID);
                        txtDrinkName.Text = mt.Drink_Name;
                        txtDrinkDescription.Text = mt.Drink_Desc;
                    }
                    else  // if no drink_id, add
                    {
                        DrinkCS mt = new DrinkCS(Drink_ID);
                        txtDrinkName.Text = String.Empty;
                        txtDrinkDescription.Text = String.Empty;
                    }
                }
            }
        }

        protected void lbtnAdd_Click(object sender, EventArgs e)

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
}


