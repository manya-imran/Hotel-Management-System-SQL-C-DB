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
    public partial class Form5 : Form
    {
        public Form5()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {

            SqlConnection conn = new SqlConnection("Data Source=MANYA\\SQLEXPRESS;Initial Catalog=IL_MARE;Integrated Security=True");
            conn.Open();
            MessageBox.Show("Connection Open");
            SqlCommand cm;
            string Id = textBox3.Text;
            string TIme = textBox2.Text;
            string cUST = textBox1.Text;
            



            string query = "INSERT into Booking(Booking_ID,Booking_time,Cust_ID) VALUES ('" + Id+"', '"+TIme+"', '"+cUST+"');";
            cm = new SqlCommand(query, conn);
            cm.ExecuteNonQuery();
            cm.Dispose();
            conn.Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {

            Form16 f16 = new Form16();
            f16.Show();
            this.Hide();
        }
    }
}
