using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GucianPostGradSystem
{
    public partial class registerStudent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void nongucianRegister(object sender, EventArgs e)
        {
            Response.Redirect("nongucianRegister.aspx");
        }

        protected void gucianRegister(object sender, EventArgs e)
        {
            Response.Redirect("gucianRegister.aspx");
        }
    }
}