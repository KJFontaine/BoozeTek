using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace BoozeTEKv4.AdminPages
{
    public partial class MixTable : System.Web.UI.Page
    {
        

        protected void Page_Load(object sender, EventArgs e)
        {
            int Drink_ID = Convert.ToInt32(RouteData.Values["Drink_ID"]);
            if (!IsPostBack)
            {
           



                //SqlConnection sc = new SqlConnection("Data Source=sql.neit.edu,4500;Initial Catalog=SE265_BoozeTek;User ID=emurillo; Password=neit2017");
                //SqlCommand com = new SqlCommand();
                //com.Connection = sc;
                //sc.Open();
                //SqlDataReader dr = (null);
                //SqlDataReader read = (null);
                //com.CommandText = ("SELECT Ingredient_Name, Amount FROM Mix JOIN Drinks ON Drinks.Drink_ID = Mix.Drink_ID JOIN Ingredients ON Mix.Ingredient_ID = Ingredients.Ingredient_ID WHERE Drinks.Drink_ID = @Drink_ID");
                //read = com.ExecuteReader();
                //SqlCommand.Parameters.AddWithValue("@Drink_ID", Drink_ID);
                //dr = com.ExecuteReader();

                //if (dr.Read())
                //{
                //    TextBox1.Text = dr.GetValue(0).ToString();
                //    TextBox2.Text = dr.GetValue(0).ToString();
                //}
                //Con.Close();

                //CustID.Text = (read["Customer_ID"].ToString());
                //CustName.Text = (read["Customer_Name"].ToString());
                //Add1.Text = (read["Address_1"].ToString());
                //Add2.Text = (read["Address_2"].ToString());
                //PostBox.Text = (read["Postcode"].ToString());
                //PassBox.Text = (read["Password"].ToString());
                //DatBox.Text = (read["Data_Important"].ToString());
                //LanNumb.Text = (read["Landline"].ToString());
                //MobNumber.Text = (read["Mobile"].ToString());
                //FaultRep.Text = (read["Fault_Report"].ToString());
                //sc.Close();







                MixTableCS mt = new MixTableCS(Drink_ID);
                //int ingredients = mt.Ingredient_ID;
                //TableRow trow;
                //TableCell tcell1, tcell2, tcell3, tcell4;
                //for (int i = 0; i < ingredients; i++)
                //{
                //    {
                //        trow = new TableRow();
                //        tcell1 = new TableCell();
                //        tcell1.Controls.Add(new TextBox());
                //        tcell2 = new TableCell();
                //        tcell2.Controls.Add(new DropDownList());

                //        tcell3 = new TableCell();
                //        tcell3.Controls.Add(new TextBox());
                //        tcell4 = new TableCell();
                //        tcell4.Controls.Add(new DropDownList());

                //        trow.Cells.Add(tcell1);
                //        trow.Cells.Add(tcell2);
                //        trow.Cells.Add(tcell3);
                //        trow.Cells.Add(tcell4);
                //        mytbl.Rows.Add(trow);
                //    }



                //}


                if (Drink_ID > 0)   // if drink_id, update
                {
                    lbtnUpdate.Text = "Update";
                    MixTableCS tt = new MixTableCS(Drink_ID);
                    txtDrinkName.Text = tt.Drink_Name.ToString();
                    txtIngredientName.Text = tt.Ingredient_Name.ToString();
                    txtAmount.Text = tt.Amount.ToString();

                }



                else  // if no drink_id, add new mix table
                {
                    //lbtnDelete.Visible = false;
                    lbtnUpdate.Text = "Add";
                    MixTableCS tt = new MixTableCS(Drink_ID);
                    //ddlDrinkName.SelectedValue = null;
                    //ddlIngredientName.SelectedValue = null;

                    //txtIngredientName.Text = String.Empty;
                    //ddlIngredientType.SelectedValue = null;

                }
            }
        }

        protected void lbtnUpdate_Click(object sender, EventArgs e)
        {

        }

        protected void lbtnCancel_Click(object sender, EventArgs e)
        {

        }

        protected void lbtnDelete_Click(object sender, EventArgs e)
        {

        }
    }
}