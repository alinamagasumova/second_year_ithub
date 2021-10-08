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
    let reader = new FileReader();
    reader.onloadend = function(e) {
        let img = new Image();
        // let img = document.createElement('img'); то же самое, что и выше!
        img.src = e.target.result;
        // box.appendChild(img);
        box.style.backgroundImage = "url(" + e.target.result + ")";
    }
    reader.readAsDataURL(file);
}