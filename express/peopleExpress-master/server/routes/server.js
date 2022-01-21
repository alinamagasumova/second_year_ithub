const router = require("express").Router();

router.get('/personal', (req, res) => {
    const name = req.query.name;
    const img = req.query.img;
    // req.query - получение данных от клиента, переданных при помощи get-запроса (в адресной строке браузера)
    res.send(`
        <div>
            <img src='${img}' alt='${name} style='height=220px'>
            <h1>${name}</h1>
            <a href='/'>На главную</a>
        </div>
    `);
});

module.exports = router;