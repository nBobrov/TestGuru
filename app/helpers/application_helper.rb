module ApplicationHelper
  FLASH_CLASS = { 'notice' => 'primary', 'alert' => 'danger' }.freeze

  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to 'Test Guru', "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def flash_message(type)
    tag.div raw(flash[type]), class: "alert alert-#{FLASH_CLASS[type]}", role: 'alert' if flash[type]
  end
end
