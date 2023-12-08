using System;
using System.Data;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace DataBeans
{
    public partial class Form1 : Form
    {
        SqlConnection con = new SqlConnection("Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=DataBeans;Data Source=VIRUS_465");
        SqlCommand cmd = new SqlCommand();
        SqlDataAdapter adapt = new SqlDataAdapter();
        int ID = 0;
        public Form1()
        {
            InitializeComponent();
            ExibirDados();
            LimparDados();

        }
        private void ExibirDados()
        {
            try
            {
                con.Open();
                DataTable dt = new DataTable();
                adapt = new SqlDataAdapter("SELECT * FROM Pessoa", con);
                adapt.Fill(dt);
                dataGridView1.DataSource = dt;
            }
            catch
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }
        private void LimparDados()
        {
            txtNome.Text = "";
            txtDataNascimento.Text = "";
            txtEndereco.Text = "";
            txtTelefone.Text = "";
            txtEmail.Text = "";
            txtTipo.Text = "";
            txtNome.Focus();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            LimparDados();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (txtNome.Text != "" && txtDataNascimento.Text != "" && txtEndereco.Text != "" && txtTelefone.Text != "" && txtEmail.Text != "" && txtTipo.Text != "")
            {
                try
                {
                    con.Open();
                    cmd = new SqlCommand("INSERT INTO Pessoa (Nome, DataNascimento,Endereco,Telefone,Email,TipoEntidade) VALUES (@nome,@dataNascimento,@endereco,@telefone,@email,@tipo)", con);
                    cmd.Parameters.AddWithValue("@nome", txtNome.Text);
                    cmd.Parameters.AddWithValue("@dataNascimento", txtDataNascimento.Text);
                    cmd.Parameters.AddWithValue("@endereco", txtEndereco.Text);
                    cmd.Parameters.AddWithValue("@telefone", txtTelefone.Text);
                    cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@tipo", txtTipo.Text);
                    cmd.ExecuteNonQuery();
                    MessageBox.Show("Registro inserido com sucesso!");
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Erro: " + ex.Message);
                }
                finally
                {
                    con.Close();
                    ExibirDados();
                    LimparDados();
                }
            }
            else
            {
                MessageBox.Show("Preencha todos os campos");
            }
        }
        private void button3_Click(object sender, EventArgs e)
        {
            if (txtNome.Text != "" && txtDataNascimento.Text != "" && txtEndereco.Text != "" && txtTelefone.Text != "" && txtEmail.Text != "" && txtTipo.Text != "")
            {
                try
                {
                    con.Open();
                    cmd = new SqlCommand("UPDATE Pessoa SET Nome = @nome, DataNascimento = @dataNascimento, Endereco = @endereco, Telefone = @telefone, Email = @email, TipoEntidade = @tipo WHERE ID = @id", con);
                    cmd.Parameters.AddWithValue("@id", ID);
                    cmd.Parameters.AddWithValue("@nome", txtNome.Text);
                    cmd.Parameters.AddWithValue("@dataNascimento", txtDataNascimento.Text);
                    cmd.Parameters.AddWithValue("@endereco", txtEndereco.Text);
                    cmd.Parameters.AddWithValue("@telefone", txtTelefone.Text);
                    cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@tipo", txtTipo.Text);
                    cmd.ExecuteNonQuery();
                    MessageBox.Show("Registro atualizado com sucesso!");
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Erro: " + ex.Message);
                }
                finally
                {
                    con.Close();
                    ExibirDados();
                    LimparDados();
                }
            }
            else
            {
                MessageBox.Show("Preencha todos os campos");
            }
        }

        private void button4_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                cmd = new SqlCommand("DELETE FROM Pessoa WHERE ID = @id", con);
                cmd.Parameters.AddWithValue("@id", ID);
                int rowsAffected = cmd.ExecuteNonQuery();

                if (rowsAffected > 0)
                {
                    MessageBox.Show("Registro excluído com sucesso!");
                }
                else
                {
                    MessageBox.Show("Nenhum registro foi excluído. Verifique o ID.");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Erro ao excluir registro: " + ex.Message);
            }
            finally
            {
                con.Close();
                ExibirDados();
            }
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                DataGridViewRow row = dataGridView1.Rows[e.RowIndex];
                txtNome.Text = row.Cells["Nome"].Value.ToString();
                txtDataNascimento.Text = row.Cells["DataNascimento"].Value.ToString();
                txtEndereco.Text = row.Cells["Endereco"].Value.ToString();
                txtTelefone.Text = row.Cells["Telefone"].Value.ToString();
                txtEmail.Text = row.Cells["Email"].Value.ToString();
                txtTipo.Text = row.Cells["TipoEntidade"].Value.ToString();
                ID = Convert.ToInt32(row.Cells["ID"].Value);
            }
        }
    }

}
