// import { DirectUpload } from "activestorage";

$(document).ready(function () {
    $('.categories_select').select2();
    $('.speakers_select').select2();
    $('.languages_select').select2();

    // Bind to file drop - use the ondrop on a parent element or use a
    //  library like Dropzone
    // var onDrop = (event) => {
        // event.preventDefault()
        // const files = event.dataTransfer.files;
        // Array.from(files).forEach(file => uploadFile(file))
    // }

    // Bind to normal file selection

    /*pond.on('addfile', (error, file) => {
        if (error) {
            console.log('Oh no');
            return;
        }
        console.log("here")
        //uploadFile(file.file)
    });

    const uploadFile = (file) => {
        // your form needs the file_field direct_upload: true, which
        //  provides data-direct-upload-url
        const url = "<%= rails_direct_uploads_url %>";
        const uploader = new Uploader(file, url)

        uploader.upload.create((error, blob) => {
            if (error) {
            } else {
                console.log("uploading")
                // Add an appropriately-named hidden input to the form with a
                //  value of blob.signed_id so that the blob ids will be
                //  transmitted in the normal upload flow
                const hiddenField = document.createElement('input')
                hiddenField.setAttribute("type", "hidden");
                hiddenField.setAttribute("value", blob.signed_id);
                hiddenField.name = "cd[tracks][]"
                document.querySelector('form').appendChild(hiddenField)
            }
        })
    } */

//     addEventListener("direct-upload:initialize", event => {
//         const { target, detail } = event
//         const { id, file } = detail
//         target.insertAdjacentHTML("beforebegin", `
//     <div id="direct-upload-${id}" class="direct-upload direct-upload--pending">
//       <div id="direct-upload-progress-${id}" class="direct-upload__progress" style="width: 0%"></div>
//       <span class="direct-upload__filename">${file.name}</span>
//     </div>
//   `)
//     })

//     addEventListener("direct-upload:start", event => {
//         const { id } = event.detail
//         const element = document.getElementById(`direct-upload-${id}`)
//         element.classList.remove("direct-upload--pending")
//     })

//     addEventListener("direct-upload:progress", event => {
//         const { id, progress } = event.detail
//         const progressElement = document.getElementById(`direct-upload-progress-${id}`)
//         progressElement.style.width = `${progress}%`
//     })

//     addEventListener("direct-upload:error", event => {
//         event.preventDefault()
//         const { id, error } = event.detail
//         const element = document.getElementById(`direct-upload-${id}`)
//         element.classList.add("direct-upload--error")
//         element.setAttribute("title", error)
//     })

//     addEventListener("direct-upload:end", event => {
//         const { id } = event.detail
//         const element = document.getElementById(`direct-upload-${id}`)
//         element.classList.add("direct-upload--complete")
//     })

    
});