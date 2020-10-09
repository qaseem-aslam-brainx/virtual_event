module ApplicationHelper
  def status_link_text(sponsor)
    sponsor.active? ? 'Deactivate' : 'Activate'
  end
end
