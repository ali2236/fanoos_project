# fanoos_project

Everything you need to know to have a good flutter app structure.

# Folder structure

### Small-Medium apps

![folder structure](assets/small_folder_struct.PNG)

##### lib
Contains the primary folders and a few primary dart files like `main.dart` & `localization.dart`.

##### assets
![assets folder](assets/assets.PNG)

Contains all external assets that are imported using the assets section of `pubspec.yaml`.

##### pages
![pages simple](assets/pages_simple.PNG)

Contains all the pages.

In small to medium apps you can have all the pages in this folder. 

##### services
![pages simple](assets/services.PNG)

Contains view context independent app logic.

##### widgets
![pages simple](assets/widgets.PNG)

Contains global widgets.
 
In smaller apps it contains all the widgets.
    
### Large apps
![bigger apps](assets/bigger_apps.PNG)

Larger apps may have more folders in lib.

here is two example extra folders that bigger projects may have: 

##### themes
![themes](assets/themes.PNG)

Your app is probably not going to have a hundred themes, if it does, create reusable themes.

##### plugins
If you have to write your own plugin, for testing purposes, write it in the `plugins` folder
then create a new flutter plugin project and migrate 

# State management

### Services

# Naming

### File names

### Class names

### Variable names

### Widget names

# Application core

### Folder structure






