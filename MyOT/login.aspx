<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="MyOT.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login in My OT :: Online Banking</title>
    <!-- Meta-Tags -->
    <link rel="icon" href="images/icon.png" type="image/x-icon">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8"> 
    <script>
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
    <!-- //Meta-Tags -->

    <!-- css files -->
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all">
    <link href="css/loginstyle.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/waiting.css" rel="stylesheet" type="text/css" media="all" />
    <!-- //css files -->

    <!-- google fonts -->
    <link href="css/googlefont.css" rel="stylesheet">
    <!-- //google fonts -->

</head>
<body>
    <form id="form1" runat="server">
        <div class="signupform">
            <div class="container">
                <!-- main content -->
                <div class="agile_info">
                    <div class="w3l_form">
                        <div class="left_grid_info">
                            <h1>Manage Your OverTime</h1>
                            <p>Hệ thống khai báo, kết xuất dữ liệu OverTime hàng tháng. Chỉ dành cho nội bộ team Online Banking...</p>
                            <img src="images/image.jpg" alt="" />
                        </div>
                    </div>
                    <div class="w3_info">
                        <h2>Login to your Account</h2>
                        <p>Enter your details to login.</p>
                        <form action="#" method="post">
                            <label>Email Address</label>
                            <div class="input-group">
                                <span class="fa fa-envelope" aria-hidden="true"></span>
                                <input type="email" id="txtEmail" placeholder="Enter Your Email" required="">
                            </div>
                            <label>Password</label>
                            <div class="input-group">
                                <span class="fa fa-lock" aria-hidden="true"></span>
                                <input type="Password" id="txtPasswd" placeholder="Enter Password" required="">
                            </div>
                            <div class="login-check">
                                <label class="checkbox">
                                    <input type="checkbox" name="checkbox" checked=""><i> </i>Remember me</label>
                            </div>
                            <button class="btn btn-danger btn-block" id="btnLogin" type="button">Login</button>
                            <button id="html5Submit" type="submit" style="display: none">LoginHiden</button>
                            <div class="lds-roller" style="display: none">
                                <div></div>
                                <div></div>
                                <div></div>
                                <div></div>
                                <div></div>
                                <div></div>
                                <div></div>
                                <div></div>
                            </div>
                        </form>
                        <p class="account">By clicking login, you agree to our <a href="#">Terms & Conditions!</a></p>
                        <p class="account1">Dont have an account? <a href="#">Register here</a></p>
                    </div>
                </div>
                <!-- //main content -->
            </div>
            <!-- footer -->
            <div class="footer">
                <p>&copy; 2019 My OT. All Rights Reserved | Design by <a href="#" target="blank">Vpbank Online Banking</a></p>
            </div>
            <!-- footer -->
        </div>
    </form>
    <script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
    <script>

        $('#btnLogin').click(function () {

            var txtEmail = $('#txtEmail').val();
            var txtPasswd = $('#txtPasswd').val();

            if (txtEmail == '' || txtPasswd == '') {
                $('#html5Submit').click();
            }
            else {
                $('#btnLogin').hide();
                $('.lds-roller').show();

                $.post('Controler/frmLoginControler', {
                    action: "authen",
                    email: txtEmail,
                    passwd: txtPasswd,
                }, function (e) {
                    console.log(e);
                    var eobj = JSON.parse(e);
                    if (eobj.ResponseCode == '00')
                    {
                        window.location.href = "Default";
                    }
                    else
                    {
                        alert(eobj.ResponseMessage);
                         $('#btnLogin').show();
                         $('.lds-roller').hide();
                    }

                });
            }
        });
    </script>
</body>
</html>
