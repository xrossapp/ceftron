# ceftron
A build system to convert web files or a hosted website into a desktop app.

Prerequisties:\
Install .NET framework v4.8 for Windows from here:\
https://dotnet.microsoft.com/download/dotnet-framework/thank-you/net48-developer-pack-offline-installer

### Features:
Serve a hosted website as a desktop app, serve local web files as a desktop app.


## GUIDE

### (Display hosted websites as Windows app)

Download this project.\
Open the downloaded folder path in Windows command line terminal.\
Input following commands in terminal:

```
ceftron AppName example.com
```
Path of the app: ceftron\bin\x64\Release \
Open ceftron.exe to run your app.\
You can rename the exe file.


### (Display local web files as Windows app)

Download this project.\
Open the downloaded folder path in Windows command line terminal.\
Input following commands in terminal:

```
ceftron AppName local
```
Path of the app: ceftron\bin\x64\Release

Create a new folder here : localRes \
Inside localRes, create another folder named "web" and put all your web files in it with root file as index.html.

Open ceftron.exe to run your app.\
You can rename the exe file.