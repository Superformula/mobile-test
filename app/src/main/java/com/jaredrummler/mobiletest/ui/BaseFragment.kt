package com.jaredrummler.mobiletest.ui

import android.support.annotation.StringRes
import android.support.v4.app.Fragment

abstract class BaseFragment : Fragment() {

  @StringRes abstract fun getActionBarTitle(): Int

  open fun handleOnBackPressed(): Boolean {
    return false
  }

}