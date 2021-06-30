package androidx.databinding;

public class DataBinderMapperImpl extends MergedDataBinderMapper {
  DataBinderMapperImpl() {
    addMapper(new com.koma.flutterdemo.DataBinderMapperImpl());
  }
}
