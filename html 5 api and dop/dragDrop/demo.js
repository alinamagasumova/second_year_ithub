const div = document.querySelector('div');
div.draggable = true;
div.ondragstart = function(){console.log('start')};
div.ondragend = function(){console.log('end')};
div.ondrag = function(){console.log('drag')};

const area = document.querySelector('#area');
area.ondragenter = () => {console.log('enter')};
// area.ondragleave = () => {console.log('leave')};
area.ondragover = () => {console.log('over'); return false};
area.ondrop = () => {console.log('drop')};