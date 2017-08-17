/**
 * main.js
 *
 * @author Johannes Braun <johannes.braun@hannenz.de>
 * @package schrodi-pms
 */

document.addEventListener('DOMContentLoaded', init);

var app = function() {

	init: function() {
		console.log('Init');
	}
}


function init() {

	var app = App();
	app.init();

};
