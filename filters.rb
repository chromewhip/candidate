# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
  @candidates.select {|candidate| candidate.id == id}
end

def required_years_experienced?(candidate)
  candidate[:years_of_experience] >= 2
end
def required_github_points?(candidate)
  candidate[:github_points] >= 100 
end
def required_languages?(candidate)
  candidate[:languages].include?('Ruby'|| 'Python')
end
def required_date_applied?(candidate)
  candidate[:date_applied] >= 15.days.ago.to_date 
end
def required_age?(candidate)
  candidate[:age] >= 18
end


def qualified?(candidate)
  required_years_experienced?(candidate) &&
  required_github_points?(candidate) &&
  required_languages?(candidate) &&
  required_date_applied?(candidate) &&
  required_age?(candidate)
end

# def qualified_candidates
#   arr = Array.new(0)
#   @candidates.each do |i|
#     if check_qualification?(i)
#       arr << i 
#     end
#   end
#   arr
# end

def qualified_candidates
  @candidates.select { |candidate| candidate if qualified?(candidate) }
end

def ordered_by_qualifications
  @candidates.sort_by {|candidate| [candidate[:years_of_experience], candidate[:github_points]] }.reverse
end

# More methods will go below
