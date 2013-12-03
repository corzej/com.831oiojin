Com831oiojin::Application.routes.draw do
  comfy_route :cms_admin, :path => '/admin'

  scope ":locale", locale: /#{I18n.available_locales.join("|")}/ do
    root "static_pages#home"
    match '/home', to: 'static_pages#home', via: 'get'
    match '/work', to: 'static_pages#work', via: 'get'
    match '/blog', to: 'static_pages#blog', via: 'get'
    match '/contact', to: 'static_pages#contact', via: 'get'
  end
  match '*path', to: redirect("/kr/%{path}"), via: 'get'
  match '', to: redirect("/kr"), via: 'get'

  comfy_route :cms, :path => '/', :sitemap => false
end
