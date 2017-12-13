using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.OracleClient;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;



namespace eSRI
{
    public partial class Main : Form
    {
        
        public Main(String anio,String mes)
        {
            InitializeComponent();
            txtAnio.Text = anio;
            txtMes.Text = mes;        
        }

        private void cmdProbarConexion_Click(object sender, EventArgs e)
        {
            SqlConnection conSqlServer=inicializaSqlServer();
            OracleConnection conOracle=inicializaOracle();
            
            Console.WriteLine(System.Configuration.ConfigurationManager.ConnectionStrings[
                     "eSRI.Properties.Settings.BDQuality"].ConnectionString);
            Console.WriteLine(System.Configuration.ConfigurationManager.ConnectionStrings[
                     "eSRI.Properties.Settings.OracleSri"].ConnectionString);

            

            try
            {
                conSqlServer.Open();
                MessageBox.Show("Conexión Sql Server correcta","Estado de Conexión",MessageBoxButtons.OK,MessageBoxIcon.Information);
                conSqlServer.Close();                
            }
            catch(Exception ex)
            {
                MessageBox.Show("Error de conexión " + ex.ToString(),"Estado de Conexión Sql Server", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            try
            {
                conOracle.Open();
                MessageBox.Show("Conexión Oracle correcta", "Estado de Conexión", MessageBoxButtons.OK, MessageBoxIcon.Information);
                conOracle.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error de conexión " + ex.ToString(), "Estado de Conexión Oracle", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

        }
        private void cargarProveedores()
        {

            SqlConnection conSqlServer = inicializaSqlServer();
            OracleConnection conOracle = inicializaOracle();

            try
            {
                conSqlServer.Open();
                conOracle.Open();

                SqlCommand sqlCmd = new SqlCommand("select entidad,RazonSocial from Entidad" +
                    " where empresa = 'Activefun' and tipoentidad = 'PROVEEDOR'", conSqlServer);
                SqlDataReader sqlRead = sqlCmd.ExecuteReader();
                while (sqlRead.Read())
                {
                    /*
                    Console.WriteLine(sqlRead["entidad"].ToString());
                    Console.WriteLine(sqlRead["RazonSocial"].ToString());
                    */
                    String d = sqlRead["entidad"].ToString();
                    String r = sqlRead["RazonSocial"].ToString();

                    OracleCommand oracleCmd = new OracleCommand("select count(*) from util_proveedores"+
                        " where documento = :d", conOracle);

                    oracleCmd.Parameters.AddWithValue("d", d);
                      
                    OracleDataReader oracleRead = oracleCmd.ExecuteReader();
                    
                    while (oracleRead.Read())
                    {
                        int c = int.Parse(oracleRead[0].ToString());

                        if (c == 0)
                        {
                            //OracleCommand oracleCmdInsert = new OracleCommand("insert into util_proveedor values('"+d+"','"+r+"')", conOracle);
                            OracleCommand oracleCmdInsert = new OracleCommand("insert into util_proveedores values( :d , :r )", conOracle);
                            oracleCmdInsert.Parameters.AddWithValue("d", d);
                            oracleCmdInsert.Parameters.AddWithValue("r", r);
                            oracleCmdInsert.ExecuteNonQuery();
                        }
                    }
                    oracleRead.Close();
                    
                }
                sqlRead.Close();
                conSqlServer.Close();
                conOracle.Close();
                toolStripStatusLabel.Text = "Carga de proveedores correcta ...";

            }
            catch (Exception ex)
            {
                MessageBox.Show("Error de carga" + ex.ToString(), "Carga de Proveedores", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void cmdCargar_Click(object sender, EventArgs e)
        {
            List<String> numerosRetencion = new List<String>();
            cargarInformante();
            cargarProveedores();
            toolStripStatusLabel.Text = "Cargando Compras";
            numerosRetencion =cargarCompras();

            toolStripProgressBar.ProgressBar.Maximum = numerosRetencion.Count;
            toolStripProgressBar.ProgressBar.Step = 1;
            toolStripProgressBar.ProgressBar.Value = 0;
            
            toolStripStatusLabel.Text = "Cargando Retenciones";
            for (int i = 0; i < numerosRetencion.Count; i++)
            {
                Console.WriteLine($"{i} = {numerosRetencion[i]}");
                cargarRetenciones(numerosRetencion[i]);
                cargarRetencionesDetalle(numerosRetencion[i]);
                toolStripProgressBar.ProgressBar.Value = i + 1;
            }
            
            toolStripStatusLabel.Text = "Proceso Correcto";
            
        }

        private void cargarInformante()
        {
            SqlConnection conSqlServer = inicializaSqlServer();
            OracleConnection conOracle = inicializaOracle();
            try
            {
                conSqlServer.Open();
                conOracle.Open();

                SqlCommand sqlCmd = new SqlCommand("select TOP (1) ruc,RAZON_SOCIAL from V_INFO_TRIBUTARIA",
                    conSqlServer);
                SqlDataReader sqlRead = sqlCmd.ExecuteReader();
                while (sqlRead.Read())
                {
                    /*
                    Console.WriteLine(sqlRead["entidad"].ToString());
                    Console.WriteLine(sqlRead["RazonSocial"].ToString());
                    */
                    String d = sqlRead["ruc"].ToString();
                    String r = sqlRead["RAZON_SOCIAL"].ToString();

                    OracleCommand oracleCmdDelete = new OracleCommand("delete util_informantes", conOracle);
                    oracleCmdDelete.ExecuteNonQuery();
                                    
                    OracleCommand oracleCmdInsert = new OracleCommand("insert into util_informantes values( :d , :r )", conOracle);
                    oracleCmdInsert.Parameters.AddWithValue("d", d);
                    oracleCmdInsert.Parameters.AddWithValue("r", r);
                    oracleCmdInsert.ExecuteNonQuery();
                       

                }
                sqlRead.Close();
                conSqlServer.Close();
                conOracle.Close();
                toolStripStatusLabel.Text = "Carga de informante correcta ...";

            }
            catch (Exception ex)
            {
                MessageBox.Show("Error de carga" + ex.ToString(), "Carga de Informante", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private List<String> cargarCompras()
        {
            SqlConnection conSqlServer = inicializaSqlServer();
            OracleConnection conOracle = inicializaOracle();
            List<String> numerosRetencion = new List<String>();
            try
            {
                conSqlServer.Open();
                conOracle.Open();

                OracleCommand oracleCmdDelete = new OracleCommand("delete util_compras", conOracle);
                /*
                oracleCmdDelete.Parameters.AddWithValue("anio", txtAnio.Text);
                oracleCmdDelete.Parameters.AddWithValue("mes", txtMes.Text);
                */
                oracleCmdDelete.ExecuteNonQuery();

                SqlCommand sqlCmd = new SqlCommand("select * from v_sri_compras "+
                    "where anio=@anio and mes=@mes",
                    conSqlServer);
                sqlCmd.Parameters.AddWithValue("@anio", txtAnio.Text);
                sqlCmd.Parameters.AddWithValue("@mes", txtMes.Text);
                SqlDataReader sqlRead = sqlCmd.ExecuteReader();

                while (sqlRead.Read())
                {
                    
                    String codigo = sqlRead["codigo"].ToString();
                    String numero = sqlRead["numero"].ToString();
                    String anio = sqlRead["anio"].ToString();
                    String mes = sqlRead["mes"].ToString();
                    String sustento = sqlRead["sustento"].ToString();
                    String tipo_documento = sqlRead["tipo_documento"].ToString();
                    String documento = sqlRead["documento"].ToString();
                    String relacionado = sqlRead["relacionado"].ToString();
                    String tipo_comprobante = sqlRead["tipo_comprobante"].ToString();
                    String fecha = sqlRead["fecha"].ToString();
                    String establecimiento = sqlRead["establecimiento"].ToString();
                    String punto_emision = sqlRead["punto_emision"].ToString();
                    String secuencial = sqlRead["secuencial"].ToString();
                    String autorizacion = sqlRead["autorizacion"].ToString();
                    String base_no_iva = sqlRead["base_no_iva"].ToString();
                    String base_iva_0 = sqlRead["base_iva_0"].ToString();
                    String base_graba = sqlRead["base_graba"].ToString();
                    String base_exenta = sqlRead["base_exenta"].ToString();
                    String ice = sqlRead["ice"].ToString();
                    String iva = sqlRead["iva"].ToString();
                    String reembolso = sqlRead["reembolso"].ToString();
                    String numero_retencion = sqlRead["numero_retencion"].ToString();

                    Console.WriteLine("Compra: " + codigo +" "+numero);
                    Console.WriteLine("Total tarifa diferente de 0% " + base_graba);
                    Console.WriteLine("IVA " + iva);


                    OracleCommand oracleCmdInsert = new OracleCommand("INSERT INTO UTIL_COMPRAS(CODIGO, NUMERO, ANIO, MES, SUSTENTO, TIPO_DOCUMENTO, DOCUMENTO, RELACIONADO, TIPO_COMPROBANTE, FECHA, ESTABLECIMIENTO, PUNTO_EMISION, SECUENCIAL, AUTORIZACION, BASE_NO_IVA, BASE_IVA_0, BASE_GRABA, BASE_EXENTA, ICE, IVA, REEMBOLSO, numero_retencion) " +
                        "VALUES(:codigo, to_number(:numero), :anio, :mes, :sustento, :tipo_documento, :documento,"+
                        " :relacionado, :tipo_comprobante, TO_DATE(:fecha, 'dd/mm/rrrr'), :establecimiento,"+
                        " :punto_emision, :secuencial, :autorizacion,"+
                        " to_number(:base_no_iva), to_number(:base_iva_0),to_number(:base_graba), to_number(:base_exenta),"+
                        " to_number(:ice), to_number(:iva), to_number(:reembolso), :numero_retencion)", 
                        conOracle);

                    
                    oracleCmdInsert.Parameters.AddWithValue("codigo", codigo);                    
                    oracleCmdInsert.Parameters.AddWithValue("numero", numero);
                    oracleCmdInsert.Parameters.AddWithValue("anio", anio);
                    oracleCmdInsert.Parameters.AddWithValue("mes", mes);                    
                    oracleCmdInsert.Parameters.AddWithValue("sustento", sustento);
                    oracleCmdInsert.Parameters.AddWithValue("tipo_documento", tipo_documento);
                    oracleCmdInsert.Parameters.AddWithValue("documento", documento);
                    oracleCmdInsert.Parameters.AddWithValue("relacionado", relacionado);
                    oracleCmdInsert.Parameters.AddWithValue("tipo_comprobante", tipo_comprobante);
                    
                    oracleCmdInsert.Parameters.AddWithValue("fecha", fecha);
                    oracleCmdInsert.Parameters.AddWithValue("establecimiento", establecimiento);
                    oracleCmdInsert.Parameters.AddWithValue("punto_emision", punto_emision);
                    oracleCmdInsert.Parameters.AddWithValue("secuencial", secuencial);
                    oracleCmdInsert.Parameters.AddWithValue("autorizacion", autorizacion);
                    
                    oracleCmdInsert.Parameters.AddWithValue("base_no_iva", base_no_iva);
                    oracleCmdInsert.Parameters.AddWithValue("base_iva_0", base_iva_0);
                    oracleCmdInsert.Parameters.AddWithValue("base_graba", base_graba);
                    oracleCmdInsert.Parameters.AddWithValue("base_exenta", base_exenta);
                    oracleCmdInsert.Parameters.AddWithValue("ice", ice);
                    oracleCmdInsert.Parameters.AddWithValue("iva", iva);
                    oracleCmdInsert.Parameters.AddWithValue("reembolso", reembolso);
                    oracleCmdInsert.Parameters.AddWithValue("numero_retencion", numero_retencion);

                    oracleCmdInsert.ExecuteNonQuery();
                    if (String.Equals(numero_retencion, "999999999999999") ==false)
                    {
                        if (String.Equals(numero_retencion, "9999999999999") == false)
                        {
                            numerosRetencion.Add(numero_retencion);
                            Console.WriteLine("Añadida retención: "+numero_retencion);
                        }
                        
                    }
                    

                }
                OracleCommand oracleCmdDeleteRetencion = new OracleCommand("delete util_retenciones", conOracle);
                //oracleCmdDelete.Parameters.AddWithValue("numeroRetencion", numeroRetencion);
                oracleCmdDeleteRetencion.ExecuteNonQuery();
                OracleCommand oracleCmdDeleteRetencionDetalle = new OracleCommand("delete util_retenciones_detalle", conOracle);
                //oracleCmdDelete.Parameters.AddWithValue("numeroRetencion", numeroRetencion);
                oracleCmdDeleteRetencionDetalle.ExecuteNonQuery();

                sqlRead.Close();
                conSqlServer.Close();
                conOracle.Close();
                toolStripStatusLabel.Text = "Carga de compras correcta ...";

            }
            catch (Exception ex)
            {
                MessageBox.Show("Error de carga" + ex.ToString(), "Carga de Compras", MessageBoxButtons.OK, MessageBoxIcon.Error);
                Console.WriteLine("Error de carga en compras: " + ex.ToString());
            }
            return numerosRetencion;
        }
        private void cargarRetenciones(String numeroRetencion)
        {
            SqlConnection conSqlServer = inicializaSqlServer();
            OracleConnection conOracle = inicializaOracle();
            try
            {
                conSqlServer.Open();
                conOracle.Open();
             
                SqlCommand sqlCmd = new SqlCommand("select * from v_sri_retenciones " +
                    "where numero=@numero",
                    conSqlServer);
                sqlCmd.Parameters.AddWithValue("@numero", numeroRetencion);
                SqlDataReader sqlRead = sqlCmd.ExecuteReader();

                while (sqlRead.Read())
                {
                    String numero = sqlRead["numero"].ToString();
                    String establecimiento = sqlRead["establecimiento"].ToString();
                    String punto_emision = sqlRead["punto_emision"].ToString();
                    String secuencial = sqlRead["secuencial"].ToString();
                    String autorizacion = sqlRead["autorizacion"].ToString();
                    String fecha = sqlRead["fecha"].ToString();                    

                    OracleCommand oracleCmdInsert = new OracleCommand("INSERT INTO UTIL_retenciones " +
                        "VALUES(:numeroRetencion, :establecimiento, :punto_emision, :secuencial," +
                        " :autorizacion, TO_DATE(:fecha, 'dd/mm/rrrr'))",
                        conOracle);

                    oracleCmdInsert.Parameters.AddWithValue("numeroRetencion", numeroRetencion);
                    oracleCmdInsert.Parameters.AddWithValue("establecimiento", establecimiento);
                    oracleCmdInsert.Parameters.AddWithValue("punto_emision", punto_emision);
                    oracleCmdInsert.Parameters.AddWithValue("secuencial", secuencial);
                    oracleCmdInsert.Parameters.AddWithValue("autorizacion", autorizacion);
                    oracleCmdInsert.Parameters.AddWithValue("fecha", fecha);

                    oracleCmdInsert.ExecuteNonQuery();

                }
                sqlRead.Close();
                conSqlServer.Close();
                conOracle.Close();

            }
            catch (Exception ex)
            {
                MessageBox.Show("Error de carga" + ex.ToString(), "Carga de Retenciones", MessageBoxButtons.OK, MessageBoxIcon.Error);
                Console.WriteLine("Error de carga en retenciones: " + ex.ToString());
            }
        }
        private void cargarRetencionesDetalle(String numeroRetencion)
        {
            SqlConnection conSqlServer = inicializaSqlServer();
            OracleConnection conOracle = inicializaOracle();
            try
            {
                conSqlServer.Open();
                conOracle.Open();



                SqlCommand sqlCmd = new SqlCommand("select * from v_sri_retenciones_detalle " +
                    "where numero=@numero",
                    conSqlServer);
                sqlCmd.Parameters.AddWithValue("@numero", numeroRetencion);
                SqlDataReader sqlRead = sqlCmd.ExecuteReader();

                while (sqlRead.Read())
                {
                    String numero = sqlRead["numero"].ToString();
                    String codigo_sri = sqlRead["codigo_sri"].ToString();
                    String base_imponible = sqlRead["base_imponible"].ToString().Replace(",","");
                    int porcentaje = int.Parse(sqlRead["porcentaje"].ToString());
                    String valor_retenido = sqlRead["valor_retenido"].ToString().Replace(",", "");

                    OracleCommand oracleCmdInsert = new OracleCommand("INSERT INTO util_retenciones_detalle " +
                        "VALUES(:numeroRetencion, :codigo_sri, to_number(:base_imponible), :porcentaje," +
                        " to_number(:valor_retenido))",
                        conOracle);

                    Console.WriteLine(numeroRetencion +" "+ codigo_sri + " " + base_imponible + " " + porcentaje + " " + valor_retenido);

                    oracleCmdInsert.Parameters.AddWithValue("numeroRetencion", numeroRetencion);
                    oracleCmdInsert.Parameters.AddWithValue("codigo_sri", codigo_sri);
                    
                    oracleCmdInsert.Parameters.AddWithValue("base_imponible", base_imponible);                    
                    oracleCmdInsert.Parameters.AddWithValue("porcentaje", porcentaje);
                    oracleCmdInsert.Parameters.AddWithValue("valor_retenido", valor_retenido);
                    
                    oracleCmdInsert.ExecuteNonQuery();

                }
                sqlRead.Close();
                conSqlServer.Close();
                conOracle.Close();

            }
            catch (Exception ex)
            {
                MessageBox.Show("Error de carga" + ex.ToString(), "Carga de Detalle de Retenciones", MessageBoxButtons.OK, MessageBoxIcon.Error);
                Console.WriteLine("Error de carga en detalle de retenciones: " + ex.ToString());
            }
        }
        private SqlConnection inicializaSqlServer()
        {
            SqlConnection conSqlServer = new SqlConnection(
                System.Configuration.ConfigurationManager.ConnectionStrings[
                   "eSRI.Properties.Settings.BDQuality"]
                       .ConnectionString);
            return conSqlServer;


        }
        private OracleConnection inicializaOracle()
        {
            OracleConnection conOracle = new OracleConnection(System.Configuration.ConfigurationManager.ConnectionStrings[
                     "eSRI.Properties.Settings.OracleSri"].ConnectionString);
            return conOracle;
        }

    }
}
