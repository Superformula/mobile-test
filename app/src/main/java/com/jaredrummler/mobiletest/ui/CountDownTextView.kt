package com.jaredrummler.mobiletest.ui

import android.content.Context
import android.os.CountDownTimer
import android.util.AttributeSet
import android.widget.TextView

class CountDownTextView @JvmOverloads constructor(
    context: Context, attrs: AttributeSet? = null, defStyleAttr: Int = 0
) : TextView(context, attrs, defStyleAttr) {

  private var timer: CountDownTimer? = null

  interface Listener {
    fun onCountDownComplete()
  }

  fun startCountDown(expiration: Long, listener: Listener, interval: Long = ONE_SECOND) {
    val millisRemaining = expiration - System.currentTimeMillis()
    if (millisRemaining <= 0) {
      listener.onCountDownComplete()
      return
    }

    timer = object : CountDownTimer(millisRemaining, interval) {
      override fun onFinish() {
        listener.onCountDownComplete()
      }

      override fun onTick(millisUntilFinished: Long) {
        text = formatTime(millisUntilFinished)
      }

    }.start()
  }

  fun cancel() {
    timer?.cancel()
    timer = null
  }

  private fun formatTime(millis: Long): String {
    val duration = millis / 1000
    val hours = duration / 3600
    val minutes = (duration - hours * 3600) / 60
    val seconds = duration - hours * 3600 - minutes * 60
    val time = StringBuilder()
    if (hours > 0) {
      time.append(hours).append(':')
    }
    if (minutes > 0) {
      time.append(minutes).append(':')
    }
    if (seconds < 10) time.append('0')
    time.append(seconds)
    time.append('…')
    return time.toString()
  }

  companion object {
    private const val ONE_SECOND = 1000L
  }


}