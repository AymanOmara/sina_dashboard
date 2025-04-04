abstract interface class IUpdateAble<T> {
  void onUpdate(T data);

  void onAdd(T data);
}
