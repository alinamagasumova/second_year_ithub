const area = document.querySelector('#area');
const img = document.querySelector('img');
img.draggable = true;
area.ondragenter = onDrag;
area.ondragover = onDrag;
area.ondrop = onDrop;

function onDrag(e) {
    e.stopPropagation();
    e.preventDefault();
}
console.log(img.height);
function onDrop(e) {
    // img.style.display = "none";
    // area.style.backgroundImage = "url(" + img.src + ")";
    area.appendChild(img);
    area.style.height = `${img.height}` + 'px';
    area.style.width = `${img.width}` + 'px';
    area.firstElementChild.remove();
    //DataTransfer setData getData
}