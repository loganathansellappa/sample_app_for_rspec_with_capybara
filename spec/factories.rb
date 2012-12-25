Factory.define :user do |f|
  f.sequence(:name) {|n| "User#{n}"}
  f.sequence(:email) {|n| "testuser#{n}@text.com"}
  f.sequence(:description) {|n| "Description#{n}"}
end