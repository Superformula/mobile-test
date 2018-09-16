package com.jaredrummler.mobiletest.ui

import android.annotation.SuppressLint
import android.os.Bundle
import android.support.v7.app.ActionBar
import android.support.v7.app.AppCompatActivity
import android.view.Gravity
import com.jaredrummler.mobiletest.R
import com.jaredrummler.mobiletest.ui.home.HomeFragment
import kotlinx.android.synthetic.main.main_activity_toolbar_title.toolbarTitle

class MainActivity : AppCompatActivity() {

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    setupActionBar()
    if (savedInstanceState == null) {
      supportFragmentManager.beginTransaction()
          .add(android.R.id.content, HomeFragment.newInstance())
          .commit()
    }
  }

  override fun onBackPressed() {
    (supportFragmentManager.findFragmentById(android.R.id.content) as? BaseFragment)?.let { fragment ->
      if (fragment.handleOnBackPressed()) {
        // Allow the fragment to respond to back clicks
        return
      }
    }
    super.onBackPressed()
  }

  override fun setTitle(title: CharSequence?) {
    toolbarTitle?.text = title
  }

  override fun setTitle(titleId: Int) {
    title = getString(titleId)
  }

  @SuppressLint("InflateParams")
  private fun setupActionBar() {
    supportActionBar?.let { actionBar ->
      // Center the toolbar
      val params = ActionBar.LayoutParams(
          ActionBar.LayoutParams.WRAP_CONTENT,
          ActionBar.LayoutParams.MATCH_PARENT,
          Gravity.CENTER
      )
      val view = layoutInflater.inflate(R.layout.main_activity_toolbar_title, null)
      actionBar.displayOptions = ActionBar.DISPLAY_SHOW_CUSTOM
      actionBar.setCustomView(view, params)
    }
  }

}
