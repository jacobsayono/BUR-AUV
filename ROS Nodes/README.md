catkin_make					                            make folder into a workspace. also later to make sure everything is compiled
source devel/setup.bash				                  sourcing your workspace. this updates your enviroment variables so ROS understands what you're working on
chmod +x src/turtlebot_tut/scripts/faxer.py	    python files created on linux are not runnable by default. this command tells linux that these are runnable files.
chmod +x src/turtlebot_tut/scripts/printer.py 	to make a program executable and find them. chmod = change permissions. +x = make it executable. then find path to faxer and printer

roscore						                              tells ROS as a whole to start running
rosrun turtlebot_tut faxer.py
rosrun turtlebot_tut printer.py

- two complete separate programs are talking to one another through the magic of ROS!
- not too complicated; most difficult part was getting the workspace set up
- writing the programs is just like any other python program except with a little bit of extra spice