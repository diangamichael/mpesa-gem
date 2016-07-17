require 'mpesa/c2b/client'
require 'mpesa/c2b/response'

module MPesa
  # The overall scope of the C2B Web service is to provide primitives for
  # application developers to handle checkout process in a simple way. The API
  # allows merchant initiate C2B (paybill via web) transactions.
  #
  # ### How It Works
  #
  #     +-------------+                                       +---------------+
  #     |             |                                       |               |
  #     |             |>--(A)------- Payment Request -------->|               |
  #     |             |                                       |               |
  #     |             |<-------- Payment API Response -------<|               |
  #     |             |                                       |               |
  #     |        (B) -|                                       |               |
  #     |             |                                       |               |
  #     |  MERCHANT   |>--(C)--- Confirm Payment Request ---->|      SAG      |
  #     |             |                                       |               |
  #     |             |<-------- Confirm API Response -------<|               |
  #     |             |                                       |               |
  #     |             |                                       |- (D)          |
  #     |             |                                       |               |
  #     |             |<--(H)-- Payment Response Callback ---<|               |
  #     |             |                                       |               |
  #     |             |>--(I)--- Callback Result Response --->|               |
  #     |             |                                       |               |
  #     |             |                                       |               |
  #     +-------------+                                       +---------------+
  #
  # * **A** - The merchant submits authentication details, transaction details,
  #   callback url and callback method. Merchant receives instant feedback with
  #   validity status of their payment request.
  # * **B** & **C** - Customer is shown a payment request message and a
  #   confirmation payment request is initiated after. Merchant receives instant
  #   feedback with validity status of their confirm payment request.
  # * **D** - C2B API handles customer validation and authentication via USSD
  #   push.
  #     * **H** - If the customer validation fails or declines the transaction,
  #       the API makes a callback to merchant.
  #     * **I** - Otherwise the transaction is processed and status is reported
  #       back through a callback.
  #
  # This process flow makes the following assumptions:
  #
  # * The service is an on demand service where the Merchant always initiates
  #   the request when there is a payment to be settled.
  # * The merchant already has an account created by the SAG.
  # * The merchant has been provided with the URL of the endpoint.
  module C2B
    VERSION = '2.0'.freeze
  end
end
