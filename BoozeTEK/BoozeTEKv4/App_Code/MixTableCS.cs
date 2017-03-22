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
    public class MixTableCS
    {
        #region Properties
        public int Drink_ID { get; set; }
        public int Ingredient_ID { get; set; }
        public string Drink_Name { get; set; }
        public string Ingredient_Name { get; set; }
        public decimal Amount { get; set; }

        #endregion

        #region Constructors
        public MixTableCS() { }

        public MixTableCS(int Drink_ID)
        {
            DataTable dt = GetMixByDrinkID(Drink_ID);  //match

            //int rows = dt.Rows.Count;

            if (dt.Rows.Count > 0)
            {
                
                this.Drink_ID = Drink_ID;
                this.Ingredient_ID = Ingredient_ID;
                //this.Ingredient_ID = Convert.ToInt32(dt.Rows[0]["Ingredient_ID"]);
                this.Drink_Name = dt.Rows[0]["Drink_Name"].ToString();
                this.Ingredient_Name = dt.Rows[0]["Ingredient_Name"].ToString();
                this.Amount = Convert.ToDecimal(dt.Rows[0]["Amount"]);
            }
        }
        #endregion

        #region Methods/Functions
        private static DataTable GetMixByDrinkID(int Drink_ID)
        {
            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["SE265_BoozeTekConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("MixTable_GetByDrinkID", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@Drink_ID", SqlDbType.Int).Value = Drink_ID;

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