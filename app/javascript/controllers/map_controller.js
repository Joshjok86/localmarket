import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/standard"
    })
    this.#addMarkersToMap()
    if (this.markersValue.length > 0) {
      this.#fitMapToMarkers()
    }

    this.map.addControl(new mapboxgl.GeolocateControl({
      positionOptions: {
          enableHighAccuracy: true
      },
      trackUserLocation: true,
      showUserLocation: true,
      showUserHeading: true
    }));
    const nav = new mapboxgl.NavigationControl();
    this.map.addControl(nav, 'bottom-right');
    // Get the latitude and longitude from the hidden fields
    const latitude = parseFloat(document.getElementById('latitude').value)
    const longitude = parseFloat(document.getElementById('longitude').value)
    // If the latitude and longitude are valid, create a marker
    if (!isNaN(latitude) && !isNaN(longitude)) {
      new mapboxgl.Marker({ color: 'blue' })
        .setLngLat([longitude, latitude])
        .addTo(this.map)
    }
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(this.map)
    })}

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 150 })
  }
}
