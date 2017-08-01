unless Rails.env.test?
  AlgoliaSearch.configuration = {
    application_id: Rails.application.secrets.algolia_application_id,
    api_key: Rails.application.secrets.algolia_api_key
  }
end
