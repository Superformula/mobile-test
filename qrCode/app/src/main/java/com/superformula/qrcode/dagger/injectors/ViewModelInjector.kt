package com.superformula.qrcode.dagger.injectors

import com.superformula.qrcode.dagger.RepositoryModule
import com.superformula.qrcode.viewModels.QrViewModel
import dagger.Component
import javax.inject.Singleton

@Singleton
@Component(modules = [(RepositoryModule::class)])
interface ViewModelInjector {
    fun inject(qrViewModel: QrViewModel)

    @Component.Builder
    interface Builder {
        fun build(): ViewModelInjector

        fun repositoryModule(repositoryModule: RepositoryModule): Builder
    }
}
