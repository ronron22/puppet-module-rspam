class postfix::service (

	$service_name   = hiera('service_name'),
	$service_enable = hiera('service_enable'),
	$service_ensure = hiera('service_ensure'),
	$service_manage = hiera('service_manage'),

	) inherits postfix {

	if ! ($service_ensure in [ 'running', 'stopped' ]) {
		fail('service_ensure parameter must be running or stopped')
	}
  if $service_manage == true {
    service { $service_name:
		  ensure  => $service_ensure,
      enable  => $service_enable,
		  provider => systemd,
      #hasstatus  => true,
      #hasrestart => true,
    }
  }

}
