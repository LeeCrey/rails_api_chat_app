# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users,
             controller: {
               session: "users/sessions",
               registrations: "users/registrations",
             }

  # root "articles#index"
end
