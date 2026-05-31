import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:makanek/core/injection/core_injection.dart';
import 'package:makanek/core/routes/routes.dart';
import 'package:makanek/core/utils/responisve_utils.dart';
import 'package:makanek/core/utils/shared/reusable/app_text.dart';
import 'package:makanek/features/ads/ads_banner.dart';
import 'package:makanek/features/category/presentation/pages/category_page.dart';
import 'package:makanek/features/dropdownmenu/dropdown.dart';
import 'package:makanek/features/getname/presentation/pages/getname.dart';
import 'package:makanek/features/profileavatar/presentation/widget/avatar.dart';
import 'package:makanek/features/search/presentation/bloc/search_bloc.dart';
import 'package:makanek/features/search/presentation/widget/searchbar.dart';
import 'package:makanek/features/settings/presentation/setting.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return BlocProvider(
      create: (_) => getIt<SearchBloc>(),
      child: Builder(
        builder: (context) => BlocListener<SearchBloc, SearchState>(
          listener: (context, state) {
            if (state is SearchSuccess) {
              Navigator.pushNamed(
                context,
                AppRoutes.search,
                arguments: state.results,
              );
            }
          },
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: SvgPicture.asset('assets/images/logo.svg', width: 45),
              leading: IconButton(
                onPressed: () => SettingsDrawer.show(context),
                icon: Icon(Icons.settings, color: colors.primary),
                iconSize: 30,
              ),
              centerTitle: true,
            ),
            body: SafeArea(
              child: Column(
                children: [
                  SizedBox(height: 24),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: context.horizontal * 0.5),
                    child: Row(children: [
                      Getname(
                        showHi: true,
                        fontWeight: FontWeight.bold,
                        textSize: 30,
                        textColor: colors.primary,
                      ),
                      Spacer(),
                      UserDropdownMenu(),
                      AvatarWidget(raduis: 25, fontSize: null),
                    ]),
                  ),
                  SizedBox(height: context.vertical * 0.2),
                 SearchBarWidget(
                    controller: _searchController,
                    onChanged: (value) {
                      if (value.isEmpty) {
                        context.read<SearchBloc>().add(const SearchFinished());
                      }
                    },
                    onSubmitted: (value) {
                      if (value.length >= 3) {
                        context.read<SearchBloc>().add(SearchStarted(query: value));
                      }
                    },
                  ),
                  SizedBox(height: context.vertical),
                  Expanded(child:SingleChildScrollView(child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: context.horizontal),
                        child: AppText(
                          text: 'Categories',
                          textSize: 10,
                          textAlign: TextAlign.left,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      CategoryPage(),
                      SizedBox(height: context.vertical),
                       Padding(
                        padding: EdgeInsets.symmetric(horizontal: context.horizontal,vertical: context.vertical/2.5),
                        child: AppText(
                          text: 'Explore',
                          textSize: 10,
                          textAlign: TextAlign.left,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      AdsBanner(),
                    ],
                  ),
              ))],
              ),
            ),
          ),
        ),
      ),
    );
  }
}