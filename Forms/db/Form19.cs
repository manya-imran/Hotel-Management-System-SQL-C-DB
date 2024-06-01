using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace db
{
    public partial class Form19 : Form
    {
        DBAccess db = new DBAccess();
        public Form19()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            
            SqlConnection conn = new SqlConnection("Data Source=MANYA\\SQLEXPRESS;Initial Catalog=IL_MARE;Integrated Security=True");
            conn.Open();
            MessageBox.Show("Connection Open");
            SqlCommand cm;
            string ID= textBox7.Text;
            if (ID.Equals(""))
            {
                MessageBox.Show("please enter ID");
            }
            string query =
        "SELECT Customer_ID,Customer_First_Name,Customer_Last_Name,Customer_CNIC,Customer_phone,Mng_ID from Customerr  WHERE Customer_ID = '"+ID+"';";
            cm = new SqlCommand(query, conn);
            cm.ExecuteNonQuery();
            var reader = cm.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(reader);

            customerView.DataSource = dt;

           // cm.Dispose();
            conn.Close();
        }

        private void customerView_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {

            Form16 f16 = new Form16();
            f16.Show();
            this.Hide();
        }
    }
}
