class http {

  case $::osfamily {
    'redhat':{
      $pacotes = [ "httpd", "epel-release" ]
      $httpd = "httpd"
    }
    'debian':{
      $pacotes = [ "apache2", "tree" ]
      $httpd = "apache2"
    }
  }

  package {$pacotes:
    ensure => "present",
  }
  service { $httpd:
    ensure => "running",
    enable => true
  }
  file {"/var/www/html/index.html":
    source => "puppet:///modules/http/index.html",
    ensure => present
  }
}
