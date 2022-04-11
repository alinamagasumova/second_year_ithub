let data = [
    {name: "Шпиц", src: "/images/1.jpg"},
    {name: "Йорик", src: "/images/2.jpg"},
    {name: "Лайка", src: "/images/3.jpg"},
    {name: "Хаски", src: "/images/4.jpg"},
];

let outer = document.querySelector(".container");
data.forEach( e => {
   outer.innerHTML += `
        <div class='card' data-src='${e.src}' data-name='${e.name}'>${e.name}</div>`;
});

let other = document.createElement('div');
other.className = 'card';
other.style.height = '100px';
other.setAttribute('data-src', '/images/5.jpg')
let inp = document.createElement('input');
other.append(inp);
outer.append(other);
inp.addEventListener('click', e => {
    e.stopPropagation();
});
inp.addEventListener('input', e => {
    e.target.parentElement.setAttribute('data-name', e.target.value);
});

outer.querySelectorAll('.card').forEach(card => {
    card.addEventListener('click', (e) => {
        // let name = self.getAttribute('data-name');
        // let src = self.getAttribute('data-src');
        // let address = `/personal?name=${name}&img=${src}`;
        // location.replace(`/personal?name=${name}&img=${src}`);
        location.replace(`/personal?name=${e.target.getAttribute('data-name')}&img=${e.target.getAttribute('data-src')}`); // отправить по другому адресу
    });
});