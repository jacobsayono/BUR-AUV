#!/usr/bin/env python

import rospy # .init_node   .Publisher  .Rate
from std_msgs.msg import String

def faxer():
    rospy.init_node('faxer', anonymous = True) # initialize node to let ROS know faxer is a node. anonymous means you can spawn as many of them and there won't be conflict
    pub = rospy.Publisher('fax_line', String, queue_size=10) # create a topic: 'fax line', message type, how many messages we will store before something reads them
    rate = rospy.Rate(10) # how many Hz we want ROS to limit

    while not rospy.is_shutdown(): # keep running until ROS tells you to shutdown
        message = "hello BUR!"
        #message = input("Enter your message: ")
        pub.publish(message)
        rate.sleep() # now loop is running at 10 Hz

if __name__ == "__main__":
    try:
        faxer()
    except rospy.ROSInterruptException:
        pass # put faxer() into a try catch block so if anything goes wrong it is easy for ROS to figure out why it went wrong
