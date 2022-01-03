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
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        
        protected void registerSuperVisor(object sender, EventArgs e)
        {

            Response.Redirect("registerSuperVisor.aspx");
        }

        protected void registerStudent(object sender, EventArgs e)
        {
            Response.Redirect("registerStudent.aspx");
        }

    }
}