class rspamd::config (

  $nodename = hiera('nodename'),
  $configuration_directory = hiera('configuration_directory'),
  $service_name = hiera('rspamd::service::service_name'),
    
  ) inherits rspamd {

    file { $configuration_directory :
      ensure => present,
      sourceselect => all,
      source => ["puppet:///modules/rspamd/${nodename}/etc/rspamd","/etc/rspamd "],
      recurse => true,
      notify   => Service[$service_name],  
    }

}
