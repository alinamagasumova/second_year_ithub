// console.log('Алина! Ты супер! И Серёжа тоже =) а Маша?((');
let fs = require('fs');
let text = fs.readFileSync('synonim.txt', 'utf8');
let result = '';
for (let i=0; i < text.length; i++) {
    if (text[i] === '\n' || text[i] === '\r') {
        result += ' ';
    } else {
        result += text[i];
    }
}
console.log(result);
fs.writeFileSync('file.txt', result, 'utf8');
