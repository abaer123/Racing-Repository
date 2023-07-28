- we need to make sure it deploys, currently does not deploy
- fix the db entries
do we dockerize it?
- add a test so we dont have to disable the job
- add a few more functions, set up for the math to just add more vulns
- add a fuzz example, can take from what we have
- add the sql injection part
- maybe need a docker file?

Notes

Run bundle lock --add-platform x86_64-linux when build breaks

by default bundle exec rackup is ran for ruby applications