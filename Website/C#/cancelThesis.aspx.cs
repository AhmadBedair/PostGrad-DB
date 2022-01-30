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
    public partial class cancelThesis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["WebApplication"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            try
            {
                int serialNO1 = Int16.Parse(TextBox1.Text);
            }
            catch (Exception ex)
            {
                MessageBox.Show("PLease enter valid inputs!");
                Response.Redirect("cancelThesis.aspx");
            }
              int serialNO = Int16.Parse(TextBox1.Text);


                SqlCommand thesisCheck = new SqlCommand("CheckThesisExistance", conn);
                thesisCheck.CommandType = System.Data.CommandType.StoredProcedure;
                thesisCheck.Parameters.Add(new SqlParameter("@SerialNO", serialNO));
                SqlParameter existance = thesisCheck.Parameters.Add("@Existance", System.Data.SqlDbType.Int);
                existance.Direction = System.Data.ParameterDirection.Output;
                conn.Open();
                thesisCheck.ExecuteNonQuery();
                conn.Close();
                if (existance.Value.ToString() == "1")
                {
                    MessageBox.Show("The thesis is alrady not in the system");
                    Response.Redirect("cancelThesis.aspx");

                }
            int id = Int16.Parse(Session["user"].ToString());

            SqlCommand myStudent = new SqlCommand("checkMyStudentUsingSerial", conn);
            myStudent.CommandType = System.Data.CommandType.StoredProcedure;
            myStudent.Parameters.Add(new SqlParameter("@SerialNO", serialNO));
            myStudent.Parameters.Add(new SqlParameter("@supid",id));
            SqlParameter student = myStudent.Parameters.Add("@myStudent", System.Data.SqlDbType.Int);
            student.Direction = System.Data.ParameterDirection.Output;
            conn.Open();
            myStudent.ExecuteNonQuery();
            conn.Close();
            if (student.Value.ToString() == "1")
            {
                MessageBox.Show("You are not a supervisor on this thesis");
                Response.Redirect("cancelThesis.aspx");

            }

                    SqlCommand proc = new SqlCommand("checkProgressReport", conn);
                    proc.CommandType = System.Data.CommandType.StoredProcedure;
                    proc.Parameters.Add(new SqlParameter("@ThesisSerialNo", serialNO));
                    SqlParameter type = proc.Parameters.Add("@out", System.Data.SqlDbType.Int);
                    type.Direction = System.Data.ParameterDirection.Output;
                    conn.Open();
                    proc.ExecuteNonQuery();


                    conn.Close();
                    if (type.Value.ToString() == "1")
                    {
                        MessageBox.Show("The last Progress report's grade is not ZERO");
                        Response.Redirect("cancelThesis.aspx");

            }
                    else
                    {
                        SqlCommand proc2 = new SqlCommand("CancelThesis", conn);
                        proc2.CommandType = System.Data.CommandType.StoredProcedure;
                        proc2.Parameters.Add(new SqlParameter("@ThesisSerialNo", serialNO));
                        conn.Open();
                        proc2.ExecuteNonQuery();
                        conn.Close();
                        MessageBox.Show("The thesis has been deleted succefuly");
                        Response.Redirect("cancelThesis.aspx");
            }
                
            
           
        }
    }
}