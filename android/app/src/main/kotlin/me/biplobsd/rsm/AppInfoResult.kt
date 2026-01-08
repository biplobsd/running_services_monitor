package me.biplobsd.rsm

import android.os.Parcel
import android.os.Parcelable

data class AppInfoResult(
    val packageName: String,
    val appName: String,
    val icon: ByteArray?,
    val isSystemApp: Boolean
) : Parcelable {
    constructor(parcel: Parcel) : this(
        parcel.readString() ?: "",
        parcel.readString() ?: "",
        parcel.createByteArray(),
        parcel.readByte() != 0.toByte()
    )

    override fun writeToParcel(parcel: Parcel, flags: Int) {
        parcel.writeString(packageName)
        parcel.writeString(appName)
        parcel.writeByteArray(icon)
        parcel.writeByte(if (isSystemApp) 1 else 0)
    }

    override fun describeContents(): Int = 0

    companion object CREATOR : Parcelable.Creator<AppInfoResult> {
        override fun createFromParcel(parcel: Parcel): AppInfoResult = AppInfoResult(parcel)
        override fun newArray(size: Int): Array<AppInfoResult?> = arrayOfNulls(size)
    }
}
