module ApplicationHelper
  def custom_error_messages!(model)
    return '' if model.errors.empty?

    messages = model.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t('errors.messages.not_saved',
      count: model.errors.count,
      resource: model.model_name.human.downcase)

    html = <<-HTML
    <div class="alert alert-error alert-block">
      <a class="close" data-dismiss="alert">x</a>
      <h5>#{sentence}</h5>
      <ul class="message-list">
        #{messages}
      </ul>
    </div>
    HTML

    html.html_safe
  end
end
