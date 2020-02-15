import 'package:flutter/material.dart';
import 'package:profile/resposive_widget.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.black,
        ),
        drawer: ResponsiveWidget.isSmallScreen(context)
            ? Drawer(
                child: ListView(
                padding: EdgeInsets.all(20),
                children: <Widget>[
                  NavButton(
                    text: 'about',
                    onPressed: () {},
                  ),
                  NavButton(
                    text: 'work',
                    onPressed: () {},
                  ),
                  NavButton(
                    text: 'contact',
                    onPressed: () {},
                  ),
                ],
              ))
            : null,
        body: SingleChildScrollView(
          child: AnimatedPadding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.1),
            duration: Duration(seconds: 1),
            child: ResponsiveWidget(
                largeScreen: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                NavHeader(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                ProfileInfo(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                SocialInfo()
              ],
            )),
          ),
        ),
      ),
    );
  }
}

class NavHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Row(
        mainAxisAlignment: ResponsiveWidget.isSmallScreen(context)
            ? MainAxisAlignment.center
            : MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          PMDot(),
          ResponsiveWidget.isSmallScreen(context)
              ? Container()
              : Row(children: <Widget>[
                  NavButton(
                    text: 'about',
                    onPressed: () {},
                  ),
                  NavButton(
                    text: 'work',
                    onPressed: () {},
                  ),
                  NavButton(
                    text: 'contact',
                    onPressed: () {},
                  ),
                ])
        ],
      ),
    );
  }
}

class PMDot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          'PM',
          textScaleFactor: 2,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 5),
        AnimatedContainer(
          duration: Duration(seconds: 1),
          height: 8,
          width: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.orange,
          ),
        ),
      ],
    );
  }
}

class NavButton extends StatelessWidget {
  final text;
  final onPressed;
  final Color color;

  NavButton(
      {@required this.text,
      @required this.onPressed,
      this.color = Colors.orange});

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      child: Text(text),
      borderSide: BorderSide(color: color),
      onPressed: onPressed,
      highlightedBorderColor: color,
    );
  }
}

class ProfileInfo extends StatelessWidget {
  profilePicture(context) => AnimatedContainer(
        duration: Duration(seconds: 2),
        height: ResponsiveWidget.isSmallScreen(context)
            ? MediaQuery.of(context).size.height * 0.25
            : MediaQuery.of(context).size.width * 0.25,
        width: ResponsiveWidget.isSmallScreen(context)
            ? MediaQuery.of(context).size.height * 0.25
            : MediaQuery.of(context).size.width * 0.25,
        decoration: BoxDecoration(
            color: Colors.orange,
            shape: BoxShape.circle,
            backgroundBlendMode: BlendMode.luminosity,
            image: DecorationImage(
                image: AssetImage('images/pm.png'),
                alignment: Alignment.center,
                fit: BoxFit.cover)),
      );

  final profileInfo = Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Hey There ! My Name is',
        textScaleFactor: 2,
        style: TextStyle(color: Colors.orange),
      ),
      Text('Pratham Malji',
          softWrap: true,
          textScaleFactor: 4,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      Text(
        "Computer Engineering\n"
        "Goa College of Engineering",
        softWrap: true,
        style: TextStyle(color: Colors.white70),
      ),
      SizedBox(height: 20),
      Row(
        children: <Widget>[
          RaisedButton(
            padding: EdgeInsets.all(10),
            onPressed: null,
            child: Text('Resume', style: TextStyle(color: Colors.white)),
            color: Colors.red,
            shape: StadiumBorder(),
          ),
          SizedBox(
            width: 20,
          ),
          OutlineButton(
            padding: EdgeInsets.all(10),
            borderSide: BorderSide(
              color: Colors.red,
            ),
            onPressed: null,
            child: Text('Say hi!', style: TextStyle(color: Colors.white)),
            shape: StadiumBorder(),
          ),
        ],
      )
    ],
  );
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
        largeScreen: Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[profilePicture(context), profileInfo],
        ),
        smallScreen: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            profilePicture(context),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            profileInfo
          ],
        ));
  }
}

class SocialInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              NavButton(
                text: 'Twitter',
                onPressed: () {},
                color: Colors.blue,
              ),
              NavButton(
                text: 'Github',
                onPressed: () {},
                color: Colors.blue,
              ),
              NavButton(
                text: 'Facebook',
                onPressed: () {},
                color: Colors.blue,
              ),
            ],
          ),
          Text(
            'Pratham Malji',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          )
        ],
      ),
      smallScreen: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          NavButton(
            text: 'Twitter',
            onPressed: () {},
            color: Colors.blue,
          ),
          NavButton(
            text: 'Github',
            onPressed: () {},
            color: Colors.blue,
          ),
          NavButton(
            text: 'Facebook',
            onPressed: () {},
            color: Colors.blue,
          ),
          Text(
            'Pratham Malji',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          )
        ],
      ),
    );
  }
}
