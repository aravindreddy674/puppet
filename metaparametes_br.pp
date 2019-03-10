Before and Require:
	-------------------

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
	$ puppet apply ordering.pp (check the order)

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
	$ puppet apply ordering.pp (check the order)

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
