using MyOT.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace MyOT.Controler
{
    public class Common
    {
       public const string SessionUserID = "SessionUserID";
       public static string Sha256Hash(string rawData)
        {
            // Create a SHA256   
            using (SHA256 sha256Hash = SHA256.Create())
            { 
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(rawData)); 
                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                {
                    builder.Append(bytes[i].ToString("x2"));
                }
                return builder.ToString();
            }
        }
        public static User GetInfoUserBySession()
        {
            try
            {
                return System.Web.HttpContext.Current.Session[Common.SessionUserID] as User;
            }
            catch
            {
                return null;

            }
        }
        public static string ConvertToString(object T)
        {
            if (T != null)
            {
                return T.ToString();
            }
            else
            {
                return string.Empty;
            }
        } 

        public static void FeedBackClient(string msg)
        {
            HttpContext.Current.Response.Write(msg);
            HttpContext.Current.Response.Flush();
            HttpContext.Current.Response.End();
        }
    }
}