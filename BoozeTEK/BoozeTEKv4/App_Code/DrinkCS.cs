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
    public class DrinkCS
    {
        #region Properties
        public int Drink_ID { get; set; }
        public string Drink_Name { get; set; }
        public string Drink_Desc { get; set; }

        #endregion

        #region Constructors
        public DrinkCS() { }

        public DrinkCS(int Drink_ID)
        {
            DataTable dt = GetDrinksID(Drink_ID);  //****

            if (dt.Rows.Count > 0)
            {
                this.Drink_ID = Drink_ID;
                this.Drink_Name = dt.Rows[0]["Drink_Name"].ToString();
                this.Drink_Desc = dt.Rows[0]["Drink_Desc"].ToString();
            }
        }  //*****
        #endregion

        #region Methods/Functions
        private static DataTable GetDrinksID(int Drink_ID)
        {
            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["SE265_BoozeTekConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("Drink_GetByID", cn);
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

        public static bool UpdateDrink(DrinkCS sr)
        {
            bool blnSuccess = false;
            SqlConnection cn = new SqlConnection(
            ConfigurationManager.ConnectionStrings["SE265_BoozeTekConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("Drink_Update", cn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add(
                  "@Drink_ID", SqlDbType.Int).Value = sr.Drink_ID;
            cmd.Parameters.Add(
                  "@Drink_Name", SqlDbType.VarChar).Value = sr.Drink_Name;
            cmd.Parameters.Add(
                  "@Drink_Desc", SqlDbType.VarChar).Value = sr.Drink_Desc;

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


        public static bool InsertDrink(DrinkCS sr)
        {
            bool blnSuccess = false;
            SqlConnection cn = new SqlConnection(
            ConfigurationManager.ConnectionStrings["SE265_BoozeTekConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("Drink_Insert", cn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add(
                  "@Drink_Name", SqlDbType.VarChar).Value = sr.Drink_Name;
            cmd.Parameters.Add(
                  "@Drink_Desc", SqlDbType.VarChar).Value = sr.Drink_Desc;

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

        public static bool DeleteDrink(DrinkCS sr)
        {
            bool blnSuccess = false;
            SqlConnection cn = new SqlConnection(
            ConfigurationManager.ConnectionStrings["SE265_BoozeTekConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("Drink_Delete", cn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add(
                 "@Drink_ID", SqlDbType.Int).Value = sr.Drink_ID;

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



        private static DataTable GetDrinkIDByName(string Drink_Name)
        {
            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["SE265_BoozeTekConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("GetDRINKID_BY_NAME", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@Drink_Name", SqlDbType.VarChar).Value = Drink_Name;

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

        static public int AddProductCategory(string drinkName, string drinkDesc, string connString)
        {
            Int32 ProdID = 0;
            string sql =

            "INSERT INTO Drinks (Drink_Name, Drink_Desc) VALUES (@Drink_Name, @Drink_Desc); "
            + "SELECT CAST(scope_identity() AS int)";
            using (SqlConnection conn = new SqlConnection("Data Source=sql.neit.edu,4500;Initial Catalog=SE265_BoozeTek;User ID=emurillo; Password=neit2017"))
            {
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.Add("@Drink_Name", SqlDbType.VarChar);
                cmd.Parameters["@Drink_Name"].Value = drinkName;
                cmd.Parameters.Add("@Drink_Desc", SqlDbType.VarChar);
                cmd.Parameters["@Drink_Desc"].Value = drinkDesc;


                try
                {
                    conn.Open();
                    ProdID = (Int32)cmd.ExecuteScalar();
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                }
            }
            return (int)ProdID;
        }

    }
}