module Ruboty
  module Slarin
    class SlackClient
      def format(user)
        return '該当なし' if user.nil?

        name = "<@#{user['id']}>:#{user['profile']['real_name']}(#{user['name']})さん"
        deleted = user['deleted'] ? ':x:' : ':o:'
        type = if user['is_ultra_restricted']
                 'Single Channel Guest'
               elsif user['is_restricted']
                 'Multi Channel Guest'
               elsif user['is_admin']
                 'Admin'
               else
                 'Member'
               end
        expire_ts = user['profile']['guest_expiration_ts']
        expire = if user['is_restricted']
                   if expire_ts.nil?
                     '(*[注意:有効期限が設定されていません]*)'
                   else
                     "(有効期限:#{Time.at(expire_ts)})"
                   end
                 else
                   ''
                 end
        "#{deleted} #{name}:#{type}#{expire}"
      end

      def find_users_by_emails(emails)
        email_list = pick_emails(emails)
        users = users_list.find_all { |u| email_list.include? u['profile']['email'] }
        email_list.map { |e| [e, users.find { |u| u['profile']['email'] == e }] }.to_h
      end

      def pick_emails(str)
        str.scan(/([a-z0-9]+[\w\-\.]+@([\w\-]+\.)+[a-z]+)[\W\Z]?/i).map(&:first).uniq
      end

      def users_list
        @users_list ||= client.users_list['members']
      end

      def client
        @client ||= Slack::Client.new(token: ENV['SLACK_TOKEN'])
      end
    end
  end
end
