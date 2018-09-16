package com.jaredrummler.mobiletest.ui.qrcode

import android.arch.core.executor.testing.InstantTaskExecutorRule
import com.jaredrummler.mobiletest.TestHelper
import com.jaredrummler.mobiletest.networking.FailedResult
import com.jaredrummler.mobiletest.networking.Result
import com.jaredrummler.mobiletest.networking.SeedResponse
import com.jaredrummler.mobiletest.networking.SeedResult
import com.nhaarman.mockito_kotlin.any
import com.nhaarman.mockito_kotlin.mock
import com.nhaarman.mockito_kotlin.whenever
import io.reactivex.Single
import org.junit.After
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TestRule

class QrCodeViewModelTest {

  @get:Rule
  var rule: TestRule = InstantTaskExecutorRule()

  @Before fun setUp() {
    TestHelper.setupRxSchedulers()
    TestHelper.mockApp()
  }

  @After fun tearDown() {
    TestHelper.tearDownRxSchedulers()
    TestHelper.unmockApp()
  }

  @Test
  fun `should set value when api returns valid seed`() {
    val model = QrCodeViewModel()

    model.api = mock()
    model.encoder = mock()

    val seed = "6ztgj6uyrk1nh1gkgbmcoy9uuugznem5"
    val expiredAt = "2018-09-16T07:00:50.244Z"

    whenever(model.encoder.encodeBitmap(any(), any(), any(), any())).thenReturn(mock())
    whenever(model.api.getSeed()).thenReturn(Single.just(SeedResponse(seed, expiredAt)))

    model.loadSeed()

    val result: Result = model.seed.value ?: throw Exception("value was not set")
    assertTrue(result is SeedResult)
    assertEquals(seed, result.seed?.seed)
    assertEquals(expiredAt, result.seed?.expiredAt)
  }

  @Test
  fun `should return failed result when api fails`() {
    val model = QrCodeViewModel()

    model.api = mock()
    model.encoder = mock()

    whenever(model.api.getSeed()).thenReturn(Single.error(Exception("API failure")))

    model.loadSeed()

    val result: Result = model.seed.value ?: throw Exception("value was not set")
    assertTrue(result is FailedResult)
  }

}