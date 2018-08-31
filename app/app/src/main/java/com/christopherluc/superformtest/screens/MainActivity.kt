package com.christopherluc.superformtest.screens

import android.os.Bundle
import android.view.View
import androidx.appcompat.app.AppCompatActivity
import androidx.databinding.DataBindingUtil
import androidx.databinding.ObservableInt
import androidx.fragment.app.Fragment
import com.christopherluc.superformtest.R
import com.christopherluc.superformtest.databinding.ActivityMainBinding

/**
 * Main activity that hosts all fragments for the app
 */
class MainActivity : AppCompatActivity() {

    private val viewModel = MainActivityViewModel()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        DataBindingUtil.setContentView<ActivityMainBinding>(this, R.layout.activity_main).apply {
            viewModel = this@MainActivity.viewModel
            mainFab.setOnClickListener { toggleVisibility() }
            qrFab.setOnClickListener { setQRCodeFragment() }
            scanFab.setOnClickListener { setScannerFragment() }
        }
    }

    override fun onBackPressed() {
        supportFragmentManager?.takeIf { it.backStackEntryCount > 0 }?.popBackStack() ?: super.onBackPressed()
    }

    /**
     * Toggles visibility of mini fabs
     */
    private fun toggleVisibility() {
        viewModel.run {
            subFabVisibility.set(if (subFabVisibility.get() == View.GONE) View.VISIBLE else View.GONE)
        }
    }

    /**
     * Launches the QRCodeFragment if not currently displayed
     */
    private fun setQRCodeFragment() {
        val fragment = supportFragmentManager.findFragmentById(R.id.fragmentContainer)
        when (fragment) {
            !is QRCodeFragment -> setOrReplaceFragment(fragment, QRCodeFragment())
        }
        toggleVisibility()
    }

    /**
     * Dummy method where the scanner fragment would be launched from
     */
    private fun setScannerFragment() {
        val fragment = supportFragmentManager.findFragmentById(R.id.fragmentContainer)

        when (fragment) {
            !is ScannerFragment -> setOrReplaceFragment(fragment, ScannerFragment())
        }
        toggleVisibility()
    }

    private fun setOrReplaceFragment(oldFragment: Fragment?, newFragment: Fragment) {
        val transaction = supportFragmentManager.beginTransaction().apply {
            oldFragment?.let {
                remove(it)
                supportFragmentManager.popBackStack()
            }
        }
        transaction.replace(R.id.fragmentContainer, newFragment).addToBackStack(null).commit()
    }
}

/**
 * Class used for binding to xml
 */
data class MainActivityViewModel(val subFabVisibility: ObservableInt = ObservableInt(View.GONE))