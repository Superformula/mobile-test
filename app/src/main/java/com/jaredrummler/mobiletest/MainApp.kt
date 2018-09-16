package com.jaredrummler.mobiletest

import android.app.Application
import com.jaredrummler.mobiletest.di.AppComponent
import com.jaredrummler.mobiletest.di.DaggerAppComponent

fun injector() = MainApp.app.appComponent

class MainApp : Application() {

  lateinit var appComponent: AppComponent

  override fun onCreate() {
    super.onCreate()
    app = this@MainApp
    appComponent = DaggerAppComponent.builder().build()
  }

  companion object {
    lateinit var app: MainApp
  }

}