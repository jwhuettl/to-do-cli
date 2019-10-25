// testing for to-do

const fs = require('fs');
var list = []; // list for json
var list_copy = {"tasks":[]}; // copy for clean

function readList() {
  // reads + parses json file
  json_list = fs.readFileSync('list.json');
  list = JSON.parse(json_list);

  return list;
} // readFile

function writeList(list) {
  // writes json file
  json_list = JSON.stringify(list);
  fs.writeFileSync('list.json', json_list);

  return 0;
} // writeList

function addTask(task) {
  // adds task to list
  if (list.tasks.push({name: task, done: false})) {
    return 0;
  }
  else {
    return 1;
  }
} // addTask

function cleanList() {
  // removes done tasks from list

  for (var i = 1; i < list.tasks.length; i++) {
    if (list.tasks[i].done == false) {
      list_copy.tasks.push(list.tasks[i]);
    }
  }
  list = list_copy;

  return 0;
} // cleanList

function doneTask(task) {
  // marks task as done

  for (var i = 0; i < list.tasks.length; i++) {
    if (list.tasks[i].name == task) {
      list.tasks[i].done = true;
      return 0;
    }
  }
  return 1;
}

function showList(list) {
  // prints out list

  console.log('[to-do list]');

  for (var i = 0; i < list.tasks.length; i++) {
    console.log(list.tasks[i].name, '\t\t', list.tasks[i].done);
  }
  return 0;
} // showList

function main() {
  args = process.argv.slice(2); // getting args from to-do
  

  list = readList(); // reading files

  switch (args[0]) {
    case 'add':
      ret = addTask(args[1]);
      writeList(list);
      break;
    case 'clean':
      cleanList();
      writeList(list);
      ret = 0;
      break;
    case 'done':
      ret = doneTask(args[1]);
      writeList(list);
      break;
    case 'show':
      showList(list);
      ret = 0;
      break;
    default:
      ret = 1;
  } // switch

  
  if (ret == 1) {
    console.log("there was an error: %s %s", args[0], args[1]);
  }
} // main

main();