#Scenario 1:
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
#Scenario 2:

	# notify.pp
		file { '/tmp/config':
 			ensure  => 'file',
 			content => "config",
 			notify => Service['crond'],	
		}
		service { 'crond':
			ensure => 'running',			
		}
