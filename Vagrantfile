Vagrant::Config.run do |config|

  config.vm.box     = "natty-server-32"
  config.vm.box_url = "http://php-baustelle.de/natty-puppet-32.box"

  config.vm.customize do |vm|
    vm.name        = "PHP VM"
    vm.cpu_count   = 1
    vm.memory_size = 1024
  end

end