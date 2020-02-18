using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyOT.Controler
{
    public partial class frmLoginControler : System.Web.UI.Page
    {
        private string action = string.Empty;
        protected string MyResponse = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {

            action =Common.ConvertToString(Request.Form["action"]);
            switch(action)
            {
                case "authen":
                    var email = Common.ConvertToString(Request.Form["email"]);
                    var passwd = Common.ConvertToString(Request.Form["passwd"]);
                   Common.FeedBackClient(LoginForm(email, passwd));
                    break;
                default:
                    Response.Redirect("/404.html");
                    break;
            }
        }

        private string LoginForm(string email, string passwd)
        {
            OjectLoginRs rs = new OjectLoginRs();
            string cacheName = "blockUser" + email;
            if (Cache[cacheName] != null && Convert.ToInt32(Cache[cacheName]) >= 4)
            {
                rs.ResponseCode = ResponseCode.fail;
                rs.ResponseMessage = "Tài khoản của bạn đã bị khóa do truy cập sai quá nhiều lần. Hãy thử lại sau 10 phút...";
                return JsonConvert.SerializeObject(rs);
            }
            string Response = string.Empty;
            MyOT.Model.MyOTModel sql = new Model.MyOTModel();
            string passwdHash = Common.Sha256Hash(passwd);
            var linq = sql.Users.Where(c => c.Password == passwdHash && c.Status == 2 && c.Email == email).FirstOrDefault();
            if (linq != null)
            { 
                rs.ResponseCode = ResponseCode.success;
                rs.ResponseMessage = ResponseCode.success;
                Session[Common.SessionUserID] = linq;
                var result = JsonConvert.SerializeObject(linq);
                Cache.Remove(cacheName); 
               return JsonConvert.SerializeObject(rs);
            }
            else
            {
                var CountFail = Convert.ToInt32(Cache[cacheName]) + 1;
                Cache.Insert(cacheName, CountFail, null, DateTime.MaxValue, TimeSpan.FromMinutes(10));
                rs.ResponseCode = ResponseCode.fail;
                rs.ResponseMessage = "Sai username/Password hãy thử lại...";
                return JsonConvert.SerializeObject(rs);
            }
        }
    }
    public class ResponseCode
    {
        public const string success = "00";
        public const string fail = "01"; 
    }
    public class OjectLoginRs
    { 
        private string responseCode;
        private string responseMessage; 
        public string ResponseCode { get => responseCode; set => responseCode = value; }
        public string ResponseMessage { get => responseMessage; set => responseMessage = value; }
    }
}