namespace DataBeans
{
    partial class Form1
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            label1 = new Label();
            label2 = new Label();
            txtNome = new TextBox();
            txtDataNascimento = new TextBox();
            label3 = new Label();
            txtEndereco = new TextBox();
            label4 = new Label();
            txtTelefone = new TextBox();
            label5 = new Label();
            txtEmail = new TextBox();
            label6 = new Label();
            txtTipo = new TextBox();
            label7 = new Label();
            button1 = new Button();
            button2 = new Button();
            button3 = new Button();
            button4 = new Button();
            dataGridView1 = new DataGridView();
            ((System.ComponentModel.ISupportInitialize)dataGridView1).BeginInit();
            SuspendLayout();
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.Font = new Font("Segoe UI", 20.25F, FontStyle.Bold, GraphicsUnit.Point);
            label1.ForeColor = Color.Blue;
            label1.Location = new Point(260, 9);
            label1.Name = "label1";
            label1.Size = new Size(265, 37);
            label1.TabIndex = 0;
            label1.Text = "Página de Cadastro";
            // 
            // label2
            // 
            label2.AutoSize = true;
            label2.Font = new Font("Segoe UI", 9.75F, FontStyle.Regular, GraphicsUnit.Point);
            label2.Location = new Point(89, 76);
            label2.Name = "label2";
            label2.Size = new Size(105, 17);
            label2.TabIndex = 1;
            label2.Text = "Nome Completo";
            // 
            // txtNome
            // 
            txtNome.Location = new Point(89, 96);
            txtNome.Name = "txtNome";
            txtNome.Size = new Size(472, 23);
            txtNome.TabIndex = 2;
            // 
            // txtDataNascimento
            // 
            txtDataNascimento.Location = new Point(89, 142);
            txtDataNascimento.Name = "txtDataNascimento";
            txtDataNascimento.Size = new Size(472, 23);
            txtDataNascimento.TabIndex = 4;
            // 
            // label3
            // 
            label3.AutoSize = true;
            label3.Font = new Font("Segoe UI", 9.75F, FontStyle.Regular, GraphicsUnit.Point);
            label3.Location = new Point(89, 122);
            label3.Name = "label3";
            label3.Size = new Size(127, 17);
            label3.TabIndex = 3;
            label3.Text = "Data de Nascimento";
            // 
            // txtEndereco
            // 
            txtEndereco.Location = new Point(89, 188);
            txtEndereco.Name = "txtEndereco";
            txtEndereco.Size = new Size(472, 23);
            txtEndereco.TabIndex = 6;
            // 
            // label4
            // 
            label4.AutoSize = true;
            label4.Font = new Font("Segoe UI", 9.75F, FontStyle.Regular, GraphicsUnit.Point);
            label4.Location = new Point(89, 168);
            label4.Name = "label4";
            label4.Size = new Size(63, 17);
            label4.TabIndex = 5;
            label4.Text = "Endereço";
            // 
            // txtTelefone
            // 
            txtTelefone.Location = new Point(89, 234);
            txtTelefone.Name = "txtTelefone";
            txtTelefone.Size = new Size(472, 23);
            txtTelefone.TabIndex = 8;
            // 
            // label5
            // 
            label5.AutoSize = true;
            label5.Font = new Font("Segoe UI", 9.75F, FontStyle.Regular, GraphicsUnit.Point);
            label5.Location = new Point(89, 214);
            label5.Name = "label5";
            label5.Size = new Size(57, 17);
            label5.TabIndex = 7;
            label5.Text = "Telefone";
            // 
            // txtEmail
            // 
            txtEmail.Location = new Point(89, 280);
            txtEmail.Name = "txtEmail";
            txtEmail.Size = new Size(472, 23);
            txtEmail.TabIndex = 10;
            // 
            // label6
            // 
            label6.AutoSize = true;
            label6.Font = new Font("Segoe UI", 9.75F, FontStyle.Regular, GraphicsUnit.Point);
            label6.Location = new Point(89, 260);
            label6.Name = "label6";
            label6.Size = new Size(44, 17);
            label6.TabIndex = 9;
            label6.Text = "E-mail";
            // 
            // txtTipo
            // 
            txtTipo.Location = new Point(89, 326);
            txtTipo.Name = "txtTipo";
            txtTipo.Size = new Size(472, 23);
            txtTipo.TabIndex = 12;
            // 
            // label7
            // 
            label7.AutoSize = true;
            label7.Font = new Font("Segoe UI", 9.75F, FontStyle.Regular, GraphicsUnit.Point);
            label7.Location = new Point(89, 306);
            label7.Name = "label7";
            label7.Size = new Size(137, 17);
            label7.TabIndex = 11;
            label7.Text = "Funcionário ou Cliente";
            // 
            // button1
            // 
            button1.BackColor = Color.PaleTurquoise;
            button1.Location = new Point(612, 136);
            button1.Name = "button1";
            button1.Size = new Size(84, 37);
            button1.TabIndex = 13;
            button1.Text = "Limpar";
            button1.UseVisualStyleBackColor = false;
            button1.Click += button1_Click;
            // 
            // button2
            // 
            button2.BackColor = Color.LightGreen;
            button2.Location = new Point(612, 182);
            button2.Name = "button2";
            button2.Size = new Size(84, 37);
            button2.TabIndex = 14;
            button2.Text = "Salvar";
            button2.UseVisualStyleBackColor = false;
            button2.Click += button2_Click;
            // 
            // button3
            // 
            button3.BackColor = Color.Gold;
            button3.Location = new Point(612, 228);
            button3.Name = "button3";
            button3.Size = new Size(84, 37);
            button3.TabIndex = 15;
            button3.Text = "Editar";
            button3.UseVisualStyleBackColor = false;
            button3.Click += button3_Click;
            // 
            // button4
            // 
            button4.BackColor = Color.Coral;
            button4.Location = new Point(612, 274);
            button4.Name = "button4";
            button4.Size = new Size(84, 37);
            button4.TabIndex = 16;
            button4.Text = "Deletar";
            button4.UseVisualStyleBackColor = false;
            button4.Click += button4_Click;
            // 
            // dataGridView1
            // 
            dataGridView1.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dataGridView1.Location = new Point(89, 391);
            dataGridView1.Name = "dataGridView1";
            dataGridView1.RowTemplate.Height = 25;
            dataGridView1.Size = new Size(607, 177);
            dataGridView1.TabIndex = 17;
            dataGridView1.CellContentClick += dataGridView1_CellContentClick;
            // 
            // Form1
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(800, 605);
            Controls.Add(dataGridView1);
            Controls.Add(button4);
            Controls.Add(button3);
            Controls.Add(button2);
            Controls.Add(button1);
            Controls.Add(txtTipo);
            Controls.Add(label7);
            Controls.Add(txtEmail);
            Controls.Add(label6);
            Controls.Add(txtTelefone);
            Controls.Add(label5);
            Controls.Add(txtEndereco);
            Controls.Add(label4);
            Controls.Add(txtDataNascimento);
            Controls.Add(label3);
            Controls.Add(txtNome);
            Controls.Add(label2);
            Controls.Add(label1);
            Name = "Form1";
            Text = "Form1";
            ((System.ComponentModel.ISupportInitialize)dataGridView1).EndInit();
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private Label label1;
        private Label label2;
        private TextBox txtNome;
        private TextBox txtDataNascimento;
        private Label label3;
        private TextBox txtEndereco;
        private Label label4;
        private TextBox txtTelefone;
        private Label label5;
        private TextBox txtEmail;
        private Label label6;
        private TextBox txtTipo;
        private Label label7;
        private Button button1;
        private Button button2;
        private Button button3;
        private Button button4;
        private DataGridView dataGridView1;
    }
}
