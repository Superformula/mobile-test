package com.jaredrummler.mobiletest.di

import com.jaredrummler.mobiletest.ui.qrcode.QrCodeViewModel
import dagger.Component
import javax.inject.Singleton

@Singleton
@Component(modules = [NetworkModule::class, QrCodeModule::class])
interface AppComponent {
  fun inject(qrCodeViewModel: QrCodeViewModel)
}