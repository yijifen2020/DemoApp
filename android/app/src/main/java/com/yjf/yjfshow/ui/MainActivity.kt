package com.yjf.yjfshow.ui

import android.graphics.Color
import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import androidx.databinding.DataBindingUtil
import androidx.viewpager2.widget.ViewPager2
import com.yjf.yjfshow.R
import com.yjf.yjfshow.adapter.TabPagerAdapter
import com.yjf.yjfshow.databinding.ActivityMainBinding

class MainActivity : AppCompatActivity() {

    lateinit var mBinding: ActivityMainBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        mBinding = DataBindingUtil.setContentView(this, R.layout.activity_main)
        mBinding.lifecycleOwner = this
        mBinding.mainActivity = this
        init()
    }

    private fun init() {
        mBinding.ivTabAction.clearColorFilter()
        mBinding.ivTabStore.clearColorFilter()
        mBinding.mainVp.adapter = TabPagerAdapter(this)
        mBinding.mainVp.isUserInputEnabled = false
        mBinding.mainVp.registerOnPageChangeCallback(object : ViewPager2.OnPageChangeCallback() {
            override fun onPageSelected(position: Int) {
                when (position) {
                    0 -> {
                        mBinding.ivTabHome.clearColorFilter()
                        mBinding.ivTabAction.setColorFilter(Color.parseColor("#666666"))
                        mBinding.ivTabStore.setColorFilter(Color.parseColor("#666666"))
                    }
                    1 -> {
                        mBinding.ivTabHome.setColorFilter(Color.parseColor("#666666"))
                        mBinding.ivTabAction.clearColorFilter()
                        mBinding.ivTabStore.setColorFilter(Color.parseColor("#666666"))
                    }
                    else -> {
                        mBinding.ivTabHome.setColorFilter(Color.parseColor("#666666"))
                        mBinding.ivTabAction.setColorFilter(Color.parseColor("#666666"))
                        mBinding.ivTabStore.clearColorFilter()
                    }
                }
            }
        })
    }

    fun clickTab(position:Int){
        mBinding.mainVp.currentItem = position
    }
}