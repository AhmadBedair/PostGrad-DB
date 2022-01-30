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
    public partial class registerSuperVisor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void Submit_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["WebApplication"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            String name = Name.Text;
            String email = Email.Text;
            String pass = Password.Text;
            String faculty = Faculty.Text;

            SqlCommand SuperVisorRegisterproc = new SqlCommand("SupervisorRegister", conn);
            SuperVisorRegisterproc.CommandType = System.Data.CommandType.StoredProcedure;

            SuperVisorRegisterproc.Parameters.Add(new SqlParameter("@name", name));
            SuperVisorRegisterproc.Parameters.Add(new SqlParameter("@email", email));
            SuperVisorRegisterproc.Parameters.Add(new SqlParameter("@password", pass));
            SuperVisorRegisterproc.Parameters.Add(new SqlParameter("@faculty", faculty));
            SqlParameter output = SuperVisorRegisterproc.Parameters.Add("@output", System.Data.SqlDbType.Int);
            output.Direction = System.Data.ParameterDirection.Output;




            if (email.Length == 0 || faculty.Length == 0 || pass.Length == 0 || name.Length == 0)
            {
                MessageBox.Show("Please enter valid inputs");
            }
            else
            {
               
                conn.Open();
                SuperVisorRegisterproc.ExecuteNonQuery();
                conn.Close();
                if (output.Value.ToString() == "1")
                {
                    MessageBox.Show("Email Already exists");

                }
                else
                {
                    SqlCommand proc = new SqlCommand("selectMaxId", conn);
                    proc.CommandType = System.Data.CommandType.StoredProcedure;
                    SqlParameter type = proc.Parameters.Add("@output", System.Data.SqlDbType.Int);
                    type.Direction = System.Data.ParameterDirection.Output;
                    conn.Open();
                    proc.ExecuteNonQuery();
                    conn.Close();
                    MessageBox.Show("Your Id is" + type.Value.ToString());
                    Response.Redirect("login.aspx");
                }
                
                
            }
        }
    }
}