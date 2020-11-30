if sprockets?
  copy_file "app/assets/stylesheets/application.scss"
  remove_file "app/assets/stylesheets/application.css"
else
  remove_dir "app/assets"
  empty_directory "app/javascript/css"
  empty_directory "app/javascript/controllers"
  copy_file "app/javascript/css/application.css"
  copy_file "app/javascript/controllers/index.js"
  copy_file "app/javascript/controllers/hello_controller.js"
  append_to_file "app/javascript/packs/application.js" do
    <<~JAVASCRIPT
    import "controllers"
    import '../css/application.css'
    JAVASCRIPT
  end
end

copy_file "app/controllers/home_controller.rb"
copy_file "app/views/layouts/application.html.erb", force: true
template "app/views/layouts/base.html.erb.tt"
copy_file "app/views/home/index.html.erb"
copy_file "app/views/home/_rails_github_template.html.erb"
