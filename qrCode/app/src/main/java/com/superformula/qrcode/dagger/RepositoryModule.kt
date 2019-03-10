package com.superformula.qrcode.dagger

import com.superformula.qrcode.data.QrRepository
import dagger.Module
import dagger.Provides
import dagger.Reusable


@Module
// Safe here as we are dealing with a Dagger 2 module
@Suppress("unused")
object RepositoryModule {

    @Provides
    @Reusable
    @JvmStatic
    internal fun provideRepository(): QrRepository {
        return QrRepository()
    }

}
