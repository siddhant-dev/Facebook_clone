import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/profile_avatar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  const PostContainer({
    Key key,
    @required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                PostHeader(post: post),
                const SizedBox(
                  height: 4.0,
                ),
                Text(post.caption),
                post.imageUrl != null
                    ? const SizedBox.shrink()
                    : const SizedBox(
                        height: 6.0,
                      )
              ],
            ),
          ),
          post.imageUrl != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CachedNetworkImage(imageUrl: post.imageUrl),
                )
              : const SizedBox.shrink(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: PostStats(post: post),
          )
        ],
      ),
    );
  }
}

class PostHeader extends StatelessWidget {
  final Post post;

  const PostHeader({
    Key key,
    @required this.post,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imageUrl: post.user.imageUrl),
        const SizedBox(
          width: 8.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Text(
                    '${post.timeAgo} - ',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12.0,
                    ),
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                    size: 12.0,
                  ),
                ],
              )
            ],
          ),
        ),
        IconButton(
          icon: Icon(Icons.more_horiz),
          onPressed: () => print('More'),
        )
      ],
    );
  }
}

class PostStats extends StatelessWidget {
  final Post post;
  final bool like = false;

  const PostStats({
    Key key,
    @required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: Palette.facebookBlue,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.thumb_up,
                size: 10.0,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 4.0,
            ),
            Expanded(
              child: Text(
                '${post.likes} Likes.',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
            Text(
              '${post.comments} Comments.',
              style: TextStyle(color: Colors.grey[600]),
            ),
            SizedBox(
              width: 8.0,
            ),
            Text(
              '${post.shares} Shared.',
              style: TextStyle(color: Colors.grey[600]),
            )
          ],
        ),
        const Divider(),
        Row(
          children: [
            LikeButton(),
            PostButton(
              icon: Icon(
                MdiIcons.commentOutline,
                size: 20.0,
                color: Colors.grey[600],
              ),
              label: 'Coment',
              onTap: () => print('Comment'),
            ),
            PostButton(
              icon: Icon(
                MdiIcons.shareOutline,
                size: 25.0,
                color: Colors.grey[600],
              ),
              label: 'Share',
              onTap: () => print('Share'),
            ),
          ],
        )
      ],
    );
  }
}

class PostButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final Function onTap;

  const PostButton({
    Key key,
    @required this.icon,
    @required this.label,
    @required this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            height: 25.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                const SizedBox(width: 4.0),
                Text(label),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class LikeButton extends StatefulWidget {
  bool like;
  @override
  _LikeButtonState createState() => _LikeButtonState(like);
}

class _LikeButtonState extends State<LikeButton> {
  bool like = false;
  _LikeButtonState(bool like);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        child: InkWell(
          onTap: () {
            setState(() {
              like = !like;
            });
            print('Liked');
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            height: 25.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                like
                    ? Icon(
                        MdiIcons.thumbUp,
                        size: 20.0,
                        color: Palette.facebookBlue,
                      )
                    : Icon(
                        MdiIcons.thumbUpOutline,
                        size: 20.0,
                        color: Colors.grey[600],
                      ),
                const SizedBox(width: 4.0),
                Text('Like'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
