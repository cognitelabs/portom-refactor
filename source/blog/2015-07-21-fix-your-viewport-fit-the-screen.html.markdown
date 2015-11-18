---
title: Fix Your Viewport, Fit the Screen
date: 2015-07-21
---

<article itemscope itemtype="http://schema.org/Blog"> 
<div class="container outside"> 
 <div class="featured-post" style="background-image: url(&quot;//cdn2.hubspot.net/hubfs/440551/mobile_viewport.jpg?t=1441046336424&quot;);"> 
  <div class="overlay"></div> 
  <div class="row-fluid"> 
   <span class="latest-post"> Latest from <span id="title" itemprop="name">the CogBlog</span> </span> 
  </div> 
  <header class="featured-header"> 
   <div class="row-fluid"> 
    <div class="span2"></div> 
    <div class="span8"> 
     <div class="row-fluid"> 
      <div class="span12 author">
        by 
       <span class="author-name" itemprop="author"><a class="author-link" href="http://www.cognitelabs.com/blog/author/jennifer-kruger" itemprop="url"></a> <span itemprop="name">Jennifer Kruger</span></span> on 
       <span class="publish-date" itemprop="datePublished"> July 21</span> 
      </div> 
     </div> 
     <hgroup class="row-fluid"> 
      <h1 class="latest-title" itemprop="headline"> <a href="../../../../com/cognitelabs/www/blog/fix-your-viewport-fit-the-screen.html" itemprop="url"> <span id="hs_cos_wrapper_name" class="hs_cos_wrapper hs_cos_wrapper_meta_field hs_cos_wrapper_type_text" style="" data-hs-cos-general-type="meta_field" data-hs-cos-type="text">Fix Your Viewport, Fit the Screen</span> </a> </h1> 
      <h2 class="post-synopsis" itemprop="alternativeHeadline"> <span id="hs_cos_wrapper_post_synopsis" class="hs_cos_wrapper hs_cos_wrapper_widget hs_cos_wrapper_type_text" style="" data-hs-cos-general-type="widget" data-hs-cos-type="text">If your site doesn't fit the viewport, fix the fit</span> </h2> 
     </hgroup> 
     <div class="row-fluid"> 
      <span class="tags" itemprop="keywords"> </span> 
     </div> 
    </div> 
   </div> 
  </header> 
 </div> 
</div> 
<section class="blog-section" itemscope itemtype="http://schema.org/Blog"> 
 <div class="blog-post-wrapper cell-wrapper"> 
  <header class="section post-header"> 
  </header> 
  <div class="section post-body"> 
   <section itemprop="text"> 
    <span id="hs_cos_wrapper_post_body" class="hs_cos_wrapper hs_cos_wrapper_meta_field hs_cos_wrapper_type_rich_text" style="" data-hs-cos-general-type="meta_field" data-hs-cos-type="rich_text"><p dir="ltr">A properly configured mobile viewport (which controls how a web page is viewed on a mobile device) is critical to making a mobile site accessible and attractive to mobile users. Without one, a mobile website is displayed as the desktop version of that website, scaled to fit the tiny screen of your mobile device. In the absence of a mobile viewport the web page will default to preset scaling and width settings and viewing it will require much pinching, zooming and scrolling. For viewports that aren?t configured, the default width ranges from 800 to 1024 pixels, and is scaled so that everything fits one screen (<a href="https://developers.google.com/speed/docs/insights/ConfigureViewport">source</a>).</p> 
     <!--more--> <p dir="ltr"><span> </span><span><span class="Apple-tab-span"> </span></span><span>This also affects content, and content that is too small to accurately read or click on prevents the user from performing tasks easily, leading to a frustrating mobile experience. </span></p> <h3 dir="ltr"><span>Fix the Fit</span></h3> <p dir="ltr"><span>However, on a configured mobile viewport, both the content and the width are modified to fit on mobile devices. This makes the page easier to read and perform actions on.</span></p> <p dir="ltr"><span>So, how the heck do you configure a mobile viewport? &nbsp;The answer to that is surprisingly simple. To configure a viewport, modify the viewport meta tag. The meta tag is a relatively simple piece of code responsible for the way a mobile page is sized and scaled (</span><a href="http://www.w3schools.com/css/css_rwd_viewport.asp"><span>source</span></a><span>).</span></p> <p dir="ltr"><span>A standard meta tag looks something like this:</span></p> <p dir="ltr"><span>&lt;meta name="viewport" content="width=device-width, initial-scale=1"&gt;</span></p> <p dir="ltr"><span>The ?width? component delegates the width of the viewport, and can be done in a few different ways. For example, you can set the width to a specific amount of pixels, or can set the width to take on the default width of the device the page is being displayed on. The ?initial scale? component is responsible for determining the scale of the website, that is, how zoomed in or out the website appears on a mobile device.</span></p> <h3 dir="ltr"><span>Google Says?</span></h3> <p dir="ltr"><span>When combined, Google recommends specifying width as ?device width?, and keeping the ?initial scale? around 1. These two components are the basic, and minimum properties as recommended by Google. But, there are&nbsp;</span><a href="https://css-tricks.com/snippets/html/responsive-meta-tag/"><span>quite a few additional attributes</span></a><span> that can be used to customize the viewport.</span></p> <p dir="ltr"><span>However the viewport is configured, it needs to be easy to read and accessible across mobile devices, both in portrait and landscape layouts. It's also smart to use caution with certain additions to the metatag, including ?minimum/maximum scale?, and ?user-scalable?. These can limit accessibility if tagged incorrectly (</span><a href="https://www.feedthebot.com/mobile/configure-viewport.html"><span>source</span></a><span>).</span></p> <p dir="ltr"><span>The simple viewport metatag and </span><a href="https://developers.google.com/speed/docs/insights/ConfigureViewport"><span>recommendations by Google Developers</span></a><span> are great places to start, and are wonderful platforms from which to build. </span></p></span> 
   </section> 
   <span id="hs_cos_wrapper_blog_social_sharing" class="hs_cos_wrapper hs_cos_wrapper_widget hs_cos_wrapper_type_blog_social_sharing" style="" data-hs-cos-general-type="widget" data-hs-cos-type="blog_social_sharing"> 
    <div class="hs-blog-social-share"> 
     <ul class="hs-blog-social-share-list"> 
     </ul> 
    </div> </span> 
   <div id="author-bio" itemscope itemtype="http://schema.org/Person"> 
    <img width="80" height="80" class="avatar avatar-80 photo" src="http://cdn2.hubspot.net/hub/440551/hubfs/photo_9-584156-edited.jpg?t=1441046336424&amp;width=80&amp;height=80" alt="Jennifer Kruger"> 
    <div id="author-info"> 
     <h3>About <span itemprop="givenName">Jennifer Kruger<span></span></span></h3> Jennifer is an inbound specialist at Cognite Labs. 
    </div> 
    <div class="clear"></div> 
   </div> 
  </div> 
 </div> 
</section> 
</article>