class Member
    attr_reader :full_name

    def initialize(full_name)
        @full_name = full_name
    end
end

class Student < Member
    attr_reader :about

    def initialize(full_name, about)
        super full_name
        @about = about
    end
end

class Coach < Member
    attr_reader :bio, :skills
    attr_writer :skills

    def initialize(full_name, bio)
        super full_name
        @bio = bio
        @skills = []
    end

    def add_skill(skill)
        skills << skill
    end
end

class Workshop 
    def initialize(date, venue_name)
        @date = date
        @venue_name = venue_name
        @coaches = []
        @students = []
    end

    def add_participant(member)
        if member.is_a? Coach
            @coaches << member
        else 
            @students << member
        end
    end

    def print_details
        print_workshop_details
        print_students_details
        print_coaches_details
    end

    private

    def print_workshop_details
        puts
        puts "Workshop - #{@date}, Venue:  #{@venue_name}"
        puts
    end

    def print_students_details
        puts 'Students'
        @students.each_with_index { |student, i| puts "#{i + 1}. #{student.full_name} - #{student.about}"}
        puts
    end

    def print_coaches_details
        puts 'Coaches'
        @coaches.each_with_index { |coach, i| puts "#{i + 1}. #{coach.full_name} - #{coach.skills.join(', ')}"; puts "   #{coach.bio}"}
        puts
    end 
end 

workshop = Workshop.new("12/03/2014", "Shutl")

jane = Student.new("Jane Doe", "I am trying to learn programming and need some help")
lena = Student.new("Lena Smith", "I am really excited about learning to program!")
vicky = Coach.new("Vicky Ruby", "I want to help people learn coding.")
vicky.add_skill("HTML")
vicky.add_skill("JavaScript")
nicole = Coach.new("Nicole McMillan", "I have been programming for 5 years in Ruby and want to spread the love")
nicole.add_skill("Ruby")

workshop.add_participant(jane)
workshop.add_participant(lena)
workshop.add_participant(vicky)
workshop.add_participant(nicole)

workshop.print_details