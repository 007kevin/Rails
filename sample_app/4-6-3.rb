person1 = {first: "Eric", last: "Kim"}
person2 = {first: "Jae", last: "Lee"}
person3 = {first: "Ian", last: "Kim"}
params = {father: person1, mother: person2, child: person3}
puts "params[:father][:first] #=> #{params[:father][:first]}"
puts "params[:mother][:first] #=> #{params[:mother][:first]}"
puts "params[:child][:first] #=> #{params[:child][:first]}"
