class Cliente
  def first_name
    'alex'
  end
  def last_name
    'cesar'
  end
  def full_name
    "#{first_name.upcase} #{last_name.capitalize}"
  end
end
