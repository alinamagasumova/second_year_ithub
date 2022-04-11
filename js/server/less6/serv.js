const http = require('http');
const fs = require('fs');
const PORT = 3000;
const server = http.createServer((req, res) => {
    // res.write('<h3>Sponge Bob</h3><img src="sponge.jpeg" type="image/jpeg">');
    let img = fs.readFileSync('sponge.jpeg');
    console.log(img);
    res.write(img)
    res.end();
});
server.listen(PORT, err =>{
    console.log(`Server starting on port ${PORT}`);
}); 