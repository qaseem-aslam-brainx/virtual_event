import { Controller } from "stimulus"
export default class extends Controller{
  show() {
    var file = document.getElementById("image-path").files[0];

    console.log(file);

    var reader = new FileReader();
    reader.onload = function(){
      document.getElementById("img-preview").src = reader.result;
    };
    reader.readAsDataURL(file);
    document.getElementById("logo-label").innerText = file.name
  }
}