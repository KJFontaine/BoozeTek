using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BoozeTEKv4.AdminPages
{
    public partial class UserVBar : System.Web.UI.Page
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
            SqlDataSource1.InsertParameters["User_ID"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtUser_IDinsert")).Text;
            SqlDataSource1.InsertParameters["Ingredient_ID"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtIngredient_IDinsert")).Text;
            SqlDataSource1.Insert();
        }
    }
}