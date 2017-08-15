<%@ Page Language="C#" AutoEventWireup="true" CodeFile="mySchool_Login.aspx.cs" Inherits="mySchool_mySchool_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
        <meta http-equiv="x-ua-compatible" content="ie=edge"/>
        <title> ModularAdmin - Free Dashboard Theme | HTML Version </title>
        <meta name="description" content=""/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <link rel="apple-touch-icon" href="apple-touch-icon.png"/>
        <!-- Place favicon.ico in the root directory -->
        <link rel="stylesheet" href="dist/css/vendor.css" type="text/css"/>
    <link rel="stylesheet" href="dist/css/validationEngine.jquery.css" type="text/css"/>
    <link rel="stylesheet" href="dist/css/template.css" type="text/css"/>
        <!-- Theme initialization -->
        <script>
            var themeSettings = (localStorage.getItem('themeSettings')) ? JSON.parse(localStorage.getItem('themeSettings')) :
            {};
            var themeName = themeSettings.themeName || '';
            if (themeName)
            {
                document.write('<link rel="stylesheet" id="themestyle1" href="dist/css/app-' + themeName + '.css">');
            }
            else
            {
                document.write('<link rel="stylesheet" id="themestyle2" href="dist/css/app.css">');
            }
        </script>
    
</head>
<body>
    <div class="auth">
            <div class="auth-container">
                <div class="card">
                    <header class="auth-header">
                        <h1 class="auth-title">
                            <div class="logo"> <span class="l l1"></span> <span class="l l2"></span> <span class="l l3"></span> <span class="l l4"></span> <span class="l l5"></span> </div> mySchoolApp </h1>
                    </header>
                    <div class="auth-content">
                        <p class="text-xs-center">LOGIN TO CONTINUE</p>
    <form id="login_form" runat="server">
    <div class="form-group"> <label for="username">Username</label> <asp:TextBox ID="username" class="validate[required],custom[username] form-control underlined" name="username" placeholder="Your email address" runat="server" ></asp:TextBox> </div>
    <div class="form-group"> <label for="password">Password</label> <asp:TextBox ID="TextBox2" TextMode="Password" class="validate[required],custom[password] form-control underlined" name="password" placeholder="Your password" runat="server"></asp:TextBox> </div>
     <div class="form-group"> <asp:Label ID="lblError" runat="server" Text="Label"></asp:Label>
            <!--<input class="checkbox" id="remember" type="checkbox"> 
            <span>Remember me</span--> <a href="reset.html" class="forgot-btn pull-right">Forgot password?</a> </div>
                            <div class="form-group"> <asp:Button ID="Button1" type="submit" runat="server" class="btn btn-block btn-primary" Text="Login" OnClick="Button1_Click"/></div>
                            <!--<div class="form-group">
                                <p class="text-muted text-xs-center">Do not have an account? <a href="signup.html">Sign Up!</a></p>
                            </div>-->

        <table id="tblAlert" runat="server" width="40%" border="0" cellpadding="0" cellspacing="4"  
        style="background-color: #cecece;" align="center" visible="false">  
        <tr>  
            <td align="center">  
                This user is already logged in. Do you want to terminate other active session.  
            </td>  
        </tr>  
        <tr>  
            <td align="center">  
                <asp:Button ID="btnOk" runat="server" Text="OK" class="btn btn-block btn-primary" OnClick="btnOk_Click" />  
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" class="btn btn-block btn-primary" OnClick="btnCancel_Click" />  
            </td>  
        </tr>  
    </table>  
    </form>
                        </div>
                </div>
               <!-- <div class="text-xs-center"> <a href="index.html" class="btn btn-secondary rounded btn-sm">
      <i class="fa fa-arrow-left"></i> Back to dashboard
    </a> </div>-->
            </div>
        </div>
        <!-- Reference block for JS -->
        <div class="ref" id="ref">
            <div class="color-primary"></div>
            <div class="chart">
                <div class="color-primary"></div>
                <div class="color-secondary"></div>
            </div>
        </div>
        <script src="dist/js/vendor.js"></script>
        <script src="dist/js/app.js"></script>

    <script src="dist/js/jquery-1.6.min.js" type="text/javascript"></script>
<script src="dist/js/jquery.validationEngine-en.js" type="text/javascript" charset="utf-8"></script>
<script src="dist/js/jquery.validationEngine.js" type="text/javascript" charset="utf-8"></script>

    <script type="text/javascript">
jQuery(document).ready(function() {
    jQuery("#login_form").validationEngine();
});
</script>
     
</body>
</html>
