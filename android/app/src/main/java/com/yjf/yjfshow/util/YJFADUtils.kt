package com.yjf.yjfshow.util

import android.app.Activity
import android.content.Context
import android.content.Intent
import android.util.Log
import android.widget.FrameLayout
import android.widget.Toast
import com.emar.reward.ads.banner.BannerADListener
import com.emar.reward.ads.banner.EmarBannerAD
import com.emar.reward.ads.noentrance.NoEntranceAD
import com.emar.reward.ads.noentrance.OutputADListener
import com.emar.reward.ads.yjf.YJFFragment
import com.emar.reward.bean.PicInfoBean
import com.emar.reward.error.EmarAdError
import com.emar.reward.manager.EmarAdManager
import com.yjf.yjfshow.ui.SetUserActivity

/**
 * @author CWQ
 * @date 12/16/20
 */
object YJFADUtils {

    //媒体ID
    const val MEDIA_ID = "3828"



    /**
     * 加载banner广告位
     * @param frameLayout FrameLayout
     * @param actionId String 广告位ID
     * @param tag String
     */
    fun loadBannerAD(frameLayout: FrameLayout, actionId: String, tag: String) {
        val emarBanner = EmarBannerAD(frameLayout.context, actionId, object : BannerADListener {
            override fun onADLoaded() {
                Log.d(tag, "onADLoaded")
            }

            override fun onNoAd(error: EmarAdError?) {
                Log.d(tag, "onNoAd:$error")
            }

            override fun onADShow() {
                Log.d(tag, "onADShow")
            }

            override fun onADClick() {
                Log.d(tag, "onADClick")
            }
        })
        emarBanner.loadAD(frameLayout)
    }


    /**
     * 跳转无入口活动
     * @param activity Activity
     * @param actionId String 广告位ID
     * @param tag String
     */
    fun goNoEntranceAD(activity: Activity, actionId: String, tag: String) {
        val noEntranceAD = NoEntranceAD(activity, actionId)
        noEntranceAD.setOutputADListener(object : OutputADListener {
            override fun onPicInfoLoad(infoBean: MutableList<PicInfoBean>?) {
                Log.d(tag, "onPicInfoLoad")
            }

            override fun onVideoLoad() {
                Log.d(tag, "onVideoLoad")
            }

            override fun onADShow() {
                Log.d(tag, "onPicInfoLoad")
            }

            override fun onADClick() {
                Log.d(tag, "onADClick")
            }

            override fun onReward() {
                Log.d(tag, "onReward")
            }

            override fun onVideoComplete() {
                Log.d(tag, "onVideoComplete")
            }

            override fun onADClose() {
                Log.d(tag, "onADClose")
            }

            override fun onLoadActivity() {
                Log.d(tag, "onLoadActivity")
            }

            override fun onError(error: EmarAdError?) {
                Log.d(tag, "onError:$error")
            }
        })
        noEntranceAD.loadAD()
    }


    /**
     * 创建易积分商城fragment
     * @param context Context
     * @param mid Int 活动ID
     * @return YJFFragment
     */
    fun createYJFFragment(context: Context, mid: Int): YJFFragment {
        val yjfFragment = YJFFragment.newInstance(mid)
        yjfFragment.setOnLoginListener {
            Log.e("YJFADUtil", "need login")
            Toast.makeText(context, "需要设置用户ID~", Toast.LENGTH_SHORT).show()
            context.startActivity(Intent(context, SetUserActivity::class.java))
        }
        return yjfFragment
    }


    /**
     * 设置媒体用户ID
     * @param userid String
     */
    fun setUserId(userid: String) {
        EmarAdManager.getInstance().userId = userid
    }
}