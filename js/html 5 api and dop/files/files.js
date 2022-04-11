const inp = document.querySelector('#myFile');
inp.addEventListener('change', getFile);
function getFile(e) {
  let file = e.target.files[0];
  // console.log(file.name, file.type, file.size);
  // console.log(file.lastModified);
  const reader = new FileReader();
  reader.onload = function (e) {
    document.querySelector('#content').textContent = e.target.result;
  };
  reader.readAsText(file);
}

const inp2 = document.querySelector('#myFiles');
inp2.addEventListener('change', getFiles);

function getFiles(e) {
  let files = e.target.files;
  const div = document.querySelector('#content');

  for(let i=0; i<files.length; ++i) {
    let file = files[i];
    let reader = new FileReader();

    reader.onload = function (e) {
      div.textContent += e.target.result;
    };

    reader.readAsText(file, 'utf-8');
  }
}

const inp3 = document.querySelector('#myImage');
inp3.addEventListener('change', getImage);
function getImage(e) {
  let image = e.target.files[0];
  const reader = new FileReader();
  reader.onload = function (e) {
    document.querySelector('#myImg').src = e.target.result;
  };
  reader.readAsDataURL(image);
}