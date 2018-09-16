package com.jaredrummler.mobiletest.ui

import android.support.v4.app.Fragment

abstract class BaseFragment : Fragment() {

  open fun handleOnBackPressed(): Boolean {
    return false
  }

}