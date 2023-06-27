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
            this.components = new System.ComponentModel.Container();
            this.ARTICULO = new System.Windows.Forms.Label();
            this.PRECIO = new System.Windows.Forms.Label();
            this.CAATEGORIA = new System.Windows.Forms.Label();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.textBox2 = new System.Windows.Forms.TextBox();
            this.textBox3 = new System.Windows.Forms.TextBox();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.button1 = new System.Windows.Forms.Button();
            this.tesystapDataSet6BindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.tesys_tapDataSet6 = new almacen_inventario.tesys_tapDataSet6();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.dbTabla = new System.Windows.Forms.DataGridView();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.textBox4 = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.textBox5 = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.button2 = new System.Windows.Forms.Button();
            this.button3 = new System.Windows.Forms.Button();
            this.textBox6 = new System.Windows.Forms.TextBox();
            this.groupBox4 = new System.Windows.Forms.GroupBox();
            this.txtSeparadorCampos = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.opTitulos = new System.Windows.Forms.CheckBox();
            this.txtSeparador = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.btLeerCSV = new System.Windows.Forms.Button();
            this.bSelFicheroCSV = new System.Windows.Forms.Button();
            this.txtFicheroCSV = new System.Windows.Forms.TextBox();
            this.txtFicheroExportarCSV = new System.Windows.Forms.TextBox();
            this.contextMenuStrip1 = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.txtSeparadorValoresExportar = new System.Windows.Forms.TextBox();
            this.txtSeparadorExportar = new System.Windows.Forms.TextBox();
            this.tesys_tapDataSet8 = new almacen_inventario.tesys_tapDataSet8();
            this.uTILIDADESBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.uTILIDADESTableAdapter = new almacen_inventario.tesys_tapDataSet8TableAdapters.UTILIDADESTableAdapter();
            this.cODIGODataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.pRODUCTODataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.pRECIOBASEDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.mARGENDEGANANCIADataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.pRECIOVENTADataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.uTILIDADDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.mARGENGANANCIADataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.tesystapDataSet6BindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.tesys_tapDataSet6)).BeginInit();
            this.groupBox2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dbTabla)).BeginInit();
            this.groupBox3.SuspendLayout();
            this.groupBox4.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.tesys_tapDataSet8)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.uTILIDADESBindingSource)).BeginInit();
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
            this.groupBox1.Location = new System.Drawing.Point(328, 105);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(260, 84);
            this.groupBox1.TabIndex = 8;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Añadir";
            this.groupBox1.Visible = false;
            // 
            // button1
            // 
            this.button1.Font = new System.Drawing.Font("Constantia", 48F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button1.Location = new System.Drawing.Point(323, 104);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(287, 243);
            this.button1.TabIndex = 9;
            this.button1.Text = "OK";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // tesystapDataSet6BindingSource
            // 
            this.tesystapDataSet6BindingSource.DataSource = this.tesys_tapDataSet6;
            this.tesystapDataSet6BindingSource.Position = 0;
            // 
            // tesys_tapDataSet6
            // 
            this.tesys_tapDataSet6.DataSetName = "tesys_tapDataSet6";
            this.tesys_tapDataSet6.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // groupBox2
            // 
            this.groupBox2.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.groupBox2.Controls.Add(this.dbTabla);
            this.groupBox2.Location = new System.Drawing.Point(-7, -14);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(760, 533);
            this.groupBox2.TabIndex = 17;
            this.groupBox2.TabStop = false;
            // 
            // dbTabla
            // 
            this.dbTabla.AllowUserToOrderColumns = true;
            this.dbTabla.AutoGenerateColumns = false;
            this.dbTabla.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dbTabla.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.cODIGODataGridViewTextBoxColumn,
            this.pRODUCTODataGridViewTextBoxColumn,
            this.pRECIOBASEDataGridViewTextBoxColumn,
            this.mARGENDEGANANCIADataGridViewTextBoxColumn,
            this.pRECIOVENTADataGridViewTextBoxColumn,
            this.uTILIDADDataGridViewTextBoxColumn,
            this.mARGENGANANCIADataGridViewTextBoxColumn});
            this.dbTabla.DataSource = this.uTILIDADESBindingSource;
            this.dbTabla.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dbTabla.Location = new System.Drawing.Point(3, 16);
            this.dbTabla.Name = "dbTabla";
            this.dbTabla.Size = new System.Drawing.Size(754, 514);
            this.dbTabla.TabIndex = 0;
            // 
            // groupBox3
            // 
            this.groupBox3.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.groupBox3.Controls.Add(this.textBox4);
            this.groupBox3.Controls.Add(this.label1);
            this.groupBox3.Controls.Add(this.textBox5);
            this.groupBox3.Controls.Add(this.label4);
            this.groupBox3.Controls.Add(this.button2);
            this.groupBox3.Controls.Add(this.button3);
            this.groupBox3.Controls.Add(this.textBox6);
            this.groupBox3.Location = new System.Drawing.Point(23, 4);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(612, 90);
            this.groupBox3.TabIndex = 3;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "Exportar grid a fichero CSV ";
            this.groupBox3.Visible = false;
            // 
            // textBox4
            // 
            this.textBox4.Location = new System.Drawing.Point(415, 60);
            this.textBox4.Name = "textBox4";
            this.textBox4.Size = new System.Drawing.Size(19, 20);
            this.textBox4.TabIndex = 4;
            this.textBox4.Text = "\"";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(265, 61);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(149, 13);
            this.label1.TabIndex = 6;
            this.label1.Text = "Carácter separador de valores";
            // 
            // textBox5
            // 
            this.textBox5.Location = new System.Drawing.Point(168, 58);
            this.textBox5.Name = "textBox5";
            this.textBox5.Size = new System.Drawing.Size(19, 20);
            this.textBox5.TabIndex = 3;
            this.textBox5.Text = ";";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(15, 61);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(152, 13);
            this.label4.TabIndex = 4;
            this.label4.Text = "Carácter separador de campos";
            // 
            // button2
            // 
            this.button2.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.button2.Location = new System.Drawing.Point(552, 27);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(54, 23);
            this.button2.TabIndex = 2;
            this.button2.Text = "Exportar";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // button3
            // 
            this.button3.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.button3.Location = new System.Drawing.Point(513, 27);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(33, 23);
            this.button3.TabIndex = 1;
            this.button3.Text = "...";
            this.button3.UseVisualStyleBackColor = true;
            this.button3.Click += new System.EventHandler(this.button3_Click);
            // 
            // textBox6
            // 
            this.textBox6.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.textBox6.Location = new System.Drawing.Point(6, 29);
            this.textBox6.Name = "textBox6";
            this.textBox6.Size = new System.Drawing.Size(504, 20);
            this.textBox6.TabIndex = 0;
            // 
            // groupBox4
            // 
            this.groupBox4.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.groupBox4.Controls.Add(this.txtSeparadorExportar);
            this.groupBox4.Controls.Add(this.txtSeparadorCampos);
            this.groupBox4.Controls.Add(this.groupBox3);
            this.groupBox4.Controls.Add(this.txtSeparadorValoresExportar);
            this.groupBox4.Controls.Add(this.label2);
            this.groupBox4.Controls.Add(this.opTitulos);
            this.groupBox4.Controls.Add(this.txtFicheroExportarCSV);
            this.groupBox4.Controls.Add(this.txtSeparador);
            this.groupBox4.Controls.Add(this.label3);
            this.groupBox4.Controls.Add(this.btLeerCSV);
            this.groupBox4.Controls.Add(this.bSelFicheroCSV);
            this.groupBox4.Controls.Add(this.txtFicheroCSV);
            this.groupBox4.Location = new System.Drawing.Point(61, 8);
            this.groupBox4.Name = "groupBox4";
            this.groupBox4.Size = new System.Drawing.Size(612, 90);
            this.groupBox4.TabIndex = 7;
            this.groupBox4.TabStop = false;
            this.groupBox4.Text = "Leer fichero CSV ";
            this.groupBox4.Visible = false;
            // 
            // txtSeparadorCampos
            // 
            this.txtSeparadorCampos.Location = new System.Drawing.Point(435, 64);
            this.txtSeparadorCampos.Name = "txtSeparadorCampos";
            this.txtSeparadorCampos.Size = new System.Drawing.Size(19, 20);
            this.txtSeparadorCampos.TabIndex = 7;
            this.txtSeparadorCampos.Text = "\"";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(285, 65);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(149, 13);
            this.label2.TabIndex = 8;
            this.label2.Text = "Carácter separador de valores";
            // 
            // opTitulos
            // 
            this.opTitulos.AutoSize = true;
            this.opTitulos.Location = new System.Drawing.Point(497, 66);
            this.opTitulos.Name = "opTitulos";
            this.opTitulos.Size = new System.Drawing.Size(273, 17);
            this.opTitulos.TabIndex = 4;
            this.opTitulos.Text = "La primera línea contiene los títulos de las columnas";
            this.opTitulos.UseVisualStyleBackColor = true;
            // 
            // txtSeparador
            // 
            this.txtSeparador.Location = new System.Drawing.Point(188, 64);
            this.txtSeparador.Name = "txtSeparador";
            this.txtSeparador.Size = new System.Drawing.Size(19, 20);
            this.txtSeparador.TabIndex = 3;
            this.txtSeparador.Text = ";";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(35, 67);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(152, 13);
            this.label3.TabIndex = 4;
            this.label3.Text = "Carácter separador de campos";
            // 
            // btLeerCSV
            // 
            this.btLeerCSV.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btLeerCSV.Location = new System.Drawing.Point(552, 27);
            this.btLeerCSV.Name = "btLeerCSV";
            this.btLeerCSV.Size = new System.Drawing.Size(54, 23);
            this.btLeerCSV.TabIndex = 2;
            this.btLeerCSV.Text = "Leer";
            this.btLeerCSV.UseVisualStyleBackColor = true;
            // 
            // bSelFicheroCSV
            // 
            this.bSelFicheroCSV.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.bSelFicheroCSV.Location = new System.Drawing.Point(513, 27);
            this.bSelFicheroCSV.Name = "bSelFicheroCSV";
            this.bSelFicheroCSV.Size = new System.Drawing.Size(33, 23);
            this.bSelFicheroCSV.TabIndex = 1;
            this.bSelFicheroCSV.Text = "...";
            this.bSelFicheroCSV.UseVisualStyleBackColor = true;
            this.bSelFicheroCSV.Click += new System.EventHandler(this.bSelFicheroCSV_Click_1);
            // 
            // txtFicheroCSV
            // 
            this.txtFicheroCSV.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.txtFicheroCSV.Location = new System.Drawing.Point(6, 29);
            this.txtFicheroCSV.Name = "txtFicheroCSV";
            this.txtFicheroCSV.Size = new System.Drawing.Size(504, 20);
            this.txtFicheroCSV.TabIndex = 0;
            // 
            // txtFicheroExportarCSV
            // 
            this.txtFicheroExportarCSV.Location = new System.Drawing.Point(177, 3);
            this.txtFicheroExportarCSV.Name = "txtFicheroExportarCSV";
            this.txtFicheroExportarCSV.Size = new System.Drawing.Size(10, 20);
            this.txtFicheroExportarCSV.TabIndex = 18;
            // 
            // contextMenuStrip1
            // 
            this.contextMenuStrip1.Name = "contextMenuStrip1";
            this.contextMenuStrip1.Size = new System.Drawing.Size(61, 4);
            // 
            // txtSeparadorValoresExportar
            // 
            this.txtSeparadorValoresExportar.Location = new System.Drawing.Point(435, 4);
            this.txtSeparadorValoresExportar.Name = "txtSeparadorValoresExportar";
            this.txtSeparadorValoresExportar.Size = new System.Drawing.Size(11, 20);
            this.txtSeparadorValoresExportar.TabIndex = 20;
            // 
            // txtSeparadorExportar
            // 
            this.txtSeparadorExportar.Location = new System.Drawing.Point(547, 4);
            this.txtSeparadorExportar.Name = "txtSeparadorExportar";
            this.txtSeparadorExportar.Size = new System.Drawing.Size(11, 20);
            this.txtSeparadorExportar.TabIndex = 21;
            // 
            // tesys_tapDataSet8
            // 
            this.tesys_tapDataSet8.DataSetName = "tesys_tapDataSet8";
            this.tesys_tapDataSet8.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // uTILIDADESBindingSource
            // 
            this.uTILIDADESBindingSource.DataMember = "UTILIDADES";
            this.uTILIDADESBindingSource.DataSource = this.tesys_tapDataSet8;
            // 
            // uTILIDADESTableAdapter
            // 
            this.uTILIDADESTableAdapter.ClearBeforeFill = true;
            // 
            // cODIGODataGridViewTextBoxColumn
            // 
            this.cODIGODataGridViewTextBoxColumn.DataPropertyName = "CODIGO";
            this.cODIGODataGridViewTextBoxColumn.HeaderText = "CODIGO";
            this.cODIGODataGridViewTextBoxColumn.Name = "cODIGODataGridViewTextBoxColumn";
            // 
            // pRODUCTODataGridViewTextBoxColumn
            // 
            this.pRODUCTODataGridViewTextBoxColumn.DataPropertyName = "PRODUCTO";
            this.pRODUCTODataGridViewTextBoxColumn.HeaderText = "PRODUCTO";
            this.pRODUCTODataGridViewTextBoxColumn.Name = "pRODUCTODataGridViewTextBoxColumn";
            // 
            // pRECIOBASEDataGridViewTextBoxColumn
            // 
            this.pRECIOBASEDataGridViewTextBoxColumn.DataPropertyName = "PRECIO_BASE";
            this.pRECIOBASEDataGridViewTextBoxColumn.HeaderText = "PRECIO_BASE";
            this.pRECIOBASEDataGridViewTextBoxColumn.Name = "pRECIOBASEDataGridViewTextBoxColumn";
            // 
            // mARGENDEGANANCIADataGridViewTextBoxColumn
            // 
            this.mARGENDEGANANCIADataGridViewTextBoxColumn.DataPropertyName = "MARGEN_DE_GANANCIA";
            this.mARGENDEGANANCIADataGridViewTextBoxColumn.HeaderText = "MARGEN_DE_GANANCIA";
            this.mARGENDEGANANCIADataGridViewTextBoxColumn.Name = "mARGENDEGANANCIADataGridViewTextBoxColumn";
            // 
            // pRECIOVENTADataGridViewTextBoxColumn
            // 
            this.pRECIOVENTADataGridViewTextBoxColumn.DataPropertyName = "PRECIO_VENTA";
            this.pRECIOVENTADataGridViewTextBoxColumn.HeaderText = "PRECIO_VENTA";
            this.pRECIOVENTADataGridViewTextBoxColumn.Name = "pRECIOVENTADataGridViewTextBoxColumn";
            // 
            // uTILIDADDataGridViewTextBoxColumn
            // 
            this.uTILIDADDataGridViewTextBoxColumn.DataPropertyName = "UTILIDAD";
            this.uTILIDADDataGridViewTextBoxColumn.HeaderText = "UTILIDAD";
            this.uTILIDADDataGridViewTextBoxColumn.Name = "uTILIDADDataGridViewTextBoxColumn";
            // 
            // mARGENGANANCIADataGridViewTextBoxColumn
            // 
            this.mARGENGANANCIADataGridViewTextBoxColumn.DataPropertyName = "MARGEN_GANANCIA";
            this.mARGENGANANCIADataGridViewTextBoxColumn.HeaderText = "MARGEN_GANANCIA";
            this.mARGENGANANCIADataGridViewTextBoxColumn.Name = "mARGENGANANCIADataGridViewTextBoxColumn";
            // 
            // inventario
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(745, 519);
            this.Controls.Add(this.groupBox4);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.groupBox1);
            this.Name = "inventario";
            this.Load += new System.EventHandler(this.inventario_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.tesystapDataSet6BindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.tesys_tapDataSet6)).EndInit();
            this.groupBox2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dbTabla)).EndInit();
            this.groupBox3.ResumeLayout(false);
            this.groupBox3.PerformLayout();
            this.groupBox4.ResumeLayout(false);
            this.groupBox4.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.tesys_tapDataSet8)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.uTILIDADESBindingSource)).EndInit();
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
        private System.Windows.Forms.BindingSource tesystapDataSet6BindingSource;
        private tesys_tapDataSet6 tesys_tapDataSet6;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.DataGridView dbTabla;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.TextBox textBox4;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox textBox5;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Button button3;
        private System.Windows.Forms.TextBox textBox6;
        private System.Windows.Forms.GroupBox groupBox4;
        private System.Windows.Forms.TextBox txtSeparadorCampos;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.CheckBox opTitulos;
        private System.Windows.Forms.TextBox txtSeparador;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Button btLeerCSV;
        private System.Windows.Forms.Button bSelFicheroCSV;
        private System.Windows.Forms.TextBox txtFicheroCSV;
        private System.Windows.Forms.TextBox txtFicheroExportarCSV;
        private System.Windows.Forms.ContextMenuStrip contextMenuStrip1;
        private System.Windows.Forms.TextBox txtSeparadorValoresExportar;
        private System.Windows.Forms.TextBox txtSeparadorExportar;
        private tesys_tapDataSet8 tesys_tapDataSet8;
        private System.Windows.Forms.BindingSource uTILIDADESBindingSource;
        private tesys_tapDataSet8TableAdapters.UTILIDADESTableAdapter uTILIDADESTableAdapter;
        private System.Windows.Forms.DataGridViewTextBoxColumn cODIGODataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn pRODUCTODataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn pRECIOBASEDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn mARGENDEGANANCIADataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn pRECIOVENTADataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn uTILIDADDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn mARGENGANANCIADataGridViewTextBoxColumn;
    }
}