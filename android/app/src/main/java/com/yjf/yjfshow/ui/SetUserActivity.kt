package com.yjf.yjfshow.ui

import android.os.Bundle
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import androidx.databinding.DataBindingUtil
import com.yjf.yjfshow.R
import com.yjf.yjfshow.databinding.ActivitySetuserBinding
import com.yjf.yjfshow.util.YJFADUtils

/**
 * @author CWQ
 * @date 12/16/20
 */
class SetUserActivity : AppCompatActivity() {

    lateinit var mBinding: ActivitySetuserBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        mBinding = DataBindingUtil.setContentView(this, R.layout.activity_setuser)
        mBinding.lifecycleOwner = this
        mBinding.activity = this
    }


    fun doSubmit() {
        val inputs = mBinding.etUser.text.toString().trim()
        if (inputs.isNullOrEmpty()) {
            Toast.makeText(this, "请输入用户ID", Toast.LENGTH_SHORT).show()
        } else {
            YJFADUtils.setUserId(inputs)
            Toast.makeText(this, "设置成功！", Toast.LENGTH_SHORT).show()
            finish()
        }
    }
}