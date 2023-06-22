namespace Instalador_de_la_Traduccion_Yakuza_6
{
    partial class Form1
    {
        /// <summary>
        /// Variable del diseñador requerida.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Limpiar los recursos que se estén utilizando.
        /// </summary>
        /// <param name="disposing">true si los recursos administrados se deben desechar; false en caso contrario.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Código generado por el Diseñador de Windows Forms

        /// <summary>
        /// Método necesario para admitir el Diseñador. No se puede modificar
        /// el contenido del método con el editor de código.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.label1 = new System.Windows.Forms.Label();
            this.ps3_folder_path = new System.Windows.Forms.TextBox();
            this.partool_path_button = new System.Windows.Forms.Button();
            this.install_trad = new System.Windows.Forms.Button();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.label4 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.radioButton2 = new System.Windows.Forms.RadioButton();
            this.radioButton1 = new System.Windows.Forms.RadioButton();
            this.boton_para_desechar = new System.Windows.Forms.Button();
            this.btnDownload = new System.Windows.Forms.Button();
            this.progressBar = new System.Windows.Forms.ProgressBar();
            this.label2 = new System.Windows.Forms.Label();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.dataGridView2 = new System.Windows.Forms.DataGridView();
            this.tesys_tapDataSet1 = new almacen_inventario.tesys_tapDataSet1();
            this.tesystapDataSet1BindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.entradasBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.entradasTableAdapter = new almacen_inventario.tesys_tapDataSet1TableAdapters.EntradasTableAdapter();
            this.cODIGODataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.aRTICULODataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.fECHADataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.cANTIDADDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dataGridView3 = new System.Windows.Forms.DataGridView();
            this.tesys_tapDataSet2 = new almacen_inventario.tesys_tapDataSet2();
            this.pRODUCTOSBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.pRODUCTOSTableAdapter = new almacen_inventario.tesys_tapDataSet2TableAdapters.PRODUCTOSTableAdapter();
            this.cODIGODataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.aRTICULODataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.eNTRADASDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.sALIDASDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.sTOCKDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.label5 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.dataGridView4 = new System.Windows.Forms.DataGridView();
            this.tesys_tapDataSet3 = new almacen_inventario.tesys_tapDataSet3();
            this.salidasBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.salidasTableAdapter = new almacen_inventario.tesys_tapDataSet3TableAdapters.SalidasTableAdapter();
            this.cODIGODataGridViewTextBoxColumn2 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.aRTICULODataGridViewTextBoxColumn2 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.fECHADataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.cANTIDADDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.label7 = new System.Windows.Forms.Label();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView2)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.tesys_tapDataSet1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.tesystapDataSet1BindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.entradasBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView3)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.tesys_tapDataSet2)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pRODUCTOSBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView4)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.tesys_tapDataSet3)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.salidasBindingSource)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 28);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(0, 13);
            this.label1.TabIndex = 0;
            // 
            // ps3_folder_path
            // 
            this.ps3_folder_path.Location = new System.Drawing.Point(44, 2);
            this.ps3_folder_path.Name = "ps3_folder_path";
            this.ps3_folder_path.Size = new System.Drawing.Size(10, 20);
            this.ps3_folder_path.TabIndex = 1;
            this.ps3_folder_path.Visible = false;
            // 
            // partool_path_button
            // 
            this.partool_path_button.Location = new System.Drawing.Point(57, 2);
            this.partool_path_button.Name = "partool_path_button";
            this.partool_path_button.Size = new System.Drawing.Size(28, 23);
            this.partool_path_button.TabIndex = 2;
            this.partool_path_button.Text = "...";
            this.partool_path_button.UseVisualStyleBackColor = true;
            this.partool_path_button.Visible = false;
            this.partool_path_button.Click += new System.EventHandler(this.partool_path_button_Click);
            // 
            // install_trad
            // 
            this.install_trad.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.install_trad.Location = new System.Drawing.Point(2, 1);
            this.install_trad.Name = "install_trad";
            this.install_trad.Size = new System.Drawing.Size(10, 11);
            this.install_trad.TabIndex = 3;
            this.install_trad.Text = "Cerrar";
            this.install_trad.UseVisualStyleBackColor = true;
            this.install_trad.Visible = false;
            this.install_trad.Click += new System.EventHandler(this.install_trad_Click);
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.label4);
            this.groupBox1.Controls.Add(this.label3);
            this.groupBox1.Controls.Add(this.progressBar);
            this.groupBox1.Controls.Add(this.radioButton2);
            this.groupBox1.Controls.Add(this.radioButton1);
            this.groupBox1.Location = new System.Drawing.Point(2, 12);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(27, 10);
            this.groupBox1.TabIndex = 8;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Seleccione su version del juego";
            this.groupBox1.Visible = false;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(34, 56);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(0, 13);
            this.label4.TabIndex = 14;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(37, 31);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(0, 13);
            this.label3.TabIndex = 11;
            // 
            // radioButton2
            // 
            this.radioButton2.AutoSize = true;
            this.radioButton2.Location = new System.Drawing.Point(20, 54);
            this.radioButton2.Name = "radioButton2";
            this.radioButton2.Size = new System.Drawing.Size(17, 16);
            this.radioButton2.TabIndex = 10;
            this.radioButton2.TabStop = true;
            this.radioButton2.UseVisualStyleBackColor = true;
            this.radioButton2.CheckedChanged += new System.EventHandler(this.radioButton2_CheckedChanged);
            // 
            // radioButton1
            // 
            this.radioButton1.AutoSize = true;
            this.radioButton1.Location = new System.Drawing.Point(20, 31);
            this.radioButton1.Name = "radioButton1";
            this.radioButton1.Size = new System.Drawing.Size(17, 16);
            this.radioButton1.TabIndex = 9;
            this.radioButton1.TabStop = true;
            this.radioButton1.UseVisualStyleBackColor = true;
            this.radioButton1.CheckedChanged += new System.EventHandler(this.radioButton1_CheckedChanged);
            // 
            // boton_para_desechar
            // 
            this.boton_para_desechar.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.boton_para_desechar.Location = new System.Drawing.Point(12, 12);
            this.boton_para_desechar.Name = "boton_para_desechar";
            this.boton_para_desechar.Size = new System.Drawing.Size(10, 10);
            this.boton_para_desechar.TabIndex = 9;
            this.boton_para_desechar.Text = "Instalar Traduccion";
            this.boton_para_desechar.UseVisualStyleBackColor = true;
            this.boton_para_desechar.Visible = false;
            this.boton_para_desechar.Click += new System.EventHandler(this.button1_Click);
            // 
            // btnDownload
            // 
            this.btnDownload.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnDownload.Location = new System.Drawing.Point(12, 2);
            this.btnDownload.Name = "btnDownload";
            this.btnDownload.Size = new System.Drawing.Size(10, 10);
            this.btnDownload.TabIndex = 10;
            this.btnDownload.Text = "Instalar Traduccion";
            this.btnDownload.UseVisualStyleBackColor = true;
            this.btnDownload.Visible = false;
            this.btnDownload.Click += new System.EventHandler(this.btnDownload_Click);
            // 
            // progressBar
            // 
            this.progressBar.Location = new System.Drawing.Point(-1, 0);
            this.progressBar.Name = "progressBar";
            this.progressBar.Size = new System.Drawing.Size(11, 10);
            this.progressBar.TabIndex = 11;
            this.progressBar.Visible = false;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft YaHei", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(70, 269);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(0, 22);
            this.label2.TabIndex = 12;
            // 
            // dataGridView1
            // 
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(28, 2);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.Size = new System.Drawing.Size(12, 20);
            this.dataGridView1.TabIndex = 13;
            this.dataGridView1.Visible = false;
            // 
            // dataGridView2
            // 
            this.dataGridView2.AutoGenerateColumns = false;
            this.dataGridView2.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView2.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.cODIGODataGridViewTextBoxColumn,
            this.aRTICULODataGridViewTextBoxColumn,
            this.fECHADataGridViewTextBoxColumn,
            this.cANTIDADDataGridViewTextBoxColumn});
            this.dataGridView2.DataSource = this.entradasBindingSource;
            this.dataGridView2.Location = new System.Drawing.Point(604, 316);
            this.dataGridView2.Name = "dataGridView2";
            this.dataGridView2.Size = new System.Drawing.Size(444, 438);
            this.dataGridView2.TabIndex = 14;
            // 
            // tesys_tapDataSet1
            // 
            this.tesys_tapDataSet1.DataSetName = "tesys_tapDataSet1";
            this.tesys_tapDataSet1.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // tesystapDataSet1BindingSource
            // 
            this.tesystapDataSet1BindingSource.DataSource = this.tesys_tapDataSet1;
            this.tesystapDataSet1BindingSource.Position = 0;
            this.tesystapDataSet1BindingSource.CurrentChanged += new System.EventHandler(this.tesystapDataSet1BindingSource_CurrentChanged);
            // 
            // entradasBindingSource
            // 
            this.entradasBindingSource.DataMember = "Entradas";
            this.entradasBindingSource.DataSource = this.tesystapDataSet1BindingSource;
            // 
            // entradasTableAdapter
            // 
            this.entradasTableAdapter.ClearBeforeFill = true;
            // 
            // cODIGODataGridViewTextBoxColumn
            // 
            this.cODIGODataGridViewTextBoxColumn.DataPropertyName = "CODIGO";
            this.cODIGODataGridViewTextBoxColumn.HeaderText = "CODIGO";
            this.cODIGODataGridViewTextBoxColumn.Name = "cODIGODataGridViewTextBoxColumn";
            // 
            // aRTICULODataGridViewTextBoxColumn
            // 
            this.aRTICULODataGridViewTextBoxColumn.DataPropertyName = "ARTICULO";
            this.aRTICULODataGridViewTextBoxColumn.HeaderText = "ARTICULO";
            this.aRTICULODataGridViewTextBoxColumn.Name = "aRTICULODataGridViewTextBoxColumn";
            // 
            // fECHADataGridViewTextBoxColumn
            // 
            this.fECHADataGridViewTextBoxColumn.DataPropertyName = "FECHA";
            this.fECHADataGridViewTextBoxColumn.HeaderText = "FECHA";
            this.fECHADataGridViewTextBoxColumn.Name = "fECHADataGridViewTextBoxColumn";
            // 
            // cANTIDADDataGridViewTextBoxColumn
            // 
            this.cANTIDADDataGridViewTextBoxColumn.DataPropertyName = "CANTIDAD";
            this.cANTIDADDataGridViewTextBoxColumn.HeaderText = "CANTIDAD";
            this.cANTIDADDataGridViewTextBoxColumn.Name = "cANTIDADDataGridViewTextBoxColumn";
            // 
            // dataGridView3
            // 
            this.dataGridView3.AutoGenerateColumns = false;
            this.dataGridView3.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView3.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.cODIGODataGridViewTextBoxColumn1,
            this.aRTICULODataGridViewTextBoxColumn1,
            this.eNTRADASDataGridViewTextBoxColumn,
            this.sALIDASDataGridViewTextBoxColumn,
            this.sTOCKDataGridViewTextBoxColumn});
            this.dataGridView3.DataSource = this.pRODUCTOSBindingSource;
            this.dataGridView3.Location = new System.Drawing.Point(22, 316);
            this.dataGridView3.Name = "dataGridView3";
            this.dataGridView3.Size = new System.Drawing.Size(544, 438);
            this.dataGridView3.TabIndex = 15;
            // 
            // tesys_tapDataSet2
            // 
            this.tesys_tapDataSet2.DataSetName = "tesys_tapDataSet2";
            this.tesys_tapDataSet2.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // pRODUCTOSBindingSource
            // 
            this.pRODUCTOSBindingSource.DataMember = "PRODUCTOS";
            this.pRODUCTOSBindingSource.DataSource = this.tesys_tapDataSet2;
            // 
            // pRODUCTOSTableAdapter
            // 
            this.pRODUCTOSTableAdapter.ClearBeforeFill = true;
            // 
            // cODIGODataGridViewTextBoxColumn1
            // 
            this.cODIGODataGridViewTextBoxColumn1.DataPropertyName = "CODIGO";
            this.cODIGODataGridViewTextBoxColumn1.HeaderText = "CODIGO";
            this.cODIGODataGridViewTextBoxColumn1.Name = "cODIGODataGridViewTextBoxColumn1";
            // 
            // aRTICULODataGridViewTextBoxColumn1
            // 
            this.aRTICULODataGridViewTextBoxColumn1.DataPropertyName = "ARTICULO";
            this.aRTICULODataGridViewTextBoxColumn1.HeaderText = "ARTICULO";
            this.aRTICULODataGridViewTextBoxColumn1.Name = "aRTICULODataGridViewTextBoxColumn1";
            // 
            // eNTRADASDataGridViewTextBoxColumn
            // 
            this.eNTRADASDataGridViewTextBoxColumn.DataPropertyName = "ENTRADAS";
            this.eNTRADASDataGridViewTextBoxColumn.HeaderText = "ENTRADAS";
            this.eNTRADASDataGridViewTextBoxColumn.Name = "eNTRADASDataGridViewTextBoxColumn";
            // 
            // sALIDASDataGridViewTextBoxColumn
            // 
            this.sALIDASDataGridViewTextBoxColumn.DataPropertyName = "SALIDAS";
            this.sALIDASDataGridViewTextBoxColumn.HeaderText = "SALIDAS";
            this.sALIDASDataGridViewTextBoxColumn.Name = "sALIDASDataGridViewTextBoxColumn";
            // 
            // sTOCKDataGridViewTextBoxColumn
            // 
            this.sTOCKDataGridViewTextBoxColumn.DataPropertyName = "STOCK";
            this.sTOCKDataGridViewTextBoxColumn.HeaderText = "STOCK";
            this.sTOCKDataGridViewTextBoxColumn.Name = "sTOCKDataGridViewTextBoxColumn";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Showcard Gothic", 24.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.Location = new System.Drawing.Point(131, 249);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(213, 42);
            this.label5.TabIndex = 16;
            this.label5.Text = "Productos";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Showcard Gothic", 24.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label6.Location = new System.Drawing.Point(749, 251);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(164, 42);
            this.label6.TabIndex = 17;
            this.label6.Text = "Entrada";
            // 
            // dataGridView4
            // 
            this.dataGridView4.AutoGenerateColumns = false;
            this.dataGridView4.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView4.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.cODIGODataGridViewTextBoxColumn2,
            this.aRTICULODataGridViewTextBoxColumn2,
            this.fECHADataGridViewTextBoxColumn1,
            this.cANTIDADDataGridViewTextBoxColumn1});
            this.dataGridView4.DataSource = this.salidasBindingSource;
            this.dataGridView4.Location = new System.Drawing.Point(1072, 316);
            this.dataGridView4.Name = "dataGridView4";
            this.dataGridView4.Size = new System.Drawing.Size(445, 438);
            this.dataGridView4.TabIndex = 18;
            // 
            // tesys_tapDataSet3
            // 
            this.tesys_tapDataSet3.DataSetName = "tesys_tapDataSet3";
            this.tesys_tapDataSet3.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // salidasBindingSource
            // 
            this.salidasBindingSource.DataMember = "Salidas";
            this.salidasBindingSource.DataSource = this.tesys_tapDataSet3;
            // 
            // salidasTableAdapter
            // 
            this.salidasTableAdapter.ClearBeforeFill = true;
            // 
            // cODIGODataGridViewTextBoxColumn2
            // 
            this.cODIGODataGridViewTextBoxColumn2.DataPropertyName = "CODIGO";
            this.cODIGODataGridViewTextBoxColumn2.HeaderText = "CODIGO";
            this.cODIGODataGridViewTextBoxColumn2.Name = "cODIGODataGridViewTextBoxColumn2";
            // 
            // aRTICULODataGridViewTextBoxColumn2
            // 
            this.aRTICULODataGridViewTextBoxColumn2.DataPropertyName = "ARTICULO";
            this.aRTICULODataGridViewTextBoxColumn2.HeaderText = "ARTICULO";
            this.aRTICULODataGridViewTextBoxColumn2.Name = "aRTICULODataGridViewTextBoxColumn2";
            // 
            // fECHADataGridViewTextBoxColumn1
            // 
            this.fECHADataGridViewTextBoxColumn1.DataPropertyName = "FECHA";
            this.fECHADataGridViewTextBoxColumn1.HeaderText = "FECHA";
            this.fECHADataGridViewTextBoxColumn1.Name = "fECHADataGridViewTextBoxColumn1";
            // 
            // cANTIDADDataGridViewTextBoxColumn1
            // 
            this.cANTIDADDataGridViewTextBoxColumn1.DataPropertyName = "CANTIDAD";
            this.cANTIDADDataGridViewTextBoxColumn1.HeaderText = "CANTIDAD";
            this.cANTIDADDataGridViewTextBoxColumn1.Name = "cANTIDADDataGridViewTextBoxColumn1";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Font = new System.Drawing.Font("Showcard Gothic", 24.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label7.Location = new System.Drawing.Point(1229, 251);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(129, 42);
            this.label7.TabIndex = 19;
            this.label7.Text = "Salida";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1579, 843);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.dataGridView4);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.dataGridView3);
            this.Controls.Add(this.dataGridView2);
            this.Controls.Add(this.dataGridView1);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.btnDownload);
            this.Controls.Add(this.boton_para_desechar);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.install_trad);
            this.Controls.Add(this.partool_path_button);
            this.Controls.Add(this.ps3_folder_path);
            this.Controls.Add(this.label1);
            this.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.Fixed3D;
            this.ImeMode = System.Windows.Forms.ImeMode.NoControl;
            this.Name = "Form1";
            this.Text = "Sistema de Inventarios";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView2)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.tesys_tapDataSet1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.tesystapDataSet1BindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.entradasBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView3)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.tesys_tapDataSet2)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pRODUCTOSBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView4)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.tesys_tapDataSet3)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.salidasBindingSource)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox ps3_folder_path;
        private System.Windows.Forms.Button partool_path_button;
        private System.Windows.Forms.Button install_trad;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.RadioButton radioButton2;
        private System.Windows.Forms.RadioButton radioButton1;
        private System.Windows.Forms.Button boton_para_desechar;
        private System.Windows.Forms.Button btnDownload;
        private System.Windows.Forms.ProgressBar progressBar;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.DataGridView dataGridView2;
        private System.Windows.Forms.BindingSource tesystapDataSet1BindingSource;
        private almacen_inventario.tesys_tapDataSet1 tesys_tapDataSet1;
        private System.Windows.Forms.BindingSource entradasBindingSource;
        private almacen_inventario.tesys_tapDataSet1TableAdapters.EntradasTableAdapter entradasTableAdapter;
        private System.Windows.Forms.DataGridViewTextBoxColumn cODIGODataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn aRTICULODataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn fECHADataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn cANTIDADDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridView dataGridView3;
        private almacen_inventario.tesys_tapDataSet2 tesys_tapDataSet2;
        private System.Windows.Forms.BindingSource pRODUCTOSBindingSource;
        private almacen_inventario.tesys_tapDataSet2TableAdapters.PRODUCTOSTableAdapter pRODUCTOSTableAdapter;
        private System.Windows.Forms.DataGridViewTextBoxColumn cODIGODataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn aRTICULODataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn eNTRADASDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn sALIDASDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn sTOCKDataGridViewTextBoxColumn;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.DataGridView dataGridView4;
        private almacen_inventario.tesys_tapDataSet3 tesys_tapDataSet3;
        private System.Windows.Forms.BindingSource salidasBindingSource;
        private almacen_inventario.tesys_tapDataSet3TableAdapters.SalidasTableAdapter salidasTableAdapter;
        private System.Windows.Forms.DataGridViewTextBoxColumn cODIGODataGridViewTextBoxColumn2;
        private System.Windows.Forms.DataGridViewTextBoxColumn aRTICULODataGridViewTextBoxColumn2;
        private System.Windows.Forms.DataGridViewTextBoxColumn fECHADataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn cANTIDADDataGridViewTextBoxColumn1;
        private System.Windows.Forms.Label label7;
    }
}

