const http = require('http');
const fs = require('fs');
const { fileURLToPath } = require('url');
const { RSA_NO_PADDING } = require('constants');
const PORT = 4000;
const mimeTypes = {
    '.js': 'text/javascript',
    '.css': 'text/css',
    '.jpeg': 'image/jpeg',
    '.jpg': 'image/jpg'
}

const s = http.createServer((req, res) => {
    console.log(req.url);
    if (req.url === '/') {
        fs.readFile('public/html.html', (e,d) => {
            res.write(!e ? d : 'Файл упал', 'utf8');
            res.end();
        });
    } else {
        let fileExt = '.' + req.url.split('.').pop(); 
        res.writeHead(200, {
            "Content-Type": mimeTypes[fileExt]
        });
        if (fileExt === '.jpeg' || fileExt === '.jpg') {
            fs.readFile('public' + req.url, (e,d) => {
                res.write(d, 'binary');
                res.end();
            });
        } else {
            fs.readFile('public' + req.url, (e,d) => {
                res.write(d, 'utf8');
                res.end();
            });
        }
    }
});

s.listen(PORT, err => !err && console.log('Ваш сервер отчаянно работает...'));