<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MyOT.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My Overtime :: Online Banking</title>
    <!-- Meta-Tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
    <link rel="icon" href="images/icon.png" type="image/x-icon">
    <script>
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }

        function resizeIframe(obj) {
            obj.style.height = obj.contentWindow.document.documentElement.scrollHeight + 'px';
        }
    </script>
    <!-- //Meta-Tags -->
    <!-- css files -->
    <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
    <!-- Style-CSS -->
    <link rel="stylesheet" href="css/jquery.countdown.css" />
    <!-- Countdown-CSS -->
    <!-- web-fonts -->
    <link href="//fonts.googleapis.com/css?family=Source+Sans+Pro:200,200i,300,300i,400,400i,600,600i,700,700i,900,900i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese" rel="stylesheet">
    <!-- //web-fonts -->
</head>
<body>
    <form id="form1" runat="server">
        <div class="video-w3l" data-vide-bg="video/1"  id="divDeclareOT" runat="server">
            <div class="agile">
                <div class="container">
                    <h1>My Overtime</h1>

                    <div class="clear-loading spinner">
                        <span></span>
                    </div>

                    <div class="wthree-info">
                        <h2><%= Alias %></h2>
                        <p>Hệ thống sẽ tự động đóng lại và không tiếp nhận OT khi đồng hồ đếm ngược kết thúc.</p>
                    </div>
                    <!--timer-->
                    <div class="examples">
                        <div class="simply-countdown-losange" id="simply-countdown-losange"></div>
                        <div class="clear"></div>
                    </div>
                    <!--//timer-->

                    <!--newsletter-->
                    <div class="newsletter">
                        <h2>Họ và Tên: <%= FullNameInfo %></h2>
                        <form action="#" method="post" class="newsletter">
                            <asp:FileUpload CssClass="email" ID="fupOT" accept=".xlsx" runat="server" />  
                            <asp:Button CssClass="submit" runat="server" ID="btnUpload" Text="Gửi file" OnClick="btnUpload_Click" />
                        </form>

                    </div>
                    <!--//newsletter-->
                    <!--copyright-->
                    <div class="copy w3ls">
                        <p> <asp:Label ID="lblError" runat="server"></asp:Label></p>
                        <p>File OT được export từ hệ thống SAP; Hệ thống sẽ tự động update đè OT nếu bạn có sự thay đổi; chi tiết bên dưới...  </p>
                    </div>
                    <!--//copyright-->
                </div>
            </div>
        </div>
        <div>
            <iframe src="/listOT" frameborder="0" scrolling="no" style="width: 100%" onload="resizeIframe(this)"></iframe>
        </div>
        <div style="text-align:center;  background:#eee; height:50px; padding-top:10px !important">
            <p>© 2019 MyOT version 1.0.0 . All Rights Reserved  | Dev by: <a>Vpbank Online Banking</a> </p>
        </div>
        <style>
            .newsletter .email:hover {
                cursor: pointer;
            }

            .newsletter input[type="file"] {
                padding: 13px 15px;
                border: 2px solid #fff;
                width: 100%;
                box-sizing: border-box;
                text-align: left;
                font-size: 15px;
                color: #fff;
                background-color: transparent;
                outline: none;
                letter-spacing: 2px;
                border-radius: 0px;
                -ms-border-radius: 0px;
                -o-border-radius: 0px;
                -moz-border-radius: 0px;
                -webkit-border-radius: 0px;
                font-family: 'Source Sans Pro', sans-serif;
            }
        </style>
        <!-- js -->
        <script src="js/jquery-2.1.4.min.js"></script>
        <script src="js/jquery.vide.min.js"></script>
        <!-- //js -->

        <!-- Countdown-Timer-JavaScript -->
        <script src="js/simplyCountdown.js"></script>
        <!-- easy to customize -->
        <script>
            $('#simply-countdown-losange').simplyCountdown({
                year: <%= ExpDate.Year %>,
                month: <%= ExpDate.Month %>,
                day: <%= ExpDate.Day %>,
                hour: <%= ExpDate.Hour %>,
                minute: <%= ExpDate.Minute %>,
                second: <%= ExpDate.Second %>
            });
        </script>
        <!-- //Countdown-Timer-JavaScript -->
    </form>
</body>
</html>
