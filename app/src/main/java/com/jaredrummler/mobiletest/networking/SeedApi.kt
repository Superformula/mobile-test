package com.jaredrummler.mobiletest.networking

import io.reactivex.Scheduler

class SeedApi(
    private val service: ApiService,
    private val ioScheduler: Scheduler,
    private val uiScheduler: Scheduler) {

  fun getSeed() = service.getSeed().subscribeOn(ioScheduler).observeOn(uiScheduler)

}