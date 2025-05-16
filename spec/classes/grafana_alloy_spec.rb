# frozen_string_literal: true

require 'spec_helper'

describe 'grafana_alloy' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }
      let(:params) { {} }

      context 'with default params' do
        it { is_expected.to compile.with_all_deps }
        it { is_expected.not_to contain_file('/etc/alloy/config.alloy') }
      end

      context 'with all params' do
        let(:params) { super().merge(config: 'my config') }

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_file('/etc/alloy/config.alloy').with_content('my config') }
      end

      context 'without managing repo' do
        let(:params) { super().merge(config: 'my config without managing repo', manage_package_repo: false) }

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_file('/etc/alloy/config.alloy').with_content('my config without managing repo') }
      end

      context 'with sensitive configuration' do
        let(:params) { super().merge(config: sensitive('my config')) }

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_file('/etc/alloy/config.alloy').with_content(sensitive('my config')) }
      end
    end
  end
end
