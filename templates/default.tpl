<!doctype html>
<html lang="{PAGELANG}"> 
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>{PAGETITLE}</title>
		<meta name="description" content="{PAGEVAR:cmt_meta_description:recursive}">
		<meta name="keywords" content="{PAGEVAR:cmt_meta_keywords:recursive">
	 	<meta name="viewport" content="width=device-width, initial-scale=1">

		<link rel="stylesheet" href="/css/main.css">
		<link rel="stylesheet" href="/css/vendor/leaflet.css">

		{LAYOUTMODE_STARTSCRIPT}
		{IF (!{LAYOUTMODE})}
			<script src="/js/vendor/flickity.pkgd.min.js"></script>
			<script src="/js/vendor/leaflet.js"></script>
		{ENDIF}
	</head>
	<body>
		<header class="main-header">
			<div class="inner-bound">
				<img class="logo" src="/img/logo.svg" alt="" />
				<nav class="main-nav">
					<ul>
						<li><a href="#welcome">Start</a></li>
						<li><a href="#portfolio">Leistungen</a></li>
						<li><a href="#contact">Kontakt</a></li>

						<!-- {LOOP NAVIGATION(1)} -->
						<!-- 	<li><a href="{NAVIGATION:link}" class="">{NAVIGATION:title}</a></li> -->
						<!-- {ENDLOOP NAVIGATION} -->
					</ul>
				</nav>
			</div>
		</header>
			{INCLUDE:PATHTOWEBROOT."phpincludes/slideshow/slideshow_controller.php"}
		
		<section id="welcome" class="section">
			<div class="main-content">
				{IF({LAYOUTMODE})}<pre>Einstieg</pre>{ENDIF}
				{LOOP CONTENT(1)}{ENDLOOP CONTENT}
			</div>
		</section>
		<section id="portfolio" class="section">
			<div class="main-content">
				{IF({LAYOUTMODE})}<pre>Portfolio</pre>{ENDIF}
				{LOOP CONTENT(2)}{ENDLOOP CONTENT}
			</div>
		</section>
		<section id="contact" class="section">
			<div class="main-content">
				{IF({LAYOUTMODE})}<pre>Kontaktformular</pre>{ENDIF}
				{LOOP CONTENT(3)}{ENDLOOP CONTENT}
			</div>
		</section>
		<section id="map" class="section">
			{IF({LAYOUTMODE})}<div class="main-content"><pre>Kartenansicht</pre></div>{ENDIF}
			{LOOP CONTENT(4)}{ENDLOOP CONTENT}
		</section>

		<footer class="main-footer">
			<div class="inner">
				<div class="main-footer__column">
					{LOOP CONTENT(5)}{ENDLOOP CONTENT}
				</div>
				<div class="main-footer__column">
					{LOOP CONTENT(6)}{ENDLOOP CONTENT}
				</div>
				<div class="main-footer__column">
					{LOOP CONTENT(7)}{ENDLOOP CONTENT}
				</div>
			</div>
		</footer>

		<!-- Include GA -->

		<!-- <script src="/js/main.min.js"></script> -->
		{IF(!{LAYOUTMODE})}
		<script>
			var mapElement = document.getElementById('js-map');
			if (mapElement.hasAttribute('data-height')) {
				mapElement.style.height = mapElement.getAttribute('data-height');
			}

			var coords = {
				lat: parseFloat(mapElement.getAttribute('data-lat')),
				lon: parseFloat(mapElement.getAttribute('data-lon'))
			};
			var pmsMap = L.map(mapElement).setView([coords.lat, coords.lon], 10);
			L.tileLayer('//{s}.tiles.mapbox.com/v3/hannenz.iodb36pi/{z}/{x}/{y}.png', {
				attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery &copy; <a href="http://mapbox.com">Mapbox</a>',
				maxZoom: 18,
				id: 'mapbox.streets',
			}).addTo(pmsMap);
			var marker = L.marker([coords.lat,  coords.lon]).addTo(pmsMap);
			if (mapElement.hasAttribute('data-popup-html')) {
				marker.bindPopup(mapElement.getAttribute('data-popup-html')).openPopup();
			}
		</script>
		{ENDIF}
		{LAYOUTMODE_ENDSCRIPT}
	</body>
</html>
