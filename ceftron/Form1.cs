using CefSharp;using CefSharp.WinForms;using CefSharp.SchemeHandler;using System.IO;using System.Windows.Forms; 
namespace ceftron{public partial class Form1 : Form {public ChromiumWebBrowser cefcon; 
public Form1(){InitializeComponent();initCeftron();} 
public void initCeftron(){ CefSettings settings = new CefSettings();settings.CachePath = "temp"; 
this.Text = "pooni"; 
Cef.Initialize(settings);cefcon = new ChromiumWebBrowser("pooni.in"); 
cefcon.MenuHandler = new MenuHandler();cefcon.DownloadHandler = new DownloadHandler();this.Controls.Add(cefcon);cefcon.Dock = DockStyle.Fill;} 
private void Form1_FormClosing(object sender, FormClosingEventArgs e){Cef.Shutdown();}}} 
