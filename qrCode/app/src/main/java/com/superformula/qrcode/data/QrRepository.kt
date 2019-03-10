package com.superformula.qrcode.data

import com.superformula.qrcode.networking.Api
import javax.inject.Inject

class QrRepository: BaseRepositry() {

    @Inject
    lateinit var api: Api
}
