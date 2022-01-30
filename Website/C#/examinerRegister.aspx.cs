using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GucianPostGradSystem
{
    public partial class examinerRegister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["WebApplication"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            String email = Email.Text;
            String pass = Password.Text;
            String name = Name.Text;
            String filedOfWork = FieldOfWork.Text;
            bool national = National.Checked;
   
           

            SqlCommand ExaminerRegisterProc = new SqlCommand("ExaminerRegister", conn);
            ExaminerRegisterProc.CommandType = System.Data.CommandType.StoredProcedure;

            ExaminerRegisterProc.Parameters.Add(new SqlParameter("@email", email));
            ExaminerRegisterProc.Parameters.Add(new SqlParameter("@password", pass));
            ExaminerRegisterProc.Parameters.Add(new SqlParameter("@name", name));
            ExaminerRegisterProc.Parameters.Add(new SqlParameter("@fieldOfWork", filedOfWork));
            if (national)
            {
                ExaminerRegisterProc.Parameters.Add(new SqlParameter("@ISNational", '1'));
                conn.Open();
                ExaminerRegisterProc.ExecuteNonQuery();
                conn.Close();
                Response.Redirect("login.aspx");

            }
            else
            {
                ExaminerRegisterProc.Parameters.Add(new SqlParameter("@ISNational", '0'));
                conn.Open();
                ExaminerRegisterProc.ExecuteNonQuery();
                conn.Close();
                Response.Redirect("login.aspx");
            }
            

           

        }

       
    }
}