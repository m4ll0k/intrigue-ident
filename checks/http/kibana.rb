module Intrigue
  module Ident
    module Check
      class Kibana < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[Database Administrative],
              vendor: 'Elasticsearch',
              product: 'Kibana',
              website: 'https://www.elastic.co/kibana',
              description: 'kbn-* header',
              match_type: :content_headers,
              version: nil,
              match_content: /^kbn-name:.*$/i,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[Database Administrative],
              vendor: 'Elasticsearch',
              product: 'Kibana',
              website: 'https://www.elastic.co/kibana',
              description: 'kbn-* header',
              match_type: :content_headers,
              version: nil,
              match_content: /^kbn-xpack-sig:.*$/i,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[Database Administrative],
              vendor: 'Elasticsearch',
              product: 'Kibana',
              website: 'https://www.elastic.co/kibana',
              description: 'kbn-* header',
              match_type: :content_headers,
              version: nil,
              match_content: /^kbn-version:(.*)$/i,
              dynamic_version: lambda { |x|
                _first_header_capture(x, /^^kbn-version:(.*)$/i)
              },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            }
          ]
        end
      end
    end
  end
end
