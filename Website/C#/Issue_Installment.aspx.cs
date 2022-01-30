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
    public partial class Issue_Installment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Issue_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["WebApplication"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand AdminIssueInstallPaymentproc = new SqlCommand("AdminIssueInstallPayment", conn);
            AdminIssueInstallPaymentproc.CommandType = System.Data.CommandType.StoredProcedure;
            try
            {
                int payment_id = Int16.Parse(TextBox1.Text);
                string date = TextBox2.Text;

                AdminIssueInstallPaymentproc.Parameters.Add("@paymentID", payment_id);
                AdminIssueInstallPaymentproc.Parameters.Add("@InstallStartDate", date);

                SqlParameter success = AdminIssueInstallPaymentproc.Parameters.Add("@success", System.Data.SqlDbType.Int);
                success.Direction = System.Data.ParameterDirection.Output;

                conn.Open();
                AdminIssueInstallPaymentproc.ExecuteNonQuery();
                conn.Close();


                if (success.Value.ToString() == "0")
                {
                    MessageBox.Show("Inconsistant Data, process failed");
                }
                else
                {
                    MessageBox.Show("Installment issued Successfully");
                }

            }
            catch (Exception ex)
            {
                MessageBox.Show("enter valid data");
            }
        }
    }
}