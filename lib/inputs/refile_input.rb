class RefileInput < Formtastic::Inputs::FileInput
  def initialize *args
    super

    @reference = SecureRandom.hex
  end

  def file_input_html_options
    options[:data] ||= {}
    options[:data][:reference] = @reference

    attacher = object.send(:"#{method}_attacher")
    options[:accept] = attacher.definition.accept
    host =  options[:host] || Refile.cdn_host

    if options[:direct]
      backend_name = Refile.backends.key(attacher.cache)

      url = ::File.join(host, Rails.application.routes.url_helpers.refile_app_path, backend_name)
      options[:data].merge!(direct: true, as: "file", url: url)
    end

    if options[:presigned] and attacher.cache.respond_to?(:presign)
      url = ::File.join(host, Rails.application.routes.url_helpers.refile_app_path, backend_name, "presign")
      options[:data].merge!(direct: true, url: url)
    end

    options.merge(input_html_options)
  end

  def hidden_input_html_options
    attacher = object.send(:"#{method}_attacher")
    { value: attacher.data.to_json, object: object, id: nil, data: { reference: @reference } }
  end

  def to_html
    input_wrapping do
      label_html <<
      builder.hidden_field(method, hidden_input_html_options) <<
      builder.file_field(method, file_input_html_options) <<
      image_preview_content
    end
  end

  private

  def image_preview_content
    image_preview? ? image_preview_html(options[:image_preview]) : ''
  end

  def image_preview?
    !!options[:image_preview]
  end

  def image_preview_html(options)
    refile_app_path = Rails.application.routes.url_helpers.refile_app_path
    url = Refile.attachment_url @object, method, *options, prefix: refile_app_path

    template.content_tag(:div, template.image_tag(url), class: 'image-preview')
  end
end
