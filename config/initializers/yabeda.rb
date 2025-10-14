Yabeda.configure do
  group :top_shop do
    counter :index_page_opened, comment: "Index page visits"
    counter :users_registered, tags: %i[kind], comment: "Users registered"
    counter :orders_placed, comment: "Orders placed"
    counter :money_earned, comment: "Total GMV"

    gauge :user_online, comment: "Users online"
  end
end
