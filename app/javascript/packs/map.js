import mapboxgl from 'mapbox-gl';
var map;

const buildMap = () => {
  const mapElement = document.getElementById('map');

  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/snehamadlani/ck2nfv8w31afe1cmplonktdaf'
  });
};

const addMarkersToMap = (map, markers) => {
    const mapElement = document.getElementById('map');

  console.log(markers)
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

     // Create a HTML element for your custom marker
    const element = document.createElement('div');
    element.className = 'marker';
    element.style.backgroundImage = `url('${marker.image_url}')`;
    element.style.backgroundSize = 'contain';
    element.style.width = '25px';
    element.style.height = '25px';

    new mapboxgl.Marker(element)
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(map);
  });
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
};

const initMapbox = async () => {
  const mapElement = document.getElementById('map');

  if (mapElement) {
      map = await buildMap();
    const markers = JSON.parse(mapElement.dataset.markers);
    if (markers) {
      addMarkersToMap(map, markers);
      fitMapToMarkers(map, markers);
    }
    const tab = document.getElementById("nav-profile-tab");
    tab.addEventListener("click", () => {
    console.log(map)
     setTimeout(function() { map.resize() }, 250)
    tab.click()
  });

  }
};

initMapbox()
