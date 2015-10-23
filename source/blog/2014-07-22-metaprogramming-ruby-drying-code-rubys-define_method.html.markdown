---
title: "Metaprogramming Ruby: DRYing up Code with Ruby's define_method"
date: 2014-07-22
---

<article itemscope itemtype="http://schema.org/Blog"> 
<div class="container outside"> 
 <div class="featured-post" style="background-image: url(&quot;&quot;);"> 
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
       <span class="author-name" itemprop="author"><a class="author-link" href="http://www.cognitelabs.com/blog/author/marjan" itemprop="url"></a> <span itemprop="name">Marjan</span></span> on 
       <span class="publish-date" itemprop="datePublished"> July 22</span> 
      </div> 
     </div> 
     <hgroup class="row-fluid"> 
      <h1 class="latest-title" itemprop="headline"> <a href="../../../../com/cognitelabs/www/blog/metaprogramming-ruby-drying-code-rubys-define_method.html" itemprop="url"> <span id="hs_cos_wrapper_name" class="hs_cos_wrapper hs_cos_wrapper_meta_field hs_cos_wrapper_type_text" style="" data-hs-cos-general-type="meta_field" data-hs-cos-type="text">Metaprogramming Ruby: DRYing up Code with Ruby's define_method</span> </a> </h1> 
      <h2 class="post-synopsis" itemprop="alternativeHeadline"> <span id="hs_cos_wrapper_post_synopsis" class="hs_cos_wrapper hs_cos_wrapper_widget hs_cos_wrapper_type_text" style="" data-hs-cos-general-type="widget" data-hs-cos-type="text"></span> </h2> 
     </hgroup> 
     <div class="row-fluid"> 
      <span class="tags" itemprop="keywords"> <a href="http://www.cognitelabs.com/blog/topic/development" class="topic-tag">Development</a> </span> 
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
    <span id="hs_cos_wrapper_post_body" class="hs_cos_wrapper hs_cos_wrapper_meta_field hs_cos_wrapper_type_rich_text" style="" data-hs-cos-general-type="meta_field" data-hs-cos-type="rich_text"><p>One thing that makes Ruby a powerful language is its metaprogramming features, which allow developers to write elegant, DRY code. While metaprogramming is a big topic (there have literally been <a href="http://www.amazon.com/Metaprogramming-Ruby-Program-Like-Pros-ebook/dp/B00A376YAK">books written about it</a>), we want to focus on two metaprogramming concepts: define_method and method_missing.
      <!--more--></p> <p>To demonstrate these features, we'll review one of the <a href="http://www.codewars.com/about">katas</a> we completed recently (our team does these weekly) and how we used metaprogramming concepts to do so.</p> <h2>The Problem</h2> <p>The kata we were solving was called <a href="http://www.codewars.com/kata/52a1feca5ec9c508d10006f8">Fluent Calculator</a>. The problem statement is as follows:</p> 
     <blockquote> 
      <p>The goal is to implement a simple calculator which uses fluent syntax:<br> Calc.new.one.plus.two # Should return 3<br> Calc.new.five.minus.six # Should return -1<br> Calc.new.seven.times.two # Should return 14<br> Calc.new.nine.divided_by.three # Should return 3<br> There are only four operations that are supported (plus, minus, times, divided_by) and 10 digits (zero, one, two, three, four, five, six, seven, eight, nine).</p> 
      <p>Each calculation consists of one operation only.</p> 
     </blockquote> <p>There are several things that need to be implemented here in order to enable the above functionality:</p> 
     <ul> 
      <li>responding to digits and operator calls - the Calc object must be able to respond to all 10 digit and 4 operation calls</li> 
      <li>method chaining - we need to be able to chain method on the Calc object</li> 
      <li>return the final value of the calculation after the second operand is called</li> 
     </ul> <h2>First Solution: No Metaprogramming</h2> <p>The most straight-forward and primitive solution that doesn't use any of Ruby's metaprogramming features is to define all of the methods in the class by hard-coding them. We define three attributes which will hold the current state of the calculation:</p> 
     <ul> 
      <li>@first - the first operand</li> 
      <li>@second - the second operand</li> 
      <li>@operator - the operator</li> 
     </ul> <p>Calling any of the methods assigns these values. Once all the values have been set, the calculation is executed and the result is returned.</p> <p>Depending on the presence and values of these attributes, the digits methods can behave in two different ways:</p> 
     <ol> 
      <li>@operator is nil - this means that this is the first time a digit method is called, so the @first attribute is set to the corresponding value of the digit method called, and <code>self</code> is returned. Returning <code>self</code> returns the object, allowing us to chain other methods on it.</li> 
      <li>@operator is not nil - this means that this is the second time a digit method is called, so the @second attribute is set to the corresponding value of the digit method. Since this is the last method called for the calculation, the calculation is executed by calling the operate method and the value is returned.</li> 
     </ol> <p> <script src="https://gist.github.com/jflores1/c59d1027f6f3d59126db.js" type="text/javascript"></script> While this first approach - which does not use any of Ruby's metaprogramming features - gets the job done, it's looong, almost 140 lines of code. Additionally, there is a lot of repetitive and/or similar code, which will be difficult to maintain over time. Each of the 10 digit methods practically does the same thing, only with different values.</p> <p>There has to be a better way.</p> <h3>Metaprogramming Approach One: method_missing</h3> <p>One way to DRY this up is to implement <code>method_missing</code>. Generally, when a method is called on a Ruby object, the object executes the first method on the method lookup path that matches the name of the method called.</p> <p>If such method is not found, a <code>NoMethodError</code> is raised, unless the object implements a method called method_missing. It is invoked whenever the object is sent a message it can't handle.</p> <p>method_missing accepts two arguments: the name of the method called, and the arguments passed to that call. We can use this to implement our class logic based on the name of the method that was called.</p> <p>&nbsp;</p> <h2>Metaprogramming Approach Two: define_method</h2> <p>While using <code>method_missing</code> helps to DRY up our code, it short circuits the <code>NoMethodError</code> error response. This can be problematic when we find ourselves trying to implement a non-existent method elsewhere in the code and aren't getting the expected response.</p> <p>To get around the lack of error handling, but still employ metaprogramming, we can use Ruby's define_method feature to define the digits methods during runtime. <code>define_method</code> lets you define methods using a method rather than using <code>def</code>. This comes in handy in cases where we have many methods with similar bodies, like in our case above.</p> <p>First we define a DIGITS array with the names of the digits methods that we want to define. Then, we iterate over that array and for each digit we call define_method, passing it the name of the digit and a block with the body of the method. Doing this, we are able to compress all of the digit methods into one block.</p> <p> <script src="https://gist.github.com/jflores1/0a5f15da34d1960e9301.js" type="text/javascript"></script> We can then use <code>define_method</code> with the Operator methods:</p> <p> <script src="https://gist.github.com/jflores1/6692780e7ea2ccf90a1f.js" type="text/javascript"></script> With this final implementation, we have less than 40 lines of code, it's fairly readable, doesn't short-change Ruby's default error-handling and, most importantly, gets the job done.</p></span> 
   </section> 
   <span id="hs_cos_wrapper_blog_social_sharing" class="hs_cos_wrapper hs_cos_wrapper_widget hs_cos_wrapper_type_blog_social_sharing" style="" data-hs-cos-general-type="widget" data-hs-cos-type="blog_social_sharing"> 
    <div class="hs-blog-social-share"> 
     <ul class="hs-blog-social-share-list"> 
     </ul> 
    </div> </span> 
   <div id="author-bio" itemscope itemtype="http://schema.org/Person"> 
    <img width="80" height="80" class="avatar avatar-80 photo" src="" alt="Marjan"> 
    <div id="author-info"> 
     <h3>About <span itemprop="givenName">Marjan<span></span></span></h3> Marjan is the technical guru behind Cognite Labs. He love Ruby, Rails, AngularJS, D3, and prototyping cool, new stuff. Follow his musings on Twitter: 
     <a href="http://twitter.com/marjan">@marjan</a> 
    </div> 
    <div class="clear"></div> 
   </div> 
  </div> 
 </div> 
</section> 
</article>