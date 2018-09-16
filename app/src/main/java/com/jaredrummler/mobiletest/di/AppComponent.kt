package com.jaredrummler.mobiletest.di

import dagger.Component
import javax.inject.Singleton

@Singleton
@Component(modules = [NetworkModule::class, QrCodeModule::class])
interface AppComponent {

}