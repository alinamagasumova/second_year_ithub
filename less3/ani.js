let text;
let fs = require('fs');
fs.readFile('anim.csv', {encoding: 'utf8'}, function(err, data) {
    if (err) {
        throw new Error(err);
    } else {
        text = data;
        console.log(data);
    }
});  // Путь, кодировка, call back
console.log(text);
// setTimeout(() => console.log(text), 2000)