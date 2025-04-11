# frozen_string_literal: true

require 'spec_helper_acceptance'

describe 'grafana_alloy' do
  describe 'with defaults' do
    it_behaves_like 'an idempotent resource' do
      let(:manifest) do
        <<-PUPPET
        include grafana_alloy
        PUPPET
      end
    end
  end

  describe 'with config' do
    it_behaves_like 'an idempotent resource' do
      let(:config) do
        <<-CONFIG
          prometheus.exporter.unix "default" {
            include_exporter_metrics = true
          }

          prometheus.scrape "default" {
            targets = concat(
              prometheus.exporter.unix.default.targets,
            )
            forward_to = []
          }
        CONFIG
      end
      let(:manifest) do
        <<-PUPPET
        class { 'grafana_alloy':
          config => '#{config}'
        }
        PUPPET
      end
    end
  end
end
