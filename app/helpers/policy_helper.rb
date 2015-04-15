module PolicyHelper

  def policy(obj)
    if obj.respond_to?(:policy_class)
      policy_class = obj.policy_class
    else
      klass_name = obj.class.to_s
      policy_class = "#{klass_name}Policy"
    end

    policy_class.constantize.new(current_user, obj)
  end
end
