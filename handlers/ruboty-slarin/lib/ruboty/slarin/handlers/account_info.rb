module Ruboty
  module Slarin
    module Handlers
      class AccountInfo < Ruboty::Handlers::Base
        on(/account_info(?<emails>.++)/m, name: 'account_info', description: 'search and show account info')
        on(/my_account/, name: 'my_account',description: 'show your account info')

        def account_info(message)
          return unless arrowed_channel?(message)

          client = Ruboty::Slarin::SlackClient.new
          users  = client.find_users_by_emails(message[:emails])

          if users.empty?
            message.reply('有効なメールアドレスが見つかりませんでした。')
          else
            result = users.map { |(email, user)| "#{email} : #{client.format(user)}" }
            message.reply(%Q[以下のユーザーが見つかりました :\n#{result.join("\n")}])
          end
        end

        def my_account(message)
          client = Ruboty::Slarin::SlackClient.new
          client.send_account_info(message)
        end

        def arrowed_channel?(message)
          arrowed_channel = ENV['SLARIN_GUEST_ROOMS'].chomp.split(',')
          arrowed_channel.include?(message.original[:from])
        end
      end
    end
  end
end
