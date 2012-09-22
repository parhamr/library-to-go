# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'spork', :rspec_env => { 'RAILS_ENV' => 'test'}, :wait => 30, :cucumber => false, :bundler => false do
  callback(:start_begin) { TerminalNotifier::Guard.pending('Starting spork…') }
  watch('config/application.rb')
  watch('config/environment.rb')
  watch(%r{^config/.+\.rb$})
  watch(%r{^db/seeds.rb$})
  watch('config/locales/*.yml')
  watch(%r{^config/environments/.+\.rb$})
  watch(%r{^config/initializers/.+\.rb$})
  watch('spec/spec_helper.rb') { :rspec }
  #watch(%r{^spec/factories/(.+)\.rb$})
end

guard 'rspec', :version => 2, :cli => '--drb', :focus => true, :all_on_start => false, :all_after_pass => false, :keep_failed => false do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }

  # Rails example
  watch(%r{^app/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^app/(.*)(\.erb|\.haml)$})                 { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }
  watch(%r{^app/controllers/(.+)_(controller)\.rb$})  { |m| ["spec/routing/#{m[1]}_routing_spec.rb", "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb", "spec/acceptance/#{m[1]}_spec.rb"] }
  watch(%r{^spec/support/(.+)\.rb$})                  { "spec" }
  watch('config/routes.rb')                           { "spec/routing" }
  watch('app/controllers/application_controller.rb')  { "spec/controllers" }
  # Capybara request specs
  watch(%r{^app/views/(.+)/.*\.(erb|haml)$})          { |m| "spec/requests/#{m[1]}_spec.rb" }

  # Mailer specs
  watch(%r{^app/views/(.*)_mailer/(.*)})              { |m| "spec/mailers/#{m[1]}_mailer_spec.rb" }
  watch(%r{^app\/views\/devise\/mailer\/([\w]+)\..*$})      { |m| "spec/mailers/devise/#{m[1]}_spec.rb" }
  watch('spec/mailers/shared_mailer_examples.rb')  { "spec/mailers" }
end

guard 'livereload' do
  watch(%r{app/views/.+\.(erb|haml|slim)})
  watch(%r{app/helpers/.+\.rb})
  watch(%r{public/.+\.(css|js|html)})
  watch(%r{config/locales/.+\.yml})
  # Rails Assets Pipeline
  watch(%r{(app|vendor)/assets/\w+/(.+\.(css|js|html)).*})  { |m| "/assets/#{m[2]}" }
end
