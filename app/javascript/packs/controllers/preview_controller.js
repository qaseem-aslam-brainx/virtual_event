import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["imageInput", "imgPreview", "logoLabel"]

  show() {
    let file = this.imageInputTarget.files[0]
    this.logoLabelTarget.innerText = file.name

    this.reader = new FileReader()
    this.reader.onload = this.setPreview.bind(this)

    this.reader.readAsDataURL(file)
  }

  setPreview() {
    this.imgPreviewTarget.src = this.reader.result
  }
}
