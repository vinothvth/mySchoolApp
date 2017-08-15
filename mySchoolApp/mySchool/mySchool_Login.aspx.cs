using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class mySchool_mySchool_login : System.Web.UI.Page
{

    string strcon = "Server=localhost;Database=myschool;Uid=root;Pwd=;Connect Timeout=30;Allow User Variables=true;convert zero datetime=True;Convert Zero Datetime=True";
    string str;
    MySql.Data.MySqlClient.MySqlCommand com;
    object obj;

    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "Login | mySchoolApp";
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        lblError.Text = string.Empty;
        DataTable dtUser = new DataTable();
        string userSession = Guid.NewGuid().ToString();
        Session["UserSession"] = userSession;
        try
        {
            dtUser = checkUserLogin(userSession, "LOGIN");

            if (dtUser != null )//& dtUser.Rows.Count > 0)
            {
                if (dtUser.Columns.Contains("RES"))
                {
                    lblError.Text = dtUser.Rows[0][0].ToString();
                    ClearPage();
                }
                else
                {
                    Session["UserID"] = dtUser.Rows[0]["UserID"];
                    Session["UserName"] = dtUser.Rows[0]["UserName"];
                    Session["LastLogin"] = dtUser.Rows[0]["LastLogin"];

                    if (string.Equals(dtUser.Rows[0]["IsLogin"].ToString(), "True"))
                    {
                        tblAlert.Visible = true;
                       // tblLogin.Visible = false;
                    }
                    else
                    {
                        Response.Redirect("~/dist/signup.html");
                    }
                }
            }
            else
            {
                ClearPage();
              //  lblErr.Text = "Error";
                lblError.Text = "Unexpected error.";
            }
        }
        catch
        {
            throw;
        }
        finally
        {
            dtUser.Dispose();
        }

    }
    protected void btnOk_Click(object sender, EventArgs e)
    {
        checkUserLogin(Session["UserSession"].ToString(), "CHANGELOGIN");
        Response.Redirect("~/index.html");
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("mySchool_login.aspx");
    }
    #region " [ Private Function ] "  
    private DataTable checkUserLogin(string userSession, string mode)
    {
        DataSet dsData = new DataSet();
        //  SqlConnection sqlCon = null;
        // SqlDataAdapter sqlCmd = null;

        // string constr = ConfigurationManager.ConnectionStrings["strcon"].ConnectionString;

        try
        {
            using (MySqlConnection con = new MySqlConnection(strcon))
            {
                MySqlCommand sqlCmd = new MySqlCommand("USP_UserLogin", con);
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Parameters.AddWithValue("@p_loginID", username.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@p_password", TextBox2.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@p_sessionID", userSession);
                sqlCmd.Parameters.AddWithValue("@p_mode", mode);
                sqlCmd.Parameters.Add("@RES", MySqlDbType.VarChar, 30);
                sqlCmd.Parameters["@RES"].Direction = ParameterDirection.Output;

                con.Open();
                MySqlDataAdapter sqlDataAdapter = new MySqlDataAdapter(sqlCmd);
                sqlDataAdapter.Fill(dsData);
                con.Close();
                String ret_value = sqlCmd.Parameters["@RES"].Value.ToString();
            }
        }
        catch
        {
            throw;
        }
        return dsData.Tables[0];
    }


    private void ClearPage()
    {
        //txtCode.Text = string.Empty;
        TextBox2.Text = string.Empty;
        //txtCode.Text = string.Empty;
       // UpdateCaptchaText();
    }
    #endregion

}