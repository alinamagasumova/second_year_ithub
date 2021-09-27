const box = document.querySelector('#box');
box.ondragenter = onDrag;
box.ondragover = onDrag;
box.ondrop = onDrop;

function onDrag(e) {
    e.stopPropagation();
    e.preventDefault();
}

function onDrop(e) {
    let file = e.dataTransfer.files[0];
       
}