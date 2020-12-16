package com.yjf.yjfshow.adapter

import android.app.Activity
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.databinding.DataBindingUtil
import androidx.recyclerview.widget.RecyclerView
import com.yjf.yjfshow.R
import com.yjf.yjfshow.bean.ActionBean
import com.yjf.yjfshow.databinding.ItemAdapterActionBinding
import com.yjf.yjfshow.util.YJFADUtils

/**
 * @author CWQ
 * @date 12/16/20
 */
class ActionAdapter(private val datas: List<ActionBean>) : RecyclerView.Adapter<ActionHolder>() {

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ActionHolder {
        val view =
            LayoutInflater.from(parent.context).inflate(R.layout.item_adapter_action, parent, false)
        return ActionHolder(view)
    }

    override fun onBindViewHolder(holder: ActionHolder, position: Int) {
        holder.bindData(datas[position])
    }

    override fun getItemCount(): Int {
        return datas.size
    }
}

class ActionHolder(view: View) : RecyclerView.ViewHolder(view) {

    private val binding: ItemAdapterActionBinding by lazy {
        requireNotNull(DataBindingUtil.bind(view))
    }

    fun bindData(bean: ActionBean) {
        binding.ivPic.setImageResource(bean.image)
        binding.ivPic.setOnClickListener {
            YJFADUtils.goYJFNoEntrance(
                binding.root.context as Activity,
                bean.mid,
                "ActionAdapter"
            )
        }
    }
}