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
    public partial class nongucianRegister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submit_Click(object sender, EventArgs e)
        { 
            string connStr = WebConfigurationManager.ConnectionStrings["WebApplication"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            String FirstName = null;
            String LastName = null;
            String Email = null;
            String pass = null;
            String Address = null;
            Decimal GPA = 0;
            String Type = null;
            String Faculty = null;

            try
            {
                FirstName = firstName.Text;
                LastName = lastName.Text;
                Email = email.Text;
                pass = Password.Text;
                Address = address.Text;
                GPA = Decimal.Parse(gpa.Text);
                Type = type.Text;
                Faculty = faculty.Text;
            }
            catch (Exception ex)
            {
                MessageBox.Show("enter Valid input");
                Response.Redirect("nongucianRegister.aspx");
            }


            SqlCommand NonStudentRegisterproc = new SqlCommand("StudentRegister", conn);
            NonStudentRegisterproc.CommandType = System.Data.CommandType.StoredProcedure;
           
            NonStudentRegisterproc.Parameters.Add(new SqlParameter("@first_name", FirstName));
            NonStudentRegisterproc.Parameters.Add(new SqlParameter("@last_name", LastName));
            NonStudentRegisterproc.Parameters.Add(new SqlParameter("@password", pass));
            NonStudentRegisterproc.Parameters.Add(new SqlParameter("@faculty", Faculty));
            NonStudentRegisterproc.Parameters.Add(new SqlParameter("@Gucian", '0'));
            NonStudentRegisterproc.Parameters.Add(new SqlParameter("@email", Email));
            NonStudentRegisterproc.Parameters.Add(new SqlParameter("@address", Address));
            NonStudentRegisterproc.Parameters.Add(new SqlParameter("@GPA", GPA));
            NonStudentRegisterproc.Parameters.Add(new SqlParameter("@type", Type));
            NonStudentRegisterproc.Parameters.Add(new SqlParameter("@undergradID", ""));
            SqlParameter output = NonStudentRegisterproc.Parameters.Add("@output", System.Data.SqlDbType.Int);
            output.Direction = System.Data.ParameterDirection.Output;

            if (FirstName.Length == 0 || LastName.Length == 0 || pass.Length == 0 || Faculty.Length == 0 || Email.Length == 0 || Address.Length == 0 || Type.Length == 0)
            {
                MessageBox.Show("fill the blanks");
            }
            else
            {
               
                conn.Open();
                NonStudentRegisterproc.ExecuteNonQuery();
                conn.Close();
                if (output.Value.ToString() == "1")
                {
                    MessageBox.Show("Email already exists");

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