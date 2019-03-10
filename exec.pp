exec { 'creates file':
        command => '/bin/touch /tmp/file2',
        creates => '/tmp/file2',
}
