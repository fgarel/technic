/*
 * Copyright (c) 2012-2014 Wolfram Schneider, http://bbbike.org
 * Copyright (c) 2011 Geofabrik GmbH, http://geofabrik.de
 *
 * BSD 2-clause license ("Simplified BSD License" or "FreeBSD License")
 * see ./COPYRIGHT.txt
 *
 */

/* run JavaScript code in strict mode, HTML5 */
"use strict";


// MapCompare config
var mc = {
    // Berlin downtown
    pos: {
        "lng": 13.38885,
        "lat": 52.51703,
        "zoom": 11
    },

    // debug
    debug: 0,

    // 0: none, 1: one line, 2: all message
    // number of maps, by default 2 maps are displayed in a table
    // up to 8 are supported
    NumberOfMaps: 4,

    // if set to zero, display all maps
    NumberOfMapsMax: 0,
    // always show N maps links
    NumberOfMapsLinks: 8,
    // open a 3rd row for more than N maps
    row3: 10,
    // open a 4rd row for more than N maps
    row4: 21,
    // open a 5rd row for more than N maps
    row5: 32,

    // pre-selected maps in columns
    mt: ['mapnik-german', 'google-map', 'hike_bike', 'bbbike-german', 'esri-topo', 'mapquest-eu', 'bing-map', 'nokia-public_transit'],
    // 'soviet-military'],
    // preferences expire after N days
    preferences_expire: 180,
    // map sorting options
    sort: {
        name: 1,
        // by map name
        type: 0,
        // by map type
        bbbike: 1,
        // 0: none, 1: bbbike first
        osm: 1 // 0: none, 1: osm first/second
    },

    sort_overlay: {
        name: 1,
        opacity: 1
    },

    // with social links in footer
    social: true,

    // transparent overlay maps
    overlay: {
        enabled: true,
        type: "slider",
        /* select | slider */

        value: 70,
        /* in percent */
        select_step: 10,
        slider_step: 5,

        // pre-selected overlay
        mt_overlay: ['none']
    },

    numZoomLevels: 19
};


/*
   configure profiles

   can be used as short URLs: /mc/?profile=nokia


 */
var profile = {
    here: {
        mt: ['nokia-map', 'nokia-satellite', 'nokia-hybrid', 'nokia-terrain', 'nokia-public_transit', 'nokia-traffic']
    },
    google: {
        mt: ['google-map', 'google-map-mapmaker', 'google-physical', 'google-satellite', 'google-hybrid', 'google-hybrid-mapmaker', 'google-bicycle-map', 'google-traffic-map', 'google-transit-map', 'google-layers-physical', 'google-panoramio-physical', 'google-weather-sat']
    },
    satellite: {
        mt: ['google-satellite', 'bing-satellite', 'yahoo-satellite', 'mapquest-satellite', 'nokia-satellite', 'mapbox-satellite', 'yandex-satellite']
    },
    mapnik: {
        mt: ['mapnik', 'mapnik-german', 'osm-no-labels', 'mapnik-bw']
    },
    transit: {
        mt: ['transport', 'nokia-public_transit', 'public_transport', 'public_transport_lines', 'google-transit-map']
    },
    bing: {
        mt: ['bing-map', 'bing-satellite', 'bing-hybrid']
    },
    yahoo: {
        mt: ['yahoo-map', 'yahoo-satellite', 'yahoo-hybrid']
    },
    osm: {
        mt: ['mapnik', 'mapnik-german', 'mapnik-bw', 'toner', 'watercolor', 'cyclemap', 'osm-no-labels', 'transport', 'public_transport', 'hike_bike', 'wanderreitkarte', 'mapbox', 'mapquest-eu', 'skobbler']
    },
    cycle: {
        mt: ['bbbike-german', 'bbbike-smoothness', 'cyclemap', 'bicycle_network', 'adfc-radwege', 'hike_bike']
    },
    bbbike: {
        mt: ['bbbike', 'bbbike-german', 'google-map', 'bbbike-smoothness', 'hike_bike', 'mapnik-german']
    },
    topo: {
        mt: ['google-physical', 'google-layers-physical', 'esri-topo', 'esri', 'nokia-terrain', 'cyclemap', 'yahoo-map', 'landscape', 'wanderreitkarte', 'maptoolkit-topo', 'opentopomap', 'landshaded', 'hillshading', 'komoot'] // 'soviet-military',
    },
/*
    cloudmade: {
        mt: ['cloudmade-map', 'cloudmade-fineline', 'cloudmade-midnight', 'cloudmade-paledawn', 'cloudmade-tourist', 'cloudmade-blackout', 'cloudmade-thin', 'cloudmade-cyclewalk']
    },
    */
    berlin: {
        mt: ['bbbike-german', 'bbbike-smoothness', 'google-map', 'bvg', 'transport', 'nokia-public_transit']
    },
    openmapsurfer: {
        mt: ['osm-roads', 'osm-roads-greyscale', 'osm-semitransparent', 'aster-gdem-srtm-hillshade', 'aster-gdem-contour-lines', 'osm-administrative-boundaries']
    },
    esri: {
        mt: ['esri', 'esri-topo', 'esri-gray', 'esri-satellite', 'esri-physical', 'esri-shaded-relief', 'esri-terrain-base', 'esri-boundaries-places', 'esri-reference-overlay', 'esri-transportation']
    },
    boundaries: {
        mt: ['osm-administrative-boundaries', 'esri-boundaries-places']
    },
    falk: {
        mt: ['falk-osm', 'falk-base']
    },
    mapbox: {
        mt: ['mapbox', 'mapbox-satellite', 'comic-sans']
    },
    retina: {
        mt: ['lyrk-retina', 'mapnik']
    },
    waymarkedtrails: {
        mt: ['waymarkedtrails-hiking', 'waymarkedtrails-cycling', 'waymarkedtrails-mtb', 'waymarkedtrails-skating']
    },
    mapquest: {
        mt: ['mapquest-eu', 'mapquest-labels', 'mapquest-satellite', ]
    },
    commercial: {
        mt: ['google-map', 'bing-map', 'nokia-map', 'yahoo-map', 'skobbler', 'mapbox', 'esri', 'mapquest-eu']
    }
};

// MapCompare admin console /console.html
var mc_console = {
    maxTileServer: 3,

    // enable/disable configuration section
    pref_numberOfMaps: true,
    pref_centerOfMaps: true,
    pref_tileserver: true,
    pref_orderOfMaps: true,

    // cookie names
    cookie: {
        "tileserver": "mc_tileserver_",
        "numberOfMaps": "mc_number_of_maps",
        "orderOfMaps": "mc_order_of_maps",
        "centerOfMaps": "mc_center_of_maps",
        "check": "mc_cookie_check"
    }
};


// global variables shared by functions
var state = {
    non_map_tags: ["tools-top", "tools-titlebar", "bottom", "m0", "m1", "m2", "debug"],
    // hide in full screen mode
    fullscreen: false,
    console: false,
    // in console mode
    _google_plusone: 0,
    percent: mc.overlay.value,

    layertypes: [],
    over_layertypes: [],
    layertypes_hash: {},
    over_layertypes_hash: {},
    maps: [],
    layers: [],
    over_layers: [],
    markersLayer: [],
    marker: [],
    moving: false,
    movestarted: false,
    proj4326: false,

    nonBaseLayer: [],
    // ["ol_bbbike-smoothness", "ol_adfc-radwege", "ol_velo-layer", "ol_max-speed", "ol_hillshading", "ol_landshaded", "ol_yandex-hybrid", "ol_public_transport_lines", "ol_parktrans", "ol_powermap", 'ol_osm-labels-ru', 'ol_osm-labels-ja', 'ol_osm-labels-ar', 'ol_osm-labels-zh', 'ol_osm-labels-en', 'ol_osm-labels-fr', 'ol_osm-labels-de', 'ol_osm-labels-ko', 'ol_osm-labels-pl', 'ol_osm-labels-es', 'ol_bicycle_network', ],
    _ie: false // IE bugs
};

// only "map" variable keeps global
var map;

/*
   main
*/
jQuery(document).ready(function () {
    // hide spinning wheel after all JS libs are loaded
    jQuery('#tools-pageload').hide();

    return mc.console ? initConsole() : initMapCompare();
});


function initMapCompare() {
    initSocial();

    OpenLayers.Util.onImageLoadError = function () {
        this.src = 'img/404.png';
    }

    var mt = mc.mt;
    var mt_overlay = mc.overlay.mt_overlay;

    var proj4326 = new OpenLayers.Projection('EPSG:4326');
    state.proj4326 = proj4326;

    var projmerc = new OpenLayers.Projection('EPSG:900913');

    // var NumberOfMaps = mc.NumberOfMaps;
    var NumberOfMaps = getNumberOfMaps();

    var pos = getMapCenter();
    var lon = pos.lng;
    var lat = pos.lat;
    var zoom = pos.zoom;

    var x = null;
    var y = null;

    parseParams(function (param, v) {
        switch (param) {
        case 'type':
            mt[0] = v;
            break;
        case 'mt0':
            mt[0] = v;
            break;
        case 'mt1':
            mt[1] = v;
            break;
        case 'mt2':
            mt[2] = v;
            break;
        case 'mt3':
            mt[3] = v;
            break;
        case 'mt4':
            mt[4] = v;
            break;
        case 'mt5':
            mt[5] = v;
            break;
        case 'mt6':
            mt[6] = v;
            break;
        case 'mt7':
            mt[7] = v;
            break;
        case 'mt8':
            mt[8] = v;
            break;
        case 'mt9':
            mt[9] = v;
            break;
        case 'mt10':
            mt[10] = v;
            break;
        case 'mt11':
            mt[11] = v;
            break;
        case 'mt12':
            mt[12] = v;
            break;
        case 'mt13':
            mt[13] = v;
            break;
        case 'mt14':
            mt[14] = v;
            break;

            // overlay maps
        case 'mt-1':
            mt_overlay[0] = v;
            break;
        case 'mt-1p':
            state.percent = v;
            break;

        case 'lon':
            lon = Number(v);
            break;
        case 'lat':
            lat = Number(v);
            break;
        case 'profile':
            if (profile[v]) {
                NumberOfMaps = profile[v].NumberOfMaps ? profile[v].NumberOfMaps : profile[v].mt.length;
                debug("Use profile " + v + ", with " + NumberOfMaps + " maps");

                mc.mt = profile[v].mt;
                setTimeout(function () {
                    if (!state.fullscreen) toggleFullScreen()
                }, 500);
            }
            break;
        case 'url':
            pos = tile2lnglat(v);
            if (pos) {
                lon = pos.lng;
                lat = pos.lat;
                zoom = pos.zoom;
            } else {
                debug("cannot decode url parameter");
            }
            break;

        case 'zoom':
        case 'z':
            zoom = parseInt(v);
            break;
        case 'x':
            x = parseInt(v);
            break;
        case 'y':
            y = parseInt(v);
            break;
        case 'num':
            NumberOfMaps = parseInt(v);
            break;
        case 'debug':
            mc.debug = parseInt(v) || 0;
            break;
        case 'fullscreen':
            if (parseInt(v) > 0) setTimeout(function () {
                toggleFullScreen()
            }, 300);
            break;
        }
    });

    initFooter();
    initKeyPress();

    initYandex();
    initToolserver();
    initLayerTypes();
    initLayerTypesUserDefined();

    var layertypes = state.layertypes;

    if (NumberOfMaps > layertypes.length) NumberOfMaps = layertypes.length;
    if (mc.NumberOfMapsMax > layertypes.length || !mc.NumberOfMapsMax) mc.NumberOfMapsMax = layertypes.length;
    if (!NumberOfMaps || NumberOfMaps < 1 || NumberOfMaps > mc.NumberOfMapsMax) NumberOfMaps = 2;

    mc.NumberOfMaps = NumberOfMaps;
    MapOrderHtml(NumberOfMaps);

    setMapHeight(NumberOfMaps);
    jQuery(window).resize(function () {
        setMapHeight(NumberOfMaps);
        initFooter();
    });

    pos = createMapPosition(lon, lat, x, y, zoom);

    // OpenLayers.ImgPath = OpenLayers._getScriptLocation() + '../../img/theme/geofabrik/img/';
    OpenLayers.ImgPath = 'img/theme/geofabrik/img/';

    initColumnWidth(NumberOfMaps);
    var mapnames = sortMapLayersSelected(mc.mt);

    for (var n = 0; n < NumberOfMaps; n++) {
        // selected map type in menu
        var mapname = mapnames[n];

        initColumn(n);
        initSelectOptions(n, mapname);

        var _map = new OpenLayers.Map('map' + n, {
            theme: null,
            numZoomLevels: mc.numZoomLevels,
            controls: [],
            projection: projmerc,
            displayProjection: state.proj4326
        });

        _map.addControl(new OpenLayers.Control.Navigation());
        _map.addControl(new OpenLayers.Control.MousePosition({
            div: jQuery('#customMousePosition').get(0)
        }));

        // controls for first map top left
        if (n == 0) {
            _map.addControl(new OpenLayers.Control.PanZoomBar());
            _map.addControl(new OpenLayers.Control.ScaleLine({
                geodesic: true
            }));
            _map.addControl(new OpenLayers.Control.KeyboardDefaults());
        }

        state.maps[n] = _map;
        newLayer(n, mapname);


        setStartPos(n, pos.getLonLat(), pos.zoom);
        initMarker(n);

        _map.events.register('movestart', n, moveStart);
        _map.events.register('moveend', n, moveEnd);
        _map.events.register('mousemove', n, mouseMove);
        _map.events.register('mouseover', n, mouseOver);
        _map.events.register('mouseout', n, mouseOut);
    }

    // hide the second column if only one map should be displayed
    if (NumberOfMaps == 1) {
        initColumn(1, "none");
    }

    map = state.maps[0];

    // overlay
    initSelectOptionsOverlay(-1, mt_overlay[0]);
    if (mc.overlay.type == "select") {
        initSelectOptionsTransparent(-2, state.percent);
    } else {
        initSliderTransparent();
    }

    jQuery('#customMousePosition').hide();
    updatePermalink();
    updateNumberOfMapsLink(mc.NumberOfMapsMax, NumberOfMaps, mc.NumberOfMapsLinks);

    // XXX: double check height of maps, needed for > 24 maps
    setMapHeight(NumberOfMaps);
}

/*
  here are dragons!
  code copied from js/OpenLayers-2.11/OpenLayers.js: OpenLayers.Control.KeyboardDefaults

  see also: http://www.mediaevent.de/javascript/Extras-Javascript-Keycodes.html
*/
function initKeyPress() {
    // move all maps left/right/top/down

    function moveMap(direction, option) {
        for (var i = 0; i < state.maps.length; i++) {
            // google maps don't support animate flag
            var animate = state.layers[i].type.match(/^google-/) ? false : true;
            debug(state.layers[i].type + " " + animate);

            // state.layers[i].layers[1].pan(direction, option, { animate: animate });
            state.maps[i].pan(direction, option, {
                animate: animate
            });
        }
    };

    OpenLayers.Control.KeyboardDefaults.prototype.defaultKeyPress = function (evt) {
        switch (evt.keyCode) {

        case OpenLayers.Event.KEY_LEFT:
        case 72:
            moveMap(-this.slideFactor, 0);
            break;
        case OpenLayers.Event.KEY_RIGHT:
        case 76:
            moveMap(this.slideFactor, 0);
            break;
        case OpenLayers.Event.KEY_UP:
        case 75:
            moveMap(0, -this.slideFactor);
            break;
        case OpenLayers.Event.KEY_DOWN:
        case 74:
            moveMap(0, this.slideFactor);
            break;

        case 33:
            var size = this.map.getSize();
            this.map.pan(0, -0.75 * size.h);
            break;
        case 34:
            var size = this.map.getSize();
            this.map.pan(0, 0.75 * size.h);
            break;
        case 35:
            var size = this.map.getSize();
            this.map.pan(0.75 * size.w, 0);
            break;
        case 36:
            var size = this.map.getSize();
            this.map.pan(-0.75 * size.w, 0);
            break;

            // '+', '=''
        case 43:
        case 61:
        case 187:
        case 107:
        case 171:
            // Firefox 15.x
            this.map.zoomIn();
            break;

            // '-'
        case 45:
        case 109:
        case 189:
        case 95:
        case 173:
            // Firefox 15.x or later, see https://github.com/openlayers/openlayers/issues/605
            this.map.zoomOut();
            break;

            // Map Compare
        case 70:
            // f
            // f: toggle fullscreen, but not if shift/ctrl/alt
            // are active (e.g. to switch to fullscreen browser window)
            if (!(evt.shiftKey || evt.ctrlKey || evt.altKey)) toggleFullScreen();
            break;
        case 27:
            // ESC
            toggleFullScreen();
            break;
        case 71:
            // 'g'
            locateMe();
            break;
        case 48:
            for (var i = 0; i < 17; i++) {
                if (this.map.getZoom() < i) this.map.zoomIn();
            }
            break;

            // number of maps: 1..9
        case 49:
            window.location.href = getPermalink(1);
            break;
        case 50:
            window.location.href = getPermalink(2);
            break;
        case 51:
            window.location.href = getPermalink(3);
            break;
        case 52:
            window.location.href = getPermalink(4);
            break;
        case 53:
            // 5: 15 maps, 3 rows
            window.location.href = getPermalink(15);
            break;
        case 54:
            window.location.href = getPermalink(6);
            break;
        case 55:
            // 7: 24 maps, 4 rows
            window.location.href = getPermalink(24);
            break;
        case 56:
            window.location.href = getPermalink(8);
            break;
        case 57:
            // 9: all maps
            window.location.href = getPermalink(state.layertypes.length);
            break;

        case 67:
            // 'c'
            window.location.href = "console.html";
            break
        case 80:
            // 'p' - create permalink
            window.location.href = updatePermalink();
            break
        case 191:
            // '/' (alias '?')
            jQuery(".tools-helptrigger").trigger({
                type: 'click',
                which: 191
            });
            // window.location.href = "help.html";
            break
        }
    };
};


// sort maps, pre-selected first

function sortMapLayersSelected(selectedMaps) {
    var layertypes = state.layertypes;
    var cache = {};
    var list = [];

    // these maps are first
    for (var i = 0; i < selectedMaps.length; i++) {
        cache[selectedMaps[i]] = 1;
        list.push(selectedMaps[i]);
    }

    // then the rest
    for (var i = 0; i < layertypes.length; i++) {
        var name = layertypes[i].type;
        if (!cache[name]) {
            list.push(name);
        }
    }

    return list;
}

// reorder maps by name

function reorderMaps(type, config) {
    var maplist = state[type];
    if (!config.name && !config.type) return;

    function sortByName(a, b) {
        return a.name == b.name ? 0 : a.name > b.name ? 1 : -1
    };

    function sortByType(a, b) {
        return a.type == b.type ? 0 : a.type > b.type ? 1 : -1
    };

    // special sorting of map names

    function namePref(maps) {
        var list = [];
        var cache = {};
        var hash = {};

        for (var i = 0; i < state.nonBaseLayer.length; i++)
        hash[state.nonBaseLayer[i]] = 1;

        for (var i = 0; i < maps.length; i++) {
            if (!cache[i] && config.opacity && hash[maps[i]] && hash[maps[i].type]) {
                // alert("fooA " + maps[i].type);
                list.push(maps[i]);
                cache[i] = 1;
            }
        }

        // BBBike maps first
        for (var i = 0; i < maps.length; i++) {
            if (!cache[i] && config.bbbike && maps[i].name.match(/^BBBike/i)) {
                list.push(maps[i]);
                cache[i] = 1;
            }
        }

        // OSM maps second
        for (var i = 0; i < maps.length; i++) {
            if (!cache[i] && config.osm && maps[i].name.match(/^OSM/i)) {
                list.push(maps[i]);
                cache[i] = 1;
            }
        }

        // rest
        for (var i = 0; i < maps.length; i++) {
            if (!cache[i]) list.push(maps[i]);
        }

        return list;
    };

    if (config.name) {
        maplist = namePref(maplist.sort(sortByName));
    } else if (config.type) {
        maplist = maplist.sort(sortByType);
    } else {
        // nothing
    }

    state[type] = maplist;
}

function setMapHeight(NumberOfMaps) {
    var fullscreen = state.fullscreen;
    var height = jQuery(window).height();
    var head = jQuery('#head0').height(); // first map description height
    height += -jQuery('#tools-copyright').height(); // always visible
    if (fullscreen) {
        //
    } else {
        height += -jQuery('#tools-top').height() - jQuery('#tools-titlebar').height() - jQuery('#bottom').height();
        // jQuery('#tools-bottom').height();
        height -= 40; // XXX
    }

    // split screen if more than 3 maps are displayed
    var h;
    if (NumberOfMaps <= 3) {
        h = height + (fullscreen ? -3 : 6);
    } else if (NumberOfMaps <= mc.row3) {
        h = height / 2 + (fullscreen ? 0 : 3);
    } else if (NumberOfMaps <= mc.row4) {
        h = height / 3 + (fullscreen ? 0 : 2);
    } else if (NumberOfMaps <= mc.row5) {
        h = height / 4 + (fullscreen ? 1 : 0);
    } else {
        h = height / 5;
    }

    h -= head;
    jQuery('.map').height(Math.floor(h - (fullscreen ? -16 : 5)));
}

function initToolserver() {
    // create the custom layer for toolserver.org
    OpenLayers.Layer.OSM.Toolserver = OpenLayers.Class(OpenLayers.Layer.OSM, {
        initialize: function (name, path, options) {
            var url = switch_url("http://{switch:a,b,c}.www.toolserver.org/tiles/" + path + "/${z}/${x}/${y}.png");

            options = OpenLayers.Util.extend({
                tileOptions: {
                    crossOriginKeyword: null
                },
                sphericalMercator: true,
                numZoomLevels: 19
            }, options);
            OpenLayers.Layer.OSM.prototype.initialize.apply(this, [name, url, options]);
        },

        CLASS_NAME: "OpenLayers.Layer.OSM.Toolserver"
    });
}

function initLayerTypes() {
    var BingApiKey = "AqTGBsziZHIJYYxgivLBf0hVdrAk9mWO5cQcb8Yux8sW5M8c8opEC2lZqKR1ZZXf";

    var YandexBounds = state.YandexBounds;
    var proj4326 = state.proj4326;


    var layer_options = {
        tileOptions: {
            crossOriginKeyword: null
        },
        sphericalMercator: true,
        // buffer: 0,
        transitionEffect: "resize",
        numZoomLevels: 19
    };

    state.layertypes = [
    new LayerType('bbbike', 'BBBike Mapnik', function () {
        return new OpenLayers.Layer.OSM('BBBike Mapnik', switch_url('http://{switch:a,b,c}.tile.bbbike.org/osm/mapnik/${z}/${x}/${y}.png'), layer_options);
    }),

    new LayerType('bbbike-german', 'BBBike Mapnik (de)', function () {
        return new OpenLayers.Layer.OSM('BBBike Mapnik (de)', switch_url('http://{switch:a,b,c}.tile.bbbike.org/osm/mapnik-german/${z}/${x}/${y}.png'), layer_options);
    }),

    new LayerType('bbbike-smoothness', 'BBBike Smoothness', function () {
        return new OpenLayers.Layer.OSM('BBBike Smoothness', switch_url('http://{switch:a,b,c,d}.tile.bbbike.org/osm/bbbike-smoothness/${z}/${x}/${y}.png'), layer_options);
    }),

    new LayerType('mapnik', 'OSM Mapnik', function () {
        return new OpenLayers.Layer.OSM.Mapnik("OSM Mapnik");
    }),

    new LayerType('mapnik-german', 'OSM Mapnik (de)', function () {
        return new OpenLayers.Layer.OSM('OSM Mapnik (de)', switch_url('http://{switch:a,b,c,d}.tile.openstreetmap.de/tiles/osmde/${z}/${x}/${y}.png'), {
            tileOptions: {
                crossOriginKeyword: null
            },
            sphericalMercator: true,
            transitionEffect: "resize",
            numZoomLevels: 19
        });
    }),

    new LayerType('mapnik-retina', 'OSM Mapnik Retina', function () {
        return new OpenLayers.Layer.OSM('OSM Mapnik Retina', 'http://tile.geofabrik.de/osm_retina/${z}/${x}/${y}.png', {
            tileOptions: {
                crossOriginKeyword: null
            },
            sphericalMercator: true,
            numZoomLevels: 19
        });
    }),

    new LayerType('mapnik-bw', 'OSM Mapnik b/w', function () {
        return new OpenLayers.Layer.OSM('OSM Mapnik b/w', switch_url('http://{switch:a,b,c,d}.www.toolserver.org/tiles/bw-mapnik/${z}/${x}/${y}.png'), {
            tileOptions: {
                crossOriginKeyword: null
            },
            sphericalMercator: true,
            numZoomLevels: 18
        });
    }),

    new LayerType('toner', 'OSM Toner', function () {
        return new OpenLayers.Layer.OSM('OSM Toner', switch_url("http://{switch:a,b,c,d}.tile.stamen.com/toner/${z}/${x}/${y}.png"), {
            sphericalMercator: true,
            tileOptions: {
                crossOriginKeyword: null
            },
            numZoomLevels: 18
        });
    }),

    new LayerType('watercolor', 'OSM Watercolor', function () {
        return new OpenLayers.Layer.OSM('OSM Watercolor', switch_url("http://{switch:a,b,c,d}.tile.stamen.com/watercolor/${z}/${x}/${y}.png"), {
            tileOptions: {
                crossOriginKeyword: null
            },
            sphericalMercator: true,
            numZoomLevels: 18
        });
    }),

    new LayerType('cyclemap', 'OSM CycleMap', function () {
        return new OpenLayers.Layer.OSM.CycleMap('OSM CycleMap');
    }),

    new LayerType('maptoolkit-topo', 'Maptookit Topo (OSM)', function () {
        return new OpenLayers.Layer.OSM('Maptookit Topo (OSM)', switch_url('http://tile{switch:1,2,3,4}.maptoolkit.net/terrain/${z}/${x}/${y}.png'), {
            numZoomLevels: 18
        });
    }),

    new LayerType('opentopomap', 'OSM OpenTopoMap', function () {
        return new OpenLayers.Layer.OSM('OSM OpenTopoMap', switch_url('http://tile{switch:1,2,3,4}.opentopomap.org/tiles/${z}/${x}/${y}.png'), {
            numZoomLevels: 16
        });
    }),

    new LayerType('osmfr', 'OSM FR', function () {
        return new OpenLayers.Layer.OSM('OSM FR', switch_url('http://{switch:a,b,c}.tile.openstreetmap.fr/osmfr/${z}/${x}/${y}.png'), layer_options);
    }),

    new LayerType('osmfr-hot', 'OSM FR hot', function () {
        return new OpenLayers.Layer.OSM('OSM FR hot', switch_url('http://{switch:a,b,c}.tile.openstreetmap.fr/hot/${z}/${x}/${y}.png'), layer_options);
    }),

    new LayerType('osmfr-openriverboatmap', 'OSM FR openriverboatmap', function () {
        return new OpenLayers.Layer.OSM('OSM FR hot', switch_url('http://{switch:a,b,c}.tile.openstreetmap.fr/openriverboatmap/${z}/${x}/${y}.png'), layer_options);
    }),


/*
    new LayerType('cloudmade-map', 'Cloudmade map (OSM)', function () {
        return new OpenLayers.Layer.OSM('Cloudmade map (OSM)', switch_url("http://{switch:a,b,c}.tile.cloudmade.com/BC9A493B41014CAABB98F0471D759707/997/256/${z}/${x}/${y}.png"), layer_options);
    }),

    new LayerType('cloudmade-fineline', 'Cloudmade Fine Line (OSM)', function () {
        return new OpenLayers.Layer.OSM('Cloudmade Fine Line (OSM)', switch_url("http://{switch:a,b,c}.tile.cloudmade.com/BC9A493B41014CAABB98F0471D759707/2/256/${z}/${x}/${y}.png"), layer_options);
    }),

    new LayerType('cloudmade-midnight', 'Cloudmade Midnight (OSM)', function () {
        return new OpenLayers.Layer.OSM('Cloudmade Midnight (OSM)', switch_url("http://{switch:a,b,c}.tile.cloudmade.com/BC9A493B41014CAABB98F0471D759707/999/256/${z}/${x}/${y}.png"), layer_options);
    }),

    new LayerType('cloudmade-paledawn', 'Cloudmade Pale Dawn (OSM)', function () {
        return new OpenLayers.Layer.OSM('Cloudmade Pale Dawn (OSM)', switch_url("http://{switch:a,b,c}.tile.cloudmade.com/BC9A493B41014CAABB98F0471D759707/998/256/${z}/${x}/${y}.png"), layer_options);
    }),

    new LayerType('cloudmade-tourist', 'Cloudmade Tourist (OSM)', function () {
        return new OpenLayers.Layer.OSM('Cloudmade Tourist (OSM)', switch_url("http://{switch:a,b,c}.tile.cloudmade.com/BC9A493B41014CAABB98F0471D759707/7/256/${z}/${x}/${y}.png"), layer_options);
    }),

    new LayerType('cloudmade-blackout', 'Cloudmade Blackout (OSM)', function () {
        return new OpenLayers.Layer.OSM('Cloudmade Blackout (OSM)', switch_url("http://{switch:a,b,c}.tile.cloudmade.com/BC9A493B41014CAABB98F0471D759707/1960/256/${z}/${x}/${y}.png"), layer_options);
    }),

    new LayerType('cloudmade-thin', 'Cloudmade Thin (OSM)', function () {
        return new OpenLayers.Layer.OSM('Cloudmade Thin (OSM)', switch_url("http://{switch:a,b,c}.tile.cloudmade.com/BC9A493B41014CAABB98F0471D759707/1155/256/${z}/${x}/${y}.png"), layer_options);
    }),

    new LayerType('cloudmade-cyclewalk', 'Cloudmade Cycle Walk (OSM)', function () {
        return new OpenLayers.Layer.OSM('Cloudmade Cycle Walk (OSM)', switch_url("http://{switch:a,b,c}.tile.cloudmade.com/BC9A493B41014CAABB98F0471D759707/12284/256/${z}/${x}/${y}.png"), layer_options);
    }),
    */


    new LayerType('osm-roads', 'OSM Roads', function () {
        return new OpenLayers.Layer.OSM('OSM Roads', ["http://korona.geog.uni-heidelberg.de:8001/tms_r.ashx?x=${x}&y=${y}&z=${z} "], layer_options);
    }),

    new LayerType('osm-roads-greyscale', 'OSM Roads Grayscale', function () {
        return new OpenLayers.Layer.OSM('OSM Roads Grayscale', ["http://korona.geog.uni-heidelberg.de:8008/tms_rg.ashx?x=${x}&y=${y}&z=${z} "], layer_options);
    }),

    new LayerType('osm-semitransparent', 'OSM Semitransparent', function () {
        return new OpenLayers.Layer.OSM('OSM Semitransparent', ["http://korona.geog.uni-heidelberg.de:8003/tms_h.ashx?x=${x}&y=${y}&z=${z} "], layer_options);
    }),

    new LayerType('aster-gdem-srtm-hillshade', 'ASTER GDEM & SRTM', function () {
        return new OpenLayers.Layer.OSM('ASTER GDEM & SRTM', ["http://korona.geog.uni-heidelberg.de:8004/tms_hs.ashx?x=${x}&y=${y}&z=${z} "], layer_options);
    }),

    new LayerType('aster-gdem-contour-lines', 'ASTER GDEM contour lines', function () {
        return new OpenLayers.Layer.OSM('ASTER GDEM contour lines', ["http://korona.geog.uni-heidelberg.de:8006/tms_il.ashx?x=${x}&y=${y}&z=${z} "], layer_options);
    }),

    new LayerType('osm-administrative-boundaries', 'OSM Admin. Boundaries', function () {
        return new OpenLayers.Layer.OSM('OSM Admin. Boundaries', ["http://korona.geog.uni-heidelberg.de:8007/tms_b.ashx?x=${x}&y=${y}&z=${z} "], {
            tileOptions: {
                crossOriginKeyword: null
            },
            sphericalMercator: true,
            numZoomLevels: 16
        })
    }),

    new LayerType('bvg', "BVG", function () {
        return new OpenLayers.Layer.TMS("BVG", "", {
            href: "http://mobil.bvg.de/tiles/",
            getURL: bvg_getTileURL,
            numZoomLevels: 17
        });
    }),

    new LayerType('falk-osm', 'Falk OSM', function () {
        return new OpenLayers.Layer.OSM('Falk OSM', ["http://ec2.cdn.ecmaps.de/WmsGateway.ashx.jpg?TileX=${x}&TileY=${y}&ZoomLevel=${z}&Experience=falk&MapStyle=Falk%20OSM"], {
            tileOptions: {
                crossOriginKeyword: null
            },
            numZoomLevels: 17
        })
    }),

    new LayerType('falk-base', 'Falk Original', function () {
        return new OpenLayers.Layer.OSM('Falk Original', ["http://ec2.cdn.ecmaps.de/WmsGateway.ashx.jpg?TileX=${x}&TileY=${y}&ZoomLevel=${z}&Experience=falk&MapStyle=Falk%20Base"], {
            tileOptions: {
                crossOriginKeyword: null
            },
            numZoomLevels: 17
        })
    }),

    new LayerType('waze-us', 'Waze (US)', function () {
        return new OpenLayers.Layer.OSM('Waze (US)', switch_url("http://livemap-tiles{switch:1,2,3,4}.waze.com/tiles/${z}/${x}/${y}.png"), layer_options);
    }),

    new LayerType('waze-world', 'Waze (World)', function () {
        return new OpenLayers.Layer.OSM('Waze (World)', switch_url("http://worldtiles{switch:1,2,3,4}.waze.com/tiles/${z}/${x}/${y}.png"), layer_options);
    }),

    new LayerType('osm-no-labels', 'OSM no labels', function () {
        return new OpenLayers.Layer.OSM.Toolserver("OSM no labels", 'osm-no-labels');
    }),

    new LayerType('osm-labels-ru', 'OSM labels Russian (ru)', function () {
        return new OpenLayers.Layer.OSM.Toolserver("OSM labels Russian (ru)", 'osm-labels-ru');
    }),

    new LayerType('bicycle_network', 'Bicycle Network', function () {
        return new OpenLayers.Layer.OSM.Toolserver("Bicycle Network", 'bicycle_network', {
            numZoomLevels: 16
        });
    }),

    // map list padding, comment out if you add more maps
    new LayerType('osm-labels-fr', 'OSM labels French (fr)', function () {
        return new OpenLayers.Layer.OSM.Toolserver("OSM labels French (fr)", 'osm-labels-fr');
    }),

    new LayerType('osm-labels-es', 'OSM labels Spanish (es)', function () {
        return new OpenLayers.Layer.OSM.Toolserver("OSM labels Spanish (es)", 'osm-labels-es');
    }),

    new LayerType('landscape', 'OSM Landscape', function () {
        return new OpenLayers.Layer.OSM('OSM Landscape', switch_url("http://{switch:a,b,c}.tile3.opencyclemap.org/landscape/${z}/${x}/${y}.png"), layer_options);
    }),

    new LayerType('transport', 'OSM Transport', function () {
        return new OpenLayers.Layer.OSM('OSM Transport', switch_url("http://{switch:a,b,c}.tile2.opencyclemap.org/transport/${z}/${x}/${y}.png"), layer_options);
    }),

    new LayerType('public_transport', 'OSM Public Transport', function () {
        return new OpenLayers.Layer.OSM("OSM OEPNV", ["http://tile.memomaps.de/tilegen/${z}/${x}/${y}.png"], {
            tileOptions: {
                crossOriginKeyword: null
            },
            numZoomLevels: 18
        })
    }),

    new LayerType('public_transport_lines', 'OSM Publ. Transp. L.', function () {
        return new OpenLayers.Layer.OSM("OSM PTL", "http://www.openptmap.org/tiles/${z}/${x}/${y}.png", {
            tileOptions: {
                crossOriginKeyword: null
            },
            numZoomLevels: 18,
            alpha: true
        })
    }),

    new LayerType('hike_bike', 'OSM Hike&Bike', function () {
        return new OpenLayers.Layer.OSM("OSM Hike&Bike", switch_url("http://{switch:a,b,c,d}.www.toolserver.org/tiles/hikebike//${z}/${x}/${y}.png"), {
            tileOptions: {
                crossOriginKeyword: null
            },
            numZoomLevels: 18
        })
    }),

    new LayerType('wanderreitkarte', 'OSM Wanderreitkarte', function () {
        return new OpenLayers.Layer.OSM("OSM Wanderreitkarte", ["http://www.wanderreitkarte.de/topo/${z}/${x}/${y}.png"], {
            tileOptions: {
                crossOriginKeyword: null
            },
            numZoomLevels: 18
        })
    }),

    new LayerType('mapbox', 'MapBox (OSM)', function () {
        return new OpenLayers.Layer.OSM("MapBox (OSM)", switch_url("http://{switch:a,b,c,d}.tiles.mapbox.com/v3/examples.map-vyofok3q/${z}/${x}/${y}.png"), {
            tileOptions: {
                crossOriginKeyword: null
            },
            numZoomLevels: 17
        })
    }),

    new LayerType('mapbox-satellite', 'MapBox Satellite', function () {
        return new OpenLayers.Layer.OSM("MapBox Satellite", switch_url("http://{switch:a,b,c}.tiles.mapbox.com/v3/openstreetmap.map-4wvf9l0l/${z}/${x}/${y}.png"), {
            tileOptions: {
                crossOriginKeyword: null
            },
            numZoomLevels: 19
        })
    }),

    new LayerType('comic-sans', 'OSM Comic Sans', function () {
        return new OpenLayers.Layer.OSM("OSM Comic Sans", switch_url("http://{switch:a,b,c,d}.tiles.mapbox.com/v3/examples.bc17bb2a/${z}/${x}/${y}.png"), {
            tileOptions: {
                crossOriginKeyword: null
            },
            numZoomLevels: 17
        })
    }),

/* commercial use only
    new LayerType('geofabrik-topo', 'Geofabrik Topo', function () {
	var key = "15173cf79060ee4a66573954f6017ab0";
        return new OpenLayers.Layer.OSM("Geofabrik Topo", ["http://a.tile.geofabrik.de/" + key + "/${z}/${x}/${y}.png", "http://b.tile.geofabrik.de/" + key + "/${z}/${x}/${y}.png"], {
            tileOptions: {
                crossOriginKeyword: null
            },
            numZoomLevels: 19
        })
    }),
    */


    new LayerType('osm2world', 'OSM2World/3D (OSM)', function () {
        return new OpenLayers.Layer.OSM("OSM2World/3D (OSM)", switch_url("http://{switch:a,b,c,d}.tiles.osm2world.org/osm/pngtiles/n/${z}/${x}/${y}.png"), {
            tileOptions: {
                crossOriginKeyword: null
            },
            numZoomLevels: 19
        })
    }),

    new LayerType('google-map', 'Google Map', function () {
        return new OpenLayers.Layer.Google('Google (Map)', {
            type: google.maps.MapTypeId.ROADMAP
        });
    }),

    new LayerType('google-map-mapmaker', 'Google Map MapMaker', function () {
        var _map = new OpenLayers.Layer.Google('Google (Map)', {
            type: google.maps.MapTypeId.ROADMAP
        });

        /* XXX: it needs to be called some milliseconds later */
        setTimeout(function () {
            _map.mapObject.setOptions({
                mapMaker: true
            });
        }, 0);
        return _map;
    }),

    new LayerType('google-satellite', 'Google Satellite', function () {
        return new OpenLayers.Layer.Google('Google (Satellite)', {
            type: google.maps.MapTypeId.SATELLITE
        });
    }),

    new LayerType('google-hybrid', 'Google Hybrid', function () {
        return new OpenLayers.Layer.Google('Google (Hybrid)', {
            type: google.maps.MapTypeId.HYBRID
        });
    }),

    new LayerType('google-hybrid-mapmaker', 'Google Hybrid MapMaker', function () {
        var _map = new OpenLayers.Layer.Google('Google (Map)', {
            type: google.maps.MapTypeId.HYBRID
        });

        /* XXX: it needs to be called some milliseconds later */
        setTimeout(function () {
            _map.mapObject.setOptions({
                mapMaker: true
            });
        }, 0);
        return _map;
    }),

    new LayerType('google-physical', 'Google Physical', function () {
        return new OpenLayers.Layer.Google('Google (Physical)', {
            type: google.maps.MapTypeId.TERRAIN
        });
    }),

    new LayerType('google-bicycle-map', 'Google Bicycle (Map)', function () {
        var g = new OpenLayers.Layer.Google('Google (Bicycle)', {
            type: google.maps.MapTypeId.ROADMAP
        });

        setTimeout(function () {
            new google.maps.BicyclingLayer().setMap(g.mapObject);
        }, 0);
        return g;
    }),

    new LayerType('google-traffic-map', 'Google Traffic (Map)', function () {
        var g = new OpenLayers.Layer.Google('Google (Traffic)', {
            type: google.maps.MapTypeId.ROADMAP
        });

        setTimeout(function () {
            new google.maps.TrafficLayer().setMap(g.mapObject);
        }, 0);
        return g;
    }),

    new LayerType('google-panoramio-physical', 'Google Panoramio (Physical)', function () {
        var g = new OpenLayers.Layer.Google('Google (Panoramio)', {
            type: google.maps.MapTypeId.TERRAIN
        });

        setTimeout(function () {
            new google.maps.panoramio.PanoramioLayer().setMap(g.mapObject);
        }, 0);
        return g;
    }),

    new LayerType('google-weather-sat', 'Google Weather (Sat)', function () {
        var g = new OpenLayers.Layer.Google('Google (Weather)', {
            type: google.maps.MapTypeId.SATELLITE
        });

        setTimeout(function () {
            new google.maps.weather.WeatherLayer().setMap(g.mapObject);
        }, 0);
        return g;
    }),

    new LayerType('google-transit-map', 'Google Transit (Map)', function () {
        var myLatlng = new google.maps.LatLng(51.501904, -0.115871);

        var g = new OpenLayers.Layer.Google('Google (Transit)', {
            center: myLatlng,
            zoom: 13,
            type: google.maps.MapTypeId.ROADMAP
        });

        setTimeout(function () {
            new google.maps.TransitLayer().setMap(g.mapObject);
        }, 0);
        return g;
    }),

    new LayerType('google-layers-physical', 'Google Layers (Physical)', function () {
        var myLatlng = new google.maps.LatLng(51.501904, -0.115871);

        var g = new OpenLayers.Layer.Google('Google (Transit)', {
            center: myLatlng,
            zoom: 13,
            type: google.maps.MapTypeId.TERRAIN
        });

        setTimeout(function () {
            new google.maps.BicyclingLayer().setMap(g.mapObject);
            new google.maps.TransitLayer().setMap(g.mapObject);
            new google.maps.weather.WeatherLayer().setMap(g.mapObject);
            new google.maps.TrafficLayer().setMap(g.mapObject);
        }, 0);
        return g;
    }),

    new LayerType('bing-map', 'Bing Map', function () {
        return new OpenLayers.Layer.Bing(

        // XXX: bing.com returns a wrong zoom level in JSON API call
        OpenLayers.Util.extend({
            initLayer: function () {
                // pretend we have a zoomMin of 0
                this.metadata.resourceSets[0].resources[0].zoomMin = 0;
                OpenLayers.Layer.Bing.prototype.initLayer.apply(this, arguments);
            }
        }, {
            key: BingApiKey,
            type: "Road"
            //,  metadataParams: { mapVersion: "v1" }
        }));
    }),

    new LayerType('bing-satellite', 'Bing Satellite', function () {
        return new OpenLayers.Layer.Bing(OpenLayers.Util.extend({
            initLayer: function () {
                this.metadata.resourceSets[0].resources[0].zoomMin = 0;
                OpenLayers.Layer.Bing.prototype.initLayer.apply(this, arguments);
            }
        }, {
            key: BingApiKey,
            type: "Aerial",
            numZoomLevels: 18
        }));
    }),

    new LayerType('bing-hybrid', 'Bing Hybrid', function () {
        return new OpenLayers.Layer.Bing(OpenLayers.Util.extend({
            initLayer: function () {
                this.metadata.resourceSets[0].resources[0].zoomMin = 0;
                OpenLayers.Layer.Bing.prototype.initLayer.apply(this, arguments);
            }
        }, {
            key: BingApiKey,
            type: "AerialWithLabels",
            numZoomLevels: 18
        }));
    }),

    new LayerType('yahoo-map', 'Yahoo Map', function () {
        return new OpenLayers.Layer.Yahoo("Yahoo Map", {
            'sphericalMercator': true,
            numZoomLevels: 18
        });
    }),

    new LayerType('yahoo-satellite', 'Yahoo Satellite', function () {
        return new OpenLayers.Layer.Yahoo("Yahoo Satellite", {
            'type': YAHOO_MAP_SAT,
            'sphericalMercator': true,
            numZoomLevels: 18
        });
    }),

    new LayerType('yahoo-hybrid', 'Yahoo Hybrid', function () {
        return new OpenLayers.Layer.Yahoo("Yahoo Hybrid", {
            'type': YAHOO_MAP_HYB,
            'sphericalMercator': true,
            numZoomLevels: 18
        });
    }),

    new LayerType('mapquest-eu', 'Mapquest EU (OSM)', function () {
        return new OpenLayers.Layer.OSM('Mapquest (OSM)', switch_url("http://otile{switch:1,2,3,4}.mqcdn.com/tiles/1.0.0/osm/${z}/${x}/${y}.png"), layer_options);
    }),

    new LayerType('mapquest-labels', 'Mapquest Labels', function () {
        return new OpenLayers.Layer.OSM('Mapquest Labels', switch_url("http://ttiles0{switch:1,2,3,4}.mqcdn.com/tiles/1.0.0/vy/hyb/${z}/${x}/${y}.png"), layer_options);
    }),

    new LayerType('mapquest-satellite', 'Mapquest Satellite', function () {
        return new OpenLayers.Layer.OSM('Mapquest Satellite', switch_url("http://ttiles0{switch:1,2,3,4}.mqcdn.com/tiles/1.0.0/vy/sat/${z}/${x}/${y}.png"), layer_options);
    }),

    // you may get warnings in the browser console because the esri server returns a wrong mime type image/jpg instead image/jpeg
/* ESRI Basemaps
     *
     * http://help.arcgis.com/en/arcgisserver/10.0/help/datamaps/index.html#//00v900000005000000.htm
     */
    new LayerType('esri', 'Esri', function () {
        return new OpenLayers.Layer.OSM('Esri', "http://server.arcgisonline.com/ArcGIS/rest/services/World_Street_Map/MapServer/tile/${z}/${y}/${x}.jpg", layer_options);
    }),

    new LayerType('esri-satellite', 'Esri Satellite', function () {
        return new OpenLayers.Layer.OSM('Esri Satellite', "http://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/${z}/${y}/${x}.jpg", layer_options);
    }),

    new LayerType('esri-physical', 'Esri Physical', function () {
        return new OpenLayers.Layer.OSM('Esri Physical', "http://server.arcgisonline.com/ArcGIS/rest/services/World_Physical_Map/MapServer/tile/${z}/${y}/${x}.jpg", {
            tileOptions: {
                crossOriginKeyword: null
            },
            numZoomLevels: 9
        })
    }),

    new LayerType('esri-shaded-relief', 'Esri Shaded Relief', function () {
        return new OpenLayers.Layer.OSM('Esri Shaded Relief', "http://server.arcgisonline.com/ArcGIS/rest/services/World_Shaded_Relief/MapServer/tile/${z}/${y}/${x}.jpg", {
            tileOptions: {
                crossOriginKeyword: null
            },
            numZoomLevels: 13
        })
    }),

    new LayerType('esri-terrain-base', 'Esri Terrain', function () {
        return new OpenLayers.Layer.OSM('Esri Terrain', "http://server.arcgisonline.com/ArcGIS/rest/services/World_Terrain_Base/MapServer/tile/${z}/${y}/${x}.jpg", {
            tileOptions: {
                crossOriginKeyword: null
            },
            numZoomLevels: 10
        })
    }),

    new LayerType('esri-topo', 'Esri Topo', function () {
        return new OpenLayers.Layer.OSM('Esri Topo', "http://services.arcgisonline.com/ArcGIS/rest/services/World_Topo_Map/MapServer/tile/${z}/${y}/${x}.jpg", layer_options);
    }),

    new LayerType('esri-gray', 'Esri Gray', function () {
        return new OpenLayers.Layer.OSM('Esri Gray', "http://services.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Light_Gray_Base/MapServer/tile/${z}/${y}/${x}.jpg", layer_options);
    }),

/*
     *   ESRI Reference layers
     *
     */

    new LayerType('esri-boundaries-places', 'Esri Boundaries & Places', function () {
        return new OpenLayers.Layer.OSM('Esri Boundaries & Places', "http://server.arcgisonline.com/ArcGIS/rest/services/Reference/World_Boundaries_and_Places/MapServer/tile/${z}/${y}/${x}.jpg", layer_options);
    }),

    new LayerType('esri-reference-overlay', 'Esri Reference Overlay', function () {
        return new OpenLayers.Layer.OSM('Esri Reference Overlay', "http://server.arcgisonline.com/ArcGIS/rest/services/Reference/World_Reference_Overlay/MapServer/tile/${z}/${y}/${x}.jpg", {
            tileOptions: {
                crossOriginKeyword: null
            },
            numZoomLevels: 10
        })
    }),

    new LayerType('esri-transportation', 'Esri Transportation', function () {
        return new OpenLayers.Layer.OSM('Esri Transportation', "http://server.arcgisonline.com/ArcGIS/rest/services/Reference/World_Transportation/MapServer/tile/${z}/${y}/${x}.jpg", layer_options);
    }),

    new LayerType('apple', 'Apple iPhoto (OSM)', function () {
        return new OpenLayers.Layer.OSM('Apple iPhoto (OSM)', "http://gsp2.apple.com/tile?api=1&style=slideshow&layers=default&lang=de_DE&z=${z}&x=${x}&y=${y}&v=9", {
            tileOptions: {
                crossOriginKeyword: null
            },
            sphericalMercator: true,
            numZoomLevels: 15
        });
    }),

    new LayerType('skobbler', 'Skobbler (OSM)', function () {
        return new OpenLayers.Layer.OSM('Skobbler (OSM)', switch_url("http://tiles{switch:1,2,3,4}.skobbler.net/osm_tiles2/${z}/${x}/${y}.png"), layer_options);
    }),

    new LayerType('komoot', 'Komoot (OSM)', function () {
        return new OpenLayers.Layer.OSM('Komoot (OSM)', switch_url("http://www.komoot.de/tiles/a/${z}/${x}/${y}.png"), layer_options);
    }),

    new LayerType('lyrk', 'Lyrk (OSM)', function () {
        return new OpenLayers.Layer.OSM('Lyrk (OSM)', "https://tiles.lyrk.org/ls/${z}/${x}/${y}?apikey=e9f8eb3824344d18a5b4b657773caf30", layer_options);
    }),

    new LayerType('lyrk-retina', 'Lyrk Retina (OSM)', function () {
        return new OpenLayers.Layer.OSM('Lyrk Retina (OSM)', "https://tiles.lyrk.org/lr/${z}/${x}/${y}?apikey=e9f8eb3824344d18a5b4b657773caf30", layer_options);
    }),

    new LayerType('osm-gps', 'OSM GPS', function () {
        return new OpenLayers.Layer.OSM('OSM GPS', switch_url("http://{switch:a,b,c}.gps-tile.openstreetmap.org/lines/${z}/${x}/${y}.png"), layer_options);
    }),

    new LayerType('yandex-map', "Yandex Maps", function () {
        return new OpenLayers.Layer.TMS("Yandex Maps", "", {
            maxExtent: YandexBounds,
            href: "http://vec02.maps.yandex.net/tiles?l=map&v=2.2.3",
            getURL: yandex_getTileURL,
            maxResolution: 156543.0339,
            isBaseLayer: true,
            projection: new OpenLayers.Projection("EPSG:900913"),
            numZoomLevels: 13
            // sphericalMercator: true,
            // units: 'm',
            // displayProjection: new OpenLayers.Projection("EPSG:4326"),
        });
    }),

    new LayerType('yandex-satellite', "Yandex Satellite", function () {
        return new OpenLayers.Layer.TMS("Yandex Satellite", "", {
            maxExtent: YandexBounds,
            maxResolution: 156543.0339,
            href: "http://sat01.maps.yandex.net/tiles?l=sat&v=1.35.0",
            getURL: yandex_getTileURL,
            isBaseLayer: true,
            projection: new OpenLayers.Projection("EPSG:900913"),
            numZoomLevels: 16
        });
    }),

    new LayerType('yandex-hybrid', "Yandex Hybrid", function () {
        return new OpenLayers.Layer.TMS("Yandex Hybrid", "", {
            href: "http://vec01.maps.yandex.net/tiles?l=skl",
            getURL: yandex_getTileURL,
            maxResolution: 156543.0339,
            maxExtent: YandexBounds,
            isBaseLayer: true,
            projection: new OpenLayers.Projection("EPSG:900913"),
            numZoomLevels: 15
        });
    }),

    // 1.. 4.maps.nlp.nokia.com/maptile/2.1/maptile/a2e328a0c5/<terrain.day>/3/2/2/256/png8?app_id=<id>&token=<id>
    new LayerType('nokia-map', 'HERE Map', function () {
        return new OpenLayers.Layer.Nokia('HERE Map', {
            type: 'normal.day',
            app_id: 'SqE1xcSngCd3m4a1zEGb',
            tile_id: 'd1a20f296b',
            token: 'r0sR1DzqDkS6sDnh902FWQ'
        })
    }),

    new LayerType('nokia-terrain', 'HERE Terrain', function () {
        return new OpenLayers.Layer.Nokia('HERE Terrain', {
            type: 'terrain.day',
            app_id: 'SqE1xcSngCd3m4a1zEGb',
            tile_id: 'd1a20f296b',
            token: 'r0sR1DzqDkS6sDnh902FWQ'
        })
    }),

    new LayerType('nokia-satellite', 'HERE Satellite', function () {
        return new OpenLayers.Layer.Nokia('HERE Satellite', {
            type: 'satellite.day',
            app_id: 'SqE1xcSngCd3m4a1zEGb',
            tile_id: 'd1a20f296b',
            token: 'r0sR1DzqDkS6sDnh902FWQ'
        })
    }),

    new LayerType('nokia-hybrid', 'HERE Hybrid', function () {
        return new OpenLayers.Layer.Nokia('HERE Hybrid', {
            type: 'hybrid.day',
            app_id: 'SqE1xcSngCd3m4a1zEGb',
            tile_id: 'd1a20f296b',
            token: 'r0sR1DzqDkS6sDnh902FWQ'
        })
    }),

    new LayerType('nokia-public_transit', 'HERE Public Transit', function () {
        return new OpenLayers.Layer.Nokia('HERE Public Transit', {
            type: 'normal.day.transit',
            app_id: 'SqE1xcSngCd3m4a1zEGb',
            tile_id: 'd1a20f296b',
            token: 'r0sR1DzqDkS6sDnh902FWQ'
        })
    }),

    new LayerType('nokia-traffic', 'HERE Traffic', function () {
        return new OpenLayers.Layer.Nokia('HERE Traffic', {
            type: 'newest/normal.day',
            app_id: 'SqE1xcSngCd3m4a1zEGb',
            tile_id: 'd1a20f296b',
            token: 'r0sR1DzqDkS6sDnh902FWQ'
        })
    }),

    new LayerType('soviet-military', 'Soviet Military Topo', function () {
        return new OpenLayers.Layer.WMS("Soviet Military Topo", "http://www.topomapper.com/cgi-bin/tilecache-2.11b/tilecache.py", {
            layers: "topomapper_gmerc",
            format: 'image/jpeg'
        }, {
            'buffer': 1,
            'srs': 'EPSG:900913',
            'numZoomLevels': 14,
            wrapDateLine: true,
            transparent: false,
            'attribution': 'Map data hosted by <a href="http://www.atlogis.com/">Atlogis</a>'
        });
    }),

    new LayerType('adfc-radwege', 'ADFC Radwegenetz', function () {
        return new OpenLayers.Layer.OSM('ADFC Radwegenetz', "", {
            tileOptions: {
                crossOriginKeyword: null
            },
            type: 'png',
            getURL: get_mm_bikeTracks
        });
    }),

    new LayerType('velo-layer', 'Velo-Layer', function () {
        return new OpenLayers.Layer.XYZ("Velo-Layer", switch_url("http://{switch:a,b,c,d}.www.toolserver.org/tiles/bicycle/${z}/${x}/${y}.png"), layer_options);
    }),

    new LayerType('max-speed', 'Max Speed', function () {
        return new OpenLayers.Layer.XYZ("Max Speed", "http://wince.dentro.info/koord/osm/tiles/${z}/${x}/${y}.png", {
            sphericalMercator: true,
            numZoomLevels: 15
        });
    }),

    new LayerType('map1eu', 'map1eu (OSM)', function () {
        return new OpenLayers.Layer.OSM("map1eu (OSM)", ["http://alpha.map1.eu/tiles/${z}/${x}/${y}.jpg"], {
            tileOptions: {
                crossOriginKeyword: null
            },
            numZoomLevels: 18
        })
    }),

    new LayerType('landshaded', 'Land Shading', function () {
        return new OpenLayers.Layer.OSM('Land Shading', 'http://tiles2.openpistemap.org/landshaded/${z}/${x}/${y}.png', {
            numZoomLevels: 18
        });
    }),

    new LayerType('waymarkedtrails-hiking', 'OSM Trails Hiking', function () {
        return new OpenLayers.Layer.OSM("OSM Hiking Waymarkedtrails", ["http://tile.waymarkedtrails.org/hiking/${z}/${x}/${y}.png"], {
            tileOptions: {
                crossOriginKeyword: null
            },
            numZoomLevels: 18
        })
    }),

    new LayerType('waymarkedtrails-cycling', 'OSM Trails Cycling', function () {
        return new OpenLayers.Layer.OSM("OSM Cycling Waymarkedtrails", ["http://tile.waymarkedtrails.org/cycling/${z}/${x}/${y}.png"], {
            tileOptions: {
                crossOriginKeyword: null
            },
            numZoomLevels: 18
        })
    }),

    new LayerType('waymarkedtrails-mtb', 'OSM Trails MTB', function () {
        return new OpenLayers.Layer.OSM("OSM MTB Waymarkedtrails", ["http://tile.waymarkedtrails.org/mtb/${z}/${x}/${y}.png"], {
            tileOptions: {
                crossOriginKeyword: null
            },
            numZoomLevels: 18
        })
    }),

    new LayerType('waymarkedtrails-skating', 'OSM Trails Skating', function () {
        return new OpenLayers.Layer.OSM("OSM Skating Waymarkedtrails", ["http://tile.waymarkedtrails.org/skating/${z}/${x}/${y}.png"], {
            tileOptions: {
                crossOriginKeyword: null
            },
            numZoomLevels: 18
        })
    }),

    new LayerType('osm-southeastasia', 'OSM SouthEastAsia', function () {
        return new OpenLayers.Layer.OSM('', switch_url('http://{switch:a,b,c,d}.tile.osm-tools.org/osm_then/${z}/${x}/${y}.png'), {
            numZoomLevels: 18
        });
    }),

    new LayerType('hillshading', 'Hillshading SRTM3 V2', function () {
        return new OpenLayers.Layer.OSM('Hillshading SRTM3 V2', switch_url('http://{switch:a,b,c,d}.www.toolserver.org/~cmarqu/hill/${z}/${x}/${y}.png'), {
            numZoomLevels: 17
        });
    })
    // EOF padding
    ];

    // overlay types, just a copy + isBaseLayer: false
    state.over_layertypes = [

    AddOverlay('bbbike-smoothness'), AddOverlay('adfc-radwege'), AddOverlay('public_transport_lines'), AddOverlay('velo-layer'),

    AddOverlay('bicycle_network'), AddOverlay('max-speed'), AddOverlay('yandex-hybrid'), AddOverlay('hillshading'),

    AddOverlay('mapnik-german'), AddOverlay('toner'), AddOverlay('osm-no-labels'), AddOverlay('osm-labels-ru'),

    AddOverlay('landshaded'), AddOverlay('mapquest-satellite'), AddOverlay('nokia-satellite'), AddOverlay('bing-satellite'),

    AddOverlay('nokia-map'), AddOverlay('bing-map'), AddOverlay('esri-topo'), AddOverlay('aster-gdem-srtm-hillshade'),

    AddOverlay('waymarkedtrails-hiking'), AddOverlay('waymarkedtrails-cycling'), AddOverlay('waymarkedtrails-mtb'),

    AddOverlay('waymarkedtrails-skating'), AddOverlay('osm-administrative-boundaries'), AddOverlay('osm-gps'),

    AddOverlay('mapquest-labels'),

/* XXX:
    AddOverlay('yahoo-map'),
    AddOverlay('yahoo-satellite'),
    AddOverlay('google-satellite'),
    AddOverlay('google-map'),
    */

    new OverLayerType('ol_osm-labels-ja', 'Labels Japanese (ja)', function () {
        return new OpenLayers.Layer.OSM.Toolserver("OSM labels Japanese (ja)", 'osm-labels-ja', {
            numZoomLevels: 13
        });
    }),

    new OverLayerType('ol_osm-labels-ar', 'Labels Arabic (ar)', function () {
        return new OpenLayers.Layer.OSM.Toolserver("OSM labels Arabic", 'osm-labels-ar', {
            numZoomLevels: 13
        });
    }),

    new OverLayerType('ol_osm-labels-zh', 'Labels Chinese (zh)', function () {
        return new OpenLayers.Layer.OSM.Toolserver("OSM labels Chinese", 'osm-labels-zh', {
            numZoomLevels: 13
        });
    }),

    new OverLayerType('ol_osm-labels-en', 'Labels English (en)', function () {
        return new OpenLayers.Layer.OSM.Toolserver("OSM labels English", 'osm-labels-en', {
            numZoomLevels: 18
        });
    }),

    new OverLayerType('ol_osm-labels-fr', 'Labels French (fr)', function () {
        return new OpenLayers.Layer.OSM.Toolserver("OSM labels French", 'osm-labels-fr', {
            numZoomLevels: 16
        });
    }),

    new OverLayerType('ol_osm-labels-de', 'Labels German (de)', function () {
        return new OpenLayers.Layer.OSM.Toolserver("OSM labels German", 'osm-labels-de', {});
    }),

    new OverLayerType('ol_osm-labels-ko', 'Labels Korean (ko)', function () {
        return new OpenLayers.Layer.OSM.Toolserver("OSM labels Korean", 'osm-labels-ko', {
            numZoomLevels: 13
        });
    }),

    new OverLayerType('ol_osm-labels-pl', 'Labels Polish (pl)', function () {
        return new OpenLayers.Layer.OSM.Toolserver("OSM labels Polish", 'osm-labels-pl', {});
    }),

    new OverLayerType('ol_osm-labels-es', 'Labels Spanish (es)', function () {
        return new OpenLayers.Layer.OSM.Toolserver("OSM labels Spanish", 'osm-labels-es', {
            numZoomLevels: 16
        });
    }),

    new OverLayerType('ol_osm-labels-ru', 'Labels Russian (ru)', function () {
        return new OpenLayers.Layer.OSM.Toolserver("OSM labels Russian (ru)", 'osm-labels-ru', {});
    }),


    new OverLayerType('ol_parktrans', 'Parking', function () {
        return new OpenLayers.Layer.OSM.Toolserver("Parking", 'parktrans', {
            opacity: 1,
            numZoomLevels: 16
        });
    }),

    new OverLayerType('ol_powermap', 'Power Map', function () {
        return new OpenLayers.Layer.OSM.Toolserver("Power Map", 'powermap', {
            opacity: 1,
            numZoomLevels: 13
        });
    })

    ];

    reorderMaps("layertypes", mc.sort);
    reorderMaps("over_layertypes", mc.sort_overlay);
    getOrderOfPrefMaps();
}

/* http://xbb.uz/openlayers/i-Yandex.Maps
*/
function yandex_getTileURL(bounds) {
    var r = this.map.getResolution();
    var maxExt = (this.maxExtent) ? this.maxExtent : state.YandexBounds;
    // var maxExt = state.YandexBounds;
    // maxExt = new OpenLayers.Bounds();
    var w = (this.tileSize) ? this.tileSize.w : 256;
    var h = (this.tileSize) ? this.tileSize.h : 256;
    var x = Math.round((bounds.left - maxExt.left) / (r * w));
    var y = Math.round((maxExt.top - bounds.top) / (r * h));
    var z = this.map.getZoom();
    var lim = Math.pow(2, z);
    if (y < 0 >= lim) {
        return OpenLayers.Util.getImagesLocation() + "404.png";
    } else {
        x = ((x % lim) + lim) % lim;
        // var url = (this.url) ? this.url : "http://vec02.maps.yandex.net/tiles?l=map&v=2.2.3";
        var url = (this.href) ? this.href : "http://sat01.maps.yandex.net/tiles?l=sat&v=1.35.0";
        return url + "&x=" + x + "&y=" + y + "&z=" + z;
    }
}

function bvg_getTileURL(bounds) {
    var r = this.map.getResolution();
    var maxExt = (this.maxExtent) ? this.maxExtent : state.YandexBounds;

    var w = (this.tileSize) ? this.tileSize.w : 256;
    var h = (this.tileSize) ? this.tileSize.h : 256;
    var x = Math.round((bounds.left - maxExt.left) / (r * w));
    var y = Math.round((maxExt.top - bounds.top) / (r * h));
    var z = this.map.getZoom();
    var lim = Math.pow(2, z);
    var url = (this.href) ? this.href : "/tiles/";

    // scary, isn't it???
    y = (1 << z) - y - 1;
    return url + z + "/" + x + "/" + y + ".png";
}

function initYandex() {
    var YandexBounds = new OpenLayers.Bounds(-20037508, -20002151, 20037508, 20072865);
    state.YandexBounds = YandexBounds;
}

function get_mm_bikeTracks(bounds) {
    var llbounds, url;

    llbounds = new OpenLayers.Bounds();
    llbounds.extend(OpenLayers.Layer.SphericalMercator.inverseMercator(bounds.left, bounds.bottom));
    llbounds.extend(OpenLayers.Layer.SphericalMercator.inverseMercator(bounds.right, bounds.top));
    url = "http://mm-lbserver.dnsalias.com/mm-mapserver_v2/wms/wms.php?REQUEST=GetMap&SERVICE=WMS&VERSION=1.1.1&LAYERS=MM_BIKETRACKS&STYLES=&FORMAT=image/png&BGCOLOR=0xFFFFFF&TRANSPARENT=TRUE&SRS=EPSG:4326&BBOX="
    url = url + llbounds.toBBOX() + "&WIDTH=256&HEIGHT=256"

    return url
}


function initMarker(n) {
    state.markersLayer[n] = new OpenLayers.Layer.Markers("Marker");
    state.maps[n].addLayer(state.markersLayer[n]);
    state.marker[n] = new OpenLayers.Marker(state.maps[n].getCenter(), new OpenLayers.Icon('img/cross.png', new OpenLayers.Size(20, 20), new OpenLayers.Pixel(-10, -10)));
    state.markersLayer[n].setVisibility(false);
    state.markersLayer[n].addMarker(state.marker[n]);
}

function setVisibilityWrapper(layer, value) {
    if (layer) {
        layer.setVisibility(value);
    } else {
        // to slow, wait some seconds
        setTimeout(function () {
            if (layer) layer.setVisibility(value);
        }, 2000);
    }
}

function moveStart() {
    state.movestarted = true;
    for (var i = 0; i < mc.NumberOfMaps; i++) {
        setVisibilityWrapper(state.markersLayer[i], false);
    }
    return (false);
}

function moveEnd() {
    if (state.moving) {
        return;
    }

    state.moving = true;
    for (var i = 0; i < mc.NumberOfMaps; i++) {
        if (i != this && state.maps[i]) {
            state.maps[i].setCenter(
            state.maps[this].getCenter().clone().transform(state.maps[this].getProjectionObject(), state.maps[i].getProjectionObject()), state.maps[this].getZoom());
        }
        setVisibilityWrapper(state.markersLayer[i], true);
    }

    state.moving = false;
    updatePermalink();
    state.movestarted = false;
    // state.markersLayer[1-this].setVisibility(true);
    return false;
}

// jQuery('#customZoomLevel').html('this= ' + this);

function mouseMove(evt) {
    for (var i = 0; i < mc.NumberOfMaps; i++) {
        if (i != this && state.marker[i]) {
            state.marker[i].moveTo(state.maps[this].getLayerPxFromViewPortPx(evt.xy));
        }
    }
    return (false);
}

function mouseOver(evt) {
    if (!state.movestarted) {
        for (var i = 0; i < mc.NumberOfMaps; i++) {
            if (i != this) {
                setVisibilityWrapper(state.markersLayer[i], true);
            }
        }
    }
    jQuery('#customMousePosition').show();
    return (false);
}

function mouseOut(evt) {
    for (var i = 0; i < mc.NumberOfMaps; i++) {
        setVisibilityWrapper(state.markersLayer[i], false);
    }
    jQuery('#customMousePosition').hide();
    return (false);
}

// http://www.brain4.de/programmierecke/js/arraySort.php

function sortLayerByName(array) {}

function initSelectOptions(n, type) {
    var sw = jQuery('#sw' + n);
    if (!sw) return;

    for (var i = 0; i < state.layertypes.length; i++) {
        var l = state.layertypes[i];
        var opt = document.createElement('option');
        opt.value = l.type;
        opt.text = l.name;
        opt.style.padding = '1px';
        if (l.type == type) {
            opt.selected = true;
        }
        sw[0].options[i] = opt;
    }
    sw.bind('change', n, changeLayer);
}

function initSelectOptionsOverlay(n, type) {
    var sw = jQuery('#sw' + n);
    if (!sw) return;
    if (!type) type = "none";

    for (var i = 0; i < state.over_layertypes.length; i++) {
        var l = state.over_layertypes[i];
        var opt = document.createElement('option');
        opt.value = l.type;
        opt.text = l.name;
        opt.style.padding = '1px';
        if (l.type == type) {
            opt.selected = true;
        }
        sw[0].options[i + 1] = opt;
    }
    sw.bind('change', n, changeOverLayer);
    state.over_layers[0] = type;

    if (type == "none") showTransparentMenu(false);
    else changeOverLayer(null, type);
}

function showTransparentMenu(flag, n) {
    if (!n) n = -2;
    var sw = mc.overlay.type == "select" ? $('#sw' + n) : $('#slider_box');
    if (!sw) return;

    flag ? sw.show() : sw.hide();
}

function initSelectOptionsTransparent(n, percent) {
    var sw = jQuery('#sw' + n);
    if (!sw) return;
    if (typeof percent === 'undefined') percent = state.percent;

    if (!mc.overlay.enabled) return;

    var step = mc.overlay.select_step;

    for (var i = 0, j = 1; i <= 100; i += step, j++) {
        var opt = document.createElement('option');
        opt.value = i;
        opt.text = i + "%"
        opt.style.padding = '1px';
        if (i == percent) {
            opt.selected = true;
        }
        sw[0].options[j] = opt;
    }

    sw.bind('change', n, changeTransparent);
    state.percent = percent;
}

function initSliderTransparent(n, percent) {
    var sw = jQuery('#slider_box');

    if (!sw) return;

    if (typeof percent === 'undefined') percent = state.percent;

    if (!mc.overlay.enabled) return;

    var step = mc.overlay.slider_step;

    sw.slider({
        step: 5,
        value: percent,
        animate: "fast",
        slide: function (event, ui) {
            changeTransparent(null, ui.value);
        }

        /* ,change: function(event, ui) { changeTransparent(null, ui.value); } */
    });

    state.percent = percent;
}

function changeTransparent(event, _percent) {
    var percent = event ? event.target.value : _percent;
    var overlayer_name = state.over_layers[0];

    if (overlayer_name == "none" || overlayer_name == "") return;

    debug("percent: " + percent);
    // default opacity
    if (percent == "" || percent < 0) {
        // reset layer
        if (percent != -2) // called from changeOverLayer
        changeOverLayer(null, overlayer_name);

        // select "default" in menu
        var sw = jQuery('#sw' + "-2");
        if (sw && sw[0] && sw[0].options) sw[0].options[0].selected = true;

        debug("nothing to change: " + overlayer_name + " " + percent);
        return;
    }

    if (percent < 0 || percent > 100) {
        debug("percent out of range: " + percent + ", reset to 50");
        percent = 50;
    }
    state.percent = percent;

    // state.over_layers[0].setOpacity(percent);
    debug("set transparent percentage to: " + percent);

    for (var n = 0; n < mc.NumberOfMaps; n++) {
        var layers = state.maps[n].layers;
        if (layers && layers.length >= 1 && layers[1]) {
            layers[1].setOpacity(percent / 100);
        }
    }

    updatePermalink();
}

// make the column visible

function initColumn(n, display) {
    if (!display) {
        display = "table-cell";
    }
    var column = jQuery('#column' + n);
    column.css("display", display);
}

// set the column width depending on the number of maps

function initColumnWidth(n) {
    var number;
    if (n <= 3) { // one row
        number = n;
    } else if (n <= mc.row3) { // second row
        number = Math.ceil(n / 2);
    } else if (n <= mc.row4) { // 3rd row
        number = Math.ceil(n / 3);
    } else if (n <= mc.row5) { // 4rd row
        number = Math.ceil(n / 4);
    } else { // 5rd row
        number = Math.ceil(n / 5);
    }

    var width = Math.floor(100 / number) + "%";
    jQuery('td.maps').css("width", width);
}

function setStartPos(n, lonlat, zoom) {
    var center = lonlat.clone();
    center.transform(state.proj4326, state.maps[n].getProjectionObject());

    // adjust for maps with lower zoom levels
    var z = state.maps[n].getNumZoomLevels(zoom) - 1;
    if (z < zoom) zoom = z;

    state.maps[n].setCenter(center, zoom);
}

function updatePermalink() {
    var url = getPermalink(mc.NumberOfMaps);

    jQuery('#permalink')[0].href = url;
    jQuery('#customZoomLevel').html('zoom=' + state.maps[0].getZoom());

    return url;
}

function getPermalink(NumberOfMaps) {
    var pos = getPosition();
    var url = '?lon=' + pos.lon + '&lat=' + pos.lat + '&zoom=' + pos.zoom + "&num=" + NumberOfMaps;
    for (var i = 0; i < mc.NumberOfMapsMax; i++) {
        if (state.layers[i]) {
            url += "&mt" + i + "=" + state.layers[i].type;
        }
    }

    if (state.over_layers[0] && state.over_layers[0] != 'none') {
        url += "&mt-1" + "=" + state.over_layers[0];
        url += "&mt-1p" + "=" + state.percent;
    }
    if (state.fullscreen) url += "&fullscreen=1";

    return url;
}

function updateNumberOfMapsLink(NumberOfMapsMax, NumberOfMaps, NumberOfMapsLinks) {
    var message = "number of maps: ";

    for (var i = 1; i <= NumberOfMapsMax; i++) {
        if (ignoreLink(NumberOfMapsMax, NumberOfMaps, NumberOfMapsLinks, i)) continue;

        if (i > 1) {
            message += " ";
        }
        if (i == NumberOfMaps) {
            message += i;
        } else {
            message += "<a href='#' onclick='this.href=getPermalink(" + i + ");'>" + i + '</a>';
        }
    }

    jQuery('#NumberOfMaps').html(message);
}

function ignoreLink(NumberOfMapsMax, NumberOfMaps, NumberOfMapsLinks, i) {
    // show only the first 8 links if there are less than 8 maps
    // on the map
    if (NumberOfMapsLinks && (NumberOfMaps < NumberOfMapsLinks) && i > NumberOfMapsLinks) return 1;

    // ignore odd small number links
    if (i == 5 || i == 7) return 1;

    // always show the last link
    if (NumberOfMapsMax == i) return 0;

    if (i > NumberOfMapsLinks && i <= mc.row3 && i % 2 == 1) return 1;

    if (i > NumberOfMapsLinks && i > mc.row3 && i <= mc.row4 && i % 3 != 0) return 1;

    if (i > NumberOfMapsLinks && i > mc.row4 && i <= mc.row5 && i % 4 != 0) return 1;

    if (i > NumberOfMapsLinks && i > mc.row5 && i % 10 != 0) return 1;

    return 0;
}

function LayerType(type, name, create) {
    this.type = type;
    this.name = name;
    this.create = create;

    state.layertypes_hash[type] = this;
}

function OverLayerType(type, name, create) {
    this.type = type;
    this.name = name;
    this.create = create;

    state.over_layertypes_hash[type] = this;
}

// add an existing map to overlay menu

function AddOverlay(type) {
    var obj = state.layertypes_hash[type];

    if (obj && obj.type) {
        return new OverLayerType("ol_" + obj.type, obj.name, obj.create);
    } else {
        debug("unknown map type: " + type, " cannot create overlay");
        return {};
    }
}


function MapLayer(layertype) {
    var layertype_default = "mapnik";

    debug("MapLayer: " + layertype);
    var lt = state.layertypes_hash[layertype];
    if (!lt) {
        debug("unknown layer type: '" + layertype + "', fall back to " + layertype_default);
        lt = state.layertypes_hash[layertype_default];

        // XXX: give up!
        if (!lt) return {};
    }
    this.layer = lt;
    this.type = lt.type;
    this.name = lt.name;
    this.obj = lt.create();
}

function newLayer(map, layertype) {
    state.layers[map] = new MapLayer(layertype);
    state.maps[map].addLayer(state.layers[map].obj);
}

function changeOverLayer(event, _name) {
    var name = event ? event.target.value : _name;
    debug(name);

    var oldLayerName = state.over_layers[0];
    debug("old overlayer name: " + oldLayerName);

    // remove old overlay layers
    for (var n = 0; n < mc.NumberOfMaps; n++) {
        var layers = state.maps[n].layers;
        // alert("old name: " + oldLayerName + " " + (layers ? layers.length : -999) + "x" + state.maps[n].getNumLayers() );
        for (var i = 0; layers && i < layers.length; i++) {
            if (state.maps[n].baseLayer != layers[i]) state.maps[n].removeLayer(layers[i]);
        }
    }

    // done
    if (name == "none") {
        showTransparentMenu(false);
        state.over_layers[0] = name;
        updatePermalink();
        return;
    }

    for (var n = 0; n < mc.NumberOfMaps; n++) {
        if (!state.over_layertypes_hash[name]) {
            debug("unknown overlay name: '" + name + "'");
            continue;
        }

        var overlay = state.over_layertypes_hash[name].create();

        // by default all overlays are not a base layer
        overlay.isBaseLayer = false;

        debug("name: " + name + " n: " + n);
        state.maps[n].addLayer(overlay);
    }

    state.over_layers[0] = name;
    updatePermalink();
    showTransparentMenu(true);

    // set opacity after an overlayer change
    // if (state.percent > 0) changeTransparent(null, -1);
    changeTransparent(null, state.percent);
}

function changeLayer(event) {
    var map = event.data;
    var maps = state.maps;

    var oldproj = maps[map].getProjectionObject();
    var oldcenter = maps[map].getCenter().clone();
    var oldzoom = maps[map].getZoom();

    var newmap = event.target.value

    maps[map].removeLayer(maps[map].baseLayer);
    newLayer(map, newmap);

    try {
        state.layers[map].obj.setMapType();
    } catch (e) {
        // debug(e.error);
    }

    maps[map].setCenter(oldcenter.transform(oldproj, maps[map].getProjectionObject()), oldzoom);
    updatePermalink();
}

function osm_getTileURL(bounds) {
    var res = this.map.getResolution();
    var x = Math.round((bounds.left - this.maxExtent.left) / (res * this.tileSize.w));
    var y = Math.round((this.maxExtent.top - bounds.top) / (res * this.tileSize.h));
    var z = this.map.getZoom();
    var limit = Math.pow(2, z);

    if (y < 0 || y >= limit) {
        return OpenLayers.Util.getImagesLocation() + "404.png";
    } else {
        x = ((x % limit) + limit) % limit;
        return this.url + z + "/" + x + "/" + y + "." + this.type;
    }
}

function MapOrderHtml(NumberOfMaps) {
    var tr0 = jQuery('tr#tr0');
    var tr1 = jQuery('tr#tr1');
    var tr2 = jQuery('tr#tr2');
    var tr3 = jQuery('tr#tr3');
    var tr4 = jQuery('tr#tr4');
    var data0 = "";
    var data1 = "";
    var data2 = "";
    var data3 = "";
    var data4 = "";

    // for the first 3 maps use only one row
    if (NumberOfMaps <= 3) {
        for (var i = 0; i < NumberOfMaps; i++) {
            data0 += MapTD(i);
        }

        tr0.html(data0);
    }

    // for more than 3 maps, use 2 rows
    else if (NumberOfMaps <= mc.row3) {
        var half = Math.ceil(NumberOfMaps / 2);
        for (var i = 0; i < NumberOfMaps; i++) {
            if (i < half) {
                data0 += MapTD(i);
            } else {
                data1 += MapTD(i);
            }
        }

        tr0.html(data0);
        tr1.html(data1);
    }

    // for 11 and more maps, use 3 rows
    else if (NumberOfMaps <= mc.row4) {
        var half = Math.ceil(NumberOfMaps / 3);
        for (var i = 0; i < NumberOfMaps; i++) {
            if (i < half) {
                data0 += MapTD(i);
            } else if (i < half + half) {
                data1 += MapTD(i);
            } else {
                data2 += MapTD(i);
            }
        }

        tr0.html(data0);
        tr1.html(data1);
        tr2.html(data2);
    }
    // 4 rows
    else if (NumberOfMaps <= mc.row5) {
        var half = Math.ceil(NumberOfMaps / 4);
        for (var i = 0; i < NumberOfMaps; i++) {
            if (i < half) {
                data0 += MapTD(i);
            } else if (i < half + half) {
                data1 += MapTD(i);
            } else if (i < half + half + half) {
                data2 += MapTD(i);
            } else {
                data3 += MapTD(i);
            }
        }

        tr0.html(data0);
        tr1.html(data1);
        tr2.html(data2);
        tr3.html(data3);
    }
    // 5 rows
    else {
        var half = Math.ceil(NumberOfMaps / 5);
        for (var i = 0; i < NumberOfMaps; i++) {
            if (i < half) {
                data0 += MapTD(i);
            } else if (i < 2 * half) {
                data1 += MapTD(i);
            } else if (i < 3 * half) {
                data2 += MapTD(i);
            } else if (i < 4 * half) {
                data3 += MapTD(i);
            } else {
                data4 += MapTD(i);
            }
        }

        tr0.html(data0);
        tr1.html(data1);
        tr2.html(data2);
        tr3.html(data3);
        tr4.html(data4);
    }
}

function MapTD(number) {
    var help = mc.NumberOfMaps >= 7 ? "" : "Choose map type: ";
    var td = "";
    td += '<td class="maps" id="column' + number + '">';
    td += '   <form action="" class="switch" id="head' + number + '">';
    td += '      <div>' + help + '<select id="sw' + number + '" name="sw' + number + '"><option/></select></div>';
    td += '   </form>';
    td += '   <div class="map" id="map' + number + '"></div>';
    td += '</td>';

    return td;
}

/*
 * helper function
 */
function toggleFullScreen() {
    var fullscreen = !state.fullscreen;

    // elements by id
    for (var i = 0; i < state.non_map_tags.length; i++) {
        toggleID(state.non_map_tags[i], fullscreen);
    }

    // map titles
    for (var i = 0; i < mc.NumberOfMaps; i++) {
        toggleID("head" + i, fullscreen);
    }

    state.fullscreen = fullscreen;
    setMapHeight(mc.NumberOfMaps);

    // if active, make the font size larger
    if (fullscreen) {
        $("#fullscreen").removeClass("font_deactive").addClass("font_active");
    } else {
        $("#fullscreen").removeClass("font_active").addClass("font_deactive");
    }
}

function toggleID(tagname, fullscreen) {
    var tag = jQuery("#" + tagname);

    if (tag) fullscreen ? tag.hide() : tag.show();
}

/*
   0: no logging
   1: log to console
   2: log to <div id="debug">
   3: log to <div id="debug">, endless growing
*/
function debug(text, id) {
    if (!mc.debug) return;
    if (!window.console) return; // IE8 ?
    // always log to JavaScript console for debug >= 1
    console.log("Map Compare: " + text);

    if (mc.debug == 1) return;

    if (!id) id = "debug";
    var tag = jQuery("#" + id);

    if (!tag) return;

    // log to HTML page
    var prefix = "debug: ";
    var html = tag.html() ? tag.html() + "; " : prefix;
    tag.html((mc.debug == 3 ? html : prefix) + text)
}

/*
 * geo-location services, find out your current position
 *
 */
function locateMe() {
    if (!navigator || !navigator.geolocation) return;

    var tag = locateMe_tag();
    if (tag) {
        tag.show();
        navigator.geolocation.getCurrentPosition(locateMe_cb, locateMe_error);
        setTimeout(function () {
            tag.hide();
        }, 5000); // paranoid
    }
}

function locateMe_tag() {
    return jQuery("#tools-pageload");
}

function locateMe_cb(position) {
    var zoom = 15;

    var pos = new MapPosition(position.coords.longitude, position.coords.latitude, zoom);
    setStartPos(1, pos.getLonLat(), pos.zoom);
    locateMe_tag().hide();
    debug("set position lat,lon: " + pos.lat + "," + pos.lon + ", zoom: " + zoom);
}

function locateMe_error(error) {
    debug("could not found position");
    locateMe_tag().hide();
    return;
}

/*
 * set Map Compare preferences in admin console
 *
 */
function initConsole() {
    // debug("init console");
    initCookieCheck();

    initSocial();
    initLayerTypes();

    consoleNumberOfMaps();
    consoleCenterOfMaps();
    consoleTileServer();

    initLayerTypesUserDefined();
    consoleOrderOfMaps();
}

function initCookieCheck() {
    var name = mc_console.cookie.check;

    setCookie(name, "1", true);
};

function initSocial() {
    var tag = jQuery("#social");
    if (!tag) return;

    mc.social ? tag.show() : tag.hide();
}

// returns the configured number of maps

function getNumberOfMaps(override) {
    var number = jQuery.cookie(mc_console.cookie.numberOfMaps);

    if (!number || override) number = mc.NumberOfMaps;
    number = parseInt(number);

    if (number < 1 || number > 999) number = 2;

    return number;
}


function getOrderOfPrefMaps(override) {
    var cookie = jQuery.cookie(mc_console.cookie.orderOfMaps);
    if (!cookie) return mc.mt;

    var list = cookie.split("^");
    if (list.length <= 0) return mc.mt;

    for (var i = 0; i < list.length; i++) {
        if (list[i]) mc.mt[i] = list[i];
    }
    return mc.mt;
}

function getTileServer(number) {
    var obj = {};

    return obj;
}

function setTileServer(obj) {}

function consoleStoreTileServer() {
    // debug("foo");
}

function consoleStoreTileServerOrder() {
    var list = [];

    for (var i = 0; i < mc.mt.length && i < mc.NumberOfMaps; i++) {
        list.push(mc.mt[i]);
    }

    var value = list.join("^");
    setCookie(mc_console.cookie.orderOfMaps, value);
    debug("order of maps: " + value);
}

/*
   get center of map as [lng,lat] array

   checked in order:
   1. cgi parameter
   2. cookies
   3. MC config
*/
function getMapCenter(override) {
    var p = {};
    var pos;
    var zoom = mc.pos.zoom;

    parseParams(function (param, v) {
        p[param] = unescape(v).replace(/\+*$|^\+*/g, "").replace(/\+/g, " ");
    });

    var pos_string = override || p["center"] || jQuery.cookie(mc_console.cookie.centerOfMaps);

    if (!pos_string) return mc.pos;

    // http://a.tile.bbbike.org/osm/bbbike-smoothness/15/17602/10746.png
    if (pos_string.match(/^http:/)) {
        pos = tile2lnglat(pos_string);
        if (pos) {
            return pos;
        } else {
            debug("could not parse URL: " + pos_string);
            return mc.pos;
        }
    }

    // 13.38885,52.51,12
    else {
        pos = pos_string.split(",");
        if (pos.length < 2) {
            debug("unknown pos: " + pos_string);
            return mc.pos;
        }
        if (!check_lng(pos[0])) {
            debug("unknown lng: " + pos[0]);
            return mc.pos;
        }
        if (!check_lat(pos[1])) {
            debug("unknown lat: " + pos[1]);
            return mc.pos;
        }


        if (pos[2]) {
            if (pos[2] == NaN || pos[2] > 20 || pos[2] < 0) {
                debug("unknown zoom level: " + pos[2] + ", ignored");
            } else {
                zoom = pos[2];
            }
        }

        var p = {
            "lng": pos[0],
            "lat": pos[1],
            "zoom": zoom
        };

        return p;
    }
}

function consoleStoreMapCenter(value) {
    var tag = jQuery('#center')
    var value = tag ? tag.attr("value") : "";

    var pos = getMapCenter(value);
    var string = pos2string(pos);

    setCookie(mc_console.cookie.centerOfMaps, string);
    debug("center of maps: " + string);
}


/*
   display menu to configure the default number of maps
*/
function consoleNumberOfMaps() {
    if (!mc_console.pref_numberOfMaps) return jQuery("#pref_numberOfMaps").hide();

    var tag = jQuery('#consoleNumberOfMaps');
    if (!tag) return false;

    var NumberOfMaps = getNumberOfMaps();

    for (var i = 0; i < state.layertypes.length; i++) {
        var j = i + 1;
        var opt = document.createElement('option');
        opt.value = j;
        opt.text = j;
        opt.style.padding = '1px';
        tag[0].options[i] = opt;

        // pre-select value
        if (j == NumberOfMaps) tag[0].options[i].selected = true;
    }

    // keep current value, even if nothing changed and the user pressed click
    mc.NumberOfMaps = NumberOfMaps;

    // on change update javascript variables
    tag.bind('change', null, function (event) {
        mc.NumberOfMaps = event.target.value;
    });
}

function pos2string(pos) {
    var string = pos.lng + "," + pos.lat;
    if (pos.zoom) string += "," + pos.zoom;

    return string;
}

function consoleCenterOfMaps() {
    if (!mc_console.pref_centerOfMaps) { // disable section
        return jQuery("#pref_centerOfMaps").hide();
    }

    var tag = jQuery('#center');
    if (!tag) return false;

    var pos = getMapCenter();

    tag.attr("value", pos2string(pos));
    return;
}

function consoleOrderOfMaps() {
    var mapsPerRow = 2; // number of maps per row, 2..4
    if (!mc_console.pref_orderOfMaps) return jQuery("#pref_orderOfMaps").hide();

    var tag = jQuery('#consoleOrderOfMaps');
    if (!tag) return false;

    var NumberOfMaps = getNumberOfMaps();
    if (NumberOfMaps > 8) // show only 8 maps, more don't make sense
    NumberOfMaps = 8;

    var layertypes = state.layertypes;
    var html = "\n";
    for (var n = 1; n <= NumberOfMaps; n++) {
        html += "Map " + n + ": ";
        html += '<select id="order_' + n + '">'
        html += '<option value="">default</option>';

        for (var i = 0; i < layertypes.length; i++) {
            html += '<option '
            if (mc.mt[n - 1] && layertypes[i].type == mc.mt[n - 1]) html += 'selected="selected" '
            html += 'value="' + layertypes[i].type + '">' + layertypes[i].name + '</option>';
        }
        html += "</select>\n";
        html += (n % mapsPerRow == 0 ? "<br/>" : "\n");
    }
    tag.before(html);

    for (var n = 1; n <= NumberOfMaps; n++) {
        var tag = jQuery('#order_' + n);

        // on change update javascript variables
        tag.bind('change', null, (function (number) {
            return function (event) {
                var value = event.target.value;
                if (value) mc.mt[number] = value;
                debug(value + " " + number);
            };
        })(n - 1)); // call by value, not a reference to n variable
    }

    debug(mc.mt.join("/"));
}


function consoleStoreCookieNumberOfMaps() {
    var number = getNumberOfMaps(true);

    setCookie(mc_console.cookie.numberOfMaps, number);
    debug("number of maps: " + number);
}

function cookieCheck() {
    var name = mc_console.cookie.check;
    var value = jQuery.cookie(name);

    if (!value) {
        var tag = jQuery("#tools-console");
        tag.before('<p class="error">Please enable cookies!</p>');
    }
}

function setCookie(name, value, nocheck) {
    if (!nocheck) cookieCheck();

    jQuery.cookie(name, value, {
        expires: mc.preferences_expire,
        path: '/'
    });
}

/*
   delete cookie by name, or all if no argument is given
*/
function consoleDeleteCookies(array) {
    var list = array || [];

    // delete all cookies
    if (list.length == 0) {
        list.push(mc_console.cookie.numberOfMaps);
        list.push(mc_console.cookie.orderOfMaps);
        list.push(mc_console.cookie.centerOfMaps);

        // all tile servers
        for (var i = 1; i <= mc_console.maxTileServer; i++) {
            list.push(mc_console.cookie.tileserver + i);
        }
    }

    for (var i = 0; i < list.length; i++) {
        jQuery.cookie(list[i], null, {
            path: '/'
        });
    }
}

/*
  returns a tile server config object for a given number (1..4)
  The data is from the URL parameters or a cookie
*/
function getTileServerConfig(number) {
    var i = number;

    var p = {}
    parseParams(function (param, v) {
        p[param] = unescape(v).replace(/\+*$|^\+*/g, "").replace(/\+/g, " ");
    });

    var obj = {
        name: 'local_tileserver_name_' + i,
        url: 'local_tileserver_url_' + i,
        base: 'local_tileserver_isbaselayer_' + i,
        cookie: mc_console.cookie.tileserver + i
    };

    // validate tile server config

    function validateObj(obj, p, cookie) {
        var maxNameLength = 25;
        // cleanup
        for (var key in obj) {
            if (key.match(/_v$/)) continue; // XXX
            var k = cookie ? key : obj[key]; // cookie or cgi param
            if (typeof p[k] === 'undefined') p[k] = "";

            var val = p[k];
            obj[key + "_v"] = xss(val) ? "" : val;
        }

        if (obj.name_v.length > maxNameLength) obj.name_v = obj.name_v.substring(0, maxNameLength);

        obj.url_v = normalizeTileServerURL(obj.url_v);
        if (obj.url_v.length > 200) obj.url_v = "";
    }

    // read from URL parameters
    if (p["pref_tileserver"]) {
        validateObj(obj, p);
    }
    // read from cookie
    else {
        var _p = parseCookieTileServer(number);
        validateObj(obj, _p, true);
    }

    obj["pref_tileserver"] = p["pref_tileserver"];

    // disallow spaces in URLs
    if (!isURL(obj.url_v) || obj.url_v.match(/\s|\+/)) obj.url_v = "";

    return obj;
}


/*
  console: display user tile server configuration table
*/
function consoleTileServer() {
    if (!mc_console.pref_tileserver) return jQuery("#pref_tileserver").hide();

    var tag = jQuery('#table_tileserver');
    if (!tag) return false;

    var maxTileServer = mc_console.maxTileServer;

    for (var i = 1; i <= maxTileServer; i++) {
        var obj = getTileServerConfig(i);

        var text = '<tr>' + '<td>' + i + '</td>' + '<td><input maxlength="32" name="' + obj.name + '" type="text" value="' + obj.name_v + '"></td>' + '<td><input maxlength="128" name="' + obj.url + '" type="text" value="' + obj.url_v + '" /></td>' + '<td><select name="' + obj.base + '"><option value="1">yes</option>' + '<option value="0"' + (obj.base_v == "0" ? ' selected="selected"' : "") + '>no</option></td>' + '</tr>';

        tag.append(text);

        var cookie_value = obj.name_v + "^" + obj.url_v + "^" + obj.base_v;
        if (obj.url_v != "") {
            debug("cookie: " + obj.cookie + " " + cookie_value);
            setCookie(obj.cookie, cookie_value);
        } else {
            if (obj.pref_tileserver) {
                consoleDeleteCookies([obj.cookie]);
                debug(obj.cookie);
            }
        }
    }
}

/*
  read all user tile server configs from cookies
*/
function initLayerTypesUserDefined() {
    for (var i = mc_console.maxTileServer; i > 0; i--) {
        var cookie = jQuery.cookie(mc_console.cookie.tileserver + i)
        if (cookie) initLayerTypesCookie(i, cookie);
    }
}


/*
  check for valid input
*/
function xss(string) {
    var result = string.match(/[<>"'\^]/) ? 1 : 0;

    if (result) debug("xss detected");

    return result;
}

/*
   /osm/11/1100/671.png -> /osm/${z}/${x}/${y}.png
*/
function normalizeTileServerURL(url) {
    var regex = new RegExp('/[12]?\\d/\\d+/\\d+\.(png|jpg)$');

    if (url && url.match(regex)) {
        url = url.replace(regex, "/${z}/${x}/${y}.$1");
    }

    return url;
}

function parseCookieTileServer(i, cookie) {
    if (!cookie) cookie = jQuery.cookie(mc_console.cookie.tileserver + i);
    if (!cookie) return {};

    var data = cookie.split("^");

    var obj = {
        "name": data[0],
        "url": data[1],
        // normalizeTileServerURL($data[1]),
        "base": data[2],
        "type": 'user_' + i
    };

    // must be a real URL
    if (!isURL(obj.url)) return {};
    if (xss(obj.url)) return {};

    return obj;
}

function isURL(url) {
    if (typeof url === 'undefined' || url == "") return false;

    // support multiple servers
    url = url.replace(/\{switch:([a-z0-9]+).*?\}/, "$1");

    return url.match(/^http:\/\/[\w+_\-\.]+(:\d+)?\/\w+/) ? true : false;
}

/*
 * support multiple servers in URL config
 * http://{switch:a,b}.tile.bbbike.org -> ["http://a.tile.bbbike.org", "http://a.tile.bbbike.org" ]
 */
function switch_url(url) {
    var list = url.match(/(http:\/\/[0-9a-z\-]*?)\{switch:([a-z0-9,]+)\}(.*)/);

    if (!list || list.length == 0) {
        return url;
    }

    var servers = list[2].split(",");
    var url_list = [];
    for (var i = 0; i < servers.length; i++) {
        url_list.push(list[1] + servers[i] + list[3]);
    }

    return url_list;
}

/*
  add a user tile server
*/
function initLayerTypesCookie(i, cookie) {
    debug("got cookie: " + cookie);

    var obj = parseCookieTileServer(i, cookie);
    if (!isURL(obj.url)) return;

    if (obj.base != "0") {
        state.layertypes.unshift(new LayerType(obj.type, obj.name, function () {
            return new OpenLayers.Layer.OSM(obj.name, switch_url(obj.url), {
                tileOptions: {
                    crossOriginKeyword: null
                },
                // openlayers 2.12
                sphericalMercator: true
            })
        }));
        // addMaptypeToOrder(obj.type);
    } else {
        // over_layertypes.unshift(l);
        state.over_layertypes.unshift(new OverLayerType(obj.type, obj.name, function () {
            return new OpenLayers.Layer.OSM(obj.name, switch_url(obj.url), {
                tileOptions: {
                    crossOriginKeyword: null
                },
                sphericalMercator: true,
                isBaseLayer: false
            })
        }));
    }
}

// add a maptype to prefered order list

function addMaptypeToOrder(maptype) {
    for (var i = 0; i < mc.mt.length; i++) {
        // maptype already exists, skip
        if (mc.mt[i] == maptype) return;
    }
    mc.mt.unshift(maptype);
}

/*
  social links
*/

/*
   load google on demand
*/
function google_plusone() {
    if (!state._google_plusone) {
        jQuery.getScript('https://apis.google.com/js/plusone.js');
        $('.gplus').remove();
    }
    state._google_plusone = 1;
}


/*
  hide links on small windows, or make the text smaller
*/
function initFooter() {
    if (!mc.social) return;

    if (jQuery(window).width() <= 920) {
        $('.long_footer').hide();
    } else {
        $('.long_footer').show();
    }
}

/*
   see http://wiki.openstreetmap.org/wiki/Slippy_map_tilenames
*/
function tile2lng(x, z) {
    return (x / Math.pow(2, z) * 360 - 180);
}

function tile2lat(y, z) {
    var n = Math.PI - 2 * Math.PI * y / Math.pow(2, z);
    return (180 / Math.PI * Math.atan(0.5 * (Math.exp(n) - Math.exp(-n))));
}

function tile2lnglat(url) {
    var regex = new RegExp('^http://.*?/([12]?\\d)/(\\d+)/(\\d+)\.(png|jpg)$');
    var lng;
    var lat;

    if (!url) return;

    var match = regex.exec(url);
    if (!match) return;

    lng = tile2lng(match[2], match[1]);
    lat = tile2lat(match[3], match[1]);
    if (lng == NaN || lat == NaN) return;

    return {
        "lng": lng,
        "lat": lat,
        "zoom": match[1]
    }
}

/* validate lat or lng values */

function check_lat(number) {
    return check_coord(number, 90)
}

function check_lng(number) {
    return check_coord(number, 180)
}

function check_coord(number, max) {
    if (number == NaN || number == "") return false;
    if (number >= -max && number <= max) return true;

    return false;
}

/* EOF */
