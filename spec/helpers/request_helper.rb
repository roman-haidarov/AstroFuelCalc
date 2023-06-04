
def parsed_body
  JSON.parse(last_response.body)
end

def response_status
  last_response.status
end