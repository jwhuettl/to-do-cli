## TO-DO 

#### Purpose
I wanted to build a program that was actually useful to me in everyday life. As a college student, most of the projects I have worked on seemed to be useful learning tools but rarely did I ever work on something that I would use everyday or often. Enter this program, a minimal to-do list command line script with a javascript backend. The purpose of this program is dual, reviewing javascript and bash but also making something I could actually use in a normal day. 

#### How It Works
The bash front-end checks the arguments for validity and then sends them to the javascript program (main.js). The javascript script then actually operates on the list file (list.json) which holds the actually to-do list. 

The bash script holds and works with all of the arguments, checks them for validity, and then pushs them to the javascript. The javascript does all of the work on the actual list (list.json). Since the program must write the file each  time an operation is done, there are some losses to efficiency but this is pretty much the best way to make a program function in the manner I would like it to. 

Visually it looks like this

      bash
        |
      javascript
        |
      json

#### Functions
As of right now, the functionality is pretty limited, but it include most of the operations I would use. In the future, I would like to add more functionality like undoing, editing, or completely clearing the list. For now, basic functionality is a limited form of CRUD operations, Create is handled by addTask, Read is showList, there is a limited form of Update with doneTask, and finally a limited form of Delete with clearList. <br />
There are some helper functions that run each time any operation is done, readList and writeList. Function readList is called everytime as the list needs to be read to complete any operations, it does have some error checking with looking for proper JSON. The other function, writeList is only called on addTask and doneTask, it should work at all times, and will report if a task was not found to match any of those within the list. 


1. addTask - add new tasks to the list
2. cleanList - removes all tasks marked done
3. doneTask - marks a task as done
4. showList - prints out the list to the command line
 
> Note: I realize that doneTask makes no gramatical sense, HOWEVER, it does fit the naming scheme of the program. 

In the bash file, there is a fix function (which, for now, deletes the list file and writes the proper JSON to it) to reset up the list based on the file path (LIST_FILE_PATH) given by the config file. 

#### Configuration
Configuration is done upon first setup by running the installer (installer.sh) and entering valid paths when asked. I would recommend keeping main.js in the same folder as to-do.sh for ease of use and troubleshooting. The list file can really be placed anywhere. The installer can be rerun at anytime should the user want to, however it will clear the list. 


#### Files
1. list.json (list file)
2. main.js (js file)
3. to-do.sh (bash script)
4. installer.sh (installer script)
5. to-do.conf (configuration file holding both JS and JSON paths)


#### Notes
1. Make sure that {"tasks":[]} is in the list.json file, you will receive an error otherwise. 
2. Longer task names mess with the formatting of showList. 
3. As of right now,  doneTask() requires that the task name be exactly matched for the task to be completed (again to be changed soon).
4. As of right now, tasks cannot be deleted however, users may mark the task as done and then run clean to remove it. It is by no means the final way but it works for now. 

#### Tips
1. You can shorten all commands to the first letter of the command (a, c, d, s).
2. Placing the list in a cloud based drive, it can then become an improvised cloud-based to-do list. 