package com.jaredrummler.mobiletest

import android.app.Application
import com.jaredrummler.mobiletest.di.AppComponent
import com.jaredrummler.mobiletest.di.DaggerAppComponent
import timber.log.Timber

fun injector() = MainApp.app.appComponent

class MainApp : Application() {

  lateinit var appComponent: AppComponent

  override fun onCreate() {
    super.onCreate()
    app = this@MainApp
    appComponent = DaggerAppComponent.builder().build()
    if (BuildConfig.DEBUG) {
      Timber.plant(Timber.DebugTree())
    }
  }

  companion object {
    lateinit var app: MainApp
  }

}