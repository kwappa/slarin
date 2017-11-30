module Ruboty
  module Slarin
    class AccountInfo < Ruboty::Handlers::Base
      on(/account_info(?<emails>.+)/, name: 'account_info', description: 'search and show account info')

      def account_info(emails)
        emails = Slarin.find_emails(message[:emails])
        if emails.empty?
          message.reply('有効なメールアドレスが見つかりませんでした。')
        else
          message.reply("以下のメールアドレスが見つかりました :\n#{emails.join(\"\n\")}")
        end
      end
    end
  end
end
