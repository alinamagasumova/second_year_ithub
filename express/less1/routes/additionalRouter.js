const router = require('express').Router();

router.get('/', (req,res)=>{
    res.send('alina page');
});
router.get('/secret', (req,res)=>{
    res.send('go away');
});

module.exports = router;