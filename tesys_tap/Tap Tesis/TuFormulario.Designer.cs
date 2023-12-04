namespace TuProyecto
{
    partial class TuFormulario
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
            this.components = new System.ComponentModel.Container();
            this.Archivo = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.agregarToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.mSGToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.convertirToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.aJsonToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.aMSGToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.button1 = new System.Windows.Forms.Button();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.button2 = new System.Windows.Forms.Button();
            this.button3 = new System.Windows.Forms.Button();
            this.Archivo.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // Archivo
            // 
            this.Archivo.AllowDrop = true;
            this.Archivo.ImeMode = System.Windows.Forms.ImeMode.Hiragana;
            this.Archivo.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.agregarToolStripMenuItem,
            this.convertirToolStripMenuItem});
            this.Archivo.LayoutStyle = System.Windows.Forms.ToolStripLayoutStyle.HorizontalStackWithOverflow;
            this.Archivo.Name = "Archivo";
            this.Archivo.RenderMode = System.Windows.Forms.ToolStripRenderMode.Professional;
            this.Archivo.Size = new System.Drawing.Size(117, 48);
            this.Archivo.Text = "Archivo";
            // 
            // agregarToolStripMenuItem
            // 
            this.agregarToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.mSGToolStripMenuItem});
            this.agregarToolStripMenuItem.Name = "agregarToolStripMenuItem";
            this.agregarToolStripMenuItem.Size = new System.Drawing.Size(116, 22);
            this.agregarToolStripMenuItem.Text = "Agregar";
            // 
            // mSGToolStripMenuItem
            // 
            this.mSGToolStripMenuItem.Name = "mSGToolStripMenuItem";
            this.mSGToolStripMenuItem.Size = new System.Drawing.Size(67, 22);
            // 
            // convertirToolStripMenuItem
            // 
            this.convertirToolStripMenuItem.Name = "convertirToolStripMenuItem";
            this.convertirToolStripMenuItem.Size = new System.Drawing.Size(116, 22);
            // 
            // aJsonToolStripMenuItem
            // 
            this.aJsonToolStripMenuItem.Name = "aJsonToolStripMenuItem";
            this.aJsonToolStripMenuItem.Size = new System.Drawing.Size(32, 19);
            // 
            // aMSGToolStripMenuItem
            // 
            this.aMSGToolStripMenuItem.Name = "aMSGToolStripMenuItem";
            this.aMSGToolStripMenuItem.Size = new System.Drawing.Size(32, 19);
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(12, 12);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(75, 23);
            this.button1.TabIndex = 1;
            this.button1.Text = "Abrir";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.btnAgregar_Click);
            // 
            // pictureBox1
            // 
            this.pictureBox1.BackgroundImage = global::almacen_inventario.Properties.Resources.image;
            this.pictureBox1.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.pictureBox1.Location = new System.Drawing.Point(389, -1);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(512, 452);
            this.pictureBox1.TabIndex = 2;
            this.pictureBox1.TabStop = false;
            // 
            // button2
            // 
            this.button2.Font = new System.Drawing.Font("SimSun", 48F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button2.Location = new System.Drawing.Point(45, 125);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(287, 78);
            this.button2.TabIndex = 3;
            this.button2.Text = "A Json";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.btnToJson_Click);
            // 
            // button3
            // 
            this.button3.Font = new System.Drawing.Font("SimSun", 48F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button3.Location = new System.Drawing.Point(45, 240);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(287, 78);
            this.button3.TabIndex = 4;
            this.button3.Text = "A MSG";
            this.button3.UseVisualStyleBackColor = true;
            this.button3.Click += new System.EventHandler(this.btnToMSG_Click);
            // 
            // TuFormulario
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.button3);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.button1);
            this.Name = "TuFormulario";
            this.Text = "MSG <=> Json";
 
            this.Archivo.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.ContextMenuStrip Archivo;
        private System.Windows.Forms.ToolStripMenuItem agregarToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem mSGToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem convertirToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem aJsonToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem aMSGToolStripMenuItem;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Button button3;
    }
}