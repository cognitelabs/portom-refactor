---
title: A 5 Step Process for Predictive Modeling
date: 2013-07-10
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
       <span class="author-name" itemprop="author"><a class="author-link" href="http://www.cognitelabs.com/blog/author/jesse-flores" itemprop="url"></a> <span itemprop="name">Jesse Flores</span></span> on 
       <span class="publish-date" itemprop="datePublished"> July 10</span> 
      </div> 
     </div> 
     <hgroup class="row-fluid"> 
      <h1 class="latest-title" itemprop="headline"> <a href="../../../../com/cognitelabs/www/blog/a-5-step-process-for-predictive-modeling.html" itemprop="url"> <span id="hs_cos_wrapper_name" class="hs_cos_wrapper hs_cos_wrapper_meta_field hs_cos_wrapper_type_text" style="" data-hs-cos-general-type="meta_field" data-hs-cos-type="text">A 5 Step Process for Predictive Modeling</span> </a> </h1> 
      <h2 class="post-synopsis" itemprop="alternativeHeadline"> <span id="hs_cos_wrapper_post_synopsis" class="hs_cos_wrapper hs_cos_wrapper_widget hs_cos_wrapper_type_text" style="" data-hs-cos-general-type="widget" data-hs-cos-type="text"></span> </h2> 
     </hgroup> 
     <div class="row-fluid"> 
      <span class="tags" itemprop="keywords"> <a href="http://www.cognitelabs.com/blog/topic/data-science" class="topic-tag">Data Science</a> <a href="http://www.cognitelabs.com/blog/topic/big-data" class="topic-tag">Big Data</a> <a href="http://www.cognitelabs.com/blog/topic/analytics" class="topic-tag">Analytics</a> <a href="http://www.cognitelabs.com/blog/topic/modeling" class="topic-tag">Modeling</a> <a href="http://www.cognitelabs.com/blog/topic/data" class="topic-tag">Data</a> </span> 
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
    <span id="hs_cos_wrapper_post_body" class="hs_cos_wrapper hs_cos_wrapper_meta_field hs_cos_wrapper_type_rich_text" style="" data-hs-cos-general-type="meta_field" data-hs-cos-type="rich_text"><p>Despite it's name, "Data Science", is only part science. It's also an art. In order to build quality predictive models, it is important to have an organized approach. While there are always exceptions, this approach can help us make good models, faster.
      <!--more--> In short, the process is:</p> 
     <ol> 
      <li><a href="../../../../com/cognitelabs/www/index.html">Retrieve and Organize the Data</a></li> 
      <li><a href="../../../../com/cognitelabs/www/index.html">Understand the Data</a></li> 
      <li><a href="../../../../com/cognitelabs/www/index.html">Split the Data and Build a Model</a></li> 
      <li><a href="../../../../com/cognitelabs/www/index.html">Evaluate the Model's Performance</a></li> 
      <li><a href="../../../../com/cognitelabs/www/index.html">Iterate and Choose a Model</a></li> 
     </ol> <h3><a name="step1"></a>Retrieve and Organize the Data</h3> <p>It likely goes without saying that before one can analyze data, one must have data to analyze. Today, data comes in many forms, including:</p> 
     <ul> 
      <li>Relational Databases</li> 
      <li>NoSQL Databases</li> 
      <li>Distributed File Systems</li> 
      <li>JSON Files</li> 
      <li>Text Files</li> 
      <li>Logs</li> 
      <li>etc.</li> 
     </ul> <p>Depending on how the data is stored - and the scope of the project - various tools such as queries, mapreduce algorithms, or custom scripts may be used to organize the data into a form from which it can be analyzed. Particularly when this step requires a script or a query to create a population or access a sample, knowing how the data was gathered and organized makes it easier to understand the data.</p> <h3><a name="step2"></a>Understand the Data</h3> <p>Once you have data, it's tempting to fire up R and get started building a model. This is a mistake. Taking time to understand the data can save headaches down the road when models start "acting funny." It's then that you realize missing values in a particular subset of the population are messing things up. And that's never pleasant.</p> <p>Instead, it's important to 'get a sense' for the data. This includes understanding the characteristics of the predictors (a.k.a., "features"), as well as the relationship(s) that might exist between them. For instance, it's important to consider:</p> 
     <ul> 
      <li>The type of data the predictor represents (Nominal, Ordinal, Quantitative)</li> 
      <li>Whether there are missing or invalid values or outliers</li> 
      <li>How the predictor's values are distributed</li> 
      <li>The units of the predictors</li> 
     </ul> <p> Understanding these aspects of our data allows us to catch mistakes, plan for aberrations, and choose a base model more quickly, allowing us to move forward, faster. </p> <h3><a name="step3"></a>Split the Data and Build a Model</h3> <p>The ultimate point of building a model is to predict some outcome, <strong>y </strong>given some set of features, <strong>X </strong>(where <strong>y</strong> is a vector of outcomes and <strong>X</strong> is a matrix of predictors). Of course, it's impossible to create a model without having some data to determine which features might be valuable and which outcomes are even possible. And using the data at our disposal, we can work really hard and make a model that perfectly fits our data set.</p> <p>But will it generalize and be able to predict new data?</p> <p>Splitting data into training and test sets allow us to use the data to build (train) a model and verify that it generalizes (by testing it). The first stab at this should be relatively quick. It is unlikely we'll get the model precisely right on our first attempt. Instead, we take an agile approach to developing a model. We build something quickly, test it, and evaluate it. Then, we tweak and repeat.</p> <h3><a name="step4"></a>Evaluate the Model's Performance</h3> <p>There are many techniques for evaluating the performance of a model. The techniques vary as well according to the type of model (regression, classification) and the problem domain. In general, though, we're looking to see how accurate the model is at predicting the desired outcome. Concretely, we're looking for 'goodness of fit' and indications of bias or variance in the model.</p> <h3><a name="step5"></a>Iterate and Choose a Model</h3> <p>Evaluating the performance of a model will often give us a good sense of where to go next. Do we need more data? Do we just need to tweak the model we're working on? Or is an entirely different model necessary?</p> <p>After each attempt at building a model, we want to keep track of how well it performs. It may also be desirable to try a few different models to see if one has a better chance of predicting outcomes than other candidate models do. Ultimately, we choose the model that best predicts the intended outcome.</p> <p>Finally, it's worth noting that models don't go on 'autopilot.' They likely require some vigilance and tweaking, particularly as new data is recorded and tracked. Things change and so it's unreasonable to assume that our models are set forever in stone. Still, following this process should help to ensure that we build reasonably effective, reasonably durable, and reasonably scalable predictive models.</p></span> 
   </section> 
   <span id="hs_cos_wrapper_blog_social_sharing" class="hs_cos_wrapper hs_cos_wrapper_widget hs_cos_wrapper_type_blog_social_sharing" style="" data-hs-cos-general-type="widget" data-hs-cos-type="blog_social_sharing"> 
    <div class="hs-blog-social-share"> 
     <ul class="hs-blog-social-share-list"> 
     </ul> 
    </div> </span> 
   <div id="author-bio" itemscope itemtype="http://schema.org/Person"> 
    <img width="80" height="80" class="avatar avatar-80 photo" src="https://app.hubspot.com/settings/avatar/ebb7b39b3263657e1a24516cf221203e" alt="Jesse Flores"> 
    <div id="author-info"> 
     <h3>About <span itemprop="givenName">Jesse Flores<span></span></span></h3> Jesse is the business guy and PM for Cognite Labs. He loves technology, reading, and learning; his curiosity is insatiable. You can follow his musings on the business of startups at 
     <a href="http://startuplansing.org">StartupLansing</a> and his more random musings 
     <a href="http://www.twitter.com/jflores1c">@jflores1c</a> 
    </div> 
    <div class="clear"></div> 
   </div> 
  </div> 
 </div> 
</section> 
</article>