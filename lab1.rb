class ComplexNumber
    @@add_count = 0
    @@multiply_count = 0
    @@bulk_add_count = 0
    @@bulk_multiply_count = 0
    attr_accessor:real, :imag
    def initialize(real, imag)
        @real = real
        @imag = imag
    end

    def value
        real+imag
    end

    def +(obj)
        @@add_count +=1
        complex = ComplexNumber.new(real+obj.real, imag+obj.imag)
    end

    def self.bulk_add(arr)
        @@bulk_add_count +=1
        complex = self.new(0,0)
        arr.each do |obj|
            complex = complex + obj
        end
        return complex
    end

    def *(obj)
        @@multiply_count +=1
        complex = ComplexNumber.new((real*obj.real)-(imag*obj.imag).to_i, (real*obj.imag)+(obj.real*imag))
    end

    def self.bulk_multiply(arr)
        @@bulk_multiply_count +=1
        complex = self.new(1,1i)
        arr.each do |obj|
            complex = complex * obj
        end
        return complex
    end
    def self.get_stats
        return "Addition Count = #{@@add_count}, Multiplication count = #{@@multiply_count}, bulk add = #{@@bulk_add_count}, bulk multi = #{@@bulk_multiply_count}"
    end

end
complex1 = ComplexNumber.new(5, 2i)
complex2 = ComplexNumber.new(1, 5i)
complex3 = complex1 + complex2
puts complex3.value
complex3 = complex1 * complex2
puts complex3.value

puts ComplexNumber.bulk_add([complex1, complex2, complex3]).value
puts ComplexNumber.bulk_multiply([complex1, complex2, complex3]).value
puts ComplexNumber.get_stats