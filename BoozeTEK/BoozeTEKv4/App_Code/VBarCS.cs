using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Cryptography;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace BoozeTEKv4
{
    public class VBarCS
    {
        #region Properties
        public int User_ID { get; set; }
        public string User_Email { get; set; }
        public int Ingredient_ID { get; set; }
        public string Ingredient_Name { get; set; }
        public string Ingredient_Type { get; set; }
        

        public VBarCS(int User_Email)
        {
            DataTable dt = GetUserVBarByID(User_ID);  //match

            if (dt.Rows.Count > 0)
            {
                this.User_Email = dt.Rows[0]["User_Email"].ToString();
                this.Ingredient_Name = dt.Rows[0]["Ingredient_Name"].ToString();
                this.Ingredient_Type = dt.Rows[0]["Ingredient_Type"].ToString();
            }
        }
        #endregion

        #region Methods/Functions
        private static DataTable GetUserVBarByID(int User_ID)
        {
            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["SE265_BoozeTekConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("VBarIngredients_GetByUserID", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@User_ID", SqlDbType.Int).Value = User_ID;

            DataTable dt = new DataTable();
            try
            {
                cn.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
            }
            catch
            {

            }
            finally
            {
                cn.Close();
            }
            return dt;
        }
        #endregion

        





    }
}