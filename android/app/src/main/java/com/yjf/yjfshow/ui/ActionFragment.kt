package com.yjf.yjfshow.ui

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.databinding.DataBindingUtil
import androidx.fragment.app.Fragment
import androidx.recyclerview.widget.GridLayoutManager
import com.yjf.yjfshow.R
import com.yjf.yjfshow.adapter.ActionAdapter
import com.yjf.yjfshow.bean.ActionBean
import com.yjf.yjfshow.databinding.FragmentActionBinding

/**
 * @author CWQ
 * @date 12/15/20
 */
class ActionFragment : Fragment() {

    lateinit var mBinding: FragmentActionBinding


    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        mBinding = DataBindingUtil.inflate(inflater, R.layout.fragment_action, container, false)
        return mBinding.root
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        initData()
    }

    private fun initData() {
        //轻活动
        val lightActions = listOf(
            ActionBean(R.mipmap.icon_chips, "adhu8b81d5be237a44dd",8122),
            ActionBean(R.mipmap.icon_tree, "adhu26a184532fc345b4",8123),
            ActionBean(R.mipmap.icon_redpacket, "adhu08ff8bd54c2f4da1",8124),
            ActionBean(R.mipmap.icon_phrase, "adhu670cd216b0cd424a",8125)
        )
        //养成活动
        val feedActions = listOf(
            ActionBean(R.mipmap.icon_redfarm, "adhu5f62a396be8b4973",8126),
            ActionBean(R.mipmap.icon_pigs, "adhue47a2fed970f46ee",8127)
        )


        val lightAdapter = ActionAdapter(lightActions)
        val feedAdapter = ActionAdapter(feedActions)

        mBinding.rvLight.adapter = lightAdapter
        mBinding.rvLight.layoutManager = GridLayoutManager(context, 2)
        mBinding.rvFeed.adapter = feedAdapter
        mBinding.rvFeed.layoutManager = GridLayoutManager(context, 2)
    }
}