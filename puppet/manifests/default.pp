# Make sure apt-get -y update runs before anything else.
stage { 'preinstall':
  before => Stage['main']
}

class apt_get_update {
  exec { '/usr/bin/apt-get -y update':
    user => 'root'
  }
}
class { 'apt_get_update':
  stage => preinstall
}

package { [ 'build-essential',
  'zlib1g-dev',
  'libssl-dev',
  'libreadline-dev',
  'git-core',
  'libxml2',
  'libxml2-dev',
  'libxslt1-dev',
  'libpq-dev',
  'sqlite3',
  'curl',
  'libsqlite3-dev']:
  ensure => installed,
}

# RMagick system dependencies
package { ['libmagickwand4', 'libmagickwand-dev']:
  ensure => installed,
}

class install-rvm {
  include rvm

  rvm::system_user { vagrant: ; }

  rvm_system_ruby {
    'ruby-2.1.0':
      ensure => 'present',
      default_use => true;
  }

  rvm_gem {
    'ruby-2.1.0/bundler': ensure => latest;
    'ruby-2.1.0/rails': ensure => latest;
    'ruby-2.1.0/rake': ensure => latest;
  }
}

class { 'install-rvm': }
