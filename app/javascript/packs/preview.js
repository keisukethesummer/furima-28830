if (document.URL.match( /new/ ) || document.URL.match( /edit/ )){
  document.addEventListener('DOMContentLoaded', function(){
    const ImageList = document.getElementById('image-list');

    document.getElementById('item-image').addEventListener('change', function(e){
      const imageContent = document.querySelector('img');
      if (imageContent){
        imageContent.remove();
      }

      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);//「window」は様々なデータが格納されている

      const imageElement = document.createElement('div');
      const blobImage = document.createElement('img');
      blobImage.setAttribute('src', blob);
      blobImage.setAttribute('class', 'item-image');

      imageElement.appendChild(blobImage);
      ImageList.appendChild(imageElement);
      });
  });
}