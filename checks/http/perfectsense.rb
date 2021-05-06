module Intrigue
  module Ident
    module Check
      class Perfectsense < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['ApplicationServer'],
              vendor: 'PerfectSense',
              product: 'Brightspot',
              description: 'server header',
              version: nil,
              references: [],
              match_type: :content_headers,
              match_content: /x-powered-by: Brightspot/i,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            }
          ]
        end
      end
    end
  end
end
