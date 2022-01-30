using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;

namespace WebApplication
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Submit_Click(object sender, EventArgs e)
        {
           
            string connStr = WebConfigurationManager.ConnectionStrings["WebApplication"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int id = 0;
            String password = "";

            try
            {
                id = Int16.Parse(ID.Text);
                password = Password.Text;

            }
            catch (Exception ex) {

                MessageBox.Show("insert info");
                Response.Redirect("login.aspx");
            }

            SqlCommand loginproc = new SqlCommand("userLogin", conn);
            loginproc.CommandType = System.Data.CommandType.StoredProcedure;

            loginproc.Parameters.Add(new SqlParameter("@id", id));
            loginproc.Parameters.Add(new SqlParameter("@password", password));

            SqlParameter success = loginproc.Parameters.Add("@Success", System.Data.SqlDbType.Int);

            success.Direction = System.Data.ParameterDirection.Output;
            conn.Open();
            loginproc.ExecuteNonQuery();
            conn.Close();




            SqlCommand checkId = new SqlCommand("checkId", conn);
            checkId.CommandType = System.Data.CommandType.StoredProcedure;
            checkId.Parameters.Add(new SqlParameter("@id", id));
            SqlParameter type = checkId.Parameters.Add("@output", System.Data.SqlDbType.Int);
            type.Direction = System.Data.ParameterDirection.Output;


            conn.Open();
            checkId.ExecuteNonQuery();
            conn.Close();

            if (success.Value.ToString() == "1")
            {
                Session["user"] = id;

                if (type.Value.ToString() == "0")
                {
                    Response.Redirect("GucianHome.aspx");

                }
                else if (type.Value.ToString() == "1")
                {
                    Response.Redirect("NonGucianHome.aspx");
                }
                else if (type.Value.ToString() == "2")
                {
                    Response.Redirect("SuperVisorHomePage.aspx");
                }
                else if (type.Value.ToString() == "3")
                {
                    Response.Redirect("Admin_Home_Page.aspx");
                }
                else if (type.Value.ToString() == "4")
                {
                    Response.Redirect("ExHomePage.aspx");
                }
                else {
                    MessageBox.Show("Not Found");
                }
            }
            else
            {
                MessageBox.Show("Password may be incorrect or ID");
            }
            
           
        }
    }
}