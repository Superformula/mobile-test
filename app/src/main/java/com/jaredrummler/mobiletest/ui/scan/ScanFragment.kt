package com.jaredrummler.mobiletest.ui.scan

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Toast
import com.google.zxing.BarcodeFormat
import com.google.zxing.ResultPoint
import com.google.zxing.client.android.BeepManager
import com.jaredrummler.mobiletest.R
import com.jaredrummler.mobiletest.ui.BaseFragment
import com.journeyapps.barcodescanner.BarcodeCallback
import com.journeyapps.barcodescanner.BarcodeResult
import com.journeyapps.barcodescanner.DefaultDecoderFactory
import kotlinx.android.synthetic.main.fragment_scan.barcodeScanner
import java.util.Arrays


class ScanFragment : BaseFragment() {

  lateinit var beepManager: BeepManager

  private var lastScanResult: String = ""

  private val callback = object : BarcodeCallback {
    override fun barcodeResult(result: BarcodeResult) {
      if (result.text == null || result.text == lastScanResult) {
        // Prevent duplicate scans
        return
      }
      lastScanResult = result.text
      Toast.makeText(requireContext(), lastScanResult, Toast.LENGTH_LONG).show()
      beepManager.playBeepSound()
    }

    override fun possibleResultPoints(resultPoints: MutableList<ResultPoint>) {
      // no-op
    }

  }

  override fun getActionBarTitle(): Int = R.string.scan

  override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View {
    return inflater.inflate(R.layout.fragment_scan, container, false)
  }

  override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
    super.onViewCreated(view, savedInstanceState)
    beepManager = BeepManager(requireActivity())
    val formats = Arrays.asList(BarcodeFormat.QR_CODE, BarcodeFormat.CODE_39)
    barcodeScanner.barcodeView.decoderFactory = DefaultDecoderFactory(formats)
    barcodeScanner.decodeContinuous(callback)
  }

  override fun onResume() {
    super.onResume()
    barcodeScanner.resume()
  }

  override fun onPause() {
    super.onPause()
    barcodeScanner.pause()
  }

  companion object {
    fun newInstance() = ScanFragment()
  }

}