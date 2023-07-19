class PasswordsController < ApplicationController
  def new; end

  def create
    file = params[:file]
    count = count_valid_passwords(file.path)

    redirect_to uploaded_path(count)
  end

  def uploaded
    @count = params[:count]
  end

  private

  def count_valid_passwords(file_path)
    valid_passwords = 0

    File.foreach(file_path) do |line|
      requirement, password = line.split(':')
      char, range = requirement.split(' ')
      min, max = range.split('-').map(&:to_i)

      char_count = password.count(char)
      valid_passwords += 1 if char_count >= min && char_count <= max
    end

    valid_passwords
  end
end
