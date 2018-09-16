package com.jaredrummler.mobiletest.ui

import android.Manifest.permission
import android.annotation.SuppressLint
import android.os.Bundle
import android.support.v4.app.ActivityCompat
import android.support.v4.content.PermissionChecker
import android.support.v4.content.PermissionChecker.checkSelfPermission
import android.support.v7.app.ActionBar
import android.support.v7.app.AppCompatActivity
import android.view.Gravity
import android.view.MenuItem
import com.jaredrummler.mobiletest.R
import com.jaredrummler.mobiletest.ui.home.HomeFragment
import com.jaredrummler.mobiletest.ui.qrcode.QrCodeFragment
import com.jaredrummler.mobiletest.ui.scan.ScanFragment
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

  override fun onRequestPermissionsResult(requestCode: Int, permissions: Array<out String>, grantResults: IntArray) {
    if (permissions.contains(permission.CAMERA) && requestCode == REQUEST_CAMERA_CODE) {
      if (grantResults[0] == PermissionChecker.PERMISSION_GRANTED) {
        scanQrCode()
      }
    }
    super.onRequestPermissionsResult(requestCode, permissions, grantResults)
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
  }

  override fun scanQrCode() {
    if (checkSelfPermission(this, permission.CAMERA) != PermissionChecker.PERMISSION_GRANTED) {
      ActivityCompat.requestPermissions(this, arrayOf(permission.CAMERA), REQUEST_CAMERA_CODE)
      return
    }
    supportFragmentManager.beginTransaction()
        .replace(android.R.id.content, ScanFragment.newInstance())
        .addToBackStack(null)
        .commit()
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

  companion object {
    private const val REQUEST_CAMERA_CODE = 327
  }

}
