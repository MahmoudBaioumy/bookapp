import 'package:bookapp/features/home/presentation/manager/all_products_cubit/all_products_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/serves_locator.dart';
import '../../../data/models/all_prodtcus_model.dart';
import '../../../data/repo/home_repo.dart';
import '../../../data/repo/home_repo_impl.dart';

class AllProductsCubit extends Cubit<AllProductsState> {
  AllProductsCubit() : super(AllProductsInitial());
  HomeRepo homeRepo= getit.get<HomeRepoImpl>();

  AllProductsModel? allProductsModel;
  Future<void> getAllProducts(RequestTypes requestTypes) async {
// //-------------------------- هنا بنقول لو عدد الصفحات بيساوي اخر صفحه متعملش حاجه -------------------------
    if(requestTypes==RequestTypes.pagination){
      if(allProductsModel?.data?.meta?.currentPage==allProductsModel?.data?.meta?.lastPage){
        return ;
      }
      // //-------------------------- وهنا في حاله انه ريلود بيخلي موديل ب null عشان يضيف الداتا كلها --------------------------
    }else if(requestTypes==RequestTypes.reload){
      allProductsModel=null;
      // -------------------------- init state 3ady -------------------------- //
    }else{
      if(allProductsModel!=null){
        return ;
      }
    }
    emit(AllProductsLoadingState());
    var result = await homeRepo .getAllProducts(
      requestTypes==RequestTypes.pagination
          ?allProductsModel!.data!.meta!.currentPage!
          :0
    );
    result.fold((failure) {
      emit(AllProductsFailureState(failure.errMessage));
    }, (r) {
      if(requestTypes==RequestTypes.pagination){
        allProductsModel=AllProductsModel(
          data:Data(
            meta:r.data?.meta ,
            products: [

              ...?allProductsModel?.data?.products,
              ...?r.data?.products
            ]
          ) ,
        );
      }else{
        allProductsModel=r;
      }
      emit(AllProductsSuccessState(r));
    });
  }
}
// -------------------------- types of Request -------------------------- //
enum RequestTypes{
  init,
  reload,
  pagination
}