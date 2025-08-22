'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "c089fdb4d463083753327aa4c5d2213f",
"version.json": "7b30df10b4928bfb92d6000a57b6d62a",
"index.html": "816870742a4a176c7b595e2a9d947104",
"/": "816870742a4a176c7b595e2a9d947104",
"main.dart.js": "1a5d474b7c4abacfc9d1ae7e0c87873b",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "427c6a0f54fa3a68843959c20d790a54",
"assets/AssetManifest.json": "b8cae97a6dc5c76c19daff88ae017059",
"assets/NOTICES": "5c272cb09a03362045418ca36a538770",
"assets/FontManifest.json": "120e130cb012b86542fb5acd3f59c325",
"assets/AssetManifest.bin.json": "f86df9097d5d335212f2dab3ffa66504",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "57befbc4c33cb1b72467ed5b42a6e00b",
"assets/fonts/MaterialIcons-Regular.otf": "c0ad29d56cfe3890223c02da3c6e0448",
"assets/assets/sounds/B4.mp3": "86081583c78b94e8b8ba9c3e56fe0ab5",
"assets/assets/sounds/C4.mp3": "ac4c7ebe61882efd5d65c3bab94faf79",
"assets/assets/sounds/D4.mp3": "3079de141d5be44b143906557b3702b3",
"assets/assets/sounds/E4.mp3": "89abb6b018c823c1d8b97459416f231a",
"assets/assets/sounds/Gb4.mp3": "13e3c5a977f3ebfe5c341b07c3fda9a4",
"assets/assets/sounds/F4.mp3": "aefd2a66347cca4955feedb35aaaaba0",
"assets/assets/sounds/Eb4.mp3": "f71eaa96e035a87d6c170e122082b018",
"assets/assets/sounds/Ab4.mp3": "b01ba69421396eeae134a11467020c28",
"assets/assets/sounds/G4.mp3": "2d1413fbcc5bb21897ce1c0784afa78b",
"assets/assets/sounds/Db4.mp3": "a56b8f0db6730fdbc08bd88d9541ff5f",
"assets/assets/sounds/A4.mp3": "c2b5c24d50fc8f5fe35d78adf8b96a6a",
"assets/assets/sounds/Bb4.mp3": "044c8fa317b5aca61b43089545bce830",
"assets/assets/logo/flask.png": "7bf89901e6a24d0698ec95a683fd9123",
"assets/assets/logo/tensorflow.png": "58061210a2541af078005bbcb3a32bdf",
"assets/assets/logo/quarkus.png": "f06d2d4691bf322a48e7cc898e5e7e2e",
"assets/assets/logo/flutter.png": "8f433c4a76e0bcb9cc50ba8e8b430471",
"assets/assets/logo/rust.png": "5622beb848fcc15f0ca044519b5bd58f",
"assets/assets/logo/gmail.png": "66c8f4e88d969252631acf1b842393c9",
"assets/assets/logo/react_native.png": "c24327307b0ad1d1295419709b854115",
"assets/assets/logo/spring.png": "594ed0b883c1f321e45c9d7098e21eab",
"assets/assets/logo/postgresql.png": "c3c767ad21b1f7832827883b7ce4c769",
"assets/assets/logo/django.png": "561bc359eeb31173fb807c4d644e0988",
"assets/assets/logo/swift.png": "44a22e100c665a3df8ca76e9b8daa0f5",
"assets/assets/logo/bangkit.png": "71dd42c9e9f0ed9597b1eb694d502ae4",
"assets/assets/logo/bjb_syariah.png": "027feb251cf1426205924814c017419c",
"assets/assets/logo/whatsapp.png": "1aa80beced508dbc8357acd5c5a85b08",
"assets/assets/logo/mongodb.png": "55fcf6f50c9401900bb6a18ef1a0c62f",
"assets/assets/logo/kotlin.png": "3f3182e761cf45dcd05a2e745f917ce4",
"assets/assets/font/SFPRODISPLAYLIGHTITALIC.otf": "bee8986f3bf3e269e81e7b64996e423c",
"assets/assets/font/SFPRODISPLAYREGULAR.otf": "aaeac71d99a345145a126a8c9dd2615f",
"assets/assets/font/SFPRODISPLAYBOLD.otf": "644563f48ab5fe8e9082b64b2729b068",
"assets/assets/font/SFPRODISPLAYMEDIUM.otf": "51fd7406327f2b1dbc8e708e6a9da9a5",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206"};
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
