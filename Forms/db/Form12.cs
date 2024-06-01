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
    public partial class Form12 : Form
    {
        public Form12()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection("Data Source=MANYA\\SQLEXPRESS;Initial Catalog=IL_MARE;Integrated Security=True");
            conn.Open();
            MessageBox.Show("Connection Open");
            SqlCommand cm;
            string Id = textBox4.Text;
            string mgr = textBox3.Text;
            string issue = textBox5.Text;



            
            string query = "INSERT into  Complaints(Cust_ID,Mng_ID,Issue_encountered) VALUES('" + Id+"', '"+mgr+"','"+issue+"');";
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
