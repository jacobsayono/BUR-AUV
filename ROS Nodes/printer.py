#!/usr/bin/env python

import rospy
from std_msgs.msg import String

# we cannot just set a "message variable". ROS likes to handle it by calling a function to deal with the message
def fax_handler(data): # data is of type String
    rospy.loginfo(data.data) # basically print(String.data) but can write into a file if we don't have a terminal

def printer():
    rospy.init_node('printer', anonymous = True) # we have a node
    rospy.Subscriber('fax_line', String, fax_handler)
    rospy.spin() # keeps program alive, stay faithful to its subcribed topic. keeps the subscriptions going but not let program waste CPU space

if __name__ == "__main__":
    printer()
