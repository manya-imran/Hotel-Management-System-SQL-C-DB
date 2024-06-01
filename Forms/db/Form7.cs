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
    public partial class Form7 : Form
    {
        public Form7()
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
            string type = textBox2.Text;
            decimal chg = numericUpDown1.Value;
            string statuss = "un-paid";
            string recpt = textBox5.Text;

         




            string query = "INSERT into Bill(Bill_ID,Bill_Room_Type,Total_Bill,statuss,Recpt_ID) VALUES ('" + Id + "', '" + type + "', " + chg + " , '"+statuss+ "' , '" + recpt + "');";
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
