json.extract! faq, :id, :question, :answer, :category_id, :created_at, :updated_at
json.url faq_url(faq, format: :json)
