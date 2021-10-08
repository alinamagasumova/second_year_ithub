const http = require('http');
const fs = require('fs');
const { fileURLToPath } = require('url');
const { RSA_NO_PADDING } = require('constants');
const PORT = 3005;
const mimeTypes = {
    '.css': 'text/css',
    '.js': 'text/javascript'
}

const text = fs.readFileSync('cafe.csv', 'utf8');
let arr = text.split('\n');
let arrObj = [];
arr.forEach((e) => {
    arrObj.push(e.split(";"))
});
arrObj.forEach((e) => {
    e.pop()
});
// console.log(arrObj);

const s = http.createServer((req, res) => {

});

s.listen(PORT, err => !err && console.log('Ваш сервер отчаянно работает...'));