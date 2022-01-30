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
    public partial class procAddDefense : System.Web.UI.Page
    {
        public object Password1 { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {

          

        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["WebApplication"].ToString();

            SqlConnection conn = new SqlConnection(connStr);
          
            
            int id = Int16.Parse(Session["user"].ToString());
            try
            {

                int thesis1 = Int16.Parse(TextBox1.Text);
                DateTime defenseDate1 =DateTime.Parse( TextBox2.Text);
                String defenseLocation1 = TextBox3.Text;
             
                

            }
            catch(Exception ex)
            {
                MessageBox.Show("Please enter valid inputs");
                Response.Redirect("procAddDefense.aspx");
            }
            int thesis = Int16.Parse(TextBox1.Text);
            DateTime defenseDate = DateTime.Parse(TextBox2.Text);
            String defenseLocation = TextBox3.Text;



            SqlCommand myStudent = new SqlCommand("checkMyStudentUsingSerial", conn);
                myStudent.CommandType = System.Data.CommandType.StoredProcedure;
                myStudent.Parameters.Add(new SqlParameter("@SerialNO", thesis));
                myStudent.Parameters.Add(new SqlParameter("@supid", id));
                SqlParameter student = myStudent.Parameters.Add("@myStudent", System.Data.SqlDbType.Int);
                student.Direction = System.Data.ParameterDirection.Output;
                conn.Open();
                myStudent.ExecuteNonQuery();
                conn.Close();
                if (student.Value.ToString() == "1")
                {
                    MessageBox.Show("You are not a supervisor on this thesis");
                    Response.Redirect("procAddDefense.aspx");
                }



                SqlCommand proc = new SqlCommand("CheckGucianUsingThesis", conn);
                proc.CommandType = System.Data.CommandType.StoredProcedure;
                proc.Parameters.Add(new SqlParameter("@SerialNO", thesis));
                SqlParameter type = proc.Parameters.Add("@out", System.Data.SqlDbType.Int);
                type.Direction = System.Data.ParameterDirection.Output;

                conn.Open();
                proc.ExecuteNonQuery();
                conn.Close();





                if (type.Value.ToString() == "0")
                {
                    SqlCommand proc2 = new SqlCommand("AddDefenseGucian", conn);
                    proc2.CommandType = System.Data.CommandType.StoredProcedure;
                    proc2.Parameters.Add(new SqlParameter("@ThesisSerialNo", thesis));
                    proc2.Parameters.Add(new SqlParameter("@DefenseDate", defenseDate));
                    proc2.Parameters.Add(new SqlParameter("@DefenseLocation", defenseLocation));
                try
                {
                    conn.Open();
                    proc2.ExecuteNonQuery();
                    conn.Close();
                }
                catch (Exception ex2)
                {
                    MessageBox.Show("Defense already exists");
                    Response.Redirect("procAddDefense.aspx");

                }
                MessageBox.Show("Defense added successfuly!");
                Response.Redirect("procAddDefense.aspx");

            }
                else if (type.Value.ToString() == "1")
                {
                    SqlCommand proc3 = new SqlCommand("AddDefenseNonGucian", conn);
                    proc3.CommandType = System.Data.CommandType.StoredProcedure;
                    proc3.Parameters.Add(new SqlParameter("@ThesisSerialNo", thesis));
                    proc3.Parameters.Add(new SqlParameter("@DefenseDate", defenseDate));
                    proc3.Parameters.Add(new SqlParameter("@DefenseLocation", defenseLocation));

                try
                {
                    conn.Open();
                    proc3.ExecuteNonQuery();
                    conn.Close();
                }
                catch (Exception ex3)
                {
                    MessageBox.Show("Defense already exists");
                    Response.Redirect("procAddDefense.aspx");

                }
                MessageBox.Show("Defense added successfuly!");
                Response.Redirect("procAddDefense.aspx");



            }
                

           

            }

        
    }
}