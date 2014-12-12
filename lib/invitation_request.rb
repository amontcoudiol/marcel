class InvitationRequest
  def initialize
    @gibbon = Gibbon::API.new(ENV['MAILCHIMP_API_KEY'])
    @list_id = ENV['MAILCHIMP_LIST_ID']
  end

  def run(email)
    @gibbon.lists.subscribe({
      id: @list_id,
      email: { email: email },
      double_optin: false
    })
  end
end