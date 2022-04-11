const express = require('express');
const router = require('./routes/router.js');
const app = express();
app.use(express.static('./public'));
app.set('view engine', 'hbs');
app.set('views', './views');

app.use('/', router);

// process.env - глобальный объект. process environments. переменная среды.
app.listen(process.env.PORT || 1011, e => {
    console.log('Server runs at port ' + process.env.PORT + ' or 1011');
});