require "json2objc/version"
require "thor"
require "json"
require "active_support/all"

module Json2objc
  class CmdCLI < Thor
    desc "genprop input_file.json", "generate Objective-C class properties"
    def genprop(input_json_file)
      result = ''
      data = JSON.parse File.read(input_json_file)
      #data.keys.each { |k| result += "@\"#{k}\": @\"#{k.camelize(:lower)}\",\n" }
      data.keys.each { |k| result += "@property (nonatomic, strong) NSString *#{k.camelize(:lower)};\n" }
      puts result
    end

    desc "genmap  input_file.json", "generate RestKit 0.20.2 class mapping"
    def genmap(input_json_file)
      result = ''
      data = JSON.parse File.read(input_json_file)
      data.keys.each { |k| result += "@\"#{k}\": @\"#{k.camelize(:lower)}\",\n" }
      puts result
    end
  end
end

Json2objc::CmdCLI.start(ARGV)
