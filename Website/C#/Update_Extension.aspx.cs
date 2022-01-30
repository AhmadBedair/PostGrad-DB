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
    public partial class Update_Extension : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Extend_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["WebApplication"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand AdminUpdateExtensionproc = new SqlCommand("AdminUpdateExtension", conn);
            AdminUpdateExtensionproc.CommandType = System.Data.CommandType.StoredProcedure;
            try
            {
                int SerialNumber = Int16.Parse(TextBox1.Text);

                AdminUpdateExtensionproc.Parameters.Add("@ThesisSerialNo", SerialNumber);

                SqlParameter success = AdminUpdateExtensionproc.Parameters.Add("@success", System.Data.SqlDbType.Int);
                success.Direction = System.Data.ParameterDirection.Output;


                conn.Open();
                AdminUpdateExtensionproc.ExecuteNonQuery();
                conn.Close();

                if (success.Value.ToString() == "0")
                {
                    MessageBox.Show("Inconsistant Data, process failed");
                }
                else
                {
                    MessageBox.Show("Thesis Extended Successfully");
                }


            }
            catch (Exception ex)
            {
                MessageBox.Show("enter valid data");
            }
        }
    }
}