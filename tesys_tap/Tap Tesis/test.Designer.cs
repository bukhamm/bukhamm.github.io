namespace almacen_inventario
{
    partial class test
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
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.tesys_tapDataSet4 = new almacen_inventario.tesys_tapDataSet4();
            this.rEGISTRODEPRODUCTOSBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.rEGISTRO_DE_PRODUCTOSTableAdapter = new almacen_inventario.tesys_tapDataSet4TableAdapters.REGISTRO_DE_PRODUCTOSTableAdapter();
            this.cODIGODataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.pRODUCTODataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.pRECIOVENTADataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.tesys_tapDataSet4)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.rEGISTRODEPRODUCTOSBindingSource)).BeginInit();
            this.SuspendLayout();
            // 
            // dataGridView1
            // 
            this.dataGridView1.AutoGenerateColumns = false;
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.cODIGODataGridViewTextBoxColumn,
            this.pRODUCTODataGridViewTextBoxColumn,
            this.pRECIOVENTADataGridViewTextBoxColumn});
            this.dataGridView1.DataSource = this.rEGISTRODEPRODUCTOSBindingSource;
            this.dataGridView1.Location = new System.Drawing.Point(-2, 3);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.Size = new System.Drawing.Size(367, 458);
            this.dataGridView1.TabIndex = 0;
            // 
            // tesys_tapDataSet4
            // 
            this.tesys_tapDataSet4.DataSetName = "tesys_tapDataSet4";
            this.tesys_tapDataSet4.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // rEGISTRODEPRODUCTOSBindingSource
            // 
            this.rEGISTRODEPRODUCTOSBindingSource.DataMember = "REGISTRO DE PRODUCTOS";
            this.rEGISTRODEPRODUCTOSBindingSource.DataSource = this.tesys_tapDataSet4;
            // 
            // rEGISTRO_DE_PRODUCTOSTableAdapter
            // 
            this.rEGISTRO_DE_PRODUCTOSTableAdapter.ClearBeforeFill = true;
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
            // pRECIOVENTADataGridViewTextBoxColumn
            // 
            this.pRECIOVENTADataGridViewTextBoxColumn.DataPropertyName = "PRECIO_VENTA";
            this.pRECIOVENTADataGridViewTextBoxColumn.HeaderText = "PRECIO_VENTA";
            this.pRECIOVENTADataGridViewTextBoxColumn.Name = "pRECIOVENTADataGridViewTextBoxColumn";
            // 
            // test
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(365, 463);
            this.Controls.Add(this.dataGridView1);
            this.Name = "test";
            this.Text = "Registro de Productos";
            this.Load += new System.EventHandler(this.test_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.tesys_tapDataSet4)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.rEGISTRODEPRODUCTOSBindingSource)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView dataGridView1;
        private tesys_tapDataSet4 tesys_tapDataSet4;
        private System.Windows.Forms.BindingSource rEGISTRODEPRODUCTOSBindingSource;
        private tesys_tapDataSet4TableAdapters.REGISTRO_DE_PRODUCTOSTableAdapter rEGISTRO_DE_PRODUCTOSTableAdapter;
        private System.Windows.Forms.DataGridViewTextBoxColumn cODIGODataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn pRODUCTODataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn pRECIOVENTADataGridViewTextBoxColumn;
    }
}