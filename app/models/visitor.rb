class Visitor
  def initialize(session)
    @session = session
  end

  def full_name
    'visitor'
  end

  def email
    'visitor'
  end
  def authenticated?
    false
  end
  
  def role?(role)
    false
  end
end