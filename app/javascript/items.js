window.addEventListener('load',function(){
  document.getElementById('item-price').addEventListener('keydown', () => {
    const XHR = new XMLHttpRequest();
    XHR.open("GET",'/items/new',true);
    XHR.responseType = "json";
    XHR.onreadystatechange = function (){
      if (XHR.readyState == 4 && XHR.status == 200){
        const price = document.getElementById('item-price').value;
        document.getElementById('add-tax-price').textContent = Math.floor(price / 10).toLocaleString();
        document.getElementById('profit').textContent = Math.floor(price * 0.9).toLocaleString();
      }
    }
    XHR.send();
  });
});