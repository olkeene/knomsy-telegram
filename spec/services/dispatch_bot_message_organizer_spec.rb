require 'spec_helper'

RSpec.describe DispatchBotMessageOrganizer do
  let(:params) do
    {
      update_id: 174_388_426,
      message: {
        message_id: 15,
        from: {
          id: 6_722_898, first_name: 'Oleg', last_name: 'Keene'
        },
        chat: {
          id: 6_722_898, first_name: 'Oleg', last_name: 'Keene', type: 'private'
        },
        date: 1_470_080_681,
        text: '/start',
        entities: [
          { type: 'bot_command', offset: 0, length: 6 }
        ]
      }
    }
  end

  before do
    stub_request(:post, /https:\/\/api.telegram.org\/.*\/sendMessage/)
      .to_return(body: '{}')
    # .with(:body => {"chat_id"=>"6722898", "text"=>"Type /start to create a new company"}
  end

  context 'process user' do
    subject do
      described_class.call(params: params)
    end

    it 'creates new user' do
      expect { subject }
        .to change(User, :count).by(1)
    end

    it 'not dup exists user' do
      expect do
        subject
        subject
      end.to change(User, :count).by(1)
    end
  end

  context '' do
    
  end
end
