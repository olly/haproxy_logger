class Array 
  def rand 
    self[Kernel.rand(length)]
  end
end

class RandomStatusCode
  
  def self.status_codes
    {
      200 => 'OK',
      201 => 'Created',
      202 => 'Accepted',
      301 => 'Moved Permanently',
      302 => 'Found',
      400 => 'Bad Request',
      401 => 'Unauthorized',
      402 => 'Payment Required',
      403 => 'Forbidden',
      404 => 'Not Found',
      405 => 'Method Not Allowed',
      406 => 'Not Acceptable',
      409 => 'Conflict',
      410 => 'Gone',
      422 => 'Unprocessable Entity',
      500 => 'Internal Server Error',
      502 => 'Bad Gateway',
      503 => 'Service Unavailable',
      504 => 'Gateway Timeout',
    }
  end
  
  def self.random_status_code
    code = status_codes.keys.rand
    [code, status_codes[status_codes.keys.rand]]
  end
  
  def self.call(env)
    code, body = self.random_status_code
    [code, {'Content-Type' => 'text/plain'}, "#{code}: #{body}"]
  end
  
end

if __FILE__ == $0
  p RandomStatusCode.random_status_code
end
