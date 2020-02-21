@echo off
@echo Starting build
set backdir=%CD%
set titl=%1
set hsite=%2
echo using CefSharp;using CefSharp.WinForms;using CefSharp.SchemeHandler;using System.IO;using System.Windows.Forms; > "%backdir%\ceftron\Form1.cs"
echo namespace ceftron{public partial class Form1 : Form {public ChromiumWebBrowser cefcon; >> "%backdir%\ceftron\Form1.cs"
echo public Form1(){InitializeComponent();initCeftron();} >> "%backdir%\ceftron\Form1.cs"
echo public void initCeftron(){ CefSettings settings = new CefSettings();settings.CachePath = "temp"; >> "%backdir%\ceftron\Form1.cs"
echo this.Text = "%titl%"; >> "%backdir%\ceftron\Form1.cs"
if %hsite%==local echo settings.RegisterScheme(new CefCustomScheme{SchemeName = "https",DomainName = "dash.ceftron",SchemeHandlerFactory = new FolderSchemeHandlerFactory(rootFolder: @"localRes/web",hostName: "dash.ceftron",defaultPage: "index.html")});Cef.Initialize(settings);cefcon = new ChromiumWebBrowser("https://dash.ceftron/"); >> "%backdir%\ceftron\Form1.cs"
if NOT %hsite%==local echo Cef.Initialize(settings);cefcon = new ChromiumWebBrowser("%hsite%"); >> "%backdir%\ceftron\Form1.cs"
echo cefcon.MenuHandler = new MenuHandler();cefcon.DownloadHandler = new DownloadHandler();this.Controls.Add(cefcon);cefcon.Dock = DockStyle.Fill;} >> "%backdir%\ceftron\Form1.cs"
echo private void Form1_FormClosing(object sender, FormClosingEventArgs e){Cef.Shutdown();}}} >> "%backdir%\ceftron\Form1.cs"
set msp="%backdir%\build\MSBuild\current\Bin\"
@cd %msp%
@echo "RESTORING PACKAGES...................................."
msbuild "%backdir%\ceftron.sln" /t:restore
@echo "BUILDING.............................................."
msbuild.exe "%backdir%\ceftron.sln" /p:configuration=release
@cd %backdir%\ceftron\bin\x64\Release\
@rename ceftron.exe %titl%.exe
@cd %backdir%
if %hsite%==local echo Put your web files (entry point:index.html) in this directory of your release build^:(Release/localRes/web)
@echo Done