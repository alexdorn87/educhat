Package.describe({
	name: 'rocketchat:logger',
	version: '0.0.1',
	summary: 'Logger for Eduard_Chat'
});

Package.onUse(function(api) {
	api.versionsFrom('1.0');

	api.use('coffeescript');
	api.use('underscore');
	api.use('random');
	api.use('logging');
	api.use('nooitaf:colors');
	api.use('raix:eventemitter');
	api.use('templating', 'client');
	api.use('kadira:flow-router', 'client');

	api.addFiles('ansispan.js', 'client');
	api.addFiles('logger.coffee', 'client');
	api.addFiles('client/viewLogs.coffee', 'client');
	api.addFiles('client/views/viewLogs.html', 'client');
	api.addFiles('client/views/viewLogs.coffee', 'client');

	api.addFiles('server.coffee', 'server');

	api.export('Logger');
});
