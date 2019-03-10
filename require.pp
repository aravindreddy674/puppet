#Scenario 1:
		# ordering.pp
		file { '/tmp/file3.txt':
 			ensure  => 'file',
		}
		file { '/tmp/file1.txt':
 			ensure  => 'file',
		}
		file { '/tmp/file2.txt':
 			ensure  => 'file',
		}

---------------------------------------------------
#Scenario 2:
	# Change that file
		file { '/tmp/file3.txt':
 			ensure  => 'file',
 			require => File['/tmp/file2.txt']
		}
		file { '/tmp/file1.txt':
 			ensure  => 'file',
 			before => [ File['/tmp/file2.txt'], File['/tmp/file2.txt'] ],
		}
		file { '/tmp/file2.txt':
 			ensure  => 'file',
		}

---------------------------------------------------
#Scenario 3: Use the reference instead of Before or Require
	# Change that file
		file { '/tmp/file3.txt':
 			ensure  => 'file', 			
		}
		file { '/tmp/file1.txt':
 			ensure  => 'file', 			
		}
		file { '/tmp/file2.txt':
 			ensure  => 'file',
		}
		File['/tmp/file1.txt'] -> File['/tmp/file2.txt'] -> File['/tmp/file3.txt']
