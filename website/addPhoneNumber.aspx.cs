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
    public partial class addPhoneNumber : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void addphone_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["postgradDB"].ToString();
            SqlConnection conn = new SqlConnection(connStr);


            String phone = Phone.Text;
            int id = (int)Session["user"];
            SqlCommand addMobile = new SqlCommand("addMobile", conn);
            addMobile.CommandType = System.Data.CommandType.StoredProcedure;
           
               
                addMobile.Parameters.Add(new SqlParameter("@id", id));
                addMobile.Parameters.Add(new SqlParameter("@mobile_number", phone));
             

           
            
            
            SqlParameter type = addMobile.Parameters.Add("@output", System.Data.SqlDbType.Int);
            type.Direction = System.Data.ParameterDirection.Output;
            int i = 0;
            for (; i < phone.Length; i++)
            {
                if (!(phone[i] >= '0' && phone[i] <= '9'))
                {
                    MessageBox.Show("Please add a valid phone number");
                    break;
                }
            }

            if (i == phone.Length)
            {

                conn.Open();
                addMobile.ExecuteNonQuery();
                conn.Close();

                if (type.Value.ToString() == "1")
                {

                    MessageBox.Show("added successfully");
                    Response.Redirect("addPhoneNumber.aspx");
                }
                else
                {
                    MessageBox.Show("Please add a valid phone number");
                    Phone.Text = "";
                }

            }
            else
            {
                MessageBox.Show("Please add a valid phone number");
                Phone.Text = "";

            }
            
            
        
            
            
            

            
        }
    }
}