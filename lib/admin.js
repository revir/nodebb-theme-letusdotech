'use strict';
/* globals $, app, socket */

define('admin/plugins/material', ['settings'], function(Settings) {

	var ACP = {};

	ACP.init = function() {
		Settings.load('material', $('.material-settings'));

		$('#save').on('click', function() {
			Settings.save('material', $('.material-settings'), function() {
				app.alert({
					type: 'success',
					alert_id: 'material-saved',
					title: 'Settings Saved',
					message: 'Material theme settings saved. Click here to restart NodeBB.',
					timeout: 2500,
	                clickfn: function() {
	                    socket.emit('admin.restart');
	                }
				});
			});
		});
	};

	return ACP;
});