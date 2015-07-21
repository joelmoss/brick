# Build + Deploy Improvements

## Benefits

The following changes result in the following benefits:

  - Faster deploys
    Builds take place only when pushing, so deploy action requires no build at all. And Artifacts
    are often downloaded to the servers before deploy action is called.
  - More responsive builds
    Because builds take place on our servers, we can start them immediately without waiting for the
    likes of Wercker reach the job in their queue.
  - Web based UI
    Will provide an easy to build UI that can be used to deploy and check status of builds and
    deploys, along with who and when.


## Process

An artifact is created from the build and uploaded to S3, named after the branch and Git ref
(eg. "master-15eg13af").

    Buildkite is used to build, create and upload the artifact on each push.

When deploying, we fetch the current ref of the branch we want to deploy, then match that to its
artifact. If the artifact does not exist, deploy should fail. Otherwise, we upload this artifact to
each server we want to deploy to, and unpack it to its timestamped release directory.

    ** How to handle the deploy commands? **
    An internal build/deploy API that can store and manage the build and deploy lifecycle. This API
    can then be used by a CLI, GUI and Flowdock. And indeed anything else.

    ** How to download the artifact to each release server? **
    Pull the artifact, instead of pushing it using Consul. Or use Chef push jobs, but this must be
    triggered manually, whereas using Consul can be automated with watches.

Once all servers have the artifact in place, the "current" symlink is recreated and linked to the
new release.

