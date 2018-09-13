# @summary Install the proxysql package and setup directories.
#
# @private
#
class proxysql::install {

  user { $proxysql::owner:
    ensure => present,
    gid    => $proxysql::group,
    system => true,
  }

  group { $proxysql::group:
    ensure => present,
    system => true,
  }

  package { 'proxysql':
    ensure => $proxysql::package_ensure,
  }

  file {
    default:
      ensure => directory,
      owner  => $proxysql::owner,
      group  => $proxysql::group;

    $proxysql::datadir:
      mode   => $proxysql::datadir_mode;

    $proxysql::logdir:
      mode   => $proxysql::logdir_mode;
  }

}
