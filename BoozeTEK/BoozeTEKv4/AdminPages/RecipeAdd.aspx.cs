using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
namespace BoozeTEKv4.AdminPages
{
    public partial class RecipeAdd : System.Web.UI.Page
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
                    DrinkCS mt1 = new DrinkCS(Drink_ID);
                    if (Drink_ID > 0)   // if drink_id, update
                    {
                        DrinkCS mt = new DrinkCS(Drink_ID);    // needed  grabs drink id
                        int GrabDrinkID = mt.Drink_ID;
                        txtDrinkName.Text = mt.Drink_Name;
                        txtDrinkDescription.Text = mt.Drink_Desc;
                    }
                    else  // if no drink_id, add
                    {
                        DrinkCS mt = new DrinkCS(Drink_ID);
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
                int GrabDrinkID = sr.Drink_ID;
                Response.Redirect("~/Admin/RecipeAdd");
            }
        }

        protected void ddlIngredientType_SelectedIndexChanged(object sender, EventArgs e)
        {
                string s = ddlIngredientType.SelectedValue.ToString();

                SqlConnection btekconnect = new SqlConnection(ConfigurationManager.ConnectionStrings["BoozeTEKconnection"].ConnectionString);
                SqlCommand btek = new SqlCommand("Ingredients_GetByType", btekconnect);
                btek.CommandType = CommandType.StoredProcedure;
                SqlParameter Ingredient_Type = new SqlParameter("@Ingredient_Type", SqlDbType.VarChar);
                Ingredient_Type.Value = s;
                btek.Parameters.Add(Ingredient_Type);
                btekconnect.Open();
                btek.ExecuteNonQuery();

                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = btek;
                DataSet ds = new DataSet();
                da.Fill(ds, "Ingredient_Type");

                IngredientName.DataTextField = "Ingredient_Name";
                IngredientName.DataValueField = "Ingredient_Name";
                IngredientName.DataSource = ds;
                IngredientName.DataBind();
        }

        protected void ddl_SelectedIndexChanged(object sender, EventArgs e)
        {
            string s = ddlIngredientType.SelectedValue.ToString();

            SqlConnection btekconnect = new SqlConnection(ConfigurationManager.ConnectionStrings["BoozeTEKconnection"].ConnectionString);
            SqlCommand btek = new SqlCommand("Ingredients_GetByType", btekconnect);
            btek.CommandType = CommandType.StoredProcedure;
            SqlParameter Ingredient_Type = new SqlParameter("@Ingredient_Type", SqlDbType.VarChar);
            Ingredient_Type.Value = s;
            btek.Parameters.Add(Ingredient_Type);
            btekconnect.Open();
            btek.ExecuteNonQuery();

            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = btek;
            DataSet ds = new DataSet();
            da.Fill(ds, "Ingredient_Type");

            DropDownList1.DataTextField = "Ingredient_Name";
            DropDownList1.DataValueField = "Ingredient_Name";
            DropDownList1.DataSource = ds;
            DropDownList1.DataBind();
        }

        protected void ddlOptions_SelectedIndexChanged1(object sender, EventArgs e)
        {
            int count = Convert.ToInt32(ddlOptions.SelectedItem.Value);

            for (int i = 0; i < count; i++)
            {
                DropDownList ddl = new DropDownList();
                ddl.ID = "ddl" + i;
                ddl.DataSource = sdsIngredientType;
                ddl.DataTextField = "Ingredient_Type";
                ddl.DataValueField = "Ingredient_Type";
                ddl.SelectedIndexChanged += new EventHandler(ddl_SelectedIndexChanged);
                ddl.AutoPostBack = true;
                ddl.DataBind();
                ctrlPlaceHolder1.Controls.Add(ddl);
            }

            for (int loopcnt = 1; loopcnt <= Convert.ToInt32(ddlOptions.SelectedValue.Trim()); loopcnt++)
            {
                TextBox tb = new TextBox();
                tb.ID = "tb \n" + loopcnt;
                ctrlPlaceholder.Controls.Add(tb);
                ctrlPlaceholder.Controls.Add(new LiteralControl("<br />"));
            }

        }
    }
}
