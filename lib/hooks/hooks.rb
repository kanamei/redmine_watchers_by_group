module Redmine_watchers_by_group
  class Hooks < Redmine::Hook::ViewListener
    def view_issues_form_details_bottom(context={ })
      context[:watchers] = (context[:issue].project.users.sort + context[:issue].watcher_users).uniq

      context[:controller].send(:render_to_string, {
          :partial => 'watchers/multiselect_group',
          :locals => context
        })
    end
  end
end
