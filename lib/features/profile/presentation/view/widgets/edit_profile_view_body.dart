import 'package:bookapp/core/extension/translate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_routes.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/lang/string_language_manager.dart';
import '../../../../../core/utils/serves_locator.dart';
import '../../../../../core/utils/value_manager.dart';
import '../../../../../core/widgets/custom_but.dart';
import '../../../data/repo/profile_repo_impl.dart';
import '../../manager/cubit/profile_cubit.dart';
import '../../manager/cubit/profile_states.dart';
import 'custom_text_form_field.dart';
import 'header_container_build.dart';

class EditProfileViewBody extends StatefulWidget {
  const EditProfileViewBody({super.key, this.token});

  final String? token;

  @override
  State<EditProfileViewBody> createState() => _EditProfileViewBodyState();
}

class _EditProfileViewBodyState extends State<EditProfileViewBody> {
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController cityController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    cityController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(getit.get<ProfileRepoImpl>())
        ..getProfile(token: widget.token ?? ''),
      child: SafeArea(
        child: Scaffold(
          body: BlocConsumer<ProfileCubit, ProfileStates>(
            listener: (context, state) {
              if (state is updateprofileleSuccessStates) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Profile Updated Successfully!')),
                );
                GoRouter.of(context).push(AppRouter.kbottomnavView);
              }
              if (state is updateprofileleFailureStates) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.errMassage),
                  backgroundColor: Colors.green,
                  ),
                );
              }
            },
            builder: (context, state) {
              var cubit = context.read<ProfileCubit>();

              return Column(
                children: [
                  HeaderContainerBuild(
                    image: 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                  ),
                  SizedBox(height: AppSize.s10),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: _buildBodyContent(state, context),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildBodyContent(ProfileStates state, BuildContext context) {
    if (state is profileLoadingStates) {
      return Center(child: CircularProgressIndicator(color: ColorsManager.bluecolor));
    }

    if (state is profileSuccessStates) {
      return _buildProfileForm(context, state);
    }

    return SizedBox.shrink(); // Default empty state if nothing else matches
  }

  Widget _buildProfileForm(BuildContext context, profileSuccessStates state) {
    var profile = state.showProfileModel.data;

    nameController.text = profile?.name ?? '';
    phoneController.text = profile?.phone ?? '';
    cityController.text = profile?.city ?? '';

    return SingleChildScrollView(
      child: Column(
        children: [
          _buildProfileTextField(profile?.name ?? '', nameController, Icons.person),
          SizedBox(height: AppSize.s30),
          _buildProfileTextField(profile?.email ?? '', null, Icons.email, isReadOnly: true),
          SizedBox(height: AppSize.s30),
          _buildProfileTextField(profile?.phone ?? '', phoneController, Icons.phone, keyboardType: TextInputType.phone),
          SizedBox(height: AppSize.s30),
          _buildProfileTextField(profile?.city ?? '', cityController, Icons.location_city),
          SizedBox(height: AppSize.s30),
          BlocBuilder<ProfileCubit, ProfileStates>(
            builder: (context, state) {
              if (state is updateprofileleLoadingStates) {
                return CircularProgressIndicator();
              } else {
                return CustomButton(
                  text: AppStringsLanguage.updateProfileButton.trans(),
                  onPressed: () {
                    context.read<ProfileCubit>().updateProfile(
                      name: nameController.text,
                      phone: phoneController.text,
                      city: cityController.text,
                    );
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProfileTextField(String label, TextEditingController? controller, IconData icon, {bool isReadOnly = false, TextInputType? keyboardType}) {
    return TextFormFiledProfile(
      name: label,
      controller: controller,
      icon: Icon(icon, color: ColorsManager.bluecolor),
      type: isReadOnly,
      keyboardType: keyboardType,
    );
  }
}
