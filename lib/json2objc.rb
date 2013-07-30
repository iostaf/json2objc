require "json2objc/version"
require "thor"
require "json"
require "active_support/all"

module Json2objc
  class CmdCLI < Thor
    desc "genprop input_file.json", "generate Objective-C class properties"
    method_option :input_file, :aliases => "-i", :desc => "Set input file."
    def genprop
      if options[:input_file].present?
        data = JSON.parse File.read(options[:input_file])
      else
        data = JSON.parse STDIN.read 
      end
      result = ''
      data.keys.each { |k| result += "@property (nonatomic, strong) NSString *#{k.camelize(:lower)};\n" }
      puts result
    end

    desc "genmap  input_file.json", "generate RestKit 0.20.2 class mapping"
    method_option :input_file, :aliases => "-i", :desc => "Set input file."
    def genmap
      if options[:input_file].present?
        data = JSON.parse File.read(options[:input_file])
      else
        data = JSON.parse STDIN.read 
      end
      result = ''
      data.keys.each { |k| result += "@\"#{k}\": @\"#{k.camelize(:lower)}\",\n" }
      puts result
    end
  end
end

Json2objc::CmdCLI.start(ARGV)
