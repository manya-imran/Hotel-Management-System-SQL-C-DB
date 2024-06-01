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
    public partial class Form6 : Form
    {
        public Form6()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection("Data Source=MANYA\\SQLEXPRESS;Initial Catalog=IL_MARE;Integrated Security=True");
            conn.Open();
            MessageBox.Show("Connection Open");
            SqlCommand cm;
            string Id = textBox2.Text;
            string mgr = textBox3.Text;
            decimal CHARGE = numericUpDown1.Value;
            string cust = textBox9.Text;
            string mgr_ID = textBox10.Text;


            string query = "INSERT into Servicee(Service_ID,Service_Type,Service_Charges,Cust_ID,Mng_ID) VALUES ('" + Id+"', '"+mgr+"', "+CHARGE+" , '"+cust+"', '"+mgr_ID+"');";
            cm = new SqlCommand(query, conn);
            cm.ExecuteNonQuery();
            cm.Dispose();
            conn.Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {

            Form17 f17 = new Form17();
            f17.Show();
            this.Hide();
        }
    }
}
