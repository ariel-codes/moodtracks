import {Controller} from "@hotwired/stimulus"

// Connects to data-controller="track-search"
export default class extends Controller {
    static targets = ["modal"]

    connect() {
        this.modalTarget.setAttribute('inert', '')
    }

    disconnect() {
        this.modalTarget.removeEventListener("close", this.close)
    }

    open = (ev) => {
        ev.preventDefault()
        this.modalTarget.showModal()
        this.modalTarget.removeAttribute('inert')
        this.modalTarget.addEventListener("close", this.close)
    }

    close = (ev) => {
        ev.preventDefault()
        this.modalTarget.setAttribute('inert', '')
        this.modalTarget.close()
    }
}
