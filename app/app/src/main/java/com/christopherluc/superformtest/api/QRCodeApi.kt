package com.christopherluc.superformtest.api

import io.reactivex.Single
import io.reactivex.schedulers.Schedulers
import retrofit2.Retrofit
import retrofit2.adapter.rxjava2.RxJava2CallAdapterFactory
import retrofit2.converter.gson.GsonConverterFactory
import retrofit2.http.GET
import java.text.SimpleDateFormat
import java.util.*

/**
 * Single instance of the QR Code Service
 *
 */
object QRCodeService {

    private const val BASE_URL = "http://192.168.86.22:3000"
    private const val ISO_DATE_FORMAT = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"


    /**
     * Lazily instantiate the client
     */
    private val seedClient: Retrofit by lazy {
        Retrofit.Builder()
            .baseUrl(BASE_URL)
            .addCallAdapterFactory(RxJava2CallAdapterFactory.create())
            .addConverterFactory(GsonConverterFactory.create())
            .build()
    }

    /**
     * Public facing method used to retrieve qr code seed from api
     *
     * Returns a Single observable containing app model
     */
    fun getSeed(): Single<QRCodeSeed> {
        return seedClient.create(QRCodeEndpoints::class.java).getSeed()
            .subscribeOn(Schedulers.io())
            .map { result ->
                val expirationDate = result.expires_at?.let {
                    try {
                        SimpleDateFormat(ISO_DATE_FORMAT, Locale.US).apply { timeZone = TimeZone.getTimeZone("UTC") }.parse(it)
                    } catch (e: Exception) {
                        null
                    }
                }

                QRCodeSeed(result.seed, expirationDate)
            }
    }

}

/**
 * Private interface used by retrofit to generate endpoints
 */
private interface QRCodeEndpoints {

    @GET("/seed")
    fun getSeed(): Single<Seed>
}

/**
 * API DATA MODELS BELOW
 */
private data class Seed(val seed: String?, val expires_at: String?)
