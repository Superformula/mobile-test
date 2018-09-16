package com.jaredrummler.mobiletest.ui.qrcode

import com.jaredrummler.mobiletest.networking.SeedResult

interface QrCodeView {
  fun showResult(result: SeedResult)
  fun showError()
}