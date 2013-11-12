json.array!(@postings) do |posting|
  json.extract! posting, 
  json.url posting_url(posting, format: :json)
end
