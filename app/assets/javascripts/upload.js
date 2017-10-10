function previewFiles() {
  $('#preview').empty();

  var preview = document.querySelector('#preview');
  var files   = document.querySelector('input[type=file]').files;


  function readAndPreview(file) {

    // Make sure `file.name` matches our extensions criteria
    if ( /\.(jpe?g|png|gif)$/i.test(file.name) ) {
      var reader = new FileReader();

      reader.addEventListener("load", function () {
        var image = new Image();
        image.height = 100;
        image.title = file.name;
        image.src = this.result;
        preview.appendChild( image );
      }, false);

      reader.readAsDataURL(file);
    }

  }

  if (files) {
    [].forEach.call(files, readAndPreview);
  }


  // frontend validation
  var fi = document.getElementById('image-form'); // GET THE FILE INPUT.
        $('#product-submit-btn').prop('disabled', false);
        $('#fp').empty();
        // VALIDATE OR CHECK IF ANY FILE IS SELECTED.
        if (fi.files.length > 0) {
            // RUN A LOOP TO CHECK EACH SELECTED FILE.
            for (var i = 0; i <= fi.files.length - 1; i++) {
                var fsize = fi.files.item(i).size;      // THE SIZE OF THE FILE.
                if (fsize/1024 > 2048) {    // 2048 = 2MB
                  document.getElementById('fp').innerHTML = document.getElementById('fp').innerHTML + '<br /> ' + fi.files.item(i).name + ' is too big. Attachment size limit is 2MB.'; //+ Math.round((fsize / 1024)) + ' KB';
                  $('#product-submit-btn').prop('disabled', true);
                }
            }
        }
 


}

$(document).on('turbolinks:load', function() {
  $('#image-form').on('change', function(evt) {
    // console.log(this.files[0].size);
  });
});
