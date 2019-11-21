
const fs = require('fs');
var list = [];
var list_copy = {"tasks":[]};

// filepath for list.json
var file_path;


// helper functions
function readList() {
  // reads + parses json list
  json_list = fs.readFileSync(file_path);
  try {
    list = JSON.parse(json_list);
  } catch (e) {
    console.log("invalid JSON in list file - run './to-do.sh f' to fix list.json");
    return false;
  }
  return true;
} // read list

function writeList() {
  // writes to json file
  json_list = JSON.stringify(list);
  fs.writeFileSync(file_path, json_list);
} // writeList

// basic functions
function addTask(task) {
  // adds task to list
  list.tasks.push({name: task, done: false});
  writeList(list);
} // addTask

function doneTask(task) {
  // marks task as done
  list.tasks.forEach(element => {
    if (element.name == task) {
      element.done = true;
    }
  });

  writeList(list);
} // doneTask

function cleanList() {
  // removes completed tasks from list

  list.tasks.forEach(element => {
    if (element.done == false) {
      list_copy.tasks.push(element);
    }
  });
  list = list_copy;
  writeList(list);
} // cleanList

function showList() {
  // prints out entire list

  console.log('[to-do list]');

  if (list.tasks.length == 0) {
    console.log("\t--list is currently empty--");
  }

  list.tasks.forEach(element => {
    console.log("%s\t\t\t\t%s", element.name, element.done);
  });
} // showList


function main() {
  args = process.argv.slice(2);

  file_path = args[0]; // getting json list file path

  // if readList() fails, program exits
  if (!(readList())) {
    return 2; // this doesn't actually get used anywhere
  }

  switch (args[1]) {
    case 'add':
      addTask(args[2]);
      break;
    case 'clean':
      cleanList(args[2]);
      break;
    case 'done':
      doneTask(args[2]);
      break;
    case 'show':
      showList();
      break;
  }
} // main

main();
