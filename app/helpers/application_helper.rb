module ApplicationHelper
  def custom_error_messages!
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t('errors.messages.not_saved',
      count: resource.errors.count,
      resource: resource.class.model_name.human.downcase)

    html = <<-HTML
    <div class="alert alert-error alert-block">
      <a class="close" data-dismiss="alert">x</a>
      <h4>#{sentence}</h4>
      <ul class="message-list">
        #{messages}
      </ul>
    </div>
    HTML

    html.html_safe
  end
end
