class colin10086_apache (
 $vhost,
 $docroot.
 $source_repo,
){
 
 class{‘apache’:}

 apache::vhost { $vhost:
  port => ’80’,
  docroot => $docroot,
 }

 package{‘git’:
  ensure => present,
 }

 vcsrepo { $docroot:
  owner => ‘apache’,
  group => ‘apache’,
  provider => git,
  source => $source_repo,
 }

 Class[‘apache’] -> Apache::Vhost[$vhost] -> Vcsrepo[$docroot]
 Package[‘git’] -> Vcsrepo[$docroot]

}
