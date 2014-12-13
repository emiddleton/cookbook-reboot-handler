Gem::Specification.new do |s|
  s.name = 'chef-reboot-handler'
  s.version = '1.0.2'
  s.platform = Gem::Platform::RUBY
  s.summary = "Reboot-handler Chef "
  s.description = s.summary
  s.author = "Edward Middleton"
  s.email = "edward.middleton@vortorus.net"
  s.homepage = "http://github.com/emiddleton/cookbook-reboot-handler"
  s.require_path = 'lib'
  s.files = %w(LICENSE README.md) + Dir.glob("lib/**/*")
end
