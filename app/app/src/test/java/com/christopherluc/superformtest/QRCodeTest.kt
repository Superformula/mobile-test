package com.christopherluc.superformtest

import com.christopherluc.superformtest.qrcode.encodeAsBitmap
import org.assertj.core.api.Assertions
import org.junit.Assert.fail
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner


/**
 * Unit tests that test QRCode related functionality
 */
@RunWith(RobolectricTestRunner::class)
class QRCodeTest {

    @Test
    fun same_strings_generate_same_bitmap() {
        val test = "test"
        val bitmap1 = encodeAsBitmap(test, 300)!!
        val bitmap2 = encodeAsBitmap(test, 300)!!

        val width = bitmap1.width
        val height = bitmap1.height

        val pixelCount = width * height
        val pixels1 = IntArray(pixelCount)
        val pixels2 = IntArray(pixelCount)

        bitmap1.getPixels(pixels1, 0, 0, 0, 0, width, height)
        bitmap2.getPixels(pixels2, 0, 0, 0, 0, width, height)

        for (i in 0 until pixelCount) {
            Assertions.assertThat(pixels1[i]).isEqualTo(pixels2[i])
        }
    }

    @Test
    fun different_strings_generate_different_bitmap() {
        val bitmap1 = encodeAsBitmap("test", 300)!!
        val bitmap2 = encodeAsBitmap("nottest", 300)!!

        val width = bitmap1.width
        val height = bitmap1.height

        val pixelCount = width * height
        val pixels1 = IntArray(pixelCount)
        val pixels2 = IntArray(pixelCount)

        bitmap1.getPixels(pixels1, 0, 0, 0, 0, width, height)
        bitmap2.getPixels(pixels2, 0, 0, 0, 0, width, height)

        for (i in 0 until pixelCount) {
            if (pixels1[i] != pixels2[i]) {
                return
            }
        }
        fail("Pixels all matched")
    }

    @Test
    fun different_widths_generate_different_bitmaps() {
        val bitmap1 = encodeAsBitmap("test", 300)!!
        val bitmap2 = encodeAsBitmap("test", 200)!!

        Assertions.assertThat(bitmap1.width).isNotEqualTo(bitmap2.width)
        Assertions.assertThat(bitmap1.height).isNotEqualTo(bitmap2.height)

    }
}
