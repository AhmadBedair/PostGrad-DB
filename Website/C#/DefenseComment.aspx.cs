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
    public partial class DefenseComment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AddComment_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["WebApplication"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
                SqlCommand AddCommentsGrade = new SqlCommand("AddCommentsGrade", conn);
                AddCommentsGrade.CommandType = System.Data.CommandType.StoredProcedure;
            try
            {
                String comment = ExDefenseComment.Text;
                String date = DefenseDate.Text;
                String serialNo = ThesisSerialno.Text;
                int sno = Int16.Parse(serialNo);


                


                AddCommentsGrade.Parameters.Add(new SqlParameter("@Exid", Session["user"]));
                AddCommentsGrade.Parameters.Add(new SqlParameter("@DefenseDate", date));
                AddCommentsGrade.Parameters.Add(new SqlParameter("@comments", comment));
                AddCommentsGrade.Parameters.Add(new SqlParameter("@ThesisSerialNo", sno));

                SqlParameter success = AddCommentsGrade.Parameters.Add("@success", System.Data.SqlDbType.Int);

                success.Direction = System.Data.ParameterDirection.Output;
                conn.Open();
                AddCommentsGrade.ExecuteNonQuery();
                conn.Close();
                if (comment.Length == 0 || date.Length == 0 || serialNo.Length == 0 )
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
                        MessageBox.Show("Comment added Successfully");
                    }
                }
                
            
            } catch (Exception ex) {
                MessageBox.Show("invalid inputs");
                }
            

        }

        protected void back_Click(object sender, EventArgs e)
        {
            Response.Redirect("ExHomePage.aspx");
        }
    }
}