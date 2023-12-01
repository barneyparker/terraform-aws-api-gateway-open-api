// make a call to /mock and insert the response inside the element with id="content"
fetch('/mock')
  .then(response => response.json())
  .then(data => {
    document.getElementById('mock').innerHTML = data.message;
  });

fetch('/lambda')
  .then(response => response.json())
  .then(data => {
    document.getElementById('lambda').innerHTML = JSON.stringify(data, null, 2);
  });