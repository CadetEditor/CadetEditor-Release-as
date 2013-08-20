CadetEditor-as
==============

A release build of the Cadet2D AIR app, allowing developers to debug custom extensions and CadetEngine updates within Flash Builder (or a similar IDE).

Dependencies
------------

Make sure your ActionScript project includes:
- A reference to the [CoreApp](https://github.com/CadetEditor/CoreApp-as) ActionScript library project
- A reference to lib/CoreEditor.swc

Run/Debug Settings
------------------

To run the project, create a new Desktop Application launch configuration in "Project\Properties\Run/Debug Settings".

You can specify which editor config.xml to use in the "command line arguments" field. Try setting it to the following:

cadetEditor2DSVehicleConfig.xml