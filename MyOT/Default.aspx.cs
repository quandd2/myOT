using Aspose.Cells;
using MyOT.Controler;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyOT
{
    public partial class Default : System.Web.UI.Page
    {
        protected string FullNameInfo = string.Empty;
        protected DateTime TimeExpDate = DateTime.Now;
        protected string MonthOT = string.Empty;
        protected double HourOver10Percent = 0;
        protected DateTime ExpDate = DateTime.Now;
        protected string Alias = string.Empty;
        private object fileUpload;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                var MySession = Common.GetInfoUserBySession();
                if (MySession == null)
                {
                    Response.Redirect("404.html");
                }

                bool IsEsixtsProgram = GetCurrentOTMonthly(ref  ExpDate, ref   HourOver10Percent);
                divDeclareOT.Visible = IsEsixtsProgram;

                FullNameInfo = MySession.FullName + " (" + MySession.IDStaff + ")";
            }
            catch (Exception ex)
            {
            }
        }
        public bool GetCurrentOTMonthly(ref DateTime ExpDate, ref double HourOver10Percent)
        {
            string AliasDate = DateTime.Now.ToString("yyyyMM");

            MyOT.Model.MyOTModel sql = new Model.MyOTModel();
            var CurrentDate = DateTime.Now;
            var linq = sql.OT_Monthly.Where(c => c.AliasTime == AliasDate && CurrentDate >= c.DateOpen && CurrentDate <= c.ExpDateSubmit).FirstOrDefault();
            if (linq != null)
            {
                HourOver10Percent =  linq.HourOver10Percent.Value;
                ExpDate = linq.ExpDateSubmit.Value;
                Alias = linq.Title;
                return true;
            }
            else
            {
                return false;
            }
        }
        private bool OpenFileExcel(string DataSource ) 
        { 
            string fileName = (fupOT.FileName ?? string.Empty).Trim();

            using (var tream = new BufferedStream(fupOT.PostedFile.InputStream)) 
            {

                Workbook workbook = new Workbook();

                workbook. .Open(tream, FileFormatType.Excel2003);

                var worksheet = workbook.Worksheets[0];



                var maxRow = worksheet.Cells.MaxRow;

                var maxColumn = worksheet.Cells.MaxColumn;

                int TemplateColumnCount = 17;

                string[] TemplateColumnNameList = { "CUS.CIF", "CUS.NAME", "SO.DKKD", "PHAMVIBIEUPHI", "LOAI.PHI", "Cùng Tỉnh/TP",

                        "Không Mua/Bán NT", "Giá trị giao dịch Từ","Giá trị giao dịch Đến","Phí cố định",

                    "% Giá trị giao dịch", "Phí tối thiểu","Phí tối đa","Charge Code","Loại tiền","HIEU.LUC","LOẠI GD ÁP DỤNG\n(copy cột S paste value vào cột này)\nCác dòng #N/A phải xem xét lại cột loại giao dịch"};

                // Check column name

                var minColumn = Math.Min(maxColumn + 1, TemplateColumnCount);

                for (var i = 0; i < minColumn; i++)

                {

                    var columnName = (worksheet.Cells[0, i].StringValue ?? string.Empty).Trim();

                    if (!columnName.Equals(TemplateColumnNameList[i]))

                    {

                        lblError.Text = "Header cột " + (i + 1) + " phải là [" + TemplateColumnNameList[i] + "]";

                        return false;

                    }

                }



                // check data row

                if (maxRow < 1)

                {

                    lblError.Text = "File trống, vui lòng chọn file có dữ liệu";

                    return false;

                }

                dt = workbook.Worksheets[0].Cells.ExportDataTableAsString(0, 0, workbook.Worksheets[0].Cells.MaxRow + 1, workbook.Worksheets[0].Cells.MaxColumn + 1, true);





                // Lấy dữ liệu

                for (int i = 0; i < dt.Rows.Count; i++)

                {

                    B2B_transfer_fee_batch item = new B2B_transfer_fee_batch();



                    item.STT = i + 1;

                    if (dt.Rows[i][0] != null && !string.IsNullOrEmpty(dt.Rows[i][0].ToString()))

                    {

                        item.CustCif = dt.Rows[i][0].ToString();

                    }

                    else

                    {

                        continue;

                    }



                    if (dt.Rows[i][1] != null)

                    {

                        item.CustName = dt.Rows[i][1].ToString();

                    }

                    if (dt.Rows[i][2] != null)

                    {

                        item.SoDKKD = dt.Rows[i][2].ToString();

                    }

                    if (dt.Rows[i][3] != null)

                    {

                        item.PhamViBieuPhi = dt.Rows[i][3].ToString();

                    }

                    if (dt.Rows[i][4] != null)

                    {

                        item.FeeType = dt.Rows[i][4].ToString();

                    }

                    if (dt.Rows[i][5] != null)

                    {

                        item.isSameCity = dt.Rows[i][5].ToString();

                    }

                    if (dt.Rows[i][6] != null)

                    {

                        item.isNotExchangeCcy = dt.Rows[i][6].ToString();

                    }

                    if (dt.Rows[i][7] != null)

                    {

                        item.FromAmt = dt.Rows[i][7].ToString();

                    }

                    if (dt.Rows[i][8] != null)

                    {

                        item.ToAmt = dt.Rows[i][8].ToString();

                    }

                    if (dt.Rows[i][9] != null)

                    {

                        item.FlatAmount = dt.Rows[i][9].ToString();

                    }

                    if (dt.Rows[i][10] != null)

                    {

                        item.percentFee = dt.Rows[i][10].ToString();

                    }

                    if (dt.Rows[i][11] != null)

                    {

                        item.MinFee = dt.Rows[i][11].ToString();

                    }

                    if (dt.Rows[i][12] != null)

                    {

                        item.MaxFee = dt.Rows[i][12].ToString();

                    }

                    if (dt.Rows[i][13] != null)

                    {

                        item.ChargeCode = dt.Rows[i][13].ToString();

                    }

                    if (dt.Rows[i][14] != null)

                    {

                        item.Ccy = dt.Rows[i][14].ToString();

                    }

                    if (dt.Rows[i][15] != null)

                    {

                        item.DateCountDown = dt.Rows[i][15].ToString();

                    }

                    if (dt.Rows[i][16] != null)

                    {

                        item.FkTransferType = dt.Rows[i][16].ToString();

                    }

                    item.OrderMap = $"CustCif:{ item.CustCif}PhamViBieuPhi:{item.PhamViBieuPhi}FkTransferType:{item.FkTransferType}isSameCity{item.isSameCity}isNotExchangeCcy{item.isNotExchangeCcy}";

                    batch.Add(item);

                } 

                return true; 
            } 
        }
        protected void btnUpload_Click(object sender, EventArgs e)
        { 
            try 
            {
                lblError.Text = string.Empty;

                var postedFile = fupOT.PostedFile; 
                if (postedFile != null) 
                { 
                    if (postedFile.ContentLength == 0 || string.IsNullOrEmpty(postedFile.FileName)) 
                    { 
                        //Báo lỗi trong trường hợp file không tồn tại 
                        lblError.Text = "Không tồn tại file"; 
                        return; 
                    }  
                    // Chỉ hỗ trợ đọc file .txt

                    if (!postedFile.FileName.ToLower().EndsWith(".xlsx")) 
                    { 
                        lblError.Text = "Không thể đọc thông tin từ file. Quý khách vui lòng kiểm tra lại định dạng của file hoặc liên hệ với admin để được hỗ trợ";
                         return; 
                    } 
                    else 
                    {

                        int fileExtPos = postedFile.FileName.LastIndexOf("."); 
                        var fileName = postedFile.FileName.Substring(0, fileExtPos);
                         
                        //Check độ dài của tên file

                        if (fileName.Length > 150) 
                        { 
                            lblError.Text = "Tên file dài quá 150 ký tự"; 
                            return; 
                        } 
                        else 
                        { 
                            var pathDirectory = Server.MapPath(@"~\FileUpload\");

                            string strFileName = string.Format("{0}_{1}", Guid.NewGuid().ToString().ToUpper(), fileName + ".xls");

                            //Check độ lớn file

                            string strMaxFile = ConfigurationManager.AppSettings["MaxFileSize"];

                            if (postedFile.ContentLength > int.Parse(strMaxFile) * 1024) 
                            { 
                                lblError.Text = "File có dung lượng không được vượt quá " + strMaxFile + " KB"; 
                                return; 
                            } 
                            else 
                            { 
                                if (!Directory.Exists(pathDirectory)) 
                                { 
                                    Directory.CreateDirectory(pathDirectory); 
                                }

                                fupOT.SaveAs(pathDirectory + strFileName); 
                            } 
                        } 
                    } 
                }  
            } 
            catch (Exception ex) 
            { 
                lblError.Text = ex.Message + "_" + ex.StackTrace;

            }
        }
    }
}