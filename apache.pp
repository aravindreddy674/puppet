$doc_root = "/var/www/html"

exec { 'yum update':
 command => '/bin/yum update'
}

package { 'httpd':
 ensure  => "installed",
 require => Exec['yum update']
}

file { $doc_root:
 ensure => "directory",
 owner => "root",
 group => "root",
 mode => '644',
}

file { "$doc_root/index.html":
   ensure => "present",
   source => "/root/puppet_exercise/index.html",
   require => File[$doc_root]
}

service { 'httpd':
   ensure => running,
   enable => true
}
