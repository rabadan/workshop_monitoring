class GenerateEverythingJob < ApplicationJob
  queue_as :default

  def perform
    seed_users
    seed_couriers
    seed_orders
  end

  private

  def seed_users
    rand(5..7).times { User.create(kind: :client) }
  end

  def seed_couriers
    rand(0..1).times { User.create(kind: :courier) }
  end

  def seed_orders
    rand(10..20).times { Order.create(amount: rand(100..5000)) }
  end
end
