$files = [ 'first', 'second', 'third' ]
$files.each | $file | {
	if ( $file == 'third' ){
		$file_type = 'directory'
	}
	else {
		$file_type = 'file'
	}

	case $file_type {
		'directory' : { $file_mode = '0755' }
		'file' 		: { $file_mode = '0644' }
	}

	file { "/tmp/$file":
		ensure => $file_type,
		owner  => 'root',
		group  => 'root',
		mode   => $file_mode,
	}
}
