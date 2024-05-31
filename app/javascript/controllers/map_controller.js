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
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10",
      center: [this.markersValue[0].longitude, this.markersValue[0].latitude],
      zoom: 14,
    })
    this.map.addControl(new mapboxgl.NavigationControl());
    this.#addMarkersToMap()
  }
  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const el = document.createElement('div');
      el.innerHTML = marker.marker_html;
      el.className = 'custom-marker';
      //el.style.backgroundImage = 'url(../assets/images/spotz_symbol.png)';
      el.style.width = '32px';
      el.style.height = '32px';
      //el.style.backgroundSize = '100%';
      new mapboxgl.Marker(el)
        .setLngLat([ marker.longitude, marker.latitude ])
        .addTo(this.map)
    })
  }
}
