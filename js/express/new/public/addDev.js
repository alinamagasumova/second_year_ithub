const addDev = document.forms.add;

addDev.addEventListener('submit', e => {
    e.preventDefault();
    let data = {};
    let childArr = e.target.elements;
    for (let i=0, cnt = childArr.length; i < cnt; i++) {
        if (childArr[i].name) {
            data[childArr[i].name] = childArr[i].value;
        }
    }
    sendForm(data);
});

// fetch и await только с async
const sendForm = async function(body) {
    let str = '';
    for (let k in body) {
        str += k + '=' + body[k] + '&';
    }
    let res = await fetch('/add?' + str);
    let data = await res.json();
    console.log(data);
    location.replace("/")
}