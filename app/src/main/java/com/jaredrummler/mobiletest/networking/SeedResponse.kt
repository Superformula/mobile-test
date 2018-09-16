package com.jaredrummler.mobiletest.networking

import com.google.gson.annotations.SerializedName

data class SeedResponse(
    @SerializedName("seed") val seed: String,
    @SerializedName("expired_at") val expiredAt: String
)