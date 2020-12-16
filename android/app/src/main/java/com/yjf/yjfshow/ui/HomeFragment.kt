package com.yjf.yjfshow.ui

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.databinding.DataBindingUtil
import androidx.fragment.app.Fragment
import com.yjf.yjfshow.R
import com.yjf.yjfshow.databinding.FragmentHomeBinding
import com.yjf.yjfshow.util.YJFADUtils

/**
 * @author CWQ
 * @date 12/15/20
 */
class HomeFragment : Fragment() {

    lateinit var mBinding: FragmentHomeBinding

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        mBinding = DataBindingUtil.inflate(inflater, R.layout.fragment_home, container, false)
        mBinding.home = this
        return mBinding.root
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)


    }


    fun clickHeaderBtn(){
        //跳转无入口广告
        YJFADUtils.goYJFNoEntrance(requireActivity(),8121, TAG)
    }

    fun clickFloatBtn() {
        //跳转无入口广告
        YJFADUtils.goYJFNoEntrance(requireActivity(),8119, TAG)
    }


    companion object {
        const val TAG = "HomeFragment"
    }
}