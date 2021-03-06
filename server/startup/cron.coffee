# Config and Start SyncedCron
logger = new Logger 'SyncedCron'

SyncedCron.config
	logger: (opts) ->
		logger[opts.level].call(logger, opts.message)
	collectionName: 'rocketchat_cron_history'

generateStatistics = ->
	statistics = RocketChat.statistics.save()
	statistics.host = Meteor.absoluteUrl()
	if RocketChat.settings.get 'Statistics_reporting'
		try	
			HTTP.post 'https://Eduard_Chat/stats',
				data: statistics
		catch e
			logger.warn('Failed to send usage report')
	return

Meteor.startup ->
	Meteor.defer ->
		generateStatistics()

		# Generate and save statistics every hour
		SyncedCron.add
			name: 'Generate and save statistics',
			schedule: (parser) -># parser is a later.parse object
				return parser.text 'every 1 hour'
			job: generateStatistics

		SyncedCron.start()
