class rspamd::install (

  $rspamd_packages = hiera('rspam_packages'),

  ) inherits rspamd {
        
  $rspamd_packages.each |String $package|{
    package { $package: 
      ensure  =>  installed,
    }
  }

}
