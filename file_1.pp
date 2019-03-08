file { '/tmp/first':
  ensure => 'file',
  owner   => 'root',
  content => "This is the content\n",
  group  => 'root',
  mode   => '0644',
}
