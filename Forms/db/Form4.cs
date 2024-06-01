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
    public partial class Form4 : Form
    {
        public Form4()
        {
            InitializeComponent();
        }

        private void textBox13_TextChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection("Data Source=MANYA\\SQLEXPRESS;Initial Catalog=IL_MARE;Integrated Security=True");
            conn.Open();
            MessageBox.Show("Connection Open");
            SqlCommand cm;
            string ID = textBox4.Text;
            string FName = textBox3.Text;
            string LName = textBox2.Text;
            string shift = textBox1.Text;
            string phone = textBox7.Text;
            decimal bookings = numericUpDown1.Value;
           
            string query = "INSERT into Receptionist(Receptionist_ID,Receptionist_First_Name,Receptionist_Last_Name,Shift_time,Receptionist_phone,No_of_bookings_per_day) VALUES ('" + ID +"', '"+FName+"', '"+LName+"', '"+shift+"', '"+phone+"',"+bookings+");";
            cm = new SqlCommand(query, conn);
            cm.ExecuteNonQuery();
            cm.Dispose();
            conn.Close();
        }

        private void numericUpDown1_ValueChanged(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            Form2 f2 = new Form2();
            f2.Show();
            this.Hide();
        }
    }
}
