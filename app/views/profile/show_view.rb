# frozen_string_literal: true

class Profile::ShowView < ApplicationView
  def initialize(user)
    @user = user
  end

  def template
    div class: "glass card mt-4 p-4 flex flex-col gap-8" do
      div class: "flex justify-between" do
        div class: "flex flex-col" do
          h1(class: "text-3xl font-bold") { @user.name }
          p class: "text-sm small-caps" do
            "joined #{time_ago_in_words(@user.created_at)} ago"
          end
        end
        image_tag @user.profile_picture, class: "rounded-full w-16 h-16"
      end
      div class: "flex justify-between  text-xs" do
        button_to("", method: :delete, "data-turbo-confirm": "Are you really really sure you want to delete your account?",
          class: "button py-0.5 px-2 uppercase font-light " \
            "!text-red-500 hover:!text-white hover:!bg-red-700 hover:!border-t-red-500 hover:!border-red-600") do
          "delete account"
        end
        button_to(logout_path, method: :delete, class: "button py-0.5 px-2 uppercase font-bold",
          "data-turbo-confirm": "Are you sure you want to log out?") do
          "log out"
        end
      end
    end
  end
end
