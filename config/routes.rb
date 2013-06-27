Sms::Application.routes.draw do
  root to: "home#index"
  resources :school_classes do
    get 'page/:page', :action => :index, :on => :collection
  end
  resources :students do
    get 'page/:page', :action => :index, :on => :collection
  end
end

ActionDispatch::Routing::Translator.translate_from_file(
    "app/locales/pt-BR/gems/routes.yml", {
    keep_untranslated_routes: true,
    :no_prefixes => true })
