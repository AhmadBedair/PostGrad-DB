using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;

namespace GucianPostGradSystem
{
    public partial class addExaminers : System.Web.UI.Page
    {
        public object Password1 { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["postgradDB"].ToString();

            SqlConnection conn = new SqlConnection(connStr);


            int thesis = Int16.Parse(TextBox1.Text);
            DateTime defenseDate = DateTime.Parse(TextBox2.Text);
            String examinerName = TextBox3.Text;
            String examinerPass = TextBox5.Text;
            String FieldOfWork = TextBox4.Text;
            int nationality = 0;
            if (CheckBox1.Checked)
            {
                nationality = 1;
            }





            SqlCommand proc4 = new SqlCommand("AddExaminer", conn);
            proc4.CommandType = System.Data.CommandType.StoredProcedure;
            proc4.Parameters.Add(new SqlParameter("@ThesisSerialNo", thesis));
            proc4.Parameters.Add(new SqlParameter("@DefenseDate", defenseDate));
            proc4.Parameters.Add(new SqlParameter("@ExaminerName", examinerName));
            proc4.Parameters.Add(new SqlParameter("@Password", examinerPass));
            if (nationality == 0)
            {
                proc4.Parameters.Add(new SqlParameter("@National", '0'));
            }
            else
            {
                proc4.Parameters.Add(new SqlParameter("@National", '1'));

            }
            proc4.Parameters.Add(new SqlParameter("@fieldOfWork", FieldOfWork));
            try
            {
                conn.Open();
                proc4.ExecuteNonQuery();
                conn.Close();
            }
            catch (Exception last)
            {
                MessageBox.Show("Please re check the examiner's info or examiner might be already in this defense");
                Response.Redirect("addExaminers.aspx");
            }
            MessageBox.Show("Examiner added successfuly!");

        }
    }
}