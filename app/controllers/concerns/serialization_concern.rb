module Concerns::SerializationConcern

  def render_json object, serializer = model_serializer, options = {}
    if object && (object.respond_to?(:map) || object.errors.empty?)
      render json: serialize_with(object, serializer, options)
    elsif object && object.errors.any?
      render_error :unprocessable_entity, object.errors.full_messages
    elsif object.nil? && options[:allow_nil]
      render json: nil
    else
      render_error :not_found
    end
  end

  def serialize_with object, serializer, options = {}
    return nil if object.nil? && options[:allow_nil]
    if object.respond_to?(:map)
      ActiveModel::ArraySerializer.new(object, each_serializer: serializer)
    else
      serializer.new object, options
    end
  end

  def render_error error_tag, error_messages = nil
    if error_messages.is_a? String
      error_messages = [error_messages]
    end
    error_messages ||= [I18n.t("errors.#{ error_tag }")]
    error_hash = {error: error_tag, error_description: error_messages}
    render json: error_hash, status: error_tag
  end

end
