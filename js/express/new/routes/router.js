const router = require('express').Router();
const fs = require("fs");
const names = fs.readFileSync("./file.txt", "utf8").split("\n");
// names = names.split("\n")
console.log(names);


router.get('/', (rq, rs) => {
    rs.render('index', {
        list: names
    });
});

router.get('/new', (rq, rs) => {
    rs.render('form');
});

router.get('/add', (rq, rs) => {
    console.log(rq.query);
    if (rq.query.name) {
        names.push(rq.query.name);
        fs.writeFile("./file.txt", names.join("\n"), "utf8", (err, data) => {});
        rs.send({msg: "Я большая молодец"});
        // rs.redirect("/");
    } else {
        rs.send({msg: "Что-то пошло не так"})
    }
    rs.send({msg: 'Я большая молодец'});
});

module.exports = router;