package com.christopherluc.superformtest

import com.christopherluc.superformtest.screens.ViewModel
import org.assertj.core.api.Assertions
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.RuntimeEnvironment
import java.text.SimpleDateFormat
import java.util.*

@RunWith(RobolectricTestRunner::class)
class QRCodeScreenTest {

    @Test
    fun test_view_model_formatted_date_null() {
        val viewModel = ViewModel()
        viewModel.setFormattedDate(null, RuntimeEnvironment.application)
        Assertions.assertThat(viewModel.subText.get()).isEmpty()
    }

    @Test
    fun test_view_model_formatted_date_not_null() {
        val viewModel = ViewModel()

        val calendar = Calendar.getInstance().time
        viewModel.setFormattedDate(calendar, RuntimeEnvironment.application)
        Assertions.assertThat(viewModel.subText.get()).isNotEmpty()

        val text = SimpleDateFormat("MM/dd/yyyy HH:mm:ss", Locale.getDefault()).format(calendar.time)
        Assertions.assertThat(viewModel.subText.get()).isEqualTo("Expires at $text")
    }
}