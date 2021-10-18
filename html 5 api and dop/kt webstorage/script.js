let currentStorage = localStorage; // sessionStorage или localStorage
let emptyHeader = "Локальное хранилище пусто";

let answ;
const tbody = document.querySelector('#output');
const key = document.querySelector('#key');
const value = document.querySelector('#value');

const storage = document.querySelector('#storage');
storage.addEventListener('change', getStorage);

const btnClear = document.querySelector('#clear');
btnClear.addEventListener('click', clearStorage);

const btnSave = document.querySelector('#save');
btnSave.addEventListener('click', saveItem);
   

function updateTable(){
    tbody.innerHTML = '';

    if (currentStorage.length == 0) {
        tbody.innerHTML = `<tr><td colspan = 4>${emptyHeader}</td></tr>`
    } else {
        for(let i=0; i<currentStorage.length; ++i) {
        let keyB = currentStorage.key(i);
        let valueB = currentStorage.getItem(keyB);
        tbody.innerHTML += `<tr><td>${i+1}</td><td>${keyB}</td><td>${valueB}</td><td><span onclick='deleteItem("${keyB}")'>X</span></td></tr>`
      }
    }
}

window.onload = updateTable();

function getStorage(){
    if(storage.value == 0){
        currentStorage = localStorage;
    } else {
        currentStorage = sessionStorage;
    }
    updateTable();
}

function saveItem(){
    currentStorage.setItem(key.value, value.value);
    updateTable();
}

function deleteItem(k){
    answ = confirm('Вы уверены, что хотите удалить эту запись?');
    if (answ) {
        currentStorage.removeItem(`${k}`);
    }
    updateTable();
}


function clearStorage(){
    answ = confirm('Вы уверены, что хотите полностью очистить локальное хранилище?');
    if (answ) {
        currentStorage.clear();
        updateTable();
    }
}