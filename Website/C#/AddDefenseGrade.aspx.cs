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
    public partial class AddDefenseGrade : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AddGrade_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["WebApplication"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand AddDefenseGradeproc = new SqlCommand("AddDefenseGrade", conn);
            AddDefenseGradeproc.CommandType = System.Data.CommandType.StoredProcedure;


            try
            {
                String DDDate = DDate.Text;
                String grade = Dgrade.Text;
                int ff = Int16.Parse(serialNo.Text);
               




                AddDefenseGradeproc.Parameters.Add(new SqlParameter("@Exid", Session["user"]));
                AddDefenseGradeproc.Parameters.Add(new SqlParameter("@ThesisSerialNo", ff));
                AddDefenseGradeproc.Parameters.Add(new SqlParameter("@DefenseDate", DDDate));
                AddDefenseGradeproc.Parameters.Add(new SqlParameter("@grade", grade));


                SqlParameter success = AddDefenseGradeproc.Parameters.Add("@success", System.Data.SqlDbType.Int);

                success.Direction = System.Data.ParameterDirection.Output;

                conn.Open();
                AddDefenseGradeproc.ExecuteNonQuery();
                conn.Close();

                if (DDDate.Length == 0 || grade.Length == 0)
                {
                    MessageBox.Show("Enter valid data");
                }
                else
                {
                    if (success.Value.ToString() == "0")
                    {
                        MessageBox.Show("No Access to Such Defense, process failed");
                    }
                    else
                    {
                        MessageBox.Show("Grade added Successfully");
                    }
                }




            }
            catch(Exception exp) {
                MessageBox.Show("Enter valid data");

            }



        }

        protected void back_Click(object sender, EventArgs e)
        {
            Response.Redirect("ExHomePage.aspx");
        }
    }
}