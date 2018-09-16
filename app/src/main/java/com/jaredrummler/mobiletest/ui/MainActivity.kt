package com.jaredrummler.mobiletest.ui

import android.annotation.SuppressLint
import android.os.Bundle
import android.support.v7.app.ActionBar
import android.support.v7.app.AppCompatActivity
import android.view.Gravity
import android.view.MenuItem
import android.widget.Toast
import com.jaredrummler.mobiletest.R
import com.jaredrummler.mobiletest.ui.home.HomeFragment
import com.jaredrummler.mobiletest.ui.qrcode.QrCodeFragment
import kotlinx.android.synthetic.main.main_activity_toolbar_title.toolbarTitle

class MainActivity : AppCompatActivity(), MainView {

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    setupActionBar()
    if (savedInstanceState == null) {
      supportFragmentManager.beginTransaction()
          .add(android.R.id.content, HomeFragment.newInstance())
          .commit()
    }
  }

  override fun onOptionsItemSelected(item: MenuItem): Boolean {
    return when (item.itemId) {
      android.R.id.home -> {
        onBackPressed()
        true
      }
      else -> super.onOptionsItemSelected(item)
    }
  }

  override fun onBackPressed() {
    (supportFragmentManager.findFragmentById(android.R.id.content) as? BaseFragment)?.let { fragment ->
      if (fragment.handleOnBackPressed()) {
        // Allow the fragment to respond to back clicks
        return
      }
    }
    if (supportFragmentManager.backStackEntryCount > 0) {
      supportFragmentManager.popBackStack()
    } else {
      super.onBackPressed()
    }
  }

  override fun setTitle(title: CharSequence?) {
    toolbarTitle?.text = title
  }

  override fun setTitle(titleId: Int) {
    title = getString(titleId)
  }

  override fun showQrCode() {
    supportFragmentManager.beginTransaction()
        .replace(android.R.id.content, QrCodeFragment.newInstance())
        .addToBackStack(null)
        .commit()
    supportActionBar?.setDisplayHomeAsUpEnabled(true)
  }

  override fun scanQrCode() {
    Toast.makeText(applicationContext, "Not implemented", Toast.LENGTH_LONG).show()
  }

  private fun updateTitle() {
    supportFragmentManager.findFragmentById(android.R.id.content).let { fragment ->
      if (fragment is BaseFragment) {
        setTitle(fragment.getActionBarTitle())
      }
    }
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
      // Update the title when a fragment is added
      supportFragmentManager.addOnBackStackChangedListener {
        actionBar.setDisplayHomeAsUpEnabled(supportFragmentManager.backStackEntryCount > 0)
        updateTitle()
      }
    }
  }

}
