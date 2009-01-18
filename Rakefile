# Look in the tasks/setup.rb file for the various options that can be
# configured in this Rakefile. The .rake files in the tasks directory
# are where the options are used.

begin
  require 'bones'
  Bones.setup
rescue LoadError
  begin
    load 'tasks/setup.rb'
  rescue LoadError
    raise RuntimeError, '### please install the "bones" gem ###'
  end
end

ensure_in_path 'lib'
require 'shell-tools'

task :default => 'spec:run'

PROJ.name = 'shell-tools'
PROJ.authors = 'Alex Kukushkin'
PROJ.email = 'alex@neq4.com'
PROJ.url = 'http://neq4.com'
PROJ.version = ShellTools::VERSION
PROJ.rubyforge.name = 'shell-tools'

PROJ.spec.opts << '--color'

# EOF
