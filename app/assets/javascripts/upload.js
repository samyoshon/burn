// $(document).on("turbolinks:load", function() {

//   $("[type=file]").fileupload({
//     add: function(e, data) {
//       data.progressBar = $('<div class="progress" style="width: 300px"><div class="progress-bar"></div></div>').insertAfter("body");
//       var options      = {
//         extension: data.files[0].name.match(/(\.\w+)?$/)[0], // set the file extension
//         _: Date.now() // prevent caching
//       };

//       $.getJSON("/images/upload/cache/presign", options, function(result) {
//         data.formData  = result.fields;
//         data.url       = result.url;
//         data.paramName = "file";
//         data.submit();
//       });

//     },

//     progress: function(e, data) {
//       var progress   = parseInt(data.loaded / data.total * 100, 10);
//       var percentage = progress.toString() + '%';
//       data.progressBar.find(".progress-bar").css("width", percentage).html(percentage);
//     },

//     done: function(e, data) {
//       data.progressBar.remove();

//       var image = {
//         id:       data.formData.key.match(/cache\/(.+)/)[1], // we have to remove the prefix part
//         storage:  'cache',
//         metadata: {
//           size:      data.files[0].size,
//           filename:  data.files[0].name.match(/[^\/\\]+$/)[0], // IE return full path
//           mime_type: data.files[0].type
//         }
//       };

//       var form      = $(this).closest("form");
//       var form_data = new FormData(form[0]);
//       form_data.append($(this).attr("name"), JSON.stringify(image));

//       $.ajax(form.attr("action"), {
//         contentType: false,
//         processData: false,
//         data:        form_data,
//         method:      form.attr("method"),
//         dataType:    "json",
//         success: function(response) {
//           var $img = $("<img/>", {src: response.image_url, width: 400});
//           var $div = $("<div/>").append($img);
//           $("#images").append($div);
//         }
//       });
//     }
//   });

// });
