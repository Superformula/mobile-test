package com.jaredrummler.mobiletest.networking

import io.reactivex.Single
import retrofit2.http.GET

interface ApiService {

  @GET("/seed")
  fun getSeed(): Single<SeedResponse>

}