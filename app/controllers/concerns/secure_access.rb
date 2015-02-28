module SecureAccess
  extend ActiveSupport::Concern

  def restrict_access
    unless restrict_access_by_params || restrict_access_by_header
      render json: { error: 'Invalid API Token' }, status: 401
      return
    end
  end

  def restrict_access_by_header
    return true if ActsAsTenant.current_tenant
  end

  def restrict_access_by_params
    return true if ActsAsTenant.current_tenant
  end
end