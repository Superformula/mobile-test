package com.jaredrummler.mobiletest

import com.nhaarman.mockito_kotlin.mock
import com.nhaarman.mockito_kotlin.whenever
import io.reactivex.Scheduler
import io.reactivex.android.plugins.RxAndroidPlugins
import io.reactivex.disposables.Disposable
import io.reactivex.internal.schedulers.ExecutorScheduler
import io.reactivex.plugins.RxJavaPlugins
import io.reactivex.schedulers.Schedulers
import java.util.concurrent.Executor
import java.util.concurrent.TimeUnit

object TestHelper {

  fun mockApp() {
    val mockApp: MainApp = mock()
    whenever(mockApp.appComponent).thenReturn(mock())
    MainApp.app = mockApp
  }

  fun unmockApp() {
    val mockApp: MainApp = mock()
    whenever(mockApp.appComponent).thenReturn(null)
    MainApp.app = mockApp
  }

  fun setupRxSchedulers() {
    val immediate = object : Scheduler() {
      override fun scheduleDirect(run: Runnable, delay: Long, unit: TimeUnit): Disposable {
        // this prevents StackOverflowErrors when scheduling with a delay
        return super.scheduleDirect(run, 0, unit)
      }

      override fun createWorker(): Scheduler.Worker {
        return ExecutorScheduler.ExecutorWorker(Executor { it.run() })
      }
    }

    RxJavaPlugins.setInitIoSchedulerHandler { immediate }
    RxJavaPlugins.setInitComputationSchedulerHandler { immediate }
    RxJavaPlugins.setInitNewThreadSchedulerHandler { immediate }
    RxJavaPlugins.setInitSingleSchedulerHandler { immediate }
    RxAndroidPlugins.setInitMainThreadSchedulerHandler { Schedulers.trampoline() }
  }

  fun tearDownRxSchedulers() {
    RxJavaPlugins.reset()
    RxAndroidPlugins.reset()
  }

}