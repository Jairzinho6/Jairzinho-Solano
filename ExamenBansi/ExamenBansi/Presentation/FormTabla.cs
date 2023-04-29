using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using ExamenBansi.Models;

namespace ExamenBansi.Presentation
{
    public partial class FormTabla : Form
    {
        private int userVal;

        public int? id;
        FormTabla oformTabla = null;
        public FormTabla(int? id=null)
        {
            InitializeComponent();
            this.id = id;
        }

        private void CargaDatos()
        {
            using (BdiExamenEntities db = new BdiExamenEntities())
            {
                //oformTabla = db.tblExamen.Find(id);
                //idExamen.Text = oformTabla.idExamen;
                //Nombre.Text = oformTabla.Nombre;

            }
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void FormTabla_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            using(BdiExamenEntities db= new BdiExamenEntities())
            {
                tblExamen otblExamen = new tblExamen();
                int userVal = int.Parse(idExamen.Text);
                otblExamen.idExamen = userVal;
                otblExamen.nombre = Nombre.Text;
                otblExamen.descripcion = Descripcion.Text;

                db.tblExamen.Add(otblExamen);
                db.SaveChanges();

                this.Close();
            }
        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {
            
        }
    }
}
