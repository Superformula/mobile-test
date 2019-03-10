package com.superformula.qrcode.networking

import com.superformula.qrcode.models.Seed
import io.reactivex.Observable
import retrofit2.http.GET

interface Api {
    @GET("/api/seed")
    fun getSeed() : Observable<Seed>
}