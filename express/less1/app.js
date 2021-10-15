const exp = require('express');
const port = 3001;
const server = exp();

const r1 = require('./routes/mainRouter');
const r2 = require('./routes/additionalRouter');

server.get('/', (req,res)=>{
    res.send('Hey');
});

server.use('/main', r1);
server.use('/add', r2);
server.listen(port, err => !err & console.log('go girl'));