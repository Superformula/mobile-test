package com.superformula.qrcode.viewModels

import com.superformula.qrcode.data.QrRepository
import javax.inject.Inject

class QrViewModel:BaseViewModel() {

    @Inject
    lateinit var repository: QrRepository
}
