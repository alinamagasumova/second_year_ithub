const f = require('../functions.js');
function Auto(a,b,c) {
    this.model = a;
    this.color = b;
    this.year = c;
}
let cnt = 100, park = [];
while (cnt--) {
    park.push(new Auto('Tesla', 'rgb(102, 43, 12', '2020'));
};

Auto.prototype.changeColor = function() {
    this.color = `rgb(${f.getNumber(256)}, ${f.getNumber(256)}, ${f.getNumber(256)})`;
};

for (let i = 0; i<park.length; i++) {
    park[i].changeColor();
};

park.sort((a,b) => {
    return a.color > b.color ? 1 : -1
});

