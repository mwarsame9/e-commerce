require 'rails_helper'

describe Order do
  it { should validate_presence_of :status }
  it { should validate_presence_of :total_price }
  it { should have_many :order_items }
end
