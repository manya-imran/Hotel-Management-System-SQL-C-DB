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
    public partial class Form2 : Form
    {
        public Form2()
        {
            InitializeComponent();
        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            Form4 f4 = new Form4();
            f4.Show();
            this.Hide();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Form18 f18 = new Form18();
            f18.Show();
            this.Hide();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Form14 f14 = new Form14();
            f14.Show();
            this.Hide();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection("Data Source=MANYA\\SQLEXPRESS;Initial Catalog=IL_MARE;Integrated Security=True");
            string ID = textBox7.Text;
            SqlDataAdapter sqa = new SqlDataAdapter("Select count(*) from Manager where Manager_ID = '"+ID+"';",conn);
            DataTable dt = new DataTable();
            sqa.Fill(dt);

            if(dt.Rows[0][0].ToString() == "1")
            {
                MessageBox.Show("continue");
            }
            else
            {
                MessageBox.Show("please enter correct ID");
            }
        }
    }
}
