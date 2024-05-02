import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "address", "latitude", "longitude" ]

  connect() {
    this.addressTarget.addEventListener('change', () => {
      this.geocodeAddress()
    })
    if (!this.addressTarget.value) {
      this.getUserLocation()
    }
  }

  geocodeAddress() {
    const address = this.addressTarget.value
    fetch(`https://api.mapbox.com/geocoding/v5/mapbox.places/${encodeURIComponent(address)}.json?access_token=YOUR_MAPBOX_API_KEY`)
      .then(response => response.json())
      .then(data => {
        if (data.features.length > 0) {
          const coordinates = data.features[0].geometry.coordinates
          this.latitudeTarget.value = coordinates[1]
          this.longitudeTarget.value = coordinates[0]
        }
      })
  }

  getUserLocation() {
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition((position) => {
        this.latitudeTarget.value = position.coords.latitude
        this.longitudeTarget.value = position.coords.longitude
      })
    }
  }
}
