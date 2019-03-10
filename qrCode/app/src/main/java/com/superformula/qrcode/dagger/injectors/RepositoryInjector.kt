package com.superformula.qrcode.dagger.injectors

import com.superformula.qrcode.dagger.NetworkModule
import com.superformula.qrcode.data.QrRepository
import dagger.Component
import javax.inject.Singleton

@Singleton
@Component(modules = [(NetworkModule::class)])
interface RepositoryInjector {
    fun inject(qrRepository: QrRepository)

    @Component.Builder
    interface Builder {
        fun build(): RepositoryInjector

        fun networkModule(networkModule: NetworkModule): Builder
    }
}
