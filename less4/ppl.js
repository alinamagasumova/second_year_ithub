let fs = require('fs');
let Person = {
    name: '',
    surname: '',
    docname: '',
    birthDate: '',
    gender: ''
}
let text = fs.readFileSync('ppl.csv', 'utf8');
let arr = text.split(';');
arr.splice(0,4);
for (let f=0; f<arr.length; f++) {
    // let names = arr[f]
    console.log(arr[f])
}