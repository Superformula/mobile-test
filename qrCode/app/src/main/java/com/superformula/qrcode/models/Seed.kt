package com.superformula.qrcode.models

import com.squareup.moshi.Json


data class Seed (
    val seed: String,

    @field:Json(name = "expires_at")
    val expiresAt: String
)