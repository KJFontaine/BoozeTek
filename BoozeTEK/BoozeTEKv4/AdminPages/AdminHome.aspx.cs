using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BoozeTEKv4.AdminPages
{
    public partial class AdminHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Request.IsAuthenticated)
            {
                Response.Redirect("~/Login.aspx");
            }
        }

        protected void lbtnViewAllDrinks_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Admin/Drinks");
        }

        protected void lbtnAddDrink_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Admin/Drink");
        }

        protected void lbtnViewAllIngredients_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Admin/Ingredients");
        }

        protected void lbtnAddIngredient_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Admin/Ingredient");
        }

        protected void lbtnViewAllMixTables_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Admin/MixTables");
        }
        
        protected void lbtnViewAllUsers_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Admin/Users");
        }

        protected void lbtnAddUser_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Admin/User");
        }

        protected void lbtnViewAllVirtualBars_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Admin/VirtualBars");
        }
    }
}