module FormObjects
  class InitialRegistration
    include ActiveModel::Model
    attr_accessor :email, :password, :password_confirmation, :brand_name

    def initialize(raw_parameters = {})
      @raw_parameters = raw_parameters
    end

    def save
      @user = create_user
      @company = create_company
      @user.persisted? && @company.persisted?
    end

    def user
      @user
    end

    def persisted?
      false
    end

    def model_name
      ActiveModel::Name.new(self, nil, 'Registration')
    end

    def errors
      @user.errors || @company.errors
    end

    private

    def create_user
      User.create(user_params)
    end

    def create_company
      return unless @user.persisted?
      @user.companies.create(company_params)
    end

    def user_params
      @raw_parameters.require(:registration).permit(:email, :password, :password_confirmation)
    end

    def company_params
      @raw_parameters.require(:registration).permit(:brand_name)
    end
  end
end
