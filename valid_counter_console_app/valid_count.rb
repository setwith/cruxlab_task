def count_valid_passwords
  valid_passwords = 0

  File.foreach('text.txt') do |line|
    requirement, password = line.split(':')
    char, range = requirement.split(' ')
    min, max = range.split('-').map(&:to_i)

    char_count = password.count(char)
    valid_passwords += 1 if char_count >= min && char_count <= max
  end

  valid_passwords
end

puts "Number of valid passwords: #{count_valid_passwords}"
