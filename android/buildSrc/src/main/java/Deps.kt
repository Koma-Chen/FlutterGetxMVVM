object Deps {

    const val retrofit = "com.squareup.retrofit2:retrofit:${Versions.retrofit}"
    const val retrofitConverter = "com.squareup.retrofit2:converter-gson:${Versions.retrofit}"

    //动态替换BaseUrl库 使用可参考 https://github.com/JessYanCoding/RetrofitUrlManager
    const val retrofitUrlManager = "me.jessyan:retrofit-url-manager:${Versions.retrofitUrlManager}"

    val appcompat = "androidx.appcompat:appcompat:${Versions.appcompat}"
    val ktxCore = "androidx.core:core-ktx:${Versions.ktxCore}"
    val material = "com.google.android.material:material:${Versions.material}"
    val constraintlayout =
        "androidx.constraintlayout:constraintlayout:${Versions.constraintlayout}"
    val swiperefreshlayout = "androidx.swiperefreshlayout:swiperefreshlayout:${Versions.swiperefreshlayout}"
    val kotlinStdlib = "org.jetbrains.kotlin:kotlin-stdlib:${Versions.kotlinVersion}"
    val okhttp = "com.squareup.okhttp3:okhttp:${Versions.okhttp}"
    val gson = "com.google.code.gson:gson:${Versions.gson}"
    val glide = "com.github.bumptech.glide:glide:${Versions.glide}"
    val glideCompiler = "com.github.bumptech.glide:compiler:${Versions.glide}"
    val mmkv = "com.tencent:mmkv-static:${Versions.mmkv}"
    val autosize = "me.jessyan:autosize:${Versions.autosize}"
    val multidex = "com.android.support:multidex:${Versions.multidex}"


    ///lifecycle
    val lifecycleRunTimeKtx =
        "androidx.lifecycle:lifecycle-runtime-ktx:${Versions.lifecycleRunTimeKtx}"
    val lifecycleCommon =
        "androidx.lifecycle:lifecycle-common-java8:${Versions.lifecycleRunTimeKtx}"
    val lifecycleExtensions = "androidx.lifecycle:lifecycle-extensions:${Versions.lifecycleExtensions}"
    val lifecycleViewmodel = "androidx.lifecycle:lifecycle-viewmodel-ktx:${Versions.lifecycleViewmodel}"
    val lifecycleFragment = "androidx.fragment:fragment-ktx:${Versions.lifecycleFragment}"

    ///liveData
    val livedata = "androidx.lifecycle:lifecycle-livedata-ktx:${Versions.lifecycleLivedata}"
    val unpeekLivedata = "com.kunminx.archi:unpeek-livedata:${Versions.unpeekLivedata}-beta1"
    val navigation = "androidx.navigation:navigation-runtime-ktx:${Versions.navigation}"
    val persistentCookieJar = "com.github.franmontiel:PersistentCookieJar:v${Versions.persistentCookieJar}"
    val filedownloader = "com.liulishuo.filedownloader:library:${Versions.filedownloader}"
    val baseAdapter = "com.github.CymChad:BaseRecyclerViewAdapterHelper:${Versions.baseAdapter}"
    val materialDialogLifecycle = "com.afollestad.material-dialogs:lifecycle:${Versions.materialDialog}"
    val materialDialogLifecore = "com.afollestad.material-dialogs:core:${Versions.materialDialog}"
    val materialDialogLifecolor = "com.afollestad.material-dialogs:color:${Versions.materialDialog}"
    val materialDialogLifedatetime = "com.afollestad.material-dialogs:datetime:${Versions.materialDialog}"
    val materialDialogLifebottomsheets = "com.afollestad.material-dialogs:bottomsheets:${Versions.materialDialog}"
    val loadSir = "com.kingja.loadsir:loadsir:${Versions.loadSir}"
    val recyclerview2 = "com.yanzhenjie.recyclerview:x:${Versions.recyclerview}"
    val utilcodex = "com.blankj:utilcodex:${Versions.utilcodex}"
    val magicIndicator = "com.github.hackware1993:MagicIndicator:${Versions.magicIndicator}"
    val crashPage = "cat.ereza:customactivityoncrash:${Versions.crashPage}"
    val gsonFactory = "com.github.getActivity:GsonFactory:5.2"

}
