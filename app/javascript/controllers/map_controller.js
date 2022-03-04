import { Controller } from 'stimulus'
import mapboxgl from 'mapbox-gl'
import marker from '../../assets/images/map-marker.png'
import 'mapbox-gl/dist/mapbox-gl.css'

export default class extends Controller {
    static values = {
        options: Object
    }
    connect() {
        mapboxgl.accessToken = this.optionsValue.accessToken
        this.map = new mapboxgl.Map({
            container: this.element,
            style: 'mapbox://styles/mapbox/streets-v11',
            center: [this.optionsValue.geometry.long, this.optionsValue.geometry.lat],
            zoom: 11
        });

        const element = new DOMParser().parseFromString(`
            <div style="background-image: url('${marker}'); width: 32px; height: 32px; background-size: 100%;" class="marker" />
        `, 'text/html').firstChild;

        new mapboxgl.Marker({ element }).setLngLat([this.optionsValue.geometry.long, this.optionsValue.geometry.lat]).addTo(this.map);
    }
}
