package com.christopherluc.superformtest.api

import io.reactivex.Single
import io.reactivex.schedulers.Schedulers
import retrofit2.Retrofit
import retrofit2.adapter.rxjava2.RxJava2CallAdapterFactory
import retrofit2.converter.gson.GsonConverterFactory
import retrofit2.http.GET

object QRCodeService {

    val BASE_URL = "http://192.168.86.22:3000"

    private val seedClient: Retrofit by lazy {
        Retrofit.Builder()
            .baseUrl(BASE_URL)
            .addCallAdapterFactory(RxJava2CallAdapterFactory.create())
            .addConverterFactory(GsonConverterFactory.create())
            .build()
    }

    fun getSeed(): Single<QRCodeSeed> {
        return seedClient.create(QRCodeEndpoints::class.java).getSeed()
            .subscribeOn(Schedulers.io())
            .map { result ->
                QRCodeSeed(result.seed, result.expires_at)
            }
    }

}

private interface QRCodeEndpoints {

    @GET("/seed")
    fun getSeed(): Single<Seed>
}

private data class Seed(val seed: String?, val expires_at: String?)
