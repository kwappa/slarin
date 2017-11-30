module Ruboty
  module Slarin
    module Handlers
      class AccountInfo < Ruboty::Handlers::Base
        on(/account_info(?<emails>.++)/m, name: 'account_info', description: 'search and show account info')

        def account_info(message)
          client = Ruboty::Slarin::SlackClient.new
          users  = client.find_users_by_emails(message[:emails])

          if users.empty?
            message.reply('有効なメールアドレスが見つかりませんでした。')
          else
            result = users.map { |(email, user)| "#{email} : #{client.format(user)}" }
            message.reply(%Q[以下のユーザーが見つかりました :\n#{result.join("\n")}])
          end
        end
      end
    end
  end
end
