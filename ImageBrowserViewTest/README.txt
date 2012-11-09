This project file demonstrates the issues encountered when an IKImageBrowserView becomes layer-backed. Note that the IKImageBrowserView work just fine if it is not layer-backed.

The symptoms differ depending on the Mac OS used that the project is run in.

Mac OS 10.6 - the hover overlay and custom selection layer stop working after you do a tab-switch then return back to the tab the IKImageBrowserView is in

Mac OS 10.7 - the selection layer and the foreground layer (i.e. overlay) of the image browser cell stop moving with the image in the "bounce" region of the enclosing scroll view

Mac OS 10.8 - the selection layer and the foreground layer of the image browser cell don't work properly at all.