$dirs = ['/tmp/dir1/dir2']
file { $dirs:
 ensure => 'directory',
 owner => "root",
 group => "root",
 mode => '644',
}
