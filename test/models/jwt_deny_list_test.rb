# == Schema Information
#
# Table name: jwt_deny_lists
#
#  id         :bigint           not null, primary key
#  jti        :string           not null
#  exp        :datetime         not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class JwtDenyListTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
