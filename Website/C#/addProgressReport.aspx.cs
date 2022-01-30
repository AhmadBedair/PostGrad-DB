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
    public partial class addGucianProgressReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["WebApplication"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            int serialNumber = 0;
            DateTime date = new DateTime();
            try
            {
                serialNumber = Int16.Parse(TextBox1.Text);
                date = DateTime.Parse(TextBox2.Text);
            }
            catch (Exception ex) {
                MessageBox.Show("Enter Valid Input");
                Response.Redirect("addProgressReport.aspx");
            }
            SqlCommand AddProgressReport = new SqlCommand("AddProgressReport", conn);
            AddProgressReport.CommandType = System.Data.CommandType.StoredProcedure;

            AddProgressReport.Parameters.Add(new SqlParameter("@thesisSerialNo", serialNumber));
            AddProgressReport.Parameters.Add(new SqlParameter("@progressReportDate", date));
            SqlParameter output = AddProgressReport.Parameters.Add("@output", System.Data.SqlDbType.Int);

            output.Direction = System.Data.ParameterDirection.Output;
            conn.Open();
            AddProgressReport.ExecuteNonQuery();
            conn.Close();

            if (output.Value.ToString() == "0")
            {
                MessageBox.Show("Erorr");
            }
            else {
                MessageBox.Show("Added Successfully");
            }

        }
    }
}