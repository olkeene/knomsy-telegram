class FetchUserService
  include Interactor

  before do
    @from = context.params[:message][:from]
  end

  def call
    context.user = User.where(telegram_id: from[:id]).first_or_create!
  end

  private

  attr_reader :from
end
