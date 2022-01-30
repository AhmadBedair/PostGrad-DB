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
    public partial class EditExInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void editInfo_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["WebApplication"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            //Label approved = new Label();
            //approved.Text = "Profile Edited";

            String email = Email.Text;
            String password = Password.Text;
            String name = Name.Text;
            String fow = FOW.Text;

            SqlCommand editExProfileproc = new SqlCommand("editExProfile", conn);
            editExProfileproc.CommandType = System.Data.CommandType.StoredProcedure;
            try
            {

                editExProfileproc.Parameters.Add(new SqlParameter("@Exid", Session["user"]));
                editExProfileproc.Parameters.Add(new SqlParameter("@name", name));
                editExProfileproc.Parameters.Add(new SqlParameter("@fieldOfWork", fow));
                editExProfileproc.Parameters.Add(new SqlParameter("@password", password));
                editExProfileproc.Parameters.Add(new SqlParameter("@email", email));


                SqlParameter success = editExProfileproc.Parameters.Add("@success", System.Data.SqlDbType.Int);

                success.Direction = System.Data.ParameterDirection.Output;

                conn.Open();
                editExProfileproc.ExecuteNonQuery();
                conn.Close();
                if (email.Length == 0 || password.Length == 0 || name.Length == 0 || fow.Length == 0)
                {
                    MessageBox.Show("Enter valid data");
                }

                else
                {
                    if (success.Value.ToString() == "0")
                    {
                        MessageBox.Show("Already used Mail");
                    }
                    else
                    {
                        MessageBox.Show("Edit Done Successfully");
                    }
                }
            }catch(Exception x)
            {
                MessageBox.Show("Enter valid data");
            }



        }

        protected void back_Click(object sender, EventArgs e)
        {
            Response.Redirect("ExHomePage.aspx");
        }
    }
}