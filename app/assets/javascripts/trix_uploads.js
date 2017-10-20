// Turn off the default Trix captions
// Trix.config.attachments.preview.caption = {
//   name: false,
//   size: false
// };

// function uploadAttachment(attachment) {
//   // Create our form data to submit
//   var file = attachment.file;
//   var form = new FormData;
//   form.append("Content-Type", file.type);
//   form.append("forum_thread[forum_posts_attributes][0][body]", file);
  
//   console.log('file: ',file);
//   console.log('form: ',form);
//   // Create our XHR request
//   var xhr = new XMLHttpRequest;
//   console.log('xhr: ', xhr);
//   xhr.open("POST", "/forum_threads.json", true);
//   xhr.setRequestHeader("X-CSRF-Token", Rails.csrfToken());

//   // Report file uploads back to Trix
//   xhr.upload.onprogress = function(event) {
//     var progress = event.loaded / event.total * 100;
//     attachment.setUploadProgress(progress);
//   }

//   // Tell Trix what url and href to use on successful upload
//   xhr.onload = function() {
//     if (xhr.status === 201) {
//       var data = JSON.parse(xhr.responseText);
//       return attachment.setAttributes({
//         url: data.image_url,
//         href: data.url
//       })
//     }
//   }

//   return xhr.send(form);
// }

(function() {
  var createStorageKey, host, uploadAttachment;

  Trix.config.attachments.preview.caption = {
    name: false,
    size: false
  };

  document.addEventListener("trix-attachment-add", function(event) {
    var attachment;
    attachment = event.attachment;
    if (attachment.file) {
      return uploadAttachment(attachment);
    }
  });

  host = "https://d13txem1unpe48.cloudfront.net/";

  uploadAttachment = function(attachment) {
    var file, form, key, xhr;
    file = attachment.file;
    key = createStorageKey(file);
    form = new FormData;
    form.append("key", key);
    form.append("Content-Type", file.type);
    form.append("", file);
    xhr = new XMLHttpRequest;
    xhr.open("POST", host, true);
    xhr.upload.onprogress = function(event) {
      var progress;
      progress = event.loaded / event.total * 100;
      return attachment.setUploadProgress(progress);
    };
    xhr.onload = function() {
      var href, url;
      if (xhr.status === 204) {
        url = href = host + key;
        return attachment.setAttributes({
          url: url,
          href: href
        });
      }
    };
    return xhr.send(form);
  };

  createStorageKey = function(file) {
    var date, day, time;
    date = new Date();
    day = date.toISOString().slice(0, 10);
    time = date.getTime();
    return "tmp/" + day + "/" + time + "-" + file.name;
  };

}).call(this);

// Listen for the Trix attachment event to trigger upload
document.addEventListener("trix-attachment-add", function(event) {
  var attachment = event.attachment;
  if (attachment.file) {
    return uploadAttachment(attachment);
  }
});