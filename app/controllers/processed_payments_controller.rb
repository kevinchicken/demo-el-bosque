# frozen_string_literal: true

# ProcessedPayments class manages payments received by the frontend form and sent to the MercadoPago payments endpoint
class ProcessedPaymentsController < ApplicationController
  def process_payment
    payment = ProcessedPayments.new
    payment.token = request.body[:token]
    payment.issuer_id = request.body[:issuer_id]
    payment.payment_method_id = request.body[:payment_method_id]
    payment.transaction_amount = request.body[:transaction_amount]
    payment.installments = request.body[:installments]
    payment.description = request.body[:description]
    payment.email = request.body[:payer][:email]
    payment.identification_type = request.body[:payer][:identification][:type]
    payment.identification_number = request.body[:payer][:identification][:number]
    payment.save
    post_payment(payment)
  end

  def post_payment(payment)
    uri = URI.parse('https://api.mercadopago.com/v1/payments')
    request = Net::HTTP::Post.new(uri)
    request.content_type = 'application/json'
    request['Authorization'] = 'Bearer YOUR_ACCESS_TOKEN'
    request.body = JSON.dump({
      'additional_info' => {
        'items' => [
          {
            'id' => 'PR0001',
            'title' => 'Point Mini',
            'description' => 'Producto Point para cobros con tarjetas mediante bluetooth',
            'picture_url' => 'https://http2.mlstatic.com/resources/frontend/statics/growth-sellers-landings/device-mlb-point-i_medium@2x.png',
            'category_id' => 'electronics',
            'quantity' => 1,
            'unit_price' => 58.8
          }
        ],
        'payer' => {
          'first_name' => 'Test',
          'last_name' => 'Test',
          'phone' => {
            'area_code' => 11,
            'number' => '987654321'
          },
          'address' => ''
        },
        'shipments' => {
          'receiver_address' => {
            'zip_code' => '12312-123',
            'state_name' => 'Rio de Janeiro',
            'city_name' => 'Buzios',
            'street_name' => 'Av das Nacoes Unidas',
            'street_number' => 3003
          }
        },
        'barcode' => ''
      },
      'description' => 'Payment for product',
      'external_reference' => 'MP0001',
      'installments' => payment.installments,
      'issuer_id' => payment.issuer_id,
      'metadata' => '',
      'payer' => {
        'entity_type' => 'individual',
        'type' => 'customer',
        'identification' => '',
        'email' => payment.email
      },
      'payment_method_id' => payment.payment_method_id,
      'token' => payment.token,
      'transaction_amount' => payment.transaction_amount
    })

    req_options = {
      use_ssl: uri.scheme == 'https'
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end
  end
end
