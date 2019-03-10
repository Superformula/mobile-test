package com.superformula.qrcode.viewModels

import android.arch.lifecycle.ViewModel
import com.superformula.qrcode.dagger.RepositoryModule
import com.superformula.qrcode.dagger.injectors.DaggerViewModelInjector
import com.superformula.qrcode.dagger.injectors.ViewModelInjector

abstract class BaseViewModel:ViewModel(){
    private val injector: ViewModelInjector = DaggerViewModelInjector
            .builder()
            .repositoryModule(RepositoryModule)
            .build()

    init {
        inject()
    }

    /**
     * Injects the required dependencies
     */
    private fun inject() {
        when (this) {
            is QrViewModel -> injector.inject(this)
        }
    }
}
