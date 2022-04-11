const express = require('express');
const app = express();
const port = 3009;

app.use(express.static('./public'));
// app.get('/', (req, res) => {
//     res.send(`
//         <h1>Sad face</h1>
//         <ul>
//             <li><a href="/nya">Page 1</a></li>
//             <li><a href="/lya">Page 2</a></li>
//         </ul>
//     `)
// });



app.get('/', (req, res) => {
    res.send()
});
app.get('/vin', (req, res) => {
    res.send(`<h1>VIN</h1><a href='/ta'>Click if you want continuation</a>`)
});
app.get('/ta', (req, res) => {
    res.send(`<h1>TA</h1><a href='/'>One more time</a>`)
});

app.listen(port, err => {
    console.log('AAaaAaAA');
});