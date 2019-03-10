package com.superformula.qrcode.data

import com.superformula.qrcode.dagger.NetworkModule
import com.superformula.qrcode.dagger.injectors.DaggerRepositoryInjector
import com.superformula.qrcode.dagger.injectors.RepositoryInjector

abstract class BaseRepositry {
    private val injector: RepositoryInjector = DaggerRepositoryInjector
            .builder()
            .networkModule(NetworkModule)
            .build()

    init {
        inject()
    }

    /**
     * Injects the required dependencies
     */
    private fun inject() {
        when (this) {
            is QrRepository -> injector.inject(this)
        }
    }
}
