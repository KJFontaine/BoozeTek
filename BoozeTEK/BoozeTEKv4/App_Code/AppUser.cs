using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Security.Cryptography;

namespace BoozeTEKv4
{
    public class AppUser
    {
        #region Properties
        public int User_ID { get; set; }
        public string User_Email { get; set; }
        public string Salt { get; set; }
        public string HashedPassword { get; set; }
        public byte Admin_Rights { get; set; }
        public bool ValidLogin { get; set; }
        #endregion

        #region Constructors
        public AppUser()
        {
            this.Salt = CreateSalt();
        }

        public AppUser(string email)
        {
            DataTable dt = GetUser(email);

            if (dt.Rows.Count > 0)
            {
                this.User_ID = (int)dt.Rows[0]["User_ID"];
                this.User_Email = dt.Rows[0]["User_Email"].ToString();
                this.Salt = dt.Rows[0]["User_Salt"].ToString();
                this.HashedPassword = dt.Rows[0]["User_Pwd"].ToString();
                this.Admin_Rights = Convert.ToByte(dt.Rows[0]["Admin_Rights"]);
                this.ValidLogin = false;
            }
        }
        #endregion

        #region Methods
        private static string CreateSalt()
        {
            byte[] saltBytes = new byte[16];
            RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider();
            rng.GetBytes(saltBytes);
            return Convert.ToBase64String(saltBytes);
        }

        private static string CreatePasswordHash(string salt, string password)
        {
            string saltAndPwd = string.Concat(salt, password);
            HashAlgorithm hashAlg = new SHA256CryptoServiceProvider();
            byte[] bytValue = System.Text.Encoding.UTF8.GetBytes(saltAndPwd);
            byte[] bytHash = hashAlg.ComputeHash(bytValue);
            return Convert.ToBase64String(bytHash);
        }

        private static DataTable GetUser(string email)
        {
            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["SE265_BoozeTekConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("Users_GetByEmail", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter pUserEmail = new SqlParameter("@User_Email", SqlDbType.VarChar, 50);
            pUserEmail.Value = email;
            cmd.Parameters.Add(pUserEmail);
            DataTable dt = new DataTable();

            try
            {
                cn.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
            }
            catch (Exception ex)
            {

            }
            finally
            {
                cn.Close();
            }

            return dt;
        }

        public static AppUser Login(string email, string password)
        {
            AppUser au = new AppUser(email);
            string testPassword = UserCS.CreatePasswordHash(au.Salt, password);

            if (au.HashedPassword == testPassword)
            {
                au.ValidLogin = true;
            }
            else
            {
                au.ValidLogin = false;
            }

            return au;
        }
        #endregion
    }
}
