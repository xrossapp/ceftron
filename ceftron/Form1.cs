using CefSharp;using CefSharp.WinForms;using CefSharp.SchemeHandler;using System.IO;using System.Windows.Forms;using System; 
namespace ceftron{public partial class Form1 : Form {public ChromiumWebBrowser cefcon; 
public Form1(){InitializeComponent();initCeftron();} 
public void initCeftron(){ CefSettings settings = new CefSettings();settings.CachePath = Path.Combine(Environment.GetFolderPath(System.Environment.SpecialFolder.LocalApplicationData), "cache"); 
this.Text = "Amandeep"; 
this.WindowState = FormWindowState.Maximized; 
Cef.Initialize(settings);cefcon = new ChromiumWebBrowser("dash.management"); 
cefcon.MenuHandler = new MenuHandler();cefcon.DownloadHandler = new DownloadHandler();this.Controls.Add(cefcon);cefcon.Dock = DockStyle.Fill;} 
private void Form1_FormClosing(object sender, FormClosingEventArgs e){Cef.Shutdown();}}} 
