using MyOT.Controler;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyOT
{
    public partial class listOT : System.Web.UI.Page
    {
        protected string FullNameInfo = string.Empty;
        protected DateTime TimeExpDate = DateTime.Now;
        protected string MonthOT = string.Empty;
        protected double HourOver10Percent = 0;
        protected DateTime ExpDate = DateTime.Now;
        protected string Alias = string.Empty;
        protected int ID_Monthly = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                var MySession = Common.GetInfoUserBySession();
                if (MySession == null)
                {
                    Response.Redirect("404.html");
                }

                bool IsEsixtsProgram = GetCurrentOTMonthly(ref ExpDate, ref HourOver10Percent, ref ID_Monthly); 
                 
            }
            catch (Exception ex)
            {
            }
        }
        public void GetListOT(int ID_Monthly)
        {
            using (var sql = new Model.MyOTModel())
            {
                var allData =  sql.OT_History.Where(c => c.Status == 2 & c.ID_OT_Monthly == ID_Monthly).ToList();
                if(allData != null)
                {
                    var listOtDown = allData.Where(c => c.FlagOver10 == 0).OrderBy(c=>c.DateInit).ToList();
                    if(listOtDown != null)
                    {
                        rptOTListDown.DataSource = listOtDown;
                        rptOTListDown.DataBind();
                    }

                    var listOtUp = allData.Where(c => c.FlagOver10 == 1).OrderBy(c => c.DateInit).ToList();
                    if (listOtUp != null)
                    {
                        rptOTListUp.DataSource = listOtUp;
                        rptOTListUp.DataBind();
                    }

                }
            }
        }
        public bool GetCurrentOTMonthly( ref DateTime ExpDate, ref double HourOver10Percent, ref int ID_Monthly)
        {
            string AliasDate = DateTime.Now.ToString("yyyyMM");

            MyOT.Model.MyOTModel sql = new Model.MyOTModel();
            var CurrentDate = DateTime.Now;
            var linq = sql.OT_Monthly.Where(c => c.AliasTime == AliasDate && CurrentDate >= c.DateOpen && CurrentDate <= c.ExpDateSubmit).FirstOrDefault();
            if (linq != null)
            {
                HourOver10Percent = linq.HourOver10Percent.Value;
                ExpDate = linq.ExpDateSubmit.Value;
                Alias = linq.Title;
                ID_Monthly = linq.ID_OT_Monthly;
                return true;
            }
            else
            {
                AliasDate = DateTime.Now.AddMonths(-1).ToString("yyyyMM");
                linq = sql.OT_Monthly.Where(c => c.AliasTime == AliasDate).FirstOrDefault();
                if (linq != null)
                {
                    HourOver10Percent = linq.HourOver10Percent.Value;
                    ExpDate = linq.ExpDateSubmit.Value;
                    Alias = linq.Title;
                    ID_Monthly = linq.ID_OT_Monthly;
                    return true;
                }
                return false;
            }
        }
    }
}