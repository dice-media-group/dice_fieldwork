class Guest
  
  def name
    if !!current_user
      name = "#{current_user.email}"
    else
      name = Visitor.new
    end
  end

  def email
    if !!current_user
      name = "#{current_user.email}"
    else
      name = Visitor.new("session")
    end
  end
end