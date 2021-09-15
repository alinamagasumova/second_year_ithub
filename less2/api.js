let myMap;

function init(){
    myMap = new ymaps.Map("map", {
    center: [50.450458, 30.523460],
    zoom: 9
    });
    MyIconContentLayout = ymaps.templateLayoutFactory.createClass(
            '<div style="color: #FFFFFF; font-weight: bold;">$[properties.iconContent]</div>'
        ),

        myPlacemark = new ymaps.Placemark([50.450458, 30.523460], {
            hintContent: 'Нажми на меня',
            balloonContent: 'Хохол',
        }, {
            iconLayout: 'default#image',
            iconImageHref: 'volchuk.jpg',
            iconImageSize: [90, 80],
            iconImageOffset: [-40, 20]
        });

    myMap.geoObjects
        .add(myPlacemark)

    myMap.behaviors.disable('drag');
    myMap.behaviors.disable('scrollZoom');
}

function showMe(){
    navigator.geolocation.getCurrentPosition(function(position) {
        if ("geolocation" in navigator) {
            myMap = new ymaps.Map("map", {
                center: [position.coords.latitude, position.coords.longitude],
                zoom: 14
                })

                
            myGeoObject = new ymaps.GeoObject({
                geometry: {
                    type: "Point",
                    coordinates: [position.coords.latitude, position.coords.longitude]
                }
            });

            myMap.geoObjects
                .add(myGeoObject)
                
        } else {
            alert("Извините, нет доступной позиции.");
            console.log('lala');
        }
    })
}

