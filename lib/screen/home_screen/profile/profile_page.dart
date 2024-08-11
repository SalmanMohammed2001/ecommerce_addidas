import 'package:ecommerce_addidas/components/custom_button/custom_button1.dart';
import 'package:ecommerce_addidas/components/custom_text_field/custom_text_field1.dart';
import 'package:ecommerce_addidas/provider/auth_provider.dart';
import 'package:ecommerce_addidas/provider/profile_provider.dart';
import 'package:ecommerce_addidas/screen/home_screen/admin/admin_page.dart';
import 'package:ecommerce_addidas/utils/CustomNavigator.dart';
import 'package:ecommerce_addidas/utils/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _FavouriteState();
}

class _FavouriteState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(

        body: Consumer2<AuthProviders, ProfileProvider>(
        builder: (context, auth, profile, child) {
      return Column(
        children: [
          SizedBox(
            height: 200,
            child: Stack(
              children: [
                Container(
                  height: 150,
                  decoration: const BoxDecoration(
                      color: Colors.grey,
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUJSkrAcW29psutoQMzizD2fhDzHF5reSHezbCX8pE7DsSH4feRNtCP1WzVFXOHGjpDMs&usqp=CAU"),
                          fit: BoxFit.cover)),
                ),
                InkWell(
                  onTap: () {
                  profile.pickProfileImage(context);
                  },
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: profile.pickImage==null ? NetworkImage(auth.userModel!.image) : FileImage(profile.pickImage!) as ImageProvider,
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: 6,
                              right: 6,
                              child: CircleAvatar(
                                backgroundColor: Colors.black.withOpacity(0.5),
                                radius: 15,
                                child: Icon(
                                  Icons.edit,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      )),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CustomTextField1(
                    label: "user name",
                    prefixIcon: Icons.person,
                    controller: profile.nameController),
                const SizedBox(
                  height: 15,
                ),
                CustomButton1(
                  size: size,
                  text: "Update",
                  bgColor: Colors.deepOrange,
                  onTap: () {
                    profile.updateUserData(context);
                  },
                )
              ],
            ),
          )
        ],
      );
    }
    ),
      floatingActionButton: FloatingActionButton(onPressed: () {

        CustomNavigator.goTo(context, const AdminPage());

      },child: const Icon(Icons.admin_panel_settings),),
    );
  }
}
