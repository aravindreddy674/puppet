# Sample file with Directory and link
		file { '/tmp/afile':
 			ensure  => 'present',
 			content => "This is the content\n",
  			owner   => 'root',
  			group   => 'root',
  			mode 	=> '0644',
		}
		file { '/tmp/adirectory':
 			ensure  => 'directory',
 			owner   => 'root',
  			group   => 'root',
  			mode 	=> '0644',
		}
		file { '/tmp/adirectory/alink':
 			ensure  => 'link',
 			target 	=> '/tmp/afile',
 		}
