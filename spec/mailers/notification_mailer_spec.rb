require "rails_helper"

RSpec.describe NotificationMailer, type: :mailer do

  describe "notification" do

    let(:user)  { create(:user,  name:'Joe Smith', email:'jsmith@example.com') }
    let(:paper) { create(:paper, title:'A Paper Title', sha:'abcd') }

    let(:mail) { NotificationMailer.notification(user, paper, 'Here is the content', 'The Subject' ) }

    it "renders the headers" do
      expect(mail.subject).to end_with('A Paper Title - The Subject')
    end

    it "renders the body" do
      content = mail.body.parts.map(&:to_s).map(&:strip).join("\n\n").gsub("\r","")
      expect(content).to eq( fixture_text('notification_mailer/notification') )
    end

  end

end
