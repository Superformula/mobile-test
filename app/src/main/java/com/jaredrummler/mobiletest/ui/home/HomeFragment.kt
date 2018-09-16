package com.jaredrummler.mobiletest.ui.home

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import com.jaredrummler.mobiletest.R
import com.jaredrummler.mobiletest.ui.BaseFragment
import com.jaredrummler.mobiletest.ui.MainView
import kotlinx.android.synthetic.main.fragment_home.fabQrCode
import kotlinx.android.synthetic.main.fragment_home.fabScan
import kotlinx.android.synthetic.main.fragment_home.floatingActions

class HomeFragment : BaseFragment() {

  override fun getActionBarTitle(): Int = R.string.home

  override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View {
    return inflater.inflate(R.layout.fragment_home, container, false)
  }

  override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
    super.onViewCreated(view, savedInstanceState)
    fabQrCode.setOnClickListener {
      floatingActions.collapse()
      (activity as? MainView)?.showQrCode()
    }
    fabScan.setOnClickListener {
      floatingActions.collapse()
      (activity as? MainView)?.scanQrCode()
    }
  }

  override fun handleOnBackPressed(): Boolean {
    if (floatingActions.isExpanded) {
      // Collapse the FloatingActionsMenu if it is expanded
      floatingActions.collapse()
      return true
    }
    return false
  }

  companion object {
    fun newInstance() = HomeFragment()
  }

}