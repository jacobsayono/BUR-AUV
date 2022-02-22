**catkin_make**<br>
make folder into a workspace. also later to make sure everything is compiled<br>
<br>
**source devel/setup.bash**<br>
sourcing your workspace. this updates your enviroment variables so ROS understands what you're working on<br>
<br>
**chmod +x src/turtlebot_tut/scripts/faxer.py**<br>
python files created on linux are not runnable by default. this command tells linux that these are runnable files<br>
<br>
**chmod +x src/turtlebot_tut/scripts/printer.py**<br>
make a program executable and find them. chmod = change permissions. +x = make it executable. then find path to faxer and printer<br>
<br>
<br>
**roscore**<br>
tells ROS as a whole to start running<br>
<br>
**rosrun turtlebot_tut faxer.py**<br>
runs faxer.py<br>
<br>
**rosrun turtlebot_tut printer.py**<br>
runs printer.py<br>
<br>
<br>
**thoughts:**
- two complete separate programs are talking to one another through the magic of ROS!
- not too complicated; most difficult part was getting the workspace set up
- writing the programs is just like any other python program except with a little bit of extra spice
