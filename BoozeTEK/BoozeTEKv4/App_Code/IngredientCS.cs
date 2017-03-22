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
    public class IngredientCS
    {
        #region Properties
        public int Ingredient_ID { get; set; }
        public string Ingredient_Name { get; set; }
        public string Ingredient_Type { get; set; }

        #endregion

        #region Constructors
        public IngredientCS() { }

        public IngredientCS(int Ingredient_ID)
        {
            DataTable dt = GetIngredientID(Ingredient_ID);  //match

            if (dt.Rows.Count > 0)
            {
                this.Ingredient_ID = Ingredient_ID;
                this.Ingredient_Name = dt.Rows[0]["Ingredient_Name"].ToString();
                this.Ingredient_Type = dt.Rows[0]["Ingredient_Type"].ToString();
            }
        }
        #endregion

        #region Methods/Functions
        private static DataTable GetIngredientID(int Ingredient_ID)
        {
            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["SE265_BoozeTekConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("Ingredient_GetByID", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@Ingredient_ID", SqlDbType.Int).Value = Ingredient_ID;

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

        public static bool UpdateIngredient(IngredientCS sr)
        {
            bool blnSuccess = false;
            SqlConnection cn = new SqlConnection(
                ConfigurationManager.ConnectionStrings["SE265_BoozeTekConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("Ingredient_Update", cn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add(
                  "@Ingredient_ID", SqlDbType.Int).Value = sr.Ingredient_ID;
            cmd.Parameters.Add(
                  "@Ingredient_Name", SqlDbType.VarChar).Value = sr.Ingredient_Name;
            cmd.Parameters.Add(
                "@Ingredient_Type", SqlDbType.VarChar).Value = sr.Ingredient_Type;

            try
            {
                cn.Open();
                cmd.ExecuteNonQuery();
                blnSuccess = true;
            }
            catch (Exception exc)
            {
                exc.ToString();
                blnSuccess = false;
            }
            finally
            {
                cn.Close();
            }
            return blnSuccess;
        }


        public static bool InsertIngredient(IngredientCS sr)
        {
            bool blnSuccess = false;
            SqlConnection cn = new SqlConnection(
            ConfigurationManager.ConnectionStrings["SE265_BoozeTekConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("Ingredient_Insert", cn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add(
                  "@Ingredient_Name", SqlDbType.VarChar).Value = sr.Ingredient_Name;
            cmd.Parameters.Add(
                  "@Ingredient_Type", SqlDbType.VarChar).Value = sr.Ingredient_Type;

            try
            {
                cn.Open();
                cmd.ExecuteNonQuery();
                blnSuccess = true;
            }
            catch (Exception exc)
            {
                exc.ToString();
                blnSuccess = false;
            }
            finally
            {
                cn.Close();
            }
            return blnSuccess;
        }

        public static bool DeleteIngredient(IngredientCS sr)
        {
            bool blnSuccess = false;
            SqlConnection cn = new SqlConnection(
            ConfigurationManager.ConnectionStrings["SE265_BoozeTekConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("Ingredient_Delete", cn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add(
                 "@Ingredient_ID", SqlDbType.Int).Value = sr.Ingredient_ID;

            try
            {
                cn.Open();
                cmd.ExecuteNonQuery();
                blnSuccess = true;
            }
            catch (Exception exc)
            {
                exc.ToString();
                blnSuccess = false;
            }
            finally
            {
                cn.Close();
            }
            return blnSuccess;
        }

    }
}