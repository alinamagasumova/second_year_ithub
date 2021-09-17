let fs = require('fs');
let Person = {
    name: '',
    surname: '',
    docname: '',
    birthDate: '',
    gender: ''
}
let text = fs.readFileSync('ppl.csv', 'utf8');
let arr = text.split('\n');
arr.shift();

let arrObj = [];
arr.forEach((e) => {
    arrObj.push(e.split(";"))
});
arrObj.forEach((e) => {
    e.pop()
})
console.log(arrObj)