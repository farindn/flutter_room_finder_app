'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "7551ee2d523ec600c8e38f2887922ff2",
"assets/assets/images/app_logo.png": "a8059284dda5f2674f132e4aa34303c7",
"assets/assets/images/city_aceh.png": "0f9d1f0c63558da71831b76bdf8f3e68",
"assets/assets/images/city_bandung.png": "fc9b4072aef748532c4b8a47f80bab56",
"assets/assets/images/city_bogor.png": "36afaa50de522a36524d8ac7a07054ba",
"assets/assets/images/city_jakarta.png": "10f8e35ee5b88618aa082a3903f7255c",
"assets/assets/images/city_palembang.png": "e9df0e9261b1b3ec0077c0741abcc00f",
"assets/assets/images/city_surabaya.png": "92831204deeda1a73bf5908b1a6cd016",
"assets/assets/images/detail_image.png": "0ffbafdb9867a2d52e1b708b26f06bc1",
"assets/assets/images/error_404.png": "3db7872c60e6de75284c5c95807522ad",
"assets/assets/images/icon_bedroom.png": "91c5b441647176338f34f8ebcdce7863",
"assets/assets/images/icon_card.png": "40b825142c65d6fba3ce470672a2e0ef",
"assets/assets/images/icon_cupboard.png": "c35affb644db0adfaa7006a07a5fcc01",
"assets/assets/images/icon_home.png": "37caafed363d44e5c4b424e4e9a7b3f6",
"assets/assets/images/icon_kitchen.png": "2f6416dd5cdde8b4573ff58598e62e5c",
"assets/assets/images/icon_love.png": "79f74cc543b7a21bb5607fc7d3c276a0",
"assets/assets/images/icon_mail.png": "c16da615f4435d2bed82b0f521fd8405",
"assets/assets/images/logo.png": "a176e0a31a6ab69012b25f7312804261",
"assets/assets/images/photo1.png": "2115608903cd7c4e25defd5da202baf4",
"assets/assets/images/photo2.png": "f0e1f4a1969209bbc4a2e108c92c5c3c",
"assets/assets/images/photo3.png": "cb92c0ee07cb52f828dfcd68be795a33",
"assets/assets/images/space1.png": "61fe59f42e6dc93a1c7d49c454400bac",
"assets/assets/images/space2.png": "a2b60707db6623d70540917fecb941f9",
"assets/assets/images/space3.png": "8ed13428fe19da16c0af2c63ab67b58c",
"assets/assets/images/splash_image.png": "24023792ad3448e61d5d7a2f4d708b96",
"assets/assets/images/tips1.png": "ebc745dcf05f7381539f97e111195d21",
"assets/assets/images/tips2.png": "6107a94e3087df28fcac3e6a5b885e15",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "7e7a6cccddf6d7b20012a548461d5d81",
"assets/NOTICES": "f303548f4c11e909572bcc4a0192d7bc",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "b1509dcf29822ca24bb823f6bbb04120",
"/": "b1509dcf29822ca24bb823f6bbb04120",
"main.dart.js": "3feefaac8b8f50973c9c43f8598570fb",
"manifest.json": "fbd6761941fc858a8cb5f90e818a3cfe",
"version.json": "d3ba18f8da567216a87b60366c257af3"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
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
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
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
