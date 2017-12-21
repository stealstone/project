var InputImage =
    (function loadImageFile() {
    if (window.FileReader) {
        var ImagePre;
        var ImgReader = new window.FileReader();
        var fileType = /^(?:image\/bmp|image\/gif|image\/jpeg|image\/png|image\/x\-xwindowdump|image\/x\-portable\-bitmap)$/i;
 
        ImgReader.onload = function (Event) {
            if (!ImagePre) {
                var newPreview = document.getElementById("mark");
                ImagePre = new Image();
                ImagePre.style.width = "180px";
                ImagePre.style.height = "110px";
                newPreview.appendChild(ImagePre);
            }
            ImagePre.src = Event.target.result;
             
        };
 
        return function () {
             
            var img = document.getElementById("markupload").files;
            
            if (!fileType.test(img[0].type)) {
                alert("이미지 파일을 업로드 하세요");
                return;
            }
             
            ImgReader.readAsDataURL(img[0]);
        }
 
    }
            
            document.getElementById("mark").src = document.getElementById("markupload").value;       
})();