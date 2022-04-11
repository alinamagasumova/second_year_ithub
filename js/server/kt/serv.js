const http = require('http');
const fs = require('fs');
const ht = require('public/js.js')
const { fileURLToPath } = require('url');
const { RSA_NO_PADDING } = require('constants');
const PORT = 3330;
const mimeTypes = {
    '.css': 'text/css',
    '.js': 'text/javascript'
}

let text = fs.readFileSync('cafe.csv', 'utf8');
let arr = text.split('\n');
let arrObj = [];
arr.forEach((e) => {
    arrObj.push(e.split(";"))
});
arrObj.shift();
arrObj.forEach((e) => {
    e.pop()
});
let src=[];
for(let i=0; i<arrObj.length; i++) {
    src.push(arrObj[i][0]);
}
console.log(ht.img);

const s = http.createServer((req, res) => {
    if (req.url === '/') {
        fs.readFile('public/index.html', (e,d) => {
            res.write(!e ? d : 'Файл упал', 'utf8');
            res.end();
        });
    } else {
        let fileExt = '.' + req.url.split('.').pop(); 
        console.log(fileExt);
        res.writeHead(200, {
            "Content-Type": mimeTypes[fileExt]
        });
        fs.readFile('public' + req.url, (e,d) => {
            res.write(d, 'utf8');
            res.end();
        });
    }

});

s.listen(PORT, err => !err && console.log('Ваш сервер отчаянно работает...'));