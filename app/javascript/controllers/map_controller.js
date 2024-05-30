import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue
    console.log(this.apiKeyValue)
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })
    this.#addMarkersToMap()
  }
  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([ marker.longitude, marker.latitude ])
        .addTo(this.map)
    })
  }
}
