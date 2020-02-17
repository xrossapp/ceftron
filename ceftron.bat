@echo off
@echo Starting build
set backdir=%CD%
set titl=%1
set hsite=%2
(
echo ^<Window x:Class="ceftron.MainWindow"
echo        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
echo        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
echo        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
echo        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
echo        xmlns:cefSharp="clr-namespace:CefSharp.Wpf;assembly=CefSharp.Wpf"
echo        mc:Ignorable="d"
echo        Title="%titl%" Height="450" Width="800" Background="White"^>
echo    ^<Grid^>
echo        ^<cefSharp:ChromiumWebBrowser x:Name="cefview" IsBrowserInitializedChanged="browser_IsBrowserInitializedChanged"^>^</cefSharp:ChromiumWebBrowser^>
echo    ^</Grid^>
echo ^</Window^>
)> "%backdir%\ceftron\MainWindow.xaml"
echo %hsite%
echo using System.IO; > "%backdir%\ceftron\MainWindow.xaml.cs"
echo using System.Windows; >> "%backdir%\ceftron\MainWindow.xaml.cs"
echo namespace ceftron >> "%backdir%\ceftron\MainWindow.xaml.cs"
echo { public partial class MainWindow : Window {public MainWindow() >> "%backdir%\ceftron\MainWindow.xaml.cs"
echo {InitializeComponent();} >> "%backdir%\ceftron\MainWindow.xaml.cs"
echo private void browser_IsBrowserInitializedChanged(object sender, DependencyPropertyChangedEventArgs e) >> "%backdir%\ceftron\MainWindow.xaml.cs"
if %hsite%==local echo {string html = File.ReadAllText("localRes/web/index.html");CefSharp.WebBrowserExtensions.LoadHtml(cefview, html, "http://www.example.com/");} >> "%backdir%\ceftron\MainWindow.xaml.cs"
if NOT %hsite%==local echo {cefview.Load("%hsite%");} >> "%backdir%\ceftron\MainWindow.xaml.cs"
echo }} >> "%backdir%\ceftron\MainWindow.xaml.cs"
set msp="%backdir%\build\MSBuild\current\Bin\"
@cd %msp%
@echo "RESTORING PACKAGES...................................."
msbuild "%backdir%\ceftron.sln" /t:restore
@echo "BUILDING.............................................."
msbuild.exe "%backdir%\ceftron.sln" /p:configuration=release
@cd %backdir%
if %hsite%==local echo Put your web files (entry point:index.html) in this directory of your release build^:(Release/localRes/web)
@echo Done