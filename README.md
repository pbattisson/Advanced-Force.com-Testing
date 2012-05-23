Advanced-Force.com-Testing
==========================

0. About This Project
---------------------

This project contains the code related to the talk I gave at Cloudstock 2012 on Advanced Testing Techniques on Force.com the slides for which are on speakerdeck https://speakerdeck.com/u/pbattisson/p/advanced-testing-techniques-on-forcecom-cloudstock-london-2012

The project contains two objects, Truck and Package which we will be working with. The aim is to write some code that will allow us to assign from a list of Packages to a Truck until it is at least 90% full. The project presents two ways of doing it, one with mock objects and one without using mock objects in order to show the relatively similarities as well as the testing differences between them.

1. How Should I Use The Project
-------------------------------

Short answer, however you want, I am giving all the code away for free (although if you use it to make a massive money earning app then a beer in thanks wouldn't go amiss!)

The code is presenting an (albeit contrived) example of how you can use mocking and mock assertions to make your code a little more flexible and testable. If it were me, I would recommend you put it into an org and then try adding some triggers and validation rules, and extending it. Then I think you will see the flexibility come into it's own.

2. MockAssertionManager.cls
---------------------------

This class is a very useful one I have found and could be resued in multiple projects. I have tidied it up as best as possible for this project but it might be something you would choose to extract from it all.

3. Is This Code Representative of Your Normal Code?
---------------------------------------------------

Yes and no. I try to conform to best practices but spend a fairchunk of my time prodding and poking into new things so sometimes it starts to look less nice. In any product/production code I try to use as much of this as is possible.

4. Is This Code Perfect?
------------------------

No. If you have improvements, please fork and send me a pull request so we can make it even better.

5. Can I Contribute To This?
----------------------------

Yes. See 4 above.

6. Any More Resources You Would Recommend?
------------------------------------------

Yes. A page dedicated to these will be appearing soon.
