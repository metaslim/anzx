Dir[File.dirname(__FILE__) + '/*.rb'].each do |file|
    require file if file != /(base|loader)\.rb/
end