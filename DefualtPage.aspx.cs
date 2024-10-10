using System;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace Prototype_University_IS_
{
    public partial class DefualtPage : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAnnouncements();
            }
        }

        private void LoadAnnouncements()
        {
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\45979\\OneDrive\\Documents\\New folder\\Prototype(University IS)\\App_Data\\University Information System DataBase.mdf\";Integrated Security=True";
            string query = "SELECT Title, Content FROM AnnouncementByAdminTable";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                //AnnouncementsRepeater.DataSource = reader;
                //AnnouncementsRepeater.DataBind();
            }
        }

        protected void btnApplyNow_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ApplicationPage.aspx");
        }
    }
}