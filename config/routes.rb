Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :authprofiles, controller: 'auth_profiles', param: 'guid'
  resources :pmitrackings, controller: 'gen_pmi_tracks', param: 'guid'

=begin
  resources :pmionehiers, controller: 'pmi_one_hiers' do
    get 'measures'
    get 'myteams'
    get 'subteams'
    get 'colleagues'
    get 'leadranks'
  end
=end

  scope 'pmionehiers', as: 'pmionehiers' do
    get 'measures', to: 'pmi_one_hiers#measures'
    get 'myteams', to: 'pmi_one_hiers#my_teams'
    get 'subteams', to: 'pmi_one_hiers#sub_teams'
    get 'colleagues', to: 'pmi_one_hiers#colleagues'
    get 'leadranks', to: 'pmi_one_hiers#leadranks'
  end

  #resources :pmitwohiers, controller: 'pmi_two_hiers', only: [:measures, :myteams, :subteams, :colleagues, :leadranks]

  scope 'pmitwohiers', as: 'pmitwohiers' do
    get 'measures', to: 'pmi_two_hiers#measures'
    get 'myteams', to: 'pmi_two_hiers#my_teams'
    get 'subteams', to: 'pmi_two_hiers#sub_teams'
    get 'colleagues', to: 'pmi_two_hiers#colleagues'
    get 'leadranks', to: 'pmi_two_hiers#leadranks'
  end

  scope 'pmithreehiers', as: 'pmithreehiers' do
    get 'measures', to: 'pmi_three_hiers#measures'
    get 'myteams', to: 'pmi_three_hiers#my_teams'
    get 'subteams', to: 'pmi_three_hiers#sub_teams'
    get 'colleagues', to: 'pmi_three_hiers#colleagues'
    get 'leadranks', to: 'pmi_three_hiers#leadranks'
  end

end
