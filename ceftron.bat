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
echo        ^<cefSharp:ChromiumWebBrowser Grid.Row="0"
echo        Address="%hsite%" /^>
echo    ^</Grid^>
echo ^</Window^>
)> "%backdir%\ceftron\MainWindow.xaml"
set msp="%backdir%\build\MSBuild\current\Bin\"
@cd %msp%
@echo "RESTORING PACKAGES...................................."
msbuild "%backdir%\ceftron.sln" /t:restore
@echo "BUILDING.............................................."
msbuild.exe "%backdir%\ceftron.sln" /p:configuration=release
@cd %backdir%
@echo Done