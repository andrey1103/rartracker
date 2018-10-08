If you want Torznab support for your users you can use Digitalcore.cs.  
You have to rename the file to your trackername, and change all Digitalcore instances in the file..

On line 18, 29, 30, 31 and 32 change Digitalcore to your own sitename..(notepad ++ or any text editor)

When you are done, download the jackett source here: https://github.com/Jackett/Jackett/archive/master.zip

unpack the file and put the adjusted Digitalcore.cs in folder \Jackett-master\src\Jackett.Common\Indexers

Install the .NET Core SDK  (https://www.microsoft.com/net/download/windows)

Open the Jackett solution in Visual Studio 2017. Its free! (version 15.7 or above) (https://visualstudio.microsoft.com/downloads/)

Right click on the Jackett solution and click 'Rebuild Solution' to restore nuget packages

Select Jackett.Server as startup project

In the drop down menu of the run button select "Jackett.Server" instead of "IIS Express"

Build/Start the project

PS.  U can only use this file on my fork of rartracker.. It doesnt work with the other versions.










