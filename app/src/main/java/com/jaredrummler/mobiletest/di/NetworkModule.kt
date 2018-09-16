package com.jaredrummler.mobiletest.di

import com.jakewharton.retrofit2.adapter.rxjava2.RxJava2CallAdapterFactory
import com.jaredrummler.mobiletest.BuildConfig
import com.jaredrummler.mobiletest.networking.ApiService
import com.jaredrummler.mobiletest.networking.SeedApi
import dagger.Module
import dagger.Provides
import io.reactivex.Scheduler
import io.reactivex.android.schedulers.AndroidSchedulers
import io.reactivex.schedulers.Schedulers
import okhttp3.OkHttpClient
import okhttp3.logging.HttpLoggingInterceptor
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import java.util.concurrent.TimeUnit
import javax.inject.Named
import javax.inject.Singleton

@Module
class NetworkModule {

  @Provides
  @Singleton
  @Named(SCHEDULER_IO)
  fun provideIoScheduler(): Scheduler = Schedulers.io()

  @Provides
  @Singleton
  @Named(SCHEDULER_UI)
  fun provideUiScheduler(): Scheduler = AndroidSchedulers.mainThread()

  @Provides
  @Singleton
  fun provideOkHttpClient(): OkHttpClient {
    val builder = OkHttpClient.Builder()
    builder.connectTimeout(30, TimeUnit.SECONDS)
    builder.readTimeout(30, TimeUnit.SECONDS)
    builder.writeTimeout(30, TimeUnit.SECONDS)
    if (BuildConfig.DEBUG) {
      builder.addInterceptor(HttpLoggingInterceptor()
          .setLevel(HttpLoggingInterceptor.Level.BODY))
    }
    return builder.build()
  }

  @Provides
  @Singleton
  fun provideApiService(okHttpClient: OkHttpClient): ApiService = Retrofit.Builder()
      .baseUrl(BuildConfig.API_ENDPOINT)
      .client(okHttpClient)
      .addCallAdapterFactory(RxJava2CallAdapterFactory.create())
      .addConverterFactory(GsonConverterFactory.create())
      .build()
      .create(ApiService::class.java)

  @Provides
  @Singleton
  fun provideSeedApi(service: ApiService,
      @Named(SCHEDULER_IO) ioScheduler: Scheduler,
      @Named(SCHEDULER_UI) uiScheduler: Scheduler): SeedApi = SeedApi(service, ioScheduler, uiScheduler)

  companion object {
    private const val SCHEDULER_IO = "SCHEDULER_IO"
    private const val SCHEDULER_UI = "SCHEDULER_UI"
  }

}