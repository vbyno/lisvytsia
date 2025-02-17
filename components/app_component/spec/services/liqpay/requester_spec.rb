require 'spec_helper'

describe AppComponent::Liqpay::Requester do
  describe '.request' do
    let(:amount) { '102.50' }
    let(:host) { 'local.example.com' }
    let(:port) { 3000 }
    let(:protocol) { 'http://' }
    let(:result_url) { "#{protocol}#{host}:#{port}/donate?donation_id=#{donation.id}" }
    let(:server_url) { "#{protocol}#{host}:#{port}/donations/confirm" }
    let(:donation) { create :donation, amount: amount.to_f }
    let(:http_request) { double(host: host,
                                optional_port: port,
                                protocol: protocol,
                                path_parameters: { controller: 'donations', action: 'create' },
                                routes: AppComponent::Engine.routes,
                                script_name: '') }
    let(:custom_controller) {
    }

    let(:controller) do
      ctrl = Class.new(ApplicationController) do
        include AppComponent::Engine.routes.url_helpers
      end.new

      allow(ctrl).to receive(:request).and_return http_request

      ctrl
    end

    let(:requested) { described_class.request(donation, controller) }

    it 'generates liqpay request by donation' do
      expect(requested.amount).to eq donation.amount
      expect(requested.order_id).to eq donation.id
      expect(requested.currency).to eq 'UAH'
      expect(requested.result_url).to eq result_url
      expect(requested.server_url).to eq server_url
      expect(requested.description).to eq 'Добровільна пожертва'
    end
  end
end
