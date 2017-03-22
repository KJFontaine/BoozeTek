using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BoozeTEKv4.AdminPages
{
    public partial class Ingredient : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Request.IsAuthenticated)
            {
                Response.Redirect("~/Login.aspx");
            }

            else
            {

                int Ingredient_ID = Convert.ToInt32(RouteData.Values["Ingredient_ID"]);
                if (!IsPostBack)
                {

                    if (Ingredient_ID > 0)   // if drink_id, update
                    {
                        lbtnUpdate.Text = "Update";
                        IngredientCS mt = new IngredientCS(Ingredient_ID);
                        txtIngredientName.Text = mt.Ingredient_Name;
                        ddlIngredientType.SelectedValue = mt.Ingredient_Type.ToString();
                    }
                    else  // if no drink_id, add
                    {
                        lbtnDelete.Visible = false;
                        lbtnUpdate.Text = "Add";
                        IngredientCS mt = new IngredientCS(Ingredient_ID);
                        txtIngredientName.Text = String.Empty;
                        ddlIngredientType.SelectedValue = null;

                    }
                }

            }
        }

        protected void lbtnUpdate_Click(object sender, EventArgs e)
        {
            string updateBUTTON = lbtnUpdate.Text;

            if (updateBUTTON == "Update")    // update drink
            {
                IngredientCS sr = new IngredientCS();
                if (RouteData.Values["Ingredient_ID"] != null)
                {
                    bool success = false;
                    sr.Ingredient_ID = Convert.ToInt32(RouteData.Values["Ingredient_ID"]);
                    sr.Ingredient_Name = txtIngredientName.Text.Trim();
                    sr.Ingredient_Type = (ddlIngredientType.SelectedValue);
                    //sr.Drink_Desc = txtDrinkDescription.Text.Trim();

                    success = IngredientCS.UpdateIngredient(sr);

                    if (success)  // if update is true
                    {
                        Response.Redirect("/Admin/Ingredients");
                    }
                }
            }

            else   // insert drink
            {
                bool success = false;
                IngredientCS sr = new IngredientCS();
                sr.Ingredient_ID = Convert.ToInt32(RouteData.Values["Ingredient_ID"]);
                sr.Ingredient_Name = txtIngredientName.Text.Trim();
                sr.Ingredient_Type = (ddlIngredientType.SelectedValue);

                success = IngredientCS.InsertIngredient(sr);

                if (success)  // if insert is true
                {
                    Response.Redirect("/Admin/Ingredients");
                }
            }
        }

        protected void lbtnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/Ingredients");
        }

        protected void lbtnDelete_Click(object sender, EventArgs e)
        {
            IngredientCS sr = new IngredientCS();
            if (RouteData.Values["Ingredient_ID"] != null)
            {
                bool success = false;
                sr.Ingredient_ID = Convert.ToInt32(RouteData.Values["Ingredient_ID"]);

                success = IngredientCS.DeleteIngredient(sr);

                if (success)  // if update is true
                {
                    Response.Redirect("/Admin/Ingredients");
                }
                else if (!success)
                {
                    lblMessage.Text = "Ingredient Delete Failed! Ingredient is linked to Mix Table!";
                    return;   // exits the function
                }
            }
        }
    }
}