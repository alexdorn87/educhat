RocketChat.Migrations.add
	version: 34
	up: ->
		RocketChat.models.Settings.update
			_id: 'Layout_Login_Header'
			value: '<a class="logo" href="/"><img src="/assets/edu_logo/logo.svg?v=3" /></a>'
		,
			$set:
				value: '<a class="logo" href="/"><img src="/assets/edu_logo?v=3" /></a>'
