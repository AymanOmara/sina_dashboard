import 'package:bloc/bloc.dart';
import 'package:domain/features/products/entity/fetch_product_request.dart';
import 'package:ibn_sina_flutter/features/home/display/home_category_display.dart';
import 'package:meta/meta.dart';

part 'student_equipments_state.dart';

class StudentEquipmentsCubit extends Cubit<StudentEquipmentsState> {
  StudentEquipmentsCubit(this.category) : super(StudentEquipmentsInitial());
  final HomeCategoryDisplay category;
  FetchProductsRequest request = FetchProductsRequest();

  bool get firstYear => request.firstYear;

  bool get secondYear => request.secondYear;

  bool get thirdYear => request.thirdYear;

  bool get fourthYear => request.fourthYear;

  bool get fifthYear => request.fifthYear;

  bool get other => request.otherEquipment;

  bool get teeth => request.teeth;

  bool get clothes => request.clothes;

  void changeFirstYear() {
    request.firstYear = !request.firstYear;
    emit(StudentEquipmentsInitial());
  }

  void changeSecondYear() {
    request.secondYear = !request.secondYear;
    emit(StudentEquipmentsInitial());
  }

  void changeThirdYear() {
    request.thirdYear = !request.thirdYear;
    emit(StudentEquipmentsInitial());
  }

  void changeFourthYear() {
    request.fourthYear = !request.fourthYear;
    emit(StudentEquipmentsInitial());
  }

  void changeFifthYear() {
    request.fifthYear = !request.fifthYear;
    emit(StudentEquipmentsInitial());
  }

  void changeOther() {
    request.otherEquipment = !request.otherEquipment;
    emit(StudentEquipmentsInitial());
  }

  void changeClothes() {
    request.clothes = !request.clothes;
    emit(StudentEquipmentsInitial());
  }

  void changeTeeth() {
    request.teeth = !request.teeth;
    emit(StudentEquipmentsInitial());
  }
}
