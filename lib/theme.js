(function(module) {
	"use strict";

	var theme = {};
	var	meta = module.parent.require('./meta');
	var fs = require('fs');
	var path = require('path');
	var nconf = module.parent.require('nconf');
	var async = module.parent.require('async');
	var categories = require.main.require('./src/categories');
	var db = require.main.require('./src/database');

	theme.init = function(params, callback) {

		params.router.get('/admin/plugins/material', params.middleware.admin.buildHeader, renderAdmin);
		params.router.get('/api/admin/plugins/material', renderAdmin);

		callback();
	};

	theme.addAdminNavigation = function(header, callback) {
		header.plugins.push({
			route: '/plugins/material',
			icon: 'fa-paint-brush',
			name: 'Material Design Theme'
		});

		callback(null, header);
	};

	theme.getConfig = function(config, callback) {

		meta.settings.get('material', function(err, settings) {
			config.menuInHeader = settings.menuInHeader === 'on';
			config.removeCategoriesAnimation = settings.removeCategoriesAnimation === 'on';
			config.subCategoriesAsCards = settings.subCategoriesAsCards === 'on';
			config.categoriesAsList = settings.categoriesAsList === 'on';
			config.listSubcategories = settings.listSubcategories === 'on';
		});

		callback(false, config);
	};

	theme.modifyLessVar = function(params, callback) {

		meta.settings.get('material', function(err, settings) {
			var selectedSkin = settings.skinOption || 'default';
			theme.modifyLessFile(selectedSkin, callback);
		});
	};

	theme.modifyLessFile = function(skin, callback) {
		var lessFilePath = path.join(nconf.get('base_dir'), 'node_modules/nodebb-theme-letusdotech/less/variables.less');
		var selectedSkin = skin || 'default';

		fs.readFile(lessFilePath, function(err, data) {
			if (err) {
				callback(err);
			} else {
				var less = data.toString();
				var textToReplace = less.substr(0, less.indexOf(';'));

				less = less.replace(textToReplace, '@theme: ' + selectedSkin);

				fs.writeFile(lessFilePath, less, function(err) {
					if (err) {
						callback(err);
					}
				});
			}

			callback(null);
		});
	};

	theme.getCategoryTreeInfo = function(data, callback) {
		var cid = data.category.cid;
		var uid = data.uid;
		async.waterfall([ function (next) {
			getRootCategoryId(cid, next);
		},
		function (rootCid, next) {
			// if (rootCid === cid) {
			// 	data.category.categoryTree = data.category.children;
			// 	return callback(null, data);
			// }
			categories.getCategoryData(rootCid, next);
		},
		function (categoryData, next) {
			data.category.rootCategory = categoryData;
			categories.getChildren([categoryData.cid], uid, next);
		},
		function (children, next) {
			data.category.categoryTree = children[0];
			next(null, data);
		}], callback);
	};

	theme.saveTopicToParentCategories = function(topicData){
		function _f(_c){
			categories.getCategoryField(_c, 'parentCid', function(err, pid){
				if (err) {
					return;
				}
				if (!err && pid) {
					db.sortedSetAdd('cid:' + pid + ':tids', topicData.timestamp, topicData.tid);
					db.incrObjectField('category:' + pid, 'topic_count');
					categories.updateRecentTid(pid, topicData.tid);
					return _f(pid);
				}
			});
		}
		_f(topicData.cid);
	};

	function renderAdmin(req, res) {
		res.render('admin/plugins/material', {});
	}

	function getRootCategoryId(cid, callback){
		var rid = cid;
		function _f(_c){
			categories.getCategoryField(_c, 'parentCid', function(err, pid){
				if (err) {
					return callback(err);
				}
				if (!err && pid) {
					rid = pid;
					return _f(pid);
				} else {
					return callback(null, rid);
				}
			});
		}
		_f(cid);
	}

	module.exports = theme;

}(module));
