package com.jaredrummler.mobiletest.di

import com.journeyapps.barcodescanner.BarcodeEncoder
import dagger.Module
import dagger.Provides
import javax.inject.Singleton

@Module
object QrCodeModule {

  @Provides
  @Singleton
  fun provideBarcodeEncoder() = BarcodeEncoder()

}