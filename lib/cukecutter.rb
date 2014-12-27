require 'fileutils'

# @example include 'cukecutter' and run from command line
#  			cukecutter = Cukecutter.new
# 			cukecutter.create_structure
# 			cukecutter.create_feature
# 			cukecutter.steps
#  			cukecutter.cucumber_wrapper

class Cukecutter

  def feature(feature, scenario)
    @feature = feature
    @scenario = scenario
    @tags = tags
    @description = description
  end

 # Creates the following folders
  #  features/
  #  features/step_definitions
  #  features/support
  # And the file
  #  features/support/env.rb
  def create_structure
    if File.exists?("features") && File.directory?("features")
      return
    else
   FileUtils.mkpath "features/step_definitions"
   FileUtils.mkdir "features/support"
   FileUtils.mkdir "features/screenshots"
    FileUtils.touch"features/support/env.rb"
  end
 

 end

  # create features from list in features.md
  def create_bulk
    file = File.new("features.md", "r")
    while (line = file.gets)
    line = line.chomp.strip.gsub(' ', '_')
    FileUtils.touch "features/#{line}.feature"
    FileUtils.touch "features/step_definitions/#{line}.steps.rb"
    end
    file.close
  end

  def create_feature
    print "Feature name: "
    @feature = gets.chomp
    print "Feature description: "
    @description = gets.chomp
    print "Tags seperated by spaces (ex: @api):"
    @tags = gets.chomp
    print "Scenario: "
    @scenario = gets.chomp
    puts "please enter steps:"
    puts "Cucumber steps starts with 'Given, When, Then, And, But' keywords."
  end

# Creates .feature and .steps.rb files
    def write_feature
    File.open("features/""#{@feature.gsub(" ", "_")}.feature", "w") do |f|
      f.write("#{@tags}\n")
      f.write("Feature: #{@feature}\n")
      f.write("Description: #{@description}\n\n")
      f.write("\tScenario: #{@scenario}\n")
    end
   @steps.each do |steps|
   File.open("features/""#{@feature.gsub(" ", "_")}.feature", "a") do |f|
     f.write("\t\t#{steps}")
     end
   end
   FileUtils.touch "features/step_definitions/#{@feature.gsub(" ", "_")}.steps.rb"
  end
 

 # Console based walkthrough for feature and step creation
  def steps
    steps_keywords = %w(Given When Then And But)
    nsteps = 0
    @steps = []
    while true
      print "Add step [Y/n]: "
      choice = gets
      if choice.downcase.strip != "n"
        puts "Step #{nsteps +1}:"
        step = gets.capitalize
        init_step_word = step.split(' ').first
      if steps_keywords.include?(init_step_word)
        @steps << step
        nsteps = nsteps ++ 1
      else
        puts "Error: #{init_step_word} unsupported initial value"
        puts "Use only #{steps_keywords} keywords"
      end
      elsif choice.downcase.strip == "n"
        break
      else
        "please enter a valid choice."
      end
    end
    write_feature
  end

  def more_steps
    # placeholder for more steps and scenarios
    # adds additional scenario and steps to file created in write feature
  end


   # runs cucumber and generates contents of .step_definitions from cucumber output
  def cucumber_wrapper
   cucumber = `cucumber features/#{@feature.gsub(" ", "_")}.feature`
   File.open("features/step_definitions/#{@feature.gsub(" ", "_")}.steps.rb", 'w') do |parsed_steps|
     parsed_steps.write cucumber.split("You can implement step definitions for undefined steps with these snippets:\n\n").last
   end
  end
end