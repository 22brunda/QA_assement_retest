# require 'page-object'
# require "selenium-webdriver"
# require 'page-object/page_factory'
# require 'data_magic'
# require 'watir-webdriver'

# World(PageObject::PageFactory)

# TEST_DATA_DIR = "./features/support/test_data"
# DataMagic.yml_directory = './features/support/test_data/' #Tells data magic to look for data in


# if ENV['HEADLESS'] == 'true'
#   require 'headless'

#   headless = Headless.new
#   headless.start

#   at_exit do
#     headless.destroy
#   end
# end

# #--------------------------------> Start Order of Execution Code <-----------------------------------#
# # Overrides the method +method_name+ in +obj+ with the passed block
# def override_method(obj, method_name, &block)
#   # Get the singleton class/eigenclass for 'obj'
#   klass = class <<obj; self; end

#   # Undefine the old method (using 'send' since 'undef_method' is protected)
#   klass.send(:undef_method, method_name)

#   # Create the new method
#   klass.send(:define_method, method_name, block)
# end

# def get_weight(x)
#   weights = YAML::load(File.open('features/support/test_data/order.yml')) #this is expensive but is done only on rake start
#   weight = weights[x]
#   if weight == nil or weight == ''
#     weight = '800' #this is because we want to run the newly added tests first.
#   end
#   return weight.to_i()
# end

# def sort_according_to_weights(features)
#   return features.sort { |x,y|  get_weight(y)  <=> get_weight(x)}
# end

# AfterConfiguration do |configuration|
#   puts "\n\n\n *****  config: #{configuration} "
#   featurefiles =  configuration.feature_files

#   override_method(configuration, :feature_files) {
#     puts "overriding the old featurefiles according to their weight"
#     sorted_files = sort_according_to_weights(featurefiles);
#     sorted_files
#   }

#   puts "\n\n **features will be executed in following order: \n"
#   for i in configuration.feature_files
#     puts "#{i} : weight: #{get_weight(i)}"
#   end
# end

# #--------------------------------> End Order of Execution Code <----------------------------------