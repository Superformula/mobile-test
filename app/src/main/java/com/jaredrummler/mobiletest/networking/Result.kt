package com.jaredrummler.mobiletest.networking

import android.graphics.Bitmap
import org.threeten.bp.OffsetDateTime

sealed class Result(val seed: SeedResponse?, val qrcode: Bitmap?)

class FailedResult : Result(null, null)

class SeedResult(seed: SeedResponse, qrcode: Bitmap) : Result(seed, qrcode) {

  /**
   * The parsed expired time in milliseconds
   */
  val expiredTime by lazy { OffsetDateTime.parse(seed.expiredAt).toInstant().toEpochMilli() }

  /**
   * @return true if the seed is expired
   */
  fun isSeedExpired(): Boolean = expiredTime > System.currentTimeMillis()

}
