Nicenicejpg::Application.routes.draw do
  root :to => 'nice#index'
  match '/' => 'nice#index'
  match '/5.0/:width/:height' => 'nice#fivepointoh'
  match '/5.0/:widthandheight' => 'nice#fivepointoh'
  match '/:width/:height' => 'nice#vanilla'
  match '/:widthandheight' => 'nice#vanilla'
end
