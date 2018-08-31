package com.christopherluc.superformtest.activity

import android.os.Bundle
import android.view.View
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import androidx.databinding.DataBindingUtil
import androidx.databinding.ObservableInt
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
            scannerFab.setOnClickListener { setScannerFragment() }
        }
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
        when (supportFragmentManager.findFragmentById(R.id.fragmentContainer)) {
            !is QRCodeFragment -> supportFragmentManager.beginTransaction().replace(R.id.fragmentContainer, QRCodeFragment()).commitNow()
        }
        toggleVisibility()
    }

    /**
     * Dummy method where the scanner fragment would be launched from
     */
    private fun setScannerFragment() {
        Toast.makeText(this, "Not yet implemented", Toast.LENGTH_LONG).show()
        toggleVisibility()
    }

}

/**
 * Class used for binding to xml
 */
data class MainActivityViewModel(val subFabVisibility: ObservableInt = ObservableInt(View.GONE))