class User

  attr_accessor :status

  def initialize(status)
    self.status = status
  end

  STATUSES = ["active", "inactive", "pending"]

  def method_missing(name, *args)
    if match = STATUSES.find { |s| s == name[0..-2] }
      return status == match
    else
      super
    end
  end

end


@user = User.new("active")
puts @user.active?
puts @user.inactive?
