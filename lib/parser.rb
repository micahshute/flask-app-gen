class Parser


    def self.insert_data(text, replacement_data)
        replacement_data.each do |var, replacement|
            text = text.gsub(var, replacement)
        end
        text
    end

end