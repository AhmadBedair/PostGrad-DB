using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GucianPostGradSystem
{
    public partial class SupervisorHomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Write(Session["user"]);
         


        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
           

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("procViewSupStudentsYears.aspx");

        }

        protected void Button2_Click(object sender, EventArgs e)
        {

            Response.Redirect("procViewAStudentPublications.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("procAddDefense.aspx");

        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("EvaluateProgressReport.aspx");

        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("cancelThesis.aspx");

        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewSuperVisorProfile.aspx");

        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            Response.Redirect("addExaminers.aspx");

        }
    }
}