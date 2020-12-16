package com.yjf.yjfshow

import android.app.Application
import android.content.Context
import androidx.multidex.MultiDex
import com.emar.reward.manager.EmarAdManager
import com.yjf.yjfshow.util.YJFADUtils

/**
 * @author CWQ
 * @date 12/15/20
 */
class App : Application() {

    override fun onCreate() {
        super.onCreate()

        EmarAdManager.getInstance().init(this, YJFADUtils.MEDIA_ID).isLogSwitch(true)
    }


    override fun attachBaseContext(base: Context?) {
        super.attachBaseContext(base)
        MultiDex.install(this)
    }
}