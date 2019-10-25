## TO-DO 

#### Purpose
I wanted to build a program that was actually useful to me in everyday life. As a college student, most of the projects I have worked on seemed to be useful learning tools but rarely did I ever work on something that I would use everyday or often. Enter this program, a minimal to-do list command line script with a javascript backend. The purpose of this program is dual, reviewing javascript and bash but also making something I could actually use in a normal day. 

#### How It Works
The bash front-end checks the arguments for validity and then sends them to the javascript program (main.js). The javascript script then actually operates on the list file (list.json) which holds the actually to-do list. 

#### Functions
As of right now, the functionality is pretty limited, but it include most of the operations I would use. In the future, I would like to add more functionality like undoing, editing, or completely clearing the list. For now, basic functionality is a limited form of CRUD operations, Create is handled by addTask, Read is showList, there is a limited form of Update with doneTask, and finally a limited form of Delete with clearList. 

1. addTask - add new tasks to the list
2. cleanList - removes all tasks marked done
3. doneTask - marks a task as done
 
> Note: I realize that doneTask makes no gramatical sense, HOWEVER it does fit the naming scheme of the program. 

#### Files
1. list.json (list file)
2. main.js (js file)
3. to-do.sh (bash script)
4. init.sh (installer script)