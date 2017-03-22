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
    public class UserCS
    {
        #region Properties
        public int User_ID { get; set; }
        public string User_Email { get; set; }
        public string User_Pwd { get; set; }
        public string User_Salt { get; set; }
        public bool Admin_Rights = false;
        #endregion

        #region Constructors
        public UserCS()
        {
            this.User_Salt = CreateSalt();
        }

        public UserCS(int user_id)
        {
            DataTable dt = GetUserByID(user_id);  //match

            if (dt.Rows.Count > 0)
            {
                this.User_ID = (int)dt.Rows[0]["user_id"];
                this.User_Email = dt.Rows[0]["user_email"].ToString();
                this.User_Pwd = dt.Rows[0]["user_pwd"].ToString();
                this.User_Salt = dt.Rows[0]["user_salt"].ToString();
                this.Admin_Rights = (bool)dt.Rows[0]["admin_rights"];
            }
        }
        #endregion

        #region Methods/Functions
        private static DataTable GetUserByID(int user_id)
        {
            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["SE265_BoozeTekConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("user_getbyID", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@user_id", SqlDbType.Int).Value = user_id;

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

        public static bool InsertUser(UserCS sr)
        {
            bool blnSuccess = false;
            SqlConnection cn = new SqlConnection(
            ConfigurationManager.ConnectionStrings["SE265_BoozeTekConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("user_insert", cn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add(
                  "@user_email", SqlDbType.VarChar).Value = sr.User_Email;
            cmd.Parameters.Add(
                "@user_pwd", SqlDbType.VarChar).Value = sr.User_Pwd;
            cmd.Parameters.Add(
                "@user_salt", SqlDbType.VarChar).Value = sr.User_Salt;
            cmd.Parameters.Add(
               "@admin_rights", SqlDbType.Bit).Value = sr.Admin_Rights;

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


        public static string CreateSalt()
        {
            byte[] saltBytes = new byte[16];
            RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider();
            rng.GetBytes(saltBytes);
            return Convert.ToBase64String(saltBytes);
        }

        public static string CreatePasswordHash(string salt, string password)
        {
            string saltAndPwd = string.Concat(salt, password);
            HashAlgorithm hashAlg = new SHA256CryptoServiceProvider();
            byte[] bytValue = System.Text.Encoding.UTF8.GetBytes(saltAndPwd);
            byte[] bytHash = hashAlg.ComputeHash(bytValue);
            return Convert.ToBase64String(bytHash);
        }

        public static bool UpdateUser(UserCS sr)
        {
            bool blnSuccess = false;
            SqlConnection cn = new SqlConnection(
            ConfigurationManager.ConnectionStrings["SE265_BoozeTekConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("User_Update", cn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add(
                  "@user_id", SqlDbType.Int).Value = sr.User_ID;
            cmd.Parameters.Add(
                  "@user_email", SqlDbType.VarChar).Value = sr.User_Email;
            cmd.Parameters.Add(
                "@admin_rights", SqlDbType.Bit).Value = sr.Admin_Rights;

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


        public static bool DeleteUser(UserCS sr)
        {

            bool blnSuccess = false;
            SqlConnection cn = new SqlConnection(
            ConfigurationManager.ConnectionStrings["SE265_BoozeTekConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("User_Delete", cn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add(
                  "@user_id", SqlDbType.Int).Value = sr.User_ID;

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
        #endregion
    }
}