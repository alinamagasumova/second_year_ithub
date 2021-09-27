const http = require('http');
// const https = require('https');
// методы передачи данных (get/post/put/delete)
const server = http.createServer((request, response) => {
    // request - запрос от пользователя
    // response - ответ от сервера
    response.write('<h1 style="background:#115; color: white; text-align: center;">Hey!</h1>');
    response.end();
});
server.listen(3000); // http://localhost:3000
// 3000, 4000, 5000
//локальный айпи адрес = localhost