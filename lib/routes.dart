import 'package:flutter/material.dart';
import 'package:rachit_dandriyal/common/blog.dart';
import 'package:rachit_dandriyal/mobile/about_mobile.dart';
import 'package:rachit_dandriyal/mobile/contact_mobile.dart';
import 'package:rachit_dandriyal/mobile/landing_page_mobile.dart';
import 'package:rachit_dandriyal/mobile/work_mobile.dart';
import 'package:rachit_dandriyal/web/about_web.dart';
import 'package:rachit_dandriyal/web/contact_web.dart';
import 'package:rachit_dandriyal/web/landing_page_web.dart';
import 'package:rachit_dandriyal/web/projects_web.dart';
import 'package:rachit_dandriyal/web/work_web.dart';

import 'mobile/projects_mobile.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return const LandingPageWeb();
              } else {
                return const LandingPageMobile();
              }
            },
          ),
        );
      case '/contact':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return const ContactWeb();
              } else {
                return const ContactMobile();
              }
            },
          ),
        );
      case '/about':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return const AboutWeb();
              } else {
                return const AboutMobile();
              }
            },
          ),
        );
      case '/blog':
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => LayoutBuilder(builder: (context, constraints) {
                  return const Blog();
                }));
      case '/works':
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => LayoutBuilder(builder: (context, constraints) {
                  if (constraints.maxWidth > 800) {
                    return const WorkWeb();
                  } else {
                    return const WorkMobile();
                  }
                }));
      case '/projects':
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => LayoutBuilder(builder: (context, constraints) {
                  if (constraints.maxWidth > 800) {
                    return const ProjectsWeb();
                  } else {
                    return const ProjectsMobile();
                  }
                }));
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return const LandingPageWeb();
              } else {
                return const LandingPageMobile();
              }
            },
          ),
        );
    }
  }
}
