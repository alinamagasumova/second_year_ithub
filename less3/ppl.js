class Person {
    constructor(name, surname, gender, birthDate) {
        this.name = name;
        this.surname = surname;
        this.docName = `${name.charAt(0)}` + '. ' + `${surname}`;
        this.gender = gender;
        this.birthDate = birthDate;
    }
}
let fs = require('fs');
let text = fs.readFileSync('ppl.csv', 'utf8');
let arr = text.split('\n');
arr.shift();

let arrObj = [];
arr.forEach((e) => {
    arrObj.push(e.split(";"))
});
arrObj.forEach((e) => {
    e.pop()
});

let people = [];
for (let i=0; i<arrObj.length; i++) {
    people.push(new Person(...arrObj[i]));
};

let male = [];
for (let i = 0; i < people.length; i++) {
    if (people[i].gender === "male") {
        male.push(people[i].docName);
    }
 };