# schedule.pp
		schedule { 'everyday':
			period => daily,
			range => '4 - 8'
			repeat => 1,
		}
		file { '/tmp/recover.txt':
 			ensure  => 'file',
 			content => "This is the content",  	
 			schedule => 'everyday'		
		}
