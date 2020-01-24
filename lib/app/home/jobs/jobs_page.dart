import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
<<<<<<< HEAD
<<<<<<< HEAD
import 'package:time_tracker/app/home/job_entries/job_entries_page.dart';

import 'package:time_tracker/app/home/jobs/job_list_tile.dart';
=======
import 'package:time_tracker/app/home/jobs/add_job_page.dart';
>>>>>>> parent of 91fac26... updates
=======
import 'package:time_tracker/app/home/jobs/add_job_page.dart';
>>>>>>> parent of 91fac26... updates
import 'package:time_tracker/app/home/models/job.dart';
import 'package:time_tracker/common_widgets/platform_alert_dialog.dart';
import 'package:time_tracker/common_widgets/platform_exception_alert_dialog.dart';
import 'package:time_tracker/services/auth.dart';
import 'package:time_tracker/services/database.dart';
<<<<<<< HEAD
<<<<<<< HEAD
import 'package:flutter/services.dart';
import 'edit_job_page.dart';
import 'list_items_builder.dart';
=======
=======
>>>>>>> parent of 91fac26... updates


>>>>>>> parent of 91fac26... updates

class JobsPage extends StatelessWidget {
  Future<void> _signOut(BuildContext context) async {
    // Sending a request to firebase to authenticate
    try {
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth
          .signOut(); // Sign in anonymously returns a future which returns a box with a value which won't be available immediately
    } catch (e) {
      print(
        e.toString(),
      );
    }
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    final didRequestSignOut = await PlatformAlertDialog(
      title: 'Logout',
      content: 'Are you sure that you want to logout?',
      cancelActionText: 'Cancel',
      defaultActionText: 'Logout',
    ).show(context);
    if (didRequestSignOut == true) {
      _signOut(context);
    }
  }

<<<<<<< HEAD
<<<<<<< HEAD
  Future<void> _delete(BuildContext context, Job job) async {
    try {
      final database = Provider.of<Database>(context, listen: false);
      await database.deleteJob(job);
    } on PlatformException catch (e) {
      PlatformExceptionAlertDialog(
        // Shows error when signing in
        title: 'Operation failed',
        exception: e,
      ).show(context);
    }
  }
=======

>>>>>>> parent of 91fac26... updates
=======

>>>>>>> parent of 91fac26... updates

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jobs'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add, color: Colors.white),
            onPressed: () => EditJobPage.show(
              context,
              database: Provider.of<Database>(context, listen: false),
            ),
          ),
          FlatButton(
            child: Text(
              'Logout',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
            onPressed: () => _confirmSignOut(context),
          ),
        ],
      ),
      body: _buildContents(context),
<<<<<<< HEAD
=======
      floatingActionButton: FloatingActionButton(
        // Button on bottom right
        child: Icon(Icons.add),
        onPressed: () => AddJobPage.show(context),
      ),
>>>>>>> parent of 91fac26... updates
    );
  }

  Widget _buildContents(BuildContext context) {
    final database = Provider.of<Database>(context, listen: false);
    return StreamBuilder<List<Job>>(
      stream: database.jobsStream(),
      builder: (context, snapshot) {
<<<<<<< HEAD
        return ListItemsBuilder<Job>(
          snapshot: snapshot,
          itemBuilder: (context, job) => Dismissible(
            key: Key('job-${job.id}'),
            background: Container(color: Colors.red),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) => _delete(context, job),
            child: JobListTile(
              job: job,
              onTap: () => JobEntriesPage.show(context, job),
            ),
          ),
        );
=======
        if (snapshot.hasData) {
          final jobs = snapshot.data;
          final children = jobs.map((job) => Text(job.name)).toList();
          return ListView(children: children);
        }
        if (snapshot.hasError) {
          return Center(child: Text('Some error occured'));
        }
        return Center(child:CircularProgressIndicator());
<<<<<<< HEAD
>>>>>>> parent of 91fac26... updates
=======
>>>>>>> parent of 91fac26... updates
      },
    );
  }
}
