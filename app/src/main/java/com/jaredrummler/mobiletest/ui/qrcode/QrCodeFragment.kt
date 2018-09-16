package com.jaredrummler.mobiletest.ui.qrcode

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import com.jaredrummler.mobiletest.R
import com.jaredrummler.mobiletest.ui.BaseFragment

class QrCodeFragment : BaseFragment() {

  override fun getActionBarTitle(): Int = R.string.qr_code

  override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View {
    return inflater.inflate(R.layout.fragment_qr_code, container, false)
  }

  companion object {
    fun newInstance() = QrCodeFragment()
  }

}