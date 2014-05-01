require_relative '../../app/services/list_invited_users'

describe ListInvitedUsers, '.list' do 
  let(:organization) do double(:organization, 
                              present?:true,
                              id:-1,
                              name:'org',
                              email:'mail')  
  end
  let(:users) do 
    [double(:user, email:'why@hello.there', invitation_sent_at:'date', organization:organization)] 
  end

  it 'returns all invited users' do 
    invitations = ListInvitedUsers.list(users)
    expect(invitations).to include({ id: -1, name: 'org', email: 'mail', date: 'date' })
  end

  it "skips collections that don't have both a user and and organization" do
    organization.stub :present? => false
    invitations = ListInvitedUsers.list(users)
    expect(invitations).not_to include nil
  end
end
