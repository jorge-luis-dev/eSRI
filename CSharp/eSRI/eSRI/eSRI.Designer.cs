namespace eSRI
{
    partial class Main
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
            this.cmdProbarConexion = new System.Windows.Forms.Button();
            this.cmdCargar = new System.Windows.Forms.Button();
            this.statusStrip = new System.Windows.Forms.StatusStrip();
            this.toolStripStatusLabel = new System.Windows.Forms.ToolStripStatusLabel();
            this.toolStripProgressBar = new System.Windows.Forms.ToolStripProgressBar();
            this.groupBoxExportar = new System.Windows.Forms.GroupBox();
            this.txtMes = new System.Windows.Forms.TextBox();
            this.txtAnio = new System.Windows.Forms.TextBox();
            this.lblMes = new System.Windows.Forms.Label();
            this.lblAnio = new System.Windows.Forms.Label();
            this.groupBoxUtilidades = new System.Windows.Forms.GroupBox();
            this.statusStrip.SuspendLayout();
            this.groupBoxExportar.SuspendLayout();
            this.groupBoxUtilidades.SuspendLayout();
            this.SuspendLayout();
            // 
            // cmdProbarConexion
            // 
            this.cmdProbarConexion.Location = new System.Drawing.Point(95, 31);
            this.cmdProbarConexion.Name = "cmdProbarConexion";
            this.cmdProbarConexion.Size = new System.Drawing.Size(140, 23);
            this.cmdProbarConexion.TabIndex = 4;
            this.cmdProbarConexion.Text = "&Probar Conexión";
            this.cmdProbarConexion.UseVisualStyleBackColor = true;
            this.cmdProbarConexion.Click += new System.EventHandler(this.cmdProbarConexion_Click);
            // 
            // cmdCargar
            // 
            this.cmdCargar.Location = new System.Drawing.Point(95, 101);
            this.cmdCargar.Name = "cmdCargar";
            this.cmdCargar.Size = new System.Drawing.Size(140, 23);
            this.cmdCargar.TabIndex = 3;
            this.cmdCargar.Text = "&Cargar";
            this.cmdCargar.UseVisualStyleBackColor = true;
            this.cmdCargar.Click += new System.EventHandler(this.cmdCargar_Click);
            // 
            // statusStrip
            // 
            this.statusStrip.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolStripStatusLabel,
            this.toolStripProgressBar});
            this.statusStrip.Location = new System.Drawing.Point(0, 296);
            this.statusStrip.Name = "statusStrip";
            this.statusStrip.Size = new System.Drawing.Size(474, 22);
            this.statusStrip.TabIndex = 2;
            this.statusStrip.Text = "statusStrip";
            // 
            // toolStripStatusLabel
            // 
            this.toolStripStatusLabel.Name = "toolStripStatusLabel";
            this.toolStripStatusLabel.Size = new System.Drawing.Size(47, 17);
            this.toolStripStatusLabel.Text = "Mensaje";
            // 
            // toolStripProgressBar
            // 
            this.toolStripProgressBar.Name = "toolStripProgressBar";
            this.toolStripProgressBar.Size = new System.Drawing.Size(100, 16);
            // 
            // groupBoxExportar
            // 
            this.groupBoxExportar.Controls.Add(this.txtMes);
            this.groupBoxExportar.Controls.Add(this.txtAnio);
            this.groupBoxExportar.Controls.Add(this.lblMes);
            this.groupBoxExportar.Controls.Add(this.lblAnio);
            this.groupBoxExportar.Controls.Add(this.cmdCargar);
            this.groupBoxExportar.Location = new System.Drawing.Point(73, 12);
            this.groupBoxExportar.Name = "groupBoxExportar";
            this.groupBoxExportar.Size = new System.Drawing.Size(330, 145);
            this.groupBoxExportar.TabIndex = 3;
            this.groupBoxExportar.TabStop = false;
            this.groupBoxExportar.Text = "Exportar Información SRI";
            // 
            // txtMes
            // 
            this.txtMes.Location = new System.Drawing.Point(95, 64);
            this.txtMes.Name = "txtMes";
            this.txtMes.Size = new System.Drawing.Size(140, 20);
            this.txtMes.TabIndex = 2;
            // 
            // txtAnio
            // 
            this.txtAnio.Location = new System.Drawing.Point(95, 32);
            this.txtAnio.Name = "txtAnio";
            this.txtAnio.Size = new System.Drawing.Size(140, 20);
            this.txtAnio.TabIndex = 1;
            // 
            // lblMes
            // 
            this.lblMes.AutoSize = true;
            this.lblMes.Location = new System.Drawing.Point(43, 64);
            this.lblMes.Name = "lblMes";
            this.lblMes.Size = new System.Drawing.Size(27, 13);
            this.lblMes.TabIndex = 3;
            this.lblMes.Text = "&Mes";
            // 
            // lblAnio
            // 
            this.lblAnio.AutoSize = true;
            this.lblAnio.Location = new System.Drawing.Point(43, 35);
            this.lblAnio.Name = "lblAnio";
            this.lblAnio.Size = new System.Drawing.Size(26, 13);
            this.lblAnio.TabIndex = 2;
            this.lblAnio.Text = "&Año";
            // 
            // groupBoxUtilidades
            // 
            this.groupBoxUtilidades.Controls.Add(this.cmdProbarConexion);
            this.groupBoxUtilidades.Location = new System.Drawing.Point(73, 180);
            this.groupBoxUtilidades.Name = "groupBoxUtilidades";
            this.groupBoxUtilidades.Size = new System.Drawing.Size(330, 100);
            this.groupBoxUtilidades.TabIndex = 4;
            this.groupBoxUtilidades.TabStop = false;
            this.groupBoxUtilidades.Text = "Utilidades";
            // 
            // Main
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(474, 318);
            this.Controls.Add(this.groupBoxUtilidades);
            this.Controls.Add(this.groupBoxExportar);
            this.Controls.Add(this.statusStrip);
            this.MaximizeBox = false;
            this.Name = "Main";
            this.Text = "eSRI";
            this.statusStrip.ResumeLayout(false);
            this.statusStrip.PerformLayout();
            this.groupBoxExportar.ResumeLayout(false);
            this.groupBoxExportar.PerformLayout();
            this.groupBoxUtilidades.ResumeLayout(false);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button cmdProbarConexion;
        private System.Windows.Forms.Button cmdCargar;
        private System.Windows.Forms.StatusStrip statusStrip;
        private System.Windows.Forms.ToolStripStatusLabel toolStripStatusLabel;
        private System.Windows.Forms.GroupBox groupBoxExportar;
        private System.Windows.Forms.TextBox txtMes;
        private System.Windows.Forms.TextBox txtAnio;
        private System.Windows.Forms.Label lblMes;
        private System.Windows.Forms.Label lblAnio;
        private System.Windows.Forms.GroupBox groupBoxUtilidades;
        private System.Windows.Forms.ToolStripProgressBar toolStripProgressBar;
    }
}

