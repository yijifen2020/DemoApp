package com.yjf.yjfshow.adapter

import androidx.fragment.app.Fragment
import androidx.fragment.app.FragmentActivity
import androidx.viewpager2.adapter.FragmentStateAdapter
import com.yjf.yjfshow.ui.ActionFragment
import com.yjf.yjfshow.ui.HomeFragment
import com.yjf.yjfshow.util.YJFADUtils

/**
 * @author CWQ
 * @date 12/15/20
 */
class TabPagerAdapter(private val fragmentActivity: FragmentActivity) :
    FragmentStateAdapter(fragmentActivity) {

    override fun getItemCount(): Int {
        return 3
    }

    override fun createFragment(position: Int): Fragment {
        return when (position) {
            0 -> HomeFragment()
            1 -> ActionFragment()
            else -> YJFADUtils.createYJFFragment(fragmentActivity, 100012)
        }
    }
}