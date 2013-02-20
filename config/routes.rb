Nicenicejpg::Application.routes.draw do
  root :to => 'nice#index'
  match "/" => 'nice#index'
  match '/5.0/:width/:height' => 'nice#fivepointoh', :constraints => { :width => /[0-9]+/, :height => /[0-9]+/ }
  match '/5.0/:square' => 'nice#fivepointohsquare', :constraints => { :square => /[0-9]+/ }
  match '/:width/:height' => 'nice#vanilla', :constraints => { :width => /[0-9]+/, :height => /[0-9]+/ }
  match '/:square' => 'nice#vanillasquare', :constraints => { :square => /[0-9]+/ }
  match '/*anythingelse' => 'nice#index'
end
