'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "ff571c3a605c3e1ec398cf39a51ea09d",
"version.json": "009c9e65172e010890f7f65fde438006",
"index.html": "a3c9f056e09ce301b16831efd90da32e",
"/": "a3c9f056e09ce301b16831efd90da32e",
"main.dart.js": "e5b7a74ab86915d4d713ace6f9582a49",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"favicon.png": "2b631edb3227ab884475f8a0e144336a",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "b0b0dcd51c799d1ade905b589a199215",
"assets/AssetManifest.json": "68cf7d3113bc878a3fdecacc52e0701f",
"assets/NOTICES": "d579f3b1efa705b762cb471efa35d3f4",
"assets/FontManifest.json": "5c60636b5dd4284313fdab2ffbd7768f",
"assets/AssetManifest.bin.json": "6df066299e7824b1be6da5046f6a88cd",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/flutter_map/lib/assets/flutter_map_logo.png": "208d63cc917af9713fc9572bd5c09362",
"assets/packages/flutter_neumorphic_plus/fonts/NeumorphicIcons.ttf": "32be0c4c86773ba5c9f7791e69964585",
"assets/packages/fluttertoast/assets/toastify.js": "56e2c9cedd97f10e7e5f1cebd85d53e3",
"assets/packages/fluttertoast/assets/toastify.css": "a85675050054f179444bc5ad70ffc635",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "2a97643f263819e0a545fdf693f4db5d",
"assets/fonts/MaterialIcons-Regular.otf": "b69aa92ddbcb1fa9ca03865b485427be",
"assets/assets/svg/open-book.svg": "c30f880084801e7359a41049792ac74c",
"assets/assets/svg/javascript.svg": "d8036b1cbd6a35abd73116b8b5fd0214",
"assets/assets/svg/js.svg": "61deeb1e557dc853b214794ca7aac6c5",
"assets/assets/svg/web-dev.svg": "61a8af62262549b2b29721a48fc7113f",
"assets/assets/svg/flutter.svg": "9c8c53fe59a69b95030156fbc73766ab",
"assets/assets/svg/dart.svg": "2f8e385bc96f180f8851f13af22e71e9",
"assets/assets/svg/send.svg": "278c9b53db068ee4f28012715bd1c6d8",
"assets/assets/svg/playstore.svg": "81b1c90e39b3bb2551ac4c47c7a77e46",
"assets/assets/svg/asd.svg": "b65d2bb42b9ab0e4c42bc0caf55b2149",
"assets/assets/svg/mobile-phone.svg": "e1b4a1b61d351bbaf55c8bb1f92f1d83",
"assets/assets/svg/linkedin.svg": "0e285d776d2f29b6f7d65654f38edda4",
"assets/assets/svg/react.svg": "92be07f0677e7636a3b12aa2f77ff14e",
"assets/assets/images/darknet-diaries.png": "de61f5fda2fdf2cb1e96a22ab169b4d4",
"assets/assets/images/javascript.png": "82cb107344877f232f05a8e8a463edc2",
"assets/assets/images/certificates/Certificate%2520Java%2520SE%252011%2520dev-1.png": "c5701a5a4a6ee5b6245b258d83199fdf",
"assets/assets/images/certificates/Solution_arc-1.png": "0f73b194f9d6bd342fc0fb6f693d2481",
"assets/assets/images/certificates/java%2520hackerrank.png": "a7e0463a4e2e774c822d2b57934cc98c",
"assets/assets/images/certificates/SQL%2520hackerrank.png": "94d01cc4b63a2e4f402b3002b3406787",
"assets/assets/images/certificates/certificate_vb3f.j6jH.Ew3M%2520(1)-1.png": "b0fd36bd1697d03785bafc580975b5e7",
"assets/assets/images/certificates/javascript%2520hackerrank.png": "37e3a25a5cc40666f2cc08d7bcc985fe",
"assets/assets/images/certificates/python%2520hackerrank.png": "5de3fc3fe141290a867e5893c9c69108",
"assets/assets/images/certificates/mithulramg%2520Microsoft%2520az-104-1.png": "2c6227b23d4b2dd80cf79653897c915d",
"assets/assets/images/librivox-app-icon.png": "bfdb962116bd0b69fa14eb6f122e8bf9",
"assets/assets/images/portfolio-cover.png": "ceaee07a75a98d0db4351e63cadbb51b",
"assets/assets/images/app-icon.jpg": "1bf7bb4170b208273983c4e84ec050ef",
"assets/assets/images/dd-app-icon.png": "f66504406fb756cce15bbddf1278abfe",
"assets/assets/images/profile.png": "fd3220ef9d8fd63d41a775c9676eabf9",
"assets/assets/images/project-cover.png": "f5c100f924841ff98c1f412fbf4f4345",
"assets/assets/images/librivox.png": "961aa81a439b7962540b5bc091462910",
"assets/assets/fonts/Poppins-Light.ttf": "fcc40ae9a542d001971e53eaed948410",
"assets/assets/fonts/Poppins-Medium.ttf": "bf59c687bc6d3a70204d3944082c5cc0",
"assets/assets/fonts/Poppins-ExtraBold.ttf": "d45bdbc2d4a98c1ecb17821a1dbbd3a4",
"assets/assets/fonts/Poppins-Regular.ttf": "093ee89be9ede30383f39a899c485a82",
"assets/assets/fonts/Poppins-Bold.ttf": "08c20a487911694291bd8c5de41315ad",
"assets/assets/fonts/Poppins-SemiBold.ttf": "6f1520d107205975713ba09df778f93f",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
