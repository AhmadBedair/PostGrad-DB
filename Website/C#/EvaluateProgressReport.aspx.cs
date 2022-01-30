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
    public partial class EvaluateProgressReport : System.Web.UI.Page
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
                int id = Int16.Parse(Session["user"].ToString());
                int serialNo = Int16.Parse(TextBox1.Text);
                int progressReportNo = Int16.Parse(TextBox2.Text);
                int evaluation = Int16.Parse(TextBox3.Text);





            SqlCommand myStudent = new SqlCommand("checkMyStudentUsingSerial", conn);
            myStudent.CommandType = System.Data.CommandType.StoredProcedure;
            myStudent.Parameters.Add(new SqlParameter("@SerialNO", serialNo));
            myStudent.Parameters.Add(new SqlParameter("@supid",id));
            SqlParameter student = myStudent.Parameters.Add("@myStudent", System.Data.SqlDbType.Int);
            student.Direction = System.Data.ParameterDirection.Output;
            conn.Open();
            myStudent.ExecuteNonQuery();
            conn.Close();
            if (student.Value.ToString() == "1")
            {
                MessageBox.Show("You are not a supervisor on this thesis");
                Response.Redirect("EvaluateProgressReport.aspx");

            }
                
                SqlCommand proc1 = new SqlCommand("checkReportAndItsNo", conn);
                proc1.CommandType = System.Data.CommandType.StoredProcedure;
                proc1.Parameters.Add(new SqlParameter("@serialNO", serialNo));
                proc1.Parameters.Add(new SqlParameter("@ProgressReportNo", progressReportNo));
                SqlParameter output = proc1.Parameters.Add("@out", System.Data.SqlDbType.Int);
                output.Direction = System.Data.ParameterDirection.Output;

                conn.Open();
                proc1.ExecuteNonQuery();
                conn.Close();
                if (output.Value.ToString() == "1")
                {
                    MessageBox.Show("Thesis serial number and progress report number doesnt match");
                    Response.Redirect("EvaluateProgressReport.aspx");
                }







                if (evaluation != 0 && evaluation != 1 && evaluation != 2 && evaluation != 3)
                {
                    MessageBox.Show("The evaluation value should be an Integer between 0 and 3");
                    TextBox1.Text = "";
                    TextBox2.Text = "";
                    TextBox3.Text = "";

                }
                else
                {
                    SqlCommand proc = new SqlCommand("EvaluateProgressReport", conn);
                    proc.CommandType = System.Data.CommandType.StoredProcedure;
                    proc.Parameters.Add(new SqlParameter("@supervisorID", id));
                    proc.Parameters.Add(new SqlParameter("@thesisSerialNo", serialNo));
                    proc.Parameters.Add(new SqlParameter("@progressReportNo", progressReportNo));
                    proc.Parameters.Add(new SqlParameter("@evaluation", evaluation));
                    conn.Open();
                    proc.ExecuteNonQuery();
                    conn.Close();
                    MessageBox.Show("Evaluation was done succesfuly!");
                    TextBox1.Text = "";
                    TextBox2.Text = "";
                    TextBox3.Text = "";
                }
            }
            catch (Exception ex) { };




        }
    }
}