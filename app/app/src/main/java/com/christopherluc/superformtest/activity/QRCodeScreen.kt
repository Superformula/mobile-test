package com.christopherluc.superformtest.activity

import android.content.Context
import android.graphics.Bitmap
import android.os.Bundle
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.databinding.ObservableField
import com.christopherluc.superformtest.R
import com.christopherluc.superformtest.api.QRCodeSeed
import com.christopherluc.superformtest.api.QRCodeService
import com.christopherluc.superformtest.databinding.FragmentQrCodeBinding
import com.christopherluc.superformtest.qrcode.encodeAsBitmap
import com.google.android.material.snackbar.Snackbar
import io.reactivex.Completable
import io.reactivex.android.schedulers.AndroidSchedulers
import io.reactivex.disposables.CompositeDisposable
import io.reactivex.disposables.Disposable
import java.text.SimpleDateFormat
import java.util.*
import java.util.concurrent.TimeUnit

/**
 * Fragment that retrieves a QR code string from the API and displays it as a bitmap
 *
 */
class QRCodeFragment : androidx.fragment.app.Fragment() {

    private lateinit var binding: FragmentQrCodeBinding
    private val viewModel = ViewModel()
    private val disposable = CompositeDisposable()
    private var timer: Disposable? = null

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        binding = FragmentQrCodeBinding.inflate(inflater)
        binding.viewModel = viewModel
        return binding.root
    }

    override fun onDestroy() {
        super.onDestroy()
        disposable.takeUnless { it.isDisposed }?.dispose()
    }

    override fun onStop() {
        super.onStop()
        //Cancel the timer so that it doesn't execute while backgrounded
        timer?.takeUnless { it.isDisposed }?.dispose()
    }

    override fun onStart() {
        super.onStart()
        //Retrieve new qr code on start
        retrieveApiData()
        //TODO: A better approach would be to store the api data locally, either using live data or realm.  Would need more time to explore on how to set those up
    }

    /**
     * Used to retrieve data from api
     */
    private fun retrieveApiData() {
        viewModel.subText.set(getString(R.string.launch_screen_loading))
        viewModel.bitmap.set(null)
        //TODO Could use dagger to inject the service, which would allow that to be mocked out in testing
        disposable.add(QRCodeService.getSeed().observeOn(AndroidSchedulers.mainThread()).subscribe(this::handleApiSuccess, this::handleApiFailure))
    }

    /**
     * Handles a successful api response
     */
    private fun handleApiSuccess(data: QRCodeSeed) {
        viewModel.bitmap.set(encodeAsBitmap(data.seed, resources.getDimensionPixelSize(R.dimen.qr_code_dimen)))
        //TODO Instead of formatting an expiration date, a repeating completable can be used to update the remaining time.  But that seems wasteful unless the codes expires in less than a minute
        viewModel.setFormattedDate(data.expires_at, requireContext())
        scheduleTimeout(data.expires_at)
    }

    /**
     * Handles an api failure
     */
    private fun handleApiFailure(exception: Throwable) {
        Snackbar.make(binding.root, getString(R.string.launch_screen_error_snack_bar, RETRY_TIME_SECONDS), Snackbar.LENGTH_LONG).show()
        disposable.add(Completable.timer(RETRY_TIME_SECONDS, TimeUnit.SECONDS).subscribe { retrieveApiData() })
        Log.e(QRCodeFragment::class.java.simpleName, "Exception: ", exception)

    }

    /**
     * Sets a completable to fire off once the QR code has expired
     */
    private fun scheduleTimeout(date: Date?) {
        date?.run {
            //First check if passed in time is in the future
            if (time > System.currentTimeMillis()) {
                //and if so, schedule a task
                timer = Completable.timer(time - System.currentTimeMillis(), TimeUnit.MILLISECONDS).subscribe { retrieveApiData() }
            } else {
                //else just get the data now
                retrieveApiData()
            }
        }
    }

    companion object {
        private const val RETRY_TIME_SECONDS = 10L
    }
}

/**
 * Basic view model used to update layout
 */
class ViewModel {

    val bitmap = ObservableField<Bitmap>()
    val subText = ObservableField<String>()

    /**
     * Accepts a date object and then formats it to display properly
     */
    fun setFormattedDate(date: Date?, context: Context) {
        val text = date?.let {
            try {
                context.resources.getString(R.string.launch_screen_expires_at, SimpleDateFormat(FORMATTED_DATE, Locale.getDefault()).format(it))
            } catch (e: Throwable) {
                //Catch all errors since this is for formatting only.
                Log.e(ViewModel::class.java.simpleName, "Exception formatting date", e)
                ""
            }

        } ?: ""
        subText.set(text)
    }

    companion object {
        private const val FORMATTED_DATE = "MM/dd/yyyy HH:mm:ss"
    }
}