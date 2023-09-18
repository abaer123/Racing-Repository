- add a few more functions, set up for the math to just add more vulns
- add a fuzz example, can take from what we have
- add the sql injection part
- maybe need a docker file?
- need to fix table at some point

might need to move the docker file back out

Notes

Run bundle lock --add-platform x86_64-linux when build breaks

by default bundle exec rackup is ran for ruby applications


To view database:

sqlite3 leaderboard.db
select * from leaderboard;