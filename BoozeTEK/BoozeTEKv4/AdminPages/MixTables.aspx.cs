using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BoozeTEKv4.AdminPages
{
    public partial class MixTables : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Request.IsAuthenticated)
            {
                Response.Redirect("~/Login.aspx");
            }
            
        }

        protected void lbtnInsert_Click(object sender, EventArgs e)
        {
            SqlDataSource2.InsertParameters["Drink_ID"].DefaultValue = ((TextBox)GridView4.FooterRow.FindControl("txtDrink_IDinsert")).Text;
            SqlDataSource2.InsertParameters["Ingredient_ID"].DefaultValue = ((TextBox)GridView4.FooterRow.FindControl("txtIngredient_IDinsert")).Text;
            SqlDataSource2.InsertParameters["Amount"].DefaultValue = ((TextBox)GridView4.FooterRow.FindControl("txtAmountinsert")).Text;

            SqlDataSource2.Insert();
        }
    }
}