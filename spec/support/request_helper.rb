module RequestHelper

  def response_hash
    @response_hash ||= symbolize(response_json)
  end

  def response_json
    @response_json ||= JSON.parse(response.body)
  end

  def is_delayed? expected_delayed_job_args
    Sidekiq::Extensions::DelayedClass.jobs.any? do |j|
      j['args'].include? expected_delayed_job_args
    end
  end

  private

  def symbolize jzon
    return jzon unless jzon.is_a? Hash or jzon.is_a? Array
    return jzon.map{ |x| symbolize x } if jzon.is_a? Array
    jzon.reduce({}) do |h,(k,v)|
      h[k.to_sym] = symbolize v
      h
    end
  end

end
