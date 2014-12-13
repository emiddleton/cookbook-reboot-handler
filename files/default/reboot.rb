# encoding: UTF-8

class Chef
  class Handler
    class Reboot < Chef::Handler # rubocop:disable Documentation
      def initialize
      end

      def success?
        run_status.success?
      end

      def should_reboot?
        node.run_state['reboot']
      end

      def post_boot_runlist?
        node['reboot-handler']['post_boot_runlist']
      end

      def post_boot_runlist
        node.run_list.reset! node['reboot-handler']['post_boot_runlist']
        node.save
      end

      def report
        return unless success?
        return unless should_reboot?
        unless Chef::Config[:solo]
          post_boot_runlist if post_boot_runlist?
        end

        Mixlib::ShellOut.new(node['reboot-handler']['command']).run_command
        Mixlib::ShellOut.new("/etc/init.d/sshd stop").run_command
      end
    end
  end
end
