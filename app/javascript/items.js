window.addEventListener('load',function(){
  document.getElementById('item-price').addEventListener('keydown', () => {
    const XHR = new XMLHttpRequest();
    XHR.open("GET",'/items/new',true);
    XHR.responseType = "json";
    XHR.onreadystatechange = function (){
      if (XHR.readyState == 4 && XHR.status == 200){
        document.getElementById('add-tax-price').textContent = Math.floor(document.getElementById('item-price').value / 10);
        document.getElementById('profit').textContent = Math.floor(document.getElementById('item-price').value * 0.9);
      }
    }
    XHR.send();
  });
});