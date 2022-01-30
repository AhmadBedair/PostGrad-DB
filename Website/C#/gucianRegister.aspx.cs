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
    public partial class gucianRegister : System.Web.UI.Page
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
            String undergradid = null;
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
                undergradid = undergradID.Text;
                GPA = Decimal.Parse(gpa.Text);
                Type = type.Text;
                Faculty = faculty.Text;
            }
            catch (Exception ex) {
                MessageBox.Show("enter Valid input");
                Response.Redirect("gucianRegister.aspx");
            }

            SqlCommand StudentRegisterproc = new SqlCommand("StudentRegister", conn);
            StudentRegisterproc.CommandType = System.Data.CommandType.StoredProcedure;

            StudentRegisterproc.Parameters.Add(new SqlParameter("@first_name", FirstName));
            StudentRegisterproc.Parameters.Add(new SqlParameter("@last_name", LastName));
            StudentRegisterproc.Parameters.Add(new SqlParameter("@password", pass));
            StudentRegisterproc.Parameters.Add(new SqlParameter("@faculty", Faculty));
            StudentRegisterproc.Parameters.Add(new SqlParameter("@Gucian", '1'));
            StudentRegisterproc.Parameters.Add(new SqlParameter("@email", Email));
            StudentRegisterproc.Parameters.Add(new SqlParameter("@address", Address));
            StudentRegisterproc.Parameters.Add(new SqlParameter("@GPA", GPA));
            StudentRegisterproc.Parameters.Add(new SqlParameter("@type", Type));
            StudentRegisterproc.Parameters.Add(new SqlParameter("@undergradID", undergradid));
            SqlParameter output = StudentRegisterproc.Parameters.Add("@output", System.Data.SqlDbType.Int);
            output.Direction = System.Data.ParameterDirection.Output;

            if (FirstName.Length == 0 || LastName.Length == 0 || pass.Length == 0 || Faculty.Length == 0 || Email.Length == 0 || Address.Length == 0 || Type.Length == 0 || undergradid.Length == 0)
            {
                MessageBox.Show("fill the blanks");
            }
            else
            {
                
                    conn.Open();
                    StudentRegisterproc.ExecuteNonQuery();
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