document.addEventListener('DOMContentLoaded', function () {
    const mapContainer = document.createElement('div');
    mapContainer.style.width = '100%';
    mapContainer.style.height = '400px';
    document.querySelector('#location').closest('div').appendChild(mapContainer);

    const map = new kakao.maps.Map(mapContainer, {
        center: new kakao.maps.LatLng(37.566535, 126.9779692), // 초기 중심 좌표
        level: 3 // 지도 레벨
    });

    const marker = new kakao.maps.Marker({
        position: map.getCenter(),
        map: map
    });

    const geocoder = new kakao.maps.services.Geocoder();

    kakao.maps.event.addListener(map, 'click', function (mouseEvent) {
        const latlng = mouseEvent.latLng;

        marker.setPosition(latlng); // 마커 이동
        document.querySelector('#id_latitude').value = latlng.getLat(); // 위도
        document.querySelector('#id_longitude').value = latlng.getLng(); // 경도

        geocoder.coord2Address(latlng.getLng(), latlng.getLat(), function (result, status) {
            if (status === kakao.maps.services.Status.OK) {
                document.querySelector('#id_location').value = result[0].address.address_name; // 주소
            }
        });
    });
});
