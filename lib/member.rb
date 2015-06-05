class Member

    attr_reader(:first, :last, :phone, :id)
    @@members = []

    define_method(:initialize) do |first, last, phone|
      @first = first
      @last = last
      @phone = phone
      @id = @@members.length + 1
    end


  define_singleton_method(:all) do
    @@members
  end

  define_method(:save) do
    @@members.push(self)
  end

  define_singleton_method(:clear) do
    @@members = []
  end

  define_singleton_method(:find) do |identification|
    found_member = nil
    @@members.each do |member|
      if member.id==identification
        found_member = member
      end
    end
    found_member
  end

end
