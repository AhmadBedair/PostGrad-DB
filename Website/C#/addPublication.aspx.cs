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
    public partial class addPublication : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["WebApplication"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            String title = "";
            DateTime pubDate = new DateTime();
            String host = "";
            String place = "";
            Boolean acc = new bool();
            int serialNumber = 0;
            try
            {
                title = TextBox1.Text;
                pubDate = DateTime.Parse(TextBox2.Text);
                host = TextBox3.Text;
                place = TextBox4.Text;
                acc = CheckBox1.Checked;
                serialNumber = Int16.Parse(TextBox5.Text);
            }
            catch (Exception ex) {
                MessageBox.Show("Enter Valid Input");
                Response.Redirect("addPublication.aspx");
            }

            SqlCommand addPublication = new SqlCommand("addPublication", conn);
            addPublication.CommandType = System.Data.CommandType.StoredProcedure;
            addPublication.Parameters.Add(new SqlParameter("@title", title));
            addPublication.Parameters.Add(new SqlParameter("@pubDate", pubDate));
            addPublication.Parameters.Add(new SqlParameter("@host", host));
            addPublication.Parameters.Add(new SqlParameter("@place", place));
            addPublication.Parameters.Add(new SqlParameter("@accepted", acc));
            SqlParameter pubID = addPublication.Parameters.Add("@pubID", System.Data.SqlDbType.Int);
            pubID.Direction = System.Data.ParameterDirection.Output;

            conn.Open();
            addPublication.ExecuteNonQuery();
            conn.Close();


            SqlCommand linkPubThesis = new SqlCommand("linkPubThesis", conn);
            linkPubThesis.CommandType = System.Data.CommandType.StoredProcedure;
            Response.Write(pubID.Value.ToString());
            linkPubThesis.Parameters.Add(new SqlParameter("@PubID", Int16.Parse(pubID.Value.ToString())));
            linkPubThesis.Parameters.Add(new SqlParameter("@thesisSerialNo", serialNumber));

            conn.Open();
            linkPubThesis.ExecuteNonQuery();
            conn.Close();
        }
    }
}