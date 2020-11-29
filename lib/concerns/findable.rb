module Concerns::Findable
    def find_by_name(name)
      all.find{|song| song.name == name}
    end

    def find_or_create_by_name(name)
        return find_by_name(name) if find_by_name(name)
        create(name)
    end
end

