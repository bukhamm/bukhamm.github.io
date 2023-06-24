namespace almacen_inventario
{
    partial class inventario
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
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
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.ARTICULO = new System.Windows.Forms.Label();
            this.PRECIO = new System.Windows.Forms.Label();
            this.CAATEGORIA = new System.Windows.Forms.Label();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.textBox2 = new System.Windows.Forms.TextBox();
            this.textBox3 = new System.Windows.Forms.TextBox();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.button1 = new System.Windows.Forms.Button();
            this.groupBox1.SuspendLayout();
            this.SuspendLayout();
            // 
            // ARTICULO
            // 
            this.ARTICULO.AutoSize = true;
            this.ARTICULO.Location = new System.Drawing.Point(6, 16);
            this.ARTICULO.Name = "ARTICULO";
            this.ARTICULO.Size = new System.Drawing.Size(45, 13);
            this.ARTICULO.TabIndex = 0;
            this.ARTICULO.Text = "Articulo:";
            // 
            // PRECIO
            // 
            this.PRECIO.AutoSize = true;
            this.PRECIO.Location = new System.Drawing.Point(6, 36);
            this.PRECIO.Name = "PRECIO";
            this.PRECIO.Size = new System.Drawing.Size(40, 13);
            this.PRECIO.TabIndex = 1;
            this.PRECIO.Text = "Precio:";
            // 
            // CAATEGORIA
            // 
            this.CAATEGORIA.AutoSize = true;
            this.CAATEGORIA.Location = new System.Drawing.Point(0, 58);
            this.CAATEGORIA.Name = "CAATEGORIA";
            this.CAATEGORIA.Size = new System.Drawing.Size(55, 13);
            this.CAATEGORIA.TabIndex = 2;
            this.CAATEGORIA.Text = "Categoria:";
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(52, 13);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(202, 20);
            this.textBox1.TabIndex = 4;
            // 
            // textBox2
            // 
            this.textBox2.Location = new System.Drawing.Point(52, 33);
            this.textBox2.Name = "textBox2";
            this.textBox2.Size = new System.Drawing.Size(202, 20);
            this.textBox2.TabIndex = 5;
            // 
            // textBox3
            // 
            this.textBox3.Location = new System.Drawing.Point(52, 55);
            this.textBox3.Name = "textBox3";
            this.textBox3.Size = new System.Drawing.Size(202, 20);
            this.textBox3.TabIndex = 6;
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.ARTICULO);
            this.groupBox1.Controls.Add(this.textBox1);
            this.groupBox1.Controls.Add(this.textBox3);
            this.groupBox1.Controls.Add(this.PRECIO);
            this.groupBox1.Controls.Add(this.textBox2);
            this.groupBox1.Controls.Add(this.CAATEGORIA);
            this.groupBox1.Location = new System.Drawing.Point(12, 27);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(260, 84);
            this.groupBox1.TabIndex = 8;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Añadir";
            // 
            // button1
            // 
            this.button1.Font = new System.Drawing.Font("Constantia", 48F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button1.Location = new System.Drawing.Point(80, 133);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(139, 89);
            this.button1.TabIndex = 9;
            this.button1.Text = "OK";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // inventario
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(289, 234);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.groupBox1);
            this.Name = "inventario";
            this.Text = "Agregar a \"Inventario\"";
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Label ARTICULO;
        private System.Windows.Forms.Label PRECIO;
        private System.Windows.Forms.Label CAATEGORIA;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.TextBox textBox2;
        private System.Windows.Forms.TextBox textBox3;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Button button1;
    }
}