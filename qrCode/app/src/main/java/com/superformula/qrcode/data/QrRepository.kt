package com.superformula.qrcode.data

import com.superformula.qrcode.models.Seed
import com.superformula.qrcode.networking.Api
import io.reactivex.Observable
import javax.inject.Inject

class QrRepository: BaseRepositry() {
    @Inject
    lateinit var api: Api

    fun getSeed() : Observable<Seed> {
        return api.getSeed()
    }
}
