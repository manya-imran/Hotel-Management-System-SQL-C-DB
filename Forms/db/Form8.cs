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
    public partial class Form8 : Form
    {
        public Form8()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Form16 f16 = new Form16();
            f16.Show();
            this.Hide();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection("Data Source=MANYA\\SQLEXPRESS;Initial Catalog=IL_MARE;Integrated Security=True");
            conn.Open();
            MessageBox.Show("Connection Open");
            SqlCommand cm;
            string Id = textBox5.Text;
            string IN = textBox4.Text;
            string OUT = textBox3.Text;
            string cust = textBox7.Text;



            string query = "INSERT into Checkout(Checkout_ID,Check_in_date,Check_out_date ,Cust_ID) VALUES ('" + Id + "', '" + IN + "', " + OUT + " , '" + cust + "');";
            cm = new SqlCommand(query, conn);
            cm.ExecuteNonQuery();
            cm.Dispose();
            conn.Close();
        }
    }
}
