# Extension Base
A repository to clone if you'd like to create your own custom Aseprite extension!

This repo contains the boiler-plate code needed to develop your own Aseprite extensions.

## Things to Know

If you haven't already, you should check out the [Aseprite Scripting API](https://github.com/aseprite/api). It's an incredibly rich set of documents that clearly define what you can do inside of a script. It is worth studying and becoming familiar with, if you're interested in extension development.

What is the difference between an `extension` and a `script`? A few things:
* Extensions can define where in Aseprite's menuing system they'd like to be found (i.e. `Edit > FX > Use Custom Font` instead of `File > Scripts > font-custom.lua`)
* Easier installation (all it takes is double clicking a `.aseprite-extension` file)
* Extensions allow for versioning (if someone has 1.0 of your extension, and you release 1.1, you can quickly and easily upgrade by double clicking the newer version)
* Extensions allow you to save "state" across uses (if you need to save some user preferences in-between sessions, you can do that)

With all of those benefits in mind, extensions are really just wrappers for normal `.lua` scripts.

## The Reason this Repository Exists

I've come up with a clever way to keep the "scripting" and "extension packaging" steps separate. This allows you to test your design quickly and iteratively by copying and pasting a `.lua` script into the scripts folder. Once the script is working the way you want, you can package it in the extension and ship to your users! I wanted to share my process with everyone to try and make extension writing as accessible as possible.

## Step by Step Instructions

Here's the step by step breakdown (use this repository as boiler-plate code):

1. Rename `script-name.lua` to be the name of your script
2. [Develop your script](./extension/script-name.lua); every time you want to test an iteration of your design, paste it into the Aseprite scripts folder (overwriting old copies). The first time you do this, you'll need to `File > Scripts > Rescan Scripts Folder`, but once your script is known to Aseprite, any future versions of your script that gets pasted into the folder will automagically be run as the new version and not the old version.
3. Once your script is the way you want it to be, modify [package.json](./extension/package.json) in the following way:
    * `name`: the _technical_ name of your extension (e.g. for an extension named "Font Custom" I used "font-custom"). This will create a folder on the filepath so don't use strange characters.
    * `displayName`: The _good looking_ name of your extension (e.g. "Font Custom")
    * `description`: A brief, one sentence description for your plugin
    * `version`: What version is this? (You can update future releases of your plugin with a new version number, and users that are upgrading will be able to double click the new extension and upgrade automagically)
    * `author`: Fill out the fields with information relevant to you.
    * `contributors`: Fill out the fields with information relevant to you.
    * `publisher`: Fill out the fields with information relevant to you.
    * `license`: I publish all of my extensions under the MIT license, but you are free to use your own
    * `contributes`: **This is very important.** If your plugin adds one new feature to Aseprite, this can stay the same. However, if you are adding multiple new features to Aseprite in one extension, you need to add more objects to the `contributes.scripts` array.
4. You'll also need to modify [plugin.lua](./extension/plugin.lua):
    * Change the first and last `print` statements to state that Aseprite is initializing or closing _the name of your plugin_.
    * For each new feature you add to Asesprite, you will need the `plugin:newCommand { ... }` syntax:
        * `id`: Name of the plugin (could be same as `name` from the `package.json`)
        * `title`: User-friendly name of the plugin (could be the same as `displayName` from the `package.json`)
        * `group`: Where in the menu hierarchy this command should be launched from. See the [gui.xml file](https://github.com/aseprite/aseprite/blob/main/data/gui.xml) to locate a group. In your browser, CTRL-F search for "group=" and choose the place in the menu hierarchy that you'd like your command to live in
        * `onclick`: This is the function that executes when you click the menu element. Because I've tried to abstractify the scripting process from the extension packing process, this may look strange to you. However, all we are doing is telling Lua that we want to fully execute a script when this menu element is clicked. Update the `app.fs.joinPath` call with your exact `name` from the `package.json` and the exact filename of your `.lua` script.
5. After this step, you are ready to test! In your file explorer, simply select all of the files that you'd like in the extension (`package.json`, `plugin.lua`, and whatever scripts you are including), and archive them as a `.zip` file.
6. Rename your `archive.zip` to `extension-name.aseprite-extension`. YOU MUST USE the file ending `.aseprite-extension`. Try double clicking the file and seeing if it installs and runs correctly within Aseprite! 
7. Drink a nice cup of tea because you just created an Aseprite extension!

## Credits

As an advocate of open-source software, feel free to suggest edits, or just fork this repository and make your own! If you've benefitted from my previous work, I would appreciate it if you would consider buying me a coffee. This is a great way to help support my creative endeavors: 

[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/L3L766S5F)