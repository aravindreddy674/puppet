#Scenario 1: Subscribe
# notify.pp
		file { '/tmp/config':
 			ensure  => 'file',
 			content => "config",			
		}
		service { 'crond':
			ensure => 'running',
			subscribe => File['/tmp/config'],
		}

--------------------------------------------
#Scenario 2: Notify

	# notify.pp
		file { '/tmp/config':
 			ensure  => 'file',
 			content => "config",
 			notify => Service['crond'],	
		}
		service { 'crond':
			ensure => 'running',			
		}
