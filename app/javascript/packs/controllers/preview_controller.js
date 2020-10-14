import { Controller } from "stimulus"

export default class extends Controller {
  // change impPath to imageInput
  static targets = ["imgPath", "imgPreview", "logoLabel"]

  show() {
    let file = this.imgPathTarget.files[0]
    this.logoLabelTarget.innerText = file.name

    this.reader = new FileReader()
    this.reader.onload = this.setPreview.bind(this)

    this.reader.readAsDataURL(file)
  }

  setPreview() {
    this.imgPreviewTarget.src = this.reader.result
  }
}
