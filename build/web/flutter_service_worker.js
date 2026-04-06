'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "407671345b54e2bf76b33169e376f8f8",
"version.json": "009c9e65172e010890f7f65fde438006",
"index.html": "5d404d212c84381e2326f5b9500d60ea",
"/": "5d404d212c84381e2326f5b9500d60ea",
"main.dart.js": "ef0896298b60661f2edbe5c3be3db746",
"flutter.js": "888483df48293866f9f41d3d9274a779",
"favicon.png": "fd3220ef9d8fd63d41a775c9676eabf9",
"icons/Icon-192.png": "861e76001fcf0138005bd556c2dd3eb0",
"icons/Icon-512.png": "818c99a011aaad531e9cda7927bfe1fb",
"manifest.json": "e4e16941d2826031ae5c807f71f3a110",
"assets/AssetManifest.json": "c5f7458e2eb194df557ab24e54fe4606",
"assets/NOTICES": "fefa22af4d8213bd01b7a330ff646321",
"assets/FontManifest.json": "12888eb6a272cf70cea0b0ddcf1f6697",
"assets/AssetManifest.bin.json": "36e2d7ee8becc6880684d6f9531dc577",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/flutter_map/lib/assets/flutter_map_logo.png": "208d63cc917af9713fc9572bd5c09362",
"assets/packages/flutter_neumorphic_plus/fonts/NeumorphicIcons.ttf": "32be0c4c86773ba5c9f7791e69964585",
"assets/packages/fluttertoast/assets/toastify.js": "56e2c9cedd97f10e7e5f1cebd85d53e3",
"assets/packages/fluttertoast/assets/toastify.css": "a85675050054f179444bc5ad70ffc635",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "c0a505cb409e8c0c107dcc10f9020942",
"assets/fonts/MaterialIcons-Regular.otf": "bb9bce5a6494bab8553986a89ca0a287",
"assets/assets/svg/spring.svg": "9f2f383902889cb3e54660c7cbce9eb0",
"assets/assets/svg/open-book.svg": "c30f880084801e7359a41049792ac74c",
"assets/assets/svg/javascript.svg": "d8036b1cbd6a35abd73116b8b5fd0214",
"assets/assets/svg/js.svg": "61deeb1e557dc853b214794ca7aac6c5",
"assets/assets/svg/java.svg": "7c85e8dd93641956b145cdf6ba40e36a",
"assets/assets/svg/github.svg": "d73dc34f5d83975df7eef7eeee64f5a2",
"assets/assets/svg/sql.svg": "d0c17845486201588cfac9d06bfeb091",
"assets/assets/svg/web-dev.svg": "61a8af62262549b2b29721a48fc7113f",
"assets/assets/svg/flutter.svg": "9c8c53fe59a69b95030156fbc73766ab",
"assets/assets/svg/python.svg": "3d52af2791a852534de70ebcd5ae1d8b",
"assets/assets/svg/dart.svg": "2f8e385bc96f180f8851f13af22e71e9",
"assets/assets/svg/send.svg": "278c9b53db068ee4f28012715bd1c6d8",
"assets/assets/svg/azure.svg": "4247cac239a7106d30ecfe1858c34e25",
"assets/assets/svg/playstore.svg": "81b1c90e39b3bb2551ac4c47c7a77e46",
"assets/assets/svg/asd.svg": "b65d2bb42b9ab0e4c42bc0caf55b2149",
"assets/assets/svg/mobile-phone.svg": "e1b4a1b61d351bbaf55c8bb1f92f1d83",
"assets/assets/svg/linkedin.svg": "0e285d776d2f29b6f7d65654f38edda4",
"assets/assets/svg/react.svg": "92be07f0677e7636a3b12aa2f77ff14e",
"assets/assets/images/darknet-diaries.png": "de61f5fda2fdf2cb1e96a22ab169b4d4",
"assets/assets/images/cover-pathfinding.svg": "d4586053a2faf09799fa9771b911a44b",
"assets/assets/images/cover-todo.svg": "08a05a3fddd0804d24c3498478e80811",
"assets/assets/images/cover-snake.svg": "0e125b8f96ba9dd7b71aa113abf03c91",
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
"assets/assets/images/cover-neomart.svg": "68971fe50577745e873bd86edfe62197",
"assets/assets/images/app-icon.jpg": "1bf7bb4170b208273983c4e84ec050ef",
"assets/assets/images/cover-sudoku.svg": "471bf4ea2886440fc3ead066c55d3c0d",
"assets/assets/images/dd-app-icon.png": "f66504406fb756cce15bbddf1278abfe",
"assets/assets/images/profile.png": "fd3220ef9d8fd63d41a775c9676eabf9",
"assets/assets/images/cover-coverme.svg": "cab30841d124ba680f121fe793510595",
"assets/assets/images/project-cover.png": "f5c100f924841ff98c1f412fbf4f4345",
"assets/assets/images/librivox.png": "961aa81a439b7962540b5bc091462910",
"assets/assets/fonts/Poppins-Light.ttf": "fcc40ae9a542d001971e53eaed948410",
"assets/assets/fonts/Poppins-Medium.ttf": "bf59c687bc6d3a70204d3944082c5cc0",
"assets/assets/fonts/Poppins-ExtraBold.ttf": "d45bdbc2d4a98c1ecb17821a1dbbd3a4",
"assets/assets/fonts/Poppins-Regular.ttf": "093ee89be9ede30383f39a899c485a82",
"assets/assets/fonts/MaterialIcons-Regular.otf": "b69aa92ddbcb1fa9ca03865b485427be",
"assets/assets/fonts/Poppins-Bold.ttf": "08c20a487911694291bd8c5de41315ad",
"assets/assets/fonts/Poppins-SemiBold.ttf": "6f1520d107205975713ba09df778f93f",
"favicon.svg": "6c2497227901e2fff1dd48e043e2d953",
"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b"};
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
