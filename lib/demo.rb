require './cukecutter.rb'

cukecutter = Cukecutter.new
cukecutter.create_structure
cukecutter.create_feature
cukecutter.steps
cukecutter.cucumber_wrapper