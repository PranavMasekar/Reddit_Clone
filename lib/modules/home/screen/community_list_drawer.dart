import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_clone/common/widgets/error_text.dart';
import 'package:reddit_clone/common/widgets/loader.dart';
import 'package:reddit_clone/models/community_model.dart';
import 'package:reddit_clone/modules/community/controller/community_controller.dart';
import 'package:routemaster/routemaster.dart';

class CommunityListDrawer extends ConsumerWidget {
  const CommunityListDrawer({super.key});

  void navigateToCreateCommunity(BuildContext context) {
    Routemaster.of(context).push('/create-community');
  }

  void navigateToCommunity(BuildContext context, Community community) {
    Routemaster.of(context).push('/r/${community.name}');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final user = ref.watch(userProvider)!;
    // final isGuest = !user.isAuthenticated;

    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            ListTile(
              title: Text("Create a community"),
              leading: Icon(Icons.add),
              onTap: () => navigateToCreateCommunity(context),
            ),
            ref.watch(userCommunitiesProvider).when(
              data: (communities) {
                return ListView.builder(
                  itemCount: communities.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final community = communities[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(community.avatar),
                      ),
                      title: Text('r/${community.name}'),
                      onTap: () {
                        navigateToCommunity(context, community);
                      },
                    );
                  },
                );
              },
              error: (error, stackTrace) {
                return ErrorText(error: error.toString());
              },
              loading: () {
                return Loader();
              },
            )
          ],
        ),
      ),
    );
  }
}
