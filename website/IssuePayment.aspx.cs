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
    public partial class IssuePayment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Issue_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["postgradDB"].ToString();
            SqlConnection conn = new SqlConnection(connStr);


            SqlCommand AdminIssueThesisPaymentproc = new SqlCommand("AdminIssueThesisPayment", conn);
            AdminIssueThesisPaymentproc.CommandType = System.Data.CommandType.StoredProcedure;
            try
            {
                int serialNumber = Int16.Parse(TextBox2.Text);
                double Amount = Double.Parse(TextBox3.Text);
                int no_Installments = Int16.Parse(TextBox4.Text);
                double fundPercentage = Double.Parse(TextBox5.Text);

                AdminIssueThesisPaymentproc.Parameters.Add("@ThesisSerialNo", serialNumber);
                AdminIssueThesisPaymentproc.Parameters.Add("@amount", Amount);
                AdminIssueThesisPaymentproc.Parameters.Add("@noOfInstallments", no_Installments);
                AdminIssueThesisPaymentproc.Parameters.Add("@fundPercentage", fundPercentage);

                SqlParameter success = AdminIssueThesisPaymentproc.Parameters.Add("@success", System.Data.SqlDbType.Int);
                success.Direction = System.Data.ParameterDirection.Output;

                conn.Open();
                AdminIssueThesisPaymentproc.ExecuteNonQuery();
                conn.Close();

                
              
                    if (success.Value.ToString() == "0")
                    {
                        MessageBox.Show("Inconsistant Data, process failed");
                    }
                    else
                    {
                        MessageBox.Show("Payment issued Successfully");
                    }


            }
            catch (Exception ex){
                MessageBox.Show("enter valid data");
            }

        }
    }
}