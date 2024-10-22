'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "d43d37e1aa32d9cfa4476fed7a5d9c7e",
"version.json": "1e90f5ceea926c44b079d28f431455d0",
"index.html": "1a32aa2bcb1db5ab12672acf20c72c71",
"/": "1a32aa2bcb1db5ab12672acf20c72c71",
"main.dart.js": "3b97be55acf8364169daf26b89db0413",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"favicon.png": "bc1c2af60b3045dbef05649817ae60e6",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "4b9a9bc6ccf955457bcaceb0a34322cb",
"assets/servers_list.xlsx": "af38a33dcc4ab188a8119662b9955db0",
"assets/AssetManifest.json": "4c60f7b89dec426a747b6e4527eb89f3",
"assets/NOTICES": "f2ff07497a71d93d2d9c8f58837e791f",
"assets/FontManifest.json": "f46c0aa832d508120f135032290b76f3",
"assets/AssetManifest.bin.json": "a1cf0dbcb0193b594ab1bb507d20cce9",
"assets/packages/syncfusion_flutter_datagrid/assets/font/FilterIcon.ttf": "b8e5e5bf2b490d3576a9562f24395532",
"assets/packages/syncfusion_flutter_datagrid/assets/font/UnsortIcon.ttf": "acdd567faa403388649e37ceb9adeb44",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/world_map.json": "aebb0515a60983165136da7cbe60c68e",
"assets/AssetManifest.bin": "ab4287992ee90708fba87f47eece2af3",
"assets/fonts/MaterialIcons-Regular.otf": "a3f14571cbe2c62c992f0137f2ecf694",
"assets/assets/north-america.json": "34fc983ca01db7b2d644902fb676b773",
"assets/assets/asia.json": "6204027a50f6592aecd83c03659dc2fd",
"assets/assets/images/png/abg.png": "fa86f74f94f4de4f55268d2c4acd9a44",
"assets/assets/images/png/left.png": "cc8798afd8ef029b46cd486b7352c317",
"assets/assets/images/png/app_bar_bg.png": "496277fc53737cd5c0771d2e9009ff8d",
"assets/assets/images/png/bottom_left.png": "a0cd9944af1766c795f6b50b2fceedf0",
"assets/assets/images/png/bottom_right.png": "8d3118b0ba4fdd66d4fbe10a56362849",
"assets/assets/images/png/middle.png": "64c8f1dc8403a11ff17308870583b1ca",
"assets/assets/images/png/top_right.png": "e10438efe0d46d8f6ceb69a530a1689e",
"assets/assets/images/png/right.png": "d1ae5e8b9ac0b6ea2695156ed7e38bf8",
"assets/assets/australia.json": "db910ad96f1846962be956434289c5aa",
"assets/assets/servers_list.xlsx": "af38a33dcc4ab188a8119662b9955db0",
"assets/assets/oceania.json": "7db33530e0389cc4ea604bb77cb844d2",
"assets/assets/africa.json": "56a9f9503e71cd1112ebda11cb1c1e5b",
"assets/assets/south-america.json": "25daa0f20a30506741d60940c7e7e999",
"assets/assets/icons/svg/google_play_icon_white.svg": "6fc5954e58d2d335620b180a80eb026f",
"assets/assets/icons/svg/nex_logo.svg": "752f26ab5460554f3b5f149454bb6c82",
"assets/assets/icons/svg/gpu_icon.svg": "9fa1a9a05021b2afe74a4116f3637d54",
"assets/assets/icons/svg/apple_icon_white.svg": "e379b477e6c900dbf8b4156b1987a966",
"assets/assets/icons/svg/server.svg": "99aec2d87dbd9214c0c95e806cff0906",
"assets/assets/icons/svg/cpu_meter_icon.svg": "f3ab7bbc26768087feb01db02a9f1455",
"assets/assets/icons/svg/money_icon.svg": "c59b2e2d6e93d1e80997c71fbb1c84a6",
"assets/assets/icons/png/secure_icon.png": "488563a9015c4cfe506e62268421f601",
"assets/assets/icons/png/warning_icon.png": "842838ffd4aecec1939e8bfac8d92af0",
"assets/assets/icons/png/online_icon.png": "6200fb66fd131229806249309e5aecf6",
"assets/assets/europe.json": "0f44a1a5bb32047412a991450180d7d3",
"assets/assets/world_map.json": "aebb0515a60983165136da7cbe60c68e",
"assets/assets/fonts/rubik/Rubik-MediumItalic.ttf": "4790a18709e781a0994dc17d04fd66f5",
"assets/assets/fonts/rubik/Rubik-Bold.ttf": "627d0e537f4a06a535ae956e4a87837f",
"assets/assets/fonts/rubik/Rubik-SemiBoldItalic.ttf": "a8a77ad44dbe8c031ce7b5442661610f",
"assets/assets/fonts/rubik/Rubik-Light.ttf": "86699cab89559b6f5ffd4887cb5c7a7c",
"assets/assets/fonts/rubik/Rubik-Medium.ttf": "e785acbf5775e9bec2129f4967a75472",
"assets/assets/fonts/rubik/Rubik-ExtraBoldItalic.ttf": "5f439e081a4e2980f8368285f7d0f8c9",
"assets/assets/fonts/rubik/Rubik-Black.ttf": "2a3b9f77607c7b691e81090c4edba341",
"assets/assets/fonts/rubik/Rubik-Italic.ttf": "17538a8196fb1d1fab888c5941acf9ec",
"assets/assets/fonts/rubik/Rubik-LightItalic.ttf": "ac5353ac12658ccfd7eca99a25be7037",
"assets/assets/fonts/rubik/Rubik-SemiBold.ttf": "742cf1e6b879de2de937aa287fddece4",
"assets/assets/fonts/rubik/Rubik-BlackItalic.ttf": "db5b8553106c0268251f65367ecfc3a0",
"assets/assets/fonts/rubik/Rubik-ExtraBold.ttf": "34215c81c17466f7aa764b441fa348df",
"assets/assets/fonts/rubik/Rubik-Regular.ttf": "46df28800514364ef2766f74386b1bd3",
"assets/assets/fonts/rubik/Rubik-BoldItalic.ttf": "dc069fd43e202359cfef038ce28b20ac",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c"};
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
