window.addEventListener("load", (e) => {
    const board = document.querySelector(".board");
    const cInp = document.querySelector('[type=\'color\']');
    const sizeInp = document.querySelector('[type=\'range\']');
    let isPoint = false,
        color = cInp.value,
        size = sizeInp.value

    const setPoint = (x, y, size = 10, color='black') => {
        let boardRect = board.getBoundingClientRect();
        let posX, posY;
        if (x - size / 2 < boardRect.left) {
            x = boardRect.left;
        } else if (x > boardRect.right){
            x = boardRect.right;
        }
        if (y - size / 2 < boardRect.top) {
            y = boardRect.top;
        } else if (y > boardRect.bottom){
            y = boardRect.bottom;
        }
        const point = document.createElement("div");
        // point.className = "point";
        console.log(e);
        point.style = `
            width: ${size}px;
            height: ${size}px;
            border-radius: 50%;
            background-color: ${color};
            position: fixed;
            top: ${y - size / 2}px;
            left: ${x - size / 2}px;
        `
        board.appendChild(point);
    }
    const paintHandler = (e) => {
        /*
        *  mousedown
        *  mousemove
        *  mouseup
        * */
        switch(e.type) {
            case "mousedown":
                isPoint = true;
                setPoint(e.clientX, e.clientY, size, color);
                break
            case "mousemove":
                if(isPoint) setPoint(e.clientX, e.clientY, size, color)
                break
            case "mouseup":
                isPoint = false;
                break
        }
    }
    board.addEventListener("mousemove", paintHandler);
    board.addEventListener("mousedown", paintHandler);
    board.addEventListener("mouseup", paintHandler);
    cInp.addEventListener('change', (e) => {color = e.target.value});
    sizeInp.addEventListener('change', (e) => {color = e.target.value});
});
